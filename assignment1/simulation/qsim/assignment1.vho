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

-- DATE "11/09/2023 22:49:18"

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

ENTITY 	Encoder IS
    PORT (
	clk : IN std_logic;
	sIn : IN std_logic;
	nGRst : IN std_logic;
	dOut : OUT std_logic_vector(7 DOWNTO 0);
	cont : OUT std_logic_vector(2 DOWNTO 0);
	statO : OUT std_logic_vector(5 DOWNTO 0)
	);
END Encoder;

ARCHITECTURE structure OF Encoder IS
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
SIGNAL ww_sIn : std_logic;
SIGNAL ww_nGRst : std_logic;
SIGNAL ww_dOut : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_cont : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_statO : std_logic_vector(5 DOWNTO 0);
SIGNAL \dOut[0]~output_o\ : std_logic;
SIGNAL \dOut[1]~output_o\ : std_logic;
SIGNAL \dOut[2]~output_o\ : std_logic;
SIGNAL \dOut[3]~output_o\ : std_logic;
SIGNAL \dOut[4]~output_o\ : std_logic;
SIGNAL \dOut[5]~output_o\ : std_logic;
SIGNAL \dOut[6]~output_o\ : std_logic;
SIGNAL \dOut[7]~output_o\ : std_logic;
SIGNAL \cont[0]~output_o\ : std_logic;
SIGNAL \cont[1]~output_o\ : std_logic;
SIGNAL \cont[2]~output_o\ : std_logic;
SIGNAL \statO[0]~output_o\ : std_logic;
SIGNAL \statO[1]~output_o\ : std_logic;
SIGNAL \statO[2]~output_o\ : std_logic;
SIGNAL \statO[3]~output_o\ : std_logic;
SIGNAL \statO[4]~output_o\ : std_logic;
SIGNAL \statO[5]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \bc|ff0|Q~0_combout\ : std_logic;
SIGNAL \bc|ff1|Q~0_combout\ : std_logic;
SIGNAL \bc|ff1|Q~q\ : std_logic;
SIGNAL \bc|ff2|Q~0_combout\ : std_logic;
SIGNAL \bc|ff2|Q~q\ : std_logic;
SIGNAL \bc|ff3|Q~0_combout\ : std_logic;
SIGNAL \bc|ff3|Q~q\ : std_logic;
SIGNAL \bc|ff4|Q~0_combout\ : std_logic;
SIGNAL \bc|ff4|Q~q\ : std_logic;
SIGNAL \con|nad2|y~0_combout\ : std_logic;
SIGNAL \nGRst~input_o\ : std_logic;
SIGNAL \con|nad2|y~1_combout\ : std_logic;
SIGNAL \bc|ff0|Q~q\ : std_logic;
SIGNAL \bc|ff5|Q~0_combout\ : std_logic;
SIGNAL \bc|ff5|Q~q\ : std_logic;
SIGNAL \con|nord|y~0_combout\ : std_logic;
SIGNAL \sIn~input_o\ : std_logic;
SIGNAL \sr|ff0|ff|Q~q\ : std_logic;
SIGNAL \sr|ff1|ff|Q~q\ : std_logic;
SIGNAL \sr|ff2|ff|Q~q\ : std_logic;
SIGNAL \sr|ff3|ff|Q~q\ : std_logic;
SIGNAL \sr|ff4|ff|Q~q\ : std_logic;
SIGNAL \sr|ff5|ff|Q~q\ : std_logic;
SIGNAL \sr|ff6|ff|Q~q\ : std_logic;
SIGNAL \sr|ff7|ff|Q~q\ : std_logic;
SIGNAL \bb1|xor4|y~combout\ : std_logic;
SIGNAL \con|nad4|y~0_combout\ : std_logic;
SIGNAL \pr8|ff0|Q~q\ : std_logic;
SIGNAL \bb1|xor3|y~combout\ : std_logic;
SIGNAL \pr8|ff1|Q~q\ : std_logic;
SIGNAL \bb1|xor2|y~combout\ : std_logic;
SIGNAL \pr8|ff2|Q~q\ : std_logic;
SIGNAL \pr8|ff3|Q~0_combout\ : std_logic;
SIGNAL \pr8|ff3|Q~q\ : std_logic;
SIGNAL \pr8|ff4|Q~0_combout\ : std_logic;
SIGNAL \pr8|ff4|Q~q\ : std_logic;
SIGNAL \bb1|xor1|y~combout\ : std_logic;
SIGNAL \pr8|ff5|Q~q\ : std_logic;
SIGNAL \pr8|ff6|Q~0_combout\ : std_logic;
SIGNAL \pr8|ff6|Q~q\ : std_logic;
SIGNAL \bb1|xor0|y~combout\ : std_logic;
SIGNAL \pr8|ff7|Q~q\ : std_logic;
SIGNAL \ALT_INV_sIn~input_o\ : std_logic;
SIGNAL \ALT_INV_nGRst~input_o\ : std_logic;
SIGNAL \ALT_INV_clk~input_o\ : std_logic;
SIGNAL \pr8|ff0|ALT_INV_Q~q\ : std_logic;
SIGNAL \pr8|ff2|ALT_INV_Q~q\ : std_logic;
SIGNAL \pr8|ff1|ALT_INV_Q~q\ : std_logic;
SIGNAL \pr8|ff3|ALT_INV_Q~q\ : std_logic;
SIGNAL \pr8|ff4|ALT_INV_Q~q\ : std_logic;
SIGNAL \pr8|ff5|ALT_INV_Q~q\ : std_logic;
SIGNAL \pr8|ff6|ALT_INV_Q~q\ : std_logic;
SIGNAL \pr8|ff7|ALT_INV_Q~q\ : std_logic;
SIGNAL \bc|ff5|ALT_INV_Q~q\ : std_logic;
SIGNAL \bc|ff0|ALT_INV_Q~q\ : std_logic;
SIGNAL \bc|ff1|ALT_INV_Q~q\ : std_logic;
SIGNAL \bc|ff2|ALT_INV_Q~q\ : std_logic;
SIGNAL \bc|ff3|ALT_INV_Q~q\ : std_logic;
SIGNAL \con|nad2|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \bc|ff4|ALT_INV_Q~q\ : std_logic;
SIGNAL \con|nad2|ALT_INV_y~1_combout\ : std_logic;
SIGNAL \con|nad4|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \sr|ff7|ff|ALT_INV_Q~q\ : std_logic;
SIGNAL \sr|ff0|ff|ALT_INV_Q~q\ : std_logic;
SIGNAL \sr|ff1|ff|ALT_INV_Q~q\ : std_logic;
SIGNAL \sr|ff2|ff|ALT_INV_Q~q\ : std_logic;
SIGNAL \sr|ff4|ff|ALT_INV_Q~q\ : std_logic;
SIGNAL \sr|ff3|ff|ALT_INV_Q~q\ : std_logic;
SIGNAL \sr|ff5|ff|ALT_INV_Q~q\ : std_logic;
SIGNAL \sr|ff6|ff|ALT_INV_Q~q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_sIn <= sIn;
ww_nGRst <= nGRst;
dOut <= ww_dOut;
cont <= ww_cont;
statO <= ww_statO;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_sIn~input_o\ <= NOT \sIn~input_o\;
\ALT_INV_nGRst~input_o\ <= NOT \nGRst~input_o\;
\ALT_INV_clk~input_o\ <= NOT \clk~input_o\;
\pr8|ff0|ALT_INV_Q~q\ <= NOT \pr8|ff0|Q~q\;
\pr8|ff2|ALT_INV_Q~q\ <= NOT \pr8|ff2|Q~q\;
\pr8|ff1|ALT_INV_Q~q\ <= NOT \pr8|ff1|Q~q\;
\pr8|ff3|ALT_INV_Q~q\ <= NOT \pr8|ff3|Q~q\;
\pr8|ff4|ALT_INV_Q~q\ <= NOT \pr8|ff4|Q~q\;
\pr8|ff5|ALT_INV_Q~q\ <= NOT \pr8|ff5|Q~q\;
\pr8|ff6|ALT_INV_Q~q\ <= NOT \pr8|ff6|Q~q\;
\pr8|ff7|ALT_INV_Q~q\ <= NOT \pr8|ff7|Q~q\;
\bc|ff5|ALT_INV_Q~q\ <= NOT \bc|ff5|Q~q\;
\bc|ff0|ALT_INV_Q~q\ <= NOT \bc|ff0|Q~q\;
\bc|ff1|ALT_INV_Q~q\ <= NOT \bc|ff1|Q~q\;
\bc|ff2|ALT_INV_Q~q\ <= NOT \bc|ff2|Q~q\;
\bc|ff3|ALT_INV_Q~q\ <= NOT \bc|ff3|Q~q\;
\con|nad2|ALT_INV_y~0_combout\ <= NOT \con|nad2|y~0_combout\;
\bc|ff4|ALT_INV_Q~q\ <= NOT \bc|ff4|Q~q\;
\con|nad2|ALT_INV_y~1_combout\ <= NOT \con|nad2|y~1_combout\;
\con|nad4|ALT_INV_y~0_combout\ <= NOT \con|nad4|y~0_combout\;
\sr|ff7|ff|ALT_INV_Q~q\ <= NOT \sr|ff7|ff|Q~q\;
\sr|ff0|ff|ALT_INV_Q~q\ <= NOT \sr|ff0|ff|Q~q\;
\sr|ff1|ff|ALT_INV_Q~q\ <= NOT \sr|ff1|ff|Q~q\;
\sr|ff2|ff|ALT_INV_Q~q\ <= NOT \sr|ff2|ff|Q~q\;
\sr|ff4|ff|ALT_INV_Q~q\ <= NOT \sr|ff4|ff|Q~q\;
\sr|ff3|ff|ALT_INV_Q~q\ <= NOT \sr|ff3|ff|Q~q\;
\sr|ff5|ff|ALT_INV_Q~q\ <= NOT \sr|ff5|ff|Q~q\;
\sr|ff6|ff|ALT_INV_Q~q\ <= NOT \sr|ff6|ff|Q~q\;

