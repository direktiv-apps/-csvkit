
# csvkit 1.0

CSVKit to covert from and to CSV

---
- #### Categories: misc, docs
- #### Image: gcr.io/direktiv/functions/csvkit 
- #### License: [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0)
- #### Issue Tracking: https://github.com/direktiv-apps/csvkit/issues
- #### URL: https://github.com/direktiv-apps/csvkit
- #### Maintainer: [direktiv.io](https://www.direktiv.io) 
---

## About csvkit

CSVKit is a suite of utilities for converting to and working with CSV. Version 1.0.7 is installed for this function. All available command are installed and can be looked up [here](https://csvkit.readthedocs.io/en/latest/index.html). 
This function can run a list of commands but additionally accepts a `convert` property which can point to a file.  This file will be converted to CSV and stored in Direktiv's instance scope. This file can be accessed via `out/instance/out.csv`.

### Example(s)
  #### Function Configuration
```yaml
functions:
- id: csvkit
  image: gcr.io/direktiv/functions/csvkit:1.0
  type: knative-workflow
```
   #### Basic
```yaml
- id: csvkit
  type: action
  action:
    function: csvkit
    files: 
    - key: data.xlsx
      scope: workflow
    input: 
      convert: data.xlsx
      commands:
      - command: csvjson out/instance/out.csv
```
   #### Advanced
```yaml
- id: csvkit
  type: action
  action:
    function: csvkit
    files: 
    - key: data.xlsx
      scope: workflow
    input: 
      convert: data.xlsx
      commands:
      - command: csvcut -c 1 out/instance/out.csv
```

   ### Secrets


*No secrets required*







### Request



#### Request Attributes
[PostParamsBody](#post-params-body)

### Response
  List of executed commands.
#### Reponse Types
    
  

[PostOKBody](#post-o-k-body)
#### Example Reponses
    
```json
[
  {
    "result": [
      {
        "Header1": "Value1",
        "Header2": "Value2"
      }
    ],
    "success": true
  }
]
```

### Errors
| Type | Description
|------|---------|
| io.direktiv.command.error | Command execution failed |
| io.direktiv.output.error | Template error for output generation of the service |
| io.direktiv.ri.error | Can not create information object from request |


### Types
#### <span id="post-o-k-body"></span> postOKBody

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| csvkit | [][PostOKBodyCsvkitItems](#post-o-k-body-csvkit-items)| `[]*PostOKBodyCsvkitItems` |  | |  |  |


#### <span id="post-o-k-body-csvkit-items"></span> postOKBodyCsvkitItems

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| result | [interface{}](#interface)| `interface{}` | ✓ | |  |  |
| success | boolean| `bool` | ✓ | |  |  |


#### <span id="post-params-body"></span> postParamsBody

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| commands | [][PostParamsBodyCommandsItems](#post-params-body-commands-items)| `[]*PostParamsBodyCommandsItems` |  | `[{"command":"echo Hello"}]`| Array of commands. |  |
| convert | string| `string` |  | | converts incoming file and stores it under instance context. |  |
| files | [][DirektivFile](#direktiv-file)| `[]apps.DirektivFile` |  | | File to create before running commands. |  |


#### <span id="post-params-body-commands-items"></span> postParamsBodyCommandsItems

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| command | string| `string` |  | | Command to run |  |
| continue | boolean| `bool` |  | | Stops excecution if command fails, otherwise proceeds with next command |  |
| print | boolean| `bool` |  | `true`| If set to false the command will not print the full command with arguments to logs. |  |
| silent | boolean| `bool` |  | | If set to false the command will not print output to logs. |  |

 
