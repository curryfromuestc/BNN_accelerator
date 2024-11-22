#############################################################
##   File name : set_dont_use.tcl
##   Author: FengXiaolong
##   Date: 2015-11-06 18:32
##   Modified date : 2015-11-06 18:32
##   Script Name: 
##     
##   Script Function: 
##    
#############################################################    
#set_attribute [get_lib_cells */INV_X0*] dont_use true -quiet
#set_attribute [get_lib_cells */BUF_X0*] dont_use true -quiet
set_dont_use [get_lib_cell */*CLK*]
set_dont_use [get_lib_cell */*DEL*]
set_dont_use [get_lib_cell */*TBUF*]
set_dont_use [get_lib_cell */*BUF*]
set_dont_use [get_lib_cell */*PULL*]
set_dont_use [get_lib_cell */*VHSV0*]
set_dont_use [get_lib_cell */*VHSV32*]
set_dont_use [get_lib_cell */*VHSV40*]
set_dont_use [get_lib_cell */*VHSV48*]
set_dont_use [get_lib_cell */*LAL*]
set_dont_use [get_lib_cell */*LAH*]
