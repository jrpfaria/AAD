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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/09/2023 22:49:17"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Encoder
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Encoder_vhd_vec_tst IS
END Encoder_vhd_vec_tst;
ARCHITECTURE Encoder_arch OF Encoder_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL cont : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL dOut : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL nGRst : STD_LOGIC;
SIGNAL sIn : STD_LOGIC;
SIGNAL statO : STD_LOGIC_VECTOR(5 DOWNTO 0);
COMPONENT Encoder
	PORT (
	clk : IN STD_LOGIC;
	cont : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	dOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	nGRst : IN STD_LOGIC;
	sIn : IN STD_LOGIC;
	statO : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Encoder
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	cont => cont,
	dOut => dOut,
	nGRst => nGRst,
	sIn => sIn,
	statO => statO
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- nGRst
t_prcs_nGRst: PROCESS
BEGIN
	nGRst <= '0';
	WAIT FOR 10000 ps;
	nGRst <= '1';
WAIT;
END PROCESS t_prcs_nGRst;

-- sIn
t_prcs_sIn: PROCESS
BEGIN
	sIn <= '0';
WAIT;
END PROCESS t_prcs_sIn;
END Encoder_arch;
