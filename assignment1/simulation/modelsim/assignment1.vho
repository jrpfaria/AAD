-- Copyright (C) 2020  Intel Corporation. All rights reserved.
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
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "11/08/2023 16:38:26"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	shiftRegister IS
    PORT (
	clk : IN std_logic;
	load : IN std_logic;
	set : IN std_logic;
	rst : IN std_logic;
	A : IN std_logic;
	B : IN std_logic;
	Y : OUT std_logic
	);
END shiftRegister;

-- Design Ports Information
-- Y	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- set	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF shiftRegister IS
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
SIGNAL ww_load : std_logic;
SIGNAL ww_set : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_A : std_logic;
SIGNAL ww_B : std_logic;
SIGNAL ww_Y : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \set~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \A~input_o\ : std_logic;
SIGNAL \load~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \ff|Q~1_combout\ : std_logic;
SIGNAL \B~input_o\ : std_logic;
SIGNAL \ff|Q~3_combout\ : std_logic;
SIGNAL \ff|Q~0_combout\ : std_logic;
SIGNAL \ff|Q~_emulated_q\ : std_logic;
SIGNAL \ff|Q~2_combout\ : std_logic;
SIGNAL \ff|ALT_INV_Q~_emulated_q\ : std_logic;
SIGNAL \ff|ALT_INV_Q~0_combout\ : std_logic;
SIGNAL \ff|ALT_INV_Q~1_combout\ : std_logic;
SIGNAL \ALT_INV_set~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_B~input_o\ : std_logic;
SIGNAL \ALT_INV_load~input_o\ : std_logic;
SIGNAL \ALT_INV_A~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_load <= load;
ww_set <= set;
ww_rst <= rst;
ww_A <= A;
ww_B <= B;
Y <= ww_Y;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ff|ALT_INV_Q~_emulated_q\ <= NOT \ff|Q~_emulated_q\;
\ff|ALT_INV_Q~0_combout\ <= NOT \ff|Q~0_combout\;
\ff|ALT_INV_Q~1_combout\ <= NOT \ff|Q~1_combout\;
\ALT_INV_set~input_o\ <= NOT \set~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_B~input_o\ <= NOT \B~input_o\;
\ALT_INV_load~input_o\ <= NOT \load~input_o\;
\ALT_INV_A~input_o\ <= NOT \A~input_o\;

-- Location: IOOBUF_X89_Y37_N56
\Y~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ff|Q~2_combout\,
	devoe => ww_devoe,
	o => ww_Y);

-- Location: IOIBUF_X89_Y35_N44
\set~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_set,
	o => \set~input_o\);

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X89_Y36_N55
\A~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A,
	o => \A~input_o\);

-- Location: IOIBUF_X89_Y35_N78
\load~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_load,
	o => \load~input_o\);

-- Location: IOIBUF_X89_Y35_N95
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: LABCELL_X88_Y35_N51
\ff|Q~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ff|Q~1_combout\ = ( \rst~input_o\ & ( \ff|Q~1_combout\ ) ) # ( \rst~input_o\ & ( !\ff|Q~1_combout\ & ( !\set~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_set~input_o\,
	datae => \ALT_INV_rst~input_o\,
	dataf => \ff|ALT_INV_Q~1_combout\,
	combout => \ff|Q~1_combout\);

-- Location: IOIBUF_X89_Y37_N38
\B~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B,
	o => \B~input_o\);

-- Location: LABCELL_X88_Y35_N30
\ff|Q~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ff|Q~3_combout\ = ( \B~input_o\ & ( !\load~input_o\ $ (!\ff|Q~1_combout\) ) ) # ( !\B~input_o\ & ( !\ff|Q~1_combout\ $ (((!\A~input_o\) # (!\load~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111000011110000111100001111000111100001111000011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A~input_o\,
	datab => \ALT_INV_load~input_o\,
	datac => \ff|ALT_INV_Q~1_combout\,
	dataf => \ALT_INV_B~input_o\,
	combout => \ff|Q~3_combout\);

-- Location: LABCELL_X88_Y35_N15
\ff|Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ff|Q~0_combout\ = ( \rst~input_o\ & ( !\set~input_o\ ) ) # ( !\rst~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111101010101010101011111111111111111010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_set~input_o\,
	datae => \ALT_INV_rst~input_o\,
	combout => \ff|Q~0_combout\);

-- Location: FF_X88_Y35_N32
\ff|Q~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ff|Q~3_combout\,
	clrn => \ff|ALT_INV_Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ff|Q~_emulated_q\);

-- Location: LABCELL_X88_Y35_N6
\ff|Q~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ff|Q~2_combout\ = ( \rst~input_o\ & ( (!\set~input_o\) # (!\ff|Q~_emulated_q\ $ (!\ff|Q~1_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101111101011111000000000000000001011111010111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_set~input_o\,
	datab => \ff|ALT_INV_Q~_emulated_q\,
	datac => \ff|ALT_INV_Q~1_combout\,
	datae => \ALT_INV_rst~input_o\,
	combout => \ff|Q~2_combout\);

-- Location: MLABCELL_X21_Y29_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


