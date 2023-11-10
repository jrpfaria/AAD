LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY Checker IS
    PORT (
        dIn: IN  STD_LOGIC_VECTOR (24 DOWNTO 0);
        err: OUT STD_LOGIC
    );
END Checker;

ARCHITECTURE structure OF Checker IS
    SIGNAL x0, x1, x2, x3, x4, x5, x6, x7: STD_LOGIC; --comparador
    SIGNAL cmp0O, cmp1O, cmp2O, cmp3O, cmp4O, cmp5O, cmp6O, cmp7O: STD_LOGIC; --comparador
    SIGNAL or01O, or23O, or45O, or67O, or0123O, or4567O: STD_LOGIC; --comparador
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
    cmp0: gateXor2 PORT MAP (dIn(0), x0, cmp0O); --comparador
    cmp1: gateXor2 PORT MAP (dIn(1), x1, cmp1O); --comparador
    cmp2: gateXor2 PORT MAP (dIn(2), x2, cmp2O); --comparador
    cmp3: gateXor2 PORT MAP (dIn(3), x3, cmp3O); --comparador
    cmp4: gateXor2 PORT MAP (dIn(4), x4, cmp4O); --comparador
    cmp5: gateXor2 PORT MAP (dIn(5), x5, cmp5O); --comparador
    cmp6: gateXor2 PORT MAP (dIn(6), x6, cmp6O); --comparador
    cmp7: gateXor2 PORT MAP (dIn(7), x7, cmp7O); --comparador
    or01: gateOr2 PORT MAP (cmp0O, cmp1O, or01O); --comparador
    or23: gateOr2 PORT MAP (cmp2O, cmp3O, or23O); --comparador
    or45: gateOr2 PORT MAP (cmp4O, cmp5O, or45O); --comparador
    or67: gateOr2 PORT MAP (cmp6O, cmp7O, or67O); --comparador
    or0123: gateOr2 PORT MAP(or01O, or23O, or0123O); --comparador
    or4567: gateOr2 PORT MAP(or45O, or67O, or4567O); --comparador
    orF: gateOr2 PORT MAP(or0123O, or4567O, err); --comparador
END structure;
