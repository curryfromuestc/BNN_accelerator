###############################################################################
#clear and reset
###############################################################################
sh date
sh rm -rf mw
sh mkdir mw
remove_design -all
set OUTPUT      outputs
set REPORTS_DIR reports
sh rm -rf ${OUTPUT}
sh mkdir ${OUTPUT}
sh rm -rf ${REPORTS_DIR}
sh mkdir ${REPORTS_DIR}

###############################################################################
# set multi core 1~16
###############################################################################
set_host_options -max_cores 4
###############################################################################
#    Set rules                                                             
###############################################################################
set enable_page_mode false
set enable_recovery_removal_arcs true
set timing_enable_multiple_clocks_per_reg true
set power_perserve_rtl_hier_names true
set bus_naming_style {%s[%d]}
set hdlin_enable_rtldrc_info true

set mw_use_layer_enhancement true
extend_mw_layers
set ignore_tf_error true
###############################################################################
#    source logic and physical libraries                                                           
###############################################################################
source script/dc_lib.tcl

###############################################################################
#    Generate dc milkway & TLU models
###############################################################################
create_mw_lib   -technology ${TECH_FILE} \
                -mw_reference_library ${MW_REFERENCE_LIB_DIRS} \
                ${MW_DESIGN_LIBRARY}

set_tlu_plus_files -max_tluplus  $TLUPLUS_CMAX \
                   -tech2itf_map $TLUPLUS_MAP

open_mw_lib ${MW_DESIGN_LIBRARY}

###############################################################################
#    Set synopsys verification for formality                                                            
###############################################################################
set_svf  $OUTPUT/$TOP.svf

###############################################################################
#    Read Verilog file                                                         
###############################################################################
#generate the HTML log file in dc_shell, before reading in the design
set_app_var html_log_enable true
set_app_var html_log_filename ${TOP}.html


# analyze -format verilog   ${FILE_LIST}
analyze -format verilog  inputs/${TOP}.v

elaborate      ${TOP}
#read_verilog   ${RTL}
current_design ${TOP}
link

###############################################################################
# Set timing debrate
###############################################################################
#set_timing_derate -max -early 0.92
#set_timing_derate -max -late  1.08

###############################################################################
# Set operating conditions
###############################################################################
set_operating_conditions -max $MAX_COND\
                         -max_library $MAX_LIB\
                         -min $MIN_COND\
                         -min_library $MIN_LIB 

###############################################################################
#    Unify                                                                     
###############################################################################
uniquify 

###############################################################################
#    Instance SDC files                                                        
###############################################################################
source inputs/${TOP}.func.sdc
source inputs/io.sdc

###############################################################################
#use verilog naming rules
###############################################################################
change_names -rules verilog -hierarchy

###############################################################################
#Define the working directory    
###############################################################################
define_design_lib worklib -path ~/

#################################################################################
# Create Default Path Groups
#
# Separating these paths can help improve optimization.
# Remove these path group settings if user path groups have already been defined.
#################################################################################
set ports_clock_root [filter_collection [get_attribute [get_clocks] sources] object_class==port]
group_path -name in2out  -weight 2  -from [remove_from_collection [all_inputs] $ports_clock_root] -to [all_outputs]
group_path -name reg2out -weight 3  -from [all_registers -clock_pins] -to [all_outputs]
group_path -name in2reg  -weight 3  -from [remove_from_collection [all_inputs] $ports_clock_root] -to [all_registers -data_pins]
group_path -name reg2reg -weight 5  -from [all_registers -clock_pins] -to [all_registers -data_pins]

##################################################################################
# Apply Physical Design Constraints
#
# Optional: Floorplan information can be read in here if available.
# This is highly recommended for irregular floorplans.
#
# Floorplan constraints can be provided from one of the following sources:
# 	* extract_physical_constraints with a DEF file
#	* read_floorplan with a floorplan file (written by write_floorplan)
#	* User generated Tcl physical constraints
##################################################################################
if { [file exists ${FP_FILE}] } {
    read_floorplan  ${FP_FILE}
}

set_ignored_layers -min_routing_layer M1 \
                   -max_routing_layer M5

###############################################################################
#    Check design                                                              
###############################################################################
check_design > $REPORTS_DIR/chkdesign_$TOP.rpt
check_timing > $REPORTS_DIR/chktiming_$TOP.rpt

###############################################################################
#    Optimization Option                                                       
###############################################################################
set_structure true -boolean true -timing true
set_fix_multiple_port_nets -all -buffer_constants
#set_fix_multiple_port_nets -all -buffer_constants -feedthroughs
set_cost_priority -delay


