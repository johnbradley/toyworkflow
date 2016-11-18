cwlVersion: v1.0
class: Workflow
requirements:
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement

inputs:
  dds_agent_key: string
  dds_user_key: string
  projectName: string
  input_files:
    type:
      type: array
      items: string
  output_file: string

outputs: []

steps:
  download:
    run: dds_download.cwl
    in:
      dds_agent_key: dds_agent_key
      dds_user_key: dds_user_key
      projectName: projectName
      files: input_files
    out: [output]

  mycat:
    run: mycat.cwl
    in:
      files: download/output
      outputfile: output_file
    out: [outputfile]

  upload:
    run: dds_upload.cwl
    in:
      dds_agent_key: dds_agent_key
      dds_user_key: dds_user_key
      projectName: projectName
      files:
        source: "#mycat/outputfile"
        valueFrom: ${ return [ self]; }
    out: []
