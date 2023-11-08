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
-- Generated on "11/08/2023 16:47:43"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          shiftRegister
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY shiftRegister_vhd_vec_tst IS
END shiftRegister_vhd_vec_tst;
ARCHITECTURE shiftRegister_arch OF shiftRegister_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC;
SIGNAL B : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL load : STD_LOGIC;
SIGNAL nRst : STD_LOGIC;
SIGNAL nSet : STD_LOGIC;
SIGNAL Y : STD_LOGIC;
COMPONENT shiftRegister
	PORT (
	A : IN STD_LOGIC;
	B : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	load : IN STD_LOGIC;
	nRst : IN STD_LOGIC;
	nSet : IN STD_LOGIC;
	Y : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : shiftRegister
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	clk => clk,
	load => load,
	nRst => nRst,
	nSet => nSet,
	Y => Y
	);

-- load
t_prcs_load: PROCESS
BEGIN
	load <= '0';
	WAIT FOR 10000 ps;
	load <= '1';
	WAIT FOR 30000 ps;
	load <= '0';
	WAIT FOR 90000 ps;
	load <= '1';
	WAIT FOR 40000 ps;
	load <= '0';
	WAIT FOR 260000 ps;
	load <= '1';
	WAIT FOR 40000 ps;
	load <= '0';
	WAIT FOR 260000 ps;
	load <= '1';
	WAIT FOR 40000 ps;
	load <= '0';
WAIT;
END PROCESS t_prcs_load;

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 16
	LOOP
		clk <= '0';
		WAIT FOR 30000 ps;
		clk <= '1';
		WAIT FOR 30000 ps;
	END LOOP;
	clk <= '0';
	WAIT FOR 30000 ps;
	clk <= '1';
WAIT;
END PROCESS t_prcs_clk;

-- A
t_prcs_A: PROCESS
BEGIN
	A <= '1';
	WAIT FOR 90000 ps;
	A <= '0';
	WAIT FOR 80000 ps;
	A <= '1';
	WAIT FOR 320000 ps;
	A <= '0';
	WAIT FOR 80000 ps;
	A <= '1';
	WAIT FOR 80000 ps;
	A <= '0';
	WAIT FOR 320000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
WAIT;
END PROCESS t_prcs_A;

-- B
t_prcs_B: PROCESS
BEGIN
	B <= '1';
	WAIT FOR 90000 ps;
	B <= '0';
	WAIT FOR 80000 ps;
	B <= '1';
	WAIT FOR 170000 ps;
	B <= '0';
	WAIT FOR 230000 ps;
	B <= '1';
	WAIT FOR 210000 ps;
	B <= '0';
	WAIT FOR 190000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
WAIT;
END PROCESS t_prcs_B;

-- nRst
t_prcs_nRst: PROCESS
BEGIN
	nRst <= '1';
WAIT;
END PROCESS t_prcs_nRst;

-- nSet
t_prcs_nSet: PROCESS
BEGIN
	nSet <= '0';
WAIT;
END PROCESS t_prcs_nSet;
END shiftRegister_arch;
