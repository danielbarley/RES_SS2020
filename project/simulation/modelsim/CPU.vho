-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "07/20/2020 01:19:21"

-- 
-- Device: Altera 10CL025YU256C8G Package UFBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONE10LP;
LIBRARY IEEE;
USE CYCLONE10LP.CYCLONE10LP_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONE10LP;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONE10LP.CYCLONE10LP_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	REG IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	addr_1 : IN std_logic_vector(2 DOWNTO 0);
	addr_2 : IN std_logic_vector(2 DOWNTO 0);
	rd_en_1 : IN std_logic;
	rd_en_2 : IN std_logic;
	wr_en_1 : IN std_logic;
	wr_en_2 : IN std_logic;
	data_1_in : IN std_logic_vector(7 DOWNTO 0);
	data_2_in : IN std_logic_vector(7 DOWNTO 0);
	data_1_out : BUFFER std_logic_vector(7 DOWNTO 0);
	data_2_out : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END REG;

-- Design Ports Information
-- reset	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_out[0]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_out[1]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_out[2]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_out[3]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_out[4]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_out[5]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_out[6]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_out[7]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_out[0]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_out[1]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_out[2]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_out[3]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_out[4]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_out[5]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_out[6]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_out[7]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr_1[0]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr_1[1]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr_1[2]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd_en_1	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr_2[0]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr_2[1]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr_2[2]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd_en_2	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_in[0]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_in[0]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_en_2	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_en_1	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_in[1]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_in[1]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_in[2]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_in[2]	=>  Location: PIN_M15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_in[3]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_in[3]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_in[4]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_in[4]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_in[5]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_in[5]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_in[6]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_in[6]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_2_in[7]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1_in[7]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF REG IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_addr_1 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_addr_2 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_rd_en_1 : std_logic;
SIGNAL ww_rd_en_2 : std_logic;
SIGNAL ww_wr_en_1 : std_logic;
SIGNAL ww_wr_en_2 : std_logic;
SIGNAL ww_data_1_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_data_2_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_data_1_out : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_data_2_out : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \data_1_out[0]~output_o\ : std_logic;
SIGNAL \data_1_out[1]~output_o\ : std_logic;
SIGNAL \data_1_out[2]~output_o\ : std_logic;
SIGNAL \data_1_out[3]~output_o\ : std_logic;
SIGNAL \data_1_out[4]~output_o\ : std_logic;
SIGNAL \data_1_out[5]~output_o\ : std_logic;
SIGNAL \data_1_out[6]~output_o\ : std_logic;
SIGNAL \data_1_out[7]~output_o\ : std_logic;
SIGNAL \data_2_out[0]~output_o\ : std_logic;
SIGNAL \data_2_out[1]~output_o\ : std_logic;
SIGNAL \data_2_out[2]~output_o\ : std_logic;
SIGNAL \data_2_out[3]~output_o\ : std_logic;
SIGNAL \data_2_out[4]~output_o\ : std_logic;
SIGNAL \data_2_out[5]~output_o\ : std_logic;
SIGNAL \data_2_out[6]~output_o\ : std_logic;
SIGNAL \data_2_out[7]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \addr_1[2]~input_o\ : std_logic;
SIGNAL \data_1_in[0]~input_o\ : std_logic;
SIGNAL \addr_2[0]~input_o\ : std_logic;
SIGNAL \addr_2[1]~input_o\ : std_logic;
SIGNAL \wr_en_2~input_o\ : std_logic;
SIGNAL \addr_2[2]~input_o\ : std_logic;
SIGNAL \Decoder1~4_combout\ : std_logic;
SIGNAL \data_2_in[0]~input_o\ : std_logic;
SIGNAL \regs~8_combout\ : std_logic;
SIGNAL \addr_1[1]~input_o\ : std_logic;
SIGNAL \wr_en_1~input_o\ : std_logic;
SIGNAL \addr_1[0]~input_o\ : std_logic;
SIGNAL \Decoder0~4_combout\ : std_logic;
SIGNAL \regs[2][0]~9_combout\ : std_logic;
SIGNAL \regs[2][0]~q\ : std_logic;
SIGNAL \Decoder1~7_combout\ : std_logic;
SIGNAL \regs~14_combout\ : std_logic;
SIGNAL \Decoder0~7_combout\ : std_logic;
SIGNAL \regs[3][5]~15_combout\ : std_logic;
SIGNAL \regs[3][0]~q\ : std_logic;
SIGNAL \Decoder1~6_combout\ : std_logic;
SIGNAL \regs~12_combout\ : std_logic;
SIGNAL \Decoder0~6_combout\ : std_logic;
SIGNAL \regs[0][3]~13_combout\ : std_logic;
SIGNAL \regs[0][0]~q\ : std_logic;
SIGNAL \Decoder1~5_combout\ : std_logic;
SIGNAL \regs~10_combout\ : std_logic;
SIGNAL \Decoder0~5_combout\ : std_logic;
SIGNAL \regs[1][3]~11_combout\ : std_logic;
SIGNAL \regs[1][0]~q\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Mux7~3_combout\ : std_logic;
SIGNAL \Decoder1~0_combout\ : std_logic;
SIGNAL \regs~0_combout\ : std_logic;
SIGNAL \Decoder0~0_combout\ : std_logic;
SIGNAL \regs[5][4]~1_combout\ : std_logic;
SIGNAL \regs[5][0]~q\ : std_logic;
SIGNAL \Decoder1~1_combout\ : std_logic;
SIGNAL \regs~2_combout\ : std_logic;
SIGNAL \Decoder0~1_combout\ : std_logic;
SIGNAL \regs[6][4]~3_combout\ : std_logic;
SIGNAL \regs[6][0]~q\ : std_logic;
SIGNAL \Decoder1~2_combout\ : std_logic;
SIGNAL \regs~4_combout\ : std_logic;
SIGNAL \Decoder0~2_combout\ : std_logic;
SIGNAL \regs[4][1]~5_combout\ : std_logic;
SIGNAL \regs[4][0]~q\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Decoder1~3_combout\ : std_logic;
SIGNAL \regs~6_combout\ : std_logic;
SIGNAL \Decoder0~3_combout\ : std_logic;
SIGNAL \regs[7][4]~7_combout\ : std_logic;
SIGNAL \regs[7][0]~q\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Mux7~4_combout\ : std_logic;
SIGNAL \rd_en_1~input_o\ : std_logic;
SIGNAL \data_1_out[0]~reg0_q\ : std_logic;
SIGNAL \data_2_in[1]~input_o\ : std_logic;
SIGNAL \data_1_in[1]~input_o\ : std_logic;
SIGNAL \regs~20_combout\ : std_logic;
SIGNAL \regs[2][1]~q\ : std_logic;
SIGNAL \regs~23_combout\ : std_logic;
SIGNAL \regs[3][1]~q\ : std_logic;
SIGNAL \regs~21_combout\ : std_logic;
SIGNAL \regs[1][1]~q\ : std_logic;
SIGNAL \regs~22_combout\ : std_logic;
SIGNAL \regs[0][1]~q\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \Mux6~3_combout\ : std_logic;
SIGNAL \regs~16_combout\ : std_logic;
SIGNAL \regs[5][1]~q\ : std_logic;
SIGNAL \regs~19_combout\ : std_logic;
SIGNAL \regs[7][1]~q\ : std_logic;
SIGNAL \regs~17_combout\ : std_logic;
SIGNAL \regs[6][1]~q\ : std_logic;
SIGNAL \regs~18_combout\ : std_logic;
SIGNAL \regs[4][1]~q\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \Mux6~4_combout\ : std_logic;
SIGNAL \data_1_out[1]~reg0_q\ : std_logic;
SIGNAL \data_1_in[2]~input_o\ : std_logic;
SIGNAL \data_2_in[2]~input_o\ : std_logic;
SIGNAL \regs~28_combout\ : std_logic;
SIGNAL \regs[2][2]~q\ : std_logic;
SIGNAL \regs~29_combout\ : std_logic;
SIGNAL \regs[1][2]~q\ : std_logic;
SIGNAL \regs~30_combout\ : std_logic;
SIGNAL \regs[0][2]~q\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \regs~31_combout\ : std_logic;
SIGNAL \regs[3][2]~q\ : std_logic;
SIGNAL \Mux5~3_combout\ : std_logic;
SIGNAL \regs~27_combout\ : std_logic;
SIGNAL \regs[7][2]~q\ : std_logic;
SIGNAL \regs~24_combout\ : std_logic;
SIGNAL \regs[5][2]~q\ : std_logic;
SIGNAL \regs~25_combout\ : std_logic;
SIGNAL \regs[6][2]~q\ : std_logic;
SIGNAL \regs~26_combout\ : std_logic;
SIGNAL \regs[4][2]~q\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Mux5~4_combout\ : std_logic;
SIGNAL \data_1_out[2]~reg0_q\ : std_logic;
SIGNAL \data_1_in[3]~input_o\ : std_logic;
SIGNAL \data_2_in[3]~input_o\ : std_logic;
SIGNAL \regs~36_combout\ : std_logic;
SIGNAL \regs[2][3]~q\ : std_logic;
SIGNAL \regs~39_combout\ : std_logic;
SIGNAL \regs[3][3]~q\ : std_logic;
SIGNAL \regs~37_combout\ : std_logic;
SIGNAL \regs[1][3]~feeder_combout\ : std_logic;
SIGNAL \regs[1][3]~q\ : std_logic;
SIGNAL \regs~38_combout\ : std_logic;
SIGNAL \regs[0][3]~q\ : std_logic;
SIGNAL \Mux4~2_combout\ : std_logic;
SIGNAL \Mux4~3_combout\ : std_logic;
SIGNAL \regs~32_combout\ : std_logic;
SIGNAL \regs[5][3]~q\ : std_logic;
SIGNAL \regs~35_combout\ : std_logic;
SIGNAL \regs[7][3]~q\ : std_logic;
SIGNAL \regs~33_combout\ : std_logic;
SIGNAL \regs[6][3]~q\ : std_logic;
SIGNAL \regs~34_combout\ : std_logic;
SIGNAL \regs[4][3]~q\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \Mux4~4_combout\ : std_logic;
SIGNAL \data_1_out[3]~reg0_q\ : std_logic;
SIGNAL \data_2_in[4]~input_o\ : std_logic;
SIGNAL \data_1_in[4]~input_o\ : std_logic;
SIGNAL \regs~47_combout\ : std_logic;
SIGNAL \regs[3][4]~q\ : std_logic;
SIGNAL \regs~44_combout\ : std_logic;
SIGNAL \regs[2][4]~q\ : std_logic;
SIGNAL \regs~45_combout\ : std_logic;
SIGNAL \regs[1][4]~feeder_combout\ : std_logic;
SIGNAL \regs[1][4]~q\ : std_logic;
SIGNAL \regs~46_combout\ : std_logic;
SIGNAL \regs[0][4]~q\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Mux3~3_combout\ : std_logic;
SIGNAL \regs~40_combout\ : std_logic;
SIGNAL \regs[5][4]~q\ : std_logic;
SIGNAL \regs~41_combout\ : std_logic;
SIGNAL \regs[6][4]~q\ : std_logic;
SIGNAL \regs~42_combout\ : std_logic;
SIGNAL \regs[4][4]~q\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \regs~43_combout\ : std_logic;
SIGNAL \regs[7][4]~q\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \Mux3~4_combout\ : std_logic;
SIGNAL \data_1_out[4]~reg0_q\ : std_logic;
SIGNAL \data_2_in[5]~input_o\ : std_logic;
SIGNAL \data_1_in[5]~input_o\ : std_logic;
SIGNAL \regs~48_combout\ : std_logic;
SIGNAL \regs[5][5]~q\ : std_logic;
SIGNAL \regs~51_combout\ : std_logic;
SIGNAL \regs[7][5]~q\ : std_logic;
SIGNAL \regs~49_combout\ : std_logic;
SIGNAL \regs[6][5]~q\ : std_logic;
SIGNAL \regs~50_combout\ : std_logic;
SIGNAL \regs[4][5]~q\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \regs~52_combout\ : std_logic;
SIGNAL \regs[2][5]~feeder_combout\ : std_logic;
SIGNAL \regs[2][5]~q\ : std_logic;
SIGNAL \regs~55_combout\ : std_logic;
SIGNAL \regs[3][5]~feeder_combout\ : std_logic;
SIGNAL \regs[3][5]~q\ : std_logic;
SIGNAL \regs~54_combout\ : std_logic;
SIGNAL \regs[0][5]~q\ : std_logic;
SIGNAL \regs~53_combout\ : std_logic;
SIGNAL \regs[1][5]~q\ : std_logic;
SIGNAL \Mux2~2_combout\ : std_logic;
SIGNAL \Mux2~3_combout\ : std_logic;
SIGNAL \Mux2~4_combout\ : std_logic;
SIGNAL \data_1_out[5]~reg0_q\ : std_logic;
SIGNAL \data_2_in[6]~input_o\ : std_logic;
SIGNAL \data_1_in[6]~input_o\ : std_logic;
SIGNAL \regs~60_combout\ : std_logic;
SIGNAL \regs[2][6]~q\ : std_logic;
SIGNAL \regs~63_combout\ : std_logic;
SIGNAL \regs[3][6]~q\ : std_logic;
SIGNAL \regs~61_combout\ : std_logic;
SIGNAL \regs[1][6]~feeder_combout\ : std_logic;
SIGNAL \regs[1][6]~q\ : std_logic;
SIGNAL \regs~62_combout\ : std_logic;
SIGNAL \regs[0][6]~q\ : std_logic;
SIGNAL \Mux1~2_combout\ : std_logic;
SIGNAL \Mux1~3_combout\ : std_logic;
SIGNAL \regs~59_combout\ : std_logic;
SIGNAL \regs[7][6]~q\ : std_logic;
SIGNAL \regs~56_combout\ : std_logic;
SIGNAL \regs[5][6]~q\ : std_logic;
SIGNAL \regs~58_combout\ : std_logic;
SIGNAL \regs[4][6]~q\ : std_logic;
SIGNAL \regs~57_combout\ : std_logic;
SIGNAL \regs[6][6]~q\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Mux1~4_combout\ : std_logic;
SIGNAL \data_1_out[6]~reg0_q\ : std_logic;
SIGNAL \data_1_in[7]~input_o\ : std_logic;
SIGNAL \data_2_in[7]~input_o\ : std_logic;
SIGNAL \regs~68_combout\ : std_logic;
SIGNAL \regs[2][7]~q\ : std_logic;
SIGNAL \regs~71_combout\ : std_logic;
SIGNAL \regs[3][7]~q\ : std_logic;
SIGNAL \regs~69_combout\ : std_logic;
SIGNAL \regs[1][7]~feeder_combout\ : std_logic;
SIGNAL \regs[1][7]~q\ : std_logic;
SIGNAL \regs~70_combout\ : std_logic;
SIGNAL \regs[0][7]~q\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \regs~67_combout\ : std_logic;
SIGNAL \regs[7][7]~q\ : std_logic;
SIGNAL \regs~64_combout\ : std_logic;
SIGNAL \regs[5][7]~q\ : std_logic;
SIGNAL \regs~65_combout\ : std_logic;
SIGNAL \regs[6][7]~q\ : std_logic;
SIGNAL \regs~66_combout\ : std_logic;
SIGNAL \regs[4][7]~q\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Mux0~4_combout\ : std_logic;
SIGNAL \data_1_out[7]~reg0_q\ : std_logic;
SIGNAL \Mux15~2_combout\ : std_logic;
SIGNAL \Mux15~3_combout\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \Mux15~1_combout\ : std_logic;
SIGNAL \Mux15~4_combout\ : std_logic;
SIGNAL \rd_en_2~input_o\ : std_logic;
SIGNAL \data_2_out[0]~reg0_q\ : std_logic;
SIGNAL \Mux14~2_combout\ : std_logic;
SIGNAL \Mux14~3_combout\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \Mux14~1_combout\ : std_logic;
SIGNAL \Mux14~4_combout\ : std_logic;
SIGNAL \data_2_out[1]~reg0_q\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Mux13~1_combout\ : std_logic;
SIGNAL \Mux13~2_combout\ : std_logic;
SIGNAL \Mux13~3_combout\ : std_logic;
SIGNAL \Mux13~4_combout\ : std_logic;
SIGNAL \data_2_out[2]~reg0_q\ : std_logic;
SIGNAL \Mux12~2_combout\ : std_logic;
SIGNAL \Mux12~3_combout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Mux12~1_combout\ : std_logic;
SIGNAL \Mux12~4_combout\ : std_logic;
SIGNAL \data_2_out[3]~reg0_q\ : std_logic;
SIGNAL \Mux11~2_combout\ : std_logic;
SIGNAL \Mux11~3_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Mux11~1_combout\ : std_logic;
SIGNAL \Mux11~4_combout\ : std_logic;
SIGNAL \data_2_out[4]~reg0_q\ : std_logic;
SIGNAL \Mux10~2_combout\ : std_logic;
SIGNAL \Mux10~3_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux10~1_combout\ : std_logic;
SIGNAL \Mux10~4_combout\ : std_logic;
SIGNAL \data_2_out[5]~reg0_q\ : std_logic;
SIGNAL \Mux9~2_combout\ : std_logic;
SIGNAL \Mux9~3_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux9~1_combout\ : std_logic;
SIGNAL \Mux9~4_combout\ : std_logic;
SIGNAL \data_2_out[6]~reg0_q\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux8~1_combout\ : std_logic;
SIGNAL \Mux8~2_combout\ : std_logic;
SIGNAL \Mux8~3_combout\ : std_logic;
SIGNAL \Mux8~4_combout\ : std_logic;
SIGNAL \data_2_out[7]~reg0_q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_addr_1 <= addr_1;
ww_addr_2 <= addr_2;
ww_rd_en_1 <= rd_en_1;
ww_rd_en_2 <= rd_en_2;
ww_wr_en_1 <= wr_en_1;
ww_wr_en_2 <= wr_en_2;
ww_data_1_in <= data_1_in;
ww_data_2_in <= data_2_in;
data_1_out <= ww_data_1_out;
data_2_out <= ww_data_2_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X45_Y34_N16
\data_1_out[0]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_1_out[0]~reg0_q\,
	devoe => ww_devoe,
	o => \data_1_out[0]~output_o\);

