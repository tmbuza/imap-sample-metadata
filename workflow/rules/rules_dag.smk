# Get dot rule graphs
rule get_dot_rulegraph:
	output:
		"dags/rulegraph.svg",
		"dags/rulegraph.png",
	shell:
		"bash workflow/scripts/rules_dag.sh"
