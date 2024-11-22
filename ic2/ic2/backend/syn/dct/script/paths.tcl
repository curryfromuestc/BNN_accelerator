#====================================================================================================================================================================================================================================
#I channel data path setup path
report_timing -delay max -sort_by slack -path full -nworst 50   -max_paths 1000  -to [get_ports sel_i[0]]            > $REPORTS_DIR/${TOP}.spath_timing.rpt 
