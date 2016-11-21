cwlVersion: v1.0
class: Workflow
requirements:
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement

inputs:
  dds_agent_key: string
  dds_user_key: string
  projectName: string
  input_file: string
  output_file: string

outputs: []

steps:
  download:
    run: dds_download.cwl
    in:
      dds_agent_key: dds_agent_key
      dds_user_key: dds_user_key
      projectName: projectName
      file: input_file
    out: [output]

  fastqc:
    run: fastqc.cwl
    in:
      input_fastq_file: download/output
    out: [output_qc_report_file]

  upload:
    run: dds_upload.cwl
    in:
      dds_agent_key: dds_agent_key
      dds_user_key: dds_user_key
      projectName: projectName
      file: fastqc/output_qc_report_file
    out: []
