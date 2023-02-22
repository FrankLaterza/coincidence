#************************************************************
# THIS IS A WIZARD-GENERATED FILE.                           
#
# Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition
#
#************************************************************

# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.



# Clock constraints

create_clock -name clk -period 20.000ns [get_ports {clk}]
create_clock -name clk_400 -period 2.500ns [get_ports {clock_pll:pll|c0}]

derive_pll_clocks
derive_clock_uncertainty

# set_output_delay -clock clk -max 0.0 [get_ports DAC_DATA[5]]
# set_output_delay -clock clk -min 0.0 [get_ports DAC_DATA[5]]

set_output_delay -clock clk -min 0.0 [get_ports led2]
set_output_delay -clock clk -max 1.0 [get_ports led2]

# the counter
set_output_delay -clock clk -min 0.0 [get_ports count_out*]
set_output_delay -clock clk -max 1.0 [get_ports count_out*]

# the dec out
set_output_delay -clock clk -min 0.0 [get_ports dec_out_one*]
set_output_delay -clock clk -max 1.0 [get_ports dec_out_one*]

# the dec out
set_output_delay -clock clk -min 0.0 [get_ports dec_out_two*]
set_output_delay -clock clk -max 1.0 [get_ports dec_out_two*]

# the dec out
set_output_delay -clock clk -min 0.0 [get_ports dec_out_three*]
set_output_delay -clock clk -max 1.0 [get_ports dec_out_three*]

