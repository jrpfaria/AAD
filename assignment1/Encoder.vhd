LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY storeDev;
USE storeDev.all;

LIBRARY BuildingBlock1;
USE BuildingBlock1.all;

ENTITY Encoder IS
    PORT (
        clk, sIn, nGRst: IN  STD_LOGIC;
        dOut:            OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
END Encoder;

ARCHITECTURE structure OF Encoder IS
    SIGNAL pr9In: STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL iNSet, iNRst, clkO: STD_LOGIC;
    SIGNAL bbI: STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL bbO: STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL stat:  STD_LOGIC_VECTOR (5 DOWNTO 0);
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
            add:   IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
            nRst:  OUT STD_LOGIC;
            nSetO: OUT STD_LOGIC;
            clkO:  OUT STD_LOGIC
        );
    END COMPONENT;
    BEGIN
        pr9In <= bbO & sIn;
        pr9: parReg_9bit PORT MAP(iNRst, clk, pr9In, bbI);
		bb1: BuildingBlock1 PORT MAP (bbI, bbO);
		pr8: parReg_8bit PORT MAP(iNSet, clkO, bbO, dOut);
		bc:  binCounter_6bit PORT MAP (iNRst, clk, stat);
		con: control  PORT MAP (nGRst, clk, stat, iNRst, iNSet, clkO);
END structure;
