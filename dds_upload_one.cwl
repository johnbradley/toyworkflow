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
  - valueFrom: "upload"
  - prefix: -p
    valueFrom: $(inputs.projectName)
inputs:
 file:
    type: File
    inputBinding:
      position: 2
outputs: []
