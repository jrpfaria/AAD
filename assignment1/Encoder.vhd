LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY Encoder IS
    PORT (
        dIn: IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
        dOut: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
END Encoder;

ARCHITECTURE structure OF Encoder IS
    SIGNAL sx0103,sx0005,sx0204,sx0713,sx0613,sx0614,sx1115,sx0001,sx0306,sx0408,sx0507,sx0709,sx0810,sx0814,sx0910,sx0915,sx1012: STD_LOGIC; --layer1
    SIGNAL sx00050713,sx010312,sx01030204,sx05070613,sx00051012,sx07091115,sx020412,sx01030614,sx081011,sx091002,sx03060408,sx02040613,sx00010814: STD_LOGIC; --layer 2
    SIGNAL sx6p,sx5p,sx1p: STD_LOGIC; --layer 3
    COMPONENT gateXor2
        PORT (
            x1, x2: IN STD_LOGIC;
            y:      OUT STD_LOGIC
        );
    END COMPONENT;
    BEGIN
    -- layer 1
    x0103: gateXor2 PORT MAP (dIn(1), dIn(3), sx0103);
    x0005: gateXor2 PORT MAP (dIn(0), dIn(5), sx0005);
    x0204: gateXor2 PORT MAP (dIn(2), dIn(4), sx0204);
    x0713: gateXor2 PORT MAP (dIn(7), dIn(13), sx0713);
    x0613: gateXor2 PORT MAP (dIn(6), dIn(13), sx0613);
    x0614: gateXor2 PORT MAP (dIn(6), dIn(14), sx0614);
    x1115: gateXor2 PORT MAP (dIn(11), dIn(15), sx1115);
    x0001: gateXor2 PORT MAP (dIn(0), dIn(1), sx0001);
    x0306: gateXor2 PORT MAP (dIn(3), dIn(6), sx0306);
    x0408: gateXor2 PORT MAP (dIn(4), dIn(8), sx0408);
    x0507: gateXor2 PORT MAP (dIn(5), dIn(7), sx0507);
    x0709: gateXor2 PORT MAP (dIn(7), dIn(9), sx0709);
    x0810: gateXor2 PORT MAP (dIn(8), dIn(10), sx0810);
    x0814: gateXor2 PORT MAP (dIn(8), dIn(14), sx0814);
    x0910: gateXor2 PORT MAP (dIn(9), dIn(10), sx0910);
    x0915: gateXor2 PORT MAP (dIn(9), dIn(15), sx0915);
    x1012: gateXor2 PORT MAP (dIn(10), dIn(12), sx1012);
    -- layer 2
    x00050713: gateXor2 PORT MAP (sx0005, sx0713, sx00050713);
    x010312: gateXor2 PORT MAP (sx0103, dIn(12), sx010312);
    x01030204: gateXor2 PORT MAP (sx0103, sx0204, sx01030204);
    x05070613: gateXor2 PORT MAP (sx0507, sx0613, sx05070613);
    x00051012: gateXor2 PORT MAP (sx0005, sx1012, sx00051012);
    x07091115: gateXor2 PORT MAP (sx0709, sx1115, sx07091115);
    x020412: gateXor2 PORT MAP (sx0204, dIn(12), sx020412);
    x01030614: gateXor2 PORT MAP (sx0103, sx0614, sx01030614);
    x081011: gateXor2 PORT MAP (sx0810, dIn(11), sx081011);
    x091002: gateXor2 PORT MAP (sx0910, dIn(2), sx091002);
    x03060408: gateXor2 PORT MAP (sx0306, sx0408, sx03060408);
    x02040613: gateXor2 PORT MAP (sx0204, sx0613, sx02040613);
    x00010814: gateXor2 PORT MAP (sx0001, sx0814, sx00010814);
    -- layer 3
    x7: gateXor2 PORT MAP (sx00050713, sx010312, dOut(7));
    x4: gateXor2 PORT MAP (sx07091115, sx020412, sx6p);
    x3: gateXor2 PORT MAP (sx01030614, sx081011, sx5p);
    x2: gateXor2 PORT MAP (sx00050713, sx091002, dOut(4));
    x0: gateXor2 PORT MAP (sx02040613, sx00010814, dOut(3));
    x6p: gateXor2 PORT MAP (sx01030204, sx05070613, dOut(2));
    x5p: gateXor2 PORT MAP (sx01030204, sx00051012, sx1p);
    x1p: gateXor2 PORT MAP (sx00050713, sx03060408, dOut(0));
    -- layer 4
    x6: gateXor2 PORT MAP (sx6p, sx1115, dOut(6));
    x5: gateXor2 PORT MAP (sx5p, sx0614, dOut(5));
    x1: gateXor2 PORT MAP (sx1p, sx0915, dOut(1));
END structure;
