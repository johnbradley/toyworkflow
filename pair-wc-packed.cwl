{
    "class": "CommandLineTool", 
    "baseCommand": "wc", 
    "stdout": "output.txt", 
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