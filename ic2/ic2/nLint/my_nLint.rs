@nLint rc file Version 1.0
#------------------------
# v0.1 -- 3.12.2004, chunghsing & chad first review.
#		turn off the following:
#		"DFT", "Naming convention", "VITAL Compliant", and 
#		22082, 22152, 22271, 22279, 22281, 22283, 23030, 27335,
#		27337, 22207, 22211, 22213, 23002, 23004, 23005, 23017,
#		23021, 23055, 23075, 23079, 23089, 23115, 24017, 27122,
#		27335, 27337, 23409, 22007, 22008, 22010, 22053, 22056,
#		22057, 22058, 22061, 22067, 22105, 22117, 22149, 22167,
#		22175, 22176, 22181, 22201, 22203, 22204, 22205, 22221,
#		22223, 22225, 22227, 22229, 22233, 22261, 22271, 22273,
#		22275, 22277, 23121, 25003, 25005, 25009, 25011, 25013,
#		25015, 25016, 27328, 27329, 27359, 27361, 27369, 22015,
#		22104, 22152, 22165, 22265, 22267, 23030, 24021, 26001,
#		26003, 26011, 26015, 27345, 21023, 21043, 21044, 22021,
#		22023, 22025, 22027, 22029, 22031, 22033, 22035, 22038,
#		22039, 22041, 22043, 22044, 22049, 22161, 27055, 27349,
#		27351, 27353, 27357, 27363, 27365, 27367, 27371, 27377,
#		27389, 28009, 27356
#		
# v0.2 -- 3.17.2004, after Jiin reviewed.
#		turn on the following: 
#		22271, 22207, 23005, 23075, 23079, 23089, 23115, 22010, 
#		22167, 22261, 22275, 27361, 22104, 22021, 28011
#
#
# Jul-13-2004 (v01)
#   change the argument 2 of rule 23016 from TRUE to FALSE
# 
# Jul-14-2004 (v02)
#   1. turn on 23030 "race condition in combinational logic"
#   2. change severity of race condition rule 
#	22001, 22247, 23029, 23030, 23015, 23016, 23037, 23089, 23075
#	from "Warning" to "Error"
#
# Jul-19-2004 (v03), updated by reinhard, Bauli's request
#   1. change severity of rule from Warning to Error
#       11053: macro redefined
#	11101: too few portInst connections
#	22006: x/z extended in significant bits
#	22011: combinational loop
#	22012: bit width mismatch between module port and instance port
#	22104: bit width mismatch in logic comparison operation
#	22271: report snake path
#	23008: default is not found
#	23013: extra signal in sensitivity list
#       24007: names distinguishable in letter case only
#	27128: variable not fully assigned before referenced in combinational process
#   2. change severity of rule from Informatino to Error
#       23401: floating net
#
# Jul-21-2004 (v04), updated by reinhard, Bauli and Ericbill's discussion
#   1. change severity of rule from Error to Warning
#	22271: report snake path
#
# Feb-14-2005 (design22v17_v05.rs), updated by reinahrd, Ericbill's request
#   1. Enable 22281, 22283, 22082, 22279, 27356, 23405
#   2. Upgrade severity from "Warning" to "Error": 22281, 22283, 22082, 22279, 22263,
#                                                  27355, 27356, 23405
#   3. Rule 22082 and 22279 only check INPUT and INOUT, not OUTPUT
#
# 2010.11.30-zhangxc, updated
#   1. 27351 change "DEVIDE" into "DIVIDE"
#   2. 23123 change "ITEM" into "CHOICE"
# 2010.12.23 guy,
# 2015.10.28 Wuhongyan updated
#   1. Modify the blocking and non-blocking assignment
#   2. 22177 22247 23037 23015 23016 modified to Enable Enable TRUE TRUE
#------------------------


