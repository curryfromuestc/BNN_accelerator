#=======================================================
# set TOP     pe_cell

set PATH    $RUN_DIR_DCT       
set RTL     $PATH/inputs/$TOP.v
set NETLIST $PATH/outputs/$TOP.v

set DATE    [sh date +%m%d%y]
set SESSION rpt

sh rm -rf   ${SESSION}
sh mkdir -p ${SESSION}

set_host_options -max_cores          2
set_app_var synopsys_auto_setup      true
set sh_new_variable_message          "false";
set hdlin_auto_top                   "false";
set hdlin_unresolved_modules         "black_box";
set verification_failing_point_limit 999;

#=======================================================
#set_svf   default.svf
set_svf   $PATH/outputs/$TOP.svf

#=======================================================
#set library path
source ./script/fm_lib.tcl
# set rvt_stb_lib  "gsmc13_ss_1p08v_125c"
set io_library  ""
# set PROC_PATH    [concat /home/zxt/GSMC13/GSMC13/FEView_STDIO/VS-GSMC-13-Design-Kit-V1.001/STD/Synopsys]
# set SYNOPSYS_ROOT [concat /app/synopsys/dc_201409/libraries/syn]
set IO_PATH [concat ]
set search_path   [concat $search_path \
                          $SYNOPSYS_ROOT \
                          $PROC_PATH \
                          $SYNOPSYS_ROOT/sdb \
                          $IO_PATH]

foreach path $search_path {
    foreach file [ glob -nocomplain $path/*.db ] {
        if { ( [regexp $rvt_stb_lib\.db$ $file ] == 1 ) || ( [regexp $io_library\.db$ $file ] == 1 )} {
            echo $file
            read_db $file  
        }
    }
}


#=======================================================
# Read Golden and set
eval read_verilog -container r -libname WORK $RTL
set_top r:/WORK/${TOP}

read_verilog -container i -libname WORK $NETLIST
set_top i:/WORK/${TOP}

#set_constant r:/WORK/${TOP}/test_se_c   0 -type port 
#set_constant i:/WORK/${TOP}/test_se_c   0 -type port
#set_constant r:/WORK/${TOP}/test_mode_c 0 -type port 
#set_constant i:/WORK/${TOP}/test_mode_c 0 -type port


match

report_unmatched_points > ${SESSION}/report_unmatched_points.rpt
report_matched_points   > ${SESSION}/report_matched_points.rpt

set result [verify r:WORK/${TOP} i:/WORK/${TOP}]

report_failing > ${SESSION}/report_failing.rpt
report_passing > ${SESSION}/report_passing.rpt
report_aborted > ${SESSION}/report_aborted.rpt

if { $result == 1 } {
    exit
} else {
    start_gui
}
