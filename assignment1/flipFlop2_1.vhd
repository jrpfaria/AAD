LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;
LIBRARY storeDev;
USE storeDev.all;


ENTITY flipFlop2_1 IS
	PORT (
		clk, sel		: IN STD_LOGIC;
		nSet, nRst	: IN STD_LOGIC;
		A				: IN STD_LOGIC;
		B				: IN STD_LOGIC;
		Y				: OUT STD_LOGIC
	);
END flipFlop2_1;

ARCHITECTURE structure OF flipFlop2_1 IS 
	SIGNAL s0, s1, s2: STD_LOGIC;
	COMPONENT flipFlopDPET
		PORT (
			clk, D		: IN STD_LOGIC;
			nSet, nRst 	: IN STD_LOGIC;
			Q, nQ			: OUT STD_LOGIC
		);
	END COMPONENT;
	COMPONENT gateAnd2
		PORT (
			x1, x2	: IN STD_LOGIC;
			y			: OUT STD_LOGIC
		);
	END COMPONENT;
	COMPONENT gateOr2
		PORT (
			x1, x2	: IN STD_LOGIC;
			y			: OUT STD_LOGIC
		);
	END COMPONENT;
	BEGIN
		and0: gateAnd2 PORT MAP (NOT sel, A, s0);
		and1: gateAnd2 PORT MAP (sel, B, s1);
		or0:  gateOr2  PORT MAP (s0, s1, s2);
		ff: flipFlopDPET PORT MAP (clk, s2, nSet, nRst, Y, open);
END structure;