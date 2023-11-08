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

-- DATE "11/08/2023 16:47:45"

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
	nSet : IN std_logic;
	nRst : IN std_logic;
	A : IN std_logic;
	B : IN std_logic;
	Y : OUT std_logic
	);
END shiftRegister;

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
SIGNAL ww_nSet : std_logic;
SIGNAL ww_nRst : std_logic;
SIGNAL ww_A : std_logic;
SIGNAL ww_B : std_logic;
SIGNAL ww_Y : std_logic;
SIGNAL \Y~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \B~input_o\ : std_logic;
SIGNAL \A~input_o\ : std_logic;
SIGNAL \load~input_o\ : std_logic;
SIGNAL \nSet~input_o\ : std_logic;
SIGNAL \nRst~input_o\ : std_logic;
SIGNAL \ff|Q~1_combout\ : std_logic;
SIGNAL \ff|Q~3_combout\ : std_logic;
SIGNAL \ff|Q~0_combout\ : std_logic;
SIGNAL \ff|Q~_emulated_q\ : std_logic;
SIGNAL \ff|Q~2_combout\ : std_logic;
SIGNAL \ff|ALT_INV_Q~_emulated_q\ : std_logic;
SIGNAL \ff|ALT_INV_Q~0_combout\ : std_logic;
SIGNAL \ff|ALT_INV_Q~1_combout\ : std_logic;
SIGNAL \ALT_INV_nSet~input_o\ : std_logic;
SIGNAL \ALT_INV_nRst~input_o\ : std_logic;
SIGNAL \ALT_INV_B~input_o\ : std_logic;
SIGNAL \ALT_INV_A~input_o\ : std_logic;
SIGNAL \ALT_INV_load~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_load <= load;
ww_nSet <= nSet;
ww_nRst <= nRst;
ww_A <= A;
ww_B <= B;
Y <= ww_Y;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ff|ALT_INV_Q~_emulated_q\ <= NOT \ff|Q~_emulated_q\;
\ff|ALT_INV_Q~0_combout\ <= NOT \ff|Q~0_combout\;
\ff|ALT_INV_Q~1_combout\ <= NOT \ff|Q~1_combout\;
\ALT_INV_nSet~input_o\ <= NOT \nSet~input_o\;
\ALT_INV_nRst~input_o\ <= NOT \nRst~input_o\;
\ALT_INV_B~input_o\ <= NOT \B~input_o\;
\ALT_INV_A~input_o\ <= NOT \A~input_o\;
\ALT_INV_load~input_o\ <= NOT \load~input_o\;

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
	o => \Y~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\B~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B,
	o => \B~input_o\);

\A~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A,
	o => \A~input_o\);

\load~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_load,
	o => \load~input_o\);

\nSet~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_nSet,
	o => \nSet~input_o\);

\nRst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_nRst,
	o => \nRst~input_o\);

\ff|Q~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ff|Q~1_combout\ = ( \nSet~input_o\ & ( \nRst~input_o\ & ( \ff|Q~1_combout\ ) ) ) # ( !\nSet~input_o\ & ( \nRst~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ff|ALT_INV_Q~1_combout\,
	datae => \ALT_INV_nSet~input_o\,
	dataf => \ALT_INV_nRst~input_o\,
	combout => \ff|Q~1_combout\);

\ff|Q~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ff|Q~3_combout\ = !\ff|Q~1_combout\ $ (((!\load~input_o\) # ((!\B~input_o\ & !\A~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011111111000000001111111100000000111111110000000011111111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B~input_o\,
	datab => \ALT_INV_A~input_o\,
	datac => \ALT_INV_load~input_o\,
	datad => \ff|ALT_INV_Q~1_combout\,
	combout => \ff|Q~3_combout\);

\ff|Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ff|Q~0_combout\ = (!\nRst~input_o\) # (!\nSet~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111011101110111011101110111011101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_nRst~input_o\,
	datab => \ALT_INV_nSet~input_o\,
	combout => \ff|Q~0_combout\);

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

\ff|Q~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ff|Q~2_combout\ = (\nRst~input_o\ & ((!\nSet~input_o\) # (!\ff|Q~_emulated_q\ $ (!\ff|Q~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110110000000001111011000000000111101100000000011110110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ff|ALT_INV_Q~_emulated_q\,
	datab => \ff|ALT_INV_Q~1_combout\,
	datac => \ALT_INV_nSet~input_o\,
	datad => \ALT_INV_nRst~input_o\,
	combout => \ff|Q~2_combout\);

ww_Y <= \Y~output_o\;
END structure;


