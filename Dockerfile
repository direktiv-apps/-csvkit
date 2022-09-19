FROM golang:1.18.2-alpine as build

WORKDIR /src

COPY build/app/go.mod go.mod
COPY build/app/go.sum go.sum

RUN go mod download

COPY build/app/cmd cmd/
COPY build/app/models models/
COPY build/app/restapi restapi/

ENV CGO_LDFLAGS "-static -w -s"

RUN go build -tags osusergo,netgo -o /application cmd/csvkit-server/main.go; 

FROM ubuntu:22.04

RUN apt-get update && apt-get install ca-certificates -y

# install csvkit
RUN apt-get install python3 python3-pip python3-setuptools build-essential -y
RUN pip install csvkit

# for testing
COPY data.xlsx /tmp
RUN mkdir -p /tmp/out/instance/

# DON'T CHANGE BELOW 
COPY --from=build /application /bin/application

EXPOSE 8080

CMD ["/bin/application", "--port=8080", "--host=0.0.0.0", "--write-timeout=0"]