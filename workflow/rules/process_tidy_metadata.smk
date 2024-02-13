# Process SraRunTable
rule process_tidy_metadata:  
    input:
        metadata=expand("data/{bioproject}_SraRunTable.csv", bioproject=config["bioproject"]),
    output:
        tidymeta=expand("data/{bioproject}_tidy_metadata.csv", bioproject=config["bioproject"]),
    conda:
        "../envs/environment.yml"
    script:
        "../scripts/process_tidy_metadata.R" 