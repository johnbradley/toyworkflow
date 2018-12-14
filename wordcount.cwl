cwlVersion: v1.0
class: CommandLineTool
baseCommand: wc
requirements:
  - class: InlineJavascriptRequirement
stdout: output.txt
label: wc pairs of files
doc: wc pairs
inputs:
  somefile:
    type: File
arguments:
  - valueFrom: $(inputs.somefile.path)
outputs:
  output:
    type: stdout