-- Location: IOOBUF_X38_Y34_N16
\data_1_out[1]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_1_out[1]~reg0_q\,
	devoe => ww_devoe,
	o => \data_1_out[1]~output_o\);

-- Location: IOOBUF_X20_Y34_N16
\data_1_out[2]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_1_out[2]~reg0_q\,
	devoe => ww_devoe,
	o => \data_1_out[2]~output_o\);

-- Location: IOOBUF_X53_Y30_N9
\data_1_out[3]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_1_out[3]~reg0_q\,
	devoe => ww_devoe,
	o => \data_1_out[3]~output_o\);

-- Location: IOOBUF_X18_Y34_N2
\data_1_out[4]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_1_out[4]~reg0_q\,
	devoe => ww_devoe,
	o => \data_1_out[4]~output_o\);

-- Location: IOOBUF_X45_Y34_N2
\data_1_out[5]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_1_out[5]~reg0_q\,
	devoe => ww_devoe,
	o => \data_1_out[5]~output_o\);

-- Location: IOOBUF_X53_Y24_N23
\data_1_out[6]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_1_out[6]~reg0_q\,
	devoe => ww_devoe,
	o => \data_1_out[6]~output_o\);

-- Location: IOOBUF_X16_Y34_N16
\data_1_out[7]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_1_out[7]~reg0_q\,
	devoe => ww_devoe,
	o => \data_1_out[7]~output_o\);

-- Location: IOOBUF_X36_Y0_N23
\data_2_out[0]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_2_out[0]~reg0_q\,
	devoe => ww_devoe,
	o => \data_2_out[0]~output_o\);

-- Location: IOOBUF_X34_Y34_N16
\data_2_out[1]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_2_out[1]~reg0_q\,
	devoe => ww_devoe,
	o => \data_2_out[1]~output_o\);

-- Location: IOOBUF_X20_Y34_N9
\data_2_out[2]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_2_out[2]~reg0_q\,
	devoe => ww_devoe,
	o => \data_2_out[2]~output_o\);

-- Location: IOOBUF_X29_Y34_N16
\data_2_out[3]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_2_out[3]~reg0_q\,
	devoe => ww_devoe,
	o => \data_2_out[3]~output_o\);

-- Location: IOOBUF_X31_Y34_N9
\data_2_out[4]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_2_out[4]~reg0_q\,
	devoe => ww_devoe,
	o => \data_2_out[4]~output_o\);

-- Location: IOOBUF_X31_Y34_N2
\data_2_out[5]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_2_out[5]~reg0_q\,
	devoe => ww_devoe,
	o => \data_2_out[5]~output_o\);

-- Location: IOOBUF_X23_Y34_N23
\data_2_out[6]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_2_out[6]~reg0_q\,
	devoe => ww_devoe,
	o => \data_2_out[6]~output_o\);

-- Location: IOOBUF_X16_Y34_N9
\data_2_out[7]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_2_out[7]~reg0_q\,
	devoe => ww_devoe,
	o => \data_2_out[7]~output_o\);

-- Location: IOIBUF_X0_Y16_N1
\clk~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cyclone10lp_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X43_Y34_N15
\addr_1[2]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr_1(2),
	o => \addr_1[2]~input_o\);

-- Location: IOIBUF_X51_Y34_N1
\data_1_in[0]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_1_in(0),
	o => \data_1_in[0]~input_o\);

-- Location: IOIBUF_X38_Y34_N1
\addr_2[0]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr_2(0),
	o => \addr_2[0]~input_o\);

-- Location: IOIBUF_X34_Y34_N8
\addr_2[1]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr_2(1),
	o => \addr_2[1]~input_o\);

-- Location: IOIBUF_X20_Y34_N22
\wr_en_2~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_en_2,
	o => \wr_en_2~input_o\);

-- Location: IOIBUF_X23_Y34_N15
\addr_2[2]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr_2(2),
	o => \addr_2[2]~input_o\);

-- Location: LCCOMB_X36_Y30_N18
\Decoder1~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder1~4_combout\ = (!\addr_2[0]~input_o\ & (\addr_2[1]~input_o\ & (\wr_en_2~input_o\ & !\addr_2[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \addr_2[1]~input_o\,
	datac => \wr_en_2~input_o\,
	datad => \addr_2[2]~input_o\,
	combout => \Decoder1~4_combout\);

-- Location: IOIBUF_X45_Y34_N8
\data_2_in[0]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_2_in(0),
	o => \data_2_in[0]~input_o\);

-- Location: LCCOMB_X43_Y30_N26
\regs~8\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~8_combout\ = (\Decoder1~4_combout\ & ((\data_2_in[0]~input_o\))) # (!\Decoder1~4_combout\ & (\data_1_in[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[0]~input_o\,
	datac => \Decoder1~4_combout\,
	datad => \data_2_in[0]~input_o\,
	combout => \regs~8_combout\);

-- Location: IOIBUF_X40_Y34_N1
\addr_1[1]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr_1(1),
	o => \addr_1[1]~input_o\);

-- Location: IOIBUF_X49_Y34_N1
\wr_en_1~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_en_1,
	o => \wr_en_1~input_o\);

-- Location: IOIBUF_X40_Y34_N8
\addr_1[0]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr_1(0),
	o => \addr_1[0]~input_o\);

