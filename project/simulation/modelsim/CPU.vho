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

-- DATE "07/22/2020 20:01:12"

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

ENTITY 	ALU IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	op1 : IN std_logic_vector(7 DOWNTO 0);
	op2 : IN std_logic_vector(7 DOWNTO 0);
	ins : IN std_logic_vector(3 DOWNTO 0);
	output : BUFFER std_logic_vector(7 DOWNTO 0);
	flags : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END ALU;

-- Design Ports Information
-- reset	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[0]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[1]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[2]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[3]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[4]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[5]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[6]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[7]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- flags[0]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- flags[1]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- flags[2]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- flags[3]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- flags[4]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- flags[5]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- flags[6]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- flags[7]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ins[0]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op2[0]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op1[0]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ins[1]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ins[2]	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ins[3]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op2[1]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op1[1]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op2[2]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op1[2]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op2[3]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op1[3]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op2[4]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op1[4]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op2[5]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op1[5]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op2[6]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op1[6]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op2[7]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op1[7]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ALU IS
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
SIGNAL ww_op1 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_op2 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ins : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_output : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_flags : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \output[0]~output_o\ : std_logic;
SIGNAL \output[1]~output_o\ : std_logic;
SIGNAL \output[2]~output_o\ : std_logic;
SIGNAL \output[3]~output_o\ : std_logic;
SIGNAL \output[4]~output_o\ : std_logic;
SIGNAL \output[5]~output_o\ : std_logic;
SIGNAL \output[6]~output_o\ : std_logic;
SIGNAL \output[7]~output_o\ : std_logic;
SIGNAL \flags[0]~output_o\ : std_logic;
SIGNAL \flags[1]~output_o\ : std_logic;
SIGNAL \flags[2]~output_o\ : std_logic;
SIGNAL \flags[3]~output_o\ : std_logic;
SIGNAL \flags[4]~output_o\ : std_logic;
SIGNAL \flags[5]~output_o\ : std_logic;
SIGNAL \flags[6]~output_o\ : std_logic;
SIGNAL \flags[7]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \ins[0]~input_o\ : std_logic;
SIGNAL \ins[1]~input_o\ : std_logic;
SIGNAL \op1[0]~input_o\ : std_logic;
SIGNAL \op2[0]~input_o\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~2_cout\ : std_logic;
SIGNAL \Add0~3_combout\ : std_logic;
SIGNAL \ins[3]~input_o\ : std_logic;
SIGNAL \ins[2]~input_o\ : std_logic;
SIGNAL \Add0~5_combout\ : std_logic;
SIGNAL \output[0]~reg0_q\ : std_logic;
SIGNAL \op2[1]~input_o\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \op1[1]~input_o\ : std_logic;
SIGNAL \Add0~4\ : std_logic;
SIGNAL \Add0~7_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Add0~9_combout\ : std_logic;
SIGNAL \output[1]~reg0_q\ : std_logic;
SIGNAL \op2[2]~input_o\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \op1[2]~input_o\ : std_logic;
SIGNAL \Add0~8\ : std_logic;
SIGNAL \Add0~11_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Add0~13_combout\ : std_logic;
SIGNAL \output[2]~reg0_q\ : std_logic;
SIGNAL \op1[3]~input_o\ : std_logic;
SIGNAL \op2[3]~input_o\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~12\ : std_logic;
SIGNAL \Add0~15_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Add0~17_combout\ : std_logic;
SIGNAL \output[3]~reg0_q\ : std_logic;
SIGNAL \op2[4]~input_o\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \op1[4]~input_o\ : std_logic;
SIGNAL \Add0~16\ : std_logic;
SIGNAL \Add0~19_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Add0~21_combout\ : std_logic;
SIGNAL \output[4]~reg0_q\ : std_logic;
SIGNAL \op1[5]~input_o\ : std_logic;
SIGNAL \op2[5]~input_o\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Add0~20\ : std_logic;
SIGNAL \Add0~23_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Add0~25_combout\ : std_logic;
SIGNAL \output[5]~reg0_q\ : std_logic;
SIGNAL \op2[6]~input_o\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \op1[6]~input_o\ : std_logic;
SIGNAL \Add0~24\ : std_logic;
SIGNAL \Add0~27_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Add0~29_combout\ : std_logic;
SIGNAL \output[6]~reg0_q\ : std_logic;
SIGNAL \op2[7]~input_o\ : std_logic;
SIGNAL \op1[7]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \Add0~28\ : std_logic;
SIGNAL \Add0~31_combout\ : std_logic;
SIGNAL \Add0~33_combout\ : std_logic;
SIGNAL \output[7]~reg0_q\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \temp_flags[5]~0_combout\ : std_logic;
SIGNAL \flags[5]~reg0_q\ : std_logic;
SIGNAL \flags[6]~reg0_q\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \flags[7]~reg0_q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_op1 <= op1;
ww_op2 <= op2;
ww_ins <= ins;
output <= ww_output;
flags <= ww_flags;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X53_Y24_N23
\output[0]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output[0]~reg0_q\,
	devoe => ww_devoe,
	o => \output[0]~output_o\);

