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
        clk, sIn, rst: IN STD_LOGIC;
        dOut:          OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
END Encoder;

ARCHITECTURE structure OF Encoder IS
    SIGNAL iNSet, iNRst, iDIn, clkO: STD_LOGIC;
    SIGNAL tCntI: STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL tCntO: STD_LOGIC_VECTOR (5 DOWNTO 0);
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
    BEGIN
        bb1: BuildingBlock1 PORT MAP ()
        pr8: parReg_8bit PORT MAP (iNSet, clkO, ----, cnt);
        bc:  binCounter_6bit PORT MAP (iNRst, clk, stat);
        con: control  PORT MAP (nGRst, clk, stat, iNRst, INSet, clkO);
END structure;