rule paired_mapping_files:  
    input:
        metadata="data/metadata.csv"
    output:
        "config/pe_samples.tsv",
        "config/pe_units.tsv",
        "resources/metadata/pe_metadata.tsv",
    conda:
        "../envs/environment.yml"
    script:
        "../scripts/paired_end_mapping_files.R" 