-- Location: LCCOMB_X41_Y30_N18
\Decoder0~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder0~4_combout\ = (!\addr_1[2]~input_o\ & (\addr_1[1]~input_o\ & (\wr_en_1~input_o\ & !\addr_1[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \wr_en_1~input_o\,
	datad => \addr_1[0]~input_o\,
	combout => \Decoder0~4_combout\);

-- Location: LCCOMB_X41_Y30_N12
\regs[2][0]~9\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[2][0]~9_combout\ = (\Decoder1~4_combout\) # (\Decoder0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Decoder1~4_combout\,
	datad => \Decoder0~4_combout\,
	combout => \regs[2][0]~9_combout\);

-- Location: FF_X43_Y30_N27
\regs[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~8_combout\,
	ena => \regs[2][0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[2][0]~q\);

-- Location: LCCOMB_X36_Y30_N6
\Decoder1~7\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder1~7_combout\ = (\addr_2[0]~input_o\ & (\addr_2[1]~input_o\ & (\wr_en_2~input_o\ & !\addr_2[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \addr_2[1]~input_o\,
	datac => \wr_en_2~input_o\,
	datad => \addr_2[2]~input_o\,
	combout => \Decoder1~7_combout\);

-- Location: LCCOMB_X40_Y30_N6
\regs~14\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~14_combout\ = (\Decoder1~7_combout\ & (\data_2_in[0]~input_o\)) # (!\Decoder1~7_combout\ & ((\data_1_in[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[0]~input_o\,
	datac => \Decoder1~7_combout\,
	datad => \data_1_in[0]~input_o\,
	combout => \regs~14_combout\);

-- Location: LCCOMB_X41_Y30_N8
\Decoder0~7\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder0~7_combout\ = (!\addr_1[2]~input_o\ & (\addr_1[1]~input_o\ & (\wr_en_1~input_o\ & \addr_1[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \wr_en_1~input_o\,
	datad => \addr_1[0]~input_o\,
	combout => \Decoder0~7_combout\);

-- Location: LCCOMB_X41_Y29_N0
\regs[3][5]~15\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[3][5]~15_combout\ = (\Decoder1~7_combout\) # (\Decoder0~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Decoder1~7_combout\,
	datad => \Decoder0~7_combout\,
	combout => \regs[3][5]~15_combout\);

-- Location: FF_X40_Y30_N7
\regs[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~14_combout\,
	ena => \regs[3][5]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[3][0]~q\);

-- Location: LCCOMB_X36_Y30_N24
\Decoder1~6\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder1~6_combout\ = (!\addr_2[0]~input_o\ & (!\addr_2[1]~input_o\ & (\wr_en_2~input_o\ & !\addr_2[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \addr_2[1]~input_o\,
	datac => \wr_en_2~input_o\,
	datad => \addr_2[2]~input_o\,
	combout => \Decoder1~6_combout\);

-- Location: LCCOMB_X43_Y30_N8
\regs~12\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~12_combout\ = (\Decoder1~6_combout\ & ((\data_2_in[0]~input_o\))) # (!\Decoder1~6_combout\ & (\data_1_in[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[0]~input_o\,
	datac => \Decoder1~6_combout\,
	datad => \data_2_in[0]~input_o\,
	combout => \regs~12_combout\);

-- Location: LCCOMB_X41_Y30_N22
\Decoder0~6\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder0~6_combout\ = (!\addr_1[2]~input_o\ & (!\addr_1[1]~input_o\ & (\wr_en_1~input_o\ & !\addr_1[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \wr_en_1~input_o\,
	datad => \addr_1[0]~input_o\,
	combout => \Decoder0~6_combout\);

-- Location: LCCOMB_X39_Y30_N10
\regs[0][3]~13\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[0][3]~13_combout\ = (\Decoder1~6_combout\) # (\Decoder0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Decoder1~6_combout\,
	datad => \Decoder0~6_combout\,
	combout => \regs[0][3]~13_combout\);

-- Location: FF_X39_Y30_N11
\regs[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~12_combout\,
	sload => VCC,
	ena => \regs[0][3]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[0][0]~q\);

-- Location: LCCOMB_X37_Y29_N28
\Decoder1~5\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder1~5_combout\ = (\wr_en_2~input_o\ & (\addr_2[0]~input_o\ & (!\addr_2[1]~input_o\ & !\addr_2[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wr_en_2~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \addr_2[1]~input_o\,
	datad => \addr_2[2]~input_o\,
	combout => \Decoder1~5_combout\);

-- Location: LCCOMB_X41_Y30_N16
\regs~10\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~10_combout\ = (\Decoder1~5_combout\ & (\data_2_in[0]~input_o\)) # (!\Decoder1~5_combout\ & ((\data_1_in[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_2_in[0]~input_o\,
	datac => \data_1_in[0]~input_o\,
	datad => \Decoder1~5_combout\,
	combout => \regs~10_combout\);

-- Location: LCCOMB_X41_Y30_N14
\Decoder0~5\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder0~5_combout\ = (!\addr_1[2]~input_o\ & (!\addr_1[1]~input_o\ & (\wr_en_1~input_o\ & \addr_1[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \wr_en_1~input_o\,
	datad => \addr_1[0]~input_o\,
	combout => \Decoder0~5_combout\);

-- Location: LCCOMB_X41_Y30_N0
\regs[1][3]~11\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[1][3]~11_combout\ = (\Decoder0~5_combout\) # (\Decoder1~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Decoder0~5_combout\,
	datad => \Decoder1~5_combout\,
	combout => \regs[1][3]~11_combout\);

-- Location: FF_X41_Y30_N17
\regs[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~10_combout\,
	ena => \regs[1][3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[1][0]~q\);

-- Location: LCCOMB_X41_Y30_N2
\Mux7~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (\addr_1[0]~input_o\ & ((\addr_1[1]~input_o\) # ((\regs[1][0]~q\)))) # (!\addr_1[0]~input_o\ & (!\addr_1[1]~input_o\ & (\regs[0][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[0][0]~q\,
	datad => \regs[1][0]~q\,
	combout => \Mux7~2_combout\);

-- Location: LCCOMB_X41_Y30_N4
\Mux7~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux7~3_combout\ = (\addr_1[1]~input_o\ & ((\Mux7~2_combout\ & ((\regs[3][0]~q\))) # (!\Mux7~2_combout\ & (\regs[2][0]~q\)))) # (!\addr_1[1]~input_o\ & (((\Mux7~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[2][0]~q\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[3][0]~q\,
	datad => \Mux7~2_combout\,
	combout => \Mux7~3_combout\);

-- Location: LCCOMB_X38_Y31_N4
\Decoder1~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder1~0_combout\ = (\wr_en_2~input_o\ & (!\addr_2[1]~input_o\ & (\addr_2[0]~input_o\ & \addr_2[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wr_en_2~input_o\,
	datab => \addr_2[1]~input_o\,
	datac => \addr_2[0]~input_o\,
	datad => \addr_2[2]~input_o\,
	combout => \Decoder1~0_combout\);

-- Location: LCCOMB_X43_Y30_N12
\regs~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~0_combout\ = (\Decoder1~0_combout\ & ((\data_2_in[0]~input_o\))) # (!\Decoder1~0_combout\ & (\data_1_in[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[0]~input_o\,
	datac => \Decoder1~0_combout\,
	datad => \data_2_in[0]~input_o\,
	combout => \regs~0_combout\);

-- Location: LCCOMB_X41_Y30_N6
\Decoder0~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder0~0_combout\ = (\addr_1[2]~input_o\ & (!\addr_1[1]~input_o\ & (\wr_en_1~input_o\ & \addr_1[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \wr_en_1~input_o\,
	datad => \addr_1[0]~input_o\,
	combout => \Decoder0~0_combout\);

-- Location: LCCOMB_X44_Y30_N18
\regs[5][4]~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[5][4]~1_combout\ = (\Decoder1~0_combout\) # (\Decoder0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Decoder1~0_combout\,
	datad => \Decoder0~0_combout\,
	combout => \regs[5][4]~1_combout\);

-- Location: FF_X43_Y30_N13
\regs[5][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~0_combout\,
	ena => \regs[5][4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[5][0]~q\);

-- Location: LCCOMB_X38_Y30_N22
\Decoder1~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder1~1_combout\ = (!\addr_2[0]~input_o\ & (\wr_en_2~input_o\ & (\addr_2[2]~input_o\ & \addr_2[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \wr_en_2~input_o\,
	datac => \addr_2[2]~input_o\,
	datad => \addr_2[1]~input_o\,
	combout => \Decoder1~1_combout\);

-- Location: LCCOMB_X44_Y30_N16
\regs~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~2_combout\ = (\Decoder1~1_combout\ & (\data_2_in[0]~input_o\)) # (!\Decoder1~1_combout\ & ((\data_1_in[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[0]~input_o\,
	datac => \Decoder1~1_combout\,
	datad => \data_1_in[0]~input_o\,
	combout => \regs~2_combout\);

-- Location: LCCOMB_X41_Y30_N28
\Decoder0~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder0~1_combout\ = (\addr_1[2]~input_o\ & (\addr_1[1]~input_o\ & (\wr_en_1~input_o\ & !\addr_1[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \wr_en_1~input_o\,
	datad => \addr_1[0]~input_o\,
	combout => \Decoder0~1_combout\);

-- Location: LCCOMB_X40_Y30_N26
\regs[6][4]~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[6][4]~3_combout\ = (\Decoder1~1_combout\) # (\Decoder0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~1_combout\,
	datad => \Decoder0~1_combout\,
	combout => \regs[6][4]~3_combout\);

-- Location: FF_X40_Y30_N5
\regs[6][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~2_combout\,
	sload => VCC,
	ena => \regs[6][4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[6][0]~q\);

-- Location: LCCOMB_X38_Y30_N0
\Decoder1~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder1~2_combout\ = (!\addr_2[0]~input_o\ & (\wr_en_2~input_o\ & (\addr_2[2]~input_o\ & !\addr_2[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \wr_en_2~input_o\,
	datac => \addr_2[2]~input_o\,
	datad => \addr_2[1]~input_o\,
	combout => \Decoder1~2_combout\);

-- Location: LCCOMB_X40_Y30_N2
\regs~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~4_combout\ = (\Decoder1~2_combout\ & (\data_2_in[0]~input_o\)) # (!\Decoder1~2_combout\ & ((\data_1_in[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~2_combout\,
	datab => \data_2_in[0]~input_o\,
	datad => \data_1_in[0]~input_o\,
	combout => \regs~4_combout\);

-- Location: LCCOMB_X41_Y30_N26
\Decoder0~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder0~2_combout\ = (\addr_1[2]~input_o\ & (!\addr_1[1]~input_o\ & (\wr_en_1~input_o\ & !\addr_1[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \wr_en_1~input_o\,
	datad => \addr_1[0]~input_o\,
	combout => \Decoder0~2_combout\);

-- Location: LCCOMB_X40_Y29_N8
\regs[4][1]~5\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[4][1]~5_combout\ = (\Decoder1~2_combout\) # (\Decoder0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Decoder1~2_combout\,
	datad => \Decoder0~2_combout\,
	combout => \regs[4][1]~5_combout\);

-- Location: FF_X39_Y30_N21
\regs[4][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~4_combout\,
	sload => VCC,
	ena => \regs[4][1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[4][0]~q\);

-- Location: LCCOMB_X40_Y30_N4
\Mux7~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\addr_1[0]~input_o\ & (\addr_1[1]~input_o\)) # (!\addr_1[0]~input_o\ & ((\addr_1[1]~input_o\ & (\regs[6][0]~q\)) # (!\addr_1[1]~input_o\ & ((\regs[4][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[6][0]~q\,
	datad => \regs[4][0]~q\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X36_Y30_N16
\Decoder1~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder1~3_combout\ = (\addr_2[0]~input_o\ & (\addr_2[1]~input_o\ & (\wr_en_2~input_o\ & \addr_2[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \addr_2[1]~input_o\,
	datac => \wr_en_2~input_o\,
	datad => \addr_2[2]~input_o\,
	combout => \Decoder1~3_combout\);

-- Location: LCCOMB_X44_Y30_N4
\regs~6\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~6_combout\ = (\Decoder1~3_combout\ & (\data_2_in[0]~input_o\)) # (!\Decoder1~3_combout\ & ((\data_1_in[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[0]~input_o\,
	datac => \Decoder1~3_combout\,
	datad => \data_1_in[0]~input_o\,
	combout => \regs~6_combout\);

-- Location: LCCOMB_X41_Y30_N20
\Decoder0~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Decoder0~3_combout\ = (\addr_1[2]~input_o\ & (\addr_1[1]~input_o\ & (\wr_en_1~input_o\ & \addr_1[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \wr_en_1~input_o\,
	datad => \addr_1[0]~input_o\,
	combout => \Decoder0~3_combout\);

-- Location: LCCOMB_X44_Y30_N30
\regs[7][4]~7\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[7][4]~7_combout\ = (\Decoder1~3_combout\) # (\Decoder0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Decoder1~3_combout\,
	datad => \Decoder0~3_combout\,
	combout => \regs[7][4]~7_combout\);

-- Location: FF_X44_Y30_N5
\regs[7][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~6_combout\,
	ena => \regs[7][4]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[7][0]~q\);

-- Location: LCCOMB_X41_Y30_N10
\Mux7~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (\addr_1[0]~input_o\ & ((\Mux7~0_combout\ & ((\regs[7][0]~q\))) # (!\Mux7~0_combout\ & (\regs[5][0]~q\)))) # (!\addr_1[0]~input_o\ & (((\Mux7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \regs[5][0]~q\,
	datac => \Mux7~0_combout\,
	datad => \regs[7][0]~q\,
	combout => \Mux7~1_combout\);

-- Location: LCCOMB_X41_Y30_N24
\Mux7~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux7~4_combout\ = (\addr_1[2]~input_o\ & ((\Mux7~1_combout\))) # (!\addr_1[2]~input_o\ & (\Mux7~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datac => \Mux7~3_combout\,
	datad => \Mux7~1_combout\,
	combout => \Mux7~4_combout\);

-- Location: IOIBUF_X34_Y34_N1
\rd_en_1~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rd_en_1,
	o => \rd_en_1~input_o\);

-- Location: FF_X41_Y30_N25
\data_1_out[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux7~4_combout\,
	ena => \rd_en_1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_1_out[0]~reg0_q\);

-- Location: IOIBUF_X47_Y34_N22
\data_2_in[1]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_2_in(1),
	o => \data_2_in[1]~input_o\);

-- Location: IOIBUF_X53_Y25_N1
\data_1_in[1]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_1_in(1),
	o => \data_1_in[1]~input_o\);

-- Location: LCCOMB_X43_Y30_N10
\regs~20\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~20_combout\ = (\Decoder1~4_combout\ & (\data_2_in[1]~input_o\)) # (!\Decoder1~4_combout\ & ((\data_1_in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[1]~input_o\,
	datac => \Decoder1~4_combout\,
	datad => \data_1_in[1]~input_o\,
	combout => \regs~20_combout\);

-- Location: FF_X43_Y30_N11
\regs[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~20_combout\,
	ena => \regs[2][0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[2][1]~q\);

-- Location: LCCOMB_X39_Y29_N28
\regs~23\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~23_combout\ = (\Decoder1~7_combout\ & (\data_2_in[1]~input_o\)) # (!\Decoder1~7_combout\ & ((\data_1_in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~7_combout\,
	datab => \data_2_in[1]~input_o\,
	datac => \data_1_in[1]~input_o\,
	combout => \regs~23_combout\);

-- Location: FF_X40_Y30_N27
\regs[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~23_combout\,
	sload => VCC,
	ena => \regs[3][5]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[3][1]~q\);

-- Location: LCCOMB_X38_Y30_N12
\regs~21\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~21_combout\ = (\Decoder1~5_combout\ & ((\data_2_in[1]~input_o\))) # (!\Decoder1~5_combout\ & (\data_1_in[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[1]~input_o\,
	datac => \Decoder1~5_combout\,
	datad => \data_2_in[1]~input_o\,
	combout => \regs~21_combout\);

-- Location: FF_X38_Y30_N13
\regs[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~21_combout\,
	ena => \regs[1][3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[1][1]~q\);

-- Location: LCCOMB_X43_Y30_N18
\regs~22\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~22_combout\ = (\Decoder1~6_combout\ & (\data_2_in[1]~input_o\)) # (!\Decoder1~6_combout\ & ((\data_1_in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[1]~input_o\,
	datac => \Decoder1~6_combout\,
	datad => \data_1_in[1]~input_o\,
	combout => \regs~22_combout\);

-- Location: FF_X39_Y30_N31
\regs[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~22_combout\,
	sload => VCC,
	ena => \regs[0][3]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[0][1]~q\);

-- Location: LCCOMB_X38_Y30_N14
\Mux6~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = (\addr_1[1]~input_o\ & (((\addr_1[0]~input_o\)))) # (!\addr_1[1]~input_o\ & ((\addr_1[0]~input_o\ & (\regs[1][1]~q\)) # (!\addr_1[0]~input_o\ & ((\regs[0][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[1][1]~q\,
	datab => \addr_1[1]~input_o\,
	datac => \addr_1[0]~input_o\,
	datad => \regs[0][1]~q\,
	combout => \Mux6~2_combout\);

-- Location: LCCOMB_X38_Y30_N4
\Mux6~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux6~3_combout\ = (\Mux6~2_combout\ & (((\regs[3][1]~q\) # (!\addr_1[1]~input_o\)))) # (!\Mux6~2_combout\ & (\regs[2][1]~q\ & ((\addr_1[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[2][1]~q\,
	datab => \regs[3][1]~q\,
	datac => \Mux6~2_combout\,
	datad => \addr_1[1]~input_o\,
	combout => \Mux6~3_combout\);

-- Location: LCCOMB_X43_Y30_N4
\regs~16\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~16_combout\ = (\Decoder1~0_combout\ & (\data_2_in[1]~input_o\)) # (!\Decoder1~0_combout\ & ((\data_1_in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[1]~input_o\,
	datac => \Decoder1~0_combout\,
	datad => \data_1_in[1]~input_o\,
	combout => \regs~16_combout\);

-- Location: FF_X43_Y30_N5
\regs[5][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~16_combout\,
	ena => \regs[5][4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[5][1]~q\);

-- Location: LCCOMB_X39_Y29_N16
\regs~19\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~19_combout\ = (\Decoder1~3_combout\ & (\data_2_in[1]~input_o\)) # (!\Decoder1~3_combout\ & ((\data_1_in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~3_combout\,
	datab => \data_2_in[1]~input_o\,
	datac => \data_1_in[1]~input_o\,
	combout => \regs~19_combout\);

-- Location: FF_X39_Y29_N17
\regs[7][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~19_combout\,
	ena => \regs[7][4]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[7][1]~q\);

-- Location: LCCOMB_X37_Y29_N4
\regs~17\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~17_combout\ = (\Decoder1~1_combout\ & ((\data_2_in[1]~input_o\))) # (!\Decoder1~1_combout\ & (\data_1_in[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~1_combout\,
	datab => \data_1_in[1]~input_o\,
	datad => \data_2_in[1]~input_o\,
	combout => \regs~17_combout\);

-- Location: FF_X40_Y30_N25
\regs[6][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~17_combout\,
	sload => VCC,
	ena => \regs[6][4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[6][1]~q\);

-- Location: LCCOMB_X38_Y30_N26
\regs~18\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~18_combout\ = (\Decoder1~2_combout\ & ((\data_2_in[1]~input_o\))) # (!\Decoder1~2_combout\ & (\data_1_in[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[1]~input_o\,
	datab => \Decoder1~2_combout\,
	datad => \data_2_in[1]~input_o\,
	combout => \regs~18_combout\);

-- Location: FF_X39_Y30_N25
\regs[4][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~18_combout\,
	sload => VCC,
	ena => \regs[4][1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[4][1]~q\);

-- Location: LCCOMB_X40_Y30_N24
\Mux6~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\addr_1[0]~input_o\ & (\addr_1[1]~input_o\)) # (!\addr_1[0]~input_o\ & ((\addr_1[1]~input_o\ & (\regs[6][1]~q\)) # (!\addr_1[1]~input_o\ & ((\regs[4][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[6][1]~q\,
	datad => \regs[4][1]~q\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X38_Y30_N18
\Mux6~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = (\addr_1[0]~input_o\ & ((\Mux6~0_combout\ & ((\regs[7][1]~q\))) # (!\Mux6~0_combout\ & (\regs[5][1]~q\)))) # (!\addr_1[0]~input_o\ & (((\Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \regs[5][1]~q\,
	datac => \regs[7][1]~q\,
	datad => \Mux6~0_combout\,
	combout => \Mux6~1_combout\);

-- Location: LCCOMB_X38_Y30_N24
\Mux6~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux6~4_combout\ = (\addr_1[2]~input_o\ & ((\Mux6~1_combout\))) # (!\addr_1[2]~input_o\ & (\Mux6~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datac => \Mux6~3_combout\,
	datad => \Mux6~1_combout\,
	combout => \Mux6~4_combout\);

-- Location: FF_X38_Y30_N25
\data_1_out[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux6~4_combout\,
	ena => \rd_en_1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_1_out[1]~reg0_q\);

-- Location: IOIBUF_X53_Y17_N15
\data_1_in[2]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_1_in(2),
	o => \data_1_in[2]~input_o\);

-- Location: IOIBUF_X53_Y17_N22
\data_2_in[2]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_2_in(2),
	o => \data_2_in[2]~input_o\);

-- Location: LCCOMB_X43_Y30_N6
\regs~28\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~28_combout\ = (\Decoder1~4_combout\ & ((\data_2_in[2]~input_o\))) # (!\Decoder1~4_combout\ & (\data_1_in[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[2]~input_o\,
	datac => \Decoder1~4_combout\,
	datad => \data_2_in[2]~input_o\,
	combout => \regs~28_combout\);

-- Location: FF_X43_Y30_N7
\regs[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~28_combout\,
	ena => \regs[2][0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[2][2]~q\);

-- Location: LCCOMB_X40_Y29_N12
\regs~29\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~29_combout\ = (\Decoder1~5_combout\ & (\data_2_in[2]~input_o\)) # (!\Decoder1~5_combout\ & ((\data_1_in[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_2_in[2]~input_o\,
	datab => \data_1_in[2]~input_o\,
	datad => \Decoder1~5_combout\,
	combout => \regs~29_combout\);

-- Location: FF_X36_Y30_N11
\regs[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~29_combout\,
	sload => VCC,
	ena => \regs[1][3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[1][2]~q\);

-- Location: LCCOMB_X43_Y30_N20
\regs~30\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~30_combout\ = (\Decoder1~6_combout\ & ((\data_2_in[2]~input_o\))) # (!\Decoder1~6_combout\ & (\data_1_in[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[2]~input_o\,
	datac => \Decoder1~6_combout\,
	datad => \data_2_in[2]~input_o\,
	combout => \regs~30_combout\);

-- Location: FF_X39_Y30_N3
\regs[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~30_combout\,
	sload => VCC,
	ena => \regs[0][3]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[0][2]~q\);

-- Location: LCCOMB_X36_Y30_N4
\Mux5~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = (\addr_1[0]~input_o\ & ((\regs[1][2]~q\) # ((\addr_1[1]~input_o\)))) # (!\addr_1[0]~input_o\ & (((\regs[0][2]~q\ & !\addr_1[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[1][2]~q\,
	datab => \regs[0][2]~q\,
	datac => \addr_1[0]~input_o\,
	datad => \addr_1[1]~input_o\,
	combout => \Mux5~2_combout\);

-- Location: LCCOMB_X38_Y29_N24
\regs~31\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~31_combout\ = (\Decoder1~7_combout\ & ((\data_2_in[2]~input_o\))) # (!\Decoder1~7_combout\ & (\data_1_in[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[2]~input_o\,
	datab => \Decoder1~7_combout\,
	datad => \data_2_in[2]~input_o\,
	combout => \regs~31_combout\);

-- Location: FF_X40_Y30_N3
\regs[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~31_combout\,
	sload => VCC,
	ena => \regs[3][5]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[3][2]~q\);

-- Location: LCCOMB_X36_Y30_N26
\Mux5~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = (\addr_1[1]~input_o\ & ((\Mux5~2_combout\ & ((\regs[3][2]~q\))) # (!\Mux5~2_combout\ & (\regs[2][2]~q\)))) # (!\addr_1[1]~input_o\ & (((\Mux5~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[2][2]~q\,
	datab => \addr_1[1]~input_o\,
	datac => \Mux5~2_combout\,
	datad => \regs[3][2]~q\,
	combout => \Mux5~3_combout\);

-- Location: LCCOMB_X44_Y30_N14
\regs~27\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~27_combout\ = (\Decoder1~3_combout\ & ((\data_2_in[2]~input_o\))) # (!\Decoder1~3_combout\ & (\data_1_in[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_1_in[2]~input_o\,
	datac => \Decoder1~3_combout\,
	datad => \data_2_in[2]~input_o\,
	combout => \regs~27_combout\);

-- Location: FF_X44_Y30_N15
\regs[7][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~27_combout\,
	ena => \regs[7][4]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[7][2]~q\);

-- Location: LCCOMB_X43_Y30_N16
\regs~24\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~24_combout\ = (\Decoder1~0_combout\ & ((\data_2_in[2]~input_o\))) # (!\Decoder1~0_combout\ & (\data_1_in[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[2]~input_o\,
	datac => \Decoder1~0_combout\,
	datad => \data_2_in[2]~input_o\,
	combout => \regs~24_combout\);

-- Location: FF_X43_Y30_N17
\regs[5][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~24_combout\,
	ena => \regs[5][4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[5][2]~q\);

-- Location: LCCOMB_X40_Y29_N2
\regs~25\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~25_combout\ = (\Decoder1~1_combout\ & (\data_2_in[2]~input_o\)) # (!\Decoder1~1_combout\ & ((\data_1_in[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_2_in[2]~input_o\,
	datab => \data_1_in[2]~input_o\,
	datad => \Decoder1~1_combout\,
	combout => \regs~25_combout\);

-- Location: FF_X40_Y30_N9
\regs[6][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~25_combout\,
	sload => VCC,
	ena => \regs[6][4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[6][2]~q\);

-- Location: LCCOMB_X41_Y29_N2
\regs~26\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~26_combout\ = (\Decoder1~2_combout\ & (\data_2_in[2]~input_o\)) # (!\Decoder1~2_combout\ & ((\data_1_in[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Decoder1~2_combout\,
	datac => \data_2_in[2]~input_o\,
	datad => \data_1_in[2]~input_o\,
	combout => \regs~26_combout\);

-- Location: FF_X39_Y30_N13
\regs[4][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~26_combout\,
	sload => VCC,
	ena => \regs[4][1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[4][2]~q\);

-- Location: LCCOMB_X40_Y30_N8
\Mux5~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\addr_1[0]~input_o\ & (\addr_1[1]~input_o\)) # (!\addr_1[0]~input_o\ & ((\addr_1[1]~input_o\ & (\regs[6][2]~q\)) # (!\addr_1[1]~input_o\ & ((\regs[4][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[6][2]~q\,
	datad => \regs[4][2]~q\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X36_Y30_N28
\Mux5~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (\addr_1[0]~input_o\ & ((\Mux5~0_combout\ & (\regs[7][2]~q\)) # (!\Mux5~0_combout\ & ((\regs[5][2]~q\))))) # (!\addr_1[0]~input_o\ & (((\Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \regs[7][2]~q\,
	datac => \regs[5][2]~q\,
	datad => \Mux5~0_combout\,
	combout => \Mux5~1_combout\);

-- Location: LCCOMB_X36_Y30_N20
\Mux5~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux5~4_combout\ = (\addr_1[2]~input_o\ & ((\Mux5~1_combout\))) # (!\addr_1[2]~input_o\ & (\Mux5~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \addr_1[2]~input_o\,
	datac => \Mux5~3_combout\,
	datad => \Mux5~1_combout\,
	combout => \Mux5~4_combout\);

-- Location: FF_X36_Y30_N21
\data_1_out[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux5~4_combout\,
	ena => \rd_en_1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_1_out[2]~reg0_q\);

-- Location: IOIBUF_X53_Y17_N8
\data_1_in[3]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_1_in(3),
	o => \data_1_in[3]~input_o\);

-- Location: IOIBUF_X53_Y26_N22
\data_2_in[3]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_2_in(3),
	o => \data_2_in[3]~input_o\);

-- Location: LCCOMB_X43_Y30_N22
\regs~36\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~36_combout\ = (\Decoder1~4_combout\ & ((\data_2_in[3]~input_o\))) # (!\Decoder1~4_combout\ & (\data_1_in[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[3]~input_o\,
	datac => \Decoder1~4_combout\,
	datad => \data_2_in[3]~input_o\,
	combout => \regs~36_combout\);

-- Location: FF_X43_Y30_N23
\regs[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~36_combout\,
	ena => \regs[2][0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[2][3]~q\);

-- Location: LCCOMB_X41_Y30_N30
\regs~39\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~39_combout\ = (\Decoder1~7_combout\ & ((\data_2_in[3]~input_o\))) # (!\Decoder1~7_combout\ & (\data_1_in[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[3]~input_o\,
	datac => \Decoder1~7_combout\,
	datad => \data_2_in[3]~input_o\,
	combout => \regs~39_combout\);

-- Location: FF_X40_Y30_N15
\regs[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~39_combout\,
	sload => VCC,
	ena => \regs[3][5]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[3][3]~q\);

-- Location: LCCOMB_X40_Y29_N30
\regs~37\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~37_combout\ = (\Decoder1~5_combout\ & (\data_2_in[3]~input_o\)) # (!\Decoder1~5_combout\ & ((\data_1_in[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Decoder1~5_combout\,
	datac => \data_2_in[3]~input_o\,
	datad => \data_1_in[3]~input_o\,
	combout => \regs~37_combout\);

-- Location: LCCOMB_X36_Y30_N14
\regs[1][3]~feeder\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[1][3]~feeder_combout\ = \regs~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \regs~37_combout\,
	combout => \regs[1][3]~feeder_combout\);

-- Location: FF_X36_Y30_N15
\regs[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs[1][3]~feeder_combout\,
	ena => \regs[1][3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[1][3]~q\);

-- Location: LCCOMB_X40_Y29_N0
\regs~38\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~38_combout\ = (\Decoder1~6_combout\ & (\data_2_in[3]~input_o\)) # (!\Decoder1~6_combout\ & ((\data_1_in[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Decoder1~6_combout\,
	datac => \data_2_in[3]~input_o\,
	datad => \data_1_in[3]~input_o\,
	combout => \regs~38_combout\);

-- Location: FF_X37_Y30_N29
\regs[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~38_combout\,
	sload => VCC,
	ena => \regs[0][3]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[0][3]~q\);

-- Location: LCCOMB_X36_Y30_N12
\Mux4~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux4~2_combout\ = (\addr_1[0]~input_o\ & ((\addr_1[1]~input_o\) # ((\regs[1][3]~q\)))) # (!\addr_1[0]~input_o\ & (!\addr_1[1]~input_o\ & ((\regs[0][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[1][3]~q\,
	datad => \regs[0][3]~q\,
	combout => \Mux4~2_combout\);

-- Location: LCCOMB_X36_Y30_N22
\Mux4~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux4~3_combout\ = (\addr_1[1]~input_o\ & ((\Mux4~2_combout\ & ((\regs[3][3]~q\))) # (!\Mux4~2_combout\ & (\regs[2][3]~q\)))) # (!\addr_1[1]~input_o\ & (((\Mux4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[2][3]~q\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[3][3]~q\,
	datad => \Mux4~2_combout\,
	combout => \Mux4~3_combout\);

-- Location: LCCOMB_X43_Y30_N0
\regs~32\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~32_combout\ = (\Decoder1~0_combout\ & ((\data_2_in[3]~input_o\))) # (!\Decoder1~0_combout\ & (\data_1_in[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[3]~input_o\,
	datac => \Decoder1~0_combout\,
	datad => \data_2_in[3]~input_o\,
	combout => \regs~32_combout\);

-- Location: FF_X43_Y30_N1
\regs[5][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~32_combout\,
	ena => \regs[5][4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[5][3]~q\);

-- Location: LCCOMB_X44_Y30_N8
\regs~35\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~35_combout\ = (\Decoder1~3_combout\ & ((\data_2_in[3]~input_o\))) # (!\Decoder1~3_combout\ & (\data_1_in[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~3_combout\,
	datac => \data_1_in[3]~input_o\,
	datad => \data_2_in[3]~input_o\,
	combout => \regs~35_combout\);

-- Location: FF_X44_Y30_N9
\regs[7][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~35_combout\,
	ena => \regs[7][4]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[7][3]~q\);

-- Location: LCCOMB_X40_Y29_N18
\regs~33\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~33_combout\ = (\Decoder1~1_combout\ & (\data_2_in[3]~input_o\)) # (!\Decoder1~1_combout\ & ((\data_1_in[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~1_combout\,
	datac => \data_2_in[3]~input_o\,
	datad => \data_1_in[3]~input_o\,
	combout => \regs~33_combout\);

-- Location: FF_X40_Y30_N17
\regs[6][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~33_combout\,
	sload => VCC,
	ena => \regs[6][4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[6][3]~q\);

-- Location: LCCOMB_X40_Y29_N16
\regs~34\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~34_combout\ = (\Decoder1~2_combout\ & (\data_2_in[3]~input_o\)) # (!\Decoder1~2_combout\ & ((\data_1_in[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~2_combout\,
	datac => \data_2_in[3]~input_o\,
	datad => \data_1_in[3]~input_o\,
	combout => \regs~34_combout\);

-- Location: FF_X39_Y30_N9
\regs[4][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~34_combout\,
	sload => VCC,
	ena => \regs[4][1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[4][3]~q\);

-- Location: LCCOMB_X40_Y30_N16
\Mux4~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\addr_1[0]~input_o\ & (\addr_1[1]~input_o\)) # (!\addr_1[0]~input_o\ & ((\addr_1[1]~input_o\ & (\regs[6][3]~q\)) # (!\addr_1[1]~input_o\ & ((\regs[4][3]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[6][3]~q\,
	datad => \regs[4][3]~q\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X36_Y30_N0
\Mux4~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = (\Mux4~0_combout\ & (((\regs[7][3]~q\) # (!\addr_1[0]~input_o\)))) # (!\Mux4~0_combout\ & (\regs[5][3]~q\ & ((\addr_1[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[5][3]~q\,
	datab => \regs[7][3]~q\,
	datac => \Mux4~0_combout\,
	datad => \addr_1[0]~input_o\,
	combout => \Mux4~1_combout\);

-- Location: LCCOMB_X36_Y30_N30
\Mux4~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux4~4_combout\ = (\addr_1[2]~input_o\ & ((\Mux4~1_combout\))) # (!\addr_1[2]~input_o\ & (\Mux4~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \addr_1[2]~input_o\,
	datac => \Mux4~3_combout\,
	datad => \Mux4~1_combout\,
	combout => \Mux4~4_combout\);

-- Location: FF_X36_Y30_N31
\data_1_out[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux4~4_combout\,
	ena => \rd_en_1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_1_out[3]~reg0_q\);

-- Location: IOIBUF_X53_Y17_N1
\data_2_in[4]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_2_in(4),
	o => \data_2_in[4]~input_o\);

-- Location: IOIBUF_X53_Y22_N8
\data_1_in[4]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_1_in(4),
	o => \data_1_in[4]~input_o\);

-- Location: LCCOMB_X34_Y30_N10
\regs~47\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~47_combout\ = (\Decoder1~7_combout\ & (\data_2_in[4]~input_o\)) # (!\Decoder1~7_combout\ & ((\data_1_in[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_2_in[4]~input_o\,
	datac => \Decoder1~7_combout\,
	datad => \data_1_in[4]~input_o\,
	combout => \regs~47_combout\);

-- Location: FF_X34_Y30_N11
\regs[3][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~47_combout\,
	ena => \regs[3][5]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[3][4]~q\);

-- Location: LCCOMB_X34_Y30_N4
\regs~44\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~44_combout\ = (\Decoder1~4_combout\ & (\data_2_in[4]~input_o\)) # (!\Decoder1~4_combout\ & ((\data_1_in[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_2_in[4]~input_o\,
	datac => \Decoder1~4_combout\,
	datad => \data_1_in[4]~input_o\,
	combout => \regs~44_combout\);

-- Location: FF_X34_Y30_N5
\regs[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~44_combout\,
	ena => \regs[2][0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[2][4]~q\);

-- Location: LCCOMB_X40_Y30_N14
\regs~45\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~45_combout\ = (\Decoder1~5_combout\ & ((\data_2_in[4]~input_o\))) # (!\Decoder1~5_combout\ & (\data_1_in[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[4]~input_o\,
	datab => \Decoder1~5_combout\,
	datad => \data_2_in[4]~input_o\,
	combout => \regs~45_combout\);

-- Location: LCCOMB_X36_Y30_N8
\regs[1][4]~feeder\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[1][4]~feeder_combout\ = \regs~45_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \regs~45_combout\,
	combout => \regs[1][4]~feeder_combout\);

-- Location: FF_X36_Y30_N9
\regs[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs[1][4]~feeder_combout\,
	ena => \regs[1][3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[1][4]~q\);

-- Location: LCCOMB_X41_Y29_N4
\regs~46\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~46_combout\ = (\Decoder1~6_combout\ & ((\data_2_in[4]~input_o\))) # (!\Decoder1~6_combout\ & (\data_1_in[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[4]~input_o\,
	datab => \data_2_in[4]~input_o\,
	datac => \Decoder1~6_combout\,
	combout => \regs~46_combout\);

-- Location: FF_X37_Y30_N3
\regs[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~46_combout\,
	sload => VCC,
	ena => \regs[0][3]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[0][4]~q\);

-- Location: LCCOMB_X36_Y30_N2
\Mux3~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (\addr_1[0]~input_o\ & ((\addr_1[1]~input_o\) # ((\regs[1][4]~q\)))) # (!\addr_1[0]~input_o\ & (!\addr_1[1]~input_o\ & ((\regs[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[1][4]~q\,
	datad => \regs[0][4]~q\,
	combout => \Mux3~2_combout\);

-- Location: LCCOMB_X35_Y30_N26
\Mux3~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = (\addr_1[1]~input_o\ & ((\Mux3~2_combout\ & (\regs[3][4]~q\)) # (!\Mux3~2_combout\ & ((\regs[2][4]~q\))))) # (!\addr_1[1]~input_o\ & (((\Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[3][4]~q\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[2][4]~q\,
	datad => \Mux3~2_combout\,
	combout => \Mux3~3_combout\);

-- Location: LCCOMB_X43_Y30_N28
\regs~40\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~40_combout\ = (\Decoder1~0_combout\ & (\data_2_in[4]~input_o\)) # (!\Decoder1~0_combout\ & ((\data_1_in[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_2_in[4]~input_o\,
	datac => \Decoder1~0_combout\,
	datad => \data_1_in[4]~input_o\,
	combout => \regs~40_combout\);

-- Location: FF_X43_Y30_N29
\regs[5][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~40_combout\,
	ena => \regs[5][4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[5][4]~q\);

-- Location: LCCOMB_X40_Y30_N12
\regs~41\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~41_combout\ = (\Decoder1~1_combout\ & (\data_2_in[4]~input_o\)) # (!\Decoder1~1_combout\ & ((\data_1_in[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[4]~input_o\,
	datac => \Decoder1~1_combout\,
	datad => \data_1_in[4]~input_o\,
	combout => \regs~41_combout\);

-- Location: FF_X40_Y30_N13
\regs[6][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~41_combout\,
	ena => \regs[6][4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[6][4]~q\);

-- Location: LCCOMB_X43_Y30_N2
\regs~42\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~42_combout\ = (\Decoder1~2_combout\ & (\data_2_in[4]~input_o\)) # (!\Decoder1~2_combout\ & ((\data_1_in[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_2_in[4]~input_o\,
	datac => \Decoder1~2_combout\,
	datad => \data_1_in[4]~input_o\,
	combout => \regs~42_combout\);

-- Location: FF_X39_Y30_N15
\regs[4][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~42_combout\,
	sload => VCC,
	ena => \regs[4][1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[4][4]~q\);

-- Location: LCCOMB_X40_Y30_N22
\Mux3~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\addr_1[1]~input_o\ & ((\regs[6][4]~q\) # ((\addr_1[0]~input_o\)))) # (!\addr_1[1]~input_o\ & (((!\addr_1[0]~input_o\ & \regs[4][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[6][4]~q\,
	datab => \addr_1[1]~input_o\,
	datac => \addr_1[0]~input_o\,
	datad => \regs[4][4]~q\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X44_Y30_N10
\regs~43\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~43_combout\ = (\Decoder1~3_combout\ & ((\data_2_in[4]~input_o\))) # (!\Decoder1~3_combout\ & (\data_1_in[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~3_combout\,
	datac => \data_1_in[4]~input_o\,
	datad => \data_2_in[4]~input_o\,
	combout => \regs~43_combout\);

-- Location: FF_X44_Y30_N11
\regs[7][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~43_combout\,
	ena => \regs[7][4]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[7][4]~q\);

-- Location: LCCOMB_X35_Y30_N12
\Mux3~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (\addr_1[0]~input_o\ & ((\Mux3~0_combout\ & ((\regs[7][4]~q\))) # (!\Mux3~0_combout\ & (\regs[5][4]~q\)))) # (!\addr_1[0]~input_o\ & (((\Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[5][4]~q\,
	datab => \addr_1[0]~input_o\,
	datac => \Mux3~0_combout\,
	datad => \regs[7][4]~q\,
	combout => \Mux3~1_combout\);

-- Location: LCCOMB_X35_Y30_N8
\Mux3~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux3~4_combout\ = (\addr_1[2]~input_o\ & ((\Mux3~1_combout\))) # (!\addr_1[2]~input_o\ & (\Mux3~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datac => \Mux3~3_combout\,
	datad => \Mux3~1_combout\,
	combout => \Mux3~4_combout\);

-- Location: FF_X35_Y30_N9
\data_1_out[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux3~4_combout\,
	ena => \rd_en_1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_1_out[4]~reg0_q\);

-- Location: IOIBUF_X51_Y34_N8
\data_2_in[5]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_2_in(5),
	o => \data_2_in[5]~input_o\);

-- Location: IOIBUF_X49_Y34_N8
\data_1_in[5]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_1_in(5),
	o => \data_1_in[5]~input_o\);

-- Location: LCCOMB_X44_Y30_N12
\regs~48\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~48_combout\ = (\Decoder1~0_combout\ & (\data_2_in[5]~input_o\)) # (!\Decoder1~0_combout\ & ((\data_1_in[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~0_combout\,
	datac => \data_2_in[5]~input_o\,
	datad => \data_1_in[5]~input_o\,
	combout => \regs~48_combout\);

-- Location: FF_X44_Y30_N13
\regs[5][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~48_combout\,
	ena => \regs[5][4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[5][5]~q\);

-- Location: LCCOMB_X44_Y30_N22
\regs~51\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~51_combout\ = (\Decoder1~3_combout\ & (\data_2_in[5]~input_o\)) # (!\Decoder1~3_combout\ & ((\data_1_in[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~3_combout\,
	datac => \data_2_in[5]~input_o\,
	datad => \data_1_in[5]~input_o\,
	combout => \regs~51_combout\);

-- Location: FF_X44_Y30_N23
\regs[7][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~51_combout\,
	ena => \regs[7][4]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[7][5]~q\);

-- Location: LCCOMB_X44_Y30_N20
\regs~49\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~49_combout\ = (\Decoder1~1_combout\ & (\data_2_in[5]~input_o\)) # (!\Decoder1~1_combout\ & ((\data_1_in[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~1_combout\,
	datac => \data_2_in[5]~input_o\,
	datad => \data_1_in[5]~input_o\,
	combout => \regs~49_combout\);

-- Location: FF_X40_Y30_N29
\regs[6][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~49_combout\,
	sload => VCC,
	ena => \regs[6][4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[6][5]~q\);

-- Location: LCCOMB_X40_Y29_N14
\regs~50\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~50_combout\ = (\Decoder1~2_combout\ & (\data_2_in[5]~input_o\)) # (!\Decoder1~2_combout\ & ((\data_1_in[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~2_combout\,
	datac => \data_2_in[5]~input_o\,
	datad => \data_1_in[5]~input_o\,
	combout => \regs~50_combout\);

-- Location: FF_X39_Y30_N29
\regs[4][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~50_combout\,
	sload => VCC,
	ena => \regs[4][1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[4][5]~q\);

-- Location: LCCOMB_X40_Y30_N28
\Mux2~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\addr_1[0]~input_o\ & (\addr_1[1]~input_o\)) # (!\addr_1[0]~input_o\ & ((\addr_1[1]~input_o\ & (\regs[6][5]~q\)) # (!\addr_1[1]~input_o\ & ((\regs[4][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[6][5]~q\,
	datad => \regs[4][5]~q\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X40_Y30_N30
\Mux2~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = (\addr_1[0]~input_o\ & ((\Mux2~0_combout\ & ((\regs[7][5]~q\))) # (!\Mux2~0_combout\ & (\regs[5][5]~q\)))) # (!\addr_1[0]~input_o\ & (((\Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \regs[5][5]~q\,
	datac => \regs[7][5]~q\,
	datad => \Mux2~0_combout\,
	combout => \Mux2~1_combout\);

-- Location: LCCOMB_X40_Y29_N24
\regs~52\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~52_combout\ = (\Decoder1~4_combout\ & (\data_2_in[5]~input_o\)) # (!\Decoder1~4_combout\ & ((\data_1_in[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Decoder1~4_combout\,
	datac => \data_2_in[5]~input_o\,
	datad => \data_1_in[5]~input_o\,
	combout => \regs~52_combout\);

-- Location: LCCOMB_X36_Y29_N16
\regs[2][5]~feeder\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[2][5]~feeder_combout\ = \regs~52_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \regs~52_combout\,
	combout => \regs[2][5]~feeder_combout\);

-- Location: FF_X36_Y29_N17
\regs[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs[2][5]~feeder_combout\,
	ena => \regs[2][0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[2][5]~q\);

-- Location: LCCOMB_X41_Y29_N30
\regs~55\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~55_combout\ = (\Decoder1~7_combout\ & ((\data_2_in[5]~input_o\))) # (!\Decoder1~7_combout\ & (\data_1_in[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~7_combout\,
	datac => \data_1_in[5]~input_o\,
	datad => \data_2_in[5]~input_o\,
	combout => \regs~55_combout\);

-- Location: LCCOMB_X37_Y29_N26
\regs[3][5]~feeder\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[3][5]~feeder_combout\ = \regs~55_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \regs~55_combout\,
	combout => \regs[3][5]~feeder_combout\);

-- Location: FF_X37_Y29_N27
\regs[3][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs[3][5]~feeder_combout\,
	ena => \regs[3][5]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[3][5]~q\);

-- Location: LCCOMB_X40_Y29_N4
\regs~54\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~54_combout\ = (\Decoder1~6_combout\ & (\data_2_in[5]~input_o\)) # (!\Decoder1~6_combout\ & ((\data_1_in[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Decoder1~6_combout\,
	datac => \data_2_in[5]~input_o\,
	datad => \data_1_in[5]~input_o\,
	combout => \regs~54_combout\);

-- Location: FF_X37_Y29_N5
\regs[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~54_combout\,
	sload => VCC,
	ena => \regs[0][3]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[0][5]~q\);

-- Location: LCCOMB_X40_Y29_N22
\regs~53\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~53_combout\ = (\Decoder1~5_combout\ & (\data_2_in[5]~input_o\)) # (!\Decoder1~5_combout\ & ((\data_1_in[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Decoder1~5_combout\,
	datac => \data_2_in[5]~input_o\,
	datad => \data_1_in[5]~input_o\,
	combout => \regs~53_combout\);

-- Location: FF_X38_Y29_N25
\regs[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~53_combout\,
	sload => VCC,
	ena => \regs[1][3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[1][5]~q\);

-- Location: LCCOMB_X38_Y29_N18
\Mux2~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux2~2_combout\ = (\addr_1[1]~input_o\ & (\addr_1[0]~input_o\)) # (!\addr_1[1]~input_o\ & ((\addr_1[0]~input_o\ & ((\regs[1][5]~q\))) # (!\addr_1[0]~input_o\ & (\regs[0][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[1]~input_o\,
	datab => \addr_1[0]~input_o\,
	datac => \regs[0][5]~q\,
	datad => \regs[1][5]~q\,
	combout => \Mux2~2_combout\);

-- Location: LCCOMB_X38_Y29_N16
\Mux2~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux2~3_combout\ = (\addr_1[1]~input_o\ & ((\Mux2~2_combout\ & ((\regs[3][5]~q\))) # (!\Mux2~2_combout\ & (\regs[2][5]~q\)))) # (!\addr_1[1]~input_o\ & (((\Mux2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[2][5]~q\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[3][5]~q\,
	datad => \Mux2~2_combout\,
	combout => \Mux2~3_combout\);

-- Location: LCCOMB_X38_Y29_N12
\Mux2~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux2~4_combout\ = (\addr_1[2]~input_o\ & (\Mux2~1_combout\)) # (!\addr_1[2]~input_o\ & ((\Mux2~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datac => \Mux2~1_combout\,
	datad => \Mux2~3_combout\,
	combout => \Mux2~4_combout\);

-- Location: FF_X38_Y29_N13
\data_1_out[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux2~4_combout\,
	ena => \rd_en_1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_1_out[5]~reg0_q\);

-- Location: IOIBUF_X43_Y34_N22
\data_2_in[6]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_2_in(6),
	o => \data_2_in[6]~input_o\);

-- Location: IOIBUF_X53_Y30_N1
\data_1_in[6]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_1_in(6),
	o => \data_1_in[6]~input_o\);

-- Location: LCCOMB_X36_Y29_N26
\regs~60\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~60_combout\ = (\Decoder1~4_combout\ & (\data_2_in[6]~input_o\)) # (!\Decoder1~4_combout\ & ((\data_1_in[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[6]~input_o\,
	datac => \data_1_in[6]~input_o\,
	datad => \Decoder1~4_combout\,
	combout => \regs~60_combout\);

-- Location: FF_X36_Y29_N27
\regs[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~60_combout\,
	ena => \regs[2][0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[2][6]~q\);

-- Location: LCCOMB_X36_Y29_N0
\regs~63\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~63_combout\ = (\Decoder1~7_combout\ & (\data_2_in[6]~input_o\)) # (!\Decoder1~7_combout\ & ((\data_1_in[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~7_combout\,
	datab => \data_2_in[6]~input_o\,
	datac => \data_1_in[6]~input_o\,
	combout => \regs~63_combout\);

-- Location: FF_X36_Y29_N1
\regs[3][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~63_combout\,
	ena => \regs[3][5]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[3][6]~q\);

-- Location: LCCOMB_X39_Y29_N24
\regs~61\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~61_combout\ = (\Decoder1~5_combout\ & (\data_2_in[6]~input_o\)) # (!\Decoder1~5_combout\ & ((\data_1_in[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[6]~input_o\,
	datac => \Decoder1~5_combout\,
	datad => \data_1_in[6]~input_o\,
	combout => \regs~61_combout\);

-- Location: LCCOMB_X38_Y29_N0
\regs[1][6]~feeder\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[1][6]~feeder_combout\ = \regs~61_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \regs~61_combout\,
	combout => \regs[1][6]~feeder_combout\);

-- Location: FF_X38_Y29_N1
\regs[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs[1][6]~feeder_combout\,
	ena => \regs[1][3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[1][6]~q\);

-- Location: LCCOMB_X39_Y29_N30
\regs~62\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~62_combout\ = (\Decoder1~6_combout\ & (\data_2_in[6]~input_o\)) # (!\Decoder1~6_combout\ & ((\data_1_in[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[6]~input_o\,
	datac => \Decoder1~6_combout\,
	datad => \data_1_in[6]~input_o\,
	combout => \regs~62_combout\);

-- Location: FF_X37_Y30_N21
\regs[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~62_combout\,
	sload => VCC,
	ena => \regs[0][3]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[0][6]~q\);

-- Location: LCCOMB_X38_Y29_N6
\Mux1~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux1~2_combout\ = (\addr_1[1]~input_o\ & (\addr_1[0]~input_o\)) # (!\addr_1[1]~input_o\ & ((\addr_1[0]~input_o\ & (\regs[1][6]~q\)) # (!\addr_1[0]~input_o\ & ((\regs[0][6]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[1]~input_o\,
	datab => \addr_1[0]~input_o\,
	datac => \regs[1][6]~q\,
	datad => \regs[0][6]~q\,
	combout => \Mux1~2_combout\);

-- Location: LCCOMB_X38_Y29_N8
\Mux1~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux1~3_combout\ = (\addr_1[1]~input_o\ & ((\Mux1~2_combout\ & ((\regs[3][6]~q\))) # (!\Mux1~2_combout\ & (\regs[2][6]~q\)))) # (!\addr_1[1]~input_o\ & (((\Mux1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[2][6]~q\,
	datab => \addr_1[1]~input_o\,
	datac => \regs[3][6]~q\,
	datad => \Mux1~2_combout\,
	combout => \Mux1~3_combout\);

-- Location: LCCOMB_X39_Y29_N18
\regs~59\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~59_combout\ = (\Decoder1~3_combout\ & (\data_2_in[6]~input_o\)) # (!\Decoder1~3_combout\ & ((\data_1_in[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[6]~input_o\,
	datac => \Decoder1~3_combout\,
	datad => \data_1_in[6]~input_o\,
	combout => \regs~59_combout\);

-- Location: FF_X39_Y29_N19
\regs[7][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~59_combout\,
	ena => \regs[7][4]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[7][6]~q\);

-- Location: LCCOMB_X43_Y30_N30
\regs~56\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~56_combout\ = (\Decoder1~0_combout\ & (\data_2_in[6]~input_o\)) # (!\Decoder1~0_combout\ & ((\data_1_in[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[6]~input_o\,
	datac => \Decoder1~0_combout\,
	datad => \data_1_in[6]~input_o\,
	combout => \regs~56_combout\);

-- Location: FF_X43_Y30_N31
\regs[5][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~56_combout\,
	ena => \regs[5][4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[5][6]~q\);

-- Location: LCCOMB_X39_Y29_N10
\regs~58\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~58_combout\ = (\Decoder1~2_combout\ & (\data_2_in[6]~input_o\)) # (!\Decoder1~2_combout\ & ((\data_1_in[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_2_in[6]~input_o\,
	datac => \Decoder1~2_combout\,
	datad => \data_1_in[6]~input_o\,
	combout => \regs~58_combout\);

-- Location: FF_X39_Y30_N23
\regs[4][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~58_combout\,
	sload => VCC,
	ena => \regs[4][1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[4][6]~q\);

-- Location: LCCOMB_X40_Y30_N20
\regs~57\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~57_combout\ = (\Decoder1~1_combout\ & (\data_2_in[6]~input_o\)) # (!\Decoder1~1_combout\ & ((\data_1_in[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_2_in[6]~input_o\,
	datac => \Decoder1~1_combout\,
	datad => \data_1_in[6]~input_o\,
	combout => \regs~57_combout\);

-- Location: FF_X40_Y30_N21
\regs[6][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~57_combout\,
	ena => \regs[6][4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[6][6]~q\);

-- Location: LCCOMB_X39_Y30_N0
\Mux1~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\addr_1[0]~input_o\ & (((\addr_1[1]~input_o\)))) # (!\addr_1[0]~input_o\ & ((\addr_1[1]~input_o\ & ((\regs[6][6]~q\))) # (!\addr_1[1]~input_o\ & (\regs[4][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[4][6]~q\,
	datab => \addr_1[0]~input_o\,
	datac => \regs[6][6]~q\,
	datad => \addr_1[1]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X38_Y29_N10
\Mux1~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\addr_1[0]~input_o\ & ((\Mux1~0_combout\ & (\regs[7][6]~q\)) # (!\Mux1~0_combout\ & ((\regs[5][6]~q\))))) # (!\addr_1[0]~input_o\ & (((\Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[7][6]~q\,
	datab => \addr_1[0]~input_o\,
	datac => \regs[5][6]~q\,
	datad => \Mux1~0_combout\,
	combout => \Mux1~1_combout\);

-- Location: LCCOMB_X38_Y29_N22
\Mux1~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux1~4_combout\ = (\addr_1[2]~input_o\ & ((\Mux1~1_combout\))) # (!\addr_1[2]~input_o\ & (\Mux1~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datac => \Mux1~3_combout\,
	datad => \Mux1~1_combout\,
	combout => \Mux1~4_combout\);

-- Location: FF_X38_Y29_N23
\data_1_out[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux1~4_combout\,
	ena => \rd_en_1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_1_out[6]~reg0_q\);

-- Location: IOIBUF_X51_Y34_N15
\data_1_in[7]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_1_in(7),
	o => \data_1_in[7]~input_o\);

-- Location: IOIBUF_X51_Y34_N22
\data_2_in[7]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_2_in(7),
	o => \data_2_in[7]~input_o\);

-- Location: LCCOMB_X43_Y30_N14
\regs~68\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~68_combout\ = (\Decoder1~4_combout\ & ((\data_2_in[7]~input_o\))) # (!\Decoder1~4_combout\ & (\data_1_in[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_1_in[7]~input_o\,
	datac => \Decoder1~4_combout\,
	datad => \data_2_in[7]~input_o\,
	combout => \regs~68_combout\);

