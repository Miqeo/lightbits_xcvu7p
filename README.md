# Lightbits PCIe accelerator reverse engineering effort

![](/images/overall/IMG_3414.JPG)

## Preface

This effort is concentrated on reverse engineering of the Lightbits LBASSY0021 Xilinx Virtex Ultrascale+ XCVU7P fpga in form of the PCIe x16 low profile board. 

## Programming

The initial assessment of the programming interface was done and yelded the below table. The pinout is similar in nature to the 14-pin interface used in the Xilinx programmators. 

The board was successfully programmed with a mock logic to test wheter the interface if fully functional as well as the board is not locked in sone way that would halt the program. 

| Role | Pin number (latch side) | Pin number | Role |
|-|-|-|-|
|   GND |	    1 |	    2 |	    VCC sense |
|   GND |	    3 |	    4 |     TMS |
|   GND |	    5 |	    6 |     TCK |
|   GND |	    7 |	    8 |     TDO |
|   GND |       9 |	    10 |    TDI |
|   GND |	    11 |    12 |    NC |
|   GND |	    13 |    14 |	Unknown |
|   GND |	    15 |	16 |	Unknown |
|   GND |	    17 |	18 |	Unknown |
|   Unknown |	19 |	20 |	NC |


![](/images/overall/IMG_3410.JPG)

The response from the board after connecting it to JTAG probe and using Openocd was correct and was in line with what chip is present on this board as per the [UltraScale Architecture Configuration User Guide (UG570)](https://docs.amd.com/api/khub/maps/ioE1QkNEnAQuonKQY6T3pg/attachments/oSt8I_xWTUZb2SISl9jrPw-ioE1QkNEnAQuonKQY6T3pg/content?download=true&locationValue=reader). 

```
Info : usb blaster interface using libftdi
Info : This adapter doesn't support configurable speed
Info : JTAG tap: XCVU7P.tap tap/device found: 0x14b29093 (mfg: 0x049 (Xilinx), part: 0x4b29, ver: 0x1)
```
![](/images/programming/ug570_configuration_table.png)

## Next steps

The board is a complete unknown apart from the ability to reprogram it. There are multiple element that are needed to be decipherered:

- Pinout of the LEDs
- Clock source
- DDR pinout
- PCIe pinout

The status of the progress will be posted in the future in this section.

## Components onboard

The board itself features multiple packages that play a role in power management, memory and clocking. Some elements are yet to be identified and catalogued.

| Integrated circuit marking | Image | Part number | Descritpion |
|-|-|-|-|
| 1000000 DCP1838 05U9 | ![](/images/ics/DCP1838.jpg) | | Probably Abracon ASEMP series 100 MHz differential clock |
| 1TIR 91J | ![](/images/ics/1TIR.JPG) | | Unknown |
| 7BDS | ![](/images/ics/7DBS.JPG) | | Unknown |
| 32Y 849W S102I | ![](/images/ics/32Y849W.jpg) | | Unknown |
| 0505 XBPX | ![](/images/ics/0505XBPX.JPG) | | Unknown |
| 7418 GA9D12 | ![](/images/ics/7418.JPG) | AON7418 | MOSFET N-CH 30V 46A/50A |
| 1206 89K D8TG | ![](/images/ics/120689K.JPG) | | Unknown |
| LVC8T245 CWZ82422 TXD930B | ![](/images/ics/LVC8T245.JPG) | SN74LVC8T245 | 8-Bit Dual-Supply Bus Transceiver With Configurable Voltage Translation and 3-State Outputs |
| 9MAI7 RW299 PC3X | ![](/images/ics/RW299.JPG) | MT25QU512ABB8E12-0AUT | Serial NOR Flash Embedded Memory 1.8 or 3V |
| TPS2418 66K G4 A10Y | ![](/images/ics/TPS2418.JPG) | TPS2481 | 9-V to 80-V hot swap controller with I2C current monitor and Auto Retry |
| TPS24771 TI 871 AJDX | ![](/images/ics/TPS24771.JPG) | TPS24771 | 2.5-V to 18-V hot swap controller with high performance with analog current monitor |
| TPS40428 TI 7CI C0KI G4 | ![](/images/ics/TPS40428.JPG) | TPS40428 | Dual Output, 2-Phase, Stackable PMBus Synchronous Buck Driverless Controller |
| TPS53515 TI 91I A7IL | ![](/images/ics/TPS53515.JPG) | TPS53515 | 1.5V to 18V (4.5V to 25V Bias) Input, 12A Single Synchronous Step-Down SWIFT Converter |
| UCD90160A | ![](/images/ics/UCD90160A.JPG) | UCD90160A | 16-Rail Power Supply Sequencer and Monitor With ACPI Support |
| | | MT40A512M16LY-062E:E | 8Gb DDR4 SDRAM |

## Questions?

Reach out to me if you have any questions regarding this work or if you have some information usefull in deciphering this hardware. The best way will be opening an issue on this repo.