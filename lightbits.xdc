# Global clock signal
set_property -dict {LOC AY30 IOSTANDARD LVDS} [get_ports i_clk_100mhz_p]
set_property -dict {LOC BA30 IOSTANDARD LVDS} [get_ports i_clk_100mhz_n]
create_clock -period 10 -name clk_100mhz [get_ports i_clk_100mhz_p]

# unpopulated crystal input
set_property -dict {LOC AL27 IOSTANDARD LVCMOS18} [get_ports { i_crystal }]

# LED 6 color 1
set_property -dict {LOC BF8 IOSTANDARD LVCMOS18} [get_ports { o_led_6[0] }]
# LED 6 color 2
set_property -dict {LOC BF9 IOSTANDARD LVCMOS18} [get_ports { o_led_6[1] }]

# LED 7 color 1
set_property -dict {LOC BF12 IOSTANDARD LVCMOS18} [get_ports { o_led_7[0] }]
# LED 7 color 2
set_property -dict {LOC BF7 IOSTANDARD LVCMOS18} [get_ports { o_led_7[1] }]

# LED 8 color 1
set_property -dict {LOC BE8 IOSTANDARD LVCMOS18} [get_ports { o_led_8[0] }]
# LED 8 color 2
set_property -dict {LOC BF10 IOSTANDARD LVCMOS18} [get_ports { o_led_8[1] }]