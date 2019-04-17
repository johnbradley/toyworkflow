{
    "$graph": [
        {
            "class": "Workflow",
            "doc": "word count",
            "inputs": [
                {
                    "type": "File",
                    "id": "#main/somefile"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#main/wc/output",
                    "id": "#main/output"
                }
            ],
            "steps": [
                {
                    "run": "#wordcount.cwl",
                    "in": [
                        {
                            "source": "#main/somefile",
                            "id": "#main/wc/somefile"
                        }
                    ],
                    "out": [
                        "#main/wc/output"
                    ],
                    "id": "#main/wc"
                }
            ],
            "id": "#main"
        },
        {
            "class": "CommandLineTool",
            "baseCommand": "wc",
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "stdout": "output.txt",
            "label": "wc pairs of files",
            "doc": "wc pairs",
            "inputs": [
                {
                    "type": "File",
                    "id": "#wordcount.cwl/somefile"
                }
            ],
            "arguments": [
                {
                    "valueFrom": "$(inputs.somefile.path)"
                }
            ],
            "outputs": [
                {
                    "type": "stdout",
                    "id": "#wordcount.cwl/output"
                }
            ],
            "id": "#wordcount.cwl"
        }
    ],
    "cwlVersion": "v1.0"
}