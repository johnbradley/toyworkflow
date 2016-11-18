cwlVersion: v1.0
class: CommandLineTool
baseCommand: cat
stdout: $(inputs.outputfile)
inputs:
 files:
    type:
      type: array
      items: File
    inputBinding:
      position: 1
outputs:
  outputfile:
    type: stdout