\dOut[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pr8|ff0|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \dOut[0]~output_o\);

\dOut[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pr8|ff1|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \dOut[1]~output_o\);

\dOut[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pr8|ff2|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \dOut[2]~output_o\);

\dOut[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pr8|ff3|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \dOut[3]~output_o\);

\dOut[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pr8|ff4|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \dOut[4]~output_o\);

\dOut[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pr8|ff5|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \dOut[5]~output_o\);

\dOut[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pr8|ff6|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \dOut[6]~output_o\);

\dOut[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pr8|ff7|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \dOut[7]~output_o\);

\cont[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \con|nad2|ALT_INV_y~1_combout\,
	devoe => ww_devoe,
	o => \cont[0]~output_o\);

\cont[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \con|nad4|ALT_INV_y~0_combout\,
	devoe => ww_devoe,
	o => \cont[1]~output_o\);

\cont[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \con|nord|y~0_combout\,
	devoe => ww_devoe,
	o => \cont[2]~output_o\);

\statO[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \bc|ff0|Q~q\,
	devoe => ww_devoe,
	o => \statO[0]~output_o\);

\statO[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \bc|ff1|Q~q\,
	devoe => ww_devoe,
	o => \statO[1]~output_o\);

\statO[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \bc|ff2|Q~q\,
	devoe => ww_devoe,
	o => \statO[2]~output_o\);

