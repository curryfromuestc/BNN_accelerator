set clk_main_period 40

create_clock -period 5 -name  clk

set_clock_uncertainty -setup 0.4 [get_clocks clk]
set_clock_uncertainty -hold  0.2 [get_clocks clk]
set_clock_gating_check -hold 0.2 -setup 0.4 [all_clocks]


set_load 10  [all_outputs]
set_input_transition 1 [all_inputs]
set_clock_transition 0.3  [get_clocks {rclkmain}]
set_max_transition 0.6             [current_design]
set_max_fanout     32            [current_design]
# set_dont_touch          [get_cells $rstgen/u_rstmux_0]
# set_ideal_network -no_propagate [get_pins  $rstgen/u_rstmux_0/u_clkmux/Z]
set_ideal_network [all_high_fanout -nets  -threshold 100] -no_propagate
set_max_area 0.0
