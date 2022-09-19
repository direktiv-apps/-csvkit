#!/bin/sh

docker build -t csvkit . && docker run -p 9191:8080 csvkit