-- Location: IOOBUF_X34_Y34_N9
\output[1]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output[1]~reg0_q\,
	devoe => ww_devoe,
	o => \output[1]~output_o\);

-- Location: IOOBUF_X34_Y34_N2
\output[2]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output[2]~reg0_q\,
	devoe => ww_devoe,
	o => \output[2]~output_o\);

-- Location: IOOBUF_X51_Y34_N2
\output[3]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output[3]~reg0_q\,
	devoe => ww_devoe,
	o => \output[3]~output_o\);

-- Location: IOOBUF_X38_Y34_N2
\output[4]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output[4]~reg0_q\,
	devoe => ww_devoe,
	o => \output[4]~output_o\);

-- Location: IOOBUF_X43_Y0_N16
\output[5]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output[5]~reg0_q\,
	devoe => ww_devoe,
	o => \output[5]~output_o\);

-- Location: IOOBUF_X53_Y22_N9
\output[6]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output[6]~reg0_q\,
	devoe => ww_devoe,
	o => \output[6]~output_o\);

-- Location: IOOBUF_X53_Y22_N2
\output[7]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output[7]~reg0_q\,
	devoe => ww_devoe,
	o => \output[7]~output_o\);

-- Location: IOOBUF_X5_Y0_N9
\flags[0]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \flags[0]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\flags[1]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \flags[1]~output_o\);

-- Location: IOOBUF_X0_Y25_N9
\flags[2]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \flags[2]~output_o\);

-- Location: IOOBUF_X9_Y34_N9
\flags[3]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \flags[3]~output_o\);

-- Location: IOOBUF_X18_Y34_N2
\flags[4]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \flags[4]~output_o\);

-- Location: IOOBUF_X53_Y21_N23
\flags[5]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \flags[5]~reg0_q\,
	devoe => ww_devoe,
	o => \flags[5]~output_o\);

-- Location: IOOBUF_X45_Y34_N16
\flags[6]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \flags[6]~reg0_q\,
	devoe => ww_devoe,
	o => \flags[6]~output_o\);

-- Location: IOOBUF_X53_Y30_N9
\flags[7]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \flags[7]~reg0_q\,
	devoe => ww_devoe,
	o => \flags[7]~output_o\);

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

-- Location: IOIBUF_X25_Y34_N22
\ins[0]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ins(0),
	o => \ins[0]~input_o\);

-- Location: IOIBUF_X49_Y34_N8
\ins[1]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ins(1),
	o => \ins[1]~input_o\);

-- Location: IOIBUF_X51_Y34_N8
\op1[0]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op1(0),
	o => \op1[0]~input_o\);

-- Location: IOIBUF_X53_Y30_N1
\op2[0]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op2(0),
	o => \op2[0]~input_o\);

-- Location: LCCOMB_X43_Y30_N8
\Mux7~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\op1[0]~input_o\ & (\ins[1]~input_o\ $ (((\ins[0]~input_o\ & \op2[0]~input_o\))))) # (!\op1[0]~input_o\ & ((\ins[1]~input_o\ & ((\op2[0]~input_o\))) # (!\ins[1]~input_o\ & (!\ins[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[0]~input_o\,
	datab => \ins[1]~input_o\,
	datac => \op1[0]~input_o\,
	datad => \op2[0]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X43_Y30_N2
