cwlVersion: v1.0
class: Workflow
doc: word count
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
