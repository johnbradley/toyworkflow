{
    "cwlVersion": "v1.0", 
    "$graph": [
        {
            "inputs": [
                {
                    "type": "File", 
                    "id": "#main/input_fastq_file"
                }, 
                {
                    "type": "string", 
                    "id": "#main/output_qc_report_filename"
                }
            ], 
            "requirements": [
                {
                    "class": "StepInputExpressionRequirement"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "outputs": [
                {
                    "outputSource": "#main/rename/outfile", 
                    "type": "File", 
                    "id": "#main/output_qc_report"
                }
            ], 
            "id": "#main", 
            "steps": [
                {
                    "out": [
                        "#main/fastqc/output_qc_report_file"
                    ], 
                    "run": "#fastqc.cwl", 
                    "id": "#main/fastqc", 
                    "in": [
                        {
                            "source": "#main/input_fastq_file", 
                            "id": "#main/fastqc/input_fastq_file"
                        }
                    ]
                }, 
                {
                    "out": [
                        "#main/rename/outfile"
                    ], 
                    "run": "#rename.cwl", 
                    "id": "#main/rename", 
                    "in": [
                        {
                            "source": "#main/output_qc_report_filename", 
                            "id": "#main/rename/newname"
                        }, 
                        {
                            "source": "#main/fastqc/output_qc_report_file", 
                            "id": "#main/rename/srcfile"
                        }
                    ]
                }
            ], 
            "class": "Workflow"
        }, 
        {
            "inputs": [
                {
                    "default": "fastq", 
                    "inputBinding": {
                        "position": 3, 
                        "prefix": "--format"
                    }, 
                    "type": "string", 
                    "id": "#fastqc.cwl/format"
                }, 
                {
                    "inputBinding": {
                        "position": 4
                    }, 
                    "type": "File", 
                    "id": "#fastqc.cwl/input_fastq_file"
                }, 
                {
                    "default": true, 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--noextract"
                    }, 
                    "type": "boolean", 
                    "id": "#fastqc.cwl/noextract"
                }, 
                {
                    "default": 1, 
                    "inputBinding": {
                        "position": 5, 
                        "prefix": "--threads"
                    }, 
                    "type": "int", 
                    "id": "#fastqc.cwl/threads"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "outputs": [
                {
                    "outputBinding": {
                        "glob": "$(inputs.input_fastq_file.path.replace(/^.*[\\\\\\/]/, \"\").replace(/\\.[^/.]+$/, '') + \"_fastqc.zip\")"
                    }, 
                    "type": "File", 
                    "id": "#fastqc.cwl/output_qc_report_file"
                }
            ], 
            "baseCommand": "fastqc", 
            "class": "CommandLineTool", 
            "arguments": [
                {
                    "position": 5, 
                    "valueFrom": "$('/tmp')", 
                    "prefix": "--dir"
                }, 
                {
                    "position": 5, 
                    "valueFrom": "$(runtime.outdir)", 
                    "prefix": "-o"
                }
            ], 
            "id": "#fastqc.cwl", 
            "hints": [
                {
                    "dockerPull": "dukegcb/fastqc", 
                    "class": "DockerRequirement"
                }
            ]
        }, 
        {
            "inputs": [
                {
                    "type": "string", 
                    "id": "#rename.cwl/newname"
                }, 
                {
                    "type": "File", 
                    "id": "#rename.cwl/srcfile"
                }
            ], 
            "requirements": [
                {
                    "class": "InitialWorkDirRequirement", 
                    "listing": [
                        {
                            "entry": "$(inputs.srcfile)", 
                            "entryname": "$(inputs.newname)"
                        }
                    ]
                }
            ], 
            "outputs": [
                {
                    "outputBinding": {
                        "glob": "$(inputs.newname)"
                    }, 
                    "type": "File", 
                    "id": "#rename.cwl/outfile"
                }
            ], 
            "baseCommand": "true", 
            "class": "CommandLineTool", 
            "id": "#rename.cwl"
        }
    ]
}