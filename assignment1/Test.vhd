LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY storeDev;
USE storeDev.all;

LIBRARY BuildingBlock1;
USE BuildingBlock1.all;

LIBRARY mux2_1;
USE mux2_1.all;

ENTITY Encoder IS
    PORT (
        clk, sIn, nGRst: IN  STD_LOGIC;
        sOut:            OUT STD_LOGIC;
        bbIO:            OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
        bbOO:            OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END Encoder;

ARCHITECTURE structure OF Encoder IS
    SIGNAL pr9In: STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL iNSet, iNRst, clkO, sel: STD_LOGIC;
    SIGNAL bbI: STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL bbO: STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL stat:  STD_LOGIC_VECTOR (4 DOWNTO 0);
    COMPONENT BuildingBlock1
        PORT (
            dIn:  IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
            dOut: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT binCounter_5bit
        PORT (
            nRst: IN  STD_LOGIC;
            clk:  IN  STD_LOGIC;
            c:    OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT parReg_9bit
        PORT (
            nRst: IN  STD_LOGIC;
            clk:  IN  STD_LOGIC;
            D:    IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
            Q:    OUT STD_LOGIC_VECTOR (8 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT control
        PORT (
            nGRst: IN  STD_LOGIC;
            clk:   IN  STD_LOGIC;
            add:   IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
            nRst:  OUT STD_LOGIC;
            nSetO: OUT STD_LOGIC;
            clkO:  OUT STD_LOGIC;
            clk1O: OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT mux2_1
        PORT (
            sel, A, B: IN STD_LOGIC;
            Y: OUT STD_LOGIC
        );
    END COMPONENT;
    BEGIN
        pr9In <= bbO & sIn;
        pr9: parReg_9bit PORT MAP(iNRst, clk, pr9In, bbI);
		bb1: BuildingBlock1 PORT MAP (bbI, bbO);
		bc:  binCounter_5bit PORT MAP (iNRst, clk, stat);
		con: control  PORT MAP (nGRst, clk, stat, iNRst, iNSet, clkO, sel);
        mux: mux2_1 PORT MAP(sel, bbO(7), sIN, sOut);
        bbIO <= bbI;
        bbOO <= bbO;
END structure;
