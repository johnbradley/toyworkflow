{
    "cwlVersion": "v1.0",
    "class": "CommandLineTool", 
    "baseCommand": "wc", 
    "stdout": "output.txt", 
    "label": "wc pairs of files", 
    "doc": "wc pairs", 
    "inputs": [
        {
            "type": {
                "type": "array", 
                "items": {
                    "type": "array", 
                    "items": "File"
                }
            }, 
            "inputBinding": {
                "position": 1
            }, 
            "id": "#main/read_pairs"
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
    "id": "#main"
}
