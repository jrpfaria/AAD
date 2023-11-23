LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY storeDev;
USE storeDev.all;

ENTITY Encoder IS
    PORT (
        clk, sIn, nGRst: IN  STD_LOGIC;
        clkOO:           OUT STD_LOGIC;
        dOut:            OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
END Encoder;

ARCHITECTURE structure OF Encoder IS
    SIGNAL srO: STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL iNRst, clkO: STD_LOGIC;
    SIGNAL stat:  STD_LOGIC_VECTOR (4 DOWNTO 0);
    COMPONENT binCounter_5bit
        PORT (
            nRst: IN  STD_LOGIC;
            clk:  IN  STD_LOGIC;
            c:    OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT shiftReg_16bit
    PORT (
		nRst: IN STD_LOGIC;
		clk: IN STD_LOGIC;
		sIN: IN STD_LOGIC;
		Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
    END COMPONENT;
    COMPONENT control
        PORT (
            nGRst: IN  STD_LOGIC;
            clk:   IN  STD_LOGIC;
            add:   IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
            nRst:  OUT STD_LOGIC;
            clkO:  OUT STD_LOGIC
        );
    END COMPONENT;
    BEGIN
        sr16: shiftReg_16bit PORT MAP(iNRst, clkO, sIn, srO);
        dOut <= srO;
        clkOO <= clkO;
		bc:  binCounter_5bit PORT MAP (iNRst, clk, stat);
		con: control  PORT MAP (nGRst, clk, stat, iNRst, clkO);
END structure;
