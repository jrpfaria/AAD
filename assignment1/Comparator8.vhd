LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY Comparator8 IS
    PORT (
        A:   IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
        B:   IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
        err: OUT STD_LOGIC
    );
END Comparator8;

ARCHITECTURE structure OF Comparator8 IS
    SIGNAL cmp0O, cmp1O, cmp2O, cmp3O, cmp4O, cmp5O, cmp6O, cmp7O: STD_LOGIC;
    SIGNAL or01O, or23O, or45O, or67O, or0123O, or4567O: STD_LOGIC;
    COMPONENT gateOr2
        PORT (
            x1, x2: IN STD_LOGIC;
            y:      OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT gateXor2
        PORT (
            x1, x2: IN STD_LOGIC;
            y:      OUT STD_LOGIC
        );
    END COMPONENT;
    BEGIN
    cmp0: gateXor2  PORT MAP (A(0), B(0), cmp0O);
    cmp1: gateXor2  PORT MAP (A(1), B(1), cmp1O);
    cmp2: gateXor2  PORT MAP (A(2), B(2), cmp2O);
    cmp3: gateXor2  PORT MAP (A(3), B(3), cmp3O);
    cmp4: gateXor2  PORT MAP (A(4), B(4), cmp4O);
    cmp5: gateXor2  PORT MAP (A(5), B(5), cmp5O);
    cmp6: gateXor2  PORT MAP (A(6), B(6), cmp6O);
    cmp7: gateXor2  PORT MAP (A(7), B(7), cmp7O);
    or01: gateOr2   PORT MAP (cmp0O, cmp1O, or01O);
    or23: gateOr2   PORT MAP (cmp2O, cmp3O, or23O);
    or45: gateOr2   PORT MAP (cmp4O, cmp5O, or45O);
    or67: gateOr2   PORT MAP (cmp6O, cmp7O, or67O);
    or0123: gateOr2 PORT MAP(or01O, or23O, or0123O);
    or4567: gateOr2 PORT MAP(or45O, or67O, or4567O);
    orF: gateOr2    PORT MAP(or0123O, or4567O, err);
END structure;
