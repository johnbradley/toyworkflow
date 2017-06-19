cwlVersion: v1.0
class: CommandLineTool
baseCommand: wc
stdout: output.txt
label: wc pairs of files
doc: wc pairs
inputs:
  read_pairs:
    type: { type: array, items: { type: array, items: File } }
    inputBinding:
      position: 1
outputs:
  output:
    type: stdout