\Add0~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\ins[1]~input_o\) # (\ins[0]~input_o\ $ (\op2[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ins[0]~input_o\,
	datac => \ins[1]~input_o\,
	datad => \op2[0]~input_o\,
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X43_Y29_N4
\Add0~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~2_cout\ = CARRY((!\ins[1]~input_o\ & \ins[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[1]~input_o\,
	datab => \ins[0]~input_o\,
	datad => VCC,
	cout => \Add0~2_cout\);

-- Location: LCCOMB_X43_Y29_N6
\Add0~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~3_combout\ = (\op1[0]~input_o\ & ((\Add0~0_combout\ & (\Add0~2_cout\ & VCC)) # (!\Add0~0_combout\ & (!\Add0~2_cout\)))) # (!\op1[0]~input_o\ & ((\Add0~0_combout\ & (!\Add0~2_cout\)) # (!\Add0~0_combout\ & ((\Add0~2_cout\) # (GND)))))
-- \Add0~4\ = CARRY((\op1[0]~input_o\ & (!\Add0~0_combout\ & !\Add0~2_cout\)) # (!\op1[0]~input_o\ & ((!\Add0~2_cout\) # (!\Add0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \op1[0]~input_o\,
	datab => \Add0~0_combout\,
	datad => VCC,
	cin => \Add0~2_cout\,
	combout => \Add0~3_combout\,
	cout => \Add0~4\);

-- Location: IOIBUF_X47_Y34_N22
\ins[3]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ins(3),
	o => \ins[3]~input_o\);

-- Location: IOIBUF_X43_Y0_N22
\ins[2]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ins(2),
	o => \ins[2]~input_o\);

-- Location: LCCOMB_X44_Y29_N0
\Add0~5\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~5_combout\ = (!\ins[3]~input_o\ & ((\ins[2]~input_o\ & (\Mux7~0_combout\)) # (!\ins[2]~input_o\ & ((\Add0~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~0_combout\,
	datab => \Add0~3_combout\,
	datac => \ins[3]~input_o\,
	datad => \ins[2]~input_o\,
	combout => \Add0~5_combout\);

-- Location: FF_X44_Y29_N1
\output[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[0]~reg0_q\);

-- Location: IOIBUF_X51_Y34_N22
\op2[1]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op2(1),
	o => \op2[1]~input_o\);

-- Location: LCCOMB_X43_Y29_N26
\Add0~6\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = \ins[0]~input_o\ $ (((!\ins[1]~input_o\ & \op2[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[1]~input_o\,
	datac => \ins[0]~input_o\,
	datad => \op2[1]~input_o\,
	combout => \Add0~6_combout\);

-- Location: IOIBUF_X40_Y34_N1
\op1[1]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op1(1),
	o => \op1[1]~input_o\);

-- Location: LCCOMB_X43_Y29_N8
\Add0~7\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~7_combout\ = ((\Add0~6_combout\ $ (\op1[1]~input_o\ $ (!\Add0~4\)))) # (GND)
-- \Add0~8\ = CARRY((\Add0~6_combout\ & ((\op1[1]~input_o\) # (!\Add0~4\))) # (!\Add0~6_combout\ & (\op1[1]~input_o\ & !\Add0~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~6_combout\,
	datab => \op1[1]~input_o\,
	datad => VCC,
	cin => \Add0~4\,
	combout => \Add0~7_combout\,
	cout => \Add0~8\);

-- Location: LCCOMB_X43_Y29_N24
\Mux6~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\op1[1]~input_o\ & (\ins[1]~input_o\ $ (((\ins[0]~input_o\ & \op2[1]~input_o\))))) # (!\op1[1]~input_o\ & ((\ins[1]~input_o\ & ((\op2[1]~input_o\))) # (!\ins[1]~input_o\ & (!\ins[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101110001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[1]~input_o\,
	datab => \op1[1]~input_o\,
	datac => \ins[0]~input_o\,
	datad => \op2[1]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X43_Y29_N0
\Add0~9\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~9_combout\ = (!\ins[3]~input_o\ & ((\ins[2]~input_o\ & ((\Mux6~0_combout\))) # (!\ins[2]~input_o\ & (\Add0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[2]~input_o\,
	datab => \Add0~7_combout\,
	datac => \ins[3]~input_o\,
	datad => \Mux6~0_combout\,
	combout => \Add0~9_combout\);

-- Location: FF_X43_Y29_N1
\output[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[1]~reg0_q\);

-- Location: IOIBUF_X34_Y34_N15
\op2[2]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op2(2),
	o => \op2[2]~input_o\);

-- Location: LCCOMB_X43_Y29_N22
\Add0~10\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = \ins[0]~input_o\ $ (((\op2[2]~input_o\ & !\ins[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ins[0]~input_o\,
	datac => \op2[2]~input_o\,
	datad => \ins[1]~input_o\,
	combout => \Add0~10_combout\);

-- Location: IOIBUF_X38_Y34_N15
\op1[2]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op1(2),
	o => \op1[2]~input_o\);

-- Location: LCCOMB_X43_Y29_N10
\Add0~11\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~11_combout\ = (\Add0~10_combout\ & ((\op1[2]~input_o\ & (\Add0~8\ & VCC)) # (!\op1[2]~input_o\ & (!\Add0~8\)))) # (!\Add0~10_combout\ & ((\op1[2]~input_o\ & (!\Add0~8\)) # (!\op1[2]~input_o\ & ((\Add0~8\) # (GND)))))
-- \Add0~12\ = CARRY((\Add0~10_combout\ & (!\op1[2]~input_o\ & !\Add0~8\)) # (!\Add0~10_combout\ & ((!\Add0~8\) # (!\op1[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~10_combout\,
	datab => \op1[2]~input_o\,
	datad => VCC,
	cin => \Add0~8\,
	combout => \Add0~11_combout\,
	cout => \Add0~12\);

-- Location: LCCOMB_X43_Y29_N28
\Mux5~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\op1[2]~input_o\ & (\ins[1]~input_o\ $ (((\ins[0]~input_o\ & \op2[2]~input_o\))))) # (!\op1[2]~input_o\ & ((\ins[1]~input_o\ & ((\op2[2]~input_o\))) # (!\ins[1]~input_o\ & (!\ins[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[1]~input_o\,
	datab => \ins[0]~input_o\,
	datac => \op2[2]~input_o\,
	datad => \op1[2]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X43_Y29_N2
\Add0~13\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~13_combout\ = (!\ins[3]~input_o\ & ((\ins[2]~input_o\ & ((\Mux5~0_combout\))) # (!\ins[2]~input_o\ & (\Add0~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[2]~input_o\,
	datab => \Add0~11_combout\,
	datac => \ins[3]~input_o\,
	datad => \Mux5~0_combout\,
	combout => \Add0~13_combout\);

-- Location: FF_X43_Y29_N3
\output[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[2]~reg0_q\);

-- Location: IOIBUF_X51_Y34_N15
\op1[3]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op1(3),
	o => \op1[3]~input_o\);

-- Location: IOIBUF_X53_Y20_N22
\op2[3]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op2(3),
	o => \op2[3]~input_o\);

-- Location: LCCOMB_X44_Y29_N10
\Add0~14\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = \ins[0]~input_o\ $ (((!\ins[1]~input_o\ & \op2[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[1]~input_o\,
	datab => \op2[3]~input_o\,
	datad => \ins[0]~input_o\,
	combout => \Add0~14_combout\);

-- Location: LCCOMB_X43_Y29_N12
\Add0~15\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~15_combout\ = ((\op1[3]~input_o\ $ (\Add0~14_combout\ $ (!\Add0~12\)))) # (GND)
-- \Add0~16\ = CARRY((\op1[3]~input_o\ & ((\Add0~14_combout\) # (!\Add0~12\))) # (!\op1[3]~input_o\ & (\Add0~14_combout\ & !\Add0~12\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \op1[3]~input_o\,
	datab => \Add0~14_combout\,
	datad => VCC,
	cin => \Add0~12\,
	combout => \Add0~15_combout\,
	cout => \Add0~16\);

-- Location: LCCOMB_X44_Y29_N8
\Mux4~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\op1[3]~input_o\ & (\ins[1]~input_o\ $ (((\ins[0]~input_o\ & \op2[3]~input_o\))))) # (!\op1[3]~input_o\ & ((\ins[1]~input_o\ & ((\op2[3]~input_o\))) # (!\ins[1]~input_o\ & (!\ins[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101110001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[1]~input_o\,
	datab => \op1[3]~input_o\,
	datac => \ins[0]~input_o\,
	datad => \op2[3]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X44_Y29_N26
\Add0~17\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~17_combout\ = (!\ins[3]~input_o\ & ((\ins[2]~input_o\ & ((\Mux4~0_combout\))) # (!\ins[2]~input_o\ & (\Add0~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~15_combout\,
	datab => \ins[2]~input_o\,
	datac => \ins[3]~input_o\,
	datad => \Mux4~0_combout\,
	combout => \Add0~17_combout\);

-- Location: FF_X44_Y29_N27
\output[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[3]~reg0_q\);

-- Location: IOIBUF_X43_Y34_N15
\op2[4]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op2(4),
	o => \op2[4]~input_o\);

-- Location: LCCOMB_X43_Y30_N30
\Add0~18\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = \ins[0]~input_o\ $ (((\op2[4]~input_o\ & !\ins[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \op2[4]~input_o\,
	datac => \ins[1]~input_o\,
	datad => \ins[0]~input_o\,
	combout => \Add0~18_combout\);

-- Location: IOIBUF_X40_Y34_N8
\op1[4]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op1(4),
	o => \op1[4]~input_o\);

-- Location: LCCOMB_X43_Y29_N14
\Add0~19\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~19_combout\ = (\Add0~18_combout\ & ((\op1[4]~input_o\ & (\Add0~16\ & VCC)) # (!\op1[4]~input_o\ & (!\Add0~16\)))) # (!\Add0~18_combout\ & ((\op1[4]~input_o\ & (!\Add0~16\)) # (!\op1[4]~input_o\ & ((\Add0~16\) # (GND)))))
-- \Add0~20\ = CARRY((\Add0~18_combout\ & (!\op1[4]~input_o\ & !\Add0~16\)) # (!\Add0~18_combout\ & ((!\Add0~16\) # (!\op1[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~18_combout\,
	datab => \op1[4]~input_o\,
	datad => VCC,
	cin => \Add0~16\,
	combout => \Add0~19_combout\,
	cout => \Add0~20\);

-- Location: LCCOMB_X43_Y30_N4
\Mux3~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\op1[4]~input_o\ & (\ins[1]~input_o\ $ (((\op2[4]~input_o\ & \ins[0]~input_o\))))) # (!\op1[4]~input_o\ & ((\ins[1]~input_o\ & (\op2[4]~input_o\)) # (!\ins[1]~input_o\ & ((!\ins[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100011011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op1[4]~input_o\,
	datab => \ins[1]~input_o\,
	datac => \op2[4]~input_o\,
	datad => \ins[0]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X43_Y29_N30
\Add0~21\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~21_combout\ = (!\ins[3]~input_o\ & ((\ins[2]~input_o\ & ((\Mux3~0_combout\))) # (!\ins[2]~input_o\ & (\Add0~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[2]~input_o\,
	datab => \Add0~19_combout\,
	datac => \ins[3]~input_o\,
	datad => \Mux3~0_combout\,
	combout => \Add0~21_combout\);

-- Location: FF_X43_Y29_N31
\output[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[4]~reg0_q\);

-- Location: IOIBUF_X45_Y34_N8
\op1[5]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op1(5),
	o => \op1[5]~input_o\);

-- Location: IOIBUF_X53_Y26_N22
\op2[5]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op2(5),
	o => \op2[5]~input_o\);

-- Location: LCCOMB_X44_Y29_N16
\Add0~22\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = \ins[0]~input_o\ $ (((\op2[5]~input_o\ & !\ins[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[0]~input_o\,
	datab => \op2[5]~input_o\,
	datad => \ins[1]~input_o\,
	combout => \Add0~22_combout\);

-- Location: LCCOMB_X43_Y29_N16
\Add0~23\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~23_combout\ = ((\op1[5]~input_o\ $ (\Add0~22_combout\ $ (!\Add0~20\)))) # (GND)
-- \Add0~24\ = CARRY((\op1[5]~input_o\ & ((\Add0~22_combout\) # (!\Add0~20\))) # (!\op1[5]~input_o\ & (\Add0~22_combout\ & !\Add0~20\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \op1[5]~input_o\,
	datab => \Add0~22_combout\,
	datad => VCC,
	cin => \Add0~20\,
	combout => \Add0~23_combout\,
	cout => \Add0~24\);

-- Location: LCCOMB_X44_Y29_N12
\Mux2~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\op1[5]~input_o\ & (\ins[1]~input_o\ $ (((\ins[0]~input_o\ & \op2[5]~input_o\))))) # (!\op1[5]~input_o\ & ((\ins[1]~input_o\ & ((\op2[5]~input_o\))) # (!\ins[1]~input_o\ & (!\ins[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110010000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[0]~input_o\,
	datab => \op2[5]~input_o\,
	datac => \op1[5]~input_o\,
	datad => \ins[1]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X44_Y29_N20
\Add0~25\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~25_combout\ = (!\ins[3]~input_o\ & ((\ins[2]~input_o\ & ((\Mux2~0_combout\))) # (!\ins[2]~input_o\ & (\Add0~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~23_combout\,
	datab => \ins[2]~input_o\,
	datac => \ins[3]~input_o\,
	datad => \Mux2~0_combout\,
	combout => \Add0~25_combout\);

-- Location: FF_X44_Y29_N21
\output[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[5]~reg0_q\);

-- Location: IOIBUF_X53_Y25_N1
\op2[6]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op2(6),
	o => \op2[6]~input_o\);

-- Location: LCCOMB_X44_Y29_N24
\Add0~26\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = \ins[0]~input_o\ $ (((\op2[6]~input_o\ & !\ins[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[0]~input_o\,
	datac => \op2[6]~input_o\,
	datad => \ins[1]~input_o\,
	combout => \Add0~26_combout\);

-- Location: IOIBUF_X45_Y34_N1
\op1[6]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op1(6),
	o => \op1[6]~input_o\);

-- Location: LCCOMB_X43_Y29_N18
\Add0~27\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~27_combout\ = (\Add0~26_combout\ & ((\op1[6]~input_o\ & (\Add0~24\ & VCC)) # (!\op1[6]~input_o\ & (!\Add0~24\)))) # (!\Add0~26_combout\ & ((\op1[6]~input_o\ & (!\Add0~24\)) # (!\op1[6]~input_o\ & ((\Add0~24\) # (GND)))))
-- \Add0~28\ = CARRY((\Add0~26_combout\ & (!\op1[6]~input_o\ & !\Add0~24\)) # (!\Add0~26_combout\ & ((!\Add0~24\) # (!\op1[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~26_combout\,
	datab => \op1[6]~input_o\,
	datad => VCC,
	cin => \Add0~24\,
	combout => \Add0~27_combout\,
	cout => \Add0~28\);

-- Location: LCCOMB_X44_Y29_N22
\Mux1~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\op1[6]~input_o\ & (\ins[1]~input_o\ $ (((\ins[0]~input_o\ & \op2[6]~input_o\))))) # (!\op1[6]~input_o\ & ((\ins[1]~input_o\ & ((\op2[6]~input_o\))) # (!\ins[1]~input_o\ & (!\ins[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110010010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[0]~input_o\,
	datab => \op1[6]~input_o\,
	datac => \op2[6]~input_o\,
	datad => \ins[1]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X44_Y29_N6
\Add0~29\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~29_combout\ = (!\ins[3]~input_o\ & ((\ins[2]~input_o\ & ((\Mux1~0_combout\))) # (!\ins[2]~input_o\ & (\Add0~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[3]~input_o\,
	datab => \Add0~27_combout\,
	datac => \Mux1~0_combout\,
	datad => \ins[2]~input_o\,
	combout => \Add0~29_combout\);

-- Location: FF_X44_Y29_N7
\output[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[6]~reg0_q\);

-- Location: IOIBUF_X43_Y34_N22
\op2[7]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op2(7),
	o => \op2[7]~input_o\);

-- Location: IOIBUF_X49_Y34_N1
\op1[7]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op1(7),
	o => \op1[7]~input_o\);

-- Location: LCCOMB_X43_Y30_N16
\Mux0~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\op1[7]~input_o\ & (\ins[1]~input_o\ $ (((\op2[7]~input_o\ & \ins[0]~input_o\))))) # (!\op1[7]~input_o\ & ((\ins[1]~input_o\ & (\op2[7]~input_o\)) # (!\ins[1]~input_o\ & ((!\ins[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100010100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op2[7]~input_o\,
	datab => \ins[0]~input_o\,
	datac => \ins[1]~input_o\,
	datad => \op1[7]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X43_Y30_N18
\Add0~30\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = \ins[0]~input_o\ $ (((\op2[7]~input_o\ & !\ins[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011011000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op2[7]~input_o\,
	datab => \ins[0]~input_o\,
	datac => \ins[1]~input_o\,
	combout => \Add0~30_combout\);

-- Location: LCCOMB_X43_Y29_N20
\Add0~31\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~31_combout\ = \op1[7]~input_o\ $ (\Add0~30_combout\ $ (!\Add0~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \op1[7]~input_o\,
	datab => \Add0~30_combout\,
	cin => \Add0~28\,
	combout => \Add0~31_combout\);

-- Location: LCCOMB_X44_Y29_N4
\Add0~33\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Add0~33_combout\ = (!\ins[3]~input_o\ & ((\ins[2]~input_o\ & (\Mux0~0_combout\)) # (!\ins[2]~input_o\ & ((\Add0~31_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ins[3]~input_o\,
	datab => \ins[2]~input_o\,
	datac => \Mux0~0_combout\,
	datad => \Add0~31_combout\,
	combout => \Add0~33_combout\);

-- Location: FF_X44_Y29_N17
\output[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add0~33_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[7]~reg0_q\);

-- Location: LCCOMB_X44_Y29_N28
\Equal0~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!\Add0~29_combout\ & (!\Add0~21_combout\ & (!\Add0~33_combout\ & !\Add0~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~29_combout\,
	datab => \Add0~21_combout\,
	datac => \Add0~33_combout\,
	datad => \Add0~25_combout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X44_Y29_N18
\Equal0~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\Add0~9_combout\ & (!\Add0~13_combout\ & (!\Add0~17_combout\ & !\Add0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~9_combout\,
	datab => \Add0~13_combout\,
	datac => \Add0~17_combout\,
	datad => \Add0~5_combout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X44_Y29_N2
\temp_flags[5]~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \temp_flags[5]~0_combout\ = \Add0~33_combout\ $ (((!\Equal0~0_combout\) # (!\Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~1_combout\,
	datac => \Add0~33_combout\,
	datad => \Equal0~0_combout\,
	combout => \temp_flags[5]~0_combout\);

-- Location: FF_X44_Y29_N3
\flags[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp_flags[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \flags[5]~reg0_q\);

-- Location: FF_X44_Y29_N5
\flags[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \flags[6]~reg0_q\);

-- Location: LCCOMB_X44_Y29_N14
\Equal0~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (\Equal0~1_combout\ & \Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal0~2_combout\);

-- Location: FF_X44_Y29_N15
\flags[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \flags[7]~reg0_q\);

-- Location: IOIBUF_X25_Y34_N15
\reset~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

ww_output(0) <= \output[0]~output_o\;

ww_output(1) <= \output[1]~output_o\;

ww_output(2) <= \output[2]~output_o\;

ww_output(3) <= \output[3]~output_o\;

ww_output(4) <= \output[4]~output_o\;

ww_output(5) <= \output[5]~output_o\;

ww_output(6) <= \output[6]~output_o\;

ww_output(7) <= \output[7]~output_o\;

ww_flags(0) <= \flags[0]~output_o\;

ww_flags(1) <= \flags[1]~output_o\;

ww_flags(2) <= \flags[2]~output_o\;

ww_flags(3) <= \flags[3]~output_o\;

ww_flags(4) <= \flags[4]~output_o\;

ww_flags(5) <= \flags[5]~output_o\;

ww_flags(6) <= \flags[6]~output_o\;

ww_flags(7) <= \flags[7]~output_o\;
END structure;


