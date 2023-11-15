LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY Checker IS
    PORT (
        dIn: IN  STD_LOGIC_VECTOR (24 DOWNTO 0);
        dOut: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        err: OUT STD_LOGIC
    );
END Checker;

ARCHITECTURE structure OF Checker IS
    SIGNAL sx0103,sx0005,sx0204,sx0713,sx0613,sx0614,sx1115,sx0001,sx0306,sx0408,sx0507,sx0709,sx0810,sx0814,sx0910,sx0915,sx1012: STD_LOGIC; --layer1
    SIGNAL sx00050713,sx010312,sx01030204,sx05070613,sx00051012,sx07091115,sx020412,sx01030614,sx081011,sx091002,sx03060408,sx02040613,sx00010814: STD_LOGIC; --layer 2
    SIGNAL sx6p,sx5p,sx1p: STD_LOGIC; --layer 3
    SIGNAL sx0, sx1, sx2, sx3, sx4, sx5, sx6, sx7: STD_LOGIC; --remainder
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
    -- layer 1
    x0103: gateXor2 PORT MAP (dIn(9), dIn(11), sx0103);
    x0005: gateXor2 PORT MAP (dIn(8), dIn(13), sx0005);
    x0204: gateXor2 PORT MAP (dIn(10), dIn(12), sx0204);
    x0713: gateXor2 PORT MAP (dIn(15), dIn(21), sx0713);
    x0613: gateXor2 PORT MAP (dIn(14), dIn(21), sx0613);
    x0614: gateXor2 PORT MAP (dIn(14), dIn(22), sx0614);
    x1115: gateXor2 PORT MAP (dIn(19), dIn(23), sx1115);
    x0001: gateXor2 PORT MAP (dIn(8), dIn(9), sx0001);
    x0306: gateXor2 PORT MAP (dIn(11), dIn(14), sx0306);
    x0408: gateXor2 PORT MAP (dIn(12), dIn(16), sx0408);
    x0507: gateXor2 PORT MAP (dIn(13), dIn(15), sx0507);
    x0709: gateXor2 PORT MAP (dIn(15), dIn(17), sx0709);
    x0810: gateXor2 PORT MAP (dIn(16), dIn(18), sx0810);
    x0814: gateXor2 PORT MAP (dIn(16), dIn(22), sx0814);
    x0910: gateXor2 PORT MAP (dIn(17), dIn(18), sx0910);
    x0915: gateXor2 PORT MAP (dIn(17), dIn(23), sx0915);
    x1012: gateXor2 PORT MAP (dIn(18), dIn(20), sx1012);
    -- layer 2
    x00050713: gateXor2 PORT MAP (sx0005, sx0713, sx00050713);
    x010312: gateXor2 PORT MAP (sx0103, dIn(20), sx010312);
    x01030204: gateXor2 PORT MAP (sx0103, sx0204, sx01030204);
    x05070613: gateXor2 PORT MAP (sx0507, sx0613, sx05070613);
    x00051012: gateXor2 PORT MAP (sx0005, sx1012, sx00051012);
    x07091115: gateXor2 PORT MAP (sx0709, sx1115, sx07091115);
    x020412: gateXor2 PORT MAP (sx0204, dIn(20), sx020412);
    x01030614: gateXor2 PORT MAP (sx0103, sx0614, sx01030614);
    x081011: gateXor2 PORT MAP (sx0810, dIn(19), sx081011);
    x091002: gateXor2 PORT MAP (sx0910, dIn(10), sx091002);
    x03060408: gateXor2 PORT MAP (sx0306, sx0408, sx03060408);
    x02040613: gateXor2 PORT MAP (sx0204, sx0613, sx02040613);
    x00010814: gateXor2 PORT MAP (sx0001, sx0814, sx00010814);
    -- layer 3
    x7: gateXor2 PORT MAP (sx00050713, sx010312, sx7);
    x4: gateXor2 PORT MAP (sx07091115, sx020412, sx4);
    x3: gateXor2 PORT MAP (sx01030614, sx081011, sx3);
    x2: gateXor2 PORT MAP (sx00050713, sx091002, sx2);
    x0: gateXor2 PORT MAP (sx02040613, sx00010814, sx0);
    x6p: gateXor2 PORT MAP (sx01030204, sx05070613, sx6p);
    x5p: gateXor2 PORT MAP (sx01030204, sx00051012, sx5p);
    x1p: gateXor2 PORT MAP (sx00050713, sx03060408, sx1p);
    -- layer 4
    x6: gateXor2 PORT MAP (sx6p, sx1115, sx6);
    x5: gateXor2 PORT MAP (sx5p, sx0614, sx5);
    x1: gateXor2 PORT MAP (sx1p, sx0915, sx1);
    -- comparador
    cmp0: gateXor2 PORT MAP (dIn(0), sx0, cmp0O);
    cmp1: gateXor2 PORT MAP (dIn(1), sx1, cmp1O);
    cmp2: gateXor2 PORT MAP (dIn(2), sx2, cmp2O);
    cmp3: gateXor2 PORT MAP (dIn(3), sx3, cmp3O);
    cmp4: gateXor2 PORT MAP (dIn(4), sx4, cmp4O);
    cmp5: gateXor2 PORT MAP (dIn(5), sx5, cmp5O);
    cmp6: gateXor2 PORT MAP (dIn(6), sx6, cmp6O);
    cmp7: gateXor2 PORT MAP (dIn(7), sx7, cmp7O);
    or01: gateOr2 PORT MAP (cmp0O, cmp1O, or01O);
    or23: gateOr2 PORT MAP (cmp2O, cmp3O, or23O);
    or45: gateOr2 PORT MAP (cmp4O, cmp5O, or45O);
    or67: gateOr2 PORT MAP (cmp6O, cmp7O, or67O);
    or0123: gateOr2 PORT MAP(or01O, or23O, or0123O);
    or4567: gateOr2 PORT MAP(or45O, or67O, or4567O);
    orF: gateOr2 PORT MAP(or0123O, or4567O, err);
    dOut <= sx7 & sx6 & sx5 & sx4 & sx3 & sx2 & sx1 & sx0;
END structure;
