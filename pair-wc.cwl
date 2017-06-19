cwlVersion: v1.0
class: CommandLineTool
baseCommand: wc
stdout: output.txt
inputs:
  read_pairs:
    type: { type: array, items: { type: array, items: File } }
    inputBinding:
      position: 1
outputs:
  output:
    type: stdout