-- Location: FF_X43_Y30_N15
\regs[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~68_combout\,
	ena => \regs[2][0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[2][7]~q\);

-- Location: LCCOMB_X40_Y30_N10
\regs~71\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~71_combout\ = (\Decoder1~7_combout\ & (\data_2_in[7]~input_o\)) # (!\Decoder1~7_combout\ & ((\data_1_in[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_2_in[7]~input_o\,
	datab => \data_1_in[7]~input_o\,
	datac => \Decoder1~7_combout\,
	combout => \regs~71_combout\);

-- Location: FF_X40_Y30_N11
\regs[3][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~71_combout\,
	ena => \regs[3][5]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[3][7]~q\);

-- Location: LCCOMB_X40_Y29_N28
\regs~69\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~69_combout\ = (\Decoder1~5_combout\ & (\data_2_in[7]~input_o\)) # (!\Decoder1~5_combout\ & ((\data_1_in[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Decoder1~5_combout\,
	datac => \data_2_in[7]~input_o\,
	datad => \data_1_in[7]~input_o\,
	combout => \regs~69_combout\);

-- Location: LCCOMB_X35_Y30_N6
\regs[1][7]~feeder\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs[1][7]~feeder_combout\ = \regs~69_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \regs~69_combout\,
	combout => \regs[1][7]~feeder_combout\);

