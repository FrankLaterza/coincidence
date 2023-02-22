# read_sdc -hdl
create_clock -period 20 [get_ports clk]
set_input_delay 1.2 -clock [get_clocks clk] [get_ports btn]
set_output_delay 1.2 -clock [get_clocks clk] [get_ports led]
set_output_delay 1.2 -clock [get_clocks clk] [get_ports led2]