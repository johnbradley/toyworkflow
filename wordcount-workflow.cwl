cwlVersion: v1.0
class: Workflow

inputs:
  somefile: File

outputs:
  output:
    type: File
    outputSource: wc/output

steps:
  wc:
    run: wordcount.cwl
    in:
      somefile: somefile
    out: [output]