-- Location: FF_X35_Y30_N7
\regs[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs[1][7]~feeder_combout\,
	ena => \regs[1][3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[1][7]~q\);

-- Location: LCCOMB_X44_Y30_N2
\regs~70\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~70_combout\ = (\Decoder1~6_combout\ & ((\data_2_in[7]~input_o\))) # (!\Decoder1~6_combout\ & (\data_1_in[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[7]~input_o\,
	datab => \data_2_in[7]~input_o\,
	datad => \Decoder1~6_combout\,
	combout => \regs~70_combout\);

-- Location: FF_X39_Y30_N17
\regs[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~70_combout\,
	sload => VCC,
	ena => \regs[0][3]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[0][7]~q\);

-- Location: LCCOMB_X35_Y30_N28
\Mux0~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (\addr_1[0]~input_o\ & ((\regs[1][7]~q\) # ((\addr_1[1]~input_o\)))) # (!\addr_1[0]~input_o\ & (((!\addr_1[1]~input_o\ & \regs[0][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[1][7]~q\,
	datab => \addr_1[0]~input_o\,
	datac => \addr_1[1]~input_o\,
	datad => \regs[0][7]~q\,
	combout => \Mux0~2_combout\);

-- Location: LCCOMB_X35_Y30_N30
\Mux0~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = (\addr_1[1]~input_o\ & ((\Mux0~2_combout\ & ((\regs[3][7]~q\))) # (!\Mux0~2_combout\ & (\regs[2][7]~q\)))) # (!\addr_1[1]~input_o\ & (((\Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[1]~input_o\,
	datab => \regs[2][7]~q\,
	datac => \regs[3][7]~q\,
	datad => \Mux0~2_combout\,
	combout => \Mux0~3_combout\);

-- Location: LCCOMB_X44_Y30_N24
\regs~67\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~67_combout\ = (\Decoder1~3_combout\ & ((\data_2_in[7]~input_o\))) # (!\Decoder1~3_combout\ & (\data_1_in[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1_in[7]~input_o\,
	datab => \data_2_in[7]~input_o\,
	datac => \Decoder1~3_combout\,
	combout => \regs~67_combout\);

-- Location: FF_X44_Y30_N25
\regs[7][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~67_combout\,
	ena => \regs[7][4]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[7][7]~q\);

-- Location: LCCOMB_X43_Y30_N24
\regs~64\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~64_combout\ = (\Decoder1~0_combout\ & ((\data_2_in[7]~input_o\))) # (!\Decoder1~0_combout\ & (\data_1_in[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_1_in[7]~input_o\,
	datac => \Decoder1~0_combout\,
	datad => \data_2_in[7]~input_o\,
	combout => \regs~64_combout\);

