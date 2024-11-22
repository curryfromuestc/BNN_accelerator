# set variable
set_max_fanout 32 [current_design]
set_max_transition 0.8 [current_design]

# clkmain domain
create_clock -name clk_s [get_ports clk_s] -period 20
create_clock -name clk_f [get_ports clk_f] -period 5


##########################################################
set_clock_uncertainty -setup 0.3 [all_clocks]
set_clock_uncertainty -hold  0.2 [all_clocks]
set_clock_gating_check -hold 0.2 -setup 0.3 [all_clocks]
set_clock_transition 0.6 [all_clocks]
# add your port in "get_ports {}"
set_input_delay 0.5 -clock clk_s -add_delay -max [remove_from_collection [all_inputs] "clk_s"]
set_output_delay 0.5 -clock clk_s -add_delay -max [all_outputs]
set_input_delay 0.5 -clock clk_f -add_delay -max [remove_from_collection [all_inputs] "clk_f"]
set_output_delay 0.5 -clock clk_f -add_delay -max [all_outputs]                           

#set reset donnot touch
#set_dont_touch [get_cells $rstgen/*rstmux*]
#set_ideal_network [get_pins  $rstgen/*rstmux*/*clkmux*/Z]

