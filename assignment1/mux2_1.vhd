LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY mux2_1 IS
    PORT (
        sel, A, B: IN STD_LOGIC;
        Y: OUT STD_LOGIC
    );
END mux2_1;

ARCHITECTURE structure of mux2_1 IS
    SIGNAL s0, s1: STD_LOGIC;
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
		or0:  gateOr2  PORT MAP (s0, s1, Y);
END structure;
