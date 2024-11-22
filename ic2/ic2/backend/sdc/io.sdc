
set_max_area 0

set DRV_CELL   BUFHD8X

set LOAD_PORT  [expr 10*[load_of gsmc13_ss_1p08v_125c/${DRV_CELL}/A]]
set MAX_CAP    [expr 10*[load_of gsmc13_ss_1p08v_125c/${DRV_CELL}/A]]

set_driving_cell -lib_cell $DRV_CELL\
                 -pin Z [all_inputs]
set output_load    $LOAD_PORT
set design_max_cap $MAX_CAP
set_max_capacitance $design_max_cap [current_design]

set_clock_transition 0.2  [all_clocks]
return 
set_max_transition 0.4           [list [all_inputs] [all_outputs]]
#set_max_transition 0.4 [current_design]
set_max_fanout     32            [current_design]
set_load           $output_load  [list [all_outputs]]
#set_load           $output_load            [remove_from_collection [all_outputs] [get_ports {}]]
#set_load           [expr $output_load/4.0] [get_ports {data_syn* main_clk* dout_*ch}]
#set_load  0.15        [remove_from_collection [all_outputs] [get_ports {DATAL DATAR}]]
#set_load  0.21        [get_ports {DATAL DATAR}]

#set auto_wire_load_selection "false"
#set auto_wire_load_selection "true"
#set_wire_load_mode   top
#set_wire_load_model -name Zero [all_designs]
#set_wire_load_mode   top
#set_wire_load_mode   segmented
#set_wire_load_mode  enclosed