[Compilation&Elaboration.11001]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11003]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11005]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11007]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11009]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11011]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11013]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11015]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11017]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11019]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11021]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11023]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11025]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11027]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11029]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11031]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11033]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11035]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11037]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11039]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11041]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11043]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11045]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11047]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11049]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11051]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11053]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11055]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11057]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11059]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11061]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11063]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11065]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11067]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11069]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11071]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11073]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11075]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11077]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11079]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11081]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11083]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11085]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11087]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11089]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11091]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11093]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11095]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11097]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11099]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11101]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11103]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11105]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11107]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11109]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11111]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11113]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.11115]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.16895]
vlog_severity = Level1
vhdl_severity = Level2
[Compilation&Elaboration.16931]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.16933]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.16935]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.16937]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.16939]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.16943]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17010]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17020]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17030]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17040]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17050]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17060]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17070]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17080]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17090]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17100]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17150]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17160]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17170]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17180]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17190]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17200]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17210]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17220]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.17595]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.17596]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.17999]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18001]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18002]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18003]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18004]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18005]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18006]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18101]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18102]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18103]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18104]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18105]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18120]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18130]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18140]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18141]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18142]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18143]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18150]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18151]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18160]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18170]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18171]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18172]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18180]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18190]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18191]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18200]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18210]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18211]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18220]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18230]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18231]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18232]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18233]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18240]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18241]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18242]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18245]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18250]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18260]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18270]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18280]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18290]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18300]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18310]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18320]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18330]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18331]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18340]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18350]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18360]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18370]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18380]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18390]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18400]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18410]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18420]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18430]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18440]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18450]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18460]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18470]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18471]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18480]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18490]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18500]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18510]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18511]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18520]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18530]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18540]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18541]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18542]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18550]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18560]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18570]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18571]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18575]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18576]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18577]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18580]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18581]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18582]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18585]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18590]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18600]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18605]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18610]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18615]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18620]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18625]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18630]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18635]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18636]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18637]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18640]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18645]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18648]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18649]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18650]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18655]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18656]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18660]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18665]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18670]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18680]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18690]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18700]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18701]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18705]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18706]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18710]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18715]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18720]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18725]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18728]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18729]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18730]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18735]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18736]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18740]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18742]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18743]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18745]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18746]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18750]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18755]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18760]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18765]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18770]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18772]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18773]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18775]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18778]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18780]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18782]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18785]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18788]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18790]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18792]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18795]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18796]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18797]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18799]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18800]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18802]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18803]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18805]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18807]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18808]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18810]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18811]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18812]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18813]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18815]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18816]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18817]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18820]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18822]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18825]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18826]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18827]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18828]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18830]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.18832]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18835]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18836]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18837]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18838]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18839]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18840]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18841]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18842]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18843]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18844]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18845]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18846]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18847]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18848]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18849]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18850]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18851]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18852]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18853]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18854]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18855]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18856]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.18857]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18860]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18861]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18862]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18863]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18864]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18865]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18866]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18868]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18870]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18871]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18875]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18876]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18877]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18878]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18879]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18880]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18881]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18882]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18885]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18903]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18904]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18905]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18950]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18952]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.18999]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.19001]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.19003]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.19005]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.19006]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.19007]
vlog_severity = Level2
vhdl_severity = Level3
[Compilation&Elaboration.19009]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.19073]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.19074]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.19075]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.19076]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.20201]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.20203]
vlog_severity = Level2
vhdl_severity = Level2
[Compilation&Elaboration.20205]
vlog_severity = Level2
vhdl_severity = Level2
[Default]
Default = "nLint"
[Groups]
1 = "nLint"
2 = "RMM"
3 = "STARC"
4 = "New Rules"
[New Rules.22020]
vlog_severity = Level2
vhdl_severity = Level2
[New Rules.22032]
vlog_severity = Level2
vhdl_severity = Level2
[New Rules.22132]
vlog_severity = Level2
vhdl_severity = Level2
[New Rules.22228]
vlog_severity = Level2
vlog_val = BOTH
vhdl_severity = Level2
vhdl_val = BOTH
[New Rules.22v13]
22132 = Disable Disable TRUE TRUE
[New Rules.22v15]
27130 = Disable NONE TRUE NONE
[New Rules.22v16]
27399 = Disable Disable TRUE TRUE
27401 = Disable Disable TRUE TRUE
22032 = Disable Disable TRUE TRUE
22020 = Disable Disable TRUE TRUE
[New Rules.22v17]
22228 = Disable Disable TRUE TRUE
27411 = Disable NONE TRUE NONE
27413 = Disable Disable TRUE TRUE
27415 = Disable NONE TRUE NONE
[New Rules.27130]
vlog_severity = Level2
vlog_val = NONBLOCKING
vhdl_severity = Level2
[New Rules.27399]
vlog_severity = Level2
vlog_val = //sync
vhdl_severity = Level2
vhdl_val = --sync
[New Rules.27401]
vlog_severity = Level2
vhdl_severity = Level2
[New Rules.27411]
vlog_severity = Level2
vhdl_severity = Level2
[New Rules.27413]
vlog_severity = Level2
vhdl_severity = Level2
[New Rules.27415]
vlog_severity = Level2
vlog_val = D1
vhdl_severity = Level2
[New Rules.include]
1 = "22v13" Enable TRUE
2 = "22v15" Enable TRUE
3 = "22v16" Enable TRUE
4 = "22v17" Enable TRUE
[RMM.21001]
vlog_severity = Level2
vlog_indexname = 5.2.1-G1-1
vhdl_indexname = 5.2.1-G1-1
vlog_val = CASE_LOWER
vhdl_description = "Use lowercase letters for all signal names"
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[RMM.21003]
vlog_severity = Level2
vlog_indexname = 5.2.1-G1-2
vhdl_indexname = 5.2.1-G1-2
vlog_val = CASE_LOWER
vhdl_description = "Use lowercase letters for all variable names"
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[RMM.21005]
vlog_severity = Level2
vlog_indexname = 5.2.1-G1-3
vhdl_indexname = 5.2.1-G1-3
vlog_val = CASE_LOWER
vhdl_description = "Use lowercase letters for all port names"
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[RMM.21013]
vlog_severity = Level2
vlog_indexname = 5.2.1-G5
vhdl_indexname = 5.2.1-G5
vlog_val = PREFIX,clk_
vhdl_description = "User the name clk or prefix clk for the clock signals."
vhdl_severity = Level2
vhdl_val = PREFIX,clk_
[RMM.21015]
vlog_severity = Level2
vlog_indexname = 5.2.1-G9
vhdl_indexname = 5.2.1-G9
vlog_val = PREFIX,rst_
vhdl_description = "Name or prefix rst used for reset signals"
vhdl_severity = Level2
vhdl_val = PREFIX,rst_
[RMM.21020]
vlog_severity = Level2
vlog_indexname = 5.2.1-G7
vhdl_indexname = 5.2.1-G7
vlog_val = SUFFIX,_n
vhdl_description = "For active low signal, end the signal name with an underscore followed by a lowercase character"
vhdl_severity = Level2
vhdl_val = SUFFIX,_n
[RMM.21023]
vlog_severity = Level2
vlog_indexname = 5.2.1-G10
vhdl_indexname = 5.2.1-G10
vlog_val = ZERO_BOUND,DOWN_TO
vhdl_description = "Use desending bit order with zero bound in range declaration"
vhdl_severity = Level2
vhdl_val = ZERO_BOUND,DOWN_TO
[RMM.21025]
vlog_severity = Level2
vlog_indexname = 5.2.1-G11
vhdl_indexname = 21025
vlog_val = IGNORE_LIB_CELL
vhdl_severity = Level2
[RMM.21027]
vlog_severity = Level2
vlog_indexname = 5.2.1-G12-5
vhdl_indexname = 5.2.1-G12-5
vlog_val = SUFFIX,_r
vhdl_description = "use suffix '_r' for register output signal name"
vhdl_severity = Level2
vhdl_val = SUFFIX,_r
[RMM.21029]
vlog_severity = Level2
vlog_indexname = 5.2.1-G12-1
vhdl_indexname = 5.2.1-G12-1
vlog_val = SUFFIX,_a
vhdl_description = "use suffix '_a' for asynchronous signal name"
vhdl_severity = Level2
vhdl_val = SUFFIX,_a
[RMM.21031]
vlog_severity = Level2
vlog_indexname = 5.2.1-G12-2
vhdl_indexname = 5.2.1-G12-2
vlog_val = SUFFIX,_z
vhdl_description = "use suffix '_z' for tri-state internal signal name"
vhdl_severity = Level2
vhdl_val = SUFFIX,_z
[RMM.21035]
vlog_severity = Level2
vlog_indexname = 5.2.1-G12-4
vhdl_indexname = 5.2.1-G12-4
vlog_val = SUFFIX,_nxt
vhdl_description = "use suffix '_nxt' for the name of data before being registered"
vhdl_severity = Level2
vhdl_val = SUFFIX,_nxt
[RMM.21041]
vlog_severity = Level2
vlog_indexname = 5.2.1-G2-1
vhdl_indexname = 5.2.1-G2-1
vlog_val = CASE_UPPER
vhdl_description = "Use uppercase letters for names of GENERIC"
vhdl_severity = Level2
vhdl_val = CASE_UPPER
[RMM.21049]
vlog_severity = Level2
vlog_indexname = 5.2.15.G1
vhdl_indexname = 5.2.15.G1
vlog_val = SUFFIX,_PROC
vhdl_description = "Each process block labeled <name>_PROC"
vhdl_severity = Level2
vhdl_val = SUFFIX,_PROC
[RMM.21050]
vlog_severity = Level2
vlog_indexname = 5.2.15-R1
vhdl_indexname = 5.2.15-R1
vhdl_description = "Each process block labeled with meaningful name"
vhdl_severity = Level2
[RMM.21051]
vlog_severity = Level2
vlog_indexname = 5.2.15-G2
vhdl_indexname = 5.2.15-G2
vlog_val = PREFIX,U_
vhdl_description = "Each instance labeled U_<name>."
vhdl_severity = Level2
vhdl_val = PREFIX,U_
[RMM.21057]
vlog_severity = Level2
vlog_indexname = 5.2.1-G6
vhdl_indexname = 5.2.1-G6
vlog_val = PREFIX
vhdl_description = "Use the same name for all clock signals that are driven from the same clock source"
vhdl_severity = Level2
vhdl_val = PREFIX
[RMM.22011]
vlog_severity = Level2
vlog_indexname = 5.5.4-G1
vhdl_indexname = 5.5.4-G1
vlog_val = SYNC
vhdl_description = "No combinational feedback"
vhdl_severity = Level2
vhdl_val = SYNC
[RMM.22023]
vlog_severity = Level2
vlog_indexname = 5.2.6-R1
vhdl_indexname = 5.2.6-R1
vhdl_description = "Use separate line for each HDL statement"
vhdl_severity = Level2
[RMM.22025]
vlog_severity = Level2
vlog_indexname = 5.2.7-G1
vhdl_indexname = 5.2.7-G1
vlog_val = 72
vhdl_description = "Keep the line length to 72 characters or less"
vhdl_severity = Level2
vhdl_val = 72
[RMM.22027]
vlog_severity = Level2
vlog_indexname = 5.2.8-G1
vhdl_indexname = 5.2.8-G1
vlog_val = 2,"FIRST_INDENT, BEGIN_INDENT"
vhdl_description = "User indentation with consistent spaces number to improve the readability"
vhdl_severity = Level2
vhdl_val = 2,"FIRST_INDENT, BEGIN_INDENT"
[RMM.22029]
vlog_severity = Level2
vlog_indexname = 5.2.8-G2
vhdl_indexname = 5.2.8-G2
vlog_val = CHECK_WHOLE
vhdl_description = "Avoid using tabs"
vhdl_severity = Level2
vhdl_val = CHECK_WHOLE
[RMM.22031]
vlog_severity = Level2
vlog_indexname = 5.2.5-G1-1
vhdl_indexname = 5.2.5-G1-1
vhdl_description = "Use comments to explain ports"
vhdl_severity = Level2
[RMM.22033]
vlog_severity = Level2
vlog_indexname = 5.2.11-G1
vhdl_indexname = 5.2.11-G1
vlog_val = FALSE,"INPUT, OUTPUT, INOUT, BUFFER, LINKAGE"
vhdl_description = "Blank line between the input and output ports to improve readability"
vhdl_severity = Level2
vhdl_val = FALSE,"INPUT, OUTPUT, INOUT, BUFFER, LINKAGE"
[RMM.22035]
vlog_severity = Level2
vlog_indexname = 5.2.10-G2-1
vhdl_indexname = 5.2.10-G2-1
vlog_val = "INPUT, OUTPUT, INOUT, BUFFER, LINKAGE","CLOCK, RESET, SET, ENABLE, TE, CONTROL"
vhdl_description = "Declare ports in a logical order"
vhdl_severity = Level2
vhdl_val = "INPUT, OUTPUT, INOUT, BUFFER, LINKAGE","CLOCK, RESET, SET, ENABLE, TE, CONTROL"
[RMM.22038]
vlog_severity = Level2
vlog_indexname = 5.2.5-G1-2
vhdl_indexname = 5.2.5-G1-2
vlog_val = IGNORE_COMMENT
vhdl_description = "Use comments to explain signals and variables"
vhdl_severity = Level2
vhdl_val = IGNORE_COMMENT
[RMM.22039]
vlog_severity = Level2
vlog_indexname = 5.2.10-R1
vhdl_indexname = 5.2.10-R1
vhdl_description = "Declare ports in a logical order"
vhdl_severity = Level2
[RMM.22043]
vlog_severity = Level2
vlog_indexname = 5.2.11-R1-1
vhdl_indexname = 5.2.11-R1-1
vhdl_description = "Use explicit mapping for ports"
vhdl_severity = Level2
[RMM.22044]
vlog_severity = Level2
vlog_indexname = 5.2.11-R1-2
vhdl_indexname = 5.2.11-R1-2
vhdl_description = "Use explicit mapping for generic"
vhdl_severity = Level2
[RMM.22049]
vlog_severity = Level2
vlog_indexname = 5.3.2-G1
vhdl_indexname = 5.3.2-G1
vlog_val = "ENTITY, ARCHITECTURE"
vhdl_description = "No hard-coded numeric values in your design (with possible exception of 1 and 0)."
vhdl_severity = Level2
vhdl_val = "ENTITY, ARCHITECTURE"
[RMM.22053]
vlog_severity = Level2
vlog_indexname = 5.4.3-G1
vhdl_indexname = 5.4.3-G1
vhdl_description = "No gated clocks in design."
vhdl_severity = Level2
[RMM.22055]
vlog_severity = Level2
vlog_indexname = 5.4.2-G1
vhdl_indexname = 5.4.2-G1
vhdl_description = "No clock buffers in design; inserted after synthesis in physical design stage."
vhdl_severity = Level2
[RMM.22056]
vlog_severity = Level2
vlog_indexname = 5.4.6-G1-1
vhdl_indexname = 5.4.6-G1-1
vlog_val = BOTH
vhdl_description = "No internally generated"
vhdl_severity = Level2
vhdl_val = BOTH
[RMM.22063]
vlog_severity = Level2
vlog_indexname = 5.5.9-G1
vhdl_indexname = 5.5.9-G1
vhdl_description = "describe state machines into two processes"
vhdl_severity = Level2
[RMM.22067]
vlog_severity = Level2
vlog_indexname = 5.5.9-G3
vhdl_indexname = 5.5.9-G3
vhdl_description = "FSM logic and non-FSM logic separated into different modules."
vhdl_severity = Level2
[RMM.22131]
vlog_severity = Level2
vlog_indexname = 5.4.4-G1
vhdl_indexname = 5.4.4-G1
vhdl_description = "No internally generated clocks in design."
vhdl_severity = Level2
[RMM.22225]
vlog_severity = Level3
vlog_indexname = 5.4.1-G1
vhdl_indexname = 5.4.1-G1
vlog_val = TRUE
vhdl_description = "Avoid using both positive-edge and negative-edge triggered flip-flops in your design"
vhdl_severity = Level3
vhdl_val = TRUE
[RMM.22269]
vlog_severity = Level2
vlog_indexname = 5.6.3-G1
vhdl_indexname = 5.6.3-G1
vlog_val = SYNC,30
vhdl_description = "Critical path logic isolated in a separate module from noncritical path logic"
vhdl_severity = Level2
vhdl_val = SYNC,30
[RMM.22271]
vlog_severity = Level2
vlog_indexname = 5.6.2-G1
vhdl_indexname = 5.6.2-G1
vlog_val = 20
vhdl_description = "Related combinational logic placed together in the same module."
vhdl_severity = Level2
vhdl_val = 20
[RMM.22273]
vlog_severity = Level3
vlog_indexname = 5.4.5-G1-1
vhdl_indexname = 5.4.5-G1-1
vhdl_description = "separate clock generate circuit in different modules"
vhdl_severity = Level3
[RMM.22275]
vlog_severity = Level3
vlog_indexname = 5.4.6-G2
vhdl_indexname = 5.4.6-G2
vhdl_description = "separate reset generate circuit into different modules"
vhdl_severity = Level3
[RMM.23003]
vlog_severity = Level2
vlog_indexname = 5.5.2-G1
vhdl_indexname = 5.5.2-G1
vhdl_description = "No latch inference"
vhdl_severity = Level2
[RMM.23011]
vlog_severity = Level3
vlog_indexname = 5.5.5-G1
vhdl_indexname = 5.5.5-G1
vhdl_description = "Complete sensitivity list in each process (VHDL) or always (Verilog) blocks."
vhdl_severity = Level3
[RMM.23013]
vlog_severity = Level2
vlog_indexname = 5.5.5-G2
vhdl_indexname = 5.5.5-G2
vlog_val = BOTH,IGNORE_PART_SEL
vhdl_description = "Only necessary signals in each process sensitivity lists"
vhdl_severity = Level2
vhdl_val = BOTH,IGNORE_PART_SEL
[RMM.23015]
vlog_severity = Level3
vlog_indexname = 5.5.6-G1
vhdl_indexname = 23015
vlog_val = BLOCKING,REG_INFER_ASSIGN
vhdl_severity = Level2
[RMM.23017]
vlog_severity = Level2
vlog_indexname = 5.5.8.1
vhdl_indexname = 5.5.8.1
vhdl_description = "Case statements used rather than an if-then-else statement wherever possible"
vhdl_severity = Level2
[RMM.23021]
vlog_severity = Level2
vlog_indexname = 5.6.8-G1
vhdl_indexname = 23021
vlog_val = NON_LEAF,""
vhdl_severity = Level2
[RMM.23043]
vlog_severity = Level2
vlog_indexname = 5.4.6-G1-1
vhdl_indexname = 5.4.6-G1-1
vlog_val = "CLOCK, RESET, SET, LATCH_ENABLE, TRI_ENABLE"
vhdl_description = "No conditional resets"
vhdl_severity = Level2
vhdl_val = "CLOCK, RESET, SET, LATCH_ENABLE, TRI_ENABLE"
[RMM.23121]
vlog_severity = Level3
vlog_indexname = 5.5.1-G1-2
vhdl_indexname = 5.5.1-G1-2
vlog_val = BOTH
vhdl_description = "Use the design's reset signal to initialize registered signals."
vhdl_severity = Level3
vhdl_val = BOTH
[RMM.24001]
vlog_severity = Level2
vlog_indexname = 5.2.9-G1-1
vhdl_indexname = 24001
vhdl_severity = Level2
[RMM.24003]
vlog_severity = Level2
vhdl_description = "Do not user verilog reserved words for names in RTL source files."
vhdl_severity = Level2
[RMM.24009]
vlog_severity = Level2
vlog_indexname = 5.2.15-R3
vhdl_indexname = 5.2.15-R3
vhdl_description = "Signal, variable, or entity names are not duplicated."
vhdl_severity = Level2
[RMM.25015]
vlog_severity = Level2
vlog_indexname = 5.6.1-G1
vhdl_indexname = 5.6.1-G1
vhdl_description = "For each block of a hierarchical design, all output signals should be registered"
vhdl_severity = Level2
[RMM.27063]
vlog_severity = Level2
vhdl_description = "Use uppercase letters for names of literal"
vhdl_severity = Level2
vhdl_val = CASE_UPPER
[RMM.27069]
vlog_severity = Level2
vhdl_description = "use Only IEEE Standard Types"
vhdl_severity = Level2
[RMM.27071]
vlog_severity = Level2
vhdl_description = "If VHDL, then types bit or bit_vector not used."
vhdl_severity = Level2
[RMM.27083]
vlog_severity = Level2
vhdl_description = "std_logic and std_logic_vector packages used rather than std_ulogic and std_ulogic_vector."
vhdl_severity = Level2
vhdl_val = RESOLVED
[RMM.27143]
vlog_severity = Level2
vhdl_description = "Do not use BLOCK constructs"
vhdl_severity = Level2
[RMM.27144]
vlog_severity = Level2
vhdl_description = "do not use generate statements."
vhdl_severity = Level2
[RMM.27181]
vlog_severity = Level2
vhdl_description = "use signals instead of variables for synthesizable RTL."
vhdl_severity = Level2
[RMM.27259]
vlog_severity = Level2
vhdl_description = "Use uppercase letters for names of CONSTANT"
vhdl_severity = Level2
vhdl_val = CASE_UPPER
[RMM.27273]
vlog_severity = Level2
vlog_indexname = 5.2.1-G4
vhdl_indexname = 5.2.1-G4
vlog_val = 3,16
vhdl_description = "Use short but descriptive names for GENERIC"
vhdl_severity = Level2
vhdl_val = 3,16
[RMM.27524]
vlog_severity = Level2
vhdl_description = "do not initialize the signal in the declaration;"
vhdl_severity = Level2
[RMM.Clocks and Resets]
22053 = Enable Enable TRUE TRUE
22055 = Enable Enable TRUE TRUE
22056 = Enable Enable TRUE TRUE
22131 = Enable Enable TRUE TRUE
22225 = Enable Enable TRUE TRUE
22273 = Enable Enable TRUE TRUE
22275 = Enable Enable TRUE TRUE
23043 = Enable Enable TRUE TRUE
[RMM.Coding Practice]
21001 = Enable Enable TRUE TRUE
21003 = Enable Enable TRUE TRUE
21005 = Enable Enable TRUE TRUE
21013 = Enable Enable TRUE TRUE
21015 = Enable Enable TRUE TRUE
21020 = Enable Enable TRUE TRUE
21023 = Enable Enable TRUE TRUE
21025 = Enable NONE TRUE NONE
21027 = Enable Enable TRUE TRUE
21029 = Enable Enable TRUE TRUE
21031 = Enable Enable TRUE TRUE
21035 = Enable Enable TRUE TRUE
21041 = Enable Enable TRUE TRUE
21049 = Enable Enable TRUE TRUE
21050 = Enable Enable TRUE TRUE
21051 = Enable Enable TRUE TRUE
21057 = Enable Enable TRUE TRUE
22023 = Enable Enable TRUE TRUE
22025 = Enable Enable TRUE TRUE
22027 = Enable Enable TRUE TRUE
22029 = Enable Enable TRUE TRUE
22031 = Enable Enable TRUE TRUE
22033 = Enable Enable TRUE TRUE
22035 = Enable Enable TRUE TRUE
22038 = Enable Enable TRUE TRUE
22039 = Enable Enable TRUE TRUE
22043 = Enable Enable TRUE TRUE
22044 = Enable Enable TRUE TRUE
24001 = Enable NONE TRUE NONE
24003 = NONE Enable NONE TRUE
24009 = Enable Enable TRUE TRUE
27063 = NONE Enable NONE TRUE
27259 = NONE Enable NONE TRUE
27273 = Enable Enable TRUE TRUE
[RMM.Coding for Portability]
22049 = Enable Enable TRUE TRUE
27069 = NONE Enable NONE TRUE
27071 = NONE Enable NONE TRUE
27083 = NONE Enable NONE TRUE
27143 = NONE Enable NONE TRUE
27144 = NONE Enable NONE TRUE
[RMM.Coding for Synthesis]
22011 = Enable Enable TRUE TRUE
22063 = Enable Enable TRUE TRUE
22067 = Enable Enable TRUE TRUE
23003 = Enable Enable TRUE TRUE
23011 = Enable Enable TRUE TRUE
23013 = Enable Enable TRUE TRUE
23015 = Enable Enable TRUE TRUE
23017 = Enable Enable TRUE TRUE
23121 = Enable Enable TRUE TRUE
27181 = NONE Enable NONE TRUE
27524 = NONE Enable NONE TRUE
[RMM.Partition for Synthesis]
22269 = Enable Enable TRUE TRUE
22271 = Enable Enable TRUE TRUE
23021 = Enable NONE TRUE NONE
25015 = Enable Enable TRUE TRUE
[RMM.include]
1 = "Coding Practice" Disable TRUE
2 = "Clocks and Resets" Enable TRUE
3 = "Coding for Synthesis" Enable TRUE
4 = "Coding for Portability" Enable TRUE
5 = "Partition for Synthesis" Enable TRUE
[RuleVersion]
Version = 202.17
[STARC.21001]
vlog_severity = Level3
vlog_indexname = 1.1.3.1-1
vhdl_indexname = 1.1.3.1-1
vlog_val = CASE_LOWER
vhdl_description = "Use lower case letters for signals inside of a layer, use at least 1 lower case letter"
vhdl_severity = Level3
vhdl_val = CASE_LOWER
[STARC.21003]
vlog_severity = Level3
vlog_indexname = 1.1.3.1-2
vhdl_indexname = 1.1.3.1-2
vlog_val = CASE_LOWER
vhdl_description = "Use lower case letters for signals inside of a layer, use at least 1 lower case letter"
vhdl_severity = Level3
vhdl_val = CASE_LOWER
[STARC.21005]
vlog_severity = Level3
vlog_indexname = 1.1.1.9-4
vhdl_indexname = 1.1.1.9-4
vlog_val = CASE_UPPER
vhdl_description = "port names should be defined using either upper English letters or lower letters"
vhdl_severity = Level3
vhdl_val = CASE_UPPER
[STARC.21011]
vlog_severity = Level3
vlog_indexname = 1.1.1.9-3
vhdl_indexname = 1.1.1.9-3
vlog_val = 12
vhdl_description = "port names should be within 12 characters"
vhdl_severity = Level3
vhdl_val = 12
[STARC.21013]
vlog_severity = Level3
vlog_indexname = 1.1.5.2-1
vhdl_indexname = 1.1.5.2-1
vlog_val = SUFFIX,"_CK,_CLK"
vhdl_description = "Add signal type to the end of the name: add _CLK or _CK to clock signal names"
vhdl_severity = Level3
vhdl_val = SUFFIX,"_CK,_CLK"
[STARC.21015]
vlog_severity = Level3
vlog_indexname = 1.1.5.2
vhdl_indexname = 1.1.5.2
vlog_val = SUFFIX,"_RST,_RESET"
vhdl_description = "Add signal type to the end of the name: add _RST or _RESET to reset signal names"
vhdl_severity = Level3
vhdl_val = SUFFIX,"_RST,_RESET"
[STARC.21020]
vlog_severity = Level4
vlog_indexname = 1.1.1.7
vhdl_indexname = 1.1.1.7
vlog_val = SUFFIX,_X
vhdl_description = "Add an identifying symbol to the end of the name so the polarity of negative logic signals is clearly identified (_X is standard practice)"
vhdl_severity = Level4
vhdl_val = SUFFIX,_X
[STARC.21023]
vlog_severity = Level3
vlog_indexname = "2.1.6.1 2.1.6.2"
vhdl_indexname = "2.1.6.1 2.1.6.2"
vlog_val = ZERO_BOUND,DOWN_TO
vhdl_description = "Specification of array, if it is one-dimensional, should be MSB:LSB and LSB of array should be 0 as much as possible"
vhdl_severity = Level3
vhdl_val = ZERO_BOUND,DOWN_TO
[STARC.21025]
vlog_severity = Level4
vlog_indexname = 1.1.2.6
vhdl_indexname = 21025
vlog_val = IGNORE_LIB_CELL
vhdl_severity = Level2
[STARC.21044]
vlog_severity = Level3
vlog_indexname = 1.1.1.1
vhdl_indexname = 1.1.1.1
vhdl_description = "File names should be as <module name>.v"
vhdl_severity = Level3
[STARC.22004]
vlog_severity = Level4
vlog_indexname = 2.10.3.1-2
vhdl_indexname = 2.10.3.1-2
vlog_val = VAR_EQ_CON
vhdl_description = "Match the bit width of signal assign and logical operation"
vhdl_severity = Level4
vhdl_val = VAR_EQ_CON
[STARC.22007]
vlog_severity = Level5
vlog_indexname = 1.1.4.6
vhdl_indexname = 1.1.4.6
vhdl_description = "Do not propagate parameters through ports"
vhdl_severity = Level5
[STARC.22011]
vlog_severity = Level5
vlog_indexname = 1.2.1.3
vhdl_indexname = 1.2.1.3
vlog_val = SYNC
vhdl_description = "Avoid feedback in combinational circuits"
vhdl_severity = Level5
vhdl_val = SYNC
[STARC.22021]
vlog_severity = Level3
vlog_indexname = 2.1.4.1
vhdl_indexname = 2.1.4.1
vhdl_description = "Place logic operators between parentheses when there are two or more different operators"
vhdl_severity = Level3
[STARC.22023]
vlog_severity = Level3
vlog_indexname = 3.1.4.4
vhdl_indexname = 3.1.4.4
vhdl_description = "Do not describe multiple assignments in 1 line"
vhdl_severity = Level3
[STARC.22025]
vlog_severity = Level3
vlog_indexname = 3.1.4.5
vhdl_indexname = 3.1.4.5
vlog_val = 110
vhdl_description = "Line Length throughout kept to 110 characters or less"
vhdl_severity = Level3
vhdl_val = 110
[STARC.22027]
vlog_severity = Level3
vlog_indexname = 3.1.4.2
vhdl_indexname = 3.1.4.2
vlog_val = 2,"FIRST_INDENT, BEGIN_INDENT"
vhdl_description = "Unify the number of indent used in always construct, if statement and case statement (standard is 2 spaces)"
vhdl_severity = Level3
vhdl_val = 2,"FIRST_INDENT, BEGIN_INDENT"
[STARC.22029]
vlog_severity = Level3
vlog_indexname = 3.1.4.3
vhdl_indexname = 3.1.4.3
vlog_val = CHECK_WHOLE
vhdl_description = "Replace tab with space after editing"
vhdl_severity = Level3
vhdl_val = CHECK_WHOLE
[STARC.22031]
vlog_severity = Level3
vlog_indexname = "3.1.3.4-1 3.5.6.3"
vhdl_indexname = "3.1.3.4-1 3.5.6.3"
vhdl_description = "Define one signal per line in I/O. Always add comments"
vhdl_severity = Level3
[STARC.22035]
vlog_severity = Level3
vlog_indexname = 3.1.3.2
vhdl_indexname = 3.1.3.2
vlog_val = "INPUT, OUTPUT, INOUT, BUFFER, LINKAGE","CLOCK, RESET, SET, ENABLE, TE, CONTROL"
vhdl_description = "Port description order should be clock, reset, input, output, I/O"
vhdl_severity = Level3
vhdl_val = "INPUT, OUTPUT, INOUT, BUFFER, LINKAGE","CLOCK, RESET, SET, ENABLE, TE, CONTROL"
[STARC.22038]
vlog_severity = Level3
vlog_indexname = 3.1.3.4-2
vhdl_indexname = 3.1.3.4-2
vlog_val = IGNORE_COMMENT
vhdl_description = "Define one signal per line in reg declaration, and wire declaration. Always add comments"
vhdl_severity = Level3
vhdl_val = IGNORE_COMMENT
[STARC.22039]
vlog_severity = Level3
vlog_indexname = 3.1.3.1
vhdl_indexname = 3.1.3.1
vhdl_description = "Unify the description order of port declaration, port list and instance call port list, defined in the modules"
vhdl_severity = Level3
[STARC.22043]
vlog_severity = Level4
vlog_indexname = "3.2.3.1 4.1.2.5"
vhdl_indexname = "3.2.3.1 4.1.2.5"
vhdl_description = "For component instantiations, use port name connections, not port order connections"
vhdl_severity = Level4
[STARC.22049]
vlog_severity = Level4
vlog_indexname = "1.1.4.7 3.1.5.2"
vhdl_indexname = "1.1.4.7 3.1.5.2"
vlog_val = "ENTITY, ARCHITECTURE"
vhdl_description = "Parameterize the bit width of ports required for circuits that will be reused"
vhdl_severity = Level4
vhdl_val = "ENTITY, ARCHITECTURE"
[STARC.22053]
vlog_severity = Level5
vlog_indexname = 1.4.1.3
vhdl_indexname = 1.4.1.3
vhdl_description = "Do not create gated clocks at each layer"
vhdl_severity = Level5
[STARC.22056]
vlog_severity = Level4
vlog_indexname = 1.3.2.1
vhdl_indexname = 1.3.2.1
vlog_val = BOTH
vhdl_description = "Do not insert logical operand (AND, OR, XOR) in reset line"
vhdl_severity = Level4
vhdl_val = BOTH
[STARC.22063]
vlog_severity = Level3
vlog_indexname = 2.11.3.1
vhdl_indexname = 2.11.3.1
vhdl_description = "Separate the FF statements and state machine description case statements in state machine circuits"
vhdl_severity = Level3
[STARC.22067]
vlog_severity = Level3
vlog_indexname = 2.11.2.1
vhdl_indexname = 2.11.2.1
vhdl_description = "Isolate state machine circuits"
vhdl_severity = Level3
[STARC.22075]
vlog_severity = Level1
vlog_indexname = 2.3.3.3
vhdl_indexname = 22075
vhdl_severity = Level2
[STARC.22077]
vlog_severity = Level5
vlog_indexname = 2.1.2.6
vhdl_indexname = 22077
vhdl_severity = Level2
[STARC.22085]
vlog_severity = Level4
vlog_indexname = 2.1.1.2
vhdl_indexname = 2.1.1.2
vhdl_description = "Describe all possible states for the assignment to return value in function statement"
vhdl_severity = Level4
[STARC.22089]
vlog_severity = Level4
vlog_indexname = "2.1.4.3 2.1.4.6 2.10.2.3"
vhdl_indexname = "22089"
vhdl_severity = Level2
[STARC.22091]
vlog_severity = Level3
vlog_indexname = 2.1.5.3
vhdl_indexname = 22091
vhdl_severity = Level2
[STARC.22127]
vlog_severity = Level4
vlog_indexname = 1.4.3.4
vhdl_indexname = 1.4.3.4
vhdl_description = "Do not supply clock signal to other than FF clock input pins"
vhdl_severity = Level4
[STARC.22131]
vlog_severity = Level4
vlog_indexname = 1.4.3.2
vhdl_indexname = 1.4.3.2
vhdl_description = "Do not input FF output pin to other FF clock pins"
vhdl_severity = Level4
[STARC.22165]
vlog_severity = Level3
vlog_indexname = "2.3.5.1 3.3.3.1"
vhdl_indexname = "2.3.5.1 3.3.3.1"
vhdl_description = "Do not make descriptions that generate FFs with a fixed input value"
vhdl_severity = Level3
[STARC.22169]
vlog_severity = Level4
vlog_indexname = 2.1.3.2
vhdl_indexname = 2.1.3.2
vhdl_description = "Match the return value bit width and the bit width of the assignment destination signal"
vhdl_severity = Level4
[STARC.22175]
vlog_severity = Level4
vlog_indexname = 1.3.1.6
vhdl_indexname = 1.3.1.6
vhdl_description = "Do not have both asynchronous reset and synchronous reset on a reset line"
vhdl_severity = Level4
[STARC.22187]
vlog_severity = Level4
vlog_indexname = 2.3.1.5
vhdl_indexname = 22187
vhdl_severity = Level2
[STARC.22199]
vlog_severity = Level4
vlog_indexname = 2.1.4.7
vhdl_indexname = 22199
vhdl_severity = Level2
[STARC.22203]
vlog_severity = Level5
vlog_indexname = 1.3.1.3-1
vhdl_indexname = 1.3.1.3-1
vlog_val = ASYNC
vhdl_description = "Do not use asynchronous reset pins for anything other than initial reset"
vhdl_severity = Level5
vhdl_val = ASYNC
[STARC.22205]
vlog_severity = Level4
vlog_indexname = 1.3.2.2
vhdl_indexname = 1.3.2.2
vlog_val = BOTH
vhdl_description = "Do not insert FF output to FF asynchronous reset pin"
vhdl_severity = Level4
vhdl_val = BOTH
[STARC.22225]
vlog_severity = Level3
vlog_indexname = "1.2.1.1 1.4.3.1"
vhdl_indexname = "1.2.1.1 1.4.3.1"
vlog_val = TRUE
vhdl_description = "Do not reverse on the same clock line, not use FF with different edges"
vhdl_severity = Level3
vhdl_val = TRUE
[STARC.22227]
vlog_severity = Level5
vlog_indexname = 1.3.1.3-1
vhdl_indexname = 1.3.1.3-1
vlog_val = ASYNC
vhdl_description = "Do not use asynchronous set pins for anything other than initial reset"
vhdl_severity = Level5
vhdl_val = ASYNC
[STARC.22239]
vlog_severity = Level5
vlog_indexname = 2.8.5.4
vhdl_indexname = 2.8.5.4
vhdl_description = "Do not describe variables (or expression: a+b) in the case statement clause"
vhdl_severity = Level5
[STARC.22243]
vlog_severity = Level4
vlog_indexname = 2.8.3.5
vhdl_indexname = 22243
vhdl_severity = Level2
[STARC.22255]
vlog_severity = Level4
vlog_indexname = "2.1.2.4 2.1.3.5"
vhdl_indexname = "2.1.2.4 2.1.3.5"
vlog_val = BOTH
vhdl_description = "In function statement, global signal assignment should not be performed"
vhdl_severity = Level4
vhdl_val = BOTH
[STARC.22275]
vlog_severity = Level3
vlog_indexname = "1.4.1.1 1.4.4.1"
vhdl_indexname = "1.4.1.1 1.4.4.1"
vhdl_description = "Make circuits that supply clocks separate modules"
vhdl_severity = Level3
[STARC.22277]
vlog_severity = Level4
vlog_indexname = 1.3.3.4
vhdl_indexname = 1.3.3.4
vhdl_description = "create a layer, which consists of reset generation only, under the top layer"
vhdl_severity = Level4
[STARC.23003]
vlog_severity = Level2
vlog_indexname = "2.2.1.1 2.2.1.2"
vhdl_indexname = "2.2.1.1 2.2.1.2"
vhdl_description = "Latches are generated unless all conditions are covered"
vhdl_severity = Level2
[STARC.23011]
vlog_severity = Level4
vlog_indexname = "2.2.2.1 2.2.2.2"
vhdl_indexname = "2.2.2.1 2.2.2.2"
vhdl_description = "Define in the sensitivity list all conditional expressions in the always construct and signals on the right side of the assignment statements"
vhdl_severity = Level4
[STARC.23015]
vlog_severity = Level4
vlog_indexname = 2.3.1.1
vhdl_indexname = 23015
vlog_val = BLOCKING,REG_INFER_ASSIGN
vhdl_severity = Level2
[STARC.23016]
vlog_severity = Level3
vlog_indexname = 2.2.3.1
vhdl_indexname = 23016
vlog_val = NONBLOCKING,FALSE
vhdl_severity = Level2
[STARC.23027]
vlog_severity = Level4
vlog_indexname = 2.9.1.2-1
vhdl_indexname = 2.9.1.2-1
vlog_val = IGNORE_SUBPROG
vhdl_description = "Initial value and conditions of for statement should be constant"
vhdl_severity = Level4
vhdl_val = IGNORE_SUBPROG
[STARC.23033]
vlog_severity = Level5
vlog_indexname = 2.10.6.6-1
vhdl_indexname = 23033
vlog_val = CONSTANT
vhdl_severity = Level2
[STARC.23034]
vlog_severity = Level5
vlog_indexname = 2.10.6.6-2
vhdl_indexname = 23034
vhdl_severity = Level2
[STARC.23035]
vlog_severity = Level4
vlog_indexname = 2.9.1.2-2
vhdl_indexname = 23035
vhdl_severity = Level2
[STARC.23037]
vlog_severity = Level5
vlog_indexname = 2.3.2.2
vhdl_indexname = 23037
vhdl_severity = Level2
[STARC.23057]
vlog_severity = Level2
vlog_indexname = 2.3.4.2
vhdl_indexname = 23057
vhdl_severity = Level2
[STARC.23059]
vlog_severity = Level3
vlog_indexname = 2.1.2.5
vhdl_indexname = 23059
vhdl_severity = Level2
[STARC.23077]
vlog_severity = Level5
vlog_indexname = 3.2.4.3
vhdl_indexname = 23077
vhdl_severity = Level2
[STARC.23099]
vlog_severity = Level5
vlog_indexname = "2.7.4.3 4.3.8.4"
vhdl_indexname = "23099"
vhdl_severity = Level2
[STARC.23121]
vlog_severity = Level5
vlog_indexname = 2.3.4.3
vhdl_indexname = 2.3.4.3
vlog_val = BOTH
vhdl_description = "Execute FF initial values by initial reset signals"
vhdl_severity = Level5
vhdl_val = BOTH
[STARC.23123]
vlog_severity = Level3
vlog_indexname = 2.8.5.1
vhdl_indexname = 2.8.5.1
vlog_val = BOTH,IGNORE_MULTI_CHOICE
vhdl_description = "Do not describe case statements with overlapping value of clauses"
vhdl_severity = Level3
[STARC.23131]
vlog_severity = Level3
vlog_indexname = "2.10.1.4 2.10.1.5 2.10.1.6"
vhdl_indexname = "23131"
vlog_val = IGNORE_DEFAULT
vhdl_severity = Level2
[STARC.23135]
vlog_severity = Level4
vlog_indexname = 2.3.1.6
vhdl_indexname = 23135
vhdl_severity = Level2
[STARC.24001]
vlog_severity = Level5
vlog_indexname = 1.1.1.3
vhdl_indexname = 24001
vhdl_severity = Level2
[STARC.24007]
vlog_severity = Level5
vlog_indexname = 1.1.1.5
vhdl_indexname = 24007
vhdl_severity = Level2
[STARC.24021]
vlog_severity = Level4
vlog_indexname = 1.1.4.4
vhdl_indexname = 24021
vhdl_severity = Level2
[STARC.25015]
vlog_severity = Level3
vlog_indexname = 1.6.2.1
vhdl_indexname = 1.6.2.1
vhdl_description = "Make all basic blocks combinational circuit input and FF output"
vhdl_severity = Level3
[STARC.27028]
vlog_severity = Level5
vlog_indexname = 1.1.1.4
vhdl_indexname = 1.1.1.4
vlog_val = "VSS,VDD,GND"
vhdl_description = "Do not use names containing VSS, VDD, or GND"
vhdl_severity = Level5
vhdl_val = "VSS,VDD,GND"
[STARC.27123]
vlog_severity = Level3
vlog_indexname = 2.6.1.5
vhdl_indexname = 2.6.1.5
vhdl_description = "Use intermediate variables in many ways"
vhdl_severity = Level3
[STARC.27209]
vlog_severity = Level3
vlog_indexname = "1.1.1.9-1 1.1.2.1"
vhdl_indexname = "1.1.1.9-1 1.1.2.1"
vlog_val = 12,16
vhdl_description = "Top level module names should be within 12 characters"
vhdl_severity = Level3
vhdl_val = 12,16
[STARC.27211]
vlog_severity = Level3
vlog_indexname = 1.1.1.9-2
vhdl_indexname = 1.1.1.9-2
vlog_val = CASE_LOWER
vhdl_description = "Top level module names should be defined using either upper English letters or lower letters"
vhdl_severity = Level3
vhdl_val = CASE_LOWER
[STARC.27277]
vlog_severity = Level3
vlog_indexname = 1.1.4.2
vhdl_indexname = 1.1.4.2
vlog_val = PREFIX,P_
vhdl_description = "Parameter names should start with P_"
vhdl_severity = Level3
vhdl_val = PREFIX,P_
[STARC.27365]
vlog_severity = Level3
vlog_indexname = 2.8.4.3
vhdl_indexname = 27365
vlog_val = CASEX
vhdl_severity = Level2
[STARC.27371]
vlog_severity = Level5
vlog_indexname = "1.3.1.5 2.8.1.5 2.8.5.2"
vhdl_indexname = "1.3.1.5 2.8.1.5 2.8.5.2"
vlog_val = "sync_set_reset,full_case,parallel_case"
vhdl_description = "Do not use the Design Compiler directive sync_set_reset, full_case, parallel_case"
vhdl_severity = Level5
vhdl_val = "sync_set_reset,full_case,parallel_case"
[STARC.27375]
vlog_severity = Level3
vlog_indexname = 1.1.1.2
vhdl_indexname = 1.1.1.2
vlog_val = [a-zA-Z\][a-zA-Z_]*
vhdl_description = "Only alphanumeric characters and the underscore should be used and the first character should be a letter of the alphabet"
vhdl_severity = Level3
vhdl_val = [a-zA-Z\][a-zA-Z_]*
[STARC.Basic Design Constraints]
21001 = Enable Enable TRUE TRUE
21003 = Enable Enable TRUE TRUE
21005 = Enable Enable TRUE TRUE
21011 = Enable Enable TRUE TRUE
21013 = Enable Enable TRUE TRUE
21015 = Enable Enable TRUE TRUE
21020 = Enable Enable TRUE TRUE
21025 = Enable NONE TRUE NONE
21044 = Enable Enable TRUE TRUE
22007 = Enable Enable TRUE TRUE
22011 = Enable Enable TRUE TRUE
22043 = Enable Enable TRUE TRUE
22049 = Enable Enable TRUE TRUE
22053 = Enable Enable TRUE TRUE
22056 = Enable Enable TRUE TRUE
22127 = Enable Enable TRUE TRUE
22131 = Enable Enable TRUE TRUE
22175 = Enable Enable TRUE TRUE
22203 = Enable Enable TRUE TRUE
22205 = Enable Enable TRUE TRUE
22225 = Enable Enable TRUE TRUE
22227 = Enable Enable TRUE TRUE
22275 = Enable Enable TRUE TRUE
22277 = Enable Enable TRUE TRUE
24001 = Enable NONE TRUE NONE
24007 = Enable NONE TRUE NONE
24021 = Enable NONE TRUE NONE
25015 = Enable Enable TRUE TRUE
27028 = Enable Enable TRUE TRUE
27209 = Enable Enable TRUE TRUE
27211 = Enable Enable TRUE TRUE
27277 = Enable Enable TRUE TRUE
27371 = Enable Enable TRUE TRUE
27375 = Enable Enable TRUE TRUE
[STARC.RTL Description Techniques]
21023 = Enable Enable TRUE TRUE
22004 = Enable Enable TRUE TRUE
22021 = Enable Enable TRUE TRUE
22063 = Enable Enable TRUE TRUE
22067 = Enable Enable TRUE TRUE
22075 = Enable NONE TRUE NONE
22077 = Enable NONE TRUE NONE
22085 = Enable Enable TRUE TRUE
22089 = Enable NONE TRUE NONE
22091 = Enable NONE TRUE NONE
22165 = Enable Enable TRUE TRUE
22169 = Enable Enable TRUE TRUE
22187 = Enable NONE TRUE NONE
22199 = Enable NONE TRUE NONE
22239 = Enable Enable TRUE TRUE
22243 = Enable NONE TRUE NONE
22255 = Enable Enable TRUE TRUE
23003 = Enable Enable TRUE TRUE
23011 = Enable Enable TRUE TRUE
23015 = Enable Enable TRUE TRUE
23016 = Enable Enable TRUE NONE
23027 = Enable Enable TRUE TRUE
23033 = Enable NONE TRUE NONE
23034 = Enable NONE TRUE NONE
23035 = Enable NONE TRUE NONE
23037 = Enable Enable TRUE TRUE
23057 = Enable NONE TRUE NONE
23059 = Enable NONE TRUE NONE
23099 = Enable NONE TRUE NONE
23121 = Enable Enable TRUE TRUE
23123 = Enable NONE TRUE NONE
23131 = Enable NONE TRUE NONE
23135 = Enable NONE TRUE NONE
27123 = NONE   NONE TRUE TRUE
27365 = Enable NONE TRUE NONE
27371 = Enable Enable TRUE TRUE
[STARC.RTL Design Methodology]
22023 = Enable Enable TRUE TRUE
22025 = Enable Enable TRUE TRUE
22027 = Enable Enable TRUE TRUE
22029 = Enable Enable TRUE TRUE
22031 = Enable Enable TRUE TRUE
22035 = Enable Enable TRUE TRUE
22038 = Enable Enable TRUE TRUE
22039 = Enable Enable TRUE TRUE
22049 = Enable Enable TRUE TRUE
23077 = Enable NONE TRUE NONE
[STARC.Verification Techniques]
22043 = Enable Enable TRUE TRUE
23099 = Enable NONE TRUE NONE
[STARC.include]
1 = "Basic Design Constraints" Enable TRUE
2 = "RTL Description Techniques" Enable TRUE
3 = "RTL Design Methodology" Enable TRUE
4 = "Verification Techniques" Enable TRUE
[nLint.21001]
vlog_severity = Level2
vlog_val = CASE_LOWER
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.21003]
vlog_severity = Level2
vlog_val = CASE_LOWER
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.21005]
vlog_severity = Level2
vlog_val = CASE_LOWER
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.21007]
vlog_severity = Level2
vlog_val = 16
vhdl_severity = Level2
vhdl_val = 16
[nLint.21009]
vlog_severity = Level2
vlog_val = 16
vhdl_severity = Level2
vhdl_val = 16
[nLint.21011]
vlog_severity = Level2
vlog_val = 16
vhdl_severity = Level2
vhdl_val = 16
[nLint.21013]
vlog_severity = Level2
vlog_val = PREFIX,clk_
vhdl_severity = Level2
vhdl_val = PREFIX,clk_
[nLint.21015]
vlog_severity = Level2
vlog_val = PREFIX,rst_
vhdl_severity = Level2
vhdl_val = PREFIX,rst_
[nLint.21017]
vlog_severity = Level2
vlog_val = PREFIX,set_
vhdl_severity = Level2
vhdl_val = PREFIX,set_
[nLint.21019]
vlog_severity = Level2
vlog_val = SUFFIX,_cs
vhdl_severity = Level2
vhdl_val = SUFFIX,_cs
[nLint.21020]
vlog_severity = Level2
vlog_val = SUFFIX,_n
vhdl_severity = Level2
vhdl_val = SUFFIX,_n
[nLint.21021]
vlog_severity = Level2
vlog_val = SUFFIX,_p
vhdl_severity = Level2
vhdl_val = SUFFIX,_p
[nLint.21022]
vlog_severity = Level2
vlog_val = "TRUE,RESET_LOW,rst_.*_n;FALSE,RESET_HIGH,rst_.*_p;TRUE,SET_LOW,set_.*_n;TRUE,SET_HIGH,set_.*_p;FALSE,LATCH_ENABLE_LOW,;FALSE,LATCH_ENABLE_HIGH,;FALSE,TRI_ENABLE_LOW,;FALSE,TRI_ENABLE_HIGH,"
vhdl_severity = Level2
vhdl_val = "TRUE,RESET_LOW,rst_.*_n;FALSE,RESET_HIGH,rst_.*_p;TRUE,SET_LOW,set_.*_n;TRUE,SET_HIGH,set_.*_p;FALSE,LATCH_ENABLE_LOW,;FALSE,LATCH_ENABLE_HIGH,;FALSE,TRI_ENABLE_LOW,;FALSE,TRI_ENABLE_HIGH,"
[nLint.21023]
vlog_severity = Level2
vlog_val = ZERO_BOUND,DOWN_TO
vhdl_severity = Level2
vhdl_val = ZERO_BOUND,DOWN_TO
[nLint.21025]
vlog_severity = Level2
vlog_val = IGNORE_LIB_CELL
vhdl_severity = Level2
[nLint.21027]
vlog_severity = Level2
vlog_val = SUFFIX,_r
vhdl_severity = Level2
vhdl_val = SUFFIX,_r
[nLint.21029]
vlog_severity = Level2
vlog_val = SUFFIX,_a
vhdl_severity = Level2
vhdl_val = SUFFIX,_a
[nLint.21031]
vlog_severity = Level2
vlog_val = SUFFIX,_z
vhdl_severity = Level2
vhdl_val = SUFFIX,_z
[nLint.21035]
vlog_severity = Level2
vlog_val = SUFFIX,_nxt
vhdl_severity = Level2
vhdl_val = SUFFIX,_nxt
[nLint.21041]
vlog_severity = Level2
vlog_val = CASE_UPPER
vhdl_severity = Level2
vhdl_val = CASE_UPPER
[nLint.21043]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.21044]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.21045]
vlog_severity = Level2
vlog_val = 8,3
vhdl_severity = Level2
vhdl_val = 8,3
[nLint.21047]
vlog_severity = Level2
vlog_val = "O,0;I,1,l"
vhdl_severity = Level2
[nLint.21049]
vlog_severity = Level2
vlog_val = SUFFIX,_PROC
vhdl_severity = Level2
vhdl_val = SUFFIX,_PROC
[nLint.21050]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.21051]
vlog_severity = Level2
vlog_val = PREFIX,U_
vhdl_severity = Level2
vhdl_val = PREFIX,U_
[nLint.21053]
vlog_severity = Level2
vlog_val = PREFIX,gate_
vhdl_severity = Level2
[nLint.21055]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.21057]
vlog_severity = Level2
vlog_val = PREFIX
vhdl_severity = Level2
vhdl_val = PREFIX
[nLint.22001]
vlog_severity = Level3
vlog_val = IGNORE_FLOATING
vhdl_severity = Level3
vhdl_val = IGNORE_FLOATING
[nLint.22002]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.22003]
vlog_severity = Level3
vlog_val = LHS_GE_RHS,VAR_GE_CON
vhdl_severity = Level3
vhdl_val = LHS_GE_RHS,VAR_GE_CON
[nLint.22004]
vlog_severity = Level3
vlog_val = VAR_EQ_CON
vhdl_severity = Level3
vhdl_val = VAR_EQ_CON
[nLint.22005]
vlog_severity = Level3
vlog_val = CONSTANT
vhdl_severity = Level3
vhdl_val = CONSTANT
[nLint.22006]
vlog_severity = Level3
vhdl_description = "x/z extended in significant bits"
vhdl_severity = Level3
[nLint.22007]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22008]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22009]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.22010]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22011]
vlog_severity = Level3
vlog_val = SYNC
vhdl_severity = Level3
vhdl_val = SYNC
[nLint.22012]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.22013]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22014]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22015]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22017]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22019]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.22021]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22022]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22023]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22025]
vlog_severity = Level2
vlog_val = 80
vhdl_severity = Level2
vhdl_val = 80
[nLint.22027]
vlog_severity = Level2
vlog_val = 2,"FIRST_INDENT, BEGIN_INDENT"
vhdl_severity = Level2
vhdl_val = 2,"FIRST_INDENT, BEGIN_INDENT"
[nLint.22029]
vlog_severity = Level2
vlog_val = CHECK_WHOLE
vhdl_severity = Level2
vhdl_val = CHECK_WHOLE
[nLint.22031]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22033]
vlog_severity = Level2
vlog_val = FALSE,"INPUT, OUTPUT, INOUT, BUFFER, LINKAGE"
vhdl_severity = Level2
vhdl_val = FALSE,"INPUT, OUTPUT, INOUT, BUFFER, LINKAGE"
[nLint.22035]
vlog_severity = Level2
vlog_val = "INPUT, OUTPUT, INOUT, BUFFER, LINKAGE","CLOCK, RESET, SET, ENABLE, TE, CONTROL"
vhdl_severity = Level2
vhdl_val = "INPUT, OUTPUT, INOUT, BUFFER, LINKAGE","CLOCK, RESET, SET, ENABLE, TE, CONTROL"
[nLint.22038]
vlog_severity = Level2
vlog_val = IGNORE_COMMENT
vhdl_severity = Level2
vhdl_val = IGNORE_COMMENT
[nLint.22039]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22041]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22043]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22044]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22049]
vlog_severity = Level2
vlog_val = "ENTITY, ARCHITECTURE"
vhdl_severity = Level2
vhdl_val = "ENTITY, ARCHITECTURE"
[nLint.22053]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22054]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22055]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22056]
vlog_severity = Level2
vlog_val = BOTH
vhdl_severity = Level2
vhdl_val = BOTH
[nLint.22057]
vlog_severity = Level2
vlog_val = BOTH
vhdl_severity = Level2
vhdl_val = BOTH
[nLint.22058]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22059]
vlog_severity = Level2
vlog_val = BOTH
vhdl_severity = Level2
vhdl_val = BOTH
[nLint.22061]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22063]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22067]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22075]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.22077]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22079]
vlog_severity = Level2
vlog_val = IGNORE_PARAMETER
vhdl_severity = Level2
vhdl_val = IGNORE_PARAMETER
[nLint.22082]
vlog_severity = Level3
vlog_val = "INPUT, INOUT"
vhdl_severity = Level3
vhdl_val = "INPUT, INOUT"
[nLint.22083]
vlog_severity = Level2
vlog_val = 32
vhdl_severity = Level2
vhdl_val = 32
[nLint.22085]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22089]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.22091]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22097]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22098]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22101]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.22103]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22104]
vlog_severity = Level3
vlog_val = VAR_GE_CON
vhdl_severity = Level3
vhdl_val = VAR_GE_CON
[nLint.22105]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22107]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22108]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22109]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22112]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.22113]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.22115]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22117]
vlog_severity = Level2
vlog_val = SYNC
vhdl_severity = Level2
vhdl_val = BOTH
[nLint.22119]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22121]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22125]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22127]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22129]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22130]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22131]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22139]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.22149]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22151]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.22152]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22153]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22155]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22157]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22159]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22161]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22165]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22167]
vlog_severity = Level1
vhdl_severity = Level1
[nLint.22169]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.22175]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22176]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22177]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.22179]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.22181]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22187]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22193]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22195]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22199]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22201]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22203]
vlog_severity = Level2
vlog_val = BOTH
vhdl_severity = Level2
vhdl_val = BOTH
[nLint.22204]
vlog_severity = Level2
vlog_val = BOTH
vhdl_severity = Level2
vhdl_val = BOTH
[nLint.22205]
vlog_severity = Level2
vlog_val = BOTH
vhdl_severity = Level2
vhdl_val = BOTH
[nLint.22207]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22209]
vlog_severity = Level2
vlog_val = IGNORE_ADDR
vhdl_severity = Level2
vhdl_val = IGNORE_ADDR
[nLint.22211]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.22213]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.22217]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.22219]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.22220]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22221]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22223]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22225]
vlog_severity = Level3
vlog_val = TRUE
vhdl_severity = Level3
vhdl_val = TRUE
[nLint.22227]
vlog_severity = Level2
vlog_val = BOTH
vhdl_severity = Level2
vhdl_val = BOTH
[nLint.22229]
vlog_severity = Level2
vlog_val = CONTROL
vhdl_severity = Level2
vhdl_val = CONTROL
[nLint.22231]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22233]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22235]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.22239]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22243]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22247]
vlog_severity = Level3
vlog_val = CHECK_DEPEND
vhdl_description = "delay in non-blocking assignment"
vhdl_severity = Level3
[nLint.22249]
vlog_severity = Level3
vlog_val = VAR_GE_CON
vhdl_severity = Level2
[nLint.22251]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22255]
vlog_severity = Level2
vlog_val = BOTH
vhdl_severity = Level2
vhdl_val = BOTH
[nLint.22259]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22261]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22263]
vlog_severity = Level3
vhdl_description = "null port used"
vhdl_severity = Level3
[nLint.22265]
vlog_severity = Level3
vlog_val = VAR_GE_CON
vhdl_severity = Level2
[nLint.22267]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22268]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.22269]
vlog_severity = Level2
vlog_val = SYNC,30
vhdl_severity = Level2
vhdl_val = SYNC,30
[nLint.22271]
vlog_severity = Level2
vlog_val = 10
vhdl_severity = Level2
vhdl_val = 20
[nLint.22273]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.22275]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.22277]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.22279]
vlog_severity = Level3
vlog_val = "INPUT, INOUT"
vhdl_severity = Level3
vhdl_val = "INPUT, INOUT"
[nLint.22281]
vlog_severity = Level3
vlog_val = "INPUT, INOUT"
vhdl_description = "gate port is not connected"
vhdl_severity = Level3
[nLint.22283]
vlog_severity = Level3
vlog_val = "INPUT, INOUT"
vhdl_description = "gate port is deliberately not connected"
vhdl_severity = Level3
[nLint.23001]
vlog_severity = Level2
vlog_val = IGNORE_IN_COMB
vhdl_severity = Level2
vhdl_val = IGNORE_IN_COMB
[nLint.23002]
vlog_severity = Level2
vlog_val = "REGISTER, LATCH, MEMORY, COUNTER"
vhdl_severity = Level2
vhdl_val = "REGISTER, LATCH, MEMORY, COUNTER"
[nLint.23003]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23004]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23005]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23007]
vlog_severity = Level2
vlog_val = IGNORE_IN_SEQ
vhdl_severity = Level2
[nLint.23008]
vlog_severity = Level3
vlog_val = IGNORE_IN_SEQ
vhdl_description = "default is not found"
vhdl_severity = Level3
[nLint.23011]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.23013]
vlog_severity = Level3
vlog_val = BOTH,IGNORE_PART_SEL
vhdl_severity = Level3
vhdl_val = BOTH,IGNORE_PART_SEL
[nLint.23015]
vlog_severity = Level3
vlog_val = BLOCKING,TEMP_ASSIGN
vhdl_severity = Level2
[nLint.23016]
vlog_severity = Level3
vlog_val = NONBLOCKING,FALSE
vhdl_severity = Level2
[nLint.23017]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23021]
vlog_severity = Level2
vlog_val = NON_LEAF,""
vhdl_severity = Level2
[nLint.23025]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23026]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23027]
vlog_severity = Level2
vlog_val = IGNORE_SUBPROG
vhdl_severity = Level2
vhdl_val = IGNORE_SUBPROG
[nLint.23028]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23029]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.23030]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.23031]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.23033]
vlog_severity = Level2
vlog_val = CONSTANT
vhdl_severity = Level2
[nLint.23034]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23035]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23037]
vlog_severity = Level3
vhdl_description = "mixed blocking and non-blocking assignments"
vhdl_severity = Level3
[nLint.23039]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23042]
vlog_severity = Level2
vlog_val = "CLOCK, RESET, SET, LATCH_ENABLE, TRI_ENABLE"
vhdl_severity = Level2
vhdl_val = "CLOCK, RESET, SET, LATCH_ENABLE, TRI_ENABLE"
[nLint.23043]
vlog_severity = Level2
vlog_val = "CLOCK, RESET, SET, LATCH_ENABLE, TRI_ENABLE"
vhdl_severity = Level2
vhdl_val = "CLOCK, RESET, SET, LATCH_ENABLE, TRI_ENABLE"
[nLint.23044]
vlog_severity = Level2
vlog_val = "LATCH_ENABLE, TRI_ENABLE"
vhdl_severity = Level2
vhdl_val = "LATCH_ENABLE, TRI_ENABLE"
[nLint.23045]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23047]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23049]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23051]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23053]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23055]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23057]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23059]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23061]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23065]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23069]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23071]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23073]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23075]
vlog_severity = Level3
vhdl_description = "delay ignored by synthesis"
vhdl_severity = Level3
[nLint.23077]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23079]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23083]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23087]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23089]
vlog_severity = Level2
vhdl_description = "delay control ignored by synthesis"
vhdl_severity = Level3
[nLint.23091]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23095]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23097]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23099]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23101]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23103]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23105]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23107]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23109]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23115]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23117]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23119]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23121]
vlog_severity = Level3
vlog_val = BOTH
vhdl_severity = Level3
vhdl_val = BOTH
[nLint.23122]
vlog_severity = Level3
vlog_val = IGNORE_NOTFULL
vhdl_severity = Level3
vhdl_val = IGNORE_NOTFULL
[nLint.23123]
vlog_severity = Level2
vlog_val = BOTH,IGNORE_MULTI_ITEM
vhdl_severity = Level2
[nLint.23125]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23127]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23129]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23131]
vlog_severity = Level2
vlog_val = IGNORE_DEFAULT
vhdl_severity = Level2
[nLint.23133]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23135]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23137]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.23401]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.23405]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.23409]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.24001]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.24003]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.24007]
vlog_severity = Level3
vhdl_description = "names distinguishable in letter case only"
vhdl_severity = Level3
[nLint.24009]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.24011]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.24013]
vlog_severity = Level2
vlog_val = "IFDEF, IFNDEF"
vhdl_severity = Level2
[nLint.24015]
vlog_severity = Level2
vlog_val = "synopsys,translate_off,translate_on,parallel_case,full_case,state_vector,enum,template,dc_script_begin, dc_script_end,map_to_module,return_port_name,sync_set_reset,async_set_reset,async_set_reset_local,sync_set_reset_local, async_set_reset_local_all,sync_\
set_reset_local_all,one_hot,one_cold"
vhdl_severity = Level2
vhdl_val = "synopsys,translate_off,translate_on,parallel_case,full_case,state_vector,enum,template,dc_script_begin, dc_script_end,map_to_module,return_port_name,sync_set_reset,async_set_reset,async_set_reset_local,sync_set_reset_local, async_set_reset_local_all,sync_\
set_reset_local_all,one_hot,one_cold"
[nLint.24017]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.24019]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.24021]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.25001]
vlog_severity = Level3
vlog_val = "CHECK_PART_SEL, IGNORE_INITIALVALUE, CHECK_THROUGH_HIERARCHY,CHECK_TOP_SIGNAL"
vhdl_severity = Level3
vhdl_val = "CHECK_PART_SEL, IGNORE_INITIALVALUE, CHECK_THROUGH_HIERARCHY,CHECK_TOP_SIGNAL"
[nLint.25003]
vlog_severity = Level2
vlog_val = "CHECK_TOP_SIGNAL, CHECK_THROUGH_HIERARCHY"
vhdl_severity = Level2
vhdl_val = "CHECK_TOP_SIGNAL, CHECK_THROUGH_HIERARCHY"
[nLint.25005]
vlog_severity = Level3
vlog_val = BOTH
vhdl_severity = Level2
[nLint.25007]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.25009]
vlog_severity = Level2
vlog_val = 10,"CLOCK, RESET, SET, LATCH_ENABLE, TRI_ENABLE, SCAN_ENABLE"
vhdl_severity = Level2
vhdl_val = 10,"CLOCK, RESET, SET, LATCH_ENABLE, TRI_ENABLE, SCAN_ENABLE"
[nLint.25011]
vlog_severity = Level2
vlog_val = 10
vhdl_severity = Level2
vhdl_val = 10
[nLint.25013]
vlog_severity = Level2
vlog_val = 10
vhdl_severity = Level2
vhdl_val = 10
[nLint.25015]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.25016]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.25017]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.26001]
vlog_severity = Level2
vlog_val = 1024
vhdl_severity = Level2
[nLint.26003]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.26005]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.26007]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.26009]
vlog_severity = Level3
vhdl_severity = Level2
[nLint.26011]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.26013]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.26015]
vlog_severity = Level2
vlog_val = 8096
vhdl_severity = Level2
[nLint.27001]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27003]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27007]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27015]
vlog_severity = Level2
vlog_val = v
vhdl_severity = Level2
vhdl_val = vhd
[nLint.27027]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27028]
vlog_severity = Level2
vlog_val = 
vhdl_severity = Level2
vhdl_val = 
[nLint.27029]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27031]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27033]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27035]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27037]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27039]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27041]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27043]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27044]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27045]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27047]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27049]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27051]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27055]
vlog_severity = Level2
vlog_val = 1000
vhdl_severity = Level2
vhdl_val = 1000
[nLint.27063]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = CASE_UPPER
[nLint.27069]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27071]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27077]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27081]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27083]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = RESOLVED
[nLint.27085]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27093]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27095]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27099]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27101]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27105]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = "DELAYED,STABLE,QUIET,TRANSACTION"
[nLint.27107]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27109]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27111]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27115]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27119]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27122]
vlog_severity = Level2
vlog_val = IGNORE_IN_SEQ
vhdl_severity = Level2
[nLint.27123]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27124]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27125]
vlog_severity = Level2
vlog_val = IGNORE_TEMPVAR
vhdl_severity = Level2
vhdl_val = IGNORE_TEMPVAR
[nLint.27126]
vlog_severity = Level2
vlog_val = IGNORE_TEMPVAR
vhdl_severity = Level2
vhdl_val = IGNORE_TEMPVAR
[nLint.27127]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27128]
vlog_severity = Level3
vhdl_severity = Level3
[nLint.27143]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27144]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27155]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27159]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27163]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = 
[nLint.27181]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27201]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27203]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27205]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = SUFFIX,_ety
[nLint.27209]
vlog_severity = Level2
vlog_val = 3,16
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27211]
vlog_severity = Level2
vlog_val = CASE_LOWER
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27213]
vlog_severity = Level2
vlog_val = SUFFIX,_module
vhdl_severity = Level2
vhdl_val = SUFFIX,_arch
[nLint.27217]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27219]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27221]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = SUFFIX,_pkg
[nLint.27225]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27227]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27229]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = SUFFIX,_cfg
[nLint.27233]
vlog_severity = Level2
vlog_val = 3,16
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27235]
vlog_severity = Level2
vlog_val = CASE_LOWER
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27241]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27245]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = PREFIX,com_
[nLint.27249]
vlog_severity = Level2
vlog_val = 3,16
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27251]
vlog_severity = Level2
vlog_val = CASE_LOWER
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27257]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27259]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27261]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = PREFIX,c_
[nLint.27265]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27267]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27269]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = SUFFIX,_typ
[nLint.27273]
vlog_severity = Level2
vlog_val = 3,16
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27277]
vlog_severity = Level2
vlog_val = PREFIX,p_
vhdl_severity = Level2
vhdl_val = PREFIX,g_
[nLint.27285]
vlog_severity = Level2
vlog_val = PREFIX,s_
vhdl_severity = Level2
vhdl_val = PREFIX,s_
[nLint.27293]
vlog_severity = Level2
vlog_val = PREFIX,v_
vhdl_severity = Level2
vhdl_val = PREFIX,v_
[nLint.27297]
vlog_severity = Level2
vlog_val = 3,16
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27299]
vlog_severity = Level2
vlog_val = CASE_LOWER
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27301]
vlog_severity = Level2
vlog_val = PREFIX,f_
vhdl_severity = Level2
vhdl_val = PREFIX,f_
[nLint.27305]
vlog_severity = Level2
vlog_val = 3,16
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27307]
vlog_severity = Level2
vlog_val = CASE_LOWER
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27309]
vlog_severity = Level2
vlog_val = PREFIX,p_
vhdl_severity = Level2
vhdl_val = PREFIX,p_
[nLint.27313]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27315]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = CASE_LOWER
[nLint.27317]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = PREFIX,blk_
[nLint.27321]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = 3,16
[nLint.27325]
vlog_severity = Level2
vhdl_severity = Level2
vhdl_val = PREFIX,attr_
[nLint.27327]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27328]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27329]
vlog_severity = Level2
vlog_val = NET_DECL
vhdl_severity = Level2
[nLint.27331]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27333]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27335]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27337]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27339]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27341]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27343]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27345]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27347]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27349]
vlog_severity = Level2
vlog_val = END
vhdl_severity = Level2
[nLint.27351]
vlog_severity = Level2
vlog_val = "UNARY_PLUS, UNARY_MINUS, MULTIPLY, DIVIDE, MOD, POWER"
vhdl_severity = Level2
vhdl_val = "UNARY_PLUS, UNARY_MINUS, MULTIPLY, DIVIDE, MOD, POWER"
[nLint.27353]
vlog_severity = Level2
vlog_val = 
vhdl_severity = Level2
[nLint.27355]
vlog_severity = Level3
vlog_val = INPUT_SIGNAL_TO_OUTPUT_PORT
vhdl_description = "hierarchy interconnect conflict"
vhdl_severity = Level3
[nLint.27356]
vlog_severity = Level3
vhdl_description = "block assembly error in the same hierarchy level"
vhdl_severity = Level3
[nLint.27357]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27359]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27361]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27363]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27365]
vlog_severity = Level2
vlog_val = CASEX
vhdl_severity = Level2
[nLint.27367]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27369]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27371]
vlog_severity = Level2
vlog_val = "parallel_case,full_case"
vhdl_severity = Level2
vhdl_val = "parallel_case,full_case"
[nLint.27373]
vlog_severity = Level2
vlog_val = SUFFIX,_ns
vhdl_severity = Level2
vhdl_val = SUFFIX,_ns
[nLint.27375]
vlog_severity = Level2
vlog_val = .*
vhdl_severity = Level2
vhdl_val = .*
[nLint.27377]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27379]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27381]
vlog_severity = Level2
vlog_val = IGNORE_TIE_LOW_HIGH
vhdl_severity = Level2
vhdl_val = IGNORE_TIE_LOW_HIGH
[nLint.27383]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27385]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27387]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27389]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27505]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27507]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27509]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27515]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27517]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27518]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27519]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27521]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27522]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27523]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27524]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27525]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27529]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27531]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27533]
vlog_severity = Level2
vhdl_severity = Level3
[nLint.27535]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27536]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27537]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27539]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27541]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27543]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27545]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27549]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27550]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27551]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27553]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27557]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27559]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27561]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27563]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27565]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27567]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27571]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27573]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27575]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27577]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27581]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27585]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27587]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27589]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27595]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27597]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27598]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27599]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27601]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27605]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27609]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27610]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27613]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27615]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27617]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27619]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27621]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27623]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27625]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27627]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27629]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27631]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27633]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27635]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27639]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27641]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27643]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27645]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27649]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27651]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27653]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27655]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27657]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27661]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27662]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.27663]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.28009]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.28011]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.28015]
vlog_severity = Level2
vhdl_severity = Level2
[nLint.Block Interconnect]
27355 = Enable NONE TRUE NONE
27356 = Enable NONE TRUE NONE
[nLint.Clock]
22130 = Enable Enable TRUE TRUE
28009 = Enable Enable TRUE TRUE
28011 = Enable Enable TRUE TRUE
28015 = Enable Enable TRUE TRUE
[nLint.Coding Style]
21023 = Disable Disable TRUE TRUE
21043 = Disable Disable TRUE TRUE
21044 = Disable Disable TRUE TRUE
22021 = Enable Enable TRUE TRUE
22023 = Disable Disable TRUE TRUE
22025 = Disable Disable TRUE TRUE
22027 = Disable Disable TRUE TRUE
22029 = Disable Disable TRUE TRUE
22031 = Disable Disable TRUE TRUE
22033 = Disable Disable TRUE TRUE
22035 = Disable Disable TRUE TRUE
22038 = Disable Disable TRUE TRUE
22039 = Disable Disable TRUE TRUE
22041 = Disable NONE TRUE NONE
22043 = Disable Disable TRUE TRUE
22044 = Disable Disable TRUE TRUE
22049 = Disable Disable TRUE TRUE
22107 = Enable NONE TRUE NONE
22108 = Enable NONE TRUE NONE
22161 = Disable NONE TRUE NONE
24009 = Enable Enable TRUE TRUE
27001 = NONE Disable NONE TRUE
27027 = NONE Disable NONE TRUE
27028 = Enable Enable TRUE TRUE
27029 = NONE Disable NONE TRUE
27031 = NONE Disable NONE TRUE
27033 = NONE Disable NONE TRUE
27035 = NONE Disable NONE TRUE
27037 = NONE Disable NONE TRUE
27039 = NONE Disable NONE TRUE
27041 = NONE Disable NONE TRUE
27043 = NONE Disable NONE TRUE
27044 = NONE Disable NONE TRUE
27045 = NONE Disable NONE TRUE
27047 = NONE Disable NONE TRUE
27049 = NONE Disable NONE TRUE
27051 = NONE Disable NONE TRUE
27055 = Disable Disable TRUE TRUE
27069 = NONE Disable NONE TRUE
27071 = NONE Disable NONE TRUE
27077 = NONE Disable NONE TRUE
27081 = NONE Disable NONE TRUE
27083 = NONE Disable NONE TRUE
27085 = NONE Disable NONE TRUE
27093 = NONE Disable NONE TRUE
27095 = NONE Disable NONE TRUE
27099 = NONE Disable NONE TRUE
27101 = NONE Disable NONE TRUE
27105 = NONE Disable NONE TRUE
27107 = NONE Disable NONE TRUE
27109 = NONE Disable NONE TRUE
27111 = NONE Disable NONE TRUE
27115 = NONE Disable NONE TRUE
27119 = NONE Disable NONE TRUE
27124 = NONE Disable NONE TRUE
27143 = NONE Disable NONE TRUE
27144 = NONE Disable NONE TRUE
27339 = Enable NONE TRUE NONE
27347 = Enable Disable TRUE TRUE
27349 = Disable NONE TRUE NONE
27351 = Disable Disable TRUE TRUE
27353 = Disable NONE TRUE NONE
27357 = Disable NONE TRUE NONE
27363 = Disable NONE TRUE NONE
27365 = Disable NONE TRUE NONE
27367 = Disable NONE TRUE NONE
27371 = Disable Disable TRUE TRUE
27377 = Disable Disable TRUE TRUE
27379 = Enable NONE TRUE NONE
27389 = Disable NONE TRUE NONE
[nLint.DFT]
22001 = Enable Enable TRUE TRUE
22002 = Enable Enable TRUE TRUE
22007 = Disable Disable TRUE TRUE
22008 = Enable NONE TRUE NONE
22011 = Enable Enable TRUE TRUE
22013 = Enable Enable TRUE TRUE
22014 = Enable Enable TRUE TRUE
22053 = Disable Disable TRUE TRUE
22054 = Enable Enable TRUE TRUE
22055 = Enable Enable TRUE TRUE
22056 = Disable Disable TRUE TRUE
22057 = Disable Disable TRUE TRUE
22058 = Disable Disable TRUE TRUE
22059 = Enable Enable TRUE TRUE
22127 = Enable Enable TRUE TRUE
22129 = Enable Enable TRUE TRUE
22130 = Enable Enable TRUE TRUE
22131 = Enable Enable TRUE TRUE
22181 = Enable Enable TRUE TRUE
22203 = Enable Enable TRUE TRUE
22204 = Enable Enable TRUE TRUE
22205 = Enable Enable TRUE TRUE
22227 = Enable Enable TRUE TRUE
22229 = Enable Enable TRUE TRUE
22231 = Enable Enable TRUE TRUE
22269 = Enable Enable TRUE TRUE
22271 = Enable Enable TRUE TRUE
25001 = Enable Enable TRUE TRUE
25003 = Disable Disable TRUE TRUE
27381 = Disable Disable TRUE TRUE
27383 = Disable Disable TRUE TRUE
27385 = Disable Disable TRUE TRUE
27387 = Disable Disable TRUE TRUE
[nLint.Design Style]
22001 = Enable Enable TRUE TRUE
22002 = Enable Enable TRUE TRUE
22007 = Disable Disable TRUE TRUE
22008 = Disable NONE TRUE NONE
22010 = Enable Enable TRUE TRUE
22011 = Enable Enable TRUE TRUE
22013 = Enable Enable TRUE TRUE
22014 = Enable Enable TRUE TRUE
22017 = Enable Enable TRUE TRUE
22053 = Disable Disable TRUE TRUE
22054 = Enable Enable TRUE TRUE
22055 = Enable Enable TRUE TRUE
22056 = Disable Disable TRUE TRUE
22057 = Disable Disable TRUE TRUE
22058 = Disable Disable TRUE TRUE
22059 = Enable Enable TRUE TRUE
22061 = Disable Disable TRUE TRUE
22063 = Disable Disable TRUE TRUE
22067 = Disable Disable TRUE TRUE
22097 = Enable NONE TRUE NONE
22105 = Disable Disable TRUE TRUE
22117 = Disable Disable TRUE TRUE
22131 = Enable Enable TRUE TRUE
22149 = Disable Disable TRUE TRUE
22153 = Enable NONE TRUE NONE
22159 = Enable Enable TRUE TRUE
22167 = Enable Enable TRUE TRUE
22175 = Disable Disable TRUE TRUE
22176 = Disable Disable TRUE TRUE
22181 = Disable Disable TRUE TRUE
22201 = Disable Disable TRUE TRUE
22203 = Disable Disable TRUE TRUE
22204 = Disable Disable TRUE TRUE
22205 = Disable Disable TRUE TRUE
22221 = Disable Disable TRUE TRUE
22223 = Disable Disable TRUE TRUE
22225 = Disable Disable TRUE TRUE
22227 = Disable Disable TRUE TRUE
22229 = Disable Disable TRUE TRUE
22231 = Enable Enable TRUE TRUE
22233 = Disable Disable TRUE TRUE
22261 = Enable Enable TRUE TRUE
22263 = Enable NONE TRUE NONE
22269 = Enable Enable TRUE TRUE
22271 = Enable Enable TRUE TRUE
22273 = Disable Disable TRUE TRUE
22275 = Enable Enable TRUE TRUE
22277 = Disable Disable TRUE TRUE
23001 = Enable Enable TRUE TRUE
23035 = Enable NONE TRUE NONE
23037 = Enable Enable TRUE TRUE
23042 = Enable Enable TRUE TRUE
23043 = Enable Enable TRUE TRUE
23044 = Enable Enable TRUE TRUE
23121 = Disable Disable TRUE TRUE
23122 = Enable Enable TRUE TRUE
25001 = Enable Enable TRUE TRUE
25003 = Disable Disable TRUE TRUE
25005 = Disable NONE TRUE NONE
25007 = Enable NONE TRUE NONE
25009 = Disable Disable TRUE TRUE
25011 = Disable Disable TRUE TRUE
25013 = Disable Disable TRUE TRUE
25015 = Disable Disable TRUE TRUE
25016 = Disable Disable TRUE TRUE
25017 = Enable NONE TRUE NONE
27327 = NONE Enable NONE TRUE
27328 = Disable NONE TRUE NONE
27329 = Disable NONE TRUE NONE
27331 = NONE Enable NONE TRUE
27341 = NONE Enable NONE TRUE
27343 = Enable NONE TRUE NONE
27359 = Disable NONE TRUE NONE
27361 = Enable Enable TRUE TRUE
27369 = Disable Disable TRUE TRUE
[nLint.ERC]
23401 = Enable Enable TRUE TRUE
23405 = Enable Enable TRUE TRUE
23409 = Disable Disable TRUE TRUE
[nLint.HDL Translation]
24001 = Enable NONE TRUE NONE
24003 = NONE Enable NONE TRUE
24007 = Enable NONE TRUE NONE
24011 = Enable NONE TRUE NONE
24013 = Disable NONE TRUE NONE
27143 = NONE Disable NONE TRUE
27144 = NONE Disable NONE TRUE
[nLint.Language Construct]
22003 = Enable Enable TRUE TRUE
22004 = Enable Enable TRUE TRUE
22005 = Enable Enable TRUE TRUE
22006 = Enable NONE TRUE NONE
22009 = Enable NONE TRUE NONE
22012 = Enable Enable TRUE TRUE
22015 = Disable NONE TRUE NONE
22019 = Enable NONE TRUE NONE
22022 = Enable NONE TRUE NONE
22083 = Enable Enable TRUE TRUE
22085 = Enable Enable TRUE TRUE
22089 = Enable NONE TRUE NONE
22091 = Enable NONE TRUE NONE
22098 = Enable NONE TRUE NONE
22101 = Enable NONE TRUE NONE
22103 = Enable NONE TRUE NONE
22104 = Enable Enable TRUE TRUE
22109 = Enable NONE TRUE NONE
22119 = Enable NONE TRUE NONE
22121 = Enable NONE TRUE NONE
22125 = Enable NONE TRUE NONE
22139 = Enable NONE TRUE NONE
22151 = Enable NONE TRUE NONE
22152 = Disable NONE TRUE NONE
22155 = Enable Enable TRUE TRUE
22157 = Enable Enable TRUE TRUE
22165 = Disable Disable TRUE TRUE
22169 = Enable Enable TRUE TRUE
22187 = Enable NONE TRUE NONE
22199 = Enable NONE TRUE NONE
22209 = Enable Enable TRUE TRUE
22219 = Enable NONE TRUE NONE
22220 = Enable NONE TRUE NONE
22243 = Enable NONE TRUE NONE
22249 = NONE   NONE TRUE NONE
22251 = Enable NONE TRUE NONE
22255 = Enable Enable TRUE TRUE
22259 = Enable NONE TRUE NONE
22265 = Disable NONE TRUE NONE
22267 = Disable NONE TRUE NONE
22268 = Enable NONE TRUE NONE
23007 = Enable NONE TRUE NONE
23028 = Enable NONE TRUE NONE
23029 = Enable Enable TRUE TRUE
23030 = Enable Enable TRUE TRUE
23031 = Enable Enable TRUE TRUE
24011 = Enable NONE TRUE NONE
24013 = Disable NONE TRUE NONE
24015 = Enable Enable TRUE TRUE
24019 = Enable Enable TRUE TRUE
24021 = Disable NONE TRUE NONE
26001 = Disable NONE TRUE NONE
26003 = Disable NONE TRUE NONE
26005 = Enable NONE TRUE NONE
26007 = Enable NONE TRUE NONE
26009 = Enable NONE TRUE NONE
26011 = Disable NONE TRUE NONE
26013 = Enable NONE TRUE NONE
26015 = Disable NONE TRUE NONE
27333 = Enable NONE TRUE NONE
27345 = Disable NONE TRUE NONE
[nLint.Naming Convention]
21001 = Enable Enable TRUE TRUE
21003 = Enable Enable TRUE TRUE
21005 = Enable Enable TRUE TRUE
21007 = Enable Enable TRUE TRUE
21009 = Enable Enable TRUE TRUE
21011 = Enable Enable TRUE TRUE
21013 = Enable Enable TRUE TRUE
21015 = Enable Enable TRUE TRUE
21017 = Enable Enable TRUE TRUE
21019 = Enable Enable TRUE TRUE
21020 = Enable Enable TRUE TRUE
21021 = Enable Enable TRUE TRUE
21022 = Disable Disable TRUE TRUE
21025 = Enable NONE TRUE NONE
21027 = Enable Enable TRUE TRUE
21029 = Enable Enable TRUE TRUE
21031 = Enable Enable TRUE TRUE
21035 = Enable Enable TRUE TRUE
21041 = Enable Enable TRUE TRUE
21045 = Enable Enable TRUE TRUE
21047 = Enable NONE TRUE NONE
21049 = Enable Enable TRUE TRUE
21050 = Enable Enable TRUE TRUE
21051 = Enable Enable TRUE TRUE
21053 = Enable NONE TRUE NONE
21055 = Enable NONE TRUE NONE
21057 = Enable Enable TRUE TRUE
24007 = Enable NONE TRUE NONE
27007 = NONE Enable NONE TRUE
27015 = Enable Enable TRUE TRUE
27063 = NONE Enable NONE TRUE
27201 = NONE Enable NONE TRUE
27203 = NONE Enable NONE TRUE
27205 = NONE Enable NONE TRUE
27209 = Enable Enable TRUE TRUE
27211 = Enable Enable TRUE TRUE
27213 = Enable Enable TRUE TRUE
27217 = NONE Enable NONE TRUE
27219 = NONE Enable NONE TRUE
27221 = NONE Enable NONE TRUE
27225 = NONE Enable NONE TRUE
27227 = NONE Enable NONE TRUE
27229 = NONE Enable NONE TRUE
27233 = Enable Enable TRUE TRUE
27235 = Enable Enable TRUE TRUE
27241 = NONE Enable NONE TRUE
27245 = NONE Enable NONE TRUE
27249 = Enable Enable TRUE TRUE
27251 = Enable Enable TRUE TRUE
27257 = NONE Enable NONE TRUE
27259 = NONE Enable NONE TRUE
27261 = NONE Enable NONE TRUE
27265 = NONE Enable NONE TRUE
27267 = NONE Enable NONE TRUE
27269 = NONE Enable NONE TRUE
27273 = Enable Enable TRUE TRUE
27277 = Enable Enable TRUE TRUE
27285 = Enable Enable TRUE TRUE
27293 = Enable Enable TRUE TRUE
27297 = Enable Enable TRUE TRUE
27299 = Enable Enable TRUE TRUE
27301 = Enable Enable TRUE TRUE
27305 = Enable Enable TRUE TRUE
27307 = Enable Enable TRUE TRUE
27309 = Enable Enable TRUE TRUE
27313 = NONE Enable NONE TRUE
27315 = NONE Enable NONE TRUE
27317 = NONE Enable NONE TRUE
27321 = NONE Enable NONE TRUE
27325 = NONE Enable NONE TRUE
27373 = Enable Enable TRUE TRUE
27375 = Disable Disable TRUE TRUE
[nLint.Simulation]
22005 = Enable Enable TRUE TRUE
22006 = Enable NONE TRUE NONE
22009 = Enable NONE TRUE NONE
22011 = Enable Enable TRUE TRUE
22013 = Enable Enable TRUE TRUE
22014 = Enable Enable TRUE TRUE
22019 = Enable NONE TRUE NONE
22079 = Enable Enable TRUE TRUE
22082 = Enable Enable TRUE TRUE
22083 = Enable Enable TRUE TRUE
22085 = Enable Enable TRUE TRUE
22089 = Enable NONE TRUE NONE
22091 = Enable NONE TRUE NONE
22109 = Enable NONE TRUE NONE
22112 = Enable NONE TRUE NONE
22113 = Enable Enable TRUE TRUE
22115 = Enable NONE TRUE NONE
22139 = Enable NONE TRUE NONE
22151 = Enable NONE TRUE NONE
22152 = Disable NONE TRUE NONE
22169 = Enable Enable TRUE TRUE
22179 = Enable Enable TRUE TRUE
22187 = Enable NONE TRUE NONE
22195 = Enable Enable TRUE TRUE
22217 = Enable NONE TRUE NONE
22235 = Enable Enable TRUE TRUE
22243 = Enable NONE TRUE NONE
22247 = Enable Enable TRUE TRUE
22269 = Enable Enable TRUE TRUE
22271 = Enable Enable TRUE TRUE
22279 = Enable Enable TRUE TRUE
22281 = Enable NONE TRUE NONE
22283 = Enable NONE TRUE NONE
23008 = Enable NONE TRUE NONE
23011 = Enable Enable TRUE TRUE
23013 = Enable Enable TRUE TRUE
23028 = Enable NONE TRUE NONE
23029 = Enable Enable TRUE TRUE
23030 = Enable Enable TRUE TRUE
23123 = Enable NONE TRUE NONE
23125 = Enable NONE TRUE NONE
23131 = Enable NONE TRUE NONE
27003 = Enable Enable TRUE TRUE
27071 = NONE Enable NONE TRUE
27099 = NONE Disable NONE TRUE
27101 = NONE Enable NONE TRUE
27105 = NONE Enable NONE TRUE
27109 = NONE Enable NONE TRUE
27111 = NONE Enable NONE TRUE
27115 = NONE Enable NONE TRUE
27123 =  NONE   NONE TRUE TRUE
27125 = Enable Enable TRUE TRUE
27127 = Enable Enable TRUE TRUE
27335 = Disable Disable TRUE TRUE
27337 = Disable NONE TRUE NONE
27550 = NONE Enable NONE TRUE
27573 = NONE Enable NONE TRUE
27661 = Enable Enable TRUE TRUE
27662 = Enable NONE TRUE NONE
[nLint.Synthesis]
22019 = Enable NONE TRUE NONE
22075 = Enable NONE TRUE NONE
22077 = Enable NONE TRUE NONE
22083 = Enable Enable TRUE TRUE
22119 = Enable NONE TRUE NONE
22121 = Enable NONE TRUE NONE
22177 = Enable Enable TRUE TRUE
22193 = Enable NONE TRUE NONE
22207 = Enable NONE TRUE NONE
22211 = Disable Disable TRUE TRUE
22213 = Disable Disable TRUE TRUE
22239 = Enable Enable TRUE TRUE
22247 = Enable Enable TRUE TRUE
23001 = Enable Enable TRUE TRUE
23002 = Disable Disable TRUE TRUE
23003 = Enable Enable TRUE TRUE
23004 = Disable Disable TRUE TRUE
23005 = Enable Enable TRUE TRUE
23008 = Enable NONE TRUE NONE
23011 = Enable Enable TRUE TRUE
23015 = Enable Enable TRUE TRUE
23016 = Enable Enable TRUE TRUE
23017 = Disable Disable TRUE TRUE
23021 = Disable NONE TRUE NONE
23025 = Enable Enable TRUE TRUE
23026 = Enable NONE TRUE NONE
23027 = Enable Enable TRUE TRUE
23031 = Enable Enable TRUE TRUE
23033 = Enable NONE TRUE NONE
23034 = Enable NONE TRUE NONE
23035 = Enable NONE TRUE NONE
23037 = Enable Enable TRUE TRUE
23039 = Enable Enable TRUE TRUE
23042 = Enable Enable TRUE TRUE
23043 = Enable Enable TRUE TRUE
23044 = Enable Enable TRUE TRUE
23045 = Enable NONE TRUE NONE
23047 = Enable Enable TRUE TRUE
23049 = Enable NONE TRUE NONE
23051 = Enable NONE TRUE NONE
23053 = Enable NONE TRUE NONE
23055 = Disable NONE TRUE NONE
23057 = Enable NONE TRUE NONE
23059 = Enable NONE TRUE NONE
23061 = Enable NONE TRUE NONE
23065 = Enable NONE TRUE NONE
23069 = Enable NONE TRUE NONE
23071 = Enable Enable TRUE TRUE
23073 = Enable NONE TRUE NONE
23075 = Enable NONE TRUE NONE
23077 = Enable NONE TRUE NONE
23079 = Enable NONE TRUE NONE
23083 = Enable NONE TRUE NONE
23087 = Enable NONE TRUE NONE
23089 = Disable NONE TRUE NONE
23091 = Enable NONE TRUE NONE
23095 = Enable NONE TRUE NONE
23097 = Enable NONE TRUE NONE
23099 = Enable NONE TRUE NONE
23101 = Enable NONE TRUE NONE
23103 = Enable NONE TRUE NONE
23105 = Enable NONE TRUE NONE
23107 = Enable NONE TRUE NONE
23109 = Enable NONE TRUE NONE
23115 = Enable NONE TRUE NONE
23117 = Enable NONE TRUE NONE
23119 = Enable NONE TRUE NONE
23123 = Enable NONE TRUE NONE
23125 = Enable NONE TRUE NONE
23127 = Enable NONE TRUE NONE
23129 = Enable NONE TRUE NONE
23133 = Enable NONE TRUE NONE
23135 = Enable NONE TRUE NONE
23137 = Enable NONE TRUE NONE
24017 = Disable NONE TRUE NONE
27081 = NONE Enable NONE TRUE
27083 = NONE Enable NONE TRUE
27107 = NONE Enable NONE TRUE
27122 = Disable NONE TRUE NONE
27123 = NONE NONE TRUE TRUE
27126 = Enable Enable TRUE TRUE
27128 = Enable Enable TRUE TRUE
27181 = NONE Enable NONE TRUE
27335 = Disable Disable TRUE TRUE
27337 = Disable NONE TRUE NONE
27505 = NONE Enable NONE TRUE
27507 = NONE Enable NONE TRUE
27509 = NONE Enable NONE TRUE
27515 = NONE Enable NONE TRUE
27517 = NONE Enable NONE TRUE
27518 = NONE Enable NONE TRUE
27519 = NONE Enable NONE TRUE
27521 = NONE Enable NONE TRUE
27522 = NONE Enable NONE TRUE
27523 = NONE Enable NONE TRUE
27524 = NONE Enable NONE TRUE
27525 = NONE Enable NONE TRUE
27529 = NONE Disable NONE TRUE
27531 = NONE Enable NONE TRUE
27533 = NONE Enable NONE TRUE
27535 = NONE Enable NONE TRUE
27536 = NONE Enable NONE TRUE
27537 = NONE Enable NONE TRUE
27539 = NONE Enable NONE TRUE
27541 = NONE Enable NONE TRUE
27543 = NONE Enable NONE TRUE
27545 = NONE Enable NONE TRUE
27549 = NONE Enable NONE TRUE
27550 = NONE Enable NONE TRUE
27551 = NONE Enable NONE TRUE
27553 = NONE Enable NONE TRUE
27557 = NONE Enable NONE TRUE
27559 = NONE Enable NONE TRUE
27561 = NONE Enable NONE TRUE
27563 = NONE Enable NONE TRUE
27565 = NONE Enable NONE TRUE
27567 = NONE Enable NONE TRUE
27571 = NONE Enable NONE TRUE
27573 = NONE Enable NONE TRUE
27575 = NONE Enable NONE TRUE
27577 = NONE Enable NONE TRUE
27581 = NONE Enable NONE TRUE
27585 = NONE Enable NONE TRUE
27587 = NONE Enable NONE TRUE
27589 = NONE Enable NONE TRUE
27595 = NONE Enable NONE TRUE
27597 = NONE Enable NONE TRUE
27598 = NONE Enable NONE TRUE
27599 = NONE Enable NONE TRUE
27601 = NONE Enable NONE TRUE
27605 = NONE Enable NONE TRUE
27609 = NONE Enable NONE TRUE
27610 = NONE Enable NONE TRUE
27613 = NONE Enable NONE TRUE
27615 = NONE Enable NONE TRUE
27617 = NONE Enable NONE TRUE
27619 = NONE Enable NONE TRUE
27621 = NONE Enable NONE TRUE
27623 = NONE Enable NONE TRUE
27625 = NONE Enable NONE TRUE
27627 = NONE Enable NONE TRUE
27629 = NONE Enable NONE TRUE
27631 = NONE Enable NONE TRUE
27633 = NONE Enable NONE TRUE
27635 = NONE Enable NONE TRUE
27639 = NONE Enable NONE TRUE
27641 = NONE Enable NONE TRUE
27643 = NONE Enable NONE TRUE
27645 = NONE Enable NONE TRUE
27649 = NONE Enable NONE TRUE
27651 = NONE Enable NONE TRUE
27653 = NONE Enable NONE TRUE
27655 = NONE Enable NONE TRUE
27657 = NONE Enable NONE TRUE
27661 = Enable Enable TRUE TRUE
27662 = Enable NONE TRUE NONE
27663 = NONE Enable NONE TRUE
[nLint.VITAL Compliant]
27155 = NONE Enable NONE TRUE
27159 = NONE Enable NONE TRUE
27163 = NONE Disable NONE TRUE
[nLint.include]
1 = "Simulation" Enable TRUE
2 = "Synthesis" Enable TRUE
3 = "DFT" Disable TRUE
4 = "ERC" Enable TRUE
5 = "Design Style" Enable TRUE
6 = "Language Construct" Enable TRUE
7 = "HDL Translation" Enable TRUE
8 = "Coding Style" Enable TRUE
9 = "Naming Convention" Disable TRUE
10 = "VITAL Compliant" Disable TRUE
11 = "Clock" Enable TRUE
12 = "Block Interconnect" Enable TRUE
