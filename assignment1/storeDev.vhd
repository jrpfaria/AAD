LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipFlopDPET IS
  PORT (clk, D:     IN STD_LOGIC;
        nSet, nRst: IN STD_LOGIC;
        Q, nQ:      OUT STD_LOGIC);
END flipFlopDPET;

ARCHITECTURE behavior OF flipFlopDPET IS
BEGIN
  PROCESS (clk, nSet, nRst)
  BEGIN
    IF (nRst = '0')
	    THEN Q <= '0';
		      nQ <= '1';
		 ELSIF (nSet = '0')
		       THEN Q <= '1';
		            nQ <= '0';
	          ELSIF (clk = '1') AND (clk'EVENT)
	                THEN Q <= D;
		                  nQ <= NOT D;

	 END IF;
  END PROCESS;
END behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY binCounter_5bit IS
  PORT (nRst: IN STD_LOGIC;
        clk:  IN STD_LOGIC;
        c:    OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
END binCounter_5bit;

ARCHITECTURE structure OF binCounter_5bit IS
  SIGNAL pD1, pD2, pD3, pD4: STD_LOGIC;
  SIGNAL iD1, iD2, iD3, iD4, iD5: STD_LOGIC;
  SIGNAL iQ0, iQ1, iQ2, iQ3, iQ4, iQ5: STD_LOGIC;
  SIGNAL inQ0: STD_LOGIC;
  COMPONENT gateAnd2
    PORT (x1, x2: IN STD_LOGIC;
          y:      OUT STD_LOGIC);
  END COMPONENT;
  COMPONENT gateXor2
    PORT (x1, x2: IN STD_LOGIC;
          y:      OUT STD_LOGIC);
  END COMPONENT;
  COMPONENT flipFlopDPET
    PORT (clk, D:     IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ:      OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  ad1: gateAnd2 PORT MAP (iQ0, iQ1, pD1);
  ad2: gateAnd2 PORT MAP (pD1, iQ2, pD2);
  ad3: gateAnd2 PORT MAP (pD2, iQ3, pD3);
  xr1: gateXor2 PORT MAP (iQ0, iQ1, iD1);
  xr2: gateXor2 PORT MAP (pD1, iQ2, iD2);
  xr3: gateXor2 PORT MAP (pD2, iQ3, iD3);
  xr4: gateXor2 PORT MAP (pD3, iQ4, iD4);
  ff0: flipFlopDPET PORT MAP (clk, inQ0, '1', nRst, iQ0, inQ0);
  ff1: flipFlopDPET PORT MAP (clk, iD1,  '1', nRst, iQ1);
  ff2: flipFlopDPET PORT MAP (clk, iD2,  '1', nRst, iQ2);
  ff3: flipFlopDPET PORT MAP (clk, iD3,  '1', nRst, iQ3);
  ff4: flipFlopDPET PORT MAP (clk, iD4,  '1', nRst, iQ4);
  c(0) <= iQ0;
  c(1) <= iQ1;
  c(2) <= iQ2;
  c(3) <= iQ3;
  c(4) <= iQ4;
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY binCounter_6bit IS
  PORT (nRst: IN STD_LOGIC;
        clk:  IN STD_LOGIC;
        c:    OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
END binCounter_6bit;

ARCHITECTURE structure OF binCounter_6bit IS
  SIGNAL pD1, pD2, pD3, pD4: STD_LOGIC;
  SIGNAL iD1, iD2, iD3, iD4, iD5: STD_LOGIC;
  SIGNAL iQ0, iQ1, iQ2, iQ3, iQ4, iQ5: STD_LOGIC;
  SIGNAL inQ0: STD_LOGIC;
  COMPONENT gateAnd2
    PORT (x1, x2: IN STD_LOGIC;
          y:      OUT STD_LOGIC);
  END COMPONENT;
  COMPONENT gateXor2
    PORT (x1, x2: IN STD_LOGIC;
          y:      OUT STD_LOGIC);
  END COMPONENT;
  COMPONENT flipFlopDPET
    PORT (clk, D:     IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ:      OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  ad1: gateAnd2 PORT MAP (iQ0, iQ1, pD1);
  ad2: gateAnd2 PORT MAP (pD1, iQ2, pD2);
  ad3: gateAnd2 PORT MAP (pD2, iQ3, pD3);
  ad4: gateAnd2 PORT MAP (pD3, iQ4, pD4);
  xr1: gateXor2 PORT MAP (iQ0, iQ1, iD1);
  xr2: gateXor2 PORT MAP (pD1, iQ2, iD2);
  xr3: gateXor2 PORT MAP (pD2, iQ3, iD3);
  xr4: gateXor2 PORT MAP (pD3, iQ4, iD4);
  xr5: gateXor2 PORT MAP (pD4, iQ5, iD5);
  ff0: flipFlopDPET PORT MAP (clk, inQ0, '1', nRst, iQ0, inQ0);
  ff1: flipFlopDPET PORT MAP (clk, iD1,  '1', nRst, iQ1);
  ff2: flipFlopDPET PORT MAP (clk, iD2,  '1', nRst, iQ2);
  ff3: flipFlopDPET PORT MAP (clk, iD3,  '1', nRst, iQ3);
  ff4: flipFlopDPET PORT MAP (clk, iD4,  '1', nRst, iQ4);
  ff5: flipFlopDPET PORT MAP (clk, iD5,  '1', nRst, iQ5);
  c(0) <= iQ0;
  c(1) <= iQ1;
  c(2) <= iQ2;
  c(3) <= iQ3;
  c(4) <= iQ4;
  c(5) <= iQ5;
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parReg_5bit IS
  PORT (nRst: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        D: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        Q: OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
END parReg_5bit;

ARCHITECTURE structure OF parReg_5bit IS
  COMPONENT flipFlopDPET
    PORT (clk, D: IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ: OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  ff0: flipFlopDPET PORT MAP (clk, D(0), '1', nRst, Q(0));
  ff1: flipFlopDPET PORT MAP (clk, D(1), '1', nRst, Q(1));
  ff2: flipFlopDPET PORT MAP (clk, D(2), '1', nRst, Q(2));
  ff3: flipFlopDPET PORT MAP (clk, D(3), '1', nRst, Q(3));
  ff4: flipFlopDPET PORT MAP (clk, D(4), '1', nRst, Q(4));
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parReg_6bit IS
  PORT (nSet: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        D: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
        Q: OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
END parReg_6bit;

ARCHITECTURE structure OF parReg_6bit IS
  COMPONENT flipFlopDPET
    PORT (clk, D: IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ: OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  ff0: flipFlopDPET PORT MAP (clk, D(0), nSet, '1', Q(0));
  ff1: flipFlopDPET PORT MAP (clk, D(1), nSet, '1', Q(1));
  ff2: flipFlopDPET PORT MAP (clk, D(2), nSet, '1', Q(2));
  ff3: flipFlopDPET PORT MAP (clk, D(3), nSet, '1', Q(3));
  ff4: flipFlopDPET PORT MAP (clk, D(4), nSet, '1', Q(4));
  ff5: flipFlopDPET PORT MAP (clk, D(5), nSet, '1', Q(5));
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parReg_9bit IS
	PORT (
		nRst: IN STD_LOGIC;
		clk: IN STD_LOGIC;
		D: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		Q: OUT STD_LOGIC_VECTOR (8 DOWNTO 0)
	);
END parReg_9bit;

ARCHITECTURE structure OF parReg_9bit IS
	COMPONENT flipFlopDPET
		PORT (
			clk, D:     IN  STD_LOGIC;
			nSet, nRst: IN  STD_LOGIC;
			Q, nQ:      OUT STD_LOGIC
		);
	END COMPONENT;
	BEGIN
		ff0: flipFlopDPET PORT MAP (clk, D(0), '1', nRst, Q(0));
		ff1: flipFlopDPET PORT MAP (clk, D(1), '1', nRst, Q(1));
		ff2: flipFlopDPET PORT MAP (clk, D(2), '1', nRst, Q(2));
		ff3: flipFlopDPET PORT MAP (clk, D(3), '1', nRst, Q(3));
		ff4: flipFlopDPET PORT MAP (clk, D(4), '1', nRst, Q(4));
		ff5: flipFlopDPET PORT MAP (clk, D(5), '1', nRst, Q(5));
		ff6: flipFlopDPET PORT MAP (clk, D(6), '1', nRst, Q(6));
		ff7: flipFlopDPET PORT MAP (clk, D(7), '1', nRst, Q(7));
    ff8: flipFlopDPET PORT MAP (clk, D(8), '1', nRst, Q(8));
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parReg_24bit IS
	PORT (
		nSet: IN STD_LOGIC;
		clk: IN STD_LOGIC;
		D: IN STD_LOGIC_VECTOR (23 DOWNTO 0);
		Q: OUT STD_LOGIC_VECTOR (23 DOWNTO 0)
	);
END parReg_24bit;

ARCHITECTURE structure OF parReg_24bit IS
	COMPONENT flipFlopDPET
		PORT (
			clk, D:     IN  STD_LOGIC;
			nSet, nRst: IN  STD_LOGIC;
			Q, nQ:      OUT STD_LOGIC
		);
	END COMPONENT;
	BEGIN
		ff0: flipFlopDPET PORT MAP (clk, D(0), nSet, '1', Q(0));
		ff1: flipFlopDPET PORT MAP (clk, D(1), nSet, '1', Q(1));
		ff2: flipFlopDPET PORT MAP (clk, D(2), nSet, '1', Q(2));
		ff3: flipFlopDPET PORT MAP (clk, D(3), nSet, '1', Q(3));
		ff4: flipFlopDPET PORT MAP (clk, D(4), nSet, '1', Q(4));
		ff5: flipFlopDPET PORT MAP (clk, D(5), nSet, '1', Q(5));
		ff6: flipFlopDPET PORT MAP (clk, D(6), nSet, '1', Q(6));
		ff7: flipFlopDPET PORT MAP (clk, D(7), nSet, '1', Q(7));
    ff8: flipFlopDPET PORT MAP (clk, D(8), nSet, '1', Q(8));
		ff9: flipFlopDPET PORT MAP (clk, D(9), nSet, '1', Q(9));
		ff10: flipFlopDPET PORT MAP (clk, D(10), nSet, '1', Q(10));
		ff11: flipFlopDPET PORT MAP (clk, D(11), nSet, '1', Q(11));
		ff12: flipFlopDPET PORT MAP (clk, D(12), nSet, '1', Q(12));
		ff13: flipFlopDPET PORT MAP (clk, D(13), nSet, '1', Q(13));
		ff14: flipFlopDPET PORT MAP (clk, D(14), nSet, '1', Q(14));
		ff15: flipFlopDPET PORT MAP (clk, D(15), nSet, '1', Q(15));
    ff16: flipFlopDPET PORT MAP (clk, D(16), nSet, '1', Q(16));
    ff17: flipFlopDPET PORT MAP (clk, D(17), nSet, '1', Q(17));
    ff18: flipFlopDPET PORT MAP (clk, D(18), nSet, '1', Q(18));
    ff19: flipFlopDPET PORT MAP (clk, D(19), nSet, '1', Q(19));
    ff20: flipFlopDPET PORT MAP (clk, D(20), nSet, '1', Q(20));
    ff21: flipFlopDPET PORT MAP (clk, D(21), nSet, '1', Q(21));
    ff22: flipFlopDPET PORT MAP (clk, D(22), nSet, '1', Q(22));
    ff23: flipFlopDPET PORT MAP (clk, D(23), nSet, '1', Q(23));
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shiftReg_16bit IS
	PORT (
		nRst: IN STD_LOGIC;
		clk: IN STD_LOGIC;
		sIN: IN STD_LOGIC;
		Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END shiftReg_16bit;

ARCHITECTURE structure OF shiftReg_16bit IS
  SIGNAL s: STD_LOGIC_VECTOR (15 DOWNTO 0);
	COMPONENT flipFlopDPET
		PORT (
			clk, D:     IN  STD_LOGIC;
			nSet, nRst: IN  STD_LOGIC;
			Q, nQ:      OUT STD_LOGIC
		);
	END COMPONENT;
	BEGIN
		ff0: flipFlopDPET PORT MAP (clk, sIN, '1', nRst, s(0));
		ff1: flipFlopDPET PORT MAP (clk, s(0), '1', nRst, s(1));
		ff2: flipFlopDPET PORT MAP (clk, s(1), '1', nRst, s(2));
		ff3: flipFlopDPET PORT MAP (clk, s(2), '1', nRst, s(3));
		ff4: flipFlopDPET PORT MAP (clk, s(3), '1', nRst, s(4));
		ff5: flipFlopDPET PORT MAP (clk, s(4), '1', nRst, s(5));
		ff6: flipFlopDPET PORT MAP (clk, s(5), '1', nRst, s(6));
		ff7: flipFlopDPET PORT MAP (clk, s(6), '1', nRst, s(7));
    ff8: flipFlopDPET PORT MAP (clk, s(7), '1', nRst, s(8));
    ff9: flipFlopDPET PORT MAP (clk, s(8), '1', nRst, s(9));
    ff10: flipFlopDPET PORT MAP (clk, s(9), '1', nRst, s(10));
    ff11: flipFlopDPET PORT MAP (clk, s(10), '1', nRst, s(11));
    ff12: flipFlopDPET PORT MAP (clk, s(11), '1', nRst, s(12));
    ff13: flipFlopDPET PORT MAP (clk, s(12), '1', nRst, s(13));
    ff14: flipFlopDPET PORT MAP (clk, s(13), '1', nRst, s(14));
    ff15: flipFlopDPET PORT MAP (clk, s(14), '1', nRst, s(15));
    Q <= s;
END structure;
