LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

LIBRARY storeDev;
USE storeDev.all;

LIBRARY BuildingBlock1;
USE BuildingBlock1.all;

ENTITY Checker IS
    PORT (
        clk, sIn, nGRst: IN  STD_LOGIC;
        err:             OUT STD_LOGIC
    );
END Checker;

ARCHITECTURE structure OF Checker IS
    SIGNAL pr9In: STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL srO: STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL iNSet, iNRst, clkO, remn: STD_LOGIC;
    SIGNAL bbI: STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL bbO: STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL stat:  STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL cmpO: STD_LOGIC;
    SIGNAL sand0: STD_LOGIC;
    SIGNAL clkRemn: STD_LOGIC;
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
    COMPONENT shiftReg_8bit
    PORT (
		nRst: IN  STD_LOGIC;
		clk:  IN  STD_LOGIC;
		sIN:  IN  STD_LOGIC;
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
    COMPONENT flipFlopDPET
        PORT (
            clk, D:     IN  STD_LOGIC;
            nSet, nRst: IN  STD_LOGIC;
            Q, nQ:      OUT STD_LOGIC
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
            remn:  OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT gateAnd2
        PORT (
            x1, x2: IN  STD_LOGIC;
            y:      OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT Comparator8
        PORT (
            A:   IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
            B:   IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
            err: OUT STD_LOGIC
        );
    END COMPONENT;
    BEGIN
        sr8: shiftReg_8bit PORT MAP(iNRst, clkRemn, sIn, srO);
        and0: gateAnd2 PORT MAP(NOT remn, sIn, sand0);
        and1: gateAnd2 PORT MAP(remn, clk, clkRemn);
        pr9In <= bbO & sand0;
        pr9: parReg_9bit PORT MAP(iNRst, clk, pr9In, bbI);
        bb1: BuildingBlock1 PORT MAP (bbI, bbO);
        bc:  binCounter_5bit PORT MAP (iNRst, clk, stat);
        con: control PORT MAP (nGRst, clk, stat, iNRst, iNSet, clkO, remn);
        cmp: Comparator8 PORT MAP(bbO, srO, cmpO);
        ff: flipFlopDPET PORT MAP(clkO, cmpO, iNSet, '1', err, open);
END structure;
