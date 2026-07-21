# Global clock signal
set_property -dict {LOC AY30 IOSTANDARD LVDS} [get_ports i_clk_100mhz_p]
set_property -dict {LOC BA30 IOSTANDARD LVDS} [get_ports i_clk_100mhz_n]
create_clock -period 10 -name clk_100mhz [get_ports i_clk_100mhz_p]

# Flashing parameters
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 85.0 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

# QSPI flash
# sdi_dq0  - PACKAGE_PIN AK12     - QSPI0_DQ0                 Bank   0 - D00_MOSI_0
# sdo_dq1  - PACKAGE_PIN AJ12     - QSPI0_DQ1                 Bank   0 - D01_DIN_0
# wpn_dq2  - PACKAGE_PIN AL12     - QSPI0_DQ2                 Bank   0 - D02_0
# hldn_dq3 - PACKAGE_PIN AL12     - QSPI0_DQ3                 Bank   0 - D03_0
# csn      - PACKAGE_PIN AG12     - QSPI0_CS_B                Bank   0 - RDWR_FCS_B_0
# sck      - PACKAGE_PIN AG13     - QSPI_CCLK                 Bank   0 - CCLK_0

set_property -dict {LOC AL27 IOSTANDARD LVCMOS18} [get_ports { i_crystal }]; # unpopulated crystal input

set_property -dict {LOC BF8 IOSTANDARD LVCMOS18} [get_ports { o_led_6[0] }]; # LED 6 color 1
set_property -dict {LOC BF9 IOSTANDARD LVCMOS18} [get_ports { o_led_6[1] }];# LED 6 color 2

set_property -dict {LOC BF12 IOSTANDARD LVCMOS18} [get_ports { o_led_7[0] }]; # LED 7 color 1
set_property -dict {LOC BF7 IOSTANDARD LVCMOS18} [get_ports { o_led_7[1] }]; # LED 7 color 2

set_property -dict {LOC BE8 IOSTANDARD LVCMOS18} [get_ports { o_led_8[0] }]; # LED 8 color 1
set_property -dict {LOC BF10 IOSTANDARD LVCMOS18} [get_ports { o_led_8[1] }]; # LED 8 color 2