\statO[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \bc|ff3|Q~q\,
	devoe => ww_devoe,
	o => \statO[3]~output_o\);

\statO[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \bc|ff4|Q~q\,
	devoe => ww_devoe,
	o => \statO[4]~output_o\);

\statO[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \bc|ff5|Q~q\,
	devoe => ww_devoe,
	o => \statO[5]~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\bc|ff0|Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bc|ff0|Q~0_combout\ = !\bc|ff0|Q~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bc|ff0|ALT_INV_Q~q\,
	combout => \bc|ff0|Q~0_combout\);

\bc|ff1|Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bc|ff1|Q~0_combout\ = !\bc|ff0|Q~q\ $ (!\bc|ff1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bc|ff0|ALT_INV_Q~q\,
	datab => \bc|ff1|ALT_INV_Q~q\,
	combout => \bc|ff1|Q~0_combout\);

\bc|ff1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bc|ff1|Q~0_combout\,
	clrn => \con|nad2|ALT_INV_y~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|ff1|Q~q\);

\bc|ff2|Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bc|ff2|Q~0_combout\ = !\bc|ff2|Q~q\ $ (((!\bc|ff0|Q~q\) # (!\bc|ff1|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111000011110000111100001111000011110000111100001111000011110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bc|ff0|ALT_INV_Q~q\,
	datab => \bc|ff1|ALT_INV_Q~q\,
	datac => \bc|ff2|ALT_INV_Q~q\,
	combout => \bc|ff2|Q~0_combout\);

\bc|ff2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bc|ff2|Q~0_combout\,
	clrn => \con|nad2|ALT_INV_y~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|ff2|Q~q\);

