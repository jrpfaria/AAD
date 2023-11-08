LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY flipFlop2_1;
USE flipFlop2_1.all;
	
ENTITY ShiftRegister8 IS
	PORT (
		clk, nSet, nRst, load: IN STD_LOGIC;
		serialIn					: IN STD_LOGIC;
		parallelIn				: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		parallelOut				: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END ShiftRegister8;

ARCHITECTURE structure OF shiftRegister8 IS
	SIGNAL f0, f1, f2, f3, f4, f5, f6, f7 : STD_LOGIC;
	COMPONENT flipFlop2_1
		PORT (
			clk, sel		: IN STD_LOGIC;
			nSet, nRst	: IN STD_LOGIC;
			A				: IN STD_LOGIC;
			B				: IN STD_LOGIC;
			Y				: OUT STD_LOGIC
		);
	END COMPONENT;
	BEGIN
		ff0 : flipFlop2_1 PORT MAP (clk, load, nSet, nRst, serialIn, parallelIn(0), f0);
		parallelOut(0) <= f0;
		ff1 : flipFlop2_1 PORT MAP (clk, load, nSet, nRst, f0, parallelIn(1), f1);
		parallelOut(1) <= f1;
		ff2 : flipFlop2_1 PORT MAP (clk, load, nSet, nRst, f1, parallelIn(2), f2);
		parallelOut(2) <= f2;
		ff3 : flipFlop2_1 PORT MAP (clk, load, nSet, nRst, f2, parallelIn(1), f3);
		parallelOut(3) <= f3;
		ff4 : flipFlop2_1 PORT MAP (clk, load, nSet, nRst, f3, parallelIn(2), f4);
		parallelOut(4) <= f4;
		ff5 : flipFlop2_1 PORT MAP (clk, load, nSet, nRst, f4, parallelIn(1), f5);
		parallelOut(5) <= f5;
		ff6 : flipFlop2_1 PORT MAP (clk, load, nSet, nRst, f5, parallelIn(2), f6);
		parallelOut(6) <= f6;
		ff7 : flipFlop2_1 PORT MAP (clk, load, nSet, nRst, f6, parallelIn(1), parallelOut(7));
END structure;