-- Location: FF_X43_Y30_N25
\regs[5][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~64_combout\,
	ena => \regs[5][4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[5][7]~q\);

-- Location: LCCOMB_X40_Y30_N18
\regs~65\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~65_combout\ = (\Decoder1~1_combout\ & ((\data_2_in[7]~input_o\))) # (!\Decoder1~1_combout\ & (\data_1_in[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~1_combout\,
	datab => \data_1_in[7]~input_o\,
	datac => \data_2_in[7]~input_o\,
	combout => \regs~65_combout\);

-- Location: FF_X40_Y30_N19
\regs[6][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \regs~65_combout\,
	ena => \regs[6][4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[6][7]~q\);

-- Location: LCCOMB_X40_Y29_N26
\regs~66\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \regs~66_combout\ = (\Decoder1~2_combout\ & (\data_2_in[7]~input_o\)) # (!\Decoder1~2_combout\ & ((\data_1_in[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~2_combout\,
	datac => \data_2_in[7]~input_o\,
	datad => \data_1_in[7]~input_o\,
	combout => \regs~66_combout\);

-- Location: FF_X39_Y30_N7
\regs[4][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \regs~66_combout\,
	sload => VCC,
	ena => \regs[4][1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regs[4][7]~q\);

-- Location: LCCOMB_X40_Y30_N0
\Mux0~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\addr_1[0]~input_o\ & (((\addr_1[1]~input_o\)))) # (!\addr_1[0]~input_o\ & ((\addr_1[1]~input_o\ & (\regs[6][7]~q\)) # (!\addr_1[1]~input_o\ & ((\regs[4][7]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[0]~input_o\,
	datab => \regs[6][7]~q\,
	datac => \regs[4][7]~q\,
	datad => \addr_1[1]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X35_Y30_N16