###############################################################################
# Set for multi-threshold library 
###############################################################################
#set_attribute [get_libs $hvt_stb_lib] default_threshold_voltage_group hvt
#set_attribute [get_libs $rvt_stb_lib] default_threshold_voltage_group rvt
#set_attribute [get_libs $lvt_stb_lib] default_threshold_voltage_group lvt
#set_multi_vth_constraint -lvth_groups {lvt} -lvth_percentage 10.0 -type hard

###############################################################################
# Set Clock gating style                                                            
###############################################################################
#set_clock_gating_style -sequential_cell latch -positive_edge_logic  {integrated} \
#                       -control_point before -control_signal test_mode
#
#set_clock_gating_objects -exclude [all_registers -clock rclkmain]
#set power_cg_all_registers true                       
#set power_remove_redundant_clock_gates true                      

#propagate_constraints -gate_clock

if {${SCAN} == 1} {    
    compile_ultra -no_autoungroup -scan -gate_clock 
    report_timing -delay max -sort_by slack -path full -nworst 1 -max_paths 200  > $REPORTS_DIR/timing_1stcmp_$TOP.rpt 
    report_timing -delay min -sort_by slack -path full -nworst 1 -max_paths 200 >> $REPORTS_DIR/timing_1stcmp_$TOP.rpt 

    #scan chain insertion
    source scr/sc_cfg.tcl
    
	#Timing optimization after dft insertion
    compile_ultra -no_autoungroup -only_design_rule -incremental
    compile_ultra -no_autoungroup -incremental -scan -gate_clock
    compile_ultra -no_autoungroup -incremental -scan -gate_clock
    
	#Result and reports for scan chain insertion
    source scr/sc_rpt.tcl

} else {
    #compile_ultra_mdp 4 $TOP
    compile_ultra -no_autoungroup
    report_timing -delay max -sort_by slack -path full -nworst 1 -max_paths 100 >  $REPORTS_DIR/timing_1stcmp_$TOP.rpt 
    report_timing -delay min -sort_by slack -path full -nworst 1 -max_paths 100 >> $REPORTS_DIR/timing_1stcmp_$TOP.rpt 
    compile_ultra -no_autoungroup -incremental
}


###############################################################################
#write the result
###############################################################################

#Write out verilog 
set verilogout_no_tri TRUE
define_name_rules cds_rules -allowed "A-Z a-z 0-9 _"
change_names -rules cds_rules
change_names -rules verilog -verbose -hierarchy
write -f ddc -hierarchy     -output $OUTPUT/$TOP.ddc
write -f verilog -hierarchy -output $OUTPUT/$TOP.v 
write_sdc  -version latest          $OUTPUT/$TOP.func.sdc
write_sdf                           $OUTPUT/$TOP.sdf  
write_script -output                $OUTPUT/$TOP.tcl  

###############################################################################
#Report analysis results
report_qor                        >  $REPORTS_DIR/qor_$TOP.rpt
report_constraint -all_violators  > $REPORTS_DIR/all_vios_$TOP.rpt

report_timing -delay max -sort_by slack -path full -nworst 1 -max_paths 2000 -slack_lesser_than 0 > $REPORTS_DIR/timing_$TOP.rpt 
report_timing -delay min -sort_by slack -path full -nworst 1 -max_paths 2000 -slack_lesser_than 0 >> $REPORTS_DIR/timing_$TOP.rpt 
report_timing -sort_by slack -path full -nworst 1 -max_paths 1000  -loops                         >> $REPORTS_DIR/timing_loops_$TOP.rpt 

report_resource -hierarchy                                         > $OUTPUT/$TOP.res

report_area -hier                                                  > $REPORTS_DIR/area_hier_$TOP.rpt
report_area -hier                                                  > $REPORTS_DIR/area_$TOP.rpt

#report_clock                                                       > $REPORTS_DIR/clocks_$TOP.rpt
#report_clock_gating -style                                         > $REPORTS_DIR/clocks_gating_style_$TOP.rpt
#report_clock_gating                                                > $REPORTS_DIR/clocks_gating_$TOP.rpt
#report_clock_gating -verbose -ungated                             >> $REPORTS_DIR/clocks_gating_$TOP.rpt
#report_threshold_voltage_group -lvth_groups {lvt} -verbose     > $REPORTS_DIR/mvt_percent_$TOP.rpt

report_power -hier  -hier_level 2 -verbose -analysis_effort medium > $REPORTS_DIR/power_$TOP.rpt
set svf -off

#exit
