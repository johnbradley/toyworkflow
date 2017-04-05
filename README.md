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

This uses the yml file as configuration:
```
dds_agent_key: <your DukeDS agent key>
dds_user_key: <your DukeDS user key>
projectName: <name of DukeDS project>
input_files: [<a file in the project>, <another file in the project>]
output_file: <name of the output file to upload into the project>
``

