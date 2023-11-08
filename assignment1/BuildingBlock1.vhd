LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY BuildingBlock1 IS
    PORT (
        dIn:  IN STD_LOGIC_VECTOR (8 DOWNTO 0);
        dOut: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
END BuildingBlock1;

ARCHITECTURE structure OF BuildingBlock1 IS
    COMPONENT gateXor2
        PORT (
            x1, x2: IN STD_LOGIC;
            y:      OUT STD_LOGIC
        );
    END COMPONENT;
    BEGIN
        xor0: gateXor2 PORT MAP (dIn(8), dIn(7), dOut(7));
        dOut(6) <= dIn(6);
        xor1: gateXor2 PORT MAP (dIn(8), dIn(5), dOut(5));
        dOut(4) <= dIn(4);
        dOut(3) <= dIn(3);
        xor2: gateXor2 PORT MAP (dIn(8), dIn(2), dOut(2));
        xor3: gateXor2 PORT MAP (dIn(8), dIn(1), dOut(1));
        xor4: gateXor2 PORT MAP (dIn(8), dIn(0), dOut(0));
END structure;
