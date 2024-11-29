###################################################################

# Created by write_script -format dctcl on Thu Nov 28 20:15:40 2024

###################################################################

# Set the current_design #
current_design fc_12

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
remove_wire_load_model
set_max_transition 0.6 [current_design]
set_max_fanout 32 [current_design]
set_critical_range 0.3 [current_design]
set_max_area 0
set_structure true
set_fix_multiple_port_nets -all -buffer_constants
set_cost_priority { max_delay }
set_local_link_library                                                         \
{scc55nll_vhs_rvt_ss_v1p08_125c_basic.db,scc55nll_vhs_lvt_ss_v1p08_125c_basic.db}
set_register_merging [current_design] 17
set_attribute -type integer [current_design] pwr_cg_gating_group_count 5
set_attribute -type boolean [current_design] pwr_cg_design_has_clock_gating    \
true
set_attribute -type boolean [get_cells clk_gate_dout_r_reg_15_]                \
clock_gating_logic true
set_attribute -type boolean [get_cells clk_gate_p8_reg] clock_gating_logic true
set_attribute -type boolean [get_cells clk_gate_w_reg_93_] clock_gating_logic  \
true
set_attribute -type boolean [get_cells clk_gate_w_reg_41_] clock_gating_logic  \
true
set_attribute -type boolean [get_cells clk_gate_weight_addr_reg_10_]           \
clock_gating_logic true
set_attribute -type boolean [get_cells clk_gate_cnt_w_reg_8_]                  \
clock_gating_logic true
set_attribute -type boolean [get_cells clk_gate_cnt_fc_reg_8_]                 \
clock_gating_logic true
set_compile_directives [get_pins clk_gate_dout_r_reg_15_/CLK]                  \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_dout_r_reg_15_/EN]                   \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_dout_r_reg_15_/TE]                   \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_p8_reg/CLK] -constant_propagation    \
false 
set_compile_directives [get_pins clk_gate_p8_reg/EN] -constant_propagation     \
false 
set_compile_directives [get_pins clk_gate_p8_reg/TE] -constant_propagation     \
false 
set_compile_directives [get_pins clk_gate_w_reg_93_/CLK] -constant_propagation \
false 
set_compile_directives [get_pins clk_gate_w_reg_93_/EN] -constant_propagation  \
false 
set_compile_directives [get_pins clk_gate_w_reg_93_/TE] -constant_propagation  \
false 
set_compile_directives [get_pins clk_gate_w_reg_41_/CLK] -constant_propagation \
false 
set_compile_directives [get_pins clk_gate_w_reg_41_/EN] -constant_propagation  \
false 
set_compile_directives [get_pins clk_gate_w_reg_41_/TE] -constant_propagation  \
false 
set_compile_directives [get_pins clk_gate_weight_addr_reg_10_/CLK]             \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_weight_addr_reg_10_/EN]              \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_weight_addr_reg_10_/TE]              \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_cnt_w_reg_8_/CLK]                    \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_cnt_w_reg_8_/EN]                     \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_cnt_w_reg_8_/TE]                     \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_cnt_fc_reg_8_/CLK]                   \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_cnt_fc_reg_8_/EN]                    \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_cnt_fc_reg_8_/TE]                    \
-constant_propagation false 
set_attribute -type boolean [get_cells clk_gate_dout_r_reg_15_]                \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells clk_gate_p8_reg] hpower_inv_cg_cell     \
false
set_attribute -type boolean [get_cells clk_gate_w_reg_93_] hpower_inv_cg_cell  \
false
set_attribute -type boolean [get_cells clk_gate_w_reg_41_] hpower_inv_cg_cell  \
false
set_attribute -type boolean [get_cells clk_gate_weight_addr_reg_10_]           \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells clk_gate_cnt_w_reg_8_]                  \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells clk_gate_cnt_fc_reg_8_]                 \
hpower_inv_cg_cell false
set_ideal_net [get_nets {weight_addr[7]}]
set_load -pin_load 10 [get_ports ovalid]
set_load -pin_load 10 [get_ports {dout[15]}]
set_load -pin_load 10 [get_ports {dout[14]}]
set_load -pin_load 10 [get_ports {dout[13]}]
set_load -pin_load 10 [get_ports {dout[12]}]
set_load -pin_load 10 [get_ports {dout[11]}]
set_load -pin_load 10 [get_ports {dout[10]}]
set_load -pin_load 10 [get_ports {dout[9]}]
set_load -pin_load 10 [get_ports {dout[8]}]
set_load -pin_load 10 [get_ports {dout[7]}]
set_load -pin_load 10 [get_ports {dout[6]}]
set_load -pin_load 10 [get_ports {dout[5]}]
set_load -pin_load 10 [get_ports {dout[4]}]
set_load -pin_load 10 [get_ports {dout[3]}]
set_load -pin_load 10 [get_ports {dout[2]}]
set_load -pin_load 10 [get_ports {dout[1]}]
set_load -pin_load 10 [get_ports {dout[0]}]
set_map_only [get_cells intadd_0_U2] 
set_map_only [get_cells intadd_0_U7] 
set_map_only [get_cells intadd_0_U3] 
set_map_only [get_cells intadd_0_U6] 
set_map_only [get_cells intadd_0_U4] 
set_map_only [get_cells intadd_0_U5] 
set_map_only [get_cells intadd_0_U8] 
set_map_only [get_cells intadd_0_U9] 
set_map_only [get_cells intadd_0_U10] 
set_map_only [get_cells intadd_0_U11] 
set_map_only [get_cells intadd_0_U12] 
set_map_only [get_cells intadd_0_U13] 
set_map_only [get_cells intadd_0_U14] 
set_map_only [get_cells intadd_1_U6] 
set_map_only [get_cells intadd_1_U5] 
set_map_only [get_cells intadd_1_U4] 
set_map_only [get_cells intadd_1_U3] 
set_map_only [get_cells intadd_1_U2] 
set_map_only [get_cells intadd_2_U5] 
set_map_only [get_cells intadd_2_U4] 
set_map_only [get_cells intadd_2_U3] 
set_map_only [get_cells intadd_2_U2] 
set_map_only [get_cells intadd_3_U3] 
set_map_only [get_cells intadd_3_U2] 
set_map_only [get_cells intadd_5_U3] 
set_map_only [get_cells intadd_5_U2] 
set_map_only [get_cells intadd_4_U3] 
set_map_only [get_cells intadd_4_U2] 
set_attribute -type integer [get_cells dout_r_reg_14_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_12_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_9_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_7_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_6_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_4_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_3_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_2_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_1_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p9_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p10_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p11_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p0_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p1_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p2_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p3_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p4_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p5_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p7_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p8_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_143_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_142_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_141_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_140_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_139_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_138_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_137_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_136_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_135_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_134_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_133_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_131_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_130_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_129_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_128_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_127_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_126_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_125_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_124_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_123_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_122_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_121_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_120_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_119_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_118_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_116_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_115_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_114_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_113_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_112_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_111_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_110_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_109_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_108_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_107_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_106_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_105_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_104_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_103_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_101_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_100_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_99_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_98_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_97_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_96_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_95_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_94_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_93_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_92_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_91_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_90_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_89_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_88_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_86_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_85_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_84_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_83_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_82_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_81_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_80_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_79_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_78_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_77_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_76_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_75_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_74_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_73_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_71_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_70_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_69_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_68_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_67_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_66_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_65_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_64_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_63_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_62_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_61_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_60_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_59_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_58_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_56_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_55_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_54_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_53_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_52_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_51_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_50_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_49_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_48_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_47_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_46_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_45_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_44_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_43_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_41_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_40_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_39_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_38_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_37_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_36_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_35_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_34_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_33_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_32_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_31_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_30_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_29_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_28_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_26_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_25_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_24_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_23_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_22_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_21_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_20_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_19_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_18_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_17_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_16_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_15_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_14_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_13_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_11_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_10_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_9_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_8_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_7_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_6_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_5_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_4_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_3_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_2_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_1_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_0_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells weight_addr_reg_10_]                    \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells weight_addr_reg_9_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells weight_addr_reg_7_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells weight_addr_reg_6_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells weight_addr_reg_5_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells weight_addr_reg_4_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells weight_addr_reg_3_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells weight_addr_reg_2_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells weight_addr_reg_1_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells weight_addr_reg_0_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells cnt_w_reg_8_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells cnt_w_reg_7_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells cnt_w_reg_5_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells cnt_w_reg_4_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells cnt_w_reg_3_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells cnt_w_reg_2_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells cnt_w_reg_0_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells cnt_fc_reg_1_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells cnt_fc_reg_2_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells cnt_fc_reg_3_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells cnt_fc_reg_4_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells cnt_fc_reg_5_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells cnt_fc_reg_6_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells cnt_fc_reg_7_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells cnt_fc_reg_8_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells cnt_fc_reg_0_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_15_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_13_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_11_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_10_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_8_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells dout_r_reg_5_]                          \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells p6_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_132_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_117_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_102_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_87_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_72_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_57_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_42_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_27_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells w_reg_12_] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells weight_addr_reg_8_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells cnt_w_reg_6_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells cnt_w_reg_1_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells clk_gate_dout_r_reg_15_]                \
pwr_cg_gating_group 3
set_attribute -type integer [get_cells clk_gate_p8_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells clk_gate_w_reg_93_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells clk_gate_w_reg_41_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells clk_gate_weight_addr_reg_10_]           \
pwr_cg_gating_group 4
set_attribute -type integer [get_cells clk_gate_cnt_w_reg_8_]                  \
pwr_cg_gating_group 1
set_attribute -type integer [get_cells clk_gate_cnt_fc_reg_8_]                 \
pwr_cg_gating_group 0
set_attribute -type integer [get_cells dout_r_reg_14_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_12_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_9_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_7_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_6_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_4_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_3_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_2_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_1_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells p9_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells p10_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells p11_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells p0_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells p1_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells p2_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells p3_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells p4_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells p5_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells p7_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells p8_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells w_reg_143_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_142_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_141_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_140_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_139_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_138_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_137_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_136_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_135_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_134_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_133_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_131_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_130_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_129_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_128_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_127_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_126_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_125_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_124_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_123_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_122_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_121_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_120_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_119_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_118_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_116_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_115_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_114_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_113_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_112_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_111_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_110_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_109_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_108_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_107_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_106_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_105_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_104_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_103_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_101_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_100_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_99_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_98_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_97_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_96_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_95_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_94_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_93_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_92_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_91_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_90_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_89_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_88_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_86_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_85_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_84_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_83_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_82_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_81_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_80_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_79_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_78_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_77_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_76_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_75_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_74_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_73_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_71_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_70_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_69_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_68_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_67_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_66_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_65_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_64_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_63_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_62_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_61_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_60_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_59_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_58_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_56_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_55_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_54_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_53_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_52_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_51_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_50_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_49_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_48_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_47_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_46_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_45_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_44_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_43_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_41_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_40_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_39_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_38_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_37_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_36_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_35_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_34_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_33_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_32_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_31_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_30_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_29_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_28_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_26_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_25_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_24_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_23_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_22_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_21_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_20_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_19_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_18_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_17_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_16_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_15_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_14_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_13_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_11_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_10_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_9_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_8_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_7_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_6_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_5_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_4_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_3_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_2_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_1_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_0_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells weight_addr_reg_10_]                    \
pwr_cg_gating_group 4
set_attribute -type integer [get_cells weight_addr_reg_9_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells weight_addr_reg_7_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells weight_addr_reg_6_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells weight_addr_reg_5_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells weight_addr_reg_4_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells weight_addr_reg_3_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells weight_addr_reg_2_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells weight_addr_reg_1_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells weight_addr_reg_0_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells cnt_w_reg_8_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells cnt_w_reg_7_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells cnt_w_reg_5_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells cnt_w_reg_4_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells cnt_w_reg_3_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells cnt_w_reg_2_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells cnt_w_reg_0_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells cnt_fc_reg_1_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells cnt_fc_reg_2_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells cnt_fc_reg_3_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells cnt_fc_reg_4_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells cnt_fc_reg_5_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells cnt_fc_reg_6_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells cnt_fc_reg_7_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells cnt_fc_reg_8_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells cnt_fc_reg_0_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells dout_r_reg_15_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_13_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_11_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_10_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_8_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells dout_r_reg_5_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells p6_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells w_reg_132_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_117_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_102_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_87_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_72_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_57_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_42_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_27_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells w_reg_12_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells weight_addr_reg_8_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells cnt_w_reg_6_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells cnt_w_reg_1_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells clk_gate_dout_r_reg_15_]                \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_p8_reg]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_w_reg_93_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_w_reg_41_]                     \
pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells clk_gate_weight_addr_reg_10_]           \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells clk_gate_cnt_w_reg_8_]                  \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_cnt_fc_reg_8_]                 \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells dout_r_reg_14_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells dout_r_reg_12_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells dout_r_reg_9_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells dout_r_reg_7_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells dout_r_reg_6_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells dout_r_reg_4_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells dout_r_reg_3_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells dout_r_reg_2_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells dout_r_reg_1_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p9_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p10_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p11_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p0_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p1_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p2_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p3_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p4_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p5_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p7_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p8_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_143_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_142_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_141_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_140_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_139_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_138_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_137_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_136_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_135_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_134_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_133_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_131_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_130_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_129_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_128_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_127_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_126_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_125_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_124_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_123_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_122_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_121_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_120_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_119_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_118_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_116_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_115_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_114_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_113_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_112_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_111_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_110_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_109_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_108_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_107_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_106_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_105_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_104_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_103_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_101_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_100_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_99_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_98_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_97_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_96_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_95_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_94_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_93_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_92_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_91_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_90_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_89_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_88_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_86_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_85_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_84_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_83_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_82_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_81_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_80_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_79_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_78_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_77_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_76_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_75_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_74_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_73_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_71_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_70_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_69_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_68_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_67_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_66_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_65_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_64_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_63_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_62_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_61_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_60_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_59_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_58_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_56_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_55_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_54_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_53_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_52_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_51_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_50_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_49_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_48_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_47_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_46_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_45_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_44_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_43_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_41_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_40_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_39_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_38_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_37_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_36_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_35_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_34_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_33_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_32_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_31_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_30_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_29_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_28_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_26_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_25_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_24_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_23_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_22_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_21_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_20_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_19_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_18_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_17_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_16_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_15_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_14_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_13_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_11_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_10_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_9_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_8_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_7_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_6_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_5_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_4_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_3_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_2_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_1_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_0_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells weight_addr_reg_10_]                    \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells weight_addr_reg_9_]                     \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells weight_addr_reg_7_]                     \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells weight_addr_reg_6_]                     \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells weight_addr_reg_5_]                     \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells weight_addr_reg_4_]                     \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells weight_addr_reg_3_]                     \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells weight_addr_reg_2_]                     \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells weight_addr_reg_1_]                     \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells weight_addr_reg_0_]                     \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells cnt_w_reg_8_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_w_reg_7_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_w_reg_5_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_w_reg_4_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_w_reg_3_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_w_reg_2_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_w_reg_0_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_fc_reg_1_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_fc_reg_2_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_fc_reg_3_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_fc_reg_4_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_fc_reg_5_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_fc_reg_6_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_fc_reg_7_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_fc_reg_8_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_fc_reg_0_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells dout_r_reg_15_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells dout_r_reg_13_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells dout_r_reg_11_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells dout_r_reg_10_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells dout_r_reg_8_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells dout_r_reg_5_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells p6_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_132_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_117_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_102_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells w_reg_87_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_72_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_57_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_42_] pwr_cg_gating_sub_group 1
set_attribute -type integer [get_cells w_reg_27_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells w_reg_12_] pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells weight_addr_reg_8_]                     \
pwr_cg_gating_sub_group 2
set_attribute -type integer [get_cells cnt_w_reg_6_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells cnt_w_reg_1_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells ivalid_ff_0_reg]                        \
pwr_cg_non_gating_group 81
set_attribute -type integer [get_cells osign_reg] pwr_cg_non_gating_group 0
set_attribute -type integer [get_cells sum_reg_1_] pwr_cg_non_gating_group 2
set_attribute -type integer [get_cells sum_reg_2_] pwr_cg_non_gating_group 3
set_attribute -type integer [get_cells sum_reg_3_] pwr_cg_non_gating_group 4
set_attribute -type integer [get_cells sum_reg_4_] pwr_cg_non_gating_group 5
set_attribute -type integer [get_cells sum_reg_5_] pwr_cg_non_gating_group 6
set_attribute -type integer [get_cells sum_reg_6_] pwr_cg_non_gating_group 7
set_attribute -type integer [get_cells sum_reg_7_] pwr_cg_non_gating_group 8
set_attribute -type integer [get_cells sum21_reg_1_] pwr_cg_non_gating_group 11
set_attribute -type integer [get_cells sum21_reg_2_] pwr_cg_non_gating_group 12
set_attribute -type integer [get_cells sum21_reg_3_] pwr_cg_non_gating_group 13
set_attribute -type integer [get_cells sum21_reg_4_] pwr_cg_non_gating_group 14
set_attribute -type integer [get_cells sum21_reg_5_] pwr_cg_non_gating_group 15
set_attribute -type integer [get_cells sum21_reg_7_] pwr_cg_non_gating_group 17
set_attribute -type integer [get_cells sum20_reg_1_] pwr_cg_non_gating_group 19
set_attribute -type integer [get_cells sum20_reg_2_] pwr_cg_non_gating_group 20
set_attribute -type integer [get_cells sum20_reg_3_] pwr_cg_non_gating_group 21
set_attribute -type integer [get_cells sum20_reg_4_] pwr_cg_non_gating_group 22
set_attribute -type integer [get_cells sum20_reg_5_] pwr_cg_non_gating_group 23
set_attribute -type integer [get_cells sum20_reg_6_] pwr_cg_non_gating_group 24
set_attribute -type integer [get_cells sum20_reg_7_] pwr_cg_non_gating_group 25
set_attribute -type integer [get_cells sum10_reg_1_] pwr_cg_non_gating_group 27
set_attribute -type integer [get_cells sum10_reg_2_] pwr_cg_non_gating_group 28
set_attribute -type integer [get_cells sum10_reg_3_] pwr_cg_non_gating_group 29
set_attribute -type integer [get_cells sum10_reg_4_] pwr_cg_non_gating_group 30
set_attribute -type integer [get_cells sum10_reg_5_] pwr_cg_non_gating_group 31
set_attribute -type integer [get_cells sum10_reg_6_] pwr_cg_non_gating_group 32
set_attribute -type integer [get_cells sum12_reg_2_] pwr_cg_non_gating_group 35
set_attribute -type integer [get_cells sum12_reg_3_] pwr_cg_non_gating_group 36
set_attribute -type integer [get_cells sum12_reg_4_] pwr_cg_non_gating_group 37
set_attribute -type integer [get_cells sum12_reg_5_] pwr_cg_non_gating_group 38
set_attribute -type integer [get_cells sum12_reg_6_] pwr_cg_non_gating_group 39
set_attribute -type integer [get_cells sum11_reg_1_] pwr_cg_non_gating_group 41
set_attribute -type integer [get_cells sum11_reg_2_] pwr_cg_non_gating_group 42
set_attribute -type integer [get_cells sum11_reg_3_] pwr_cg_non_gating_group 43
set_attribute -type integer [get_cells sum11_reg_4_] pwr_cg_non_gating_group 44
set_attribute -type integer [get_cells sum11_reg_5_] pwr_cg_non_gating_group 45
set_attribute -type integer [get_cells sum11_reg_6_] pwr_cg_non_gating_group 46
set_attribute -type integer [get_cells sum00_reg_1_] pwr_cg_non_gating_group 48
set_attribute -type integer [get_cells sum00_reg_2_] pwr_cg_non_gating_group 49
set_attribute -type integer [get_cells sum00_reg_3_] pwr_cg_non_gating_group 50
set_attribute -type integer [get_cells sum05_reg_1_] pwr_cg_non_gating_group 53
set_attribute -type integer [get_cells sum05_reg_2_] pwr_cg_non_gating_group 54
set_attribute -type integer [get_cells sum05_reg_3_] pwr_cg_non_gating_group 55
set_attribute -type integer [get_cells sum05_reg_4_] pwr_cg_non_gating_group 56
set_attribute -type integer [get_cells sum02_reg_1_] pwr_cg_non_gating_group 58
set_attribute -type integer [get_cells sum02_reg_2_] pwr_cg_non_gating_group 59
set_attribute -type integer [get_cells sum02_reg_3_] pwr_cg_non_gating_group 60
set_attribute -type integer [get_cells sum02_reg_4_] pwr_cg_non_gating_group 61
set_attribute -type integer [get_cells sum01_reg_1_] pwr_cg_non_gating_group 63
set_attribute -type integer [get_cells sum01_reg_2_] pwr_cg_non_gating_group 64
set_attribute -type integer [get_cells sum01_reg_3_] pwr_cg_non_gating_group 65
set_attribute -type integer [get_cells sum01_reg_4_] pwr_cg_non_gating_group 66
set_attribute -type integer [get_cells sum04_reg_1_] pwr_cg_non_gating_group 68
set_attribute -type integer [get_cells sum04_reg_2_] pwr_cg_non_gating_group 69
set_attribute -type integer [get_cells sum04_reg_4_] pwr_cg_non_gating_group 71
set_attribute -type integer [get_cells sum03_reg_1_] pwr_cg_non_gating_group 73
set_attribute -type integer [get_cells sum03_reg_2_] pwr_cg_non_gating_group 74
set_attribute -type integer [get_cells sum03_reg_3_] pwr_cg_non_gating_group 75
set_attribute -type integer [get_cells sum03_reg_4_] pwr_cg_non_gating_group 76
set_attribute -type integer [get_cells csign_reg] pwr_cg_non_gating_group 77
set_attribute -type integer [get_cells ivalid_ff_4_reg]                        \
pwr_cg_non_gating_group 80
set_attribute -type integer [get_cells ivalid_ff_3_reg]                        \
pwr_cg_non_gating_group 79
set_attribute -type integer [get_cells ivalid_ff_1_reg]                        \
pwr_cg_non_gating_group 82
set_attribute -type integer [get_cells ivalid_ff_2_reg]                        \
pwr_cg_non_gating_group 78
set_attribute -type integer [get_cells sum_reg_8_] pwr_cg_non_gating_group 9
set_attribute -type integer [get_cells sum21_reg_6_] pwr_cg_non_gating_group 16
set_attribute -type integer [get_cells sum12_reg_1_] pwr_cg_non_gating_group 34
set_attribute -type integer [get_cells sum00_reg_4_] pwr_cg_non_gating_group 51
set_attribute -type integer [get_cells sum04_reg_3_] pwr_cg_non_gating_group 70
set_register_merging [get_cells ivalid_ff_0_reg] 17
set_register_merging [get_cells osign_reg] 17
set_register_merging [get_cells dout_r_reg_14_] 17
set_register_merging [get_cells dout_r_reg_12_] 17
set_register_merging [get_cells dout_r_reg_9_] 17
set_register_merging [get_cells dout_r_reg_7_] 17
set_register_merging [get_cells dout_r_reg_6_] 17
set_register_merging [get_cells dout_r_reg_4_] 17
set_register_merging [get_cells dout_r_reg_3_] 17
set_register_merging [get_cells dout_r_reg_2_] 17
set_register_merging [get_cells dout_r_reg_1_] 17
set_register_merging [get_cells sum_reg_1_] 17
set_register_merging [get_cells sum_reg_2_] 17
set_register_merging [get_cells sum_reg_3_] 17
set_register_merging [get_cells sum_reg_4_] 17
set_register_merging [get_cells sum_reg_5_] 17
set_register_merging [get_cells sum_reg_6_] 17
set_register_merging [get_cells sum_reg_7_] 17
set_register_merging [get_cells sum21_reg_1_] 17
set_register_merging [get_cells sum21_reg_2_] 17
set_register_merging [get_cells sum21_reg_3_] 17
set_register_merging [get_cells sum21_reg_4_] 17
set_register_merging [get_cells sum21_reg_5_] 17
set_register_merging [get_cells sum21_reg_7_] 17
set_register_merging [get_cells sum20_reg_1_] 17
set_register_merging [get_cells sum20_reg_2_] 17
set_register_merging [get_cells sum20_reg_3_] 17
set_register_merging [get_cells sum20_reg_4_] 17
set_register_merging [get_cells sum20_reg_5_] 17
set_register_merging [get_cells sum20_reg_6_] 17
set_register_merging [get_cells sum20_reg_7_] 17
set_register_merging [get_cells sum10_reg_1_] 17
set_register_merging [get_cells sum10_reg_2_] 17
set_register_merging [get_cells sum10_reg_3_] 17
set_register_merging [get_cells sum10_reg_4_] 17
set_register_merging [get_cells sum10_reg_5_] 17
set_register_merging [get_cells sum10_reg_6_] 17
set_register_merging [get_cells sum12_reg_2_] 17
set_register_merging [get_cells sum12_reg_3_] 17
set_register_merging [get_cells sum12_reg_4_] 17
set_register_merging [get_cells sum12_reg_5_] 17
set_register_merging [get_cells sum12_reg_6_] 17
set_register_merging [get_cells sum11_reg_1_] 17
set_register_merging [get_cells sum11_reg_2_] 17
set_register_merging [get_cells sum11_reg_3_] 17
set_register_merging [get_cells sum11_reg_4_] 17
set_register_merging [get_cells sum11_reg_5_] 17
set_register_merging [get_cells sum11_reg_6_] 17
set_register_merging [get_cells sum00_reg_1_] 17
set_register_merging [get_cells sum00_reg_2_] 17
set_register_merging [get_cells sum00_reg_3_] 17
set_register_merging [get_cells sum05_reg_1_] 17
set_register_merging [get_cells sum05_reg_2_] 17
set_register_merging [get_cells sum05_reg_3_] 17
set_register_merging [get_cells sum05_reg_4_] 17
set_register_merging [get_cells sum02_reg_1_] 17
set_register_merging [get_cells sum02_reg_2_] 17
set_register_merging [get_cells sum02_reg_3_] 17
set_register_merging [get_cells sum02_reg_4_] 17
set_register_merging [get_cells sum01_reg_1_] 17
set_register_merging [get_cells sum01_reg_2_] 17
set_register_merging [get_cells sum01_reg_3_] 17
set_register_merging [get_cells sum01_reg_4_] 17
set_register_merging [get_cells sum04_reg_1_] 17
set_register_merging [get_cells sum04_reg_2_] 17
set_register_merging [get_cells sum04_reg_4_] 17
set_register_merging [get_cells sum03_reg_1_] 17
set_register_merging [get_cells sum03_reg_2_] 17
set_register_merging [get_cells sum03_reg_3_] 17
set_register_merging [get_cells sum03_reg_4_] 17
set_register_merging [get_cells p9_reg] 17
set_register_merging [get_cells p10_reg] 17
set_register_merging [get_cells p11_reg] 17
set_register_merging [get_cells p0_reg] 17
set_register_merging [get_cells p1_reg] 17
set_register_merging [get_cells p2_reg] 17
set_register_merging [get_cells p3_reg] 17
set_register_merging [get_cells p4_reg] 17
set_register_merging [get_cells p5_reg] 17
set_register_merging [get_cells p7_reg] 17
set_register_merging [get_cells p8_reg] 17
set_register_merging [get_cells csign_reg] 17
set_register_merging [get_cells w_reg_143_] 17
set_register_merging [get_cells w_reg_142_] 17
set_register_merging [get_cells w_reg_141_] 17
set_register_merging [get_cells w_reg_140_] 17
set_register_merging [get_cells w_reg_139_] 17
set_register_merging [get_cells w_reg_138_] 17
set_register_merging [get_cells w_reg_137_] 17
set_register_merging [get_cells w_reg_136_] 17
set_register_merging [get_cells w_reg_135_] 17
set_register_merging [get_cells w_reg_134_] 17
set_register_merging [get_cells w_reg_133_] 17
set_register_merging [get_cells w_reg_131_] 17
set_register_merging [get_cells w_reg_130_] 17
set_register_merging [get_cells w_reg_129_] 17
set_register_merging [get_cells w_reg_128_] 17
set_register_merging [get_cells w_reg_127_] 17
set_register_merging [get_cells w_reg_126_] 17
set_register_merging [get_cells w_reg_125_] 17
set_register_merging [get_cells w_reg_124_] 17
set_register_merging [get_cells w_reg_123_] 17
set_register_merging [get_cells w_reg_122_] 17
set_register_merging [get_cells w_reg_121_] 17
set_register_merging [get_cells w_reg_120_] 17
set_register_merging [get_cells w_reg_119_] 17
set_register_merging [get_cells w_reg_118_] 17
set_register_merging [get_cells w_reg_116_] 17
set_register_merging [get_cells w_reg_115_] 17
set_register_merging [get_cells w_reg_114_] 17
set_register_merging [get_cells w_reg_113_] 17
set_register_merging [get_cells w_reg_112_] 17
set_register_merging [get_cells w_reg_111_] 17
set_register_merging [get_cells w_reg_110_] 17
set_register_merging [get_cells w_reg_109_] 17
set_register_merging [get_cells w_reg_108_] 17
set_register_merging [get_cells w_reg_107_] 17
set_register_merging [get_cells w_reg_106_] 17
set_register_merging [get_cells w_reg_105_] 17
set_register_merging [get_cells w_reg_104_] 17
set_register_merging [get_cells w_reg_103_] 17
set_register_merging [get_cells w_reg_101_] 17
set_register_merging [get_cells w_reg_100_] 17
set_register_merging [get_cells w_reg_99_] 17
set_register_merging [get_cells w_reg_98_] 17
set_register_merging [get_cells w_reg_97_] 17
set_register_merging [get_cells w_reg_96_] 17
set_register_merging [get_cells w_reg_95_] 17
set_register_merging [get_cells w_reg_94_] 17
set_register_merging [get_cells w_reg_93_] 17
set_register_merging [get_cells w_reg_92_] 17
set_register_merging [get_cells w_reg_91_] 17
set_register_merging [get_cells w_reg_90_] 17
set_register_merging [get_cells w_reg_89_] 17
set_register_merging [get_cells w_reg_88_] 17
set_register_merging [get_cells w_reg_86_] 17
set_register_merging [get_cells w_reg_85_] 17
set_register_merging [get_cells w_reg_84_] 17
set_register_merging [get_cells w_reg_83_] 17
set_register_merging [get_cells w_reg_82_] 17
set_register_merging [get_cells w_reg_81_] 17
set_register_merging [get_cells w_reg_80_] 17
set_register_merging [get_cells w_reg_79_] 17
set_register_merging [get_cells w_reg_78_] 17
set_register_merging [get_cells w_reg_77_] 17
set_register_merging [get_cells w_reg_76_] 17
set_register_merging [get_cells w_reg_75_] 17
set_register_merging [get_cells w_reg_74_] 17
set_register_merging [get_cells w_reg_73_] 17
set_register_merging [get_cells w_reg_71_] 17
set_register_merging [get_cells w_reg_70_] 17
set_register_merging [get_cells w_reg_69_] 17
set_register_merging [get_cells w_reg_68_] 17
set_register_merging [get_cells w_reg_67_] 17
set_register_merging [get_cells w_reg_66_] 17
set_register_merging [get_cells w_reg_65_] 17
set_register_merging [get_cells w_reg_64_] 17
set_register_merging [get_cells w_reg_63_] 17
set_register_merging [get_cells w_reg_62_] 17
set_register_merging [get_cells w_reg_61_] 17
set_register_merging [get_cells w_reg_60_] 17
set_register_merging [get_cells w_reg_59_] 17
set_register_merging [get_cells w_reg_58_] 17
set_register_merging [get_cells w_reg_56_] 17
set_register_merging [get_cells w_reg_55_] 17
set_register_merging [get_cells w_reg_54_] 17
set_register_merging [get_cells w_reg_53_] 17
set_register_merging [get_cells w_reg_52_] 17
set_register_merging [get_cells w_reg_51_] 17
set_register_merging [get_cells w_reg_50_] 17
set_register_merging [get_cells w_reg_49_] 17
set_register_merging [get_cells w_reg_48_] 17
set_register_merging [get_cells w_reg_47_] 17
set_register_merging [get_cells w_reg_46_] 17
set_register_merging [get_cells w_reg_45_] 17
set_register_merging [get_cells w_reg_44_] 17
set_register_merging [get_cells w_reg_43_] 17
set_register_merging [get_cells w_reg_41_] 17
set_register_merging [get_cells w_reg_40_] 17
set_register_merging [get_cells w_reg_39_] 17
set_register_merging [get_cells w_reg_38_] 17
set_register_merging [get_cells w_reg_37_] 17
set_register_merging [get_cells w_reg_36_] 17
set_register_merging [get_cells w_reg_35_] 17
set_register_merging [get_cells w_reg_34_] 17
set_register_merging [get_cells w_reg_33_] 17
set_register_merging [get_cells w_reg_32_] 17
set_register_merging [get_cells w_reg_31_] 17
set_register_merging [get_cells w_reg_30_] 17
set_register_merging [get_cells w_reg_29_] 17
set_register_merging [get_cells w_reg_28_] 17
set_register_merging [get_cells w_reg_26_] 17
set_register_merging [get_cells w_reg_25_] 17
set_register_merging [get_cells w_reg_24_] 17
set_register_merging [get_cells w_reg_23_] 17
set_register_merging [get_cells w_reg_22_] 17
set_register_merging [get_cells w_reg_21_] 17
set_register_merging [get_cells w_reg_20_] 17
set_register_merging [get_cells w_reg_19_] 17
set_register_merging [get_cells w_reg_18_] 17
set_register_merging [get_cells w_reg_17_] 17
set_register_merging [get_cells w_reg_16_] 17
set_register_merging [get_cells w_reg_15_] 17
set_register_merging [get_cells w_reg_14_] 17
set_register_merging [get_cells w_reg_13_] 17
set_register_merging [get_cells w_reg_11_] 17
set_register_merging [get_cells w_reg_10_] 17
set_register_merging [get_cells w_reg_9_] 17
set_register_merging [get_cells w_reg_8_] 17
set_register_merging [get_cells w_reg_7_] 17
set_register_merging [get_cells w_reg_6_] 17
set_register_merging [get_cells w_reg_5_] 17
set_register_merging [get_cells w_reg_4_] 17
set_register_merging [get_cells w_reg_3_] 17
set_register_merging [get_cells w_reg_2_] 17
set_register_merging [get_cells w_reg_1_] 17
set_register_merging [get_cells w_reg_0_] 17
set_register_merging [get_cells weight_addr_reg_10_] 2
set_register_merging [get_cells weight_addr_reg_9_] 2
set_register_merging [get_cells weight_addr_reg_7_] 2
set_register_merging [get_cells weight_addr_reg_6_] 2
set_register_merging [get_cells weight_addr_reg_5_] 2
set_register_merging [get_cells weight_addr_reg_4_] 2
set_register_merging [get_cells weight_addr_reg_3_] 2
set_register_merging [get_cells weight_addr_reg_2_] 2
set_register_merging [get_cells weight_addr_reg_1_] 2
set_register_merging [get_cells weight_addr_reg_0_] 2
set_register_merging [get_cells ivalid_ff_4_reg] 17
set_register_merging [get_cells ivalid_ff_3_reg] 17
set_register_merging [get_cells ivalid_ff_1_reg] 17
set_register_merging [get_cells cnt_w_reg_8_] 2
set_register_merging [get_cells cnt_w_reg_7_] 2
set_register_merging [get_cells cnt_w_reg_5_] 2
set_register_merging [get_cells cnt_w_reg_4_] 2
set_register_merging [get_cells cnt_w_reg_3_] 2
set_register_merging [get_cells cnt_w_reg_2_] 2
set_register_merging [get_cells cnt_w_reg_0_] 2
set_register_merging [get_cells cnt_fc_reg_1_] 17
set_register_merging [get_cells cnt_fc_reg_2_] 17
set_register_merging [get_cells cnt_fc_reg_3_] 17
set_register_merging [get_cells cnt_fc_reg_4_] 17
set_register_merging [get_cells cnt_fc_reg_5_] 17
set_register_merging [get_cells cnt_fc_reg_6_] 17
set_register_merging [get_cells cnt_fc_reg_7_] 17
set_register_merging [get_cells cnt_fc_reg_8_] 17
set_register_merging [get_cells cnt_fc_reg_0_] 17
set_register_merging [get_cells dout_r_reg_15_] 17
set_register_merging [get_cells dout_r_reg_13_] 17
set_register_merging [get_cells dout_r_reg_11_] 17
set_register_merging [get_cells dout_r_reg_10_] 17
set_register_merging [get_cells dout_r_reg_8_] 17
set_register_merging [get_cells dout_r_reg_5_] 17
set_register_merging [get_cells ivalid_ff_2_reg] 17
set_register_merging [get_cells sum_reg_8_] 17
set_register_merging [get_cells sum21_reg_6_] 17
set_register_merging [get_cells sum12_reg_1_] 17
set_register_merging [get_cells sum00_reg_4_] 17
set_register_merging [get_cells sum04_reg_3_] 17
set_register_merging [get_cells p6_reg] 17
set_register_merging [get_cells w_reg_132_] 17
set_register_merging [get_cells w_reg_117_] 17
set_register_merging [get_cells w_reg_102_] 17
set_register_merging [get_cells w_reg_87_] 17
set_register_merging [get_cells w_reg_72_] 17
set_register_merging [get_cells w_reg_57_] 17
set_register_merging [get_cells w_reg_42_] 17
set_register_merging [get_cells w_reg_27_] 17
set_register_merging [get_cells w_reg_12_] 17
set_register_merging [get_cells weight_addr_reg_8_] 2
set_register_merging [get_cells cnt_w_reg_6_] 2
set_register_merging [get_cells cnt_w_reg_1_] 2
set_switching_activity -period 1 -toggle_rate 0.00020752 -static_probability   \
0.98262 [get_pins sum_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.00020752 -static_probability   \
0.98262 [get_pins sum_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.00020752 -static_probability   \
0.98262 [get_pins sum_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.00020752 -static_probability   \
0.98262 [get_pins sum_reg_4_/QN]
set_switching_activity -period 1 -toggle_rate 0.00020752 -static_probability   \
0.98262 [get_pins sum_reg_5_/QN]
set_switching_activity -period 1 -toggle_rate 0.00020752 -static_probability   \
0.98262 [get_pins sum_reg_6_/QN]
set_switching_activity -period 1 -toggle_rate 0.00020752 -static_probability   \
0.98262 [get_pins sum_reg_7_/QN]
set_switching_activity -period 1 -toggle_rate 0.000286865 -static_probability  \
0.980438 [get_pins sum21_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.000262451 -static_probability  \
0.981567 [get_pins sum21_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.000262451 -static_probability  \
0.981567 [get_pins sum21_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.000262451 -static_probability  \
0.981567 [get_pins sum21_reg_4_/QN]
set_switching_activity -period 1 -toggle_rate 0.000262451 -static_probability  \
0.981567 [get_pins sum21_reg_5_/QN]
set_switching_activity -period 1 -toggle_rate 6.71387e-05 -static_probability  \
0.00279236 [get_pins sum21_reg_7_/Q]
set_switching_activity -period 1 -toggle_rate 0.000262451 -static_probability  \
0.981491 [get_pins sum20_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.000219727 -static_probability  \
0.983429 [get_pins sum20_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.000201416 -static_probability  \
0.984039 [get_pins sum20_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.000201416 -static_probability  \
0.984039 [get_pins sum20_reg_4_/QN]
set_switching_activity -period 1 -toggle_rate 0.000201416 -static_probability  \
0.984039 [get_pins sum20_reg_5_/QN]
set_switching_activity -period 1 -toggle_rate 0.000201416 -static_probability  \
0.984039 [get_pins sum20_reg_6_/QN]
set_switching_activity -period 1 -toggle_rate 6.10352e-06 -static_probability  \
0.000320435 [get_pins sum20_reg_7_/Q]
set_switching_activity -period 1 -toggle_rate 0.000537109 -static_probability  \
0.968292 [get_pins sum10_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.000476074 -static_probability  \
0.971939 [get_pins sum10_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.000427246 -static_probability  \
0.973801 [get_pins sum10_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.000427246 -static_probability  \
0.973801 [get_pins sum10_reg_4_/QN]
set_switching_activity -period 1 -toggle_rate 0.000427246 -static_probability  \
0.973801 [get_pins sum10_reg_5_/QN]
set_switching_activity -period 1 -toggle_rate 0.000231934 -static_probability  \
0.0105591 [get_pins sum10_reg_6_/Q]
set_switching_activity -period 1 -toggle_rate 0.000457764 -static_probability  \
0.97197 [get_pins sum12_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.000421143 -static_probability  \
0.973801 [get_pins sum12_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.000421143 -static_probability  \
0.973801 [get_pins sum12_reg_4_/QN]
set_switching_activity -period 1 -toggle_rate 0.000421143 -static_probability  \
0.973801 [get_pins sum12_reg_5_/QN]
set_switching_activity -period 1 -toggle_rate 0.000421143 -static_probability  \
0.973801 [get_pins sum12_reg_6_/QN]
set_switching_activity -period 1 -toggle_rate 0.000463867 -static_probability  \
0.972031 [get_pins sum11_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.000408936 -static_probability  \
0.972443 [get_pins sum11_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.000384521 -static_probability  \
0.97435 [get_pins sum11_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.000384521 -static_probability  \
0.97435 [get_pins sum11_reg_4_/QN]
set_switching_activity -period 1 -toggle_rate 0.000384521 -static_probability  \
0.97435 [get_pins sum11_reg_5_/QN]
set_switching_activity -period 1 -toggle_rate 0.000189209 -static_probability  \
0.0100098 [get_pins sum11_reg_6_/Q]
set_switching_activity -period 1 -toggle_rate 0.00363159 -static_probability   \
0.730667 [get_pins sum00_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.00217896 -static_probability   \
0.864044 [get_pins sum00_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.00217896 -static_probability   \
0.864044 [get_pins sum00_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.00358887 -static_probability   \
0.735138 [get_pins sum05_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.00223999 -static_probability   \
0.851166 [get_pins sum05_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.00223999 -static_probability   \
0.851166 [get_pins sum05_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.00204468 -static_probability   \
0.133194 [get_pins sum05_reg_4_/Q]
set_switching_activity -period 1 -toggle_rate 0.00352783 -static_probability   \
0.741623 [get_pins sum02_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.00195923 -static_probability   \
0.87291 [get_pins sum02_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.00195923 -static_probability   \
0.87291 [get_pins sum02_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.00176392 -static_probability   \
0.11145 [get_pins sum02_reg_4_/Q]
set_switching_activity -period 1 -toggle_rate 0.00361938 -static_probability   \
0.739975 [get_pins sum01_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.00216675 -static_probability   \
0.85675 [get_pins sum01_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.00216675 -static_probability   \
0.85675 [get_pins sum01_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.00197144 -static_probability   \
0.127609 [get_pins sum01_reg_4_/Q]
set_switching_activity -period 1 -toggle_rate 0.00344849 -static_probability   \
0.746689 [get_pins sum04_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.00204468 -static_probability   \
0.860626 [get_pins sum04_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.00184937 -static_probability   \
0.123734 [get_pins sum04_reg_4_/Q]
set_switching_activity -period 1 -toggle_rate 0.00350952 -static_probability   \
0.736313 [get_pins sum03_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.0020813 -static_probability    \
0.861633 [get_pins sum03_reg_2_/QN]
set_switching_activity -period 1 -toggle_rate 0.0020813 -static_probability    \
0.861633 [get_pins sum03_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.00188599 -static_probability   \
0.122726 [get_pins sum03_reg_4_/Q]
set_switching_activity -period 1 -toggle_rate 0.00215454 -static_probability   \
0.441132 [get_pins p9_reg/QN]
set_switching_activity -period 1 -toggle_rate 0.0022522 -static_probability    \
0.458374 [get_pins p10_reg/QN]
set_switching_activity -period 1 -toggle_rate 0.00234375 -static_probability   \
0.532516 [get_pins p11_reg/QN]
set_switching_activity -period 1 -toggle_rate 0.00234985 -static_probability   \
0.475708 [get_pins p0_reg/QN]
set_switching_activity -period 1 -toggle_rate 0.00220947 -static_probability   \
0.453949 [get_pins p1_reg/QN]
set_switching_activity -period 1 -toggle_rate 0.00220337 -static_probability   \
0.432327 [get_pins p2_reg/QN]
set_switching_activity -period 1 -toggle_rate 0.00228882 -static_probability   \
0.492874 [get_pins p3_reg/QN]
set_switching_activity -period 1 -toggle_rate 0.00202637 -static_probability   \
0.484451 [get_pins p4_reg/QN]
set_switching_activity -period 1 -toggle_rate 0.00217285 -static_probability   \
0.467133 [get_pins p5_reg/QN]
set_switching_activity -period 1 -toggle_rate 0.0022583 -static_probability    \
0.45134 [get_pins p7_reg/QN]
set_switching_activity -period 1 -toggle_rate 0.00222778 -static_probability   \
0.466766 [get_pins p8_reg/QN]
set_switching_activity -period 1 -toggle_rate 0.000262451 -static_probability  \
0.981567 [get_pins sum21_reg_6_/QN]
set_switching_activity -period 1 -toggle_rate 0.000512695 -static_probability  \
0.968735 [get_pins sum12_reg_1_/QN]
set_switching_activity -period 1 -toggle_rate 0.00198364 -static_probability   \
0.120316 [get_pins sum00_reg_4_/Q]
set_switching_activity -period 1 -toggle_rate 0.00204468 -static_probability   \
0.860626 [get_pins sum04_reg_3_/QN]
set_switching_activity -period 1 -toggle_rate 0.00222168 -static_probability   \
0.517761 [get_pins p6_reg/QN]
set_ideal_network -no_propagate  [get_ports clk]
set_ideal_network -no_propagate  [get_ports weight]
set_ideal_network -no_propagate  [get_pins weight_addr_reg_7_/Q]
create_clock -name clk  -period 5  -waveform {0 2.5}
set_clock_uncertainty -setup 0.4  [get_clocks clk]
set_clock_uncertainty -hold 0.2  [get_clocks clk]
set_clock_gating_check -rise -setup 0.4 [get_clocks clk]
set_clock_gating_check -fall -setup 0.4 [get_clocks clk]
set_clock_gating_check -rise -hold 0.2 [get_clocks clk]
set_clock_gating_check -fall -hold 0.2 [get_clocks clk]
group_path -weight 5  -name reg2reg  -from [list [get_pins osign_reg/CK]       \
[get_pins dout_r_reg_1_/CK] [get_pins dout_r_reg_2_/CK] [get_pins              \
dout_r_reg_3_/CK] [get_pins dout_r_reg_4_/CK] [get_pins dout_r_reg_5_/CK]      \
[get_pins dout_r_reg_6_/CK] [get_pins dout_r_reg_7_/CK] [get_pins              \
dout_r_reg_8_/CK] [get_pins dout_r_reg_9_/CK] [get_pins dout_r_reg_10_/CK]     \
[get_pins dout_r_reg_11_/CK] [get_pins dout_r_reg_12_/CK] [get_pins            \
dout_r_reg_13_/CK] [get_pins dout_r_reg_14_/CK] [get_pins dout_r_reg_15_/CK]   \
[get_pins sum_reg_1_/CK] [get_pins sum_reg_2_/CK] [get_pins sum_reg_3_/CK]     \
[get_pins sum_reg_4_/CK] [get_pins sum_reg_5_/CK] [get_pins sum_reg_6_/CK]     \
[get_pins sum_reg_7_/CK] [get_pins sum_reg_8_/CK] [get_pins sum21_reg_1_/CK]   \
[get_pins sum21_reg_2_/CK] [get_pins sum21_reg_3_/CK] [get_pins                \
sum21_reg_4_/CK] [get_pins sum21_reg_5_/CK] [get_pins sum21_reg_6_/CK]         \
[get_pins sum21_reg_7_/CK] [get_pins sum20_reg_1_/CK] [get_pins                \
sum20_reg_2_/CK] [get_pins sum20_reg_3_/CK] [get_pins sum20_reg_4_/CK]         \
[get_pins sum20_reg_5_/CK] [get_pins sum20_reg_6_/CK] [get_pins                \
sum20_reg_7_/CK] [get_pins sum10_reg_1_/CK] [get_pins sum10_reg_2_/CK]         \
[get_pins sum10_reg_3_/CK] [get_pins sum10_reg_4_/CK] [get_pins                \
sum10_reg_5_/CK] [get_pins sum10_reg_6_/CK] [get_pins sum12_reg_1_/CK]         \
[get_pins sum12_reg_2_/CK] [get_pins sum12_reg_3_/CK] [get_pins                \
sum12_reg_4_/CK] [get_pins sum12_reg_5_/CK] [get_pins sum12_reg_6_/CK]         \
[get_pins sum11_reg_1_/CK] [get_pins sum11_reg_2_/CK] [get_pins                \
sum11_reg_3_/CK] [get_pins sum11_reg_4_/CK] [get_pins sum11_reg_5_/CK]         \
[get_pins sum11_reg_6_/CK] [get_pins sum00_reg_1_/CK] [get_pins                \
sum00_reg_2_/CK] [get_pins sum00_reg_3_/CK] [get_pins sum00_reg_4_/CK]         \
[get_pins sum05_reg_1_/CK] [get_pins sum05_reg_2_/CK] [get_pins                \
sum05_reg_3_/CK] [get_pins sum05_reg_4_/CK] [get_pins sum02_reg_1_/CK]         \
[get_pins sum02_reg_2_/CK] [get_pins sum02_reg_3_/CK] [get_pins                \
sum02_reg_4_/CK] [get_pins sum01_reg_1_/CK] [get_pins sum01_reg_2_/CK]         \
[get_pins sum01_reg_3_/CK] [get_pins sum01_reg_4_/CK] [get_pins                \
sum04_reg_1_/CK] [get_pins sum04_reg_2_/CK] [get_pins sum04_reg_3_/CK]         \
[get_pins sum04_reg_4_/CK] [get_pins sum03_reg_1_/CK] [get_pins                \
sum03_reg_2_/CK] [get_pins sum03_reg_3_/CK] [get_pins sum03_reg_4_/CK]         \
[get_pins p9_reg/CK] [get_pins p10_reg/CK] [get_pins p11_reg/CK] [get_pins     \
p0_reg/CK] [get_pins p1_reg/CK] [get_pins p2_reg/CK] [get_pins p3_reg/CK]      \
[get_pins p4_reg/CK] [get_pins p5_reg/CK] [get_pins p6_reg/CK] [get_pins       \
p7_reg/CK] [get_pins p8_reg/CK] [get_pins csign_reg/CK] [get_pins              \
w_reg_143_/CK] [get_pins w_reg_142_/CK] [get_pins w_reg_141_/CK] [get_pins     \
w_reg_140_/CK] [get_pins w_reg_139_/CK] [get_pins w_reg_138_/CK] [get_pins     \
w_reg_137_/CK] [get_pins w_reg_136_/CK] [get_pins w_reg_135_/CK] [get_pins     \
w_reg_134_/CK] [get_pins w_reg_133_/CK] [get_pins w_reg_132_/CK] [get_pins     \
w_reg_131_/CK] [get_pins w_reg_130_/CK] [get_pins w_reg_129_/CK] [get_pins     \
w_reg_128_/CK] [get_pins w_reg_127_/CK] [get_pins w_reg_126_/CK] [get_pins     \
w_reg_125_/CK] [get_pins w_reg_124_/CK] [get_pins w_reg_123_/CK] [get_pins     \
w_reg_122_/CK] [get_pins w_reg_121_/CK] [get_pins w_reg_120_/CK] [get_pins     \
w_reg_119_/CK] [get_pins w_reg_118_/CK] [get_pins w_reg_117_/CK] [get_pins     \
w_reg_116_/CK] [get_pins w_reg_115_/CK] [get_pins w_reg_114_/CK] [get_pins     \
w_reg_113_/CK] [get_pins w_reg_112_/CK] [get_pins w_reg_111_/CK] [get_pins     \
w_reg_110_/CK] [get_pins w_reg_109_/CK] [get_pins w_reg_108_/CK] [get_pins     \
w_reg_107_/CK] [get_pins w_reg_106_/CK] [get_pins w_reg_105_/CK] [get_pins     \
w_reg_104_/CK] [get_pins w_reg_103_/CK] [get_pins w_reg_102_/CK] [get_pins     \
w_reg_101_/CK] [get_pins w_reg_100_/CK] [get_pins w_reg_99_/CK] [get_pins      \
w_reg_98_/CK] [get_pins w_reg_97_/CK] [get_pins w_reg_96_/CK] [get_pins        \
w_reg_95_/CK] [get_pins w_reg_94_/CK] [get_pins w_reg_93_/CK] [get_pins        \
w_reg_92_/CK] [get_pins w_reg_91_/CK] [get_pins w_reg_90_/CK] [get_pins        \
w_reg_89_/CK] [get_pins w_reg_88_/CK] [get_pins w_reg_87_/CK] [get_pins        \
w_reg_86_/CK] [get_pins w_reg_85_/CK] [get_pins w_reg_84_/CK] [get_pins        \
w_reg_83_/CK] [get_pins w_reg_82_/CK] [get_pins w_reg_81_/CK] [get_pins        \
w_reg_80_/CK] [get_pins w_reg_79_/CK] [get_pins w_reg_78_/CK] [get_pins        \
w_reg_77_/CK] [get_pins w_reg_76_/CK] [get_pins w_reg_75_/CK] [get_pins        \
w_reg_74_/CK] [get_pins w_reg_73_/CK] [get_pins w_reg_72_/CK] [get_pins        \
w_reg_71_/CK] [get_pins w_reg_70_/CK] [get_pins w_reg_69_/CK] [get_pins        \
w_reg_68_/CK] [get_pins w_reg_67_/CK] [get_pins w_reg_66_/CK] [get_pins        \
w_reg_65_/CK] [get_pins w_reg_64_/CK] [get_pins w_reg_63_/CK] [get_pins        \
w_reg_62_/CK] [get_pins w_reg_61_/CK] [get_pins w_reg_60_/CK] [get_pins        \
w_reg_59_/CK] [get_pins w_reg_58_/CK] [get_pins w_reg_57_/CK] [get_pins        \
w_reg_56_/CK] [get_pins w_reg_55_/CK] [get_pins w_reg_54_/CK] [get_pins        \
w_reg_53_/CK] [get_pins w_reg_52_/CK] [get_pins w_reg_51_/CK] [get_pins        \
w_reg_50_/CK] [get_pins w_reg_49_/CK] [get_pins w_reg_48_/CK] [get_pins        \
w_reg_47_/CK] [get_pins w_reg_46_/CK] [get_pins w_reg_45_/CK] [get_pins        \
w_reg_44_/CK] [get_pins w_reg_43_/CK] [get_pins w_reg_42_/CK] [get_pins        \
w_reg_41_/CK] [get_pins w_reg_40_/CK] [get_pins w_reg_39_/CK] [get_pins        \
w_reg_38_/CK] [get_pins w_reg_37_/CK] [get_pins w_reg_36_/CK] [get_pins        \
w_reg_35_/CK] [get_pins w_reg_34_/CK] [get_pins w_reg_33_/CK] [get_pins        \
w_reg_32_/CK] [get_pins w_reg_31_/CK] [get_pins w_reg_30_/CK] [get_pins        \
w_reg_29_/CK] [get_pins w_reg_28_/CK] [get_pins w_reg_27_/CK] [get_pins        \
w_reg_26_/CK] [get_pins w_reg_25_/CK] [get_pins w_reg_24_/CK] [get_pins        \
w_reg_23_/CK] [get_pins w_reg_22_/CK] [get_pins w_reg_21_/CK] [get_pins        \
w_reg_20_/CK] [get_pins w_reg_19_/CK] [get_pins w_reg_18_/CK] [get_pins        \
w_reg_17_/CK] [get_pins w_reg_16_/CK] [get_pins w_reg_15_/CK] [get_pins        \
w_reg_14_/CK] [get_pins w_reg_13_/CK] [get_pins w_reg_12_/CK] [get_pins        \
w_reg_11_/CK] [get_pins w_reg_10_/CK] [get_pins w_reg_9_/CK] [get_pins         \
w_reg_8_/CK] [get_pins w_reg_7_/CK] [get_pins w_reg_6_/CK] [get_pins           \
w_reg_5_/CK] [get_pins w_reg_4_/CK] [get_pins w_reg_3_/CK] [get_pins           \
w_reg_2_/CK] [get_pins w_reg_1_/CK] [get_pins w_reg_0_/CK] [get_pins           \
weight_addr_reg_0_/CK] [get_pins weight_addr_reg_1_/CK] [get_pins              \
weight_addr_reg_2_/CK] [get_pins weight_addr_reg_3_/CK] [get_pins              \
weight_addr_reg_4_/CK] [get_pins weight_addr_reg_5_/CK] [get_pins              \
weight_addr_reg_6_/CK] [get_pins weight_addr_reg_7_/CK] [get_pins              \
weight_addr_reg_8_/CK] [get_pins weight_addr_reg_9_/CK] [get_pins              \
weight_addr_reg_10_/CK] [get_pins ivalid_ff_2_reg/CK] [get_pins                \
ivalid_ff_3_reg/CK] [get_pins ivalid_ff_4_reg/CK] [get_pins                    \
ivalid_ff_0_reg/CK] [get_pins ivalid_ff_1_reg/CK] [get_pins cnt_w_reg_0_/CK]   \
[get_pins cnt_w_reg_1_/CK] [get_pins cnt_w_reg_2_/CK] [get_pins                \
cnt_w_reg_3_/CK] [get_pins cnt_w_reg_4_/CK] [get_pins cnt_w_reg_5_/CK]         \
[get_pins cnt_w_reg_6_/CK] [get_pins cnt_w_reg_7_/CK] [get_pins                \
cnt_w_reg_8_/CK] [get_pins cnt_fc_reg_0_/CK] [get_pins cnt_fc_reg_1_/CK]       \
[get_pins cnt_fc_reg_2_/CK] [get_pins cnt_fc_reg_3_/CK] [get_pins              \
cnt_fc_reg_4_/CK] [get_pins cnt_fc_reg_5_/CK] [get_pins cnt_fc_reg_6_/CK]      \
[get_pins cnt_fc_reg_7_/CK] [get_pins cnt_fc_reg_8_/CK]]  -to [list [get_pins  \
osign_reg/D] [get_pins dout_r_reg_1_/D] [get_pins dout_r_reg_2_/D] [get_pins   \
dout_r_reg_3_/D] [get_pins dout_r_reg_4_/D] [get_pins dout_r_reg_5_/D]         \
[get_pins dout_r_reg_6_/D] [get_pins dout_r_reg_7_/D] [get_pins                \
dout_r_reg_8_/D] [get_pins dout_r_reg_9_/D] [get_pins dout_r_reg_10_/D]        \
[get_pins dout_r_reg_11_/D] [get_pins dout_r_reg_12_/D] [get_pins              \
dout_r_reg_13_/D] [get_pins dout_r_reg_14_/D] [get_pins dout_r_reg_15_/D]      \
[get_pins sum_reg_1_/D] [get_pins sum_reg_2_/D] [get_pins sum_reg_3_/D]        \
[get_pins sum_reg_4_/D] [get_pins sum_reg_5_/D] [get_pins sum_reg_6_/D]        \
[get_pins sum_reg_7_/D] [get_pins sum_reg_8_/D] [get_pins sum21_reg_1_/D]      \
[get_pins sum21_reg_2_/D] [get_pins sum21_reg_3_/D] [get_pins sum21_reg_4_/D]  \
[get_pins sum21_reg_5_/D] [get_pins sum21_reg_6_/D] [get_pins sum21_reg_7_/D]  \
[get_pins sum20_reg_1_/D] [get_pins sum20_reg_2_/D] [get_pins sum20_reg_3_/D]  \
[get_pins sum20_reg_4_/D] [get_pins sum20_reg_5_/D] [get_pins sum20_reg_6_/D]  \
[get_pins sum20_reg_7_/D] [get_pins sum10_reg_1_/D] [get_pins sum10_reg_2_/D]  \
[get_pins sum10_reg_3_/D] [get_pins sum10_reg_4_/D] [get_pins sum10_reg_5_/D]  \
[get_pins sum10_reg_6_/D] [get_pins sum12_reg_1_/D] [get_pins sum12_reg_2_/D]  \
[get_pins sum12_reg_3_/D] [get_pins sum12_reg_4_/D] [get_pins sum12_reg_5_/D]  \
[get_pins sum12_reg_6_/D] [get_pins sum11_reg_1_/D] [get_pins sum11_reg_2_/D]  \
[get_pins sum11_reg_3_/D] [get_pins sum11_reg_4_/D] [get_pins sum11_reg_5_/D]  \
[get_pins sum11_reg_6_/D] [get_pins sum00_reg_1_/D] [get_pins sum00_reg_2_/D]  \
[get_pins sum00_reg_3_/D] [get_pins sum00_reg_4_/D] [get_pins sum05_reg_1_/D]  \
[get_pins sum05_reg_2_/D] [get_pins sum05_reg_3_/D] [get_pins sum05_reg_4_/D]  \
[get_pins sum02_reg_1_/D] [get_pins sum02_reg_2_/D] [get_pins sum02_reg_3_/D]  \
[get_pins sum02_reg_4_/D] [get_pins sum01_reg_1_/D] [get_pins sum01_reg_2_/D]  \
[get_pins sum01_reg_3_/D] [get_pins sum01_reg_4_/D] [get_pins sum04_reg_1_/D]  \
[get_pins sum04_reg_2_/D] [get_pins sum04_reg_3_/D] [get_pins sum04_reg_4_/D]  \
[get_pins sum03_reg_1_/D] [get_pins sum03_reg_2_/D] [get_pins sum03_reg_3_/D]  \
[get_pins sum03_reg_4_/D] [get_pins p9_reg/D] [get_pins p10_reg/D] [get_pins   \
p11_reg/D] [get_pins p0_reg/D] [get_pins p1_reg/D] [get_pins p2_reg/D]         \
[get_pins p3_reg/D] [get_pins p4_reg/D] [get_pins p5_reg/D] [get_pins          \
p6_reg/D] [get_pins p7_reg/D] [get_pins p8_reg/D] [get_pins csign_reg/D]       \
[get_pins w_reg_143_/D] [get_pins w_reg_142_/D] [get_pins w_reg_141_/D]        \
[get_pins w_reg_140_/D] [get_pins w_reg_139_/D] [get_pins w_reg_138_/D]        \
[get_pins w_reg_137_/D] [get_pins w_reg_136_/D] [get_pins w_reg_135_/D]        \
[get_pins w_reg_134_/D] [get_pins w_reg_133_/D] [get_pins w_reg_132_/D]        \
[get_pins w_reg_131_/D] [get_pins w_reg_130_/D] [get_pins w_reg_129_/D]        \
[get_pins w_reg_128_/D] [get_pins w_reg_127_/D] [get_pins w_reg_126_/D]        \
[get_pins w_reg_125_/D] [get_pins w_reg_124_/D] [get_pins w_reg_123_/D]        \
[get_pins w_reg_122_/D] [get_pins w_reg_121_/D] [get_pins w_reg_120_/D]        \
[get_pins w_reg_119_/D] [get_pins w_reg_118_/D] [get_pins w_reg_117_/D]        \
[get_pins w_reg_116_/D] [get_pins w_reg_115_/D] [get_pins w_reg_114_/D]        \
[get_pins w_reg_113_/D] [get_pins w_reg_112_/D] [get_pins w_reg_111_/D]        \
[get_pins w_reg_110_/D] [get_pins w_reg_109_/D] [get_pins w_reg_108_/D]        \
[get_pins w_reg_107_/D] [get_pins w_reg_106_/D] [get_pins w_reg_105_/D]        \
[get_pins w_reg_104_/D] [get_pins w_reg_103_/D] [get_pins w_reg_102_/D]        \
[get_pins w_reg_101_/D] [get_pins w_reg_100_/D] [get_pins w_reg_99_/D]         \
[get_pins w_reg_98_/D] [get_pins w_reg_97_/D] [get_pins w_reg_96_/D] [get_pins \
w_reg_95_/D] [get_pins w_reg_94_/D] [get_pins w_reg_93_/D] [get_pins           \
w_reg_92_/D] [get_pins w_reg_91_/D] [get_pins w_reg_90_/D] [get_pins           \
w_reg_89_/D] [get_pins w_reg_88_/D] [get_pins w_reg_87_/D] [get_pins           \
w_reg_86_/D] [get_pins w_reg_85_/D] [get_pins w_reg_84_/D] [get_pins           \
w_reg_83_/D] [get_pins w_reg_82_/D] [get_pins w_reg_81_/D] [get_pins           \
w_reg_80_/D] [get_pins w_reg_79_/D] [get_pins w_reg_78_/D] [get_pins           \
w_reg_77_/D] [get_pins w_reg_76_/D] [get_pins w_reg_75_/D] [get_pins           \
w_reg_74_/D] [get_pins w_reg_73_/D] [get_pins w_reg_72_/D] [get_pins           \
w_reg_71_/D] [get_pins w_reg_70_/D] [get_pins w_reg_69_/D] [get_pins           \
w_reg_68_/D] [get_pins w_reg_67_/D] [get_pins w_reg_66_/D] [get_pins           \
w_reg_65_/D] [get_pins w_reg_64_/D] [get_pins w_reg_63_/D] [get_pins           \
w_reg_62_/D] [get_pins w_reg_61_/D] [get_pins w_reg_60_/D] [get_pins           \
w_reg_59_/D] [get_pins w_reg_58_/D] [get_pins w_reg_57_/D] [get_pins           \
w_reg_56_/D] [get_pins w_reg_55_/D] [get_pins w_reg_54_/D] [get_pins           \
w_reg_53_/D] [get_pins w_reg_52_/D] [get_pins w_reg_51_/D] [get_pins           \
w_reg_50_/D] [get_pins w_reg_49_/D] [get_pins w_reg_48_/D] [get_pins           \
w_reg_47_/D] [get_pins w_reg_46_/D] [get_pins w_reg_45_/D] [get_pins           \
w_reg_44_/D] [get_pins w_reg_43_/D] [get_pins w_reg_42_/D] [get_pins           \
w_reg_41_/D] [get_pins w_reg_40_/D] [get_pins w_reg_39_/D] [get_pins           \
w_reg_38_/D] [get_pins w_reg_37_/D] [get_pins w_reg_36_/D] [get_pins           \
w_reg_35_/D] [get_pins w_reg_34_/D] [get_pins w_reg_33_/D] [get_pins           \
w_reg_32_/D] [get_pins w_reg_31_/D] [get_pins w_reg_30_/D] [get_pins           \
w_reg_29_/D] [get_pins w_reg_28_/D] [get_pins w_reg_27_/D] [get_pins           \
w_reg_26_/D] [get_pins w_reg_25_/D] [get_pins w_reg_24_/D] [get_pins           \
w_reg_23_/D] [get_pins w_reg_22_/D] [get_pins w_reg_21_/D] [get_pins           \
w_reg_20_/D] [get_pins w_reg_19_/D] [get_pins w_reg_18_/D] [get_pins           \
w_reg_17_/D] [get_pins w_reg_16_/D] [get_pins w_reg_15_/D] [get_pins           \
w_reg_14_/D] [get_pins w_reg_13_/D] [get_pins w_reg_12_/D] [get_pins           \
w_reg_11_/D] [get_pins w_reg_10_/D] [get_pins w_reg_9_/D] [get_pins            \
w_reg_8_/D] [get_pins w_reg_7_/D] [get_pins w_reg_6_/D] [get_pins w_reg_5_/D]  \
[get_pins w_reg_4_/D] [get_pins w_reg_3_/D] [get_pins w_reg_2_/D] [get_pins    \
w_reg_1_/D] [get_pins w_reg_0_/D] [get_pins weight_addr_reg_0_/D] [get_pins    \
weight_addr_reg_1_/D] [get_pins weight_addr_reg_2_/D] [get_pins                \
weight_addr_reg_3_/D] [get_pins weight_addr_reg_4_/D] [get_pins                \
weight_addr_reg_5_/D] [get_pins weight_addr_reg_6_/D] [get_pins                \
weight_addr_reg_7_/D] [get_pins weight_addr_reg_8_/D] [get_pins                \
weight_addr_reg_9_/D] [get_pins weight_addr_reg_10_/D] [get_pins               \
ivalid_ff_2_reg/D] [get_pins ivalid_ff_3_reg/D] [get_pins ivalid_ff_4_reg/D]   \
[get_pins ivalid_ff_0_reg/D] [get_pins ivalid_ff_1_reg/D] [get_pins            \
cnt_w_reg_0_/D] [get_pins cnt_w_reg_1_/D] [get_pins cnt_w_reg_2_/D] [get_pins  \
cnt_w_reg_3_/D] [get_pins cnt_w_reg_4_/D] [get_pins cnt_w_reg_5_/D] [get_pins  \
cnt_w_reg_6_/D] [get_pins cnt_w_reg_7_/D] [get_pins cnt_w_reg_8_/D] [get_pins  \
cnt_fc_reg_0_/D] [get_pins cnt_fc_reg_1_/D] [get_pins cnt_fc_reg_2_/D]         \
[get_pins cnt_fc_reg_3_/D] [get_pins cnt_fc_reg_4_/D] [get_pins                \
cnt_fc_reg_5_/D] [get_pins cnt_fc_reg_6_/D] [get_pins cnt_fc_reg_7_/D]         \
[get_pins cnt_fc_reg_8_/D]]
group_path -weight 3  -name in2reg  -from [list [get_ports clk] [get_ports     \
rstn] [get_ports ivalid] [get_ports din_0] [get_ports din_1] [get_ports din_2] \
[get_ports din_3] [get_ports din_4] [get_ports din_5] [get_ports din_6]        \
[get_ports din_7] [get_ports din_8] [get_ports din_9] [get_ports din_10]       \
[get_ports din_11] [get_ports weight] [get_ports weight_en]]  -to [list        \
[get_pins osign_reg/D] [get_pins dout_r_reg_1_/D] [get_pins dout_r_reg_2_/D]   \
[get_pins dout_r_reg_3_/D] [get_pins dout_r_reg_4_/D] [get_pins                \
dout_r_reg_5_/D] [get_pins dout_r_reg_6_/D] [get_pins dout_r_reg_7_/D]         \
[get_pins dout_r_reg_8_/D] [get_pins dout_r_reg_9_/D] [get_pins                \
dout_r_reg_10_/D] [get_pins dout_r_reg_11_/D] [get_pins dout_r_reg_12_/D]      \
[get_pins dout_r_reg_13_/D] [get_pins dout_r_reg_14_/D] [get_pins              \
dout_r_reg_15_/D] [get_pins sum_reg_1_/D] [get_pins sum_reg_2_/D] [get_pins    \
sum_reg_3_/D] [get_pins sum_reg_4_/D] [get_pins sum_reg_5_/D] [get_pins        \
sum_reg_6_/D] [get_pins sum_reg_7_/D] [get_pins sum_reg_8_/D] [get_pins        \
sum21_reg_1_/D] [get_pins sum21_reg_2_/D] [get_pins sum21_reg_3_/D] [get_pins  \
sum21_reg_4_/D] [get_pins sum21_reg_5_/D] [get_pins sum21_reg_6_/D] [get_pins  \
sum21_reg_7_/D] [get_pins sum20_reg_1_/D] [get_pins sum20_reg_2_/D] [get_pins  \
sum20_reg_3_/D] [get_pins sum20_reg_4_/D] [get_pins sum20_reg_5_/D] [get_pins  \
sum20_reg_6_/D] [get_pins sum20_reg_7_/D] [get_pins sum10_reg_1_/D] [get_pins  \
sum10_reg_2_/D] [get_pins sum10_reg_3_/D] [get_pins sum10_reg_4_/D] [get_pins  \
sum10_reg_5_/D] [get_pins sum10_reg_6_/D] [get_pins sum12_reg_1_/D] [get_pins  \
sum12_reg_2_/D] [get_pins sum12_reg_3_/D] [get_pins sum12_reg_4_/D] [get_pins  \
sum12_reg_5_/D] [get_pins sum12_reg_6_/D] [get_pins sum11_reg_1_/D] [get_pins  \
sum11_reg_2_/D] [get_pins sum11_reg_3_/D] [get_pins sum11_reg_4_/D] [get_pins  \
sum11_reg_5_/D] [get_pins sum11_reg_6_/D] [get_pins sum00_reg_1_/D] [get_pins  \
sum00_reg_2_/D] [get_pins sum00_reg_3_/D] [get_pins sum00_reg_4_/D] [get_pins  \
sum05_reg_1_/D] [get_pins sum05_reg_2_/D] [get_pins sum05_reg_3_/D] [get_pins  \
sum05_reg_4_/D] [get_pins sum02_reg_1_/D] [get_pins sum02_reg_2_/D] [get_pins  \
sum02_reg_3_/D] [get_pins sum02_reg_4_/D] [get_pins sum01_reg_1_/D] [get_pins  \
sum01_reg_2_/D] [get_pins sum01_reg_3_/D] [get_pins sum01_reg_4_/D] [get_pins  \
sum04_reg_1_/D] [get_pins sum04_reg_2_/D] [get_pins sum04_reg_3_/D] [get_pins  \
sum04_reg_4_/D] [get_pins sum03_reg_1_/D] [get_pins sum03_reg_2_/D] [get_pins  \
sum03_reg_3_/D] [get_pins sum03_reg_4_/D] [get_pins p9_reg/D] [get_pins        \
p10_reg/D] [get_pins p11_reg/D] [get_pins p0_reg/D] [get_pins p1_reg/D]        \
[get_pins p2_reg/D] [get_pins p3_reg/D] [get_pins p4_reg/D] [get_pins          \
p5_reg/D] [get_pins p6_reg/D] [get_pins p7_reg/D] [get_pins p8_reg/D]          \
[get_pins csign_reg/D] [get_pins w_reg_143_/D] [get_pins w_reg_142_/D]         \
[get_pins w_reg_141_/D] [get_pins w_reg_140_/D] [get_pins w_reg_139_/D]        \
[get_pins w_reg_138_/D] [get_pins w_reg_137_/D] [get_pins w_reg_136_/D]        \
[get_pins w_reg_135_/D] [get_pins w_reg_134_/D] [get_pins w_reg_133_/D]        \
[get_pins w_reg_132_/D] [get_pins w_reg_131_/D] [get_pins w_reg_130_/D]        \
[get_pins w_reg_129_/D] [get_pins w_reg_128_/D] [get_pins w_reg_127_/D]        \
[get_pins w_reg_126_/D] [get_pins w_reg_125_/D] [get_pins w_reg_124_/D]        \
[get_pins w_reg_123_/D] [get_pins w_reg_122_/D] [get_pins w_reg_121_/D]        \
[get_pins w_reg_120_/D] [get_pins w_reg_119_/D] [get_pins w_reg_118_/D]        \
[get_pins w_reg_117_/D] [get_pins w_reg_116_/D] [get_pins w_reg_115_/D]        \
[get_pins w_reg_114_/D] [get_pins w_reg_113_/D] [get_pins w_reg_112_/D]        \
[get_pins w_reg_111_/D] [get_pins w_reg_110_/D] [get_pins w_reg_109_/D]        \
[get_pins w_reg_108_/D] [get_pins w_reg_107_/D] [get_pins w_reg_106_/D]        \
[get_pins w_reg_105_/D] [get_pins w_reg_104_/D] [get_pins w_reg_103_/D]        \
[get_pins w_reg_102_/D] [get_pins w_reg_101_/D] [get_pins w_reg_100_/D]        \
[get_pins w_reg_99_/D] [get_pins w_reg_98_/D] [get_pins w_reg_97_/D] [get_pins \
w_reg_96_/D] [get_pins w_reg_95_/D] [get_pins w_reg_94_/D] [get_pins           \
w_reg_93_/D] [get_pins w_reg_92_/D] [get_pins w_reg_91_/D] [get_pins           \
w_reg_90_/D] [get_pins w_reg_89_/D] [get_pins w_reg_88_/D] [get_pins           \
w_reg_87_/D] [get_pins w_reg_86_/D] [get_pins w_reg_85_/D] [get_pins           \
w_reg_84_/D] [get_pins w_reg_83_/D] [get_pins w_reg_82_/D] [get_pins           \
w_reg_81_/D] [get_pins w_reg_80_/D] [get_pins w_reg_79_/D] [get_pins           \
w_reg_78_/D] [get_pins w_reg_77_/D] [get_pins w_reg_76_/D] [get_pins           \
w_reg_75_/D] [get_pins w_reg_74_/D] [get_pins w_reg_73_/D] [get_pins           \
w_reg_72_/D] [get_pins w_reg_71_/D] [get_pins w_reg_70_/D] [get_pins           \
w_reg_69_/D] [get_pins w_reg_68_/D] [get_pins w_reg_67_/D] [get_pins           \
w_reg_66_/D] [get_pins w_reg_65_/D] [get_pins w_reg_64_/D] [get_pins           \
w_reg_63_/D] [get_pins w_reg_62_/D] [get_pins w_reg_61_/D] [get_pins           \
w_reg_60_/D] [get_pins w_reg_59_/D] [get_pins w_reg_58_/D] [get_pins           \
w_reg_57_/D] [get_pins w_reg_56_/D] [get_pins w_reg_55_/D] [get_pins           \
w_reg_54_/D] [get_pins w_reg_53_/D] [get_pins w_reg_52_/D] [get_pins           \
w_reg_51_/D] [get_pins w_reg_50_/D] [get_pins w_reg_49_/D] [get_pins           \
w_reg_48_/D] [get_pins w_reg_47_/D] [get_pins w_reg_46_/D] [get_pins           \
w_reg_45_/D] [get_pins w_reg_44_/D] [get_pins w_reg_43_/D] [get_pins           \
w_reg_42_/D] [get_pins w_reg_41_/D] [get_pins w_reg_40_/D] [get_pins           \
w_reg_39_/D] [get_pins w_reg_38_/D] [get_pins w_reg_37_/D] [get_pins           \
w_reg_36_/D] [get_pins w_reg_35_/D] [get_pins w_reg_34_/D] [get_pins           \
w_reg_33_/D] [get_pins w_reg_32_/D] [get_pins w_reg_31_/D] [get_pins           \
w_reg_30_/D] [get_pins w_reg_29_/D] [get_pins w_reg_28_/D] [get_pins           \
w_reg_27_/D] [get_pins w_reg_26_/D] [get_pins w_reg_25_/D] [get_pins           \
w_reg_24_/D] [get_pins w_reg_23_/D] [get_pins w_reg_22_/D] [get_pins           \
w_reg_21_/D] [get_pins w_reg_20_/D] [get_pins w_reg_19_/D] [get_pins           \
w_reg_18_/D] [get_pins w_reg_17_/D] [get_pins w_reg_16_/D] [get_pins           \
w_reg_15_/D] [get_pins w_reg_14_/D] [get_pins w_reg_13_/D] [get_pins           \
w_reg_12_/D] [get_pins w_reg_11_/D] [get_pins w_reg_10_/D] [get_pins           \
w_reg_9_/D] [get_pins w_reg_8_/D] [get_pins w_reg_7_/D] [get_pins w_reg_6_/D]  \
[get_pins w_reg_5_/D] [get_pins w_reg_4_/D] [get_pins w_reg_3_/D] [get_pins    \
w_reg_2_/D] [get_pins w_reg_1_/D] [get_pins w_reg_0_/D] [get_pins              \
weight_addr_reg_0_/D] [get_pins weight_addr_reg_1_/D] [get_pins                \
weight_addr_reg_2_/D] [get_pins weight_addr_reg_3_/D] [get_pins                \
weight_addr_reg_4_/D] [get_pins weight_addr_reg_5_/D] [get_pins                \
weight_addr_reg_6_/D] [get_pins weight_addr_reg_7_/D] [get_pins                \
weight_addr_reg_8_/D] [get_pins weight_addr_reg_9_/D] [get_pins                \
weight_addr_reg_10_/D] [get_pins ivalid_ff_2_reg/D] [get_pins                  \
ivalid_ff_3_reg/D] [get_pins ivalid_ff_4_reg/D] [get_pins ivalid_ff_0_reg/D]   \
[get_pins ivalid_ff_1_reg/D] [get_pins cnt_w_reg_0_/D] [get_pins               \
cnt_w_reg_1_/D] [get_pins cnt_w_reg_2_/D] [get_pins cnt_w_reg_3_/D] [get_pins  \
cnt_w_reg_4_/D] [get_pins cnt_w_reg_5_/D] [get_pins cnt_w_reg_6_/D] [get_pins  \
cnt_w_reg_7_/D] [get_pins cnt_w_reg_8_/D] [get_pins cnt_fc_reg_0_/D] [get_pins \
cnt_fc_reg_1_/D] [get_pins cnt_fc_reg_2_/D] [get_pins cnt_fc_reg_3_/D]         \
[get_pins cnt_fc_reg_4_/D] [get_pins cnt_fc_reg_5_/D] [get_pins                \
cnt_fc_reg_6_/D] [get_pins cnt_fc_reg_7_/D] [get_pins cnt_fc_reg_8_/D]]
group_path -weight 3  -name reg2out  -from [list [get_pins osign_reg/CK]       \
[get_pins dout_r_reg_1_/CK] [get_pins dout_r_reg_2_/CK] [get_pins              \
dout_r_reg_3_/CK] [get_pins dout_r_reg_4_/CK] [get_pins dout_r_reg_5_/CK]      \
[get_pins dout_r_reg_6_/CK] [get_pins dout_r_reg_7_/CK] [get_pins              \
dout_r_reg_8_/CK] [get_pins dout_r_reg_9_/CK] [get_pins dout_r_reg_10_/CK]     \
[get_pins dout_r_reg_11_/CK] [get_pins dout_r_reg_12_/CK] [get_pins            \
dout_r_reg_13_/CK] [get_pins dout_r_reg_14_/CK] [get_pins dout_r_reg_15_/CK]   \
[get_pins sum_reg_1_/CK] [get_pins sum_reg_2_/CK] [get_pins sum_reg_3_/CK]     \
[get_pins sum_reg_4_/CK] [get_pins sum_reg_5_/CK] [get_pins sum_reg_6_/CK]     \
[get_pins sum_reg_7_/CK] [get_pins sum_reg_8_/CK] [get_pins sum21_reg_1_/CK]   \
[get_pins sum21_reg_2_/CK] [get_pins sum21_reg_3_/CK] [get_pins                \
sum21_reg_4_/CK] [get_pins sum21_reg_5_/CK] [get_pins sum21_reg_6_/CK]         \
[get_pins sum21_reg_7_/CK] [get_pins sum20_reg_1_/CK] [get_pins                \
sum20_reg_2_/CK] [get_pins sum20_reg_3_/CK] [get_pins sum20_reg_4_/CK]         \
[get_pins sum20_reg_5_/CK] [get_pins sum20_reg_6_/CK] [get_pins                \
sum20_reg_7_/CK] [get_pins sum10_reg_1_/CK] [get_pins sum10_reg_2_/CK]         \
[get_pins sum10_reg_3_/CK] [get_pins sum10_reg_4_/CK] [get_pins                \
sum10_reg_5_/CK] [get_pins sum10_reg_6_/CK] [get_pins sum12_reg_1_/CK]         \
[get_pins sum12_reg_2_/CK] [get_pins sum12_reg_3_/CK] [get_pins                \
sum12_reg_4_/CK] [get_pins sum12_reg_5_/CK] [get_pins sum12_reg_6_/CK]         \
[get_pins sum11_reg_1_/CK] [get_pins sum11_reg_2_/CK] [get_pins                \
sum11_reg_3_/CK] [get_pins sum11_reg_4_/CK] [get_pins sum11_reg_5_/CK]         \
[get_pins sum11_reg_6_/CK] [get_pins sum00_reg_1_/CK] [get_pins                \
sum00_reg_2_/CK] [get_pins sum00_reg_3_/CK] [get_pins sum00_reg_4_/CK]         \
[get_pins sum05_reg_1_/CK] [get_pins sum05_reg_2_/CK] [get_pins                \
sum05_reg_3_/CK] [get_pins sum05_reg_4_/CK] [get_pins sum02_reg_1_/CK]         \
[get_pins sum02_reg_2_/CK] [get_pins sum02_reg_3_/CK] [get_pins                \
sum02_reg_4_/CK] [get_pins sum01_reg_1_/CK] [get_pins sum01_reg_2_/CK]         \
[get_pins sum01_reg_3_/CK] [get_pins sum01_reg_4_/CK] [get_pins                \
sum04_reg_1_/CK] [get_pins sum04_reg_2_/CK] [get_pins sum04_reg_3_/CK]         \
[get_pins sum04_reg_4_/CK] [get_pins sum03_reg_1_/CK] [get_pins                \
sum03_reg_2_/CK] [get_pins sum03_reg_3_/CK] [get_pins sum03_reg_4_/CK]         \
[get_pins p9_reg/CK] [get_pins p10_reg/CK] [get_pins p11_reg/CK] [get_pins     \
p0_reg/CK] [get_pins p1_reg/CK] [get_pins p2_reg/CK] [get_pins p3_reg/CK]      \
[get_pins p4_reg/CK] [get_pins p5_reg/CK] [get_pins p6_reg/CK] [get_pins       \
p7_reg/CK] [get_pins p8_reg/CK] [get_pins csign_reg/CK] [get_pins              \
w_reg_143_/CK] [get_pins w_reg_142_/CK] [get_pins w_reg_141_/CK] [get_pins     \
w_reg_140_/CK] [get_pins w_reg_139_/CK] [get_pins w_reg_138_/CK] [get_pins     \
w_reg_137_/CK] [get_pins w_reg_136_/CK] [get_pins w_reg_135_/CK] [get_pins     \
w_reg_134_/CK] [get_pins w_reg_133_/CK] [get_pins w_reg_132_/CK] [get_pins     \
w_reg_131_/CK] [get_pins w_reg_130_/CK] [get_pins w_reg_129_/CK] [get_pins     \
w_reg_128_/CK] [get_pins w_reg_127_/CK] [get_pins w_reg_126_/CK] [get_pins     \
w_reg_125_/CK] [get_pins w_reg_124_/CK] [get_pins w_reg_123_/CK] [get_pins     \
w_reg_122_/CK] [get_pins w_reg_121_/CK] [get_pins w_reg_120_/CK] [get_pins     \
w_reg_119_/CK] [get_pins w_reg_118_/CK] [get_pins w_reg_117_/CK] [get_pins     \
w_reg_116_/CK] [get_pins w_reg_115_/CK] [get_pins w_reg_114_/CK] [get_pins     \
w_reg_113_/CK] [get_pins w_reg_112_/CK] [get_pins w_reg_111_/CK] [get_pins     \
w_reg_110_/CK] [get_pins w_reg_109_/CK] [get_pins w_reg_108_/CK] [get_pins     \
w_reg_107_/CK] [get_pins w_reg_106_/CK] [get_pins w_reg_105_/CK] [get_pins     \
w_reg_104_/CK] [get_pins w_reg_103_/CK] [get_pins w_reg_102_/CK] [get_pins     \
w_reg_101_/CK] [get_pins w_reg_100_/CK] [get_pins w_reg_99_/CK] [get_pins      \
w_reg_98_/CK] [get_pins w_reg_97_/CK] [get_pins w_reg_96_/CK] [get_pins        \
w_reg_95_/CK] [get_pins w_reg_94_/CK] [get_pins w_reg_93_/CK] [get_pins        \
w_reg_92_/CK] [get_pins w_reg_91_/CK] [get_pins w_reg_90_/CK] [get_pins        \
w_reg_89_/CK] [get_pins w_reg_88_/CK] [get_pins w_reg_87_/CK] [get_pins        \
w_reg_86_/CK] [get_pins w_reg_85_/CK] [get_pins w_reg_84_/CK] [get_pins        \
w_reg_83_/CK] [get_pins w_reg_82_/CK] [get_pins w_reg_81_/CK] [get_pins        \
w_reg_80_/CK] [get_pins w_reg_79_/CK] [get_pins w_reg_78_/CK] [get_pins        \
w_reg_77_/CK] [get_pins w_reg_76_/CK] [get_pins w_reg_75_/CK] [get_pins        \
w_reg_74_/CK] [get_pins w_reg_73_/CK] [get_pins w_reg_72_/CK] [get_pins        \
w_reg_71_/CK] [get_pins w_reg_70_/CK] [get_pins w_reg_69_/CK] [get_pins        \
w_reg_68_/CK] [get_pins w_reg_67_/CK] [get_pins w_reg_66_/CK] [get_pins        \
w_reg_65_/CK] [get_pins w_reg_64_/CK] [get_pins w_reg_63_/CK] [get_pins        \
w_reg_62_/CK] [get_pins w_reg_61_/CK] [get_pins w_reg_60_/CK] [get_pins        \
w_reg_59_/CK] [get_pins w_reg_58_/CK] [get_pins w_reg_57_/CK] [get_pins        \
w_reg_56_/CK] [get_pins w_reg_55_/CK] [get_pins w_reg_54_/CK] [get_pins        \
w_reg_53_/CK] [get_pins w_reg_52_/CK] [get_pins w_reg_51_/CK] [get_pins        \
w_reg_50_/CK] [get_pins w_reg_49_/CK] [get_pins w_reg_48_/CK] [get_pins        \
w_reg_47_/CK] [get_pins w_reg_46_/CK] [get_pins w_reg_45_/CK] [get_pins        \
w_reg_44_/CK] [get_pins w_reg_43_/CK] [get_pins w_reg_42_/CK] [get_pins        \
w_reg_41_/CK] [get_pins w_reg_40_/CK] [get_pins w_reg_39_/CK] [get_pins        \
w_reg_38_/CK] [get_pins w_reg_37_/CK] [get_pins w_reg_36_/CK] [get_pins        \
w_reg_35_/CK] [get_pins w_reg_34_/CK] [get_pins w_reg_33_/CK] [get_pins        \
w_reg_32_/CK] [get_pins w_reg_31_/CK] [get_pins w_reg_30_/CK] [get_pins        \
w_reg_29_/CK] [get_pins w_reg_28_/CK] [get_pins w_reg_27_/CK] [get_pins        \
w_reg_26_/CK] [get_pins w_reg_25_/CK] [get_pins w_reg_24_/CK] [get_pins        \
w_reg_23_/CK] [get_pins w_reg_22_/CK] [get_pins w_reg_21_/CK] [get_pins        \
w_reg_20_/CK] [get_pins w_reg_19_/CK] [get_pins w_reg_18_/CK] [get_pins        \
w_reg_17_/CK] [get_pins w_reg_16_/CK] [get_pins w_reg_15_/CK] [get_pins        \
w_reg_14_/CK] [get_pins w_reg_13_/CK] [get_pins w_reg_12_/CK] [get_pins        \
w_reg_11_/CK] [get_pins w_reg_10_/CK] [get_pins w_reg_9_/CK] [get_pins         \
w_reg_8_/CK] [get_pins w_reg_7_/CK] [get_pins w_reg_6_/CK] [get_pins           \
w_reg_5_/CK] [get_pins w_reg_4_/CK] [get_pins w_reg_3_/CK] [get_pins           \
w_reg_2_/CK] [get_pins w_reg_1_/CK] [get_pins w_reg_0_/CK] [get_pins           \
weight_addr_reg_0_/CK] [get_pins weight_addr_reg_1_/CK] [get_pins              \
weight_addr_reg_2_/CK] [get_pins weight_addr_reg_3_/CK] [get_pins              \
weight_addr_reg_4_/CK] [get_pins weight_addr_reg_5_/CK] [get_pins              \
weight_addr_reg_6_/CK] [get_pins weight_addr_reg_7_/CK] [get_pins              \
weight_addr_reg_8_/CK] [get_pins weight_addr_reg_9_/CK] [get_pins              \
weight_addr_reg_10_/CK] [get_pins ivalid_ff_2_reg/CK] [get_pins                \
ivalid_ff_3_reg/CK] [get_pins ivalid_ff_4_reg/CK] [get_pins                    \
ivalid_ff_0_reg/CK] [get_pins ivalid_ff_1_reg/CK] [get_pins cnt_w_reg_0_/CK]   \
[get_pins cnt_w_reg_1_/CK] [get_pins cnt_w_reg_2_/CK] [get_pins                \
cnt_w_reg_3_/CK] [get_pins cnt_w_reg_4_/CK] [get_pins cnt_w_reg_5_/CK]         \
[get_pins cnt_w_reg_6_/CK] [get_pins cnt_w_reg_7_/CK] [get_pins                \
cnt_w_reg_8_/CK] [get_pins cnt_fc_reg_0_/CK] [get_pins cnt_fc_reg_1_/CK]       \
[get_pins cnt_fc_reg_2_/CK] [get_pins cnt_fc_reg_3_/CK] [get_pins              \
cnt_fc_reg_4_/CK] [get_pins cnt_fc_reg_5_/CK] [get_pins cnt_fc_reg_6_/CK]      \
[get_pins cnt_fc_reg_7_/CK] [get_pins cnt_fc_reg_8_/CK]]  -to [list [get_ports \
ovalid] [get_ports {dout[15]}] [get_ports {dout[14]}] [get_ports {dout[13]}]   \
[get_ports {dout[12]}] [get_ports {dout[11]}] [get_ports {dout[10]}]           \
[get_ports {dout[9]}] [get_ports {dout[8]}] [get_ports {dout[7]}] [get_ports   \
{dout[6]}] [get_ports {dout[5]}] [get_ports {dout[4]}] [get_ports {dout[3]}]   \
[get_ports {dout[2]}] [get_ports {dout[1]}] [get_ports {dout[0]}]]
group_path -weight 2  -name in2out  -from [list [get_ports clk] [get_ports     \
rstn] [get_ports ivalid] [get_ports din_0] [get_ports din_1] [get_ports din_2] \
[get_ports din_3] [get_ports din_4] [get_ports din_5] [get_ports din_6]        \
[get_ports din_7] [get_ports din_8] [get_ports din_9] [get_ports din_10]       \
[get_ports din_11] [get_ports weight] [get_ports weight_en]]  -to [list        \
[get_ports ovalid] [get_ports {dout[15]}] [get_ports {dout[14]}] [get_ports    \
{dout[13]}] [get_ports {dout[12]}] [get_ports {dout[11]}] [get_ports           \
{dout[10]}] [get_ports {dout[9]}] [get_ports {dout[8]}] [get_ports {dout[7]}]  \
[get_ports {dout[6]}] [get_ports {dout[5]}] [get_ports {dout[4]}] [get_ports   \
{dout[3]}] [get_ports {dout[2]}] [get_ports {dout[1]}] [get_ports {dout[0]}]]
group_path -critical_range 0.3  -name **clock_gating_default**
set_input_transition -max 1  [get_ports clk]
set_input_transition -min 1  [get_ports clk]
set_input_transition -max 1  [get_ports rstn]
set_input_transition -min 1  [get_ports rstn]
set_input_transition -max 1  [get_ports ivalid]
set_input_transition -min 1  [get_ports ivalid]
set_input_transition -max 1  [get_ports din_0]
set_input_transition -min 1  [get_ports din_0]
set_input_transition -max 1  [get_ports din_1]
set_input_transition -min 1  [get_ports din_1]
set_input_transition -max 1  [get_ports din_2]
set_input_transition -min 1  [get_ports din_2]
set_input_transition -max 1  [get_ports din_3]
set_input_transition -min 1  [get_ports din_3]
set_input_transition -max 1  [get_ports din_4]
set_input_transition -min 1  [get_ports din_4]
set_input_transition -max 1  [get_ports din_5]
set_input_transition -min 1  [get_ports din_5]
set_input_transition -max 1  [get_ports din_6]
set_input_transition -min 1  [get_ports din_6]
set_input_transition -max 1  [get_ports din_7]
set_input_transition -min 1  [get_ports din_7]
set_input_transition -max 1  [get_ports din_8]
set_input_transition -min 1  [get_ports din_8]
set_input_transition -max 1  [get_ports din_9]
set_input_transition -min 1  [get_ports din_9]
set_input_transition -max 1  [get_ports din_10]
set_input_transition -min 1  [get_ports din_10]
set_input_transition -max 1  [get_ports din_11]
set_input_transition -min 1  [get_ports din_11]
set_input_transition -max 1  [get_ports weight]
set_input_transition -min 1  [get_ports weight]
set_input_transition -max 1  [get_ports weight_en]
set_input_transition -min 1  [get_ports weight_en]
set_timing_derate -late -data -net_delay  1.05 
set_timing_derate -late -data -cell_delay 1.05 