\Mux0~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\addr_1[0]~input_o\ & ((\Mux0~0_combout\ & (\regs[7][7]~q\)) # (!\Mux0~0_combout\ & ((\regs[5][7]~q\))))) # (!\addr_1[0]~input_o\ & (((\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[7][7]~q\,
	datab => \addr_1[0]~input_o\,
	datac => \regs[5][7]~q\,
	datad => \Mux0~0_combout\,
	combout => \Mux0~1_combout\);

-- Location: LCCOMB_X35_Y30_N14
\Mux0~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux0~4_combout\ = (\addr_1[2]~input_o\ & ((\Mux0~1_combout\))) # (!\addr_1[2]~input_o\ & (\Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_1[2]~input_o\,
	datac => \Mux0~3_combout\,
	datad => \Mux0~1_combout\,
	combout => \Mux0~4_combout\);

-- Location: FF_X35_Y30_N15
\data_1_out[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux0~4_combout\,
	ena => \rd_en_1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_1_out[7]~reg0_q\);

-- Location: LCCOMB_X38_Y30_N20
\Mux15~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux15~2_combout\ = (\addr_2[0]~input_o\ & ((\addr_2[1]~input_o\) # ((\regs[1][0]~q\)))) # (!\addr_2[0]~input_o\ & (!\addr_2[1]~input_o\ & (\regs[0][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \addr_2[1]~input_o\,
	datac => \regs[0][0]~q\,
	datad => \regs[1][0]~q\,
	combout => \Mux15~2_combout\);

-- Location: LCCOMB_X38_Y30_N30
\Mux15~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux15~3_combout\ = (\addr_2[1]~input_o\ & ((\Mux15~2_combout\ & (\regs[3][0]~q\)) # (!\Mux15~2_combout\ & ((\regs[2][0]~q\))))) # (!\addr_2[1]~input_o\ & (((\Mux15~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \regs[3][0]~q\,
	datac => \regs[2][0]~q\,
	datad => \Mux15~2_combout\,
	combout => \Mux15~3_combout\);

-- Location: LCCOMB_X39_Y30_N20
\Mux15~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\) # ((\regs[6][0]~q\)))) # (!\addr_2[1]~input_o\ & (!\addr_2[0]~input_o\ & (\regs[4][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[4][0]~q\,
	datad => \regs[6][0]~q\,
	combout => \Mux15~0_combout\);

-- Location: LCCOMB_X38_Y30_N2
\Mux15~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux15~1_combout\ = (\addr_2[0]~input_o\ & ((\Mux15~0_combout\ & ((\regs[7][0]~q\))) # (!\Mux15~0_combout\ & (\regs[5][0]~q\)))) # (!\addr_2[0]~input_o\ & (((\Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \regs[5][0]~q\,
	datac => \Mux15~0_combout\,
	datad => \regs[7][0]~q\,
	combout => \Mux15~1_combout\);

-- Location: LCCOMB_X37_Y30_N8
\Mux15~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux15~4_combout\ = (\addr_2[2]~input_o\ & ((\Mux15~1_combout\))) # (!\addr_2[2]~input_o\ & (\Mux15~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[2]~input_o\,
	datac => \Mux15~3_combout\,
	datad => \Mux15~1_combout\,
	combout => \Mux15~4_combout\);

-- Location: IOIBUF_X18_Y34_N22
\rd_en_2~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rd_en_2,
	o => \rd_en_2~input_o\);

-- Location: FF_X37_Y30_N9
\data_2_out[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux15~4_combout\,
	ena => \rd_en_2~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_2_out[0]~reg0_q\);

-- Location: LCCOMB_X39_Y30_N30
\Mux14~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux14~2_combout\ = (\addr_2[1]~input_o\ & (\addr_2[0]~input_o\)) # (!\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\ & ((\regs[1][1]~q\))) # (!\addr_2[0]~input_o\ & (\regs[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[0][1]~q\,
	datad => \regs[1][1]~q\,
	combout => \Mux14~2_combout\);

-- Location: LCCOMB_X38_Y30_N10
\Mux14~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux14~3_combout\ = (\Mux14~2_combout\ & (((\regs[3][1]~q\) # (!\addr_2[1]~input_o\)))) # (!\Mux14~2_combout\ & (\regs[2][1]~q\ & ((\addr_2[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[2][1]~q\,
	datab => \regs[3][1]~q\,
	datac => \Mux14~2_combout\,
	datad => \addr_2[1]~input_o\,
	combout => \Mux14~3_combout\);

-- Location: LCCOMB_X39_Y30_N24
\Mux14~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = (\addr_2[1]~input_o\ & ((\regs[6][1]~q\) # ((\addr_2[0]~input_o\)))) # (!\addr_2[1]~input_o\ & (((\regs[4][1]~q\ & !\addr_2[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \regs[6][1]~q\,
	datac => \regs[4][1]~q\,
	datad => \addr_2[0]~input_o\,
	combout => \Mux14~0_combout\);

-- Location: LCCOMB_X38_Y30_N16
\Mux14~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux14~1_combout\ = (\addr_2[0]~input_o\ & ((\Mux14~0_combout\ & (\regs[7][1]~q\)) # (!\Mux14~0_combout\ & ((\regs[5][1]~q\))))) # (!\addr_2[0]~input_o\ & (((\Mux14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \regs[7][1]~q\,
	datac => \regs[5][1]~q\,
	datad => \Mux14~0_combout\,
	combout => \Mux14~1_combout\);

-- Location: LCCOMB_X37_Y30_N14
\Mux14~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux14~4_combout\ = (\addr_2[2]~input_o\ & ((\Mux14~1_combout\))) # (!\addr_2[2]~input_o\ & (\Mux14~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[2]~input_o\,
	datac => \Mux14~3_combout\,
	datad => \Mux14~1_combout\,
	combout => \Mux14~4_combout\);

-- Location: FF_X37_Y30_N15
\data_2_out[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux14~4_combout\,
	ena => \rd_en_2~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_2_out[1]~reg0_q\);

-- Location: LCCOMB_X39_Y30_N12
\Mux13~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\) # ((\regs[6][2]~q\)))) # (!\addr_2[1]~input_o\ & (!\addr_2[0]~input_o\ & (\regs[4][2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[4][2]~q\,
	datad => \regs[6][2]~q\,
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X38_Y30_N8
\Mux13~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux13~1_combout\ = (\addr_2[0]~input_o\ & ((\Mux13~0_combout\ & (\regs[7][2]~q\)) # (!\Mux13~0_combout\ & ((\regs[5][2]~q\))))) # (!\addr_2[0]~input_o\ & (((\Mux13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \regs[7][2]~q\,
	datac => \Mux13~0_combout\,
	datad => \regs[5][2]~q\,
	combout => \Mux13~1_combout\);

-- Location: LCCOMB_X39_Y30_N2
\Mux13~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux13~2_combout\ = (\addr_2[1]~input_o\ & (\addr_2[0]~input_o\)) # (!\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\ & ((\regs[1][2]~q\))) # (!\addr_2[0]~input_o\ & (\regs[0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[0][2]~q\,
	datad => \regs[1][2]~q\,
	combout => \Mux13~2_combout\);

-- Location: LCCOMB_X38_Y30_N6
\Mux13~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux13~3_combout\ = (\addr_2[1]~input_o\ & ((\Mux13~2_combout\ & ((\regs[3][2]~q\))) # (!\Mux13~2_combout\ & (\regs[2][2]~q\)))) # (!\addr_2[1]~input_o\ & (((\Mux13~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \regs[2][2]~q\,
	datac => \regs[3][2]~q\,
	datad => \Mux13~2_combout\,
	combout => \Mux13~3_combout\);

-- Location: LCCOMB_X37_Y30_N16
\Mux13~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux13~4_combout\ = (\addr_2[2]~input_o\ & (\Mux13~1_combout\)) # (!\addr_2[2]~input_o\ & ((\Mux13~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[2]~input_o\,
	datac => \Mux13~1_combout\,
	datad => \Mux13~3_combout\,
	combout => \Mux13~4_combout\);

-- Location: FF_X37_Y30_N17
\data_2_out[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux13~4_combout\,
	ena => \rd_en_2~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_2_out[2]~reg0_q\);

-- Location: LCCOMB_X37_Y30_N28
\Mux12~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux12~2_combout\ = (\addr_2[1]~input_o\ & (\addr_2[0]~input_o\)) # (!\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\ & ((\regs[1][3]~q\))) # (!\addr_2[0]~input_o\ & (\regs[0][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[0][3]~q\,
	datad => \regs[1][3]~q\,
	combout => \Mux12~2_combout\);

-- Location: LCCOMB_X37_Y30_N26
\Mux12~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux12~3_combout\ = (\addr_2[1]~input_o\ & ((\Mux12~2_combout\ & (\regs[3][3]~q\)) # (!\Mux12~2_combout\ & ((\regs[2][3]~q\))))) # (!\addr_2[1]~input_o\ & (((\Mux12~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[3][3]~q\,
	datab => \addr_2[1]~input_o\,
	datac => \regs[2][3]~q\,
	datad => \Mux12~2_combout\,
	combout => \Mux12~3_combout\);

-- Location: LCCOMB_X39_Y30_N8
\Mux12~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = (\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\) # ((\regs[6][3]~q\)))) # (!\addr_2[1]~input_o\ & (!\addr_2[0]~input_o\ & (\regs[4][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[4][3]~q\,
	datad => \regs[6][3]~q\,
	combout => \Mux12~0_combout\);

-- Location: LCCOMB_X39_Y30_N18
\Mux12~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux12~1_combout\ = (\addr_2[0]~input_o\ & ((\Mux12~0_combout\ & ((\regs[7][3]~q\))) # (!\Mux12~0_combout\ & (\regs[5][3]~q\)))) # (!\addr_2[0]~input_o\ & (((\Mux12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \regs[5][3]~q\,
	datac => \Mux12~0_combout\,
	datad => \regs[7][3]~q\,
	combout => \Mux12~1_combout\);

-- Location: LCCOMB_X37_Y30_N18
\Mux12~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux12~4_combout\ = (\addr_2[2]~input_o\ & ((\Mux12~1_combout\))) # (!\addr_2[2]~input_o\ & (\Mux12~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[2]~input_o\,
	datac => \Mux12~3_combout\,
	datad => \Mux12~1_combout\,
	combout => \Mux12~4_combout\);

-- Location: FF_X37_Y30_N19
\data_2_out[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux12~4_combout\,
	ena => \rd_en_2~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_2_out[3]~reg0_q\);

-- Location: LCCOMB_X37_Y30_N2
\Mux11~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux11~2_combout\ = (\addr_2[1]~input_o\ & (\addr_2[0]~input_o\)) # (!\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\ & ((\regs[1][4]~q\))) # (!\addr_2[0]~input_o\ & (\regs[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[0][4]~q\,
	datad => \regs[1][4]~q\,
	combout => \Mux11~2_combout\);

