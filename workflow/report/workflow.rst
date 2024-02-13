**Snakemake workflow for downloading and exploring SRA metadata**::

    This workflow  performs the following:
        - Downloads sample metadata from SRA database.
        - Merges metadata from multiple BioProjects 
        - Creates sample mapping files for downstream analyses.
        - Explore read size (graphically) in each project.
        - Pins coordinates of the sampling points.
        - Finally, it deploys a user-generated report to GitHub pages. 