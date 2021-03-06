{
    "class": "CommandLineTool", 
    "baseCommand": "wc", 
    "requirements": [
        {
            "class": "InlineJavascriptRequirement"
        },
        {
                    "class": "DockerRequirement",
                    "dockerPull": "bash:4.4"
        }        
    ], 
    "stdout": "output.txt", 
    "label": "wc pairs of files", 
    "doc": "wc pairs", 
    "inputs": [
        {
            "type": "File", 
            "id": "#main/somefile"
        }
    ], 
    "arguments": [
        {
            "valueFrom": "$(inputs.somefile.path)"
        }
    ], 
    "outputs": [
        {
            "type": "File", 
            "id": "#main/output", 
            "outputBinding": {
                "glob": "output.txt"
            }
        }
    ], 
    "id": "#main", 
    "cwlVersion": "v1.0"
}
