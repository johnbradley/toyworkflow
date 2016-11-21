cwlVersion: v1.0
class: CommandLineTool
baseCommand: ddsclient
requirements:
  - class: InitialWorkDirRequirement
    listing:
      - entryname: ddsclient.conf
        entry: |
          agent_key: $(inputs.dds_agent_key)
          user_key: $(inputs.dds_user_key)
  - class: InlineJavascriptRequirement
  - class: EnvVarRequirement
    envDef:
      - envName: PYTHONIOENCODING
        envValue: UTF-8
      - envName: DDSCLIENT_CONF
        envValue: ./ddsclient.conf
arguments:
  - valueFrom: "download"
  - prefix: -p
    valueFrom: $(inputs.projectName)
  - valueFrom: "outdir"
inputs:
 files:
    type:
      type: array
      items: string
      inputBinding:
        prefix: --include
    inputBinding:
      position: 2
 file:
    type: ["null", string]
    inputBinding:
      position: 3
      prefix: --include

outputs:
  output:
    type:
      type: array
      items: File
    outputBinding:
      glob: $(inputs.files.map(function(obj){ return 'outdir/' + obj}))