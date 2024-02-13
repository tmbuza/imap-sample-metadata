# Get variable barplot
rule plot_var_read_freq:
    input:
        asc="results/read_size_asc.csv",
        desc="results/read_size_desc.csv"
    output:
        png="figures/read_size.png",
        svg=report("figures/read_size.svg", caption="../report/readsize.rst", category="BioProject Read size"),
        varpng="images/PRJNA477349_read_size.png",
        bushmeat=report("images/PRJNA477349_read_size.svg", caption="../report/PRJNA477349.rst", category="Bushmeat TZ"),
        atacama=report("images/PRJNA208226_read_size.svg", caption="../report/PRJNA208226.rst", category="Atacama Soil Chile"),
    conda:
        "../envs/environment.yml"
    script:
        "../scripts/plot_var_freq.R"