# Get sample location 
rule plot_sampling_map:
    input:
        metadata="data/metadata.csv",
    output:
        gps=report("images/sample_gps.png", caption="../report/gps.rst", category="Sampling GPS"),
    # conda:
    #     "../envs/environment.yml"
    run:
        "../scripts/leaflet.py",