\bc|ff3|Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bc|ff3|Q~0_combout\ = !\bc|ff3|Q~q\ $ (((!\bc|ff0|Q~q\) # ((!\bc|ff1|Q~q\) # (!\bc|ff2|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111110000000011111111000000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bc|ff0|ALT_INV_Q~q\,
	datab => \bc|ff1|ALT_INV_Q~q\,
	datac => \bc|ff2|ALT_INV_Q~q\,
	datad => \bc|ff3|ALT_INV_Q~q\,
	combout => \bc|ff3|Q~0_combout\);

\bc|ff3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bc|ff3|Q~0_combout\,
	clrn => \con|nad2|ALT_INV_y~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|ff3|Q~q\);

\bc|ff4|Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bc|ff4|Q~0_combout\ = ( \bc|ff4|Q~q\ & ( (!\bc|ff0|Q~q\) # ((!\bc|ff1|Q~q\) # ((!\bc|ff2|Q~q\) # (!\bc|ff3|Q~q\))) ) ) # ( !\bc|ff4|Q~q\ & ( (\bc|ff0|Q~q\ & (\bc|ff1|Q~q\ & (\bc|ff2|Q~q\ & \bc|ff3|Q~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001111111111111111000000000000000011111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bc|ff0|ALT_INV_Q~q\,
	datab => \bc|ff1|ALT_INV_Q~q\,
	datac => \bc|ff2|ALT_INV_Q~q\,
	datad => \bc|ff3|ALT_INV_Q~q\,
	datae => \bc|ff4|ALT_INV_Q~q\,
	combout => \bc|ff4|Q~0_combout\);

\bc|ff4|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bc|ff4|Q~0_combout\,
	clrn => \con|nad2|ALT_INV_y~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|ff4|Q~q\);

\con|nad2|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \con|nad2|y~0_combout\ = (!\bc|ff1|Q~q\ & (!\bc|ff2|Q~q\ & (!\bc|ff3|Q~q\ & !\bc|ff4|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bc|ff1|ALT_INV_Q~q\,
	datab => \bc|ff2|ALT_INV_Q~q\,
	datac => \bc|ff3|ALT_INV_Q~q\,
	datad => \bc|ff4|ALT_INV_Q~q\,
	combout => \con|nad2|y~0_combout\);

\nGRst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_nGRst,
	o => \nGRst~input_o\);

\con|nad2|y~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \con|nad2|y~1_combout\ = ( \nGRst~input_o\ & ( (\bc|ff5|Q~q\ & (\clk~input_o\ & (\bc|ff0|Q~q\ & \con|nad2|y~0_combout\))) ) ) # ( !\nGRst~input_o\ & ( \clk~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000000000000000100110011001100110000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bc|ff5|ALT_INV_Q~q\,
	datab => \ALT_INV_clk~input_o\,
	datac => \bc|ff0|ALT_INV_Q~q\,
	datad => \con|nad2|ALT_INV_y~0_combout\,
	datae => \ALT_INV_nGRst~input_o\,
	combout => \con|nad2|y~1_combout\);

\bc|ff0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bc|ff0|Q~0_combout\,
	clrn => \con|nad2|ALT_INV_y~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|ff0|Q~q\);

