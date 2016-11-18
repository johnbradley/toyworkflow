# toyworkflow
Toy CWL workflow
* Downloads two files from a duke-data-service repo
* cats them together
* Uploads the resulting file to the same duke-data-service repo

## Setup
Clone this repo and cd into toyworkflow then:
```
pip install -r requirements.txt
```

## Run
```
cwl-runner mycat-workflow.cwl mycat-workflow.yml 
```



