LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;
LIBRARY storeDev;
USE storeDev.all;


ENTITY flipFlop2_1 IS
	PORT (
		clk, load	: IN STD_LOGIC;
		set, rst		: IN STD_LOGIC;
		A				: IN STD_LOGIC;
		B				: IN STD_LOGIC;
		Y				: OUT STD_LOGIC
	);
END flipFlop2_1;

ARCHITECTURE structure OF flipFlop2_1 IS 
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
			y			: OUT STD_LOGIC;
		);
	COMPONENT gateOr2
		PORT (
			x1, x2	: IN STD_LOGIC;
			y			: OUT STD_LOGIC;
		);
	BEGIN
		
	
END structure
	
	
	
	
	
	
ENTITY ShiftRegister8 IS
	PORT (
		clk, set, rst, load 	: IN STD_LOGIC;
		serialIn					: IN STD_LOGIC;
		parallelIn				: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		parallelOut				: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END ShiftRegister8;

ARCHITECTURE structure OF shiftRegister8 IS
	SIGNAL f0, f1, f2, f3, f4, f5, f6, f7 : STD_LOGIC;
	COMPONENT flipFlopDPET
		PORT (
			clk, D		: IN STD_LOGIC;
			nSet, nRst 	: IN STD_LOGIC;
			Q, nQ			: OUT STD_LOGIC
		);
	END COMPONENT;
	BEGIN

		