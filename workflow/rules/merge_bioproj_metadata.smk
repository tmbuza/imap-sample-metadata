# Merged project metadata
rule merge_bioproj_metadata:
    input:
        tidymeta=expand("data/metadata/{bioproject}_tidy_metadata.csv", bioproject=config["bioproject"]),
    output:
        mergedmeta="data/metadata/metadata.csv",
    conda:
        "../envs/environment.yml"
    script:
        "../scripts/merge_proj_metadata.R" 