-- Location: LCCOMB_X37_Y30_N30
\Mux11~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux11~3_combout\ = (\addr_2[1]~input_o\ & ((\Mux11~2_combout\ & (\regs[3][4]~q\)) # (!\Mux11~2_combout\ & ((\regs[2][4]~q\))))) # (!\addr_2[1]~input_o\ & (\Mux11~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \Mux11~2_combout\,
	datac => \regs[3][4]~q\,
	datad => \regs[2][4]~q\,
	combout => \Mux11~3_combout\);

-- Location: LCCOMB_X39_Y30_N14
\Mux11~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (\addr_2[1]~input_o\ & ((\regs[6][4]~q\) # ((\addr_2[0]~input_o\)))) # (!\addr_2[1]~input_o\ & (((\regs[4][4]~q\ & !\addr_2[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \regs[6][4]~q\,
	datac => \regs[4][4]~q\,
	datad => \addr_2[0]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X37_Y30_N12
\Mux11~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux11~1_combout\ = (\addr_2[0]~input_o\ & ((\Mux11~0_combout\ & ((\regs[7][4]~q\))) # (!\Mux11~0_combout\ & (\regs[5][4]~q\)))) # (!\addr_2[0]~input_o\ & (((\Mux11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[5][4]~q\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[7][4]~q\,
	datad => \Mux11~0_combout\,
	combout => \Mux11~1_combout\);

-- Location: LCCOMB_X37_Y30_N0
\Mux11~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux11~4_combout\ = (\addr_2[2]~input_o\ & ((\Mux11~1_combout\))) # (!\addr_2[2]~input_o\ & (\Mux11~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[2]~input_o\,
	datac => \Mux11~3_combout\,
	datad => \Mux11~1_combout\,
	combout => \Mux11~4_combout\);

-- Location: FF_X37_Y30_N1
\data_2_out[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux11~4_combout\,
	ena => \rd_en_2~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_2_out[4]~reg0_q\);

-- Location: LCCOMB_X37_Y29_N24
\Mux10~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux10~2_combout\ = (\addr_2[1]~input_o\ & (\addr_2[0]~input_o\)) # (!\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\ & ((\regs[1][5]~q\))) # (!\addr_2[0]~input_o\ & (\regs[0][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[0][5]~q\,
	datad => \regs[1][5]~q\,
	combout => \Mux10~2_combout\);

-- Location: LCCOMB_X37_Y29_N18
\Mux10~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux10~3_combout\ = (\addr_2[1]~input_o\ & ((\Mux10~2_combout\ & (\regs[3][5]~q\)) # (!\Mux10~2_combout\ & ((\regs[2][5]~q\))))) # (!\addr_2[1]~input_o\ & (((\Mux10~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \regs[3][5]~q\,
	datac => \regs[2][5]~q\,
	datad => \Mux10~2_combout\,
	combout => \Mux10~3_combout\);

-- Location: LCCOMB_X39_Y30_N28
\Mux10~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\) # ((\regs[6][5]~q\)))) # (!\addr_2[1]~input_o\ & (!\addr_2[0]~input_o\ & (\regs[4][5]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[4][5]~q\,
	datad => \regs[6][5]~q\,
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X39_Y30_N4
\Mux10~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux10~1_combout\ = (\addr_2[0]~input_o\ & ((\Mux10~0_combout\ & (\regs[7][5]~q\)) # (!\Mux10~0_combout\ & ((\regs[5][5]~q\))))) # (!\addr_2[0]~input_o\ & (\Mux10~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \Mux10~0_combout\,
	datac => \regs[7][5]~q\,
	datad => \regs[5][5]~q\,
	combout => \Mux10~1_combout\);

-- Location: LCCOMB_X37_Y30_N6
\Mux10~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux10~4_combout\ = (\addr_2[2]~input_o\ & ((\Mux10~1_combout\))) # (!\addr_2[2]~input_o\ & (\Mux10~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[2]~input_o\,
	datac => \Mux10~3_combout\,
	datad => \Mux10~1_combout\,
	combout => \Mux10~4_combout\);

-- Location: FF_X37_Y30_N7
\data_2_out[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux10~4_combout\,
	ena => \rd_en_2~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_2_out[5]~reg0_q\);

-- Location: LCCOMB_X37_Y30_N20
\Mux9~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux9~2_combout\ = (\addr_2[1]~input_o\ & (\addr_2[0]~input_o\)) # (!\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\ & ((\regs[1][6]~q\))) # (!\addr_2[0]~input_o\ & (\regs[0][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[0][6]~q\,
	datad => \regs[1][6]~q\,
	combout => \Mux9~2_combout\);

-- Location: LCCOMB_X37_Y30_N4
\Mux9~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux9~3_combout\ = (\addr_2[1]~input_o\ & ((\Mux9~2_combout\ & (\regs[3][6]~q\)) # (!\Mux9~2_combout\ & ((\regs[2][6]~q\))))) # (!\addr_2[1]~input_o\ & (((\Mux9~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \regs[3][6]~q\,
	datac => \regs[2][6]~q\,
	datad => \Mux9~2_combout\,
	combout => \Mux9~3_combout\);

-- Location: LCCOMB_X39_Y30_N22
\Mux9~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\) # ((\regs[6][6]~q\)))) # (!\addr_2[1]~input_o\ & (!\addr_2[0]~input_o\ & (\regs[4][6]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[4][6]~q\,
	datad => \regs[6][6]~q\,
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X38_Y30_N28
\Mux9~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux9~1_combout\ = (\addr_2[0]~input_o\ & ((\Mux9~0_combout\ & (\regs[7][6]~q\)) # (!\Mux9~0_combout\ & ((\regs[5][6]~q\))))) # (!\addr_2[0]~input_o\ & (((\Mux9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[0]~input_o\,
	datab => \regs[7][6]~q\,
	datac => \regs[5][6]~q\,
	datad => \Mux9~0_combout\,
	combout => \Mux9~1_combout\);

-- Location: LCCOMB_X37_Y30_N24
\Mux9~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux9~4_combout\ = (\addr_2[2]~input_o\ & ((\Mux9~1_combout\))) # (!\addr_2[2]~input_o\ & (\Mux9~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[2]~input_o\,
	datac => \Mux9~3_combout\,
	datad => \Mux9~1_combout\,
	combout => \Mux9~4_combout\);

-- Location: FF_X37_Y30_N25
\data_2_out[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux9~4_combout\,
	ena => \rd_en_2~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_2_out[6]~reg0_q\);

-- Location: LCCOMB_X39_Y30_N6
\Mux8~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\) # ((\regs[6][7]~q\)))) # (!\addr_2[1]~input_o\ & (!\addr_2[0]~input_o\ & (\regs[4][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[4][7]~q\,
	datad => \regs[6][7]~q\,
	combout => \Mux8~0_combout\);

-- Location: LCCOMB_X37_Y30_N22
\Mux8~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux8~1_combout\ = (\addr_2[0]~input_o\ & ((\Mux8~0_combout\ & ((\regs[7][7]~q\))) # (!\Mux8~0_combout\ & (\regs[5][7]~q\)))) # (!\addr_2[0]~input_o\ & (((\Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regs[5][7]~q\,
	datab => \addr_2[0]~input_o\,
	datac => \Mux8~0_combout\,
	datad => \regs[7][7]~q\,
	combout => \Mux8~1_combout\);

-- Location: LCCOMB_X39_Y30_N16
\Mux8~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux8~2_combout\ = (\addr_2[1]~input_o\ & (\addr_2[0]~input_o\)) # (!\addr_2[1]~input_o\ & ((\addr_2[0]~input_o\ & ((\regs[1][7]~q\))) # (!\addr_2[0]~input_o\ & (\regs[0][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \addr_2[0]~input_o\,
	datac => \regs[0][7]~q\,
	datad => \regs[1][7]~q\,
	combout => \Mux8~2_combout\);

-- Location: LCCOMB_X39_Y30_N26
\Mux8~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux8~3_combout\ = (\addr_2[1]~input_o\ & ((\Mux8~2_combout\ & (\regs[3][7]~q\)) # (!\Mux8~2_combout\ & ((\regs[2][7]~q\))))) # (!\addr_2[1]~input_o\ & (((\Mux8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[1]~input_o\,
	datab => \regs[3][7]~q\,
	datac => \regs[2][7]~q\,
	datad => \Mux8~2_combout\,
	combout => \Mux8~3_combout\);

-- Location: LCCOMB_X37_Y30_N10
\Mux8~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux8~4_combout\ = (\addr_2[2]~input_o\ & (\Mux8~1_combout\)) # (!\addr_2[2]~input_o\ & ((\Mux8~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr_2[2]~input_o\,
	datac => \Mux8~1_combout\,
	datad => \Mux8~3_combout\,
	combout => \Mux8~4_combout\);

-- Location: FF_X37_Y30_N11
\data_2_out[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux8~4_combout\,
	ena => \rd_en_2~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_2_out[7]~reg0_q\);

-- Location: IOIBUF_X47_Y0_N22
\reset~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

ww_data_1_out(0) <= \data_1_out[0]~output_o\;

ww_data_1_out(1) <= \data_1_out[1]~output_o\;

ww_data_1_out(2) <= \data_1_out[2]~output_o\;

ww_data_1_out(3) <= \data_1_out[3]~output_o\;

ww_data_1_out(4) <= \data_1_out[4]~output_o\;

ww_data_1_out(5) <= \data_1_out[5]~output_o\;

ww_data_1_out(6) <= \data_1_out[6]~output_o\;

ww_data_1_out(7) <= \data_1_out[7]~output_o\;

ww_data_2_out(0) <= \data_2_out[0]~output_o\;

ww_data_2_out(1) <= \data_2_out[1]~output_o\;

ww_data_2_out(2) <= \data_2_out[2]~output_o\;

ww_data_2_out(3) <= \data_2_out[3]~output_o\;

ww_data_2_out(4) <= \data_2_out[4]~output_o\;

ww_data_2_out(5) <= \data_2_out[5]~output_o\;

ww_data_2_out(6) <= \data_2_out[6]~output_o\;

ww_data_2_out(7) <= \data_2_out[7]~output_o\;
END structure;


