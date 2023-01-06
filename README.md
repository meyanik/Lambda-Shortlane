
# Shortlane

Simple script for using fpga tools and asic tools for the same verilog file. All you need is a verilog file and a constraint file for your gowin GW1N-1 fpga and you are ready to go. It is written for gowin gw1n-1 fpga but will be expanded

## Prerequisites

 - [Project Apycula](https://github.com/YosysHQ/apicula)
 - [Nextpnr for gowin devices](https://github.com/YosysHQ/nextpnr)
 - [Yosys](https://github.com/YosysHQ/yosys)
 - [Klayout](https://github.com/KLayout/klayout)
 - [Open-Fpga-Loader](https://github.com/trabucayre/openFPGALoader)


### Environment Variables

To run this project, you will need to add the following environment variables to your makefile

`filename`




#### How to use

you can use the same verilog file for FPGA and ASIC tools. For FPGA tools:

```http
  make filename=yourfile
  make flash filename=yourfile
```
please note that you have to give name of the file only(if the verilog file is example.v , you only have to type filename=example)

For ASIC tools:
```http
  make gds filename=yourfile
```
and your gds file should be copied to directory that makefile is in.

### NOTE

Scripts uses yosys version 2022.12 but you may have a different release. You can change the script base of your installed yosys path

### to-do
Config files are not done. They need to be replaced
