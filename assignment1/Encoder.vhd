LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

LIBRARY storeDev;
USE storeDev.all;

LIBRARY BuildingBlock1;
USE BuildingBlock1.all;

LIBRARY shiftRegister8;
USE shiftRegister8.all;

ENTITY Encoder IS
    PORT (
        clk, sIn, nGRst: IN  STD_LOGIC;
        dOut:            OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		cont:			 OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		statO:			 OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
        bbIO:            OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
        bbOO:            OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
END Encoder;

ARCHITECTURE structure OF Encoder IS
    SIGNAL ffo: STD_LOGIC;
    SIGNAL iNSet, iNRst, clkO: STD_LOGIC;
    SIGNAL bbI: STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL bbO: STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL stat:  STD_LOGIC_VECTOR (5 DOWNTO 0);
    COMPONENT shiftRegister8
        PORT (
            clk, nSet, nRst, load: IN STD_LOGIC;
            serialIn:    IN  STD_LOGIC;
            parallelIn:  IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
            parallelOut: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT BuildingBlock1
        PORT (
            dIn:  IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
            dOut: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT binCounter_6bit
        PORT (
            nRst: IN  STD_LOGIC;
            clk:  IN  STD_LOGIC;
            c:    OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT parReg_8bit
        PORT (
            nSet: IN  STD_LOGIC;
            clk:  IN  STD_LOGIC;
            D:    IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
            Q:    OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT control
        PORT (
            nGRst: IN  STD_LOGIC;
            clk:   IN  STD_LOGIC;
            add:   IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
            nRst:  OUT STD_LOGIC;
            nSetO: OUT STD_LOGIC;
            clkO:  OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT flipFlopDPET
		PORT (
			clk, D		: IN STD_LOGIC;
			nSet, nRst 	: IN STD_LOGIC;
			Q, nQ			: OUT STD_LOGIC
		);
	END COMPONENT;
    BEGIN
        ff: flipFlopDPET PORT MAP (clk, sIn, '1', nGRst, ffO, open);
		sr: shiftRegister8 PORT MAP (clk, iNRst, iNRst, '1', '1', bbO, bbI(8 DOWNTO 1));
		bbI(0) <= ffO;
        bbIO <= bbI;
        bbOO <= bbO;
		bb1: BuildingBlock1 PORT MAP (bbI, bbO);
		pr8: parReg_8bit PORT MAP(INSet, clkO, bbO, dOut);
		bc:  binCounter_6bit PORT MAP (iNRst, clk, stat);
		con: control  PORT MAP (nGRst, clk, stat, iNRst, iNSet, clkO);
		statO <= stat;
		cont(0) <= iNRst;
		cont(1) <= iNSet;
		cont(2) <= clkO;
END structure;
