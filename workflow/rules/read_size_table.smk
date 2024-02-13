# Get read size
rule read_size_table:
    input:
        "data/metadata.csv",
    output:
        asc="results/read_size_asc.csv",
        desc="results/read_size_desc.csv"
    conda:
        "../envs/environment.yml"
    script:
        "../scripts/explore_read_size.R"