\bc|ff5|Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bc|ff5|Q~0_combout\ = ( \bc|ff3|Q~q\ & ( \bc|ff4|Q~q\ & ( !\bc|ff5|Q~q\ $ (((!\bc|ff0|Q~q\) # ((!\bc|ff1|Q~q\) # (!\bc|ff2|Q~q\)))) ) ) ) # ( !\bc|ff3|Q~q\ & ( \bc|ff4|Q~q\ & ( \bc|ff5|Q~q\ ) ) ) # ( \bc|ff3|Q~q\ & ( !\bc|ff4|Q~q\ & ( \bc|ff5|Q~q\ ) ) ) 
-- # ( !\bc|ff3|Q~q\ & ( !\bc|ff4|Q~q\ & ( \bc|ff5|Q~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bc|ff5|ALT_INV_Q~q\,
	datab => \bc|ff0|ALT_INV_Q~q\,
	datac => \bc|ff1|ALT_INV_Q~q\,
	datad => \bc|ff2|ALT_INV_Q~q\,
	datae => \bc|ff3|ALT_INV_Q~q\,
	dataf => \bc|ff4|ALT_INV_Q~q\,
	combout => \bc|ff5|Q~0_combout\);

\bc|ff5|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bc|ff5|Q~0_combout\,
	clrn => \con|nad2|ALT_INV_y~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|ff5|Q~q\);

\con|nord|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \con|nord|y~0_combout\ = LCELL((\bc|ff5|Q~q\ & (!\clk~input_o\ & (!\bc|ff0|Q~q\ & \con|nad2|y~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000000000010000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bc|ff5|ALT_INV_Q~q\,
	datab => \ALT_INV_clk~input_o\,
	datac => \bc|ff0|ALT_INV_Q~q\,
	datad => \con|nad2|ALT_INV_y~0_combout\,
	combout => \con|nord|y~0_combout\);

\sIn~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sIn,
	o => \sIn~input_o\);

\sr|ff0|ff|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \sIn~input_o\,
	clrn => \nGRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sr|ff0|ff|Q~q\);

\sr|ff1|ff|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \sr|ff0|ff|Q~q\,
	clrn => \nGRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sr|ff1|ff|Q~q\);

\sr|ff2|ff|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \sr|ff1|ff|Q~q\,
	clrn => \nGRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sr|ff2|ff|Q~q\);

\sr|ff3|ff|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \sr|ff2|ff|Q~q\,
	clrn => \nGRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sr|ff3|ff|Q~q\);

\sr|ff4|ff|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \sr|ff3|ff|Q~q\,
	clrn => \nGRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sr|ff4|ff|Q~q\);

\sr|ff5|ff|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \sr|ff4|ff|Q~q\,
	clrn => \nGRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sr|ff5|ff|Q~q\);

\sr|ff6|ff|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \sr|ff5|ff|Q~q\,
	clrn => \nGRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sr|ff6|ff|Q~q\);

\sr|ff7|ff|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \sr|ff6|ff|Q~q\,
	clrn => \nGRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sr|ff7|ff|Q~q\);

\bb1|xor4|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \bb1|xor4|y~combout\ = !\sIn~input_o\ $ (\sr|ff7|ff|Q~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001100110011001100110011001100110011001100110011001100110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_sIn~input_o\,
	datab => \sr|ff7|ff|ALT_INV_Q~q\,
	combout => \bb1|xor4|y~combout\);

\con|nad4|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \con|nad4|y~0_combout\ = ( \nGRst~input_o\ & ( (!\bc|ff5|Q~q\ & (\clk~input_o\ & (\bc|ff0|Q~q\ & \con|nad2|y~0_combout\))) ) ) # ( !\nGRst~input_o\ & ( \clk~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000000000000001000110011001100110000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bc|ff5|ALT_INV_Q~q\,
	datab => \ALT_INV_clk~input_o\,
	datac => \bc|ff0|ALT_INV_Q~q\,
	datad => \con|nad2|ALT_INV_y~0_combout\,
	datae => \ALT_INV_nGRst~input_o\,
	combout => \con|nad4|y~0_combout\);

\pr8|ff0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \con|nord|y~0_combout\,
	d => \bb1|xor4|y~combout\,
	clrn => \con|nad4|ALT_INV_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr8|ff0|Q~q\);

\bb1|xor3|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \bb1|xor3|y~combout\ = !\sr|ff7|ff|Q~q\ $ (\sr|ff0|ff|Q~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001100110011001100110011001100110011001100110011001100110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sr|ff7|ff|ALT_INV_Q~q\,
	datab => \sr|ff0|ff|ALT_INV_Q~q\,
	combout => \bb1|xor3|y~combout\);

\pr8|ff1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \con|nord|y~0_combout\,
	d => \bb1|xor3|y~combout\,
	clrn => \con|nad4|ALT_INV_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr8|ff1|Q~q\);

\bb1|xor2|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \bb1|xor2|y~combout\ = !\sr|ff7|ff|Q~q\ $ (\sr|ff1|ff|Q~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001100110011001100110011001100110011001100110011001100110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sr|ff7|ff|ALT_INV_Q~q\,
	datab => \sr|ff1|ff|ALT_INV_Q~q\,
	combout => \bb1|xor2|y~combout\);

\pr8|ff2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \con|nord|y~0_combout\,
	d => \bb1|xor2|y~combout\,
	clrn => \con|nad4|ALT_INV_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr8|ff2|Q~q\);

\pr8|ff3|Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pr8|ff3|Q~0_combout\ = !\sr|ff2|ff|Q~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sr|ff2|ff|ALT_INV_Q~q\,
	combout => \pr8|ff3|Q~0_combout\);

\pr8|ff3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \con|nord|y~0_combout\,
	d => \pr8|ff3|Q~0_combout\,
	clrn => \con|nad4|ALT_INV_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr8|ff3|Q~q\);

\pr8|ff4|Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pr8|ff4|Q~0_combout\ = !\sr|ff3|ff|Q~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sr|ff3|ff|ALT_INV_Q~q\,
	combout => \pr8|ff4|Q~0_combout\);

\pr8|ff4|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \con|nord|y~0_combout\,
	d => \pr8|ff4|Q~0_combout\,
	clrn => \con|nad4|ALT_INV_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr8|ff4|Q~q\);

\bb1|xor1|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \bb1|xor1|y~combout\ = !\sr|ff7|ff|Q~q\ $ (\sr|ff4|ff|Q~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001100110011001100110011001100110011001100110011001100110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sr|ff7|ff|ALT_INV_Q~q\,
	datab => \sr|ff4|ff|ALT_INV_Q~q\,
	combout => \bb1|xor1|y~combout\);

\pr8|ff5|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \con|nord|y~0_combout\,
	d => \bb1|xor1|y~combout\,
	clrn => \con|nad4|ALT_INV_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr8|ff5|Q~q\);

\pr8|ff6|Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pr8|ff6|Q~0_combout\ = !\sr|ff5|ff|Q~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sr|ff5|ff|ALT_INV_Q~q\,
	combout => \pr8|ff6|Q~0_combout\);

\pr8|ff6|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \con|nord|y~0_combout\,
	d => \pr8|ff6|Q~0_combout\,
	clrn => \con|nad4|ALT_INV_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr8|ff6|Q~q\);

\bb1|xor0|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \bb1|xor0|y~combout\ = !\sr|ff7|ff|Q~q\ $ (\sr|ff6|ff|Q~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001100110011001100110011001100110011001100110011001100110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sr|ff7|ff|ALT_INV_Q~q\,
	datab => \sr|ff6|ff|ALT_INV_Q~q\,
	combout => \bb1|xor0|y~combout\);

\pr8|ff7|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \con|nord|y~0_combout\,
	d => \bb1|xor0|y~combout\,
	clrn => \con|nad4|ALT_INV_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr8|ff7|Q~q\);

ww_dOut(0) <= \dOut[0]~output_o\;

ww_dOut(1) <= \dOut[1]~output_o\;

ww_dOut(2) <= \dOut[2]~output_o\;

ww_dOut(3) <= \dOut[3]~output_o\;

ww_dOut(4) <= \dOut[4]~output_o\;

ww_dOut(5) <= \dOut[5]~output_o\;

ww_dOut(6) <= \dOut[6]~output_o\;

ww_dOut(7) <= \dOut[7]~output_o\;

ww_cont(0) <= \cont[0]~output_o\;

ww_cont(1) <= \cont[1]~output_o\;

ww_cont(2) <= \cont[2]~output_o\;

ww_statO(0) <= \statO[0]~output_o\;

ww_statO(1) <= \statO[1]~output_o\;

ww_statO(2) <= \statO[2]~output_o\;

ww_statO(3) <= \statO[3]~output_o\;

ww_statO(4) <= \statO[4]~output_o\;

ww_statO(5) <= \statO[5]~output_o\;
END structure;


