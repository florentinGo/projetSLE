
--------> ./rtl_funcs.vhd 
-----------------------------------------------------------------------
-- Package that declares synthesizable functions needed for RTL output
-----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

PACKAGE funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1: BOOLEAN) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGICVECTOR(arg1: STD_LOGIC) RETURN STD_LOGIC_VECTOR;

   FUNCTION maximum(arg1, arg2 : INTEGER) RETURN INTEGER;
   FUNCTION minimum(arg1, arg2 : INTEGER) RETURN INTEGER;
   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER;
   FUNCTION resolve_std_logic_vector(input1: STD_LOGIC_VECTOR; input2 : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- logic functions
-----------------------------------------------------------------

   FUNCTION and_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION or_s (inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION xor_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;

   FUNCTION and_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION or_v (inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION xor_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- mux functions
-----------------------------------------------------------------

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC       ) RETURN STD_LOGIC_VECTOR;
   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

   FUNCTION mux1hot_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION mux1hot_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- latch functions
-----------------------------------------------------------------
   FUNCTION lat_s(dinput: STD_LOGIC       ; clk: STD_LOGIC; doutput: STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION lat_v(dinput: STD_LOGIC_VECTOR; clk: STD_LOGIC; doutput: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- tristate functions
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput: STD_LOGIC       ; control: STD_LOGIC) RETURN STD_LOGIC;
--   FUNCTION tri_v(dinput: STD_LOGIC_VECTOR; control: STD_LOGIC) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "=" (l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "/="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "/="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<" (l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">" (l, r: SIGNED  ) RETURN STD_LOGIC;

   -- RETURN 2 bits (left => lt, right => eq)
   FUNCTION cmp (l, r: STD_LOGIC_VECTOR) RETURN STD_LOGIC;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   FUNCTION faccu(arg: UNSIGNED; width: NATURAL) RETURN UNSIGNED;

   FUNCTION fabs(arg1: SIGNED  ) RETURN UNSIGNED;

   FUNCTION "/"  (l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "MOD"(l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "REM"(l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "**" (l, r: UNSIGNED) RETURN UNSIGNED;

   FUNCTION "/"  (l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "MOD"(l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "REM"(l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "**" (l, r: SIGNED  ) RETURN SIGNED  ;

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-- *_stdar functions use shift functions from std_logic_arith
-----------------------------------------------------------------

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION frot(arg1: STD_LOGIC_VECTOR; arg2: STD_LOGIC_VECTOR; signd2: BOOLEAN; sdir: INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR;

   -----------------------------------------------------------------
   -- *_stdar functions use shift functions from std_logic_arith
   -----------------------------------------------------------------
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;

-----------------------------------------------------------------
-- indexing functions: LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec: STD_LOGIC_VECTOR; index: INTEGER                 ) RETURN STD_LOGIC;
   FUNCTION readslice(vec: STD_LOGIC_VECTOR; index: INTEGER; width: POSITIVE) RETURN STD_LOGIC_VECTOR;

   FUNCTION writeindex(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC       ; index: INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION n_bits(p: NATURAL) RETURN POSITIVE;
   --FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; index: INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; enable: STD_LOGIC_VECTOR; byte_width: INTEGER;  index: INTEGER) RETURN STD_LOGIC_VECTOR ;

   FUNCTION ceil_log2(size : NATURAL) return NATURAL;
   FUNCTION bits(size : NATURAL) return NATURAL;
END funcs;


--------------------------- B O D Y ----------------------------


PACKAGE BODY funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1: BOOLEAN) RETURN STD_LOGIC IS
     BEGIN IF arg1 THEN RETURN '1'; ELSE RETURN '0'; END IF; END;
   FUNCTION TO_STDLOGIC(arg1: STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;

   FUNCTION TO_STDLOGICVECTOR(arg1: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
     VARIABLE result: STD_LOGIC_VECTOR(0 DOWNTO 0);
   BEGIN
     result := (0 => arg1);
     RETURN result;
   END;

   FUNCTION maximum (arg1,arg2: INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 > arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION minimum (arg1,arg2: INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 < arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 = arg2) THEN
       RETURN(seleq) ;
     ELSE
       RETURN(selne) ;
     END IF;
   END;

   FUNCTION resolve_std_logic_vector(input1: STD_LOGIC_VECTOR; input2: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len: INTEGER := input1'length;
     ALIAS input1a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input1;
     ALIAS input2a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input2;
     VARIABLE result: STD_LOGIC_VECTOR(len-1 DOWNTO 0) := (others=>'0');
   BEGIN
     result := (others => '0');
--pragma translate_off
     FOR i IN len-1 DOWNTO 0 LOOP
       result(i) := resolved(input1a(i) & input2a(i));
     END LOOP;
--pragma translate_on
     RETURN result;
   END;

   FUNCTION resolve_unsigned(input1: UNSIGNED; input2: UNSIGNED) RETURN UNSIGNED IS
   BEGIN RETURN UNSIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

   FUNCTION resolve_signed(input1: SIGNED; input2: SIGNED) RETURN SIGNED IS
   BEGIN RETURN SIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

-----------------------------------------------------------------
-- Logic Functions
-----------------------------------------------------------------

   FUNCTION "not"(arg1: UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN UNSIGNED(not STD_LOGIC_VECTOR(arg1)); END;
   FUNCTION and_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(and_v(inputs, 1)); END;
   FUNCTION or_s (inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(or_v(inputs, 1)); END;
   FUNCTION xor_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(xor_v(inputs, 1)); END;

   FUNCTION and_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'length;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'length/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
--pragma translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
--pragma translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result AND inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

   FUNCTION or_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'length;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'length/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
--pragma translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
--pragma translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result OR inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

   FUNCTION xor_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'length;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'length/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
--pragma translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
--pragma translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result XOR inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

-----------------------------------------------------------------
-- Muxes
-----------------------------------------------------------------

   FUNCTION mux_sel2_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(1 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'length / 4;
     ALIAS    inputs0: STD_LOGIC_VECTOR( inputs'length-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector( size-1 DOWNTO 0):= (others=>'0') ;
   BEGIN
     -- synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "00" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "01" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "10" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "11" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN others =>
--pragma translate_off
       result := (others => '0');
--pragma translate_on
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_sel3_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(2 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'length / 8;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'length-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0) := (others=>'0');
   BEGIN
     -- synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "000" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "001" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "010" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "011" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN "100" =>
       result := inputs0(5*size-1 DOWNTO 4*size);
     WHEN "101" =>
       result := inputs0(6*size-1 DOWNTO 5*size);
     WHEN "110" =>
       result := inputs0(7*size-1 DOWNTO 6*size);
     WHEN "111" =>
       result := inputs0(8*size-1 DOWNTO 7*size);
     WHEN others =>
--pragma translate_off
       result := (others => '0');
--pragma translate_on
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_sel4_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(3 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'length / 16;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'length-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0) := (others => '0');
   BEGIN
     -- synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "0000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "0001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "0010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "0011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "0100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "0101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "0110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "0111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "1000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "1001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "1010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "1011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "1100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "1101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "1110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "1111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN others =>
--pragma translate_off
       result := (others => '0');
--pragma translate_on
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_sel5_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(4 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'length / 32;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'length-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0 ):= (others=>'0');
   BEGIN
     -- synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "00000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "00001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "00010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "00011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "00100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "00101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "00110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "00111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "01000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "01001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "01010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "01011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "01100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "01101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "01110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "01111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN "10000" =>
       result := inputs0( 17*size-1 DOWNTO 16*size);
     WHEN "10001" =>
       result := inputs0( 18*size-1 DOWNTO 17*size);
     WHEN "10010" =>
       result := inputs0( 19*size-1 DOWNTO 18*size);
     WHEN "10011" =>
       result := inputs0( 20*size-1 DOWNTO 19*size);
     WHEN "10100" =>
       result := inputs0( 21*size-1 DOWNTO 20*size);
     WHEN "10101" =>
       result := inputs0( 22*size-1 DOWNTO 21*size);
     WHEN "10110" =>
       result := inputs0( 23*size-1 DOWNTO 22*size);
     WHEN "10111" =>
       result := inputs0( 24*size-1 DOWNTO 23*size);
     WHEN "11000" =>
       result := inputs0( 25*size-1 DOWNTO 24*size);
     WHEN "11001" =>
       result := inputs0( 26*size-1 DOWNTO 25*size);
     WHEN "11010" =>
       result := inputs0( 27*size-1 DOWNTO 26*size);
     WHEN "11011" =>
       result := inputs0( 28*size-1 DOWNTO 27*size);
     WHEN "11100" =>
       result := inputs0( 29*size-1 DOWNTO 28*size);
     WHEN "11101" =>
       result := inputs0( 30*size-1 DOWNTO 29*size);
     WHEN "11110" =>
       result := inputs0( 31*size-1 DOWNTO 30*size);
     WHEN "11111" =>
       result := inputs0( 32*size-1 DOWNTO 31*size);
     WHEN others =>
--pragma translate_off
       result := (others => '0');
--pragma translate_on
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_sel6_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(5 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'length / 64;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'length-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0) := (others=>'0');
   BEGIN
     -- synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "000000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "000001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "000010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "000011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "000100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "000101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "000110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "000111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "001000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "001001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "001010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "001011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "001100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "001101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "001110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "001111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN "010000" =>
       result := inputs0( 17*size-1 DOWNTO 16*size);
     WHEN "010001" =>
       result := inputs0( 18*size-1 DOWNTO 17*size);
     WHEN "010010" =>
       result := inputs0( 19*size-1 DOWNTO 18*size);
     WHEN "010011" =>
       result := inputs0( 20*size-1 DOWNTO 19*size);
     WHEN "010100" =>
       result := inputs0( 21*size-1 DOWNTO 20*size);
     WHEN "010101" =>
       result := inputs0( 22*size-1 DOWNTO 21*size);
     WHEN "010110" =>
       result := inputs0( 23*size-1 DOWNTO 22*size);
     WHEN "010111" =>
       result := inputs0( 24*size-1 DOWNTO 23*size);
     WHEN "011000" =>
       result := inputs0( 25*size-1 DOWNTO 24*size);
     WHEN "011001" =>
       result := inputs0( 26*size-1 DOWNTO 25*size);
     WHEN "011010" =>
       result := inputs0( 27*size-1 DOWNTO 26*size);
     WHEN "011011" =>
       result := inputs0( 28*size-1 DOWNTO 27*size);
     WHEN "011100" =>
       result := inputs0( 29*size-1 DOWNTO 28*size);
     WHEN "011101" =>
       result := inputs0( 30*size-1 DOWNTO 29*size);
     WHEN "011110" =>
       result := inputs0( 31*size-1 DOWNTO 30*size);
     WHEN "011111" =>
       result := inputs0( 32*size-1 DOWNTO 31*size);
     WHEN "100000" =>
       result := inputs0( 33*size-1 DOWNTO 32*size);
     WHEN "100001" =>
       result := inputs0( 34*size-1 DOWNTO 33*size);
     WHEN "100010" =>
       result := inputs0( 35*size-1 DOWNTO 34*size);
     WHEN "100011" =>
       result := inputs0( 36*size-1 DOWNTO 35*size);
     WHEN "100100" =>
       result := inputs0( 37*size-1 DOWNTO 36*size);
     WHEN "100101" =>
       result := inputs0( 38*size-1 DOWNTO 37*size);
     WHEN "100110" =>
       result := inputs0( 39*size-1 DOWNTO 38*size);
     WHEN "100111" =>
       result := inputs0( 40*size-1 DOWNTO 39*size);
     WHEN "101000" =>
       result := inputs0( 41*size-1 DOWNTO 40*size);
     WHEN "101001" =>
       result := inputs0( 42*size-1 DOWNTO 41*size);
     WHEN "101010" =>
       result := inputs0( 43*size-1 DOWNTO 42*size);
     WHEN "101011" =>
       result := inputs0( 44*size-1 DOWNTO 43*size);
     WHEN "101100" =>
       result := inputs0( 45*size-1 DOWNTO 44*size);
     WHEN "101101" =>
       result := inputs0( 46*size-1 DOWNTO 45*size);
     WHEN "101110" =>
       result := inputs0( 47*size-1 DOWNTO 46*size);
     WHEN "101111" =>
       result := inputs0( 48*size-1 DOWNTO 47*size);
     WHEN "110000" =>
       result := inputs0( 49*size-1 DOWNTO 48*size);
     WHEN "110001" =>
       result := inputs0( 50*size-1 DOWNTO 49*size);
     WHEN "110010" =>
       result := inputs0( 51*size-1 DOWNTO 50*size);
     WHEN "110011" =>
       result := inputs0( 52*size-1 DOWNTO 51*size);
     WHEN "110100" =>
       result := inputs0( 53*size-1 DOWNTO 52*size);
     WHEN "110101" =>
       result := inputs0( 54*size-1 DOWNTO 53*size);
     WHEN "110110" =>
       result := inputs0( 55*size-1 DOWNTO 54*size);
     WHEN "110111" =>
       result := inputs0( 56*size-1 DOWNTO 55*size);
     WHEN "111000" =>
       result := inputs0( 57*size-1 DOWNTO 56*size);
     WHEN "111001" =>
       result := inputs0( 58*size-1 DOWNTO 57*size);
     WHEN "111010" =>
       result := inputs0( 59*size-1 DOWNTO 58*size);
     WHEN "111011" =>
       result := inputs0( 60*size-1 DOWNTO 59*size);
     WHEN "111100" =>
       result := inputs0( 61*size-1 DOWNTO 60*size);
     WHEN "111101" =>
       result := inputs0( 62*size-1 DOWNTO 61*size);
     WHEN "111110" =>
       result := inputs0( 63*size-1 DOWNTO 62*size);
     WHEN "111111" =>
       result := inputs0( 64*size-1 DOWNTO 63*size);
     WHEN others =>
--pragma translate_off
       result := (others => '0');
--pragma translate_on
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS  --pragma hls_map_to_operator mux
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'length-1 DOWNTO 0) IS inputs;
     CONSTANT size   : POSITIVE := inputs'length / 2;
     CONSTANT olen   : POSITIVE := inputs'length / 2;
     VARIABLE result : STD_LOGIC_VECTOR(olen-1 DOWNTO 0) := (others=>'0');
   BEGIN
--pragma translate_off
     ASSERT inputs'length = olen * 2 SEVERITY FAILURE;
--pragma translate_on
       CASE sel IS
       WHEN '1' | 'H' =>
         result := inputs0( size-1 DOWNTO 0);
       WHEN '0' | 'L' =>
         result := inputs0(2*size-1  DOWNTO size);
       WHEN others =>
--pragma translate_off
         result := resolve_std_logic_vector(inputs0(size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
--pragma translate_on
       END CASE;
       RETURN result;
   END;
--   BEGIN RETURN mux_v(inputs, TO_STDLOGICVECTOR(sel)); END;

   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS --pragma hls_map_to_operator mux
     ALIAS    inputs0: STD_LOGIC_VECTOR( inputs'length-1 DOWNTO 0) IS inputs;
     ALIAS    sel0   : STD_LOGIC_VECTOR( sel'length-1 DOWNTO 0 ) IS sel;

     VARIABLE sellen : INTEGER RANGE 2-sel'length TO sel'length;
     CONSTANT size   : POSITIVE := inputs'length / 2;
     CONSTANT olen   : POSITIVE := inputs'length / 2**sel'length;
     VARIABLE result : STD_LOGIC_VECTOR(olen-1 DOWNTO 0):= (others=>'0');
     TYPE inputs_array_type is array(natural range <>) of std_logic_vector( olen - 1 DOWNTO 0);
     VARIABLE inputs_array : inputs_array_type( 2**sel'length - 1 DOWNTO 0);
   BEGIN
     sellen := sel'length;
--pragma translate_off
     ASSERT inputs'length = olen * 2**sellen SEVERITY FAILURE;
     sellen := 2-sellen;
--pragma translate_on
     CASE sellen IS
     WHEN 1 =>
       CASE sel0(0) IS

       WHEN '1' | 'H' =>
         result := inputs0(  size-1 DOWNTO 0);
       WHEN '0' | 'L' =>
         result := inputs0(2*size-1 DOWNTO size);
       WHEN others =>
--pragma translate_off
         result := resolve_std_logic_vector(inputs0( size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
--pragma translate_on
       END CASE;
     WHEN 2 =>
       result := mux_sel2_v(inputs, not sel);
     WHEN 3 =>
       result := mux_sel3_v(inputs, not sel);
     WHEN 4 =>
       result := mux_sel4_v(inputs, not sel);
     WHEN 5 =>
       result := mux_sel5_v(inputs, not sel);
     WHEN 6 =>
       result := mux_sel6_v(inputs, not sel);
     WHEN others =>
-- pragma translate_off
       IF(Is_X(sel0)) THEN
         result := (others => '0');
       ELSE
-- pragma translate_on
         FOR i in 0 to 2**sel'length - 1 LOOP
           inputs_array(i) := inputs0( ((i + 1) * olen) - 1  DOWNTO i*olen);
         END LOOP;
         result := inputs_array(CONV_INTEGER( (UNSIGNED(NOT sel0)) ));
-- pragma translate_off
       END IF;
-- pragma translate_on
     END CASE;
     RETURN result;
   END;

-----------------------------------------------------------------
-- 1-hot Multipexors
-----------------------------------------------------------------

   FUNCTION mux1hot_sel4_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(3 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'length / 4;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'length-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0) := (others=>'0');
   BEGIN
     -- synthesis only
     -- simulation inconsistent with input values 'UXZHLWD'
     CASE sel IS
     WHEN "1000" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "0100" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "0010" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "0001" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN others =>
       result := (others => '0');
     END CASE;
     RETURN result;
   END;

   FUNCTION mux1hot_sel16_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(15 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'length / 16;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'length-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- synthesis only
     -- simulation inconsistent with input values 'UXZHLWD'
     CASE sel IS
     WHEN "1000000000000000" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "0100000000000000" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "0010000000000000" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "0001000000000000" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN "0000100000000000" =>
       result := inputs0(5*size-1 DOWNTO 4*size);
     WHEN "0000010000000000" =>
       result := inputs0(6*size-1 DOWNTO 5*size);
     WHEN "0000001000000000" =>
       result := inputs0(7*size-1 DOWNTO 6*size);
     WHEN "0000000100000000" =>
       result := inputs0(8*size-1 DOWNTO 7*size);
     WHEN "0000000010000000" =>
       result := inputs0(9*size-1 DOWNTO 8*size);
     WHEN "0000000001000000" =>
       result := inputs0(10*size-1 DOWNTO 9*size);
     WHEN "0000000000100000" =>
       result := inputs0(11*size-1 DOWNTO 10*size);
     WHEN "0000000000010000" =>
       result := inputs0(12*size-1 DOWNTO 11*size);
     WHEN "0000000000001000" =>
       result := inputs0(13*size-1 DOWNTO 12*size);
     WHEN "0000000000000100" =>
       result := inputs0(14*size-1 DOWNTO 13*size);
     WHEN "0000000000000010" =>
       result := inputs0(15*size-1 DOWNTO 14*size);
     WHEN "0000000000000001" =>
       result := inputs0(16*size-1 DOWNTO 15*size);
     WHEN others =>
       result := (others => '0');
     END CASE;
     RETURN result;
   END;

   FUNCTION mux1hot_sel64_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(63 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'length / 64;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'length-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- synthesis only
     -- simulation inconsistent with input values 'UXZHLWD'
     CASE sel IS
     WHEN "1000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "0100000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "0010000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "0001000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN "0000100000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(5*size-1 DOWNTO 4*size);
     WHEN "0000010000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(6*size-1 DOWNTO 5*size);
     WHEN "0000001000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(7*size-1 DOWNTO 6*size);
     WHEN "0000000100000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(8*size-1 DOWNTO 7*size);
     WHEN "0000000010000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(9*size-1 DOWNTO 8*size);
     WHEN "0000000001000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(10*size-1 DOWNTO 9*size);
     WHEN "0000000000100000000000000000000000000000000000000000000000000000" =>
       result := inputs0(11*size-1 DOWNTO 10*size);
     WHEN "0000000000010000000000000000000000000000000000000000000000000000" =>
       result := inputs0(12*size-1 DOWNTO 11*size);
     WHEN "0000000000001000000000000000000000000000000000000000000000000000" =>
       result := inputs0(13*size-1 DOWNTO 12*size);
     WHEN "0000000000000100000000000000000000000000000000000000000000000000" =>
       result := inputs0(14*size-1 DOWNTO 13*size);
     WHEN "0000000000000010000000000000000000000000000000000000000000000000" =>
       result := inputs0(15*size-1 DOWNTO 14*size);
     WHEN "0000000000000001000000000000000000000000000000000000000000000000" =>
       result := inputs0(16*size-1 DOWNTO 15*size);
     WHEN "0000000000000000100000000000000000000000000000000000000000000000" =>
       result := inputs0(17*size-1 DOWNTO 16*size);
     WHEN "0000000000000000010000000000000000000000000000000000000000000000" =>
       result := inputs0(18*size-1 DOWNTO 17*size);
     WHEN "0000000000000000001000000000000000000000000000000000000000000000" =>
       result := inputs0(19*size-1 DOWNTO 18*size);
     WHEN "0000000000000000000100000000000000000000000000000000000000000000" =>
       result := inputs0(20*size-1 DOWNTO 19*size);
     WHEN "0000000000000000000010000000000000000000000000000000000000000000" =>
       result := inputs0(21*size-1 DOWNTO 20*size);
     WHEN "0000000000000000000001000000000000000000000000000000000000000000" =>
       result := inputs0(22*size-1 DOWNTO 21*size);
     WHEN "0000000000000000000000100000000000000000000000000000000000000000" =>
       result := inputs0(23*size-1 DOWNTO 22*size);
     WHEN "0000000000000000000000010000000000000000000000000000000000000000" =>
       result := inputs0(24*size-1 DOWNTO 23*size);
     WHEN "0000000000000000000000001000000000000000000000000000000000000000" =>
       result := inputs0(25*size-1 DOWNTO 24*size);
     WHEN "0000000000000000000000000100000000000000000000000000000000000000" =>
       result := inputs0(26*size-1 DOWNTO 25*size);
     WHEN "0000000000000000000000000010000000000000000000000000000000000000" =>
       result := inputs0(27*size-1 DOWNTO 26*size);
     WHEN "0000000000000000000000000001000000000000000000000000000000000000" =>
       result := inputs0(28*size-1 DOWNTO 27*size);
     WHEN "0000000000000000000000000000100000000000000000000000000000000000" =>
       result := inputs0(29*size-1 DOWNTO 28*size);
     WHEN "0000000000000000000000000000010000000000000000000000000000000000" =>
       result := inputs0(30*size-1 DOWNTO 29*size);
     WHEN "0000000000000000000000000000001000000000000000000000000000000000" =>
       result := inputs0(31*size-1 DOWNTO 30*size);
     WHEN "0000000000000000000000000000000100000000000000000000000000000000" =>
       result := inputs0(32*size-1 DOWNTO 31*size);
     WHEN "0000000000000000000000000000000010000000000000000000000000000000" =>
       result := inputs0(33*size-1 DOWNTO 32*size);
     WHEN "0000000000000000000000000000000001000000000000000000000000000000" =>
       result := inputs0(34*size-1 DOWNTO 33*size);
     WHEN "0000000000000000000000000000000000100000000000000000000000000000" =>
       result := inputs0(35*size-1 DOWNTO 34*size);
     WHEN "0000000000000000000000000000000000010000000000000000000000000000" =>
       result := inputs0(36*size-1 DOWNTO 35*size);
     WHEN "0000000000000000000000000000000000001000000000000000000000000000" =>
       result := inputs0(37*size-1 DOWNTO 36*size);
     WHEN "0000000000000000000000000000000000000100000000000000000000000000" =>
       result := inputs0(38*size-1 DOWNTO 37*size);
     WHEN "0000000000000000000000000000000000000010000000000000000000000000" =>
       result := inputs0(39*size-1 DOWNTO 38*size);
     WHEN "0000000000000000000000000000000000000001000000000000000000000000" =>
       result := inputs0(40*size-1 DOWNTO 39*size);
     WHEN "0000000000000000000000000000000000000000100000000000000000000000" =>
       result := inputs0(41*size-1 DOWNTO 40*size);
     WHEN "0000000000000000000000000000000000000000010000000000000000000000" =>
       result := inputs0(42*size-1 DOWNTO 41*size);
     WHEN "0000000000000000000000000000000000000000001000000000000000000000" =>
       result := inputs0(43*size-1 DOWNTO 42*size);
     WHEN "0000000000000000000000000000000000000000000100000000000000000000" =>
       result := inputs0(44*size-1 DOWNTO 43*size);
     WHEN "0000000000000000000000000000000000000000000010000000000000000000" =>
       result := inputs0(45*size-1 DOWNTO 44*size);
     WHEN "0000000000000000000000000000000000000000000001000000000000000000" =>
       result := inputs0(46*size-1 DOWNTO 45*size);
     WHEN "0000000000000000000000000000000000000000000000100000000000000000" =>
       result := inputs0(47*size-1 DOWNTO 46*size);
     WHEN "0000000000000000000000000000000000000000000000010000000000000000" =>
       result := inputs0(48*size-1 DOWNTO 47*size);
     WHEN "0000000000000000000000000000000000000000000000001000000000000000" =>
       result := inputs0(49*size-1 DOWNTO 48*size);
     WHEN "0000000000000000000000000000000000000000000000000100000000000000" =>
       result := inputs0(50*size-1 DOWNTO 49*size);
     WHEN "0000000000000000000000000000000000000000000000000010000000000000" =>
       result := inputs0(51*size-1 DOWNTO 50*size);
     WHEN "0000000000000000000000000000000000000000000000000001000000000000" =>
       result := inputs0(52*size-1 DOWNTO 51*size);
     WHEN "0000000000000000000000000000000000000000000000000000100000000000" =>
       result := inputs0(53*size-1 DOWNTO 52*size);
     WHEN "0000000000000000000000000000000000000000000000000000010000000000" =>
       result := inputs0(54*size-1 DOWNTO 53*size);
     WHEN "0000000000000000000000000000000000000000000000000000001000000000" =>
       result := inputs0(55*size-1 DOWNTO 54*size);
     WHEN "0000000000000000000000000000000000000000000000000000000100000000" =>
       result := inputs0(56*size-1 DOWNTO 55*size);
     WHEN "0000000000000000000000000000000000000000000000000000000010000000" =>
       result := inputs0(57*size-1 DOWNTO 56*size);
     WHEN "0000000000000000000000000000000000000000000000000000000001000000" =>
       result := inputs0(58*size-1 DOWNTO 57*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000100000" =>
       result := inputs0(59*size-1 DOWNTO 58*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000010000" =>
       result := inputs0(60*size-1 DOWNTO 59*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000001000" =>
       result := inputs0(61*size-1 DOWNTO 60*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000100" =>
       result := inputs0(62*size-1 DOWNTO 61*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000010" =>
       result := inputs0(63*size-1 DOWNTO 62*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000001" =>
       result := inputs0(64*size-1 DOWNTO 63*size);
     WHEN others =>
       result := (others => '0');
     END CASE;
     RETURN result;
   END;


   FUNCTION mux1hot_sel256_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(255 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'length / 256;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'length-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     CASE sel IS
     WHEN "1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "0010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "0001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN "0000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(5*size-1 DOWNTO 4*size);
     WHEN "0000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(6*size-1 DOWNTO 5*size);
     WHEN "0000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(7*size-1 DOWNTO 6*size);
     WHEN "0000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(8*size-1 DOWNTO 7*size);
     WHEN "0000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(9*size-1 DOWNTO 8*size);
     WHEN "0000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(10*size-1 DOWNTO 9*size);
     WHEN "0000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(11*size-1 DOWNTO 10*size);
     WHEN "0000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(12*size-1 DOWNTO 11*size);
     WHEN "0000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(13*size-1 DOWNTO 12*size);
     WHEN "0000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(14*size-1 DOWNTO 13*size);
     WHEN "0000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(15*size-1 DOWNTO 14*size);
     WHEN "0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(16*size-1 DOWNTO 15*size);
     WHEN "0000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(17*size-1 DOWNTO 16*size);
     WHEN "0000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(18*size-1 DOWNTO 17*size);
     WHEN "0000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(19*size-1 DOWNTO 18*size);
     WHEN "0000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(20*size-1 DOWNTO 19*size);
     WHEN "0000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(21*size-1 DOWNTO 20*size);
     WHEN "0000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(22*size-1 DOWNTO 21*size);
     WHEN "0000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(23*size-1 DOWNTO 22*size);
     WHEN "0000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(24*size-1 DOWNTO 23*size);
     WHEN "0000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(25*size-1 DOWNTO 24*size);
     WHEN "0000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(26*size-1 DOWNTO 25*size);
     WHEN "0000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(27*size-1 DOWNTO 26*size);
     WHEN "0000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(28*size-1 DOWNTO 27*size);
     WHEN "0000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(29*size-1 DOWNTO 28*size);
     WHEN "0000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(30*size-1 DOWNTO 29*size);
     WHEN "0000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(31*size-1 DOWNTO 30*size);
     WHEN "0000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(32*size-1 DOWNTO 31*size);
     WHEN "0000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(33*size-1 DOWNTO 32*size);
     WHEN "0000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(34*size-1 DOWNTO 33*size);
     WHEN "0000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(35*size-1 DOWNTO 34*size);
     WHEN "0000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(36*size-1 DOWNTO 35*size);
     WHEN "0000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(37*size-1 DOWNTO 36*size);
     WHEN "0000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(38*size-1 DOWNTO 37*size);
     WHEN "0000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(39*size-1 DOWNTO 38*size);
     WHEN "0000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(40*size-1 DOWNTO 39*size);
     WHEN "0000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(41*size-1 DOWNTO 40*size);
     WHEN "0000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(42*size-1 DOWNTO 41*size);
     WHEN "0000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(43*size-1 DOWNTO 42*size);
     WHEN "0000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(44*size-1 DOWNTO 43*size);
     WHEN "0000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(45*size-1 DOWNTO 44*size);
     WHEN "0000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(46*size-1 DOWNTO 45*size);
     WHEN "0000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(47*size-1 DOWNTO 46*size);
     WHEN "0000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(48*size-1 DOWNTO 47*size);
     WHEN "0000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(49*size-1 DOWNTO 48*size);
     WHEN "0000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(50*size-1 DOWNTO 49*size);
     WHEN "0000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(51*size-1 DOWNTO 50*size);
     WHEN "0000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(52*size-1 DOWNTO 51*size);
     WHEN "0000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(53*size-1 DOWNTO 52*size);
     WHEN "0000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(54*size-1 DOWNTO 53*size);
     WHEN "0000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(55*size-1 DOWNTO 54*size);
     WHEN "0000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(56*size-1 DOWNTO 55*size);
     WHEN "0000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(57*size-1 DOWNTO 56*size);
     WHEN "0000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(58*size-1 DOWNTO 57*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(59*size-1 DOWNTO 58*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(60*size-1 DOWNTO 59*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(61*size-1 DOWNTO 60*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(62*size-1 DOWNTO 61*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(63*size-1 DOWNTO 62*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(64*size-1 DOWNTO 63*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(65*size-1 DOWNTO 64*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(66*size-1 DOWNTO 65*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(67*size-1 DOWNTO 66*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(68*size-1 DOWNTO 67*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(69*size-1 DOWNTO 68*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(70*size-1 DOWNTO 69*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(71*size-1 DOWNTO 70*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(72*size-1 DOWNTO 71*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(73*size-1 DOWNTO 72*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(74*size-1 DOWNTO 73*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(75*size-1 DOWNTO 74*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(76*size-1 DOWNTO 75*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(77*size-1 DOWNTO 76*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(78*size-1 DOWNTO 77*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(79*size-1 DOWNTO 78*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(80*size-1 DOWNTO 79*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(81*size-1 DOWNTO 80*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(82*size-1 DOWNTO 81*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(83*size-1 DOWNTO 82*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(84*size-1 DOWNTO 83*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(85*size-1 DOWNTO 84*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(86*size-1 DOWNTO 85*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(87*size-1 DOWNTO 86*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(88*size-1 DOWNTO 87*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(89*size-1 DOWNTO 88*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(90*size-1 DOWNTO 89*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(91*size-1 DOWNTO 90*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(92*size-1 DOWNTO 91*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(93*size-1 DOWNTO 92*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(94*size-1 DOWNTO 93*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(95*size-1 DOWNTO 94*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(96*size-1 DOWNTO 95*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(97*size-1 DOWNTO 96*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(98*size-1 DOWNTO 97*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(99*size-1 DOWNTO 98*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(100*size-1 DOWNTO 99*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(101*size-1 DOWNTO 100*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(102*size-1 DOWNTO 101*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(103*size-1 DOWNTO 102*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(104*size-1 DOWNTO 103*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(105*size-1 DOWNTO 104*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(106*size-1 DOWNTO 105*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(107*size-1 DOWNTO 106*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(108*size-1 DOWNTO 107*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(109*size-1 DOWNTO 108*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(110*size-1 DOWNTO 109*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(111*size-1 DOWNTO 110*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(112*size-1 DOWNTO 111*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(113*size-1 DOWNTO 112*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(114*size-1 DOWNTO 113*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(115*size-1 DOWNTO 114*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(116*size-1 DOWNTO 115*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(117*size-1 DOWNTO 116*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(118*size-1 DOWNTO 117*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(119*size-1 DOWNTO 118*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(120*size-1 DOWNTO 119*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(121*size-1 DOWNTO 120*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(122*size-1 DOWNTO 121*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(123*size-1 DOWNTO 122*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(124*size-1 DOWNTO 123*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(125*size-1 DOWNTO 124*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(126*size-1 DOWNTO 125*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(127*size-1 DOWNTO 126*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(128*size-1 DOWNTO 127*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(129*size-1 DOWNTO 128*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(130*size-1 DOWNTO 129*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(131*size-1 DOWNTO 130*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(132*size-1 DOWNTO 131*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(133*size-1 DOWNTO 132*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(134*size-1 DOWNTO 133*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(135*size-1 DOWNTO 134*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(136*size-1 DOWNTO 135*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(137*size-1 DOWNTO 136*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(138*size-1 DOWNTO 137*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(139*size-1 DOWNTO 138*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(140*size-1 DOWNTO 139*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(141*size-1 DOWNTO 140*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(142*size-1 DOWNTO 141*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(143*size-1 DOWNTO 142*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(144*size-1 DOWNTO 143*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(145*size-1 DOWNTO 144*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(146*size-1 DOWNTO 145*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(147*size-1 DOWNTO 146*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(148*size-1 DOWNTO 147*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(149*size-1 DOWNTO 148*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(150*size-1 DOWNTO 149*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(151*size-1 DOWNTO 150*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(152*size-1 DOWNTO 151*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(153*size-1 DOWNTO 152*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(154*size-1 DOWNTO 153*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(155*size-1 DOWNTO 154*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(156*size-1 DOWNTO 155*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(157*size-1 DOWNTO 156*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(158*size-1 DOWNTO 157*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(159*size-1 DOWNTO 158*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(160*size-1 DOWNTO 159*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(161*size-1 DOWNTO 160*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(162*size-1 DOWNTO 161*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(163*size-1 DOWNTO 162*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(164*size-1 DOWNTO 163*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(165*size-1 DOWNTO 164*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(166*size-1 DOWNTO 165*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(167*size-1 DOWNTO 166*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(168*size-1 DOWNTO 167*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(169*size-1 DOWNTO 168*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(170*size-1 DOWNTO 169*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(171*size-1 DOWNTO 170*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(172*size-1 DOWNTO 171*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(173*size-1 DOWNTO 172*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(174*size-1 DOWNTO 173*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(175*size-1 DOWNTO 174*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(176*size-1 DOWNTO 175*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(177*size-1 DOWNTO 176*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(178*size-1 DOWNTO 177*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(179*size-1 DOWNTO 178*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(180*size-1 DOWNTO 179*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(181*size-1 DOWNTO 180*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(182*size-1 DOWNTO 181*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(183*size-1 DOWNTO 182*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(184*size-1 DOWNTO 183*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(185*size-1 DOWNTO 184*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(186*size-1 DOWNTO 185*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(187*size-1 DOWNTO 186*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(188*size-1 DOWNTO 187*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(189*size-1 DOWNTO 188*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(190*size-1 DOWNTO 189*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(191*size-1 DOWNTO 190*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(192*size-1 DOWNTO 191*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(193*size-1 DOWNTO 192*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(194*size-1 DOWNTO 193*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(195*size-1 DOWNTO 194*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(196*size-1 DOWNTO 195*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(197*size-1 DOWNTO 196*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(198*size-1 DOWNTO 197*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(199*size-1 DOWNTO 198*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(200*size-1 DOWNTO 199*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(201*size-1 DOWNTO 200*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000" =>
       result := inputs0(202*size-1 DOWNTO 201*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000" =>
       result := inputs0(203*size-1 DOWNTO 202*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000" =>
       result := inputs0(204*size-1 DOWNTO 203*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000" =>
       result := inputs0(205*size-1 DOWNTO 204*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000" =>
       result := inputs0(206*size-1 DOWNTO 205*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000" =>
       result := inputs0(207*size-1 DOWNTO 206*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000" =>
       result := inputs0(208*size-1 DOWNTO 207*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000" =>
       result := inputs0(209*size-1 DOWNTO 208*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000" =>
       result := inputs0(210*size-1 DOWNTO 209*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000" =>
       result := inputs0(211*size-1 DOWNTO 210*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000" =>
       result := inputs0(212*size-1 DOWNTO 211*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000" =>
       result := inputs0(213*size-1 DOWNTO 212*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000" =>
       result := inputs0(214*size-1 DOWNTO 213*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000" =>
       result := inputs0(215*size-1 DOWNTO 214*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000" =>
       result := inputs0(216*size-1 DOWNTO 215*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000" =>
       result := inputs0(217*size-1 DOWNTO 216*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000" =>
       result := inputs0(218*size-1 DOWNTO 217*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000" =>
       result := inputs0(219*size-1 DOWNTO 218*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000" =>
       result := inputs0(220*size-1 DOWNTO 219*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000" =>
       result := inputs0(221*size-1 DOWNTO 220*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000" =>
       result := inputs0(222*size-1 DOWNTO 221*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000" =>
       result := inputs0(223*size-1 DOWNTO 222*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000" =>
       result := inputs0(224*size-1 DOWNTO 223*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000" =>
       result := inputs0(225*size-1 DOWNTO 224*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000" =>
       result := inputs0(226*size-1 DOWNTO 225*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000" =>
       result := inputs0(227*size-1 DOWNTO 226*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000" =>
       result := inputs0(228*size-1 DOWNTO 227*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000" =>
       result := inputs0(229*size-1 DOWNTO 228*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000" =>
       result := inputs0(230*size-1 DOWNTO 229*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000" =>
       result := inputs0(231*size-1 DOWNTO 230*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000" =>
       result := inputs0(232*size-1 DOWNTO 231*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000" =>
       result := inputs0(233*size-1 DOWNTO 232*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000" =>
       result := inputs0(234*size-1 DOWNTO 233*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000" =>
       result := inputs0(235*size-1 DOWNTO 234*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000" =>
       result := inputs0(236*size-1 DOWNTO 235*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000" =>
       result := inputs0(237*size-1 DOWNTO 236*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000" =>
       result := inputs0(238*size-1 DOWNTO 237*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000" =>
       result := inputs0(239*size-1 DOWNTO 238*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000" =>
       result := inputs0(240*size-1 DOWNTO 239*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000" =>
       result := inputs0(241*size-1 DOWNTO 240*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000" =>
       result := inputs0(242*size-1 DOWNTO 241*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000" =>
       result := inputs0(243*size-1 DOWNTO 242*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000" =>
       result := inputs0(244*size-1 DOWNTO 243*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000" =>
       result := inputs0(245*size-1 DOWNTO 244*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000" =>
       result := inputs0(246*size-1 DOWNTO 245*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000" =>
       result := inputs0(247*size-1 DOWNTO 246*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000" =>
       result := inputs0(248*size-1 DOWNTO 247*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000" =>
       result := inputs0(249*size-1 DOWNTO 248*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000" =>
       result := inputs0(250*size-1 DOWNTO 249*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000" =>
       result := inputs0(251*size-1 DOWNTO 250*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000" =>
       result := inputs0(252*size-1 DOWNTO 251*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000" =>
       result := inputs0(253*size-1 DOWNTO 252*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100" =>
       result := inputs0(254*size-1 DOWNTO 253*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010" =>
       result := inputs0(255*size-1 DOWNTO 254*size);
     WHEN "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001" =>
       result := inputs0(256*size-1 DOWNTO 255*size);
     WHEN others =>
       result := (others => '0');
     END CASE;
     RETURN result;
   END;




   FUNCTION mux1hot_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux1hot_v(inputs, sel)); END;

   FUNCTION mux1hot_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS --pragma hls_map_to_operator mux1h
     CONSTANT size       : POSITIVE := inputs'length / sel'length;
     CONSTANT sellen2    : NATURAL := sel'length / 2;
     ALIAS    inputs0    : STD_LOGIC_VECTOR(inputs'length-1 DOWNTO 0) IS inputs;
     ALIAS    sel0       : STD_LOGIC_VECTOR(sel'length-1 DOWNTO 0) IS sel;
     CONSTANT max_ext    : POSITIVE := 256;
     VARIABLE sellen     : NATURAL;
     VARIABLE inputs_ext : STD_LOGIC_VECTOR(max_ext*size-1 DOWNTO 0);
     VARIABLE sel_ext    : STD_LOGIC_VECTOR(max_ext-1 DOWNTO 0);
     VARIABLE result     : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
     VARIABLE assigned   : BOOLEAN := FALSE;
     VARIABLE cmpval     : STD_LOGIC_VECTOR(sel'length-1 DOWNTO 0);
   BEGIN
     sellen := sel'length;
--pragma translate_off
     ASSERT inputs'length = sel'length * size SEVERITY FAILURE;
     sellen := max_ext + 1;
--pragma translate_on
     IF sellen2 = 0 THEN
       result := inputs;
     ELSIF sellen <= max_ext THEN
       inputs_ext(inputs'length-1 DOWNTO 0) := inputs;
       sel_ext := (others => '0');
       sel_ext(sel'length-1 DOWNTO 0) := sel;
       IF sel'length <= 4 THEN
         result := mux1hot_sel4_v(inputs_ext(4*size-1 DOWNTO 0), sel_ext(3 DOWNTO 0));
       ELSIF sel'length <= 16 THEN
         result := mux1hot_sel16_v(inputs_ext(16*size-1 DOWNTO 0), sel_ext(15 DOWNTO 0));
       ELSIF sel'length <= 64 THEN
         result := mux1hot_sel64_v(inputs_ext(64*size-1 DOWNTO 0), sel_ext(63 DOWNTO 0));
       ELSE
         result := mux1hot_sel256_v(inputs_ext(256*size-1 DOWNTO 0), sel_ext(255 DOWNTO 0));
       END IF;
     ELSE
       -- Please be careful about placing the translate_off/on directives
       -- The following code till the translate_off directive IS required for
       -- synthesis of 1hot muxes with control width > 256
       result := (others => '0');
       FOR i in 0 to sel'length - 1 LOOP
         cmpval := (others => '0');
         cmpval(i) := '1';
	 IF ( sel0 = cmpval ) THEN
	   result := inputs0( (i + 1)*size-1 DOWNTO i*size );
	   assigned := TRUE;
	 END IF;
       END LOOP;
-- pragma translate_off
       IF NOT assigned THEN -- Strictly for simulation purpose
         result := (others => 'Z');
         FOR i IN 0 to sel'length - 1 LOOP
           IF sel0(i) = '1' THEN
             result := resolve_std_logic_vector(result, inputs0( ((i+1)*size-1) DOWNTO i*size ));
             assigned := TRUE;
           END IF;
         END LOOP;
         IF NOT assigned THEN
           result := (others => '0');
         END IF;
       END IF;
-- pragma translate_on
     END IF;
     RETURN result;
   END;

-----------------------------------------------------------------
-- Latches
-----------------------------------------------------------------

   FUNCTION lat_s(dinput: STD_LOGIC; clk: STD_LOGIC; doutput: STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN mux_s(STD_LOGIC_VECTOR'(doutput & dinput), clk); END;

   FUNCTION lat_v(dinput: STD_LOGIC_VECTOR ; clk: STD_LOGIC; doutput: STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR IS
   BEGIN
--pragma translate_off
     ASSERT dinput'length = doutput'length SEVERITY FAILURE;
--pragma translate_on
     RETURN mux_v(doutput & dinput, clk);
   END;

-----------------------------------------------------------------
-- Tri-States
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput: STD_LOGIC; control: STD_LOGIC) RETURN STD_LOGIC IS
--   BEGIN RETURN TO_STDLOGIC(tri_v(TO_STDLOGICVECTOR(dinput), control)); END;
--
--   FUNCTION tri_v(dinput: STD_LOGIC_VECTOR ; control: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
--     VARIABLE result: STD_LOGIC_VECTOR(dinput'range);
--   BEGIN
--     CASE control IS
--     WHEN '0' | 'L' =>
--       result := (others => 'Z');
--     WHEN '1' | 'H' =>
--       FOR i IN dinput'range LOOP
--         result(i) := to_UX01(dinput(i));
--       END LOOP;
--     WHEN others =>
---- pragma translate_off
--       result := (others => '0');
---- pragma translate_on
--     END CASE;
--     RETURN result;
--   END;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;

   FUNCTION "<" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     VARIABLE diff: UNSIGNED(l'length DOWNTO 0);
   BEGIN
--pragma translate_off
     ASSERT l'length = r'length SEVERITY FAILURE;
--pragma translate_on
     diff := ('0'&l) - ('0'&r);
     RETURN diff(l'length);
   END;
   FUNCTION "<"(l, r: SIGNED  ) RETURN STD_LOGIC IS
   BEGIN
     RETURN (UNSIGNED(l) < UNSIGNED(r)) xor (l(l'left) xor r(r'left));
   END;

   FUNCTION "<="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION "<=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION ">" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">"(l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;
   FUNCTION ">=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;

   FUNCTION cmp (l, r: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN
--pragma translate_off
     ASSERT l'length = r'length SEVERITY FAILURE;
--pragma translate_on
     RETURN not or_s(l xor r);
   END;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   --some functions to placate spyglass
   FUNCTION mult_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a*b;
   END mult_natural;

   FUNCTION div_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a/b;
   END div_natural;

   FUNCTION mod_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a mod b;
   END mod_natural;

   FUNCTION add_unsigned(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a+b;
   END add_unsigned;

   FUNCTION sub_unsigned(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a-b;
   END sub_unsigned;

   FUNCTION sub_int(a,b : INTEGER) RETURN INTEGER IS
   BEGIN
     return a-b;
   END sub_int;

   FUNCTION concat_0(b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return '0' & b;
   END concat_0;

   FUNCTION concat_uns(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a&b;
   END concat_uns;

   FUNCTION concat_vect(a,b : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
   BEGIN
     return a&b;
   END concat_vect;





   FUNCTION faccu(arg: UNSIGNED; width: NATURAL) RETURN UNSIGNED IS
     CONSTANT ninps : NATURAL := arg'length / width;
     ALIAS    arg0  : UNSIGNED(arg'length-1 DOWNTO 0) IS arg;
     VARIABLE result: UNSIGNED(width-1 DOWNTO 0);
     VARIABLE from  : INTEGER;
     VARIABLE dto   : INTEGER;
   BEGIN
--pragma translate_off
     ASSERT arg'length = width * ninps SEVERITY FAILURE;
--pragma translate_on
     result := (OTHERS => '0');
     FOR i IN ninps-1 DOWNTO 0 LOOP
       --result := result + arg0((i+1)*width-1 DOWNTO i*width);
       from := mult_natural((i+1), width)-1; --2.1.6.3
       dto  := mult_natural(i,width); --2.1.6.3
       result := add_unsigned(result , arg0(from DOWNTO dto) );
     END LOOP;
     RETURN result;
   END faccu;

   FUNCTION  fabs (arg1: SIGNED) RETURN UNSIGNED IS
   BEGIN
     CASE arg1(arg1'left) IS
     WHEN '1' | 'H' =>
       RETURN UNSIGNED'("0") - UNSIGNED(arg1);
     WHEN '0' | 'L' =>
       RETURN UNSIGNED(arg1);
     WHEN others =>
       RETURN resolve_unsigned(UNSIGNED(arg1), UNSIGNED'("0") - UNSIGNED(arg1));
     END CASE;
   END;

   PROCEDURE divmod(l, r: UNSIGNED; rdiv, rmod: OUT UNSIGNED) IS
     CONSTANT llen: INTEGER := l'length;
     CONSTANT rlen: INTEGER := r'length;
     CONSTANT llen_plus_rlen: INTEGER := llen + rlen;
     VARIABLE lbuf: UNSIGNED(llen+rlen-1 DOWNTO 0);
     VARIABLE diff: UNSIGNED(rlen DOWNTO 0);
   BEGIN
--pragma translate_off
     ASSERT rdiv'length = llen AND rmod'length = rlen SEVERITY FAILURE;
--pragma translate_on
     lbuf := (others => '0');
     lbuf(llen-1 DOWNTO 0) := l;
     FOR i IN rdiv'range LOOP
       diff := sub_unsigned(lbuf(llen_plus_rlen-1 DOWNTO llen-1) ,(concat_0(r)));
       rdiv(i) := not diff(rlen);
       IF diff(rlen) = '0' THEN
         lbuf(llen_plus_rlen-1 DOWNTO llen-1) := diff;
       END IF;
       lbuf(llen_plus_rlen-1 DOWNTO 1) := lbuf(llen_plus_rlen-2 DOWNTO 0);
     END LOOP;
     rmod := lbuf(llen_plus_rlen-1 DOWNTO llen);
   END divmod;

   FUNCTION "/"  (l, r: UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv: UNSIGNED(l'length-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'length-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rdiv;
   END "/";

   FUNCTION "MOD"(l, r: UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv: UNSIGNED(l'length-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'length-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rmod;
   END;

   FUNCTION "REM"(l, r: UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN l MOD r; END;

   FUNCTION "/"  (l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'length-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'length-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'left)) /= to_X01(r(r'left)) THEN
       rdiv := UNSIGNED'("0") - rdiv;
     END IF;
     RETURN SIGNED(rdiv); -- overflow problem "1000" / "11"
   END "/";

   FUNCTION "MOD"(l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'length-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'length-1 DOWNTO 0);
     CONSTANT rnul: UNSIGNED(r'length-1 DOWNTO 0) := (others => '0');
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'left)) = '1' THEN
       rmod := UNSIGNED'("0") - rmod;
     END IF;
     IF rmod /= rnul AND to_X01(l(l'left)) /= to_X01(r(r'left)) THEN
       rmod := UNSIGNED(r) + rmod;
     END IF;
     RETURN SIGNED(rmod);
   END "MOD";

   FUNCTION "REM"(l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'length-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'length-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'left)) = '1' THEN
       rmod := UNSIGNED'("0") - rmod;
     END IF;
     RETURN SIGNED(rmod);
   END "REM";

   FUNCTION mult_unsigned(l,r : UNSIGNED) return UNSIGNED is
   BEGIN
     return l*r;
   END mult_unsigned;

   FUNCTION "**" (l, r : UNSIGNED) RETURN UNSIGNED IS
     CONSTANT llen  : NATURAL := l'length;
     VARIABLE result: UNSIGNED(llen-1 DOWNTO 0);
     VARIABLE fak   : UNSIGNED(llen-1 DOWNTO 0);
   BEGIN
     fak := l;
     result := (others => '0'); result(0) := '1';
     FOR i IN r'reverse_range LOOP
       --was:result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(result & (result*fak)), r(i)));
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR( concat_uns(result , mult_unsigned(result,fak) )), r(i)));

       fak := mult_unsigned(fak , fak);
     END LOOP;
     RETURN result;
   END "**";

   FUNCTION "**" (l, r : SIGNED) RETURN SIGNED IS
     CONSTANT rlen  : NATURAL := r'length;
     ALIAS    r0    : SIGNED(0 TO r'length-1) IS r;
     VARIABLE result: SIGNED(l'range);
   BEGIN
     CASE r(r'left) IS
     WHEN '0' | 'L' =>
       result := SIGNED(UNSIGNED(l) ** UNSIGNED(r0(1 TO r'length-1)));
     WHEN '1' | 'H' =>
       result := (others => '0');
     WHEN others =>
       result := (others => '0');
     END CASE;
     RETURN result;
   END "**";

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-----------------------------------------------------------------

   FUNCTION add_nat(arg1 : NATURAL; arg2 : NATURAL ) RETURN NATURAL IS
   BEGIN
     return (arg1 + arg2);
   END;

--   FUNCTION UNSIGNED_2_BIT_VECTOR(arg1 : NATURAL; arg2 : NATURAL ) RETURN BIT_VECTOR IS
--   BEGIN
--     return (arg1 + arg2);
--   END;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'length;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'length-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT ilen: INTEGER := arg1'length;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'length-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(SIGNED(result), arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'length;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'length-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT ilen: INTEGER := arg1'length;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'length-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l: NATURAL := arg1'length - 1;
     ALIAS    arg1x: UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'length - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0) := (others=>'0');
   BEGIN
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0' | 'L' =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1' | 'H' =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
--pragma translate_off
         result := resolve_unsigned(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
--pragma translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1: SIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT arg1l: NATURAL := arg1'length - 1;
     ALIAS    arg1x: SIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'length - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: SIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: SIGNED(olen-1 DOWNTO 0) := (others=>'0');
   BEGIN
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0' | 'L' =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1' | 'H' =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
--pragma translate_off
         result := resolve_signed(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
--pragma translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l: INTEGER := arg2'length - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0) := (others => '0');
   BEGIN
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0' | 'L' =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1' | 'H' =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
--pragma translate_off
         result := resolve_unsigned(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
--pragma translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1: SIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT arg2l: INTEGER := arg2'length - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: SIGNED(olen-1 DOWNTO 0) := (others => '0');
   BEGIN
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0' | 'L' =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1' | 'H' =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
--pragma translate_off
         result := resolve_signed(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
--pragma translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;

   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'left), olen); END;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'left), olen); END;
   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'left), olen); END;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'left), olen); END;


   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'length;
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp: UNSIGNED(len-1 DOWNTO 0);
     --SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw: NATURAL range 1 TO len;
     VARIABLE temp_idx : INTEGER; --2.1.6.3
   BEGIN
     sw := 1;
     result := (others => sbit);
     result(ilen-1 DOWNTO 0) := arg1;
     FOR i IN arg2'reverse_range LOOP
       temp := (others => '0');
       FOR i2 IN len-1-sw DOWNTO 0 LOOP
         --was:temp(i2+sw) := result(i2);
         temp_idx := add_nat(i2,sw);
         temp(temp_idx) := result(i2);
       END LOOP;
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(concat_uns(result,temp)), arg2(i)));
       sw := minimum(mult_natural(sw,2), len);
     END LOOP;
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'length;
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp: UNSIGNED(len-1 DOWNTO 0);
     SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw: sw_range;
     VARIABLE result_idx : INTEGER; --2.1.6.3
   BEGIN
     sw := 1;
     result := (others => sbit);
     result(ilen-1 DOWNTO 0) := arg1;
     FOR i IN arg2'reverse_range LOOP
       temp := (others => sbit);
       FOR i2 IN len-1-sw DOWNTO 0 LOOP
         -- was: temp(i2) := result(i2+sw);
         result_idx := add_nat(i2,sw);
         temp(i2) := result(result_idx);
       END LOOP;
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(concat_uns(result,temp)), arg2(i)));
       sw := minimum(mult_natural(sw,2), len);
     END LOOP;
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l: NATURAL := arg1'length - 1;
     ALIAS    arg1x: UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'length - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0) := (others=>'0');
   BEGIN
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0' | 'L' =>
         RETURN fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1' | 'H' =>
         RETURN fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
--pragma translate_off
         result := resolve_unsigned(
           fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
--pragma translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l: INTEGER := arg2'length - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0) := (others => '0');
   BEGIN
     IF arg2l = 0 THEN
       RETURN fshl(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0' | 'L' =>
         RETURN fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1' | 'H' =>
         RETURN fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
--pragma translate_off
         result := resolve_unsigned(
           fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
--pragma translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;

   FUNCTION fshl(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'left), olen)); END;
   FUNCTION fshr(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'left), olen)); END;
   FUNCTION fshl(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'left), olen)); END;
   FUNCTION fshr(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'left), olen)); END;


   FUNCTION frot(arg1: STD_LOGIC_VECTOR; arg2: STD_LOGIC_VECTOR; signd2: BOOLEAN; sdir: INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len: INTEGER := arg1'length;
     VARIABLE result: STD_LOGIC_VECTOR(len-1 DOWNTO 0):= (others=>'0');
     VARIABLE temp: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     SUBTYPE sw_range IS NATURAL range 0 TO len-1;
     VARIABLE sw: sw_range;
     VARIABLE temp_idx : INTEGER; --2.1.6.3
   BEGIN
     result := arg1;
     sw := sdir MOD len;
     FOR i IN arg2'reverse_range LOOP
       EXIT WHEN sw = 0;
       IF signd2 AND i = arg2'left THEN
         sw := sub_int(len,sw);
       END IF;
       -- temp := result(len-sw-1 DOWNTO 0) & result(len-1 DOWNTO len-sw)
       FOR i2 IN len-1 DOWNTO 0 LOOP
         --was: temp((i2+sw) MOD len) := result(i2);
         temp_idx := add_nat(i2,sw) MOD len;
         temp(temp_idx) := result(i2);
       END LOOP;
       result := mux_v(STD_LOGIC_VECTOR(concat_vect(result,temp)), arg2(i));
       sw := mod_natural(mult_natural(sw,2), len);
     END LOOP;
     RETURN result;
   END frot;

   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, 1); END;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, -1); END;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, 1); END;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, -1); END;

-----------------------------------------------------------------
-- indexing functions: LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec: STD_LOGIC_VECTOR; index: INTEGER                 ) RETURN STD_LOGIC IS
     CONSTANT len : INTEGER := vec'length;
     ALIAS    vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
   BEGIN
     IF index >= len OR index < 0 THEN
       RETURN '0';
     END IF;
     RETURN vec0(index);
   END;

   FUNCTION readslice(vec: STD_LOGIC_VECTOR; index: INTEGER; width: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len : INTEGER := vec'length;
     CONSTANT indexPwidthM1 : INTEGER := index+width-1; --2.1.6.3
     ALIAS    vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
     CONSTANT xxx : STD_LOGIC_VECTOR(width-1 DOWNTO 0) := (others => '0');
   BEGIN
     IF index+width > len OR index < 0 THEN
       RETURN xxx;
     END IF;
     RETURN vec0(indexPwidthM1 DOWNTO index);
   END;

   FUNCTION writeindex(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC       ; index: INTEGER) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len : INTEGER := vec'length;
     VARIABLE vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     CONSTANT xxx : STD_LOGIC_VECTOR(len-1 DOWNTO 0) := (others => '0');
   BEGIN
     vec0 := vec;
     IF index >= len OR index < 0 THEN
       RETURN xxx;
     END IF;
     vec0(index) := dinput;
     RETURN vec0;
   END;

   FUNCTION n_bits(p: NATURAL) RETURN POSITIVE IS
     VARIABLE n_b : POSITIVE;
     VARIABLE p_v : NATURAL;
   BEGIN
     p_v := p;
     FOR i IN 1 TO 32 LOOP
       p_v := div_natural(p_v,2);
       n_b := i;
       EXIT WHEN (p_v = 0);
     END LOOP;
     RETURN n_b;
   END;


--   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; index: INTEGER) RETURN STD_LOGIC_VECTOR IS
--
--     CONSTANT vlen: INTEGER := vec'length;
--     CONSTANT ilen: INTEGER := dinput'length;
--     CONSTANT max_shift: INTEGER := vlen-ilen;
--     CONSTANT ones: UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
--     CONSTANT xxx : STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => '0');
--     VARIABLE shift : UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
--     VARIABLE vec0: STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
--     VARIABLE inp: UNSIGNED(vlen-1 DOWNTO 0);
--     VARIABLE mask: UNSIGNED(vlen-1 DOWNTO 0);
--   BEGIN
--     inp := (others => '0');
--     mask := (others => '0');
--
--     IF index > max_shift OR index < 0 THEN
--       RETURN xxx;
--     END IF;
--
--     shift := CONV_UNSIGNED(index, shift'length);
--     inp(ilen-1 DOWNTO 0) := UNSIGNED(dinput);
--     mask(ilen-1 DOWNTO 0) := ones;
--     inp := fshl(inp, shift, vlen);
--     mask := fshl(mask, shift, vlen);
--     vec0 := (vec and (not STD_LOGIC_VECTOR(mask))) or STD_LOGIC_VECTOR(inp);
--     RETURN vec0;
--   END;

   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; enable: STD_LOGIC_VECTOR; byte_width: INTEGER;  index: INTEGER) RETURN STD_LOGIC_VECTOR IS

     type enable_matrix is array (0 to enable'length-1 ) of std_logic_vector(byte_width-1 downto 0);
     CONSTANT vlen: INTEGER := vec'length;
     CONSTANT ilen: INTEGER := dinput'length;
     CONSTANT max_shift: INTEGER := vlen-ilen;
     CONSTANT ones: UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
     CONSTANT xxx : STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => '0');
     VARIABLE shift : UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
     VARIABLE vec0: STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
     VARIABLE inp: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask2: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE enables: enable_matrix;
     VARIABLE cat_enables: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0 ) := (others => '0');
     VARIABLE lsbi : INTEGER := 0;
     VARIABLE msbi : INTEGER := byte_width-1;

   BEGIN
     inp := (others => '0');
     mask := (others => '0');

     IF index > max_shift OR index < 0 THEN
       RETURN xxx;
     END IF;

     --initialize enables
     for i in 0 TO (enable'length-1) loop
       enables(i)  := (others => enable(i));
       cat_enables(msbi downto lsbi) := enables(i) ;
       lsbi := msbi+1;
       msbi := msbi+byte_width;
     end loop;


     shift := CONV_UNSIGNED(index, shift'length);
     inp(ilen-1 DOWNTO 0) := UNSIGNED(dinput);
     mask(ilen-1 DOWNTO 0) := UNSIGNED((STD_LOGIC_VECTOR(ones) AND cat_enables));
     inp := fshl(inp, shift, vlen);
     mask := fshl(mask, shift, vlen);
     vec0 := (vec and (not STD_LOGIC_VECTOR(mask))) or STD_LOGIC_VECTOR(inp);
     RETURN vec0;
   END;


   FUNCTION ceil_log2(size : NATURAL) return NATURAL is
     VARIABLE cnt : NATURAL := 1;
     VARIABLE res : NATURAL := 0;
   begin
     while (cnt < size) loop
       res := res + 1;
       cnt := 2 * cnt;
     end loop;
     return res;
   END;

   FUNCTION bits(size : NATURAL) return NATURAL is
   begin
     return ceil_log2(size);
   END;

END funcs;

--------> ./rtl_mux_pkg.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    2011a.200 Production Release
--  HLS Date:       Mon Jun  2 22:10:04 PDT 2014
-- 
--  Generated by:   xph3sle512@cimeld21
--  Generated date: Wed Feb  1 14:06:17 2017
-- ----------------------------------------------------------------------

-- 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;

PACKAGE Main_Only_Comp_Decomp_Main_Fonction_mux_pkg IS 
  FUNCTION MUX_s_1_2_2(inputs : STD_LOGIC_VECTOR(1 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC;
  FUNCTION MUX_v_8_2_2(inputs : STD_LOGIC_VECTOR(15 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_32_2_2(inputs : STD_LOGIC_VECTOR(63 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_9_2_2(inputs : STD_LOGIC_VECTOR(17 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_8_6_2(inputs : STD_LOGIC_VECTOR(47 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_17_7_2(inputs : STD_LOGIC_VECTOR(118 DOWNTO 0); sel : STD_LOGIC_VECTOR(6
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_9_6_2(inputs : STD_LOGIC_VECTOR(53 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_32_3_2(inputs : STD_LOGIC_VECTOR(95 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_64_3_2(inputs : STD_LOGIC_VECTOR(191 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_8_3_2(inputs : STD_LOGIC_VECTOR(23 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_8_4_2(inputs : STD_LOGIC_VECTOR(31 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_15_2_2(inputs : STD_LOGIC_VECTOR(29 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_17_3_2(inputs : STD_LOGIC_VECTOR(50 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_23_2_2(inputs : STD_LOGIC_VECTOR(45 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_9_3_2(inputs : STD_LOGIC_VECTOR(26 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_s_1_3_2(inputs : STD_LOGIC_VECTOR(2 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX_v_64_2_2(inputs : STD_LOGIC_VECTOR(127 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_16_2_2(inputs : STD_LOGIC_VECTOR(31 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_14_2_2(inputs : STD_LOGIC_VECTOR(27 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_s_1_4_2(inputs : STD_LOGIC_VECTOR(3 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_s_1_5_2(inputs : STD_LOGIC_VECTOR(4 DOWNTO 0); sel : STD_LOGIC_VECTOR(4
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX_v_67_2_2(inputs : STD_LOGIC_VECTOR(133 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_17_2_2(inputs : STD_LOGIC_VECTOR(33 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_16_3_2(inputs : STD_LOGIC_VECTOR(47 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_32_5_2(inputs : STD_LOGIC_VECTOR(159 DOWNTO 0); sel : STD_LOGIC_VECTOR(4
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_3_2_2(inputs : STD_LOGIC_VECTOR(5 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_64_5_2(inputs : STD_LOGIC_VECTOR(319 DOWNTO 0); sel : STD_LOGIC_VECTOR(4
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_6_3_2(inputs : STD_LOGIC_VECTOR(17 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_7_3_2(inputs : STD_LOGIC_VECTOR(20 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_17_8_2(inputs : STD_LOGIC_VECTOR(135 DOWNTO 0); sel : STD_LOGIC_VECTOR(7
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_32_4_2(inputs : STD_LOGIC_VECTOR(127 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_15_3_2(inputs : STD_LOGIC_VECTOR(44 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_7_2_2(inputs : STD_LOGIC_VECTOR(13 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_32_9_2(inputs : STD_LOGIC_VECTOR(287 DOWNTO 0); sel : STD_LOGIC_VECTOR(8
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_18_2_2(inputs : STD_LOGIC_VECTOR(35 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_22_5_2(inputs : STD_LOGIC_VECTOR(109 DOWNTO 0); sel : STD_LOGIC_VECTOR(4
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
END Main_Only_Comp_Decomp_Main_Fonction_mux_pkg;

PACKAGE BODY Main_Only_Comp_Decomp_Main_Fonction_mux_pkg IS
FUNCTION MUX_s_1_2_2(inputs : STD_LOGIC_VECTOR(1 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(1 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := TO_STDLOGIC(inputs(0 DOWNTO 0));
      WHEN '0' =>
        result := TO_STDLOGIC(inputs(1 DOWNTO 1));
      WHEN others =>
        result := '0';
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := TO_STDLOGIC(inputs((i+1)*1-1 DOWNTO i*1));
            result_new := '0';
          ELSE
            result := resolved(result & TO_STDLOGIC(inputs((i+1)*1-1 DOWNTO i*1)));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_8_2_2(inputs : STD_LOGIC_VECTOR(15 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(15 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(7 DOWNTO 0);
      WHEN '0' =>
        result := inputs(15 DOWNTO 8);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*8-1 DOWNTO i*8);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*8-1 DOWNTO i*8));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_32_2_2(inputs : STD_LOGIC_VECTOR(63 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(63 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(31 DOWNTO 0);
      WHEN '0' =>
        result := inputs(63 DOWNTO 32);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*32-1 DOWNTO i*32);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*32-1 DOWNTO i*32));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_9_2_2(inputs : STD_LOGIC_VECTOR(17 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(17 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(8 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(8 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(8 DOWNTO 0);
      WHEN '0' =>
        result := inputs(17 DOWNTO 9);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*9-1 DOWNTO i*9);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*9-1 DOWNTO i*9));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_v_8_6_2(inputs : STD_LOGIC_VECTOR(47 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(47 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 7 DOWNTO 0) and tmp;
    FOR i in 1 TO 5 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*8-1 DOWNTO i*8) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_17_7_2(inputs : STD_LOGIC_VECTOR(118 DOWNTO 0); sel : STD_LOGIC_VECTOR(6
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(118 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(16 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(16 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 16 DOWNTO 0) and tmp;
    FOR i in 1 TO 6 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*17-1 DOWNTO i*17) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_9_6_2(inputs : STD_LOGIC_VECTOR(53 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(53 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(8 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(8 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 8 DOWNTO 0) and tmp;
    FOR i in 1 TO 5 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*9-1 DOWNTO i*9) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_32_3_2(inputs : STD_LOGIC_VECTOR(95 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(95 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 31 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*32-1 DOWNTO i*32) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_64_3_2(inputs : STD_LOGIC_VECTOR(191 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(191 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(63 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(63 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 63 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*64-1 DOWNTO i*64) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_8_3_2(inputs : STD_LOGIC_VECTOR(23 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(23 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 7 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*8-1 DOWNTO i*8) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_8_4_2(inputs : STD_LOGIC_VECTOR(31 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 7 DOWNTO 0) and tmp;
    FOR i in 1 TO 3 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*8-1 DOWNTO i*8) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX_v_15_2_2(inputs : STD_LOGIC_VECTOR(29 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(29 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(14 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(14 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(14 DOWNTO 0);
      WHEN '0' =>
        result := inputs(29 DOWNTO 15);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*15-1 DOWNTO i*15);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*15-1 DOWNTO i*15));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_v_17_3_2(inputs : STD_LOGIC_VECTOR(50 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(50 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(16 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(16 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 16 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*17-1 DOWNTO i*17) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX_v_23_2_2(inputs : STD_LOGIC_VECTOR(45 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(45 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(22 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(22 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(22 DOWNTO 0);
      WHEN '0' =>
        result := inputs(45 DOWNTO 23);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*23-1 DOWNTO i*23);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*23-1 DOWNTO i*23));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_v_9_3_2(inputs : STD_LOGIC_VECTOR(26 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(26 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(8 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(8 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 8 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*9-1 DOWNTO i*9) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_3_2(inputs : STD_LOGIC_VECTOR(2 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(2 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX_v_64_2_2(inputs : STD_LOGIC_VECTOR(127 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(127 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(63 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(63 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(63 DOWNTO 0);
      WHEN '0' =>
        result := inputs(127 DOWNTO 64);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*64-1 DOWNTO i*64);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*64-1 DOWNTO i*64));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_16_2_2(inputs : STD_LOGIC_VECTOR(31 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(15 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(15 DOWNTO 0);
      WHEN '0' =>
        result := inputs(31 DOWNTO 16);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*16-1 DOWNTO i*16);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*16-1 DOWNTO i*16));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_14_2_2(inputs : STD_LOGIC_VECTOR(27 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(27 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(13 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(13 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(13 DOWNTO 0);
      WHEN '0' =>
        result := inputs(27 DOWNTO 14);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*14-1 DOWNTO i*14);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*14-1 DOWNTO i*14));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_4_2(inputs : STD_LOGIC_VECTOR(3 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(3 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 3 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_5_2(inputs : STD_LOGIC_VECTOR(4 DOWNTO 0); sel : STD_LOGIC_VECTOR(4
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(4 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 4 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX_v_67_2_2(inputs : STD_LOGIC_VECTOR(133 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(133 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(66 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(66 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(66 DOWNTO 0);
      WHEN '0' =>
        result := inputs(133 DOWNTO 67);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*67-1 DOWNTO i*67);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*67-1 DOWNTO i*67));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_17_2_2(inputs : STD_LOGIC_VECTOR(33 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(33 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(16 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(16 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(16 DOWNTO 0);
      WHEN '0' =>
        result := inputs(33 DOWNTO 17);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*17-1 DOWNTO i*17);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*17-1 DOWNTO i*17));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_v_16_3_2(inputs : STD_LOGIC_VECTOR(47 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(47 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(15 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 15 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*16-1 DOWNTO i*16) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_32_5_2(inputs : STD_LOGIC_VECTOR(159 DOWNTO 0); sel : STD_LOGIC_VECTOR(4
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(159 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 31 DOWNTO 0) and tmp;
    FOR i in 1 TO 4 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*32-1 DOWNTO i*32) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX_v_3_2_2(inputs : STD_LOGIC_VECTOR(5 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(5 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(2 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(2 DOWNTO 0);
      WHEN '0' =>
        result := inputs(5 DOWNTO 3);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*3-1 DOWNTO i*3);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*3-1 DOWNTO i*3));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_v_64_5_2(inputs : STD_LOGIC_VECTOR(319 DOWNTO 0); sel : STD_LOGIC_VECTOR(4
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(319 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(63 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(63 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 63 DOWNTO 0) and tmp;
    FOR i in 1 TO 4 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*64-1 DOWNTO i*64) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_6_3_2(inputs : STD_LOGIC_VECTOR(17 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(17 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(5 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(5 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 5 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*6-1 DOWNTO i*6) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_7_3_2(inputs : STD_LOGIC_VECTOR(20 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(20 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 6 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*7-1 DOWNTO i*7) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_17_8_2(inputs : STD_LOGIC_VECTOR(135 DOWNTO 0); sel : STD_LOGIC_VECTOR(7
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(135 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(16 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(16 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 16 DOWNTO 0) and tmp;
    FOR i in 1 TO 7 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*17-1 DOWNTO i*17) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_32_4_2(inputs : STD_LOGIC_VECTOR(127 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(127 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 31 DOWNTO 0) and tmp;
    FOR i in 1 TO 3 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*32-1 DOWNTO i*32) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_15_3_2(inputs : STD_LOGIC_VECTOR(44 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(44 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(14 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(14 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 14 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*15-1 DOWNTO i*15) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX_v_7_2_2(inputs : STD_LOGIC_VECTOR(13 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(13 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(6 DOWNTO 0);
      WHEN '0' =>
        result := inputs(13 DOWNTO 7);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*7-1 DOWNTO i*7);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*7-1 DOWNTO i*7));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_v_32_9_2(inputs : STD_LOGIC_VECTOR(287 DOWNTO 0); sel : STD_LOGIC_VECTOR(8
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(287 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 31 DOWNTO 0) and tmp;
    FOR i in 1 TO 8 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*32-1 DOWNTO i*32) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX_v_18_2_2(inputs : STD_LOGIC_VECTOR(35 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(35 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(17 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(17 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(17 DOWNTO 0);
      WHEN '0' =>
        result := inputs(35 DOWNTO 18);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*18-1 DOWNTO i*18);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*18-1 DOWNTO i*18));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_v_22_5_2(inputs : STD_LOGIC_VECTOR(109 DOWNTO 0); sel : STD_LOGIC_VECTOR(4
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(109 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(21 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(21 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 21 DOWNTO 0) and tmp;
    FOR i in 1 TO 4 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*22-1 DOWNTO i*22) and tmp);
    END LOOP;
  RETURN result;
END;

END Main_Only_Comp_Decomp_Main_Fonction_mux_pkg;



--------> ./rtl_mgc_ioport.vhd 

--------------------------------------------------------------------
--                M G C _ I O P O R T _ C O M P S
--------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE mgc_ioport_comps IS

-- INPUT COMPONENTS

COMPONENT mgc_in_wire
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_in_wire_en
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_in_wire_wait
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
   );
END COMPONENT;

COMPONENT mgc_chan_in
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0);
    size     : OUT std_logic_vector(sz_width-1 DOWNTO 0);
    req_size : IN  std_logic;
    sizez    : IN std_logic_vector(sz_width-1 DOWNTO 0);
    sizelz   : OUT std_logic
   );
END COMPONENT;

COMPONENT mgc_in_wire_wait_nb
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0);
    size     : OUT   std_logic_vector(sz_width-1 DOWNTO 0);
    req_size : in    std_logic
  );
END COMPONENT;

-- OUTPUT COMPONENTS

COMPONENT mgc_out_stdreg
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_stdreg_en
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;


COMPONENT mgc_out_stdreg_wait
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_reg_pos
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_reg_neg
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_reg
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_buf_wait
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_fifo_wait
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER;
    pwropt   : INTEGER RANGE 0 TO 2 := 0
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

-- implementation for mgc_out_fifo_wait
COMPONENT mgc_out_fifo_wait_core
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER;
    pwropt   : INTEGER RANGE 0 TO 2 := 0
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0);
    size     : OUT std_logic_vector(sz_width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_prereg_en
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

-- INOUT COMPONENTS

COMPONENT mgc_inout_stdreg_en
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ldin     : IN    std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    lzout    : OUT   std_logic;
    z        : INOUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_inout_stdreg_wait
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    z        : INOUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_hid_tribuf
  GENERIC (
    width    : INTEGER
  );
  PORT (
    I_SIG    : IN     std_logic_vector(width-1 DOWNTO 0);
    ENABLE   : IN     boolean ;
    O_SIG    : OUT    std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_inout_buf_wait
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    z        : INOUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_inout_fifo_wait
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER;
    pwropt   : INTEGER RANGE 0 TO 2 := 0
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    z        : INOUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

-- IO SYNCHRONIZATION

COMPONENT mgc_io_sync
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END COMPONENT;

COMPONENT mgc_bsync_rdy
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    rd       : IN    std_logic;
    rz       : OUT   std_logic
  );
END COMPONENT;

COMPONENT mgc_bsync_vld
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    vd       : OUT   std_logic;
    vz       : IN    std_logic
  );
END COMPONENT;

COMPONENT mgc_bsync_rv
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    rd       : IN    std_logic;
    vd       : OUT   std_logic;
    rz       : OUT   std_logic;
    vz       : IN    std_logic
  );
END COMPONENT;

-- PIPE

COMPONENT mgc_pipe
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER;
    fifo_sz  : INTEGER;
    log2_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    pwropt   : INTEGER RANGE 0 TO 2 := 0
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    size     : OUT   std_logic_vector(sz_width-1 DOWNTO 0);
    req_size : in    std_logic
  );
END COMPONENT;

COMPONENT mgc_sync
  PORT (
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic
  );
END COMPONENT;

-- The start of the asynch CDC components
COMPONENT mgc_regfile_pos
generic
(
  data_width   : integer;
  addr_width   : integer;
  num_of_words : integer;
  ph_en        : integer RANGE 0 to 1;
  ph_arst      : integer RANGE 0 to 1;
  ph_srst      : integer RANGE 0 to 1
);
port
(
  clk           : IN  std_logic;
  arst          : IN  std_logic;
  srst          : IN  std_logic;
  en            : IN  std_logic;
  write_en      : IN  std_logic;
  write_address : IN  std_logic_vector (addr_width - 1 downto 0);
  write_data    : IN  std_logic_vector (data_width - 1 downto 0);
  read_address  : IN  std_logic_vector (addr_width - 1 downto 0);
  read_data     : OUT std_logic_vector (data_width - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_regfile_neg
generic
(
  data_width   : integer;
  addr_width   : integer;
  num_of_words : integer;
  ph_en        : integer RANGE 0 to 1;
  ph_arst      : integer RANGE 0 to 1;
  ph_srst      : integer RANGE 0 to 1
);
port
(
  clk           : IN  std_logic;
  arst          : IN  std_logic;
  srst          : IN  std_logic;
  en            : IN  std_logic;
  write_en      : IN  std_logic;
  write_address : IN  std_logic_vector (addr_width - 1 downto 0);
  write_data    : IN  std_logic_vector (data_width - 1 downto 0);
  read_address  : IN  std_logic_vector (addr_width - 1 downto 0);
  read_data     : OUT std_logic_vector (data_width - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_regfile
generic
(
  data_width   : integer;
  addr_width   : integer;
  num_of_words : integer;
  ph_clk       : integer RANGE 0 TO 1;
  ph_en        : integer RANGE 0 to 1;
  ph_arst      : integer RANGE 0 to 1;
  ph_srst      : integer RANGE 0 to 1
);
port
(
  clk           : IN  std_logic;
  arst          : IN  std_logic;
  srst          : IN  std_logic;
  en            : IN  std_logic;
  write_en      : IN  std_logic;
  write_address : IN  std_logic_vector (addr_width - 1 downto 0);
  write_data    : IN  std_logic_vector (data_width - 1 downto 0);
  read_address  : IN  std_logic_vector (addr_width - 1 downto 0);
  read_data     : OUT std_logic_vector (data_width - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_in_ram
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  re_active         : integer;
  num_byte_enables  : integer;
  no_of_ports       : integer
);
port
(
 d  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 ad : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 bd : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 z  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 az : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 bz : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_out_ram
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  re_active         : integer;
  num_byte_enables  : integer;
  no_of_ports       : integer
);
port
(
 d  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 ad : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 bd : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 z  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 az : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 bz : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_inout_ram
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  re_active         : integer;
  we_active         : integer;
  num_byte_enables  : integer;
  no_of_ports       : integer
);
port
(
 id  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 od  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 ad  : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rd  : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 wd  : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 iz  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 oz  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 az  : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rz  : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0);
 wz  : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END COMPONENT;


COMPONENT funccall_inout
generic
(
  ram_id           : integer;
  width           : integer;  -- models the concat of the return value (data)
  addr_width      : integer  -- models the concat of the input arguments (addr)
);
port
(
  d  : out  STD_LOGIC_VECTOR(width - 1 downto 0);
  ad : in  STD_LOGIC_VECTOR(addr_width - 1 downto 0) ;
  bd : in  STD_LOGIC;
  z  : in  STD_LOGIC_VECTOR(width - 1 downto 0);
  az : out  STD_LOGIC_VECTOR(addr_width - 1 downto 0) ;
  bz : out  STD_LOGIC
);
END COMPONENT;

COMPONENT modulario_en_in
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
   );
END COMPONENT;


END mgc_ioport_comps;


--------------------------------------------------------------------
--                        E N T I T I E S
--------------------------------------------------------------------

-----------------
-- INPUT ENTITIES
-----------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_in_wire IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_in_wire;

ARCHITECTURE beh OF mgc_in_wire IS
BEGIN

  d <= z;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_in_wire_en IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_in_wire_en;

ARCHITECTURE beh OF mgc_in_wire_en IS
BEGIN

  lz <= ld;
  d  <= z;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_in_wire_wait IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_in_wire_wait;

ARCHITECTURE beh OF mgc_in_wire_wait IS
BEGIN

  lz <= ld;
  vd <= vz;
  d  <= z;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_chan_in IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0);
    size     : OUT std_logic_vector(sz_width-1 DOWNTO 0);
    req_size : IN  std_logic;
    sizez    : IN std_logic_vector(sz_width-1 DOWNTO 0);
    sizelz   : OUT std_logic
  );
END mgc_chan_in;

ARCHITECTURE beh OF mgc_chan_in IS
BEGIN

  lz <= ld;
  vd <= vz;
  d  <= z;
  size <= sizez;
  sizelz <= req_size;

END beh;


------------------
-- OUTPUT ENTITIES
------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_out_stdreg IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_stdreg;

ARCHITECTURE beh OF mgc_out_stdreg IS
BEGIN

  z <= d;

End beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_out_stdreg_en IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_stdreg_en;

ARCHITECTURE beh OF mgc_out_stdreg_en IS
BEGIN

  lz <= ld;
  z  <= d;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_out_stdreg_wait IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_stdreg_wait;

ARCHITECTURE beh OF mgc_out_stdreg_wait IS
BEGIN

  lz   <= ld;
  vd   <= vz;
  z    <= d;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_out_reg_pos IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_reg_pos;

ARCHITECTURE beh OF mgc_out_reg_pos IS
BEGIN

  PROCESS ( clk, arst )
  BEGIN
    IF conv_integer(arst) = ph_arst THEN
      lz <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF conv_integer(srst) = ph_srst THEN
        lz <= '0';
      ELSIF conv_integer(en) = ph_en THEN
        lz <= ld;
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( clk, arst )
  BEGIN
    IF conv_integer(arst) = ph_arst THEN
      z  <= (others => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF conv_integer(srst) = ph_srst THEN
        z  <= (others => '0');
      ELSIF (conv_integer(en) = ph_en) AND (conv_integer(ld) = 1) THEN
        z <= d;
      END IF;
    END IF;
  END PROCESS;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_out_reg_neg IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_reg_neg;

ARCHITECTURE beh OF mgc_out_reg_neg IS
BEGIN

  PROCESS ( clk, arst )
  BEGIN
    IF conv_integer(arst) = ph_arst THEN
      lz <= '0';
    ELSIF clk'EVENT AND clk = '0' THEN
      IF conv_integer(srst) = ph_srst THEN
        lz <= '0';
      ELSIF conv_integer(en) = ph_en THEN
        lz <= ld;
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( clk, arst )
  BEGIN
    IF conv_integer(arst) = ph_arst THEN
      z  <= (others => '0');
    ELSIF clk'EVENT AND clk = '0' THEN
      IF conv_integer(srst) = ph_srst THEN
        z  <= (others => '0');
      ELSIF (conv_integer(en) = ph_en) AND (conv_integer(ld) = 1) THEN
        z <= d;
      END IF;
    END IF;
  END PROCESS;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_out_reg IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_reg;

ARCHITECTURE beh OF mgc_out_reg IS
BEGIN

  GENPOS: IF ph_clk = 1 GENERATE
    REGPOS: mgc_out_reg_pos
      generic map (
        rscid => rscid,
        width => width,
        ph_en => ph_en,
        ph_arst => ph_arst,
        ph_srst => ph_srst
      )
      port map (
        clk    => clk,
        en     => en,
        arst   => arst,
        srst   => srst,
        ld     => ld,
        d      => d,
        lz     => lz,
        z      => z
      );
  END GENERATE;

  GENNEG: IF ph_clk = 0 GENERATE
    REGNEG: mgc_out_reg_neg
      generic map (
        rscid => rscid,
        width => width,
        ph_en => ph_en,
        ph_arst => ph_arst,
        ph_srst => ph_srst
      )
      port map (
        clk    => clk,
        en     => en,
        arst   => arst,
        srst   => srst,
        ld     => ld,
        d      => d,
        lz     => lz,
        z      => z
      );
  END GENERATE;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_out_buf_wait IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_buf_wait;

ARCHITECTURE beh OF mgc_out_buf_wait IS

  SIGNAL filled     : std_logic;
  SIGNAL filled_next: std_logic;

  SIGNAL sbuf       : std_logic_vector(width-1 DOWNTO 0);
  SIGNAL lbuf       : std_logic;

  SIGNAL dum        : std_logic_vector(0 DOWNTO 0);

BEGIN

  dum <= (others => '0');
  filled_next <= (filled AND NOT vz) OR (filled AND ld) OR (ld AND NOT vz);

  lbuf <= ld AND NOT (filled XOR vz);

  vd <= vz OR NOT filled;
  lz <= ld OR filled;
  z  <= sbuf WHEN conv_integer(filled) = 1 ELSE d;

  STATEREG: mgc_out_reg
    generic map (
      rscid => rscid,
      width => 1,
      ph_clk => ph_clk,
      ph_en => ph_en,
      ph_arst => ph_arst,
      ph_srst => ph_srst
    )
    port map (
      clk    => clk,
      en     => en,
      arst   => arst,
      srst   => srst,
      ld     => filled_next,
      d      => dum,
      lz     => filled,
      z      => open
    );

  BUFREG: mgc_out_reg
    generic map (
      rscid => rscid,
      width => width,
      ph_clk => ph_clk,
      ph_en => ph_en,
      ph_arst => ph_arst,
      ph_srst => ph_srst
    )
    port map (
      clk    => clk,
      en     => en,
      arst   => arst,
      srst   => srst,
      ld     => lbuf,
      d      => d,
      lz     => open,
      z      => sbuf
    );

END beh;



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_out_fifo_wait_core IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER;
    pwropt   : INTEGER RANGE 0 TO 2 := 0
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0);
    size     : OUT std_logic_vector(sz_width-1 DOWNTO 0)
  );
END mgc_out_fifo_wait_core;

ARCHITECTURE beh OF mgc_out_fifo_wait_core IS

  FUNCTION adjust(sz : INTEGER) RETURN INTEGER IS
    VARIABLE res : INTEGER RANGE 0 TO width*fifo_sz+1;
  BEGIN
    IF sz > 0 THEN
      res := sz;
    ELSE
      res := 1;
    END IF;
    RETURN res;
  END ;

  SIGNAL stat     : std_logic_vector(adjust(fifo_sz)-1 DOWNTO 0);
  SIGNAL stat_pre : std_logic_vector(adjust(fifo_sz)-1 DOWNTO 0);

  SIGNAL sbuf     : std_logic_vector(adjust(width*fifo_sz)-1 DOWNTO 0);
  SIGNAL buf_pre  : std_logic_vector(adjust(width*fifo_sz)-1 DOWNTO 0);

  SIGNAL en_l     : std_logic_vector(adjust(fifo_sz)-1 DOWNTO 0);
  SIGNAL en_l_s   : std_logic_vector(((adjust(fifo_sz)-1)/8) DOWNTO 0);

  SIGNAL const1   : std_logic;
  SIGNAL count    : integer range 0 to fifo_sz+1 := 0;
-- pragma translate_off
  SIGNAL peak : integer range 0 to fifo_sz+1 := 0;
-- pragma translate_on

BEGIN

  FIFO_REG: IF fifo_sz > 0 GENERATE
    const1 <= '1';
    vd <= vz OR NOT stat(0);
    lz <= ld OR stat(fifo_sz-1);
    size <= conv_std_logic_vector(count
            - (conv_integer(vz AND stat(fifo_sz-1)))
            + conv_integer(ld)
            , sz_width);   -- 32 == sz_width;
    Z_PROC: PROCESS(sbuf, d, stat)
    BEGIN
      IF conv_integer(stat(fifo_sz-1)) = 1 THEN
        z  <= sbuf(width*fifo_sz-1 DOWNTO width*(fifo_sz-1));
      ELSE
        z <= d;
     END IF;
    END PROCESS;

    FIFOPROC: PROCESS(ld, vz, d, stat, sbuf, en, stat_pre)
      VARIABLE stat_nxt,
               stat_before,
               en_l_var,
               stat_after   : std_logic;
      VARIABLE buf_nxt      : std_logic_vector(width-1 DOWNTO 0);
-- pragma translate_off
-- pragma translate_on
      VARIABLE n_elem : integer range 0 to fifo_sz+1;
      VARIABLE count_t : integer range 0 to fifo_sz+1;
    BEGIN
      n_elem := 0;
      FOR i IN fifo_sz-1 DOWNTO 0 LOOP
        IF i /= 0         THEN stat_before := stat(i-1); ELSE stat_before := '0'; END IF;
        IF i /= fifo_sz-1 THEN stat_after  := stat(i+1); ELSE stat_after  := '1'; END IF;
        stat_nxt := stat_after AND
          (stat_before OR (stat(i) AND NOT vz) OR (stat(i) AND ld) OR (ld AND NOT vz));
        en_l_var := '1';
        IF conv_integer(stat_nxt) = 1 THEN
          IF conv_integer(vz AND stat_before) = 1 THEN
            buf_nxt := sbuf(width*i-1 DOWNTO width*(i-1));
          ELSIF conv_integer(ld AND NOT((vz AND stat_before) OR (NOT vz AND stat(i)))) =  1 THEN
            buf_nxt := d;
          ELSE
            if pwropt = 1 THEN
              buf_nxt := (others => '0');
            ELSE
              buf_nxt := sbuf(width*(i+1)-1 DOWNTO width*i);
            END IF;
            en_l_var := '0';
          END IF;
        ELSE
          buf_nxt := (others => '0');
          en_l_var := '0';
        END IF;
        stat_pre(i) <= stat_nxt;
        IF conv_integer(ph_en) = 1 THEN
          en_l(i) <= en AND en_l_var;
        ELSE
          en_l(i) <= en OR (NOT en_l_var);
        END IF;
        buf_pre(width*(i+1)-1 DOWNTO width*i) <= buf_nxt;
        IF (stat_after = '1' AND stat(i) = '0') then
          n_elem := fifo_sz - 1 - i;
        END IF;
      END LOOP;

      IF conv_integer(ph_en) = 1 THEN
        en_l_s((adjust(fifo_sz)-1)/8) <= '1';
      ELSE
        en_l_s((adjust(fifo_sz)-1)/8) <= '0';
      END IF;
      FOR i IN fifo_sz-1 DOWNTO 7 LOOP
        IF (i rem 8) = 0 THEN
          IF conv_integer(ph_en) = 1 THEN
            en_l_s((i/8)-1) <= en AND (stat(i) OR stat_pre(i-1));
          ELSE
            en_l_s((i/8)-1) <= en OR (NOT (stat(i) OR stat_pre(i-1)));
          END IF;
        END IF;
      END LOOP;


      IF stat(fifo_sz-1) = '0' THEN
        count_t := 0;
      ELSIF stat(0) = '1' THEN
       count_t := fifo_sz;
      ELSE
        count_t := n_elem;
      END IF;
      count <= count_t;
-- pragma translate_off
      -- Although n_elem has not been initialized, it would be used only
      -- when it is assigned a value inside the FOR loop
      IF ( peak < count_t ) THEN
        peak <= count_t;
      END IF;
-- pragma translate_on
      --size <= conv_std_logic_vector(count_t, sz_width);   -- 32 == sz_width;
    END PROCESS;

    CGFIFO: IF pwropt > 0 GENERATE
    BEGIN
      BUF_GEN: FOR i IN fifo_sz-1 DOWNTO 0 GENERATE
      BEGIN
        BUFREG: mgc_out_reg
          generic map (
            rscid   => rscid,
            width   => width,
            ph_clk  => ph_clk,
            ph_en   => ph_en,
            ph_arst => ph_arst,
            ph_srst => ph_srst
          )
          port map (
            clk  => clk,
            en   => en_l(i),
            arst => arst,
            srst => srst,
            ld   => const1,
            d    => buf_pre(width*(i+1)-1 DOWNTO width*i),
            lz   => open,
            z    => sbuf(width*(i+1)-1 DOWNTO width*i)
          );
      END GENERATE;
    END GENERATE;
    CGSTATFIFO: IF pwropt = 1 GENERATE
    STATREG: mgc_out_reg
      generic map (
        rscid   => rscid,
        width   => fifo_sz,
        ph_clk  => ph_clk,
        ph_en   => ph_en,
        ph_arst => ph_arst,
        ph_srst => ph_srst
      )
      port map (
        clk  => clk,
        en   => en,
        arst => arst,
        srst => srst,
        ld   => const1,
        d    => stat_pre,
        lz   => open,
        z    => stat
      );
    END GENERATE;
    CGSTATFIFO2: IF pwropt = 2 GENERATE
      STATGEN2: FOR i IN fifo_sz-1 DOWNTO 0 GENERATE
      BEGIN
      STATREG2: mgc_out_reg
        generic map (
          rscid   => rscid,
          width   => 1,
          ph_clk  => ph_clk,
          ph_en   => ph_en,
          ph_arst => ph_arst,
          ph_srst => ph_srst
        )
        port map (
          clk  => clk,
          en   => en_l_s(i/8),
          arst => arst,
          srst => srst,
          ld   => const1,
          d    => stat_pre(i DOWNTO i),
          lz   => open,
          z    => stat(i DOWNTO i)
        );
      END GENERATE;
    END GENERATE;
    CGREG: IF pwropt = 0 GENERATE
    BEGIN
      STATREG: mgc_out_reg
        generic map (
          rscid   => rscid,
          width   => fifo_sz,
          ph_clk  => ph_clk,
          ph_en   => ph_en,
          ph_arst => ph_arst,
          ph_srst => ph_srst
        )
        port map (
          clk  => clk,
          en   => en,
          arst => arst,
          srst => srst,
          ld   => const1,
          d    => stat_pre,
          lz   => open,
          z    => stat
        );
      BUFREG: mgc_out_reg
        generic map (
          rscid   => rscid,
          width   => width*fifo_sz,
          ph_clk  => ph_clk,
          ph_en   => ph_en,
          ph_arst => ph_arst,
          ph_srst => ph_srst
        )
        port map (
          clk  => clk,
          en   => en,
          arst => arst,
          srst => srst,
          ld   => const1,
          d    => buf_pre,
          lz   => open,
          z    => sbuf
        );
    END GENERATE;
  END GENERATE;

  FEED_THRU: IF fifo_sz = 0 GENERATE
    vd <= vz;
    lz <= ld;
    z <= d;
    size <= conv_std_logic_vector (conv_integer(ld AND NOT vz), sz_width);   -- 32 == sz_width;
  END GENERATE;
END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_out_fifo_wait IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER;
    pwropt   : INTEGER RANGE 0 TO 2 := 0
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_fifo_wait;

ARCHITECTURE beh OF mgc_out_fifo_wait IS
    SIGNAL size : std_logic_vector(31 DOWNTO 0);

BEGIN
    CORE: mgc_out_fifo_wait_core
    generic map (
        rscid    => rscid,
        width    => width,
        sz_width => 32,
        fifo_sz  => fifo_sz,
        ph_clk   => ph_clk,
        ph_en    => ph_en,
        ph_arst  => ph_arst,
        ph_srst  => ph_srst,
        ph_log2  => ph_log2,
        pwropt   => pwropt
    )
   port map (
        clk  => clk,
        en   => en,
        arst => arst,
        srst => srst,
        ld   => ld,
        vd   => vd,
        d    => d,
        lz   => lz,
        vz   => vz,
        z    => z,
        size => size
      );
END beh;



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_out_prereg_en IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_prereg_en;

ARCHITECTURE beh OF mgc_out_prereg_en IS
BEGIN

  lz   <= ld;
  z    <= d;

END beh;

-----------------
-- INOUT ENTITIES
-----------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_inout_stdreg_en IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ldin     : IN    std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    lzout    : OUT   std_logic;
    z        : INOUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_inout_stdreg_en;

ARCHITECTURE beh OF mgc_inout_stdreg_en IS
BEGIN

  lzin  <= ldin;
  din   <= z WHEN ldin = '1'
      ELSE (others => 'Z');
  lzout <= ldout;
  z     <= dout WHEN ldout = '1'
      ELSE (others => 'Z');

END beh;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_hid_tribuf IS
  GENERIC (
    width    : INTEGER
  );
  PORT (
    I_SIG    : IN     std_logic_vector(width-1 DOWNTO 0);
    ENABLE   : IN     boolean;
    O_SIG    : OUT    std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_hid_tribuf;

ARCHITECTURE beh of mgc_hid_tribuf IS
BEGIN
  O_SIG <= I_SIG when ENABLE
                 ELSE (others => 'Z');
END beh;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_inout_stdreg_wait IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    z        : INOUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_inout_stdreg_wait;

ARCHITECTURE beh OF mgc_inout_stdreg_wait IS
  signal z_enable : boolean ;
BEGIN

  lzin  <= ldin;
  vdin  <= vzin;
  din   <= z;
  lzout <= ldout;
  vdout <= vzout;
  z_enable <= conv_integer(ldout) = 1 AND conv_integer(vzout) = 1;

  TRI_BUF:mgc_hid_tribuf
  GENERIC MAP(
    width    => width
  )
  PORT MAP (
    I_SIG    => dout,
    ENABLE   => z_enable,
    O_SIG    => z
  );

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_inout_buf_wait IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    z        : INOUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_inout_buf_wait;

ARCHITECTURE beh OF mgc_inout_buf_wait IS

  SIGNAL lzout_buf : std_logic;
  SIGNAL vzout_buf : std_logic;
  SIGNAL z_buf     : std_logic_vector(width-1 DOWNTO 0);
  SIGNAL z_enable  : boolean;

BEGIN

  lzin  <= ldin;
  vdin  <= vzin;
  din   <= z;
  lzout <= lzout_buf AND NOT ldin;
  vzout_buf <= vzout AND NOT ldin;
  z_enable <= conv_integer(lzout_buf AND NOT ldin) = 1 AND conv_integer(vzout) = 1;

  TRI_BUF:mgc_hid_tribuf
  GENERIC MAP(
    width    => width
  )
  PORT MAP (
    I_SIG    => z_buf,
    ENABLE   => z_enable,
    O_SIG    => z
  );

  BUF: mgc_out_buf_wait
    generic map (
      rscid => rscid,
      width => width,
      ph_clk => ph_clk,
      ph_en => ph_en,
      ph_arst => ph_arst,
      ph_srst => ph_srst
    )
    port map (
      clk    => clk,
      en     => en,
      arst   => arst,
      srst   => srst,
      ld     => ldout,
      vd     => vdout,
      d      => dout,
      lz     => lzout_buf,
      vz     => vzout_buf,
      z      => z_buf
    );

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_inout_fifo_wait IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER;
    pwropt   : INTEGER RANGE 0 TO 2 := 0
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    z        : INOUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_inout_fifo_wait;

ARCHITECTURE beh OF mgc_inout_fifo_wait IS

  SIGNAL lzout_buf : std_logic;
  SIGNAL vzout_buf : std_logic;
  SIGNAL size      : std_logic_vector(31 DOWNTO 0);
  SIGNAL z_buf     : std_logic_vector(width-1 DOWNTO 0);
  SIGNAL z_enable  : boolean;

BEGIN

  lzin  <= ldin;
  vdin  <= vzin;
  din   <= z;
  lzout <= lzout_buf AND NOT ldin;
  vzout_buf <= vzout AND NOT ldin;
  z_enable <= conv_integer(lzout_buf AND NOT ldin) = 1 AND conv_integer(vzout) = 1;
  --z     <= z_buf WHEN z_enable
  --               ELSE (others => 'Z');

  TRI_BUF:mgc_hid_tribuf
  GENERIC MAP(
    width    => width
  )
  PORT MAP (
    I_SIG    => z_buf,
    ENABLE   => z_enable,
    O_SIG    => z
  );

  FIFO: mgc_out_fifo_wait
    generic map (
      rscid   => rscid,
      width   => width,
      fifo_sz => fifo_sz,
      ph_clk  => ph_clk,
      ph_en   => ph_en,
      ph_arst => ph_arst,
      ph_srst => ph_srst,
      ph_log2 => ph_log2,
      pwropt  => pwropt
    )
    port map (
      clk  => clk,
      en   => en,
      arst => arst,
      srst => srst,
      ld   => ldout,
      vd   => vdout,
      d    => dout,
      lz   => lzout_buf,
      vz   => vzout_buf,
      z    => z_buf
    );

END beh;


------------------------------
-- IO SYNCHRONIZATION ENTITIES
------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_io_sync IS
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END mgc_IO_sync;

ARCHITECTURE beh OF mgc_io_sync IS
BEGIN

  lz <= ld;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY mgc_bsync_rdy IS
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    rd       : IN    std_logic;
    rz       : OUT   std_logic
  );
END mgc_bsync_rdy;

ARCHITECTURE beh OF mgc_bsync_rdy IS
BEGIN

  rz <= rd;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY mgc_bsync_vld IS
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    vd       : OUT   std_logic;
    vz       : IN    std_logic
  );
END mgc_bsync_vld;

ARCHITECTURE beh OF mgc_bsync_vld IS
BEGIN

  vd <= vz;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY mgc_bsync_rv IS
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    rd       : IN    std_logic;
    vd       : OUT   std_logic;
    rz       : OUT   std_logic;
    vz       : IN    std_logic
  );
END mgc_bsync_rv;

ARCHITECTURE beh OF mgc_bsync_rv IS
BEGIN

  rz <= rd;
  vd <= vz;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_sync IS
  PORT (
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic
  );
END mgc_sync;

ARCHITECTURE beh OF mgc_sync IS

BEGIN

  vdin <= ldout;
  vdout <= ldin;

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


USE work.mgc_ioport_comps.all;

ENTITY mgc_pipe IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER;
    fifo_sz  : INTEGER;
    log2_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    pwropt   : INTEGER RANGE 0 TO 2 := 0
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    size     : OUT   std_logic_vector(sz_width-1 DOWNTO 0);
    req_size : in    std_logic
  );
END mgc_pipe;

ARCHITECTURE beh OF mgc_pipe IS

BEGIN
  FIFO: mgc_out_fifo_wait_core
    generic map (
      rscid    => rscid,
      width    => width,
      sz_width => sz_width,
      fifo_sz  => fifo_sz,
      ph_clk   => ph_clk,
      ph_en    => ph_en,
      ph_arst  => ph_arst,
      ph_srst  => ph_srst,
      ph_log2  => log2_sz,
      pwropt   => pwropt
    )
    port map (
      clk  => clk,
      en   => en,
      arst => arst,
      srst => srst,
      ld   => ldout,
      vd   => vdout,
      d    => dout,
      lz   => vdin,
      vz   => ldin,
      z    => din,
      size => size
    );

END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

USE work.mgc_ioport_comps.all;

ENTITY mgc_in_ram IS
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  re_active         : integer;
  num_byte_enables  : integer;
  no_of_ports       : integer
);
port
(
  d  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
  ad : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
  bd : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
  z  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
  az : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
  bz : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END mgc_in_ram;

ARCHITECTURE beh OF mgc_in_ram IS
BEGIN
  d  <= z;
  az <= ad;
  bz <= bd;
END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

USE work.mgc_ioport_comps.all;

ENTITY mgc_out_ram IS
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  re_active         : integer;
  num_byte_enables  : integer;
  no_of_ports       : integer
);
port
(
  d  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
  ad : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
  bd : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
  z  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
  az : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
  bz : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END mgc_out_ram;

ARCHITECTURE beh OF mgc_out_ram IS
BEGIN
  z  <= d;
  az <= ad;
  bz <= bd;
END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

USE work.mgc_ioport_comps.all;

ENTITY mgc_inout_ram IS
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  re_active         : integer;
  we_active         : integer;
  num_byte_enables  : integer; -- ##
  no_of_ports       : integer
);
port
(
 id  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 od  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 ad  : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rd  : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 wd  : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 iz  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 oz  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 az  : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rz  : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0);
 wz  : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END mgc_inout_ram;

ARCHITECTURE beh OF mgc_inout_ram IS
BEGIN
  id <= iz;
  oz <= od;
  az <= ad;
  rz <= rd;
  wz <= wd;
END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

USE work.mgc_ioport_comps.all;

ENTITY funccall_inout IS
generic
(
  ram_id            : integer;
  width           : integer;  -- models the concat of the return value (data)
  addr_width      : integer  -- models the concat of the input arguments (addr)
);
port
(
  d  : out  STD_LOGIC_VECTOR(width - 1 downto 0);
  ad : in  STD_LOGIC_VECTOR(addr_width - 1 downto 0) ;
  bd : in  STD_LOGIC;
  z  : in  STD_LOGIC_VECTOR(width - 1 downto 0);
  az : out  STD_LOGIC_VECTOR(addr_width - 1 downto 0) ;
  bz : out  STD_LOGIC
);
END funccall_inout;

ARCHITECTURE beh OF funccall_inout IS
BEGIN
  d  <= z;
  az <= ad;
  bz <= bd;
END beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

USE work.mgc_ioport_comps.all;

ENTITY modulario_en_in IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END modulario_en_in;

ARCHITECTURE beh OF modulario_en_in IS
BEGIN

  vd <= vz;
  d  <= z;

END beh;


--------> /softslin/catapult2011a_200_12/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_comps.vhd 
LIBRARY ieee;
USE ieee.std_logic_1164.all;


USE work.funcs.all;

PACKAGE mgc_comps IS

COMPONENT mgc_not
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_and
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_nand
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_or
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_nor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_xor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_xnor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mux
  GENERIC (
    width  :  NATURAL;
    ctrlw  :  NATURAL;
    p2ctrlw : NATURAL := 0
  );
  PORT (
    a: in  std_logic_vector(width*(2**ctrlw) - 1 DOWNTO 0);
    c: in  std_logic_vector(ctrlw            - 1 DOWNTO 0);
    z: out std_logic_vector(width            - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mux1hot
  GENERIC (
    width  : NATURAL;
    ctrlw  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ctrlw - 1 DOWNTO 0);
    c: in  std_logic_vector(ctrlw       - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_reg_pos
  GENERIC (
    width  : NATURAL;
    has_a_rst : NATURAL;  -- 0 to 1
    a_rst_on  : NATURAL;  -- 0 to 1
    has_s_rst : NATURAL;  -- 0 to 1
    s_rst_on  : NATURAL;  -- 0 to 1
    has_enable : NATURAL; -- 0 to 1
    enable_on  : NATURAL  -- 0 to 1
  );
  PORT (
    clk: in  std_logic;
    d  : in  std_logic_vector(width-1 DOWNTO 0);
    z  : out std_logic_vector(width-1 DOWNTO 0);
    sync_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    sync_rst : in std_logic;
    async_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    async_rst : in std_logic;
    en : in std_logic
  );
END COMPONENT;

COMPONENT mgc_reg_neg
  GENERIC (
    width  : NATURAL;
    has_a_rst : NATURAL;  -- 0 to 1
    a_rst_on  : NATURAL;  -- 0 to 1
    has_s_rst : NATURAL;  -- 0 to 1
    s_rst_on  : NATURAL;   -- 0 to 1
    has_enable : NATURAL; -- 0 to 1
    enable_on  : NATURAL -- 0 to 1
  );
  PORT (
    clk: in  std_logic;
    d  : in  std_logic_vector(width-1 DOWNTO 0);
    z  : out std_logic_vector(width-1 DOWNTO 0);
    sync_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    sync_rst : in std_logic;
    async_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    async_rst : in std_logic;
    en : in std_logic
  );
END COMPONENT;

COMPONENT mgc_generic_reg
  GENERIC(
   width: natural := 8;
   ph_clk: integer range 0 to 1 := 1; -- clock polarity, 1=rising_edge
   ph_en: integer range 0 to 1 := 1;
   ph_a_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   ph_s_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   a_rst_used: integer range 0 to 1 := 1;
   s_rst_used: integer range 0 to 1 := 0;
   en_used: integer range 0 to 1 := 1
  );
  PORT(
   d: std_logic_vector(width-1 downto 0);
   clk: in std_logic;
   en: in std_logic;
   a_rst: in std_logic;
   s_rst: in std_logic;
   q: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT mgc_equal
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a : in  std_logic_vector(width-1 DOWNTO 0);
    b : in  std_logic_vector(width-1 DOWNTO 0);
    eq: out std_logic;
    ne: out std_logic
  );
END COMPONENT;

COMPONENT mgc_shift_l
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_r
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_bl
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_br
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_rot
  GENERIC (
    width  : NATURAL;
    width_s: NATURAL;
    signd_s: NATURAL;      -- 0:unsigned 1:signed
    sleft  : NATURAL;      -- 0:right 1:left;
    log2w  : NATURAL := 0; -- LOG2(width)
    l2wp2  : NATURAL := 0  --2**LOG2(width)
  );
  PORT (
    a : in  std_logic_vector(width  -1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width  -1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_sub
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add_pipe
  GENERIC (
     width_a : natural := 16;
     signd_a : integer range 0 to 1 := 0;
     width_b : natural := 3;
     signd_b : integer range 0 to 1 := 0;
     width_z : natural := 18;
     ph_clk : integer range 0 to 1 := 1;
     ph_en : integer range 0 to 1 := 1;
     ph_a_rst : integer range 0 to 1 := 1;
     ph_s_rst : integer range 0 to 1 := 1;
     n_outreg : natural := 2;
     stages : natural := 2; -- Default value is minimum required value
     a_rst_used: integer range 0 to 1 := 1;
     s_rst_used: integer range 0 to 1 := 0;
     en_used: integer range 0 to 1 := 1
     );
  PORT(
     a: in std_logic_vector(width_a-1 downto 0);
     b: in std_logic_vector(width_b-1 downto 0);
     clk: in std_logic;
     en: in std_logic;
     a_rst: in std_logic;
     s_rst: in std_logic;
     z: out std_logic_vector(width_z-1 downto 0)
     );
END COMPONENT;

COMPONENT mgc_sub_pipe
  GENERIC (
     width_a : natural := 16;
     signd_a : integer range 0 to 1 := 0;
     width_b : natural := 3;
     signd_b : integer range 0 to 1 := 0;
     width_z : natural := 18;
     ph_clk : integer range 0 to 1 := 1;
     ph_en : integer range 0 to 1 := 1;
     ph_a_rst : integer range 0 to 1 := 1;
     ph_s_rst : integer range 0 to 1 := 1;
     n_outreg : natural := 2;
     stages : natural := 2; -- Default value is minimum required value
     a_rst_used: integer range 0 to 1 := 1;
     s_rst_used: integer range 0 to 1 := 0;
     en_used: integer range 0 to 1 := 1
     );
  PORT(
     a: in std_logic_vector(width_a-1 downto 0);
     b: in std_logic_vector(width_b-1 downto 0);
     clk: in std_logic;
     en: in std_logic;
     a_rst: in std_logic;
     s_rst: in std_logic;
     z: out std_logic_vector(width_z-1 downto 0)
     );
END COMPONENT;

COMPONENT mgc_addsub
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    add: in  std_logic;
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_accu
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_abs
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_z : NATURAL    -- <= width_a + width_b
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul_fast
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_z : NATURAL    -- <= width_a + width_b
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul_pipe
  GENERIC (
    width_a       : NATURAL;
    signd_a       : NATURAL;
    width_b       : NATURAL;
    signd_b       : NATURAL;
    width_z       : NATURAL; -- <= width_a + width_b
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 

  );
  PORT (
    a     : in  std_logic_vector(width_a-1 DOWNTO 0);
    b     : in  std_logic_vector(width_b-1 DOWNTO 0);
    clk   : in  std_logic;
    en    : in  std_logic;
    a_rst : in  std_logic;
    s_rst : in  std_logic;
    z     : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_div
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_a-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mod
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_b-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_rem
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_b-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_rom
    GENERIC (
      rom_id : natural := 1;
      size : natural := 33;
      width : natural := 32
      );
    PORT (
      data_in : std_logic_vector((size*width)-1 downto 0);
      addr : std_logic_vector(ceil_log2(size)-1 downto 0);
      data_out : out std_logic_vector(width-1 downto 0)
    );
END COMPONENT;

END mgc_comps;

--------> /softslin/catapult2011a_200_12/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_generic_reg_beh.vhd 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mgc_generic_reg is
  GENERIC(
   width: natural := 8;
   ph_clk: integer range 0 to 1 := 1; -- clock polarity, 1=rising_edge
   ph_en: integer range 0 to 1 := 1;
   ph_a_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   ph_s_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   a_rst_used: integer range 0 to 1 := 1;
   s_rst_used: integer range 0 to 1 := 0;
   en_used: integer range 0 to 1 := 1
  );
  PORT(
   d: std_logic_vector(width-1 downto 0);
   clk: in std_logic;
   en: in std_logic;
   a_rst: in std_logic;
   s_rst: in std_logic;
   q: out std_logic_vector(width-1 downto 0)
  );
end mgc_generic_reg;

architecture rtl of mgc_generic_reg is
begin
    BLK_S_RST_USED: if s_rst_used = 1 generate
      BLK_CLK_POS: if ph_clk = 1 generate
        process(a_rst, clk)
        begin
          IF conv_integer(a_rst) = ph_a_rst THEN
            q <= (others => '0');
          ELSIF (clk'event and clk = '1') then
            IF conv_integer(s_rst) = ph_s_rst then
              q <= (others => '0');
            ELSIF conv_integer(en) = ph_en then
              q <= d;
            end if;
          end if;
        end process;
      end generate BLK_CLK_POS;
      BLK_CLK_NEG: if ph_clk = 0 generate
        process(a_rst, clk)
        begin
          IF conv_integer(a_rst) = ph_a_rst THEN
            q <= (others => '0');
          ELSIF (clk'event and clk = '0') then
            IF conv_integer(s_rst) = ph_s_rst then
              q <= (others => '0');
            ELSIF conv_integer(en) = ph_en then
              q <= d;
            end if;
          end if;
        end process;
      end generate BLK_CLK_NEG;
    end generate BLK_S_RST_USED;
    
    BLK_S_RST_NOT_USED: if s_rst_used = 0 generate
      BLK_CLK_POS: if ph_clk = 1 generate
        process(a_rst, clk)
        begin
          IF conv_integer(a_rst) = ph_a_rst THEN
            q <= (others => '0');
          ELSIF (clk'event and clk = '1') then
            IF conv_integer(en) = ph_en then
              q <= d;
            end if;
          end if;
        end process;
      end generate BLK_CLK_POS;
      BLK_CLK_NEG: if ph_clk = 0 generate
        process(a_rst, clk)
        begin
          IF conv_integer(a_rst) = ph_a_rst THEN
            q <= (others => '0');
          ELSIF (clk'event and clk = '0') then
            IF conv_integer(en) = ph_en then
              q <= d;
            end if;
          end if;
        end process;
      end generate BLK_CLK_NEG;
    end generate BLK_S_RST_NOT_USED;
end rtl;

--------> /softslin/catapult2011a_200_12/Mgc_home/pkgs/siflibs/ram_singleport_be_fpga.vhd 
--//////////////////////////////////////////////////////////////////////////////
-- Catapult Synthesis - Custom Interfaces Toolkit Example
--
-- Copyright (c) 2003-2011 Calypto Design Systems, Inc.
--       All Rights Reserved
-- 
-- This document contains information that is proprietary to Calypto Design
-- Systems, Inc. The original recipient of this document may duplicate this  
-- document in whole or in part for internal business purposes only, provided  
-- that this entire notice appears in all copies. In duplicating any part of  
-- this document, the recipient agrees to make every reasonable effort to  
-- prevent the unauthorized use and distribution of the proprietary information.
-- 
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in prepartion for creating
-- their own custom interfaces. This design does not present a complete
-- implementation of the named protocol or standard.
--
--//////////////////////////////////////////////////////////////////////////////

LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.STD_LOGIC_ARITH.ALL ;

PACKAGE singleport_ram_be_pkg IS

  COMPONENT singleport_ram_be
   GENERIC (ram_id           : integer;
            words            : integer;
            width            : integer;
            addr_width       : integer;
            a_reset_active   : integer;
            s_reset_active   : integer;
            enable_active    : integer;
            re_active        : integer;
            we_active        : integer;
            num_byte_enables : integer;
            clock_edge       : integer;
            num_input_registers          : integer;
            num_output_registers         : integer;
            no_of_singleport_readwrite_port  : integer
           );
     PORT (
           data_in    : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 DOWNTO 0) ;
           addr       : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * addr_width) - 1 DOWNTO 0) ;
           re         : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 DOWNTO 0);
           we         : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 DOWNTO 0);
           data_out   : OUT STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 DOWNTO 0);
           clk        : IN  std_logic;
           a_rst      : IN std_logic;
           s_rst      : IN std_logic;
           en         : IN std_logic
          );

  END COMPONENT;

END singleport_ram_be_pkg;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.STD_LOGIC_ARITH.ALL ;
USE IEEE.STD_LOGIC_UNSIGNED.ALL ;

USE work.singleport_ram_be_pkg.ALL;

  ENTITY singleport_ram_be IS
   GENERIC (ram_id           : integer := 1;
            words            : integer := 256;
            width            : integer := 8;
            addr_width       : integer := 8;
            a_reset_active   : integer := 0;
            s_reset_active   : integer := 1;
            enable_active    : integer := 1;
            re_active        : integer := 1;
            we_active        : integer := 1;
            num_byte_enables : integer := 1;
            clock_edge       : integer := 1;
            num_input_registers          : integer := 1;
            num_output_registers         : integer := 0;
            no_of_singleport_readwrite_port  : integer := 1
     );
     PORT (
           data_in    : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 DOWNTO 0) ;
           addr       : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * addr_width) - 1 DOWNTO 0) ;
           re         : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 DOWNTO 0);
           we         : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 DOWNTO 0);
           data_out   : OUT STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 DOWNTO 0);
           clk        : IN  std_logic;
           a_rst      : IN std_logic;
           s_rst      : IN  std_logic;
           en         : IN std_logic
          );
  END singleport_ram_be ;
  
  ARCHITECTURE rtl OF singleport_ram_be IS
    TYPE mem_type IS ARRAY ((words)-1 DOWNTO 0) OF
                        STD_LOGIC_VECTOR(width - 1 DOWNTO 0) ;
    SIGNAL mem : mem_type ;

    TYPE d_array IS ARRAY (integer RANGE <>) OF STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    TYPE addr_array IS ARRAY (integer RANGE <>) OF STD_LOGIC_VECTOR(addr_width-1 DOWNTO 0);
    TYPE en_array IS ARRAY (integer RANGE <>) OF STD_LOGIC_VECTOR(num_byte_enables - 1 DOWNTO 0);

    SIGNAL data_out_f : STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    SIGNAL data_in_f  : STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    SIGNAL addr_f     : STD_LOGIC_VECTOR(addr_width-1 DOWNTO 0);
    SIGNAL re_f       : STD_LOGIC_VECTOR(num_byte_enables - 1 DOWNTO 0);
    SIGNAL we_f       : STD_LOGIC_VECTOR(num_byte_enables - 1 DOWNTO 0);

    SIGNAL addr_reg   : STD_LOGIC_VECTOR(addr_width - 1 DOWNTO 0);
    SIGNAL re_reg     : STD_LOGIC_VECTOR(num_byte_enables - 1 DOWNTO 0);

    CONSTANT byte_width : integer := width / num_byte_enables;
    CONSTANT clock_edge_stdlogic : STD_LOGIC := conv_std_logic_vector(clock_edge,1)(0);

    FUNCTION cmp_ulogic_int(arg1 : STD_ULOGIC; arg2 : INTEGER) RETURN BOOLEAN IS
    BEGIN
      CASE arg2 IS
        WHEN 1 => RETURN arg1 = '1' OR arg1 = 'H';
        WHEN 0 => RETURN arg1 = '0' OR arg1 = 'L';
        WHEN OTHERS => ASSERT false
                       REPORT "Invalid integer value for phase - valid range is from 0 to 1"
                       SEVERITY FAILURE;
                       RETURN false;
      END CASE;
    END cmp_ulogic_int;
BEGIN

    N_INREG_GT_1 : IF (num_input_registers > 1) GENERATE
     SIGNAL data_in_inreg: d_array(num_input_registers-2 DOWNTO 0);
     SIGNAL addr_inreg: addr_array(num_input_registers-2 DOWNTO 0);
     SIGNAL re_inreg : en_array(num_input_registers-2 DOWNTO 0);
     SIGNAL we_inreg : en_array(num_input_registers-2 DOWNTO 0);
 
     CONSTANT PWR: integer RANGE 0 TO 1 := 1;
     CONSTANT GND: integer RANGE 0 TO 1 := 0;
     CONSTANT GND_sig: std_logic := '0';
    BEGIN
      pipe: FOR i_in IN num_input_registers - 3 DOWNTO 0 GENERATE
        i_data_in_inreg :   work.mgc_comps.mgc_generic_reg
                      GENERIC MAP (width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                      PORT MAP (data_in_inreg(i_in), clk, en, a_rst, s_rst, data_in_inreg(i_in+1));
        i_addr_inreg :   work.mgc_comps.mgc_generic_reg
                      GENERIC MAP (addr_width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                      PORT MAP (addr_inreg(i_in), clk, en, a_rst, s_rst, addr_inreg(i_in+1));
        i_re_inreg :   work.mgc_comps.mgc_generic_reg
                      GENERIC MAP (num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                      PORT MAP (re_inreg(i_in), clk, en, a_rst, s_rst, re_inreg(i_in+1));
        i_we_inreg :   work.mgc_comps.mgc_generic_reg
                      GENERIC MAP (num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                      PORT MAP (we_inreg(i_in), clk, en, a_rst, s_rst, we_inreg(i_in+1));
      END GENERATE pipe;

      i_data_in_inreg_i :   work.mgc_comps.mgc_generic_reg
                    GENERIC MAP (width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                    PORT MAP (data_in, clk, en, a_rst, s_rst, data_in_inreg(0));
      i_addr_inreg_i :   work.mgc_comps.mgc_generic_reg
                    GENERIC MAP (addr_width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                    PORT MAP (addr, clk, en, a_rst, s_rst, addr_inreg(0));
      i_re_inreg_i :   work.mgc_comps.mgc_generic_reg
                    GENERIC MAP (num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                    PORT MAP (re, clk, en, a_rst, s_rst, re_inreg(0));
      i_we_inreg_i :   work.mgc_comps.mgc_generic_reg
                    GENERIC MAP (num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                    PORT MAP (we, clk, en, a_rst, s_rst, we_inreg(0));


      data_in_f <= data_in_inreg(num_input_registers-2);
      addr_f <= addr_inreg(num_input_registers-2);
      re_f <= re_inreg(num_input_registers-2);
      we_f <= we_inreg(num_input_registers-2);

    END GENERATE N_INREG_GT_1;

    INREG_EQ_1: IF num_input_registers = 1 GENERATE
      data_in_f <= data_in;
      addr_f <= addr;
      re_f <= re;
      we_f <= we;

    END GENERATE INREG_EQ_1;
    	--pragma translate_off
    	CHECK_ADDR_DONTCARE: PROCESS(clk)
    	BEGIN
     	IF ( clk'event AND clk = clock_edge_stdlogic ) THEN
        IF (conv_integer(en) = enable_active) THEN
        		FOR i IN 0 TO addr_width-1 LOOP    
          		IF (addr_f(i) = 'X' OR addr_f(i) = 'Z') THEN    	
          		  FOR j IN 0 TO num_byte_enables - 1 LOOP
            			ASSERT cmp_ulogic_int(we_f(j), we_active) = false
            			  REPORT "Error: Dont-care address for pipelined singleport memory-write"
            			  SEVERITY FAILURE;
            			ASSERT cmp_ulogic_int(re_f(j), re_active) = false
            			  REPORT "Error: Dont-care or High-Impedance address for pipelined singleport memory-read"
            			  SEVERITY FAILURE;
          		  END LOOP;
          		END IF;
        		END LOOP;
        END IF;
      END IF;
    	END PROCESS;

    	--pragma translate_on
    MW : PROCESS (clk)
           VARIABLE addr_int : integer;
    BEGIN
      IF ( clk'event AND clk = clock_edge_stdlogic ) THEN
        IF (conv_integer(en) = enable_active) THEN
          addr_reg <= addr_f;
  	       re_reg   <= re_f;
          addr_int := conv_integer(addr_f);
          IF (addr_int < words AND addr_int >= 0) THEN
            FOR i IN 0 TO num_byte_enables - 1 LOOP
              IF cmp_ulogic_int(we_f(i), we_active) THEN
                mem(addr_int)(i*byte_width + byte_width - 1 DOWNTO i*byte_width) <= data_in_f(i*byte_width + byte_width - 1 DOWNTO i*byte_width);
              END IF;
            END LOOP;
          ELSE
            FOR i IN 0 TO num_byte_enables - 1 LOOP
              ASSERT cmp_ulogic_int(we_f(i), we_active) = false
                REPORT "Error: Out-of-bound pipelined singleport memory-write"
                SEVERITY FAILURE;
            END LOOP;
          END IF;
        END IF;
      END IF;
    END PROCESS;

    MR: PROCESS(mem, addr_reg, re_reg)
        VARIABLE addr_int: integer;
    BEGIN
        addr_int := conv_integer(addr_reg);
        IF (addr_int < words AND addr_int >= 0) THEN
          -- data_out_f <= mem(addr_int);
          FOR k IN 0 TO num_byte_enables - 1 LOOP
            IF cmp_ulogic_int(re_reg(k), re_active) THEN
              data_out_f(k*byte_width + byte_width - 1 DOWNTO k*byte_width) <= mem(addr_int)(k*byte_width + byte_width - 1 DOWNTO k*byte_width);
            ELSE
              data_out_f(k*byte_width + byte_width - 1 DOWNTO k*byte_width) <= (OTHERS => 'X');
            END IF;
          END LOOP;
        ELSE
          data_out_f <= (OTHERS => 'X');
        END IF;
    END PROCESS;

    -- REGISTER BANKS at the output
    N_OUTREG_GT_0: IF num_output_registers > 0 GENERATE
     SIGNAL data_out_outreg: d_array(num_output_registers-1 DOWNTO 0);
 
     CONSTANT PWR: integer RANGE 0 TO 1 := 1;
     CONSTANT GND: integer RANGE 0 TO 1 := 0;
     CONSTANT GND_sig: std_logic := '0';
    BEGIN
      N_OUTREG_SHIFT: FOR i_out IN num_output_registers - 2 DOWNTO 0 GENERATE
      BEGIN
        i_data_out_outreg :   work.mgc_comps.mgc_generic_reg
                      GENERIC MAP (width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                      PORT MAP (data_out_outreg(i_out), clk, en, a_rst, s_rst, data_out_outreg(i_out+1));
      END GENERATE N_OUTREG_SHIFT;

      i_data_out_outreg_i :   work.mgc_comps.mgc_generic_reg
                    GENERIC MAP (width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                    PORT MAP (data_out_f, clk, en, a_rst, s_rst, data_out_outreg(0));
      data_out <= data_out_outreg(num_output_registers-1);
    END GENERATE N_OUTREG_GT_0;

    N_OUTREG_EQ_0: IF num_output_registers = 0 GENERATE
      data_out <= data_out_f;
    END GENERATE N_OUTREG_EQ_0;
END RTL;


--------> /softslin/catapult2011a_200_12/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_div_beh.vhd 

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mgc_div IS
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_a-1 DOWNTO 0)
  );
END mgc_div;

LIBRARY ieee;
USE ieee.std_logic_arith.all;

USE work.funcs.all;

ARCHITECTURE beh OF mgc_div IS
BEGIN
  z <= std_logic_vector(unsigned(a) / unsigned(b)) WHEN signd = 0 ELSE
       std_logic_vector(  signed(a) /   signed(b));
END beh;

--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    2011a.200 Production Release
--  HLS Date:       Mon Jun  2 22:10:04 PDT 2014
-- 
--  Generated by:   xph3sle512@cimeld21
--  Generated date: Wed Feb  1 14:06:16 2017
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    Main_Only_Comp_Decomp_Main_Fonction_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps.ALL;
USE work.singleport_ram_be_pkg.ALL;
USE work.Main_Only_Comp_Decomp_Main_Fonction_mux_pkg.ALL;


ENTITY Main_Only_Comp_Decomp_Main_Fonction_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (60 DOWNTO 0);
    st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0 : IN STD_LOGIC;
    st_comp_compress_for_3_tr0 : IN STD_LOGIC;
    st_ModelA_update_for_2_tr0 : IN STD_LOGIC;
    st_comp_compress_for_for_tr0 : IN STD_LOGIC;
    st_comp_compress_for_for_tr1 : IN STD_LOGIC;
    st_comp_compress_for_for_1_tr0 : IN STD_LOGIC;
    st_comp_compress_for_for_1_tr1 : IN STD_LOGIC;
    st_comp_put_bit_plus_pending_for_1_tr0 : IN STD_LOGIC;
    st_comp_put_bit_plus_pending_1_for_1_tr0 : IN STD_LOGIC;
    st_main_3_tr0 : IN STD_LOGIC;
    st_main_3_tr1 : IN STD_LOGIC;
    st_comp_put_bit_plus_pending_2_for_1_tr0 : IN STD_LOGIC;
    st_comp_put_bit_plus_pending_3_for_1_tr0 : IN STD_LOGIC;
    st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0 : IN STD_LOGIC;
    st_ModelA_getChar_for_3_tr0 : IN STD_LOGIC;
    st_ModelA_update_1_for_2_tr0 : IN STD_LOGIC;
    st_ModelA_getChar_for_5_tr0 : IN STD_LOGIC;
    st_dec_decompress_for_1_7_tr0 : IN STD_LOGIC;
    st_dec_decompress_for_1_for_tr0 : IN STD_LOGIC
  );
END Main_Only_Comp_Decomp_Main_Fonction_core_fsm;

ARCHITECTURE v1 OF Main_Only_Comp_Decomp_Main_Fonction_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for Main_Only_Comp_Decomp_Main_Fonction_core_fsm_1
  TYPE Main_Only_Comp_Decomp_Main_Fonction_core_fsm_1_ST IS (st_main, st_main_1,
      st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit, st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_1,
      st_comp_compress_for, st_comp_compress_for_1, st_comp_compress_for_2, st_comp_compress_for_3,
      st_ModelA_update_for, st_ModelA_update_for_1, st_ModelA_update_for_2, st_comp_compress_for_4,
      st_comp_compress_for_5, st_comp_compress_for_6, st_comp_compress_for_7, st_comp_compress_for_8,
      st_comp_compress_for_9, st_comp_compress_for_10, st_comp_compress_for_for,
      st_comp_compress_for_for_1, st_comp_put_bit_plus_pending_for, st_comp_put_bit_plus_pending_for_1,
      st_comp_put_bit_plus_pending_1_for, st_comp_put_bit_plus_pending_1_for_1, st_comp_compress_for_for_2,
      st_main_2, st_main_3, st_comp_put_bit_plus_pending_2_for, st_comp_put_bit_plus_pending_2_for_1,
      st_comp_put_bit_plus_pending_3_for, st_comp_put_bit_plus_pending_3_for_1, st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit,
      st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_1, st_dec_decompress_for_1,
      st_dec_decompress_for_1_1, st_dec_decompress_for_1_2, st_dec_decompress_for_1_3,
      st_dec_decompress_for_1_4, st_dec_decompress_for_1_5, st_dec_decompress_for_1_6,
      st_ModelA_getChar_for, st_ModelA_getChar_for_1, st_ModelA_getChar_for_2, st_ModelA_getChar_for_3,
      st_ModelA_update_1_for, st_ModelA_update_1_for_1, st_ModelA_update_1_for_2,
      st_ModelA_getChar_for_4, st_ModelA_getChar_for_5, st_dec_decompress_for_1_7,
      st_dec_decompress_for_1_8, st_dec_decompress_for_1_9, st_dec_decompress_for_1_10,
      st_dec_decompress_for_1_11, st_dec_decompress_for_1_12, st_dec_decompress_for_1_13,
      st_dec_decompress_for_1_for, st_dec_decompress_for_1_for_1, st_dec_decompress_for_1_14,
      st_main_4, st_main_5);

  SIGNAL state_var : Main_Only_Comp_Decomp_Main_Fonction_core_fsm_1_ST;
  SIGNAL state_var_NS : Main_Only_Comp_Decomp_Main_Fonction_core_fsm_1_ST;

BEGIN
  -- Default Constant Signal Assignments

  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_1 : PROCESS (st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0,
      st_comp_compress_for_3_tr0, st_ModelA_update_for_2_tr0, st_comp_compress_for_for_tr0,
      st_comp_compress_for_for_tr1, st_comp_compress_for_for_1_tr0, st_comp_compress_for_for_1_tr1,
      st_comp_put_bit_plus_pending_for_1_tr0, st_comp_put_bit_plus_pending_1_for_1_tr0,
      st_main_3_tr0, st_main_3_tr1, st_comp_put_bit_plus_pending_2_for_1_tr0, st_comp_put_bit_plus_pending_3_for_1_tr0,
      st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0, st_ModelA_getChar_for_3_tr0,
      st_ModelA_update_1_for_2_tr0, st_ModelA_getChar_for_5_tr0, st_dec_decompress_for_1_7_tr0,
      st_dec_decompress_for_1_for_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN st_main =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000001");
        state_var_NS <= st_main_1;
      WHEN st_main_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000010");
        state_var_NS <= st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit;
      WHEN st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000100");
        state_var_NS <= st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_1;
      WHEN st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000001000");
        IF ( st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0
            = '1' ) THEN
          state_var_NS <= st_comp_compress_for;
        ELSE
          state_var_NS <= st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit;
        END IF;
      WHEN st_comp_compress_for =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000010000");
        state_var_NS <= st_comp_compress_for_1;
      WHEN st_comp_compress_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000100000");
        state_var_NS <= st_comp_compress_for_2;
      WHEN st_comp_compress_for_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000001000000");
        state_var_NS <= st_comp_compress_for_3;
      WHEN st_comp_compress_for_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000010000000");
        IF ( st_comp_compress_for_3_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_4;
        ELSE
          state_var_NS <= st_ModelA_update_for;
        END IF;
      WHEN st_ModelA_update_for =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000100000000");
        state_var_NS <= st_ModelA_update_for_1;
      WHEN st_ModelA_update_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000001000000000");
        state_var_NS <= st_ModelA_update_for_2;
      WHEN st_ModelA_update_for_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000010000000000");
        IF ( st_ModelA_update_for_2_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_4;
        ELSE
          state_var_NS <= st_ModelA_update_for;
        END IF;
      WHEN st_comp_compress_for_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000100000000000");
        state_var_NS <= st_comp_compress_for_5;
      WHEN st_comp_compress_for_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000001000000000000");
        state_var_NS <= st_comp_compress_for_6;
      WHEN st_comp_compress_for_6 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000010000000000000");
        state_var_NS <= st_comp_compress_for_7;
      WHEN st_comp_compress_for_7 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000100000000000000");
        state_var_NS <= st_comp_compress_for_8;
      WHEN st_comp_compress_for_8 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000001000000000000000");
        state_var_NS <= st_comp_compress_for_9;
      WHEN st_comp_compress_for_9 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000010000000000000000");
        state_var_NS <= st_comp_compress_for_10;
      WHEN st_comp_compress_for_10 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000100000000000000000");
        state_var_NS <= st_comp_compress_for_for;
      WHEN st_comp_compress_for_for =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000001000000000000000000");
        IF ( st_comp_compress_for_for_tr0 = '1' ) THEN
          state_var_NS <= st_main_2;
        ELSIF ( st_comp_compress_for_for_tr1 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_for_1;
        ELSE
          state_var_NS <= st_comp_compress_for;
        END IF;
      WHEN st_comp_compress_for_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000010000000000000000000");
        IF ( st_comp_compress_for_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_for_2;
        ELSIF ( st_comp_compress_for_for_1_tr1 = '1' ) THEN
          state_var_NS <= st_comp_put_bit_plus_pending_for;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_1_for;
        END IF;
      WHEN st_comp_put_bit_plus_pending_for =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000100000000000000000000");
        state_var_NS <= st_comp_put_bit_plus_pending_for_1;
      WHEN st_comp_put_bit_plus_pending_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000001000000000000000000000");
        IF ( st_comp_put_bit_plus_pending_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_for_2;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_for;
        END IF;
      WHEN st_comp_put_bit_plus_pending_1_for =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000010000000000000000000000");
        state_var_NS <= st_comp_put_bit_plus_pending_1_for_1;
      WHEN st_comp_put_bit_plus_pending_1_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000100000000000000000000000");
        IF ( st_comp_put_bit_plus_pending_1_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_for_2;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_1_for;
        END IF;
      WHEN st_comp_compress_for_for_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000001000000000000000000000000");
        state_var_NS <= st_comp_compress_for_for;
      WHEN st_main_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000010000000000000000000000000");
        state_var_NS <= st_main_3;
      WHEN st_main_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000100000000000000000000000000");
        IF ( st_main_3_tr0 = '1' ) THEN
          state_var_NS <= st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit;
        ELSIF ( st_main_3_tr1 = '1' ) THEN
          state_var_NS <= st_comp_put_bit_plus_pending_2_for;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_3_for;
        END IF;
      WHEN st_comp_put_bit_plus_pending_2_for =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000001000000000000000000000000000");
        state_var_NS <= st_comp_put_bit_plus_pending_2_for_1;
      WHEN st_comp_put_bit_plus_pending_2_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000010000000000000000000000000000");
        IF ( st_comp_put_bit_plus_pending_2_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_2_for;
        END IF;
      WHEN st_comp_put_bit_plus_pending_3_for =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000000100000000000000000000000000000");
        state_var_NS <= st_comp_put_bit_plus_pending_3_for_1;
      WHEN st_comp_put_bit_plus_pending_3_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000001000000000000000000000000000000");
        IF ( st_comp_put_bit_plus_pending_3_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_3_for;
        END IF;
      WHEN st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000010000000000000000000000000000000");
        state_var_NS <= st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_1;
      WHEN st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000000100000000000000000000000000000000");
        IF ( st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0 =
            '1' ) THEN
          state_var_NS <= st_dec_decompress_for_1;
        ELSE
          state_var_NS <= st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit;
        END IF;
      WHEN st_dec_decompress_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000001000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_1;
      WHEN st_dec_decompress_for_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000010000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_2;
      WHEN st_dec_decompress_for_1_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000000100000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_3;
      WHEN st_dec_decompress_for_1_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000001000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_4;
      WHEN st_dec_decompress_for_1_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000010000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_5;
      WHEN st_dec_decompress_for_1_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000000100000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_6;
      WHEN st_dec_decompress_for_1_6 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000001000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_getChar_for;
      WHEN st_ModelA_getChar_for =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000010000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_getChar_for_1;
      WHEN st_ModelA_getChar_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000000100000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_getChar_for_2;
      WHEN st_ModelA_getChar_for_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000001000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_getChar_for_3;
      WHEN st_ModelA_getChar_for_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000010000000000000000000000000000000000000000000");
        IF ( st_ModelA_getChar_for_3_tr0 = '1' ) THEN
          state_var_NS <= st_ModelA_getChar_for_4;
        ELSE
          state_var_NS <= st_ModelA_update_1_for;
        END IF;
      WHEN st_ModelA_update_1_for =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000000100000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_update_1_for_1;
      WHEN st_ModelA_update_1_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000001000000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_update_1_for_2;
      WHEN st_ModelA_update_1_for_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000010000000000000000000000000000000000000000000000");
        IF ( st_ModelA_update_1_for_2_tr0 = '1' ) THEN
          state_var_NS <= st_ModelA_getChar_for_4;
        ELSE
          state_var_NS <= st_ModelA_update_1_for;
        END IF;
      WHEN st_ModelA_getChar_for_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000000100000000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_getChar_for_5;
      WHEN st_ModelA_getChar_for_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000001000000000000000000000000000000000000000000000000");
        IF ( st_ModelA_getChar_for_5_tr0 = '1' ) THEN
          state_var_NS <= st_dec_decompress_for_1_7;
        ELSE
          state_var_NS <= st_ModelA_getChar_for;
        END IF;
      WHEN st_dec_decompress_for_1_7 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000010000000000000000000000000000000000000000000000000");
        IF ( st_dec_decompress_for_1_7_tr0 = '1' ) THEN
          state_var_NS <= st_main_4;
        ELSE
          state_var_NS <= st_dec_decompress_for_1_8;
        END IF;
      WHEN st_dec_decompress_for_1_8 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000000100000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_9;
      WHEN st_dec_decompress_for_1_9 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000001000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_10;
      WHEN st_dec_decompress_for_1_10 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000010000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_11;
      WHEN st_dec_decompress_for_1_11 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000000100000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_12;
      WHEN st_dec_decompress_for_1_12 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000001000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_13;
      WHEN st_dec_decompress_for_1_13 =>
        fsm_output <= STD_LOGIC_VECTOR'("0000010000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_for;
      WHEN st_dec_decompress_for_1_for =>
        fsm_output <= STD_LOGIC_VECTOR'("0000100000000000000000000000000000000000000000000000000000000");
        IF ( st_dec_decompress_for_1_for_tr0 = '1' ) THEN
          state_var_NS <= st_dec_decompress_for_1_14;
        ELSE
          state_var_NS <= st_dec_decompress_for_1_for_1;
        END IF;
      WHEN st_dec_decompress_for_1_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0001000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_for;
      WHEN st_dec_decompress_for_1_14 =>
        fsm_output <= STD_LOGIC_VECTOR'("0010000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1;
      WHEN st_main_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("0100000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_main_5;
      WHEN st_main_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("1000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_main;
      WHEN OTHERS =>
        fsm_output <= "0000000000000000000000000000000000000000000000000000000000000";
        state_var_NS <= st_main;
    END CASE;
  END PROCESS Main_Only_Comp_Decomp_Main_Fonction_core_fsm_1;

  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= st_main;
      ELSE
        IF ( core_wen = '1' ) THEN
          state_var <= state_var_NS;
        END IF;
      END IF;
    END IF;
  END PROCESS Main_Only_Comp_Decomp_Main_Fonction_core_fsm_1_REG;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps.ALL;
USE work.singleport_ram_be_pkg.ALL;
USE work.Main_Only_Comp_Decomp_Main_Fonction_mux_pkg.ALL;


ENTITY Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : OUT STD_LOGIC;
    Src_rsc_singleport_re_core_sct : OUT STD_LOGIC;
    Comp_rsc_singleport_re_core_sct : OUT STD_LOGIC;
    Comp_rsc_singleport_we_core_sct : OUT STD_LOGIC;
    Vga_rsc_singleport_we_core_sct : OUT STD_LOGIC;
    mgc_start_sync_mgc_bsync_vld_vd : IN STD_LOGIC;
    mgc_done_sync_mgc_bsync_rdy_rd_core_sct : OUT STD_LOGIC;
    Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct : OUT
        STD_LOGIC;
    Vga_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    Comp_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    Src_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    nblevels_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    Src_rsc_singleport_oswt : IN STD_LOGIC;
    Src_rsc_singleport_bcwt : OUT STD_LOGIC;
    Comp_rsc_singleport_oswt : IN STD_LOGIC;
    Comp_rsc_singleport_bcwt : OUT STD_LOGIC;
    Comp_rsc_singleport_re_core_psct : IN STD_LOGIC;
    Comp_rsc_singleport_we_core_psct : IN STD_LOGIC;
    Vga_rsc_singleport_oswt : IN STD_LOGIC;
    mgc_start_sync_mgc_bsync_vld_oswt : IN STD_LOGIC;
    mgc_done_sync_mgc_bsync_rdy_rd_core_psct : IN STD_LOGIC;
    Vga_triosy_mgc_io_sync_ld_core_psct : IN STD_LOGIC;
    Src_rsc_singleport_oswt_pff : IN STD_LOGIC;
    Comp_rsc_singleport_oswt_pff : IN STD_LOGIC;
    Vga_rsc_singleport_oswt_pff : IN STD_LOGIC
  );
END Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl;

ARCHITECTURE v1 OF Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL core_wen_drv : STD_LOGIC;
  SIGNAL Src_rsc_singleport_bcwt_drv : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL Src_rsc_singleport_tiswt0 : STD_LOGIC;
  SIGNAL Src_rsc_singleport_biwt : STD_LOGIC;
  SIGNAL Src_rsc_singleport_icwt : STD_LOGIC;
  SIGNAL core_wten : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_tiswt0 : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_biwt : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_icwt : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_tiswt0 : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_biwt : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_icwt : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_bcwt : STD_LOGIC;
  SIGNAL mgc_start_sync_mgc_bsync_vld_pdswt0 : STD_LOGIC;
  SIGNAL mgc_start_sync_mgc_bsync_vld_biwt : STD_LOGIC;
  SIGNAL mgc_start_sync_mgc_bsync_vld_icwt : STD_LOGIC;
  SIGNAL mgc_start_sync_mgc_bsync_vld_bcwt : STD_LOGIC;
  SIGNAL mgc_done_sync_mgc_bsync_rdy_ogwt : STD_LOGIC;
  SIGNAL mgc_done_sync_mgc_bsync_rdy_pdswt0 : STD_LOGIC;
  SIGNAL mgc_done_sync_mgc_bsync_rdy_icwt : STD_LOGIC;
  SIGNAL mgc_done_sync_mgc_bsync_rdy_bcwt : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ogwt : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_icwt : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_bcwt : STD_LOGIC;
  SIGNAL Vga_triosy_mgc_io_sync_ogwt : STD_LOGIC;
  SIGNAL Vga_triosy_mgc_io_sync_pdswt0 : STD_LOGIC;
  SIGNAL Vga_triosy_mgc_io_sync_icwt : STD_LOGIC;
  SIGNAL Vga_triosy_mgc_io_sync_bcwt : STD_LOGIC;
  SIGNAL Comp_triosy_mgc_io_sync_ogwt : STD_LOGIC;
  SIGNAL Comp_triosy_mgc_io_sync_icwt : STD_LOGIC;
  SIGNAL Comp_triosy_mgc_io_sync_bcwt : STD_LOGIC;
  SIGNAL Src_triosy_mgc_io_sync_ogwt : STD_LOGIC;
  SIGNAL Src_triosy_mgc_io_sync_icwt : STD_LOGIC;
  SIGNAL Src_triosy_mgc_io_sync_bcwt : STD_LOGIC;
  SIGNAL nblevels_triosy_mgc_io_sync_ogwt : STD_LOGIC;
  SIGNAL nblevels_triosy_mgc_io_sync_icwt : STD_LOGIC;
  SIGNAL nblevels_triosy_mgc_io_sync_bcwt : STD_LOGIC;
  SIGNAL and_22_cse : STD_LOGIC;
  SIGNAL and_30_cse : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_tiswt0_pff : STD_LOGIC;

BEGIN
  -- Default Constant Signal Assignments

  -- Output Reader Assignments
  core_wen <= core_wen_drv;
  Src_rsc_singleport_bcwt <= Src_rsc_singleport_bcwt_drv;
  Comp_rsc_singleport_bcwt <= Comp_rsc_singleport_bcwt_drv;

  Src_rsc_singleport_tiswt0 <= (NOT core_wten) AND Src_rsc_singleport_oswt;
  Src_rsc_singleport_biwt <= Src_rsc_singleport_tiswt0 OR Src_rsc_singleport_icwt;
  Comp_rsc_singleport_tiswt0 <= (NOT core_wten) AND Comp_rsc_singleport_oswt;
  Comp_rsc_singleport_biwt <= Comp_rsc_singleport_tiswt0 OR Comp_rsc_singleport_icwt;
  Vga_rsc_singleport_tiswt0 <= (NOT core_wten) AND Vga_rsc_singleport_oswt;
  Vga_rsc_singleport_biwt <= Vga_rsc_singleport_tiswt0 OR Vga_rsc_singleport_icwt;
  mgc_start_sync_mgc_bsync_vld_pdswt0 <= (NOT core_wten) AND mgc_start_sync_mgc_bsync_vld_oswt;
  mgc_start_sync_mgc_bsync_vld_biwt <= (mgc_start_sync_mgc_bsync_vld_pdswt0 OR mgc_start_sync_mgc_bsync_vld_icwt)
      AND mgc_start_sync_mgc_bsync_vld_vd;
  mgc_done_sync_mgc_bsync_rdy_pdswt0 <= (NOT core_wten) AND mgc_done_sync_mgc_bsync_rdy_rd_core_psct;
  mgc_done_sync_mgc_bsync_rdy_ogwt <= mgc_done_sync_mgc_bsync_rdy_pdswt0 OR mgc_done_sync_mgc_bsync_rdy_icwt;
  and_22_cse <= mgc_done_sync_mgc_bsync_rdy_rd_core_psct AND core_wen_drv;
  mgc_done_sync_mgc_bsync_rdy_rd_core_sct <= mgc_done_sync_mgc_bsync_rdy_rd_core_psct
      AND mgc_done_sync_mgc_bsync_rdy_ogwt;
  Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ogwt <= mgc_done_sync_mgc_bsync_rdy_pdswt0
      OR Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_icwt;
  Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct <= mgc_done_sync_mgc_bsync_rdy_rd_core_psct
      AND Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ogwt;
  Vga_triosy_mgc_io_sync_pdswt0 <= (NOT core_wten) AND Vga_triosy_mgc_io_sync_ld_core_psct;
  Vga_triosy_mgc_io_sync_ogwt <= Vga_triosy_mgc_io_sync_pdswt0 OR Vga_triosy_mgc_io_sync_icwt;
  and_30_cse <= Vga_triosy_mgc_io_sync_ld_core_psct AND core_wen_drv;
  Vga_triosy_mgc_io_sync_ld_core_sct <= Vga_triosy_mgc_io_sync_ld_core_psct AND Vga_triosy_mgc_io_sync_ogwt;
  Comp_triosy_mgc_io_sync_ogwt <= Vga_triosy_mgc_io_sync_pdswt0 OR Comp_triosy_mgc_io_sync_icwt;
  Comp_triosy_mgc_io_sync_ld_core_sct <= Vga_triosy_mgc_io_sync_ld_core_psct AND
      Comp_triosy_mgc_io_sync_ogwt;
  Src_triosy_mgc_io_sync_ogwt <= Vga_triosy_mgc_io_sync_pdswt0 OR Src_triosy_mgc_io_sync_icwt;
  Src_triosy_mgc_io_sync_ld_core_sct <= Vga_triosy_mgc_io_sync_ld_core_psct AND Src_triosy_mgc_io_sync_ogwt;
  nblevels_triosy_mgc_io_sync_ogwt <= Vga_triosy_mgc_io_sync_pdswt0 OR nblevels_triosy_mgc_io_sync_icwt;
  nblevels_triosy_mgc_io_sync_ld_core_sct <= Vga_triosy_mgc_io_sync_ld_core_psct
      AND nblevels_triosy_mgc_io_sync_ogwt;
  core_wen_drv <= ((NOT Src_rsc_singleport_oswt) OR Src_rsc_singleport_biwt OR Src_rsc_singleport_bcwt_drv)
      AND ((NOT Comp_rsc_singleport_oswt) OR Comp_rsc_singleport_biwt OR Comp_rsc_singleport_bcwt_drv)
      AND ((NOT Vga_rsc_singleport_oswt) OR Vga_rsc_singleport_biwt OR Vga_rsc_singleport_bcwt)
      AND ((NOT mgc_start_sync_mgc_bsync_vld_oswt) OR mgc_start_sync_mgc_bsync_vld_biwt
      OR mgc_start_sync_mgc_bsync_vld_bcwt) AND ((NOT mgc_done_sync_mgc_bsync_rdy_rd_core_psct)
      OR mgc_done_sync_mgc_bsync_rdy_ogwt OR mgc_done_sync_mgc_bsync_rdy_bcwt) AND
      ((NOT mgc_done_sync_mgc_bsync_rdy_rd_core_psct) OR Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ogwt
      OR Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_bcwt) AND
      ((NOT Vga_triosy_mgc_io_sync_ld_core_psct) OR Vga_triosy_mgc_io_sync_ogwt OR
      Vga_triosy_mgc_io_sync_bcwt) AND ((NOT Vga_triosy_mgc_io_sync_ld_core_psct)
      OR Comp_triosy_mgc_io_sync_ogwt OR Comp_triosy_mgc_io_sync_bcwt) AND ((NOT
      Vga_triosy_mgc_io_sync_ld_core_psct) OR Src_triosy_mgc_io_sync_ogwt OR Src_triosy_mgc_io_sync_bcwt)
      AND ((NOT Vga_triosy_mgc_io_sync_ld_core_psct) OR nblevels_triosy_mgc_io_sync_ogwt
      OR nblevels_triosy_mgc_io_sync_bcwt);
  Src_rsc_singleport_re_core_sct <= Src_rsc_singleport_oswt_pff AND core_wen_drv;
  Comp_rsc_singleport_re_core_sct <= Comp_rsc_singleport_re_core_psct AND Comp_rsc_singleport_tiswt0_pff;
  Comp_rsc_singleport_tiswt0_pff <= core_wen_drv AND Comp_rsc_singleport_oswt_pff;
  Comp_rsc_singleport_we_core_sct <= Comp_rsc_singleport_we_core_psct AND Comp_rsc_singleport_tiswt0_pff;
  Vga_rsc_singleport_we_core_sct <= Vga_rsc_singleport_oswt_pff AND core_wen_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        Src_rsc_singleport_icwt <= '0';
        Src_rsc_singleport_bcwt_drv <= '0';
        Comp_rsc_singleport_icwt <= '0';
        Comp_rsc_singleport_bcwt_drv <= '0';
        Vga_rsc_singleport_icwt <= '0';
        Vga_rsc_singleport_bcwt <= '0';
        mgc_start_sync_mgc_bsync_vld_icwt <= '0';
        mgc_start_sync_mgc_bsync_vld_bcwt <= '0';
        mgc_done_sync_mgc_bsync_rdy_icwt <= '0';
        mgc_done_sync_mgc_bsync_rdy_bcwt <= '0';
        Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_icwt <= '0';
        Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_bcwt <= '0';
        Vga_triosy_mgc_io_sync_icwt <= '0';
        Vga_triosy_mgc_io_sync_bcwt <= '0';
        Comp_triosy_mgc_io_sync_icwt <= '0';
        Comp_triosy_mgc_io_sync_bcwt <= '0';
        Src_triosy_mgc_io_sync_icwt <= '0';
        Src_triosy_mgc_io_sync_bcwt <= '0';
        nblevels_triosy_mgc_io_sync_icwt <= '0';
        nblevels_triosy_mgc_io_sync_bcwt <= '0';
        core_wten <= '0';
      ELSE
        Src_rsc_singleport_icwt <= Src_rsc_singleport_icwt XOR Src_rsc_singleport_tiswt0
            XOR Src_rsc_singleport_biwt;
        Src_rsc_singleport_bcwt_drv <= Src_rsc_singleport_bcwt_drv XOR Src_rsc_singleport_biwt
            XOR (Src_rsc_singleport_oswt AND core_wen_drv);
        Comp_rsc_singleport_icwt <= Comp_rsc_singleport_icwt XOR Comp_rsc_singleport_tiswt0
            XOR Comp_rsc_singleport_biwt;
        Comp_rsc_singleport_bcwt_drv <= Comp_rsc_singleport_bcwt_drv XOR Comp_rsc_singleport_biwt
            XOR (Comp_rsc_singleport_oswt AND core_wen_drv);
        Vga_rsc_singleport_icwt <= Vga_rsc_singleport_icwt XOR Vga_rsc_singleport_tiswt0
            XOR Vga_rsc_singleport_biwt;
        Vga_rsc_singleport_bcwt <= Vga_rsc_singleport_bcwt XOR Vga_rsc_singleport_biwt
            XOR (Vga_rsc_singleport_oswt AND core_wen_drv);
        mgc_start_sync_mgc_bsync_vld_icwt <= mgc_start_sync_mgc_bsync_vld_icwt XOR
            mgc_start_sync_mgc_bsync_vld_pdswt0 XOR mgc_start_sync_mgc_bsync_vld_biwt;
        mgc_start_sync_mgc_bsync_vld_bcwt <= mgc_start_sync_mgc_bsync_vld_bcwt XOR
            mgc_start_sync_mgc_bsync_vld_biwt XOR (mgc_start_sync_mgc_bsync_vld_oswt
            AND core_wen_drv);
        mgc_done_sync_mgc_bsync_rdy_icwt <= mgc_done_sync_mgc_bsync_rdy_icwt XOR
            mgc_done_sync_mgc_bsync_rdy_pdswt0 XOR mgc_done_sync_mgc_bsync_rdy_ogwt;
        mgc_done_sync_mgc_bsync_rdy_bcwt <= mgc_done_sync_mgc_bsync_rdy_bcwt XOR
            mgc_done_sync_mgc_bsync_rdy_ogwt XOR and_22_cse;
        Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_icwt <= Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_icwt
            XOR mgc_done_sync_mgc_bsync_rdy_pdswt0 XOR Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ogwt;
        Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_bcwt <= Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_bcwt
            XOR Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ogwt
            XOR and_22_cse;
        Vga_triosy_mgc_io_sync_icwt <= Vga_triosy_mgc_io_sync_icwt XOR Vga_triosy_mgc_io_sync_pdswt0
            XOR Vga_triosy_mgc_io_sync_ogwt;
        Vga_triosy_mgc_io_sync_bcwt <= Vga_triosy_mgc_io_sync_bcwt XOR Vga_triosy_mgc_io_sync_ogwt
            XOR and_30_cse;
        Comp_triosy_mgc_io_sync_icwt <= Comp_triosy_mgc_io_sync_icwt XOR Vga_triosy_mgc_io_sync_pdswt0
            XOR Comp_triosy_mgc_io_sync_ogwt;
        Comp_triosy_mgc_io_sync_bcwt <= Comp_triosy_mgc_io_sync_bcwt XOR Comp_triosy_mgc_io_sync_ogwt
            XOR and_30_cse;
        Src_triosy_mgc_io_sync_icwt <= Src_triosy_mgc_io_sync_icwt XOR Vga_triosy_mgc_io_sync_pdswt0
            XOR Src_triosy_mgc_io_sync_ogwt;
        Src_triosy_mgc_io_sync_bcwt <= Src_triosy_mgc_io_sync_bcwt XOR Src_triosy_mgc_io_sync_ogwt
            XOR and_30_cse;
        nblevels_triosy_mgc_io_sync_icwt <= nblevels_triosy_mgc_io_sync_icwt XOR
            Vga_triosy_mgc_io_sync_pdswt0 XOR nblevels_triosy_mgc_io_sync_ogwt;
        nblevels_triosy_mgc_io_sync_bcwt <= nblevels_triosy_mgc_io_sync_bcwt XOR
            nblevels_triosy_mgc_io_sync_ogwt XOR and_30_cse;
        core_wten <= NOT core_wen_drv;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    Main_Only_Comp_Decomp_Main_Fonction_core
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps.ALL;
USE work.singleport_ram_be_pkg.ALL;
USE work.Main_Only_Comp_Decomp_Main_Fonction_mux_pkg.ALL;


ENTITY Main_Only_Comp_Decomp_Main_Fonction_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    Src_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    Comp_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    core_wen : OUT STD_LOGIC;
    Src_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    Src_rsc_singleport_re_core_sct : OUT STD_LOGIC;
    Comp_rsc_singleport_data_in_core : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    Comp_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    Comp_rsc_singleport_re_core_sct : OUT STD_LOGIC;
    Comp_rsc_singleport_we_core_sct : OUT STD_LOGIC;
    Vga_rsc_singleport_data_in_core : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    Vga_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    Vga_rsc_singleport_we_core_sct : OUT STD_LOGIC;
    Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d : OUT STD_LOGIC_VECTOR
        (31 DOWNTO 0);
    cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in
        : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr :
        OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re : OUT
        STD_LOGIC;
    cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we : OUT
        STD_LOGIC;
    cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
        : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in :
        OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr : OUT
        STD_LOGIC_VECTOR (8 DOWNTO 0);
    main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re : OUT STD_LOGIC;
    main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we : OUT STD_LOGIC;
    main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out :
        IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mgc_start_sync_mgc_bsync_vld_vd : IN STD_LOGIC;
    mgc_done_sync_mgc_bsync_rdy_rd_core_sct : OUT STD_LOGIC;
    Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct : OUT
        STD_LOGIC;
    Vga_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    Comp_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    Src_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    nblevels_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    div_mgc_div_a : OUT STD_LOGIC_VECTOR (66 DOWNTO 0);
    div_mgc_div_b : OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
    div_mgc_div_z : IN STD_LOGIC_VECTOR (66 DOWNTO 0);
    div_mgc_div_1_a : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    div_mgc_div_1_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    div_mgc_div_1_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0)
  );
END Main_Only_Comp_Decomp_Main_Fonction_core;

ARCHITECTURE v1 OF Main_Only_Comp_Decomp_Main_Fonction_core IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL core_wen_drv : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d_drv : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

  -- Interconnect Declarations
  SIGNAL Src_rsc_singleport_bcwt : STD_LOGIC;
  SIGNAL Src_rsc_singleport_data_out_mxwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Src_rsc_singleport_data_out_bfwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Comp_rsc_singleport_bcwt : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_data_out_mxwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Comp_rsc_singleport_data_out_bfwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (60 DOWNTO 0);
  SIGNAL dec_decompress_for_1_and_tmp : STD_LOGIC;
  SIGNAL ModelA_getChar_for_if_acc_tmp : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL comp_compress_for_and_tmp : STD_LOGIC;
  SIGNAL or_dcpl_23 : STD_LOGIC;
  SIGNAL or_dcpl_26 : STD_LOGIC;
  SIGNAL or_dcpl_61 : STD_LOGIC;
  SIGNAL or_dcpl_67 : STD_LOGIC;
  SIGNAL or_dcpl_75 : STD_LOGIC;
  SIGNAL or_dcpl_80 : STD_LOGIC;
  SIGNAL or_dcpl_87 : STD_LOGIC;
  SIGNAL or_dcpl_96 : STD_LOGIC;
  SIGNAL or_dcpl_111 : STD_LOGIC;
  SIGNAL or_dcpl_124 : STD_LOGIC;
  SIGNAL or_dcpl_134 : STD_LOGIC;
  SIGNAL or_dcpl_137 : STD_LOGIC;
  SIGNAL or_dcpl_343 : STD_LOGIC;
  SIGNAL or_dcpl_354 : STD_LOGIC;
  SIGNAL or_dcpl_362 : STD_LOGIC;
  SIGNAL or_dcpl_365 : STD_LOGIC;
  SIGNAL or_dcpl_467 : STD_LOGIC;
  SIGNAL or_dcpl_474 : STD_LOGIC;
  SIGNAL or_dcpl_477 : STD_LOGIC;
  SIGNAL or_dcpl_479 : STD_LOGIC;
  SIGNAL or_dcpl_485 : STD_LOGIC;
  SIGNAL or_dcpl_486 : STD_LOGIC;
  SIGNAL or_dcpl_490 : STD_LOGIC;
  SIGNAL or_dcpl_496 : STD_LOGIC;
  SIGNAL or_dcpl_506 : STD_LOGIC;
  SIGNAL or_dcpl_509 : STD_LOGIC;
  SIGNAL or_dcpl_515 : STD_LOGIC;
  SIGNAL or_dcpl_528 : STD_LOGIC;
  SIGNAL or_dcpl_532 : STD_LOGIC;
  SIGNAL or_dcpl_1022 : STD_LOGIC;
  SIGNAL or_dcpl_1144 : STD_LOGIC;
  SIGNAL or_dcpl_1149 : STD_LOGIC;
  SIGNAL or_dcpl_1155 : STD_LOGIC;
  SIGNAL or_dcpl_1158 : STD_LOGIC;
  SIGNAL or_dcpl_1162 : STD_LOGIC;
  SIGNAL or_dcpl_1201 : STD_LOGIC;
  SIGNAL or_tmp_8 : STD_LOGIC;
  SIGNAL and_tmp_2 : STD_LOGIC;
  SIGNAL and_tmp_3 : STD_LOGIC;
  SIGNAL or_tmp_15 : STD_LOGIC;
  SIGNAL or_tmp_16 : STD_LOGIC;
  SIGNAL or_tmp_17 : STD_LOGIC;
  SIGNAL or_tmp_18 : STD_LOGIC;
  SIGNAL mux_tmp_10 : STD_LOGIC;
  SIGNAL and_dcpl_178 : STD_LOGIC;
  SIGNAL or_dcpl_1206 : STD_LOGIC;
  SIGNAL or_dcpl_1208 : STD_LOGIC;
  SIGNAL or_dcpl_1210 : STD_LOGIC;
  SIGNAL or_dcpl_1226 : STD_LOGIC;
  SIGNAL or_dcpl_1230 : STD_LOGIC;
  SIGNAL or_dcpl_1255 : STD_LOGIC;
  SIGNAL or_dcpl_1273 : STD_LOGIC;
  SIGNAL or_dcpl_1274 : STD_LOGIC;
  SIGNAL or_dcpl_1278 : STD_LOGIC;
  SIGNAL or_dcpl_1283 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL or_dcpl_1368 : STD_LOGIC;
  SIGNAL or_dcpl_1419 : STD_LOGIC;
  SIGNAL or_dcpl_1436 : STD_LOGIC;
  SIGNAL or_dcpl_1449 : STD_LOGIC;
  SIGNAL or_dcpl_1450 : STD_LOGIC;
  SIGNAL or_dcpl_1501 : STD_LOGIC;
  SIGNAL or_dcpl_1511 : STD_LOGIC;
  SIGNAL or_dcpl_1518 : STD_LOGIC;
  SIGNAL or_dcpl_1528 : STD_LOGIC;
  SIGNAL or_dcpl_1553 : STD_LOGIC;
  SIGNAL or_dcpl_1560 : STD_LOGIC;
  SIGNAL or_dcpl_1575 : STD_LOGIC;
  SIGNAL or_dcpl_1585 : STD_LOGIC;
  SIGNAL or_dcpl_1589 : STD_LOGIC;
  SIGNAL or_dcpl_1637 : STD_LOGIC;
  SIGNAL or_dcpl_1656 : STD_LOGIC;
  SIGNAL or_dcpl_1670 : STD_LOGIC;
  SIGNAL and_dcpl_233 : STD_LOGIC;
  SIGNAL and_dcpl_244 : STD_LOGIC;
  SIGNAL or_dcpl_1690 : STD_LOGIC;
  SIGNAL or_dcpl_1726 : STD_LOGIC;
  SIGNAL or_dcpl_1730 : STD_LOGIC;
  SIGNAL or_dcpl_1733 : STD_LOGIC;
  SIGNAL or_dcpl_1739 : STD_LOGIC;
  SIGNAL or_dcpl_2532 : STD_LOGIC;
  SIGNAL or_dcpl_2692 : STD_LOGIC;
  SIGNAL and_dcpl_326 : STD_LOGIC;
  SIGNAL and_dcpl_327 : STD_LOGIC;
  SIGNAL ModelA_getChar_for_if_p_low_lpi_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getChar_for_if_p_high_lpi_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getChar_for_if_p_count_lpi_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva : STD_LOGIC_VECTOR
      (8 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_cmodel_m_frozen_sva : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_comp_byte_to_encode_1_sva : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL comp_compress_high_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL comp_compress_pending_bits_1_lpi_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_getByte_slc_mdf_sva : STD_LOGIC;
  SIGNAL comp_compress_for_c_1_lpi_1_dfm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_compress_for_c_sg1_2_lpi_1_dfm : STD_LOGIC;
  SIGNAL ModelA_getProbability_p_low_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getProbability_p_high_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getProbability_p_count_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_ModelA_update_for_sva : STD_LOGIC;
  SIGNAL comp_compress_high_1_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_compress_low_1_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_compress_for_for_slc_svs : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL comp_put_bit_plus_pending_for_i_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_comp_put_bit_plus_pending_for_sva : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_4 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_4 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_4 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL comp_compress_for_for_else_slc_svs : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_3 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm_1 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL comp_put_bit_plus_pending_1_for_i_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_comp_put_bit_plus_pending_1_for_sva : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_5 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_5 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_5 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL comp_compress_pending_bits_1_lpi_2_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_compress_pending_bits_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_dfm : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL comp_put_bit_plus_pending_2_for_i_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_comp_put_bit_plus_pending_2_for_sva : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_6 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL unequal_tmp_6 : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_lpi_dfm : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_3 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL comp_put_bit_plus_pending_3_for_i_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_comp_put_bit_plus_pending_3_for_sva : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_7 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva : STD_LOGIC_VECTOR
      (8 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_cmodel_m_frozen_sva : STD_LOGIC;
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva : STD_LOGIC_VECTOR (7
      DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_input_byte_1_sva : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL dec_decompress_high_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL dec_decompress_value_1_sg7_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg6_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg8_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg5_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg9_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg4_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg10_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg3_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg11_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg2_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg12_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg1_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg13_sva : STD_LOGIC;
  SIGNAL dec_decompress_value_3_sva : STD_LOGIC;
  SIGNAL exit_dec_decompress_for_sva : STD_LOGIC;
  SIGNAL unequal_tmp_8 : STD_LOGIC;
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_1 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_1 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_input_byte_1_sva_dfm_1 : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL dec_decompress_value_1_sg13_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg12_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg11_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg10_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg9_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg8_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg7_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg6_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg5_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg4_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg3_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg2_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg1_sva_dfm : STD_LOGIC;
  SIGNAL dec_decompress_value_3_sva_dfm : STD_LOGIC;
  SIGNAL exit_dec_decompress_for_sva_dfm : STD_LOGIC;
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_input_byte_1_lpi_3 : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL dec_decompress_value_1_sg13_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg12_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg11_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg10_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg9_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg8_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg7_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg6_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg5_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg4_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg3_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg2_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg1_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_value_3_lpi_3 : STD_LOGIC;
  SIGNAL dec_decompress_for_1_range_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL dec_decompress_for_1_scaled_value_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getChar_for_i_1_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL ModelA_getChar_for_acc_2_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL ModelA_getChar_for_slc_2_cse_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getChar_for_if_p_low_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getChar_for_if_p_count_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_ModelA_update_1_for_sva : STD_LOGIC;
  SIGNAL main_decomp_Mn_Fonction_cmodel_m_frozen_sva_1 : STD_LOGIC;
  SIGNAL ModelA_getChar_for_not_sxt : STD_LOGIC;
  SIGNAL ModelA_getChar_for_if_p_low_lpi_1_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getChar_for_if_p_high_lpi_1_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getChar_for_if_p_count_lpi_1_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL dec_m_output_putByte_slc_svs : STD_LOGIC;
  SIGNAL main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva_1 : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL dec_decompress_high_1_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL dec_decompress_low_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL dec_decompress_for_1_for_else_else_land_lpi_2_dfm : STD_LOGIC;
  SIGNAL unequal_tmp_9 : STD_LOGIC;
  SIGNAL dec_decompress_for_1_scaled_value_acc_mut : STD_LOGIC_VECTOR (66 DOWNTO
      0);
  SIGNAL comp_compress_for_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL dec_decompress_for_1_mul_1_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL cmodel_reset_for_nor_itm : STD_LOGIC;
  SIGNAL cmodel_reset_for_acc_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL slc_ModelA_update_for_i_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL comp_compress_for_for_else_else_mux_3_itm : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL comp_compress_for_for_else_else_mux_4_itm : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL comp_compress_for_for_and_2_itm : STD_LOGIC;
  SIGNAL comp_compress_for_acc_3_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL ModelA_getProbability_mux_itm : STD_LOGIC;
  SIGNAL comp_getByte_mux_2_itm : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL cmodel_reset_2_for_nor_itm : STD_LOGIC;
  SIGNAL slc_ModelA_update_1_for_i_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL ModelA_getChar_for_slc_1_itm : STD_LOGIC;
  SIGNAL ModelA_getChar_for_slc_itm : STD_LOGIC;
  SIGNAL dec_decompress_for_1_acc_3_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL comp_compress_low_1_sva_4 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL ModelA_update_for_i_sva_sg1 : STD_LOGIC_VECTOR (22 DOWNTO 0);
  SIGNAL ModelA_update_for_i_sva_2 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL dec_decompress_low_sva_5 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL dec_decompress_value_1_sg14_sva_sg17 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg16 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg15 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg14 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg13 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg12 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg11 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg10 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg9 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg8 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg7 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg6 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg5 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg4 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg2 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_5 : STD_LOGIC;
  SIGNAL dec_decompress_for_i_1_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg17 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg16 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg15 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg14 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg13 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg12 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg11 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg10 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg9 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg8 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg7 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg6 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg5 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg4 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg2 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_sg1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_dfm_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg17 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg16 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg15 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg14 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg13 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg12 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg11 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg10 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg9 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg8 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg7 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg6 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg5 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg4 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg2 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_3_sg1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_lpi_5 : STD_LOGIC;
  SIGNAL ModelA_update_1_for_i_sva_sg1 : STD_LOGIC_VECTOR (22 DOWNTO 0);
  SIGNAL ModelA_update_1_for_i_sva_2 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL comp_compress_for_for_else_else_mux_1_itm_1 : STD_LOGIC;
  SIGNAL comp_compress_for_for_else_else_mux_2_itm_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg16 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg15 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg14 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg13 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg12 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg11 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg10 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg9 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg8 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg7 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg6 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg5 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg4 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg3 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg2 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg1 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_1 : STD_LOGIC;
  SIGNAL cmodel_reset_2_for_mux_19_itm_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg16 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg15 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg14 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg13 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg12 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg11 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg10 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg9 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg8 : STD_LOGIC;
  SIGNAL comp_compress_for_mul_1_psp : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL dec_decompress_for_1_mul_psp : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL or_1237_cse : STD_LOGIC;
  SIGNAL dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx0w0 : STD_LOGIC;
  SIGNAL dec_decompress_for_1_for_nor_cse : STD_LOGIC;
  SIGNAL dec_decompress_for_1_for_and_1_cse : STD_LOGIC;
  SIGNAL comp_getByte_Compressor_getByte_return_1_lpi_1_dfm : STD_LOGIC_VECTOR (7
      DOWNTO 0);
  SIGNAL dec_decompress_for_i_1_sva_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL reg_nblevels_triosy_mgc_io_sync_iswt0_cse : STD_LOGIC;
  SIGNAL reg_Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_iswt0_cse
      : STD_LOGIC;
  SIGNAL reg_start_sync_mgc_bsync_vld_iswt0_cse : STD_LOGIC;
  SIGNAL reg_Vga_rsc_singleport_we_core_psct_cse : STD_LOGIC;
  SIGNAL reg_Comp_rsc_singleport_iswt0_cse : STD_LOGIC;
  SIGNAL reg_Src_rsc_singleport_re_core_psct_cse : STD_LOGIC;
  SIGNAL or_1252_cse : STD_LOGIC;
  SIGNAL or_1256_cse : STD_LOGIC;
  SIGNAL or_1414_cse : STD_LOGIC;
  SIGNAL or_1509_cse : STD_LOGIC;
  SIGNAL or_1800_cse : STD_LOGIC;
  SIGNAL or_2622_cse : STD_LOGIC;
  SIGNAL or_2733_cse : STD_LOGIC;
  SIGNAL and_241_ssc : STD_LOGIC;
  SIGNAL reg_div_mgc_div_b_tmp_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL or_1260_ssc : STD_LOGIC;
  SIGNAL reg_div_mgc_div_a_tmp : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL reg_div_mgc_div_a_tmp_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_229_ssc : STD_LOGIC;
  SIGNAL and_235_ssc : STD_LOGIC;
  SIGNAL and_247_ssc : STD_LOGIC;
  SIGNAL and_344_ssc : STD_LOGIC;
  SIGNAL and_223_ssc : STD_LOGIC;
  SIGNAL and_266_ssc : STD_LOGIC;
  SIGNAL and_367_cse : STD_LOGIC;
  SIGNAL and_369_cse : STD_LOGIC;
  SIGNAL Src_rsc_singleport_re_core_sct_reg : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_re_core_sct_reg : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_we_core_sct_reg : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_we_core_sct_reg : STD_LOGIC;
  SIGNAL and_192_rmff : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_4 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_2 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_8 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL ModelA_getChar_for_i_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL comp_compress_for_c_sg1_2_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL comp_compress_for_c_1_lpi_1_dfm_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_146_itm : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL z_out_7 : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL z_out_8 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_9 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL z_out_10 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_12 : STD_LOGIC_VECTOR (17 DOWNTO 0);
  SIGNAL z_out_13 : STD_LOGIC_VECTOR (17 DOWNTO 0);
  SIGNAL z_out_14 : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL z_out_15 : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL z_out_16 : STD_LOGIC_VECTOR (22 DOWNTO 0);
  SIGNAL z_out_17 : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL z_out_18 : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx1 : STD_LOGIC;
  SIGNAL div_mgc_div_1_b_mx1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL dec_decompress_for_1_scaled_value_acc_mut_mx0w2 : STD_LOGIC_VECTOR (66 DOWNTO
      0);
  SIGNAL unequal_tmp_10 : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1_mx1w0 :
      STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_compress_pending_bits_1_lpi_2_dfm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1_mx1w0 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL dec_decompress_value_3_sva_mx0w2 : STD_LOGIC;
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_mx0 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3_mx1 : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL dec_decompress_for_1_scaled_value_acc_4_sdt : STD_LOGIC_VECTOR (32 DOWNTO
      0);
  SIGNAL dec_decompress_value_1_sg14_sva_2_sg1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL dec_decompress_value_1_sg14_lpi_3_dfm_3 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL dec_decompress_high_1_sva_1_dfm_sg1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL or_1566_tmp : STD_LOGIC;
  SIGNAL or_1534_tmp : STD_LOGIC;
  SIGNAL or_1503_tmp : STD_LOGIC;
  SIGNAL or_1552_tmp : STD_LOGIC;
  SIGNAL reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp : STD_LOGIC;
  SIGNAL reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1 :
      STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp : STD_LOGIC;
  SIGNAL reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1 : STD_LOGIC_VECTOR
      (6 DOWNTO 0);
  SIGNAL or_1569_tmp : STD_LOGIC;
  SIGNAL or_2552_tmp : STD_LOGIC;
  SIGNAL dec_decompress_for_1_scaled_value_acc_5_sdt : STD_LOGIC_VECTOR (32 DOWNTO
      0);
  SIGNAL or_2756_cse : STD_LOGIC;
  SIGNAL and_388_cse : STD_LOGIC;
  SIGNAL and_389_cse : STD_LOGIC;
  SIGNAL and_390_cse : STD_LOGIC;
  SIGNAL and_392_cse : STD_LOGIC;
  SIGNAL and_391_cse : STD_LOGIC;
  SIGNAL or_2755_cse : STD_LOGIC;
  SIGNAL and_497_cse : STD_LOGIC;
  SIGNAL and_503_cse : STD_LOGIC;
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_350 : STD_LOGIC;
  SIGNAL nor_75_cse : STD_LOGIC;
  SIGNAL nor_73_cse : STD_LOGIC;
  SIGNAL nor_36_cse : STD_LOGIC;
  SIGNAL nor_37_cse : STD_LOGIC;
  SIGNAL and_384_itm : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL dec_m_input_get_bit_or_1_itm : STD_LOGIC;
  SIGNAL and_385_itm : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp : STD_LOGIC;
  SIGNAL reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1 :
      STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp :
      STD_LOGIC;
  SIGNAL reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1
      : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp : STD_LOGIC;
  SIGNAL reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp_1 : STD_LOGIC_VECTOR
      (6 DOWNTO 0);

  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL mux_141_nl : STD_LOGIC;
  SIGNAL mux_140_nl : STD_LOGIC;
  SIGNAL mux1h_382_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL mux_149_nl : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL mux_150_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_374_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_375_nl : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL mux_157_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL mux1h_388_nl : STD_LOGIC;
  SIGNAL mux_151_nl : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL mux_152_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_153_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_389_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_376_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_377_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_155_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mux_156_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL mux1h_378_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_158_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL mux_159_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL mux_160_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_161_nl : STD_LOGIC_VECTOR (17 DOWNTO 0);
  SIGNAL mux1h_379_nl : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL mux_187_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  COMPONENT Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : OUT STD_LOGIC;
      Src_rsc_singleport_re_core_sct : OUT STD_LOGIC;
      Comp_rsc_singleport_re_core_sct : OUT STD_LOGIC;
      Comp_rsc_singleport_we_core_sct : OUT STD_LOGIC;
      Vga_rsc_singleport_we_core_sct : OUT STD_LOGIC;
      mgc_start_sync_mgc_bsync_vld_vd : IN STD_LOGIC;
      mgc_done_sync_mgc_bsync_rdy_rd_core_sct : OUT STD_LOGIC;
      Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct :
          OUT STD_LOGIC;
      Vga_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      Comp_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      Src_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      nblevels_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      Src_rsc_singleport_oswt : IN STD_LOGIC;
      Src_rsc_singleport_bcwt : OUT STD_LOGIC;
      Comp_rsc_singleport_oswt : IN STD_LOGIC;
      Comp_rsc_singleport_bcwt : OUT STD_LOGIC;
      Comp_rsc_singleport_re_core_psct : IN STD_LOGIC;
      Comp_rsc_singleport_we_core_psct : IN STD_LOGIC;
      Vga_rsc_singleport_oswt : IN STD_LOGIC;
      mgc_start_sync_mgc_bsync_vld_oswt : IN STD_LOGIC;
      mgc_done_sync_mgc_bsync_rdy_rd_core_psct : IN STD_LOGIC;
      Vga_triosy_mgc_io_sync_ld_core_psct : IN STD_LOGIC;
      Src_rsc_singleport_oswt_pff : IN STD_LOGIC;
      Comp_rsc_singleport_oswt_pff : IN STD_LOGIC;
      Vga_rsc_singleport_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_re_core_psct
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_we_core_psct
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_oswt_pff
      : STD_LOGIC;

  COMPONENT Main_Only_Comp_Decomp_Main_Fonction_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (60 DOWNTO 0);
      st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0 : IN
          STD_LOGIC;
      st_comp_compress_for_3_tr0 : IN STD_LOGIC;
      st_ModelA_update_for_2_tr0 : IN STD_LOGIC;
      st_comp_compress_for_for_tr0 : IN STD_LOGIC;
      st_comp_compress_for_for_tr1 : IN STD_LOGIC;
      st_comp_compress_for_for_1_tr0 : IN STD_LOGIC;
      st_comp_compress_for_for_1_tr1 : IN STD_LOGIC;
      st_comp_put_bit_plus_pending_for_1_tr0 : IN STD_LOGIC;
      st_comp_put_bit_plus_pending_1_for_1_tr0 : IN STD_LOGIC;
      st_main_3_tr0 : IN STD_LOGIC;
      st_main_3_tr1 : IN STD_LOGIC;
      st_comp_put_bit_plus_pending_2_for_1_tr0 : IN STD_LOGIC;
      st_comp_put_bit_plus_pending_3_for_1_tr0 : IN STD_LOGIC;
      st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0 : IN STD_LOGIC;
      st_ModelA_getChar_for_3_tr0 : IN STD_LOGIC;
      st_ModelA_update_1_for_2_tr0 : IN STD_LOGIC;
      st_ModelA_getChar_for_5_tr0 : IN STD_LOGIC;
      st_dec_decompress_for_1_7_tr0 : IN STD_LOGIC;
      st_dec_decompress_for_1_for_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR
      (60 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_3_tr0
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr0
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr1
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr0
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr1
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_main_3_tr0 : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_main_3_tr1 : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_3_tr0
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_5_tr0
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_7_tr0
      : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_for_tr0
      : STD_LOGIC;

BEGIN
  -- Default Constant Signal Assignments

  -- Output Reader Assignments
  core_wen <= core_wen_drv;
  Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d <= Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d_drv;

  Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl_inst : Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen_drv,
      Src_rsc_singleport_re_core_sct => Src_rsc_singleport_re_core_sct_reg,
      Comp_rsc_singleport_re_core_sct => Comp_rsc_singleport_re_core_sct_reg,
      Comp_rsc_singleport_we_core_sct => Comp_rsc_singleport_we_core_sct_reg,
      Vga_rsc_singleport_we_core_sct => Vga_rsc_singleport_we_core_sct_reg,
      mgc_start_sync_mgc_bsync_vld_vd => mgc_start_sync_mgc_bsync_vld_vd,
      mgc_done_sync_mgc_bsync_rdy_rd_core_sct => mgc_done_sync_mgc_bsync_rdy_rd_core_sct,
      Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct =>
          Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct,
      Vga_triosy_mgc_io_sync_ld_core_sct => Vga_triosy_mgc_io_sync_ld_core_sct,
      Comp_triosy_mgc_io_sync_ld_core_sct => Comp_triosy_mgc_io_sync_ld_core_sct,
      Src_triosy_mgc_io_sync_ld_core_sct => Src_triosy_mgc_io_sync_ld_core_sct,
      nblevels_triosy_mgc_io_sync_ld_core_sct => nblevels_triosy_mgc_io_sync_ld_core_sct,
      Src_rsc_singleport_oswt => reg_Src_rsc_singleport_re_core_psct_cse,
      Src_rsc_singleport_bcwt => Src_rsc_singleport_bcwt,
      Comp_rsc_singleport_oswt => reg_Comp_rsc_singleport_iswt0_cse,
      Comp_rsc_singleport_bcwt => Comp_rsc_singleport_bcwt,
      Comp_rsc_singleport_re_core_psct => Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_re_core_psct,
      Comp_rsc_singleport_we_core_psct => Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_we_core_psct,
      Vga_rsc_singleport_oswt => reg_Vga_rsc_singleport_we_core_psct_cse,
      mgc_start_sync_mgc_bsync_vld_oswt => reg_start_sync_mgc_bsync_vld_iswt0_cse,
      mgc_done_sync_mgc_bsync_rdy_rd_core_psct => reg_Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_iswt0_cse,
      Vga_triosy_mgc_io_sync_ld_core_psct => reg_nblevels_triosy_mgc_io_sync_iswt0_cse,
      Src_rsc_singleport_oswt_pff => and_dcpl_178,
      Comp_rsc_singleport_oswt_pff => Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_oswt_pff,
      Vga_rsc_singleport_oswt_pff => and_192_rmff
    );
  Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_re_core_psct
      <= NOT (MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'(or_tmp_17
      & (NOT(or_tmp_18 OR (NOT((z_out_12(17)) AND or_tmp_17))))), main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(0)))
      & or_tmp_17), or_tmp_15));
  Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_we_core_psct
      <= NOT and_tmp_3;
  Main_Only_Comp_Decomp_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_oswt_pff
      <= NOT mux_146_itm;

  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst : Main_Only_Comp_Decomp_Main_Fonction_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen_drv,
      fsm_output => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_fsm_output,
      st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0,
      st_comp_compress_for_3_tr0 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_3_tr0,
      st_ModelA_update_for_2_tr0 => exit_ModelA_update_for_sva,
      st_comp_compress_for_for_tr0 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr0,
      st_comp_compress_for_for_tr1 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr1,
      st_comp_compress_for_for_1_tr0 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr0,
      st_comp_compress_for_for_1_tr1 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr1,
      st_comp_put_bit_plus_pending_for_1_tr0 => exit_comp_put_bit_plus_pending_for_sva,
      st_comp_put_bit_plus_pending_1_for_1_tr0 => exit_comp_put_bit_plus_pending_1_for_sva,
      st_main_3_tr0 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_main_3_tr0,
      st_main_3_tr1 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_main_3_tr1,
      st_comp_put_bit_plus_pending_2_for_1_tr0 => exit_comp_put_bit_plus_pending_2_for_sva,
      st_comp_put_bit_plus_pending_3_for_1_tr0 => exit_comp_put_bit_plus_pending_3_for_sva,
      st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0,
      st_ModelA_getChar_for_3_tr0 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_3_tr0,
      st_ModelA_update_1_for_2_tr0 => exit_ModelA_update_1_for_sva,
      st_ModelA_getChar_for_5_tr0 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_5_tr0,
      st_dec_decompress_for_1_7_tr0 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_7_tr0,
      st_dec_decompress_for_1_for_tr0 => Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_for_tr0
    );
  fsm_output <= Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_fsm_output;
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0
      <= cmodel_reset_for_nor_itm;
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_3_tr0 <=
      cod_entropique_Mn_Fonction_cmodel_m_frozen_sva OR exit_ModelA_update_for_sva;
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr0
      <= comp_compress_for_c_sg1_2_lpi_1_dfm AND (NOT (comp_compress_for_c_1_lpi_1_dfm(7)))
      AND (NOT((comp_compress_for_c_1_lpi_1_dfm(6)) OR (comp_compress_for_c_1_lpi_1_dfm(5))))
      AND (NOT((comp_compress_for_c_1_lpi_1_dfm(4)) OR (comp_compress_for_c_1_lpi_1_dfm(3))
      OR (comp_compress_for_c_1_lpi_1_dfm(2)))) AND (NOT((comp_compress_for_c_1_lpi_1_dfm(1))
      OR (comp_compress_for_c_1_lpi_1_dfm(0)) OR (z_out_13(17)))) AND or_dcpl_61
      AND (z_out_12(17));
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr1
      <= (z_out_13(17)) OR (NOT (z_out_12(17))) OR ((comp_compress_low_1_sva_1(14))
      AND (z_out_15(18)));
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr0
      <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((comp_compress_for_for_slc_svs AND exit_comp_put_bit_plus_pending_for_sva)
      & ((NOT comp_compress_for_for_slc_svs) OR exit_comp_put_bit_plus_pending_for_sva)),
      exit_comp_put_bit_plus_pending_1_for_sva OR comp_compress_for_for_else_slc_svs);
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr1
      <= (NOT exit_comp_put_bit_plus_pending_for_sva) AND comp_compress_for_for_slc_svs;
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_main_3_tr0 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(exit_comp_put_bit_plus_pending_2_for_sva
      & exit_comp_put_bit_plus_pending_3_for_sva), comp_compress_low_1_sva_1(14));
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_main_3_tr1 <= NOT(exit_comp_put_bit_plus_pending_2_for_sva
      OR (comp_compress_low_1_sva_1(14)));
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_1_tr0
      <= exit_dec_decompress_for_sva_dfm AND cmodel_reset_2_for_nor_itm;
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_3_tr0 <=
      main_decomp_Mn_Fonction_cmodel_m_frozen_sva OR (NOT ModelA_getChar_for_slc_1_itm);
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_5_tr0 <=
      ModelA_getChar_for_slc_1_itm OR (NOT ModelA_getChar_for_slc_itm);
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_7_tr0
      <= dec_decompress_for_1_and_tmp;
  Main_Only_Comp_Decomp_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_for_tr0
      <= (z_out_12(17)) AND (NOT (z_out_13(17))) AND (NOT((dec_decompress_low_sva_1(14))
      AND (z_out_15(18))));

  Src_rsc_singleport_data_out_mxwt <= MUX_v_8_2_2(Src_rsc_singleport_data_out & Src_rsc_singleport_data_out_bfwt,
      Src_rsc_singleport_bcwt);
  Comp_rsc_singleport_data_out_mxwt <= MUX_v_8_2_2(Comp_rsc_singleport_data_out &
      Comp_rsc_singleport_data_out_bfwt, Comp_rsc_singleport_bcwt);
  and_192_rmff <= (fsm_output(49)) AND (NOT dec_decompress_for_1_and_tmp) AND dec_m_output_putByte_slc_svs;
  mux_145_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(mux_tmp_10 & (NOT(or_tmp_18 OR (NOT((z_out_12(17))
      AND mux_tmp_10))))), main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(0));
  mux_146_itm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((mux_145_nl) & mux_tmp_10), or_tmp_15);
  or_2755_cse <= (fsm_output(11)) OR (fsm_output(49));
  or_1252_cse <= or_dcpl_1226 OR or_dcpl_365;
  or_1256_cse <= or_dcpl_1230 OR or_dcpl_467;
  div_mgc_div_b <= TO_STDLOGICVECTOR('0') & reg_div_mgc_div_b_tmp_1;
  or_1260_ssc <= or_dcpl_1208 OR (fsm_output(12)) OR (fsm_output(16));
  div_mgc_div_a <= reg_div_mgc_div_a_tmp & reg_div_mgc_div_a_tmp_1;
  and_367_cse <= (NOT(comp_compress_for_for_else_slc_svs OR comp_compress_for_for_slc_svs))
      AND (fsm_output(24));
  and_369_cse <= comp_compress_for_for_slc_svs AND (fsm_output(24));
  or_2756_cse <= or_dcpl_1208 OR or_dcpl_137 OR or_dcpl_1283 OR or_dcpl_111 OR or_dcpl_1278
      OR or_dcpl_1255 OR or_dcpl_1274 OR (fsm_output(9)) OR (fsm_output(4)) OR (comp_compress_for_for_and_2_itm
      AND (fsm_output(24)));
  or_1414_cse <= or_dcpl_1208 OR or_dcpl_137 OR or_dcpl_1283 OR or_dcpl_111 OR or_dcpl_1278
      OR or_dcpl_1255 OR or_dcpl_1273 OR or_dcpl_124;
  or_1503_tmp <= (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm(2))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(3))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm(4)) OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(5))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(6))
      OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(1))
      OR (NOT (z_out_16(22)));
  nor_75_cse <= NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(2))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(3)));
  nor_73_cse <= NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(4))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(5)));
  and_229_ssc <= nor_75_cse AND nor_73_cse AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(6))
      OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(1))));
  cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm <= TO_STDLOGICVECTOR(reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp)
      & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1;
  or_1509_cse <= or_dcpl_1450 OR or_dcpl_1419;
  nor_36_cse <= NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(1))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(2)));
  nor_37_cse <= NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(3))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(4)));
  and_235_ssc <= nor_36_cse AND nor_37_cse AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(5))
      OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp OR
      (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(6))));
  cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1 <= TO_STDLOGICVECTOR(reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp)
      & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1;
  or_1534_tmp <= (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(1))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(2))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(3)) OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(4))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(5))
      OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp OR
      (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(6))
      OR (NOT (z_out_16(22)));
  or_1552_tmp <= (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(1))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(2))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(3))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(4))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(5))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(6))
      OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp OR (NOT
      (z_out_16(22)));
  and_241_ssc <= (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(1))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(2))))
      AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(3))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(4))))
      AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(5))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(6))
      OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp));
  or_1566_tmp <= (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(0))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(1))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(2))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(3))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(4))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5))
      OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp OR (NOT
      (z_out_16(22)));
  and_247_ssc <= (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(0))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(1))))
      AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(2))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(3))))
      AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(4))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5))
      OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp));
  or_1569_tmp <= exit_dec_decompress_for_sva OR unequal_tmp_8;
  and_497_cse <= (NOT or_1569_tmp) AND (fsm_output(32));
  main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm <= TO_STDLOGICVECTOR(reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp)
      & reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp_1;
  and_392_cse <= exit_dec_decompress_for_sva AND (fsm_output(31));
  and_391_cse <= (NOT exit_dec_decompress_for_sva) AND (fsm_output(31));
  and_503_cse <= (NOT ModelA_getChar_for_slc_1_itm) AND (fsm_output(48));
  or_1800_cse <= or_dcpl_1226 OR or_dcpl_1670 OR or_dcpl_1230 OR or_dcpl_1739 OR
      or_dcpl_1162 OR or_dcpl_1733 OR or_dcpl_1730 OR (fsm_output(33)) OR (fsm_output(57))
      OR (fsm_output(49));
  and_388_cse <= dec_decompress_for_1_for_nor_cse AND (fsm_output(56));
  and_389_cse <= dec_decompress_for_1_for_and_1_cse AND (fsm_output(56));
  and_390_cse <= (z_out_13(17)) AND (fsm_output(56));
  or_2552_tmp <= (NOT (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(0)))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(1)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(2))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(3)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(4))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(5)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(6))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(7));
  and_344_ssc <= (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(0)) AND (NOT
      (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(1))) AND (NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(2))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(3)))) AND (NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(4))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(5)))) AND (NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(6))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(7))));
  or_2622_cse <= or_dcpl_1226 OR or_dcpl_1670 OR or_dcpl_1230 OR or_dcpl_1739 OR
      or_dcpl_1162 OR or_dcpl_2532 OR or_dcpl_1656 OR (fsm_output(55)) OR (fsm_output(57))
      OR (fsm_output(49));
  or_2733_cse <= or_dcpl_1230 OR or_dcpl_467 OR or_dcpl_2692 OR (fsm_output(57))
      OR (fsm_output(59));
  dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx0w0 <= (z_out_15(18)) AND (dec_decompress_low_sva_1(14));
  dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx1 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx0w0
      & dec_decompress_for_1_for_else_else_land_lpi_2_dfm), or_dcpl_1022);
  div_mgc_div_1_b_mx1 <= MUX_v_32_2_2(ModelA_getChar_for_if_p_count_sva & ModelA_getChar_for_if_p_count_lpi_1,
      ModelA_getChar_for_not_sxt);
  dec_decompress_for_1_scaled_value_acc_mut_mx0w2 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(SIGNED(z_out_7),
      67) + CONV_SIGNED(CONV_SIGNED('1', 1), 67), 67));
  comp_compress_for_c_sg1_2_lpi_1_dfm_1 <= (NOT comp_getByte_slc_mdf_sva) OR comp_compress_for_and_tmp;
  comp_compress_for_c_1_lpi_1_dfm_1 <= comp_getByte_Compressor_getByte_return_1_lpi_1_dfm
      AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT comp_compress_for_and_tmp,
      1),8));
  comp_compress_for_and_tmp <= (NOT comp_getByte_slc_mdf_sva) AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(7))
      AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(6)) AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(5))
      AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(4)) AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(3))
      AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(2)) AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(1))
      AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(0));
  comp_getByte_Compressor_getByte_return_1_lpi_1_dfm <= Src_rsc_singleport_data_out_mxwt
      OR STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT comp_getByte_slc_mdf_sva, 1),8));
  unequal_tmp_10 <= (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(7))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(6)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(5))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(4)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(3))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(2)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(1));
  cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1_mx1w0 <= MUX_v_32_2_2(z_out_10
      & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2, (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(1))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(2)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(3))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(4)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(5))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(6)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(7))
      OR (NOT (z_out_16(22))));
  and_223_ssc <= (NOT((cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(1))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(2)))) AND (NOT((cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(3))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(4)))) AND (NOT((cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(5))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(6)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(7))));
  and_384_itm <= (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(7 DOWNTO
      1)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT and_223_ssc, 1),7));
  comp_compress_pending_bits_1_lpi_2_dfm_2 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(comp_compress_pending_bits_1_lpi_2)
      + CONV_SIGNED(CONV_UNSIGNED('1', 1), 32), 32));
  cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_4 <= cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2
      OR cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2;
  cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_2 <= cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm
      OR (TO_STDLOGICVECTOR(reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp)
      & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1);
  cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1_mx1w0 <= MUX_v_32_2_2(z_out_10
      & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2, or_tmp_8 OR unequal_tmp_6);
  dec_m_input_get_bit_or_1_itm <= ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_mx0(7))
      AND reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_mx0(6))
      AND (reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp_1(6)))
      OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_mx0(5)) AND
      (reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp_1(5))) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_mx0(4))
      AND (reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp_1(4)))
      OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_mx0(3)) AND
      (reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp_1(3))) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_mx0(2))
      AND (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm(2))) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_mx0(1))
      AND (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm(1))) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_mx0(0))
      AND (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm(0)));
  dec_decompress_value_3_sva_mx0w2 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_m_input_get_bit_or_1_itm
      & dec_decompress_value_3_sva), exit_dec_decompress_for_sva);
  cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_8 <= cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_dfm
      OR (TO_STDLOGICVECTOR(reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp)
      & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1);
  and_266_ssc <= and_dcpl_244 AND (NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(2))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(3)))) AND (NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(4))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(5)))) AND (NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(6))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(7))));
  and_385_itm <= (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(7 DOWNTO 1))
      AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT and_266_ssc, 1),7));
  dec_decompress_for_i_1_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(dec_decompress_for_i_1_sva_2),
      5) + CONV_UNSIGNED(CONV_UNSIGNED('1', 1), 5), 5));
  main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_mx0 <= MUX_v_8_2_2(Comp_rsc_singleport_data_out_mxwt
      & main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva, unequal_tmp_8);
  main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3_mx1 <= MUX_v_8_2_2(Comp_rsc_singleport_data_out_mxwt
      & main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3, unequal_tmp_9);
  dec_decompress_for_1_scaled_value_acc_4_sdt <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED'(dec_decompress_value_1_sg14_sva_dfm_sg17
      & dec_decompress_value_1_sg14_sva_dfm_sg16 & dec_decompress_value_1_sg14_sva_dfm_sg15
      & dec_decompress_value_1_sg14_sva_dfm_sg14 & dec_decompress_value_1_sg14_sva_dfm_sg13
      & dec_decompress_value_1_sg14_sva_dfm_sg12 & dec_decompress_value_1_sg14_sva_dfm_sg11
      & dec_decompress_value_1_sg14_sva_dfm_sg10 & dec_decompress_value_1_sg14_sva_dfm_sg9
      & dec_decompress_value_1_sg14_sva_dfm_sg8 & dec_decompress_value_1_sg14_sva_dfm_sg7
      & dec_decompress_value_1_sg14_sva_dfm_sg6 & dec_decompress_value_1_sg14_sva_dfm_sg5
      & dec_decompress_value_1_sg14_sva_dfm_sg4 & dec_decompress_value_1_sg14_sva_dfm_sg3
      & dec_decompress_value_1_sg14_sva_dfm_sg2 & dec_decompress_value_1_sg14_sva_dfm_sg1
      & dec_decompress_value_1_sg14_sva_dfm_1 & dec_decompress_value_1_sg13_sva_dfm
      & dec_decompress_value_1_sg12_sva_dfm & dec_decompress_value_1_sg11_sva_dfm
      & dec_decompress_value_1_sg10_sva_dfm & dec_decompress_value_1_sg9_sva_dfm
      & dec_decompress_value_1_sg8_sva_dfm & dec_decompress_value_1_sg7_sva_dfm &
      dec_decompress_value_1_sg6_sva_dfm & dec_decompress_value_1_sg5_sva_dfm & dec_decompress_value_1_sg4_sva_dfm
      & dec_decompress_value_1_sg3_sva_dfm & dec_decompress_value_1_sg2_sva_dfm &
      dec_decompress_value_1_sg1_sva_dfm & dec_decompress_value_3_sva_dfm), 33) +
      CONV_UNSIGNED(UNSIGNED(STD_LOGIC_VECTOR'("11111111111111111") & (NOT dec_decompress_low_sva_5)),
      33), 33));
  ModelA_getChar_for_if_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR('1')
      & dec_decompress_for_1_scaled_value_sva & TO_STDLOGICVECTOR('1')) + CONV_UNSIGNED(UNSIGNED((NOT
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out)
      & TO_STDLOGICVECTOR('1')), 34), 34));
  ModelA_getChar_for_i_1_lpi_1_dfm_mx0 <= MUX_v_9_2_2(ModelA_getChar_for_i_1_sva
      & ModelA_getChar_for_acc_2_psp_sva, ModelA_getChar_for_not_sxt);
  dec_decompress_value_1_sg14_sva_2_sg1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(dec_decompress_value_1_sg14_lpi_3_sg16
      & dec_decompress_value_1_sg14_lpi_3_sg15 & dec_decompress_value_1_sg14_lpi_3_sg14
      & dec_decompress_value_1_sg14_lpi_3_sg13 & dec_decompress_value_1_sg14_lpi_3_sg12
      & dec_decompress_value_1_sg14_lpi_3_sg11 & dec_decompress_value_1_sg14_lpi_3_sg10
      & dec_decompress_value_1_sg14_lpi_3_sg9 & dec_decompress_value_1_sg14_lpi_3_sg8
      & dec_decompress_value_1_sg14_lpi_3_sg7 & dec_decompress_value_1_sg14_lpi_3_sg6
      & dec_decompress_value_1_sg14_lpi_3_sg5 & dec_decompress_value_1_sg14_lpi_3_sg4
      & dec_decompress_value_1_sg14_lpi_3_sg3 & dec_decompress_value_1_sg14_lpi_3_sg2
      & dec_decompress_value_1_sg14_lpi_3_sg1) + CONV_UNSIGNED(CONV_SIGNED('1', 1),
      16), 16));
  dec_decompress_for_1_for_nor_cse <= NOT((z_out_12(17)) OR (z_out_13(17)));
  dec_decompress_value_1_sg14_lpi_3_dfm_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(dec_decompress_value_1_sg14_lpi_3_sg16
      & dec_decompress_value_1_sg14_lpi_3_sg15 & dec_decompress_value_1_sg14_lpi_3_sg14
      & dec_decompress_value_1_sg14_lpi_3_sg13 & dec_decompress_value_1_sg14_lpi_3_sg12
      & dec_decompress_value_1_sg14_lpi_3_sg11 & dec_decompress_value_1_sg14_lpi_3_sg10
      & dec_decompress_value_1_sg14_lpi_3_sg9 & dec_decompress_value_1_sg14_lpi_3_sg8
      & dec_decompress_value_1_sg14_lpi_3_sg7 & dec_decompress_value_1_sg14_lpi_3_sg6
      & dec_decompress_value_1_sg14_lpi_3_sg5 & dec_decompress_value_1_sg14_lpi_3_sg4
      & dec_decompress_value_1_sg14_lpi_3_sg3 & dec_decompress_value_1_sg14_lpi_3_sg2
      & dec_decompress_value_1_sg14_lpi_3_sg1 & dec_decompress_value_1_sg14_lpi_5)
      + CONV_UNSIGNED(CONV_SIGNED('1', 1), 17), 17));
  dec_decompress_for_1_for_and_1_cse <= (z_out_12(17)) AND (NOT (z_out_13(17)));
  dec_decompress_high_1_sva_1_dfm_sg1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(dec_decompress_high_1_sva_1(30
      DOWNTO 14)) + CONV_UNSIGNED(CONV_SIGNED('1', 1), 17), 17));
  dec_decompress_for_1_and_tmp <= (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(8)) AND (NOT((ModelA_getChar_for_i_1_lpi_1_dfm_mx0(7))
      OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(6)) OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(5))
      OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(4)) OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(3))
      OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(2)) OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(1))
      OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(0))));
  or_dcpl_23 <= (fsm_output(10)) OR (fsm_output(7));
  or_dcpl_26 <= (fsm_output(13)) OR (fsm_output(14));
  or_dcpl_61 <= NOT((comp_compress_low_1_sva_1(14)) AND (z_out_15(18)));
  or_dcpl_67 <= (fsm_output(48)) OR (fsm_output(40));
  or_dcpl_75 <= (fsm_output(45)) OR (fsm_output(46));
  or_dcpl_80 <= (fsm_output(50)) OR (fsm_output(52));
  or_dcpl_87 <= (fsm_output(28)) OR (fsm_output(29));
  or_dcpl_96 <= (fsm_output(34)) OR (fsm_output(37));
  or_dcpl_111 <= (fsm_output(12)) OR (fsm_output(10));
  or_dcpl_124 <= (fsm_output(24)) OR (fsm_output(9));
  or_dcpl_134 <= (fsm_output(21)) OR (fsm_output(19));
  or_dcpl_137 <= (fsm_output(17)) OR (fsm_output(22));
  or_dcpl_343 <= (fsm_output(18)) OR (fsm_output(25));
  or_dcpl_354 <= (fsm_output(23)) OR (fsm_output(21));
  or_dcpl_362 <= (fsm_output(30)) OR (fsm_output(26));
  or_dcpl_365 <= (fsm_output(35)) OR (fsm_output(38));
  or_dcpl_467 <= (fsm_output(53)) OR (fsm_output(54));
  or_dcpl_474 <= (fsm_output(32)) OR (fsm_output(31));
  or_dcpl_477 <= (fsm_output(57)) OR (fsm_output(58));
  or_dcpl_479 <= (fsm_output(55)) OR (fsm_output(33));
  or_dcpl_485 <= (fsm_output(54)) OR (fsm_output(41));
  or_dcpl_486 <= (fsm_output(44)) OR (fsm_output(43));
  or_dcpl_490 <= (fsm_output(31)) OR (fsm_output(45));
  or_dcpl_496 <= (fsm_output(38)) OR (fsm_output(39));
  or_dcpl_506 <= (fsm_output(42)) OR (fsm_output(48));
  or_dcpl_509 <= (fsm_output(41)) OR (fsm_output(56));
  or_dcpl_515 <= (fsm_output(53)) OR (fsm_output(45));
  or_dcpl_528 <= (fsm_output(47)) OR (fsm_output(42));
  or_dcpl_532 <= (fsm_output(46)) OR (fsm_output(44));
  or_dcpl_1022 <= (NOT (z_out_12(17))) OR (z_out_13(17));
  or_dcpl_1144 <= (fsm_output(60)) OR (fsm_output(56));
  or_dcpl_1149 <= (fsm_output(2)) OR (fsm_output(9));
  or_dcpl_1155 <= or_dcpl_67 OR or_dcpl_479;
  or_dcpl_1158 <= or_dcpl_509 OR or_dcpl_528;
  or_dcpl_1162 <= or_dcpl_486 OR (fsm_output(54));
  or_dcpl_1201 <= or_dcpl_96 OR (fsm_output(36)) OR (fsm_output(35));
  or_tmp_8 <= (NOT (z_out_16(22))) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(7))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(6)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(5))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(4)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(3))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(2)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(1));
  and_tmp_2 <= ((NOT (fsm_output(20))) OR (NOT (z_out_16(22))) OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(1))
      OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm(6))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(5))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(4))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(3))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm(2))) AND ((NOT
      (fsm_output(22))) OR (NOT (z_out_16(22))) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(6))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(7)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(5))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(4)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(3))
      OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(2)) OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(1)))
      AND ((NOT (fsm_output(29))) OR (NOT (z_out_16(22))) OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(4))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(3))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(2))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(1))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(0)));
  mux_140_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT and_tmp_2) & ((NOT (z_out_12(17)))
      OR (z_out_13(17)) OR (NOT and_tmp_2))), fsm_output(18));
  mux_141_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT((fsm_output(25)) OR (mux_140_nl)))
      & and_tmp_2), or_tmp_8);
  and_tmp_3 <= ((NOT (fsm_output(27))) OR (NOT (z_out_16(22))) OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(6))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(5))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(4))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(3))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(2))
      OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(1)))
      AND (mux_141_nl);
  or_tmp_15 <= (NOT (fsm_output(56))) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(7))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(6)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(5))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(4)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(3))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(2)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(1));
  or_tmp_16 <= (NOT (fsm_output(31))) OR exit_dec_decompress_for_sva OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(7))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(6)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(5))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(4)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(3))
      OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(2)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(1));
  or_tmp_17 <= or_tmp_16 OR (NOT (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(0)));
  or_tmp_18 <= ((z_out_15(18)) AND (dec_decompress_low_sva_1(14))) OR (z_out_13(17));
  mux_tmp_10 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(0))
      OR (NOT and_tmp_3))) & and_tmp_3), or_tmp_16);
  and_dcpl_178 <= (fsm_output(4)) AND (z_out_9(7));
  or_dcpl_1206 <= (fsm_output(12)) OR (fsm_output(11));
  or_dcpl_1208 <= or_dcpl_26 OR (fsm_output(15));
  or_dcpl_1210 <= (fsm_output(51)) OR (fsm_output(53));
  or_1237_cse <= or_dcpl_80 OR or_dcpl_1210;
  or_dcpl_1226 <= or_dcpl_96 OR (fsm_output(36));
  or_dcpl_1230 <= or_dcpl_80 OR (fsm_output(51));
  or_dcpl_1255 <= (fsm_output(6)) OR (fsm_output(8));
  or_dcpl_1273 <= (fsm_output(18)) OR (fsm_output(16));
  or_dcpl_1274 <= or_dcpl_1273 OR (fsm_output(5));
  or_dcpl_1278 <= (fsm_output(7)) OR (fsm_output(20)) OR (fsm_output(11));
  or_dcpl_1283 <= or_dcpl_354 OR (fsm_output(19));
  and_dcpl_192 <= NOT((fsm_output(3)) OR (fsm_output(18)));
  or_dcpl_1368 <= (fsm_output(6)) OR (fsm_output(9));
  or_dcpl_1419 <= (fsm_output(19)) OR (fsm_output(20));
  or_dcpl_1436 <= or_dcpl_532 OR (fsm_output(43));
  or_dcpl_1449 <= (fsm_output(22)) OR (fsm_output(23));
  or_dcpl_1450 <= or_dcpl_1449 OR (fsm_output(21));
  or_dcpl_1501 <= (fsm_output(23)) OR (fsm_output(19));
  or_dcpl_1511 <= (fsm_output(21)) OR (fsm_output(20));
  or_dcpl_1518 <= (fsm_output(26)) OR (fsm_output(28));
  or_dcpl_1528 <= or_dcpl_362 OR (fsm_output(28));
  or_dcpl_1553 <= or_dcpl_528 OR (fsm_output(48));
  or_dcpl_1560 <= or_dcpl_75 OR (fsm_output(44));
  or_dcpl_1575 <= or_dcpl_477 OR (fsm_output(49));
  or_dcpl_1585 <= or_dcpl_532 OR (fsm_output(43)) OR (fsm_output(54));
  or_dcpl_1589 <= or_dcpl_474 OR (fsm_output(45));
  or_dcpl_1637 <= (fsm_output(41)) OR (fsm_output(47));
  or_dcpl_1656 <= or_dcpl_506 OR (fsm_output(40));
  or_dcpl_1670 <= or_dcpl_365 OR (fsm_output(39));
  and_dcpl_233 <= NOT((fsm_output(30)) OR (fsm_output(26)));
  and_dcpl_244 <= (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(0)) AND (NOT
      (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(1)));
  or_dcpl_1690 <= (fsm_output(32)) OR (fsm_output(58));
  or_dcpl_1726 <= or_dcpl_75 OR or_dcpl_486;
  or_dcpl_1730 <= or_dcpl_67 OR (fsm_output(55));
  or_dcpl_1733 <= or_dcpl_1637 OR (fsm_output(42));
  or_dcpl_1739 <= or_dcpl_515 OR (fsm_output(46));
  or_dcpl_2532 <= or_dcpl_509 OR (fsm_output(47));
  or_dcpl_2692 <= (fsm_output(56)) OR (fsm_output(55));
  and_dcpl_326 <= ModelA_getChar_for_not_sxt AND (fsm_output(49));
  and_dcpl_327 <= (NOT ModelA_getChar_for_not_sxt) AND (fsm_output(49));
  Src_rsc_singleport_addr_core <= cod_entropique_Mn_Fonction_comp_byte_to_encode_1_sva;
  Src_rsc_singleport_re_core_sct <= Src_rsc_singleport_re_core_sct_reg;
  Comp_rsc_singleport_data_in_core <= MUX1HOT_v_8_6_2(cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_4
      & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2 & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_2
      & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm_1 & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_8
      & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_lpi_dfm, STD_LOGIC_VECTOR'((((NOT
      (z_out_13(17))) AND (fsm_output(18))) OR ((comp_compress_low_1_sva_1(14)) AND
      (fsm_output(25)))) & (((z_out_13(17)) AND (fsm_output(18))) OR ((NOT (comp_compress_low_1_sva_1(14)))
      AND (fsm_output(25)))) & (fsm_output(20)) & (fsm_output(22)) & (fsm_output(27))
      & (fsm_output(29))));
  Comp_rsc_singleport_addr_core <= MUX1HOT_v_17_7_2((cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2(16
      DOWNTO 0)) & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1(16
      DOWNTO 0)) & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_3(16
      DOWNTO 0)) & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1(16
      DOWNTO 0)) & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_3(16
      DOWNTO 0)) & main_decomp_Mn_Fonction_dec_m_input_input_byte_1_sva & main_decomp_Mn_Fonction_dec_m_input_input_byte_1_lpi_3,
      STD_LOGIC_VECTOR'(or_dcpl_343 & (fsm_output(20)) & (fsm_output(22)) & (fsm_output(27))
      & (fsm_output(29)) & (fsm_output(31)) & (fsm_output(56))));
  Comp_rsc_singleport_re_core_sct <= Comp_rsc_singleport_re_core_sct_reg;
  Comp_rsc_singleport_we_core_sct <= Comp_rsc_singleport_we_core_sct_reg;
  Vga_rsc_singleport_data_in_core <= ModelA_getChar_for_i_1_lpi_1_dfm_mx0(7 DOWNTO
      0);
  Vga_rsc_singleport_addr_core <= main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva;
  Vga_rsc_singleport_we_core_sct <= Vga_rsc_singleport_we_core_sct_reg;
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in <=
      MUX_v_32_2_2((STD_LOGIC_VECTOR'("00000000000000000000000") & TO_STDLOGICVECTOR(cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))
      & TO_STDLOGICVECTOR((cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(7))
      AND (NOT (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(6))
      AND (NOT (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(5))
      AND (NOT (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(4))
      AND (NOT (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(3))
      AND (NOT (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(2))
      AND (NOT (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(1))
      AND (NOT (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR(cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(0)))
      & z_out_10, fsm_output(9));
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr <= MUX1HOT_v_9_6_2(cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva
      & STD_LOGIC_VECTOR'("100000001") & STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR(comp_compress_for_c_sg1_2_lpi_1_dfm_1)
      & comp_compress_for_c_1_lpi_1_dfm_1) + CONV_UNSIGNED(CONV_UNSIGNED('1', 1),
      9), 9)) & (TO_STDLOGICVECTOR(comp_compress_for_c_sg1_2_lpi_1_dfm) & comp_compress_for_c_1_lpi_1_dfm)
      & ModelA_update_for_i_sva_2 & slc_ModelA_update_for_i_itm, STD_LOGIC_VECTOR'((fsm_output(2))
      & ((fsm_output(3)) OR (fsm_output(11)) OR (fsm_output(18))) & (fsm_output(5))
      & (fsm_output(6)) & (fsm_output(8)) & (fsm_output(9))));
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re <= NOT((((NOT
      comp_compress_for_c_sg1_2_lpi_1_dfm) OR (comp_compress_for_c_1_lpi_1_dfm(7))
      OR (comp_compress_for_c_1_lpi_1_dfm(6)) OR (comp_compress_for_c_1_lpi_1_dfm(5))
      OR (comp_compress_for_c_1_lpi_1_dfm(4)) OR (comp_compress_for_c_1_lpi_1_dfm(3))
      OR (comp_compress_for_c_1_lpi_1_dfm(2)) OR (comp_compress_for_c_1_lpi_1_dfm(1))
      OR (comp_compress_for_c_1_lpi_1_dfm(0))) AND or_dcpl_61 AND (NOT (z_out_13(17)))
      AND (z_out_12(17)) AND (fsm_output(18))) OR ((fsm_output(3)) AND cmodel_reset_for_nor_itm)
      OR ((fsm_output(11)) AND (NOT cod_entropique_Mn_Fonction_cmodel_m_frozen_sva))
      OR or_dcpl_1255 OR (fsm_output(5)));
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we <= NOT
      or_dcpl_1149;
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in <= MUX_v_32_2_2((STD_LOGIC_VECTOR'("00000000000000000000000")
      & TO_STDLOGICVECTOR(main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))
      & TO_STDLOGICVECTOR((main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(7))
      AND (NOT (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(6))
      AND (NOT (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(5))
      AND (NOT (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(4))
      AND (NOT (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(3))
      AND (NOT (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(2))
      AND (NOT (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR((main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(1))
      AND (NOT (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))))
      & TO_STDLOGICVECTOR(main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(0)))
      & z_out_10, fsm_output(45));
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr <= MUX1HOT_v_9_6_2(main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva
      & STD_LOGIC_VECTOR'("100000001") & z_out_8 & ModelA_getChar_for_i_1_sva & ModelA_update_1_for_i_sva_2
      & slc_ModelA_update_1_for_i_itm, STD_LOGIC_VECTOR'((fsm_output(31)) & ((fsm_output(32))
      OR (fsm_output(41)) OR (fsm_output(47)) OR (fsm_output(58))) & (fsm_output(40))
      & (fsm_output(42)) & (fsm_output(44)) & (fsm_output(45))));
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re <= NOT(((((fsm_output(47))
      AND (NOT main_decomp_Mn_Fonction_cmodel_m_frozen_sva)) OR (fsm_output(42)))
      AND ModelA_getChar_for_slc_1_itm) OR ((fsm_output(32)) AND exit_dec_decompress_for_sva_dfm
      AND cmodel_reset_2_for_nor_itm) OR ((fsm_output(41)) AND (ModelA_getChar_for_if_acc_tmp(33)))
      OR (fsm_output(44)) OR (fsm_output(40)) OR (fsm_output(58)));
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we <= NOT or_dcpl_490;
  dec_decompress_for_1_scaled_value_acc_5_sdt <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(dec_decompress_for_1_scaled_value_acc_4_sdt(32
      DOWNTO 1)), 33) + CONV_UNSIGNED(SIGNED'("10000000000000000000000000000001"),
      33), 33));
  and_dcpl <= (NOT unequal_tmp_10) AND (fsm_output(18));
  and_dcpl_350 <= (NOT unequal_tmp_6) AND (fsm_output(25));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        Src_rsc_singleport_data_out_bfwt <= STD_LOGIC_VECTOR'("00000000");
        Comp_rsc_singleport_data_out_bfwt <= STD_LOGIC_VECTOR'("00000000");
      ELSE
        Src_rsc_singleport_data_out_bfwt <= Src_rsc_singleport_data_out_mxwt;
        Comp_rsc_singleport_data_out_bfwt <= Comp_rsc_singleport_data_out_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d_drv <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        dec_decompress_for_1_for_else_else_land_lpi_2_dfm <= '0';
        ModelA_getChar_for_if_p_count_lpi_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        ModelA_getChar_for_if_p_high_lpi_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        ModelA_getChar_for_if_p_low_lpi_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        reg_nblevels_triosy_mgc_io_sync_iswt0_cse <= '0';
        reg_Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_iswt0_cse
            <= '0';
        reg_start_sync_mgc_bsync_vld_iswt0_cse <= '0';
        reg_Vga_rsc_singleport_we_core_psct_cse <= '0';
        reg_Comp_rsc_singleport_iswt0_cse <= '0';
        reg_Src_rsc_singleport_re_core_psct_cse <= '0';
        div_mgc_div_1_b <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        div_mgc_div_1_a <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000");
        cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva <= STD_LOGIC_VECTOR'("000000000");
        cmodel_reset_for_nor_itm <= '0';
        cmodel_reset_for_acc_itm <= STD_LOGIC_VECTOR'("000000000");
        cod_entropique_Mn_Fonction_comp_byte_to_encode_1_sva <= STD_LOGIC_VECTOR'("00000000000000000");
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2 <= STD_LOGIC_VECTOR'("00000000");
        cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2 <= STD_LOGIC_VECTOR'("00000000");
        comp_compress_pending_bits_1_lpi_2 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_compress_low_1_sva_4 <= STD_LOGIC_VECTOR'("000000000000000");
        cod_entropique_Mn_Fonction_cmodel_m_frozen_sva <= '0';
        comp_compress_high_1_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        ModelA_getProbability_p_count_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_getByte_slc_mdf_sva <= '0';
        comp_getByte_mux_2_itm <= STD_LOGIC_VECTOR'("00000000000000000");
        ModelA_update_for_i_sva_sg1 <= STD_LOGIC_VECTOR'("00000000000000000000000");
        ModelA_update_for_i_sva_2 <= STD_LOGIC_VECTOR'("000000000");
        exit_ModelA_update_for_sva <= '0';
        comp_compress_for_c_sg1_2_lpi_1_dfm <= '0';
        comp_compress_for_c_1_lpi_1_dfm <= STD_LOGIC_VECTOR'("00000000");
        ModelA_getProbability_p_high_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        ModelA_getProbability_p_low_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        slc_ModelA_update_for_i_itm <= STD_LOGIC_VECTOR'("000000000");
        comp_compress_for_mul_1_psp <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000");
        comp_compress_for_acc_3_itm <= STD_LOGIC_VECTOR'("0000000000000000");
        comp_compress_for_mul_mut <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000");
        ModelA_getProbability_mux_itm <= '0';
        comp_compress_high_1_sva_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_compress_low_1_sva_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_put_bit_plus_pending_3_for_i_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        unequal_tmp_6 <= '0';
        comp_put_bit_plus_pending_2_for_i_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_compress_for_for_else_slc_svs <= '0';
        comp_compress_for_for_slc_svs <= '0';
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm <= STD_LOGIC_VECTOR'("00000000");
        comp_put_bit_plus_pending_for_i_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        exit_comp_put_bit_plus_pending_for_sva <= '0';
        comp_compress_pending_bits_1_lpi_2_dfm <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_compress_for_for_else_else_mux_2_itm_1 <= '0';
        comp_compress_for_for_else_else_mux_4_itm <= STD_LOGIC_VECTOR'("00000000000000");
        comp_compress_for_for_else_else_mux_1_itm_1 <= '0';
        comp_compress_for_for_else_else_mux_3_itm <= STD_LOGIC_VECTOR'("00000000000000");
        exit_comp_put_bit_plus_pending_1_for_sva <= '0';
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_3 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm_1 <= STD_LOGIC_VECTOR'("00000000");
        comp_put_bit_plus_pending_1_for_i_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_compress_for_for_and_2_itm <= '0';
        cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_5 <= STD_LOGIC_VECTOR'("00000000");
        cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_4 <= STD_LOGIC_VECTOR'("00000000");
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_5 <= STD_LOGIC_VECTOR'("00000000");
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_4 <= STD_LOGIC_VECTOR'("00000000");
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_5 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_4 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_compress_pending_bits_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_dfm <= STD_LOGIC_VECTOR'("00000000");
        exit_comp_put_bit_plus_pending_2_for_sva <= '0';
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_3 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_lpi_dfm <= STD_LOGIC_VECTOR'("00000000");
        exit_comp_put_bit_plus_pending_3_for_sva <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg16 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_1 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg15 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg1 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg14 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg2 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg13 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg3 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg12 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg4 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg11 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg5 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg10 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg6 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg9 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg7 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg8 <= '0';
        dec_decompress_value_1_sg14_sva_sg16 <= '0';
        dec_decompress_value_1_sg14_sva_5 <= '0';
        dec_decompress_value_1_sg14_sva_sg15 <= '0';
        dec_decompress_value_1_sg14_sva_sg1 <= '0';
        dec_decompress_value_1_sg14_sva_sg14 <= '0';
        dec_decompress_value_1_sg14_sva_sg2 <= '0';
        dec_decompress_value_1_sg14_sva_sg13 <= '0';
        dec_decompress_value_1_sg14_sva_sg3 <= '0';
        dec_decompress_value_1_sg14_sva_sg12 <= '0';
        dec_decompress_value_1_sg14_sva_sg4 <= '0';
        dec_decompress_value_1_sg14_sva_sg11 <= '0';
        dec_decompress_value_1_sg14_sva_sg5 <= '0';
        dec_decompress_value_1_sg14_sva_sg10 <= '0';
        dec_decompress_value_1_sg14_sva_sg6 <= '0';
        dec_decompress_value_1_sg14_sva_sg9 <= '0';
        dec_decompress_value_1_sg14_sva_sg7 <= '0';
        dec_decompress_value_1_sg14_sva_sg8 <= '0';
        main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva <= STD_LOGIC_VECTOR'("00000000");
        main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva <= STD_LOGIC_VECTOR'("00000000");
        main_decomp_Mn_Fonction_dec_m_input_input_byte_1_sva <= STD_LOGIC_VECTOR'("00000000000000000");
        dec_decompress_for_i_1_sva_2 <= STD_LOGIC_VECTOR'("0000");
        main_decomp_Mn_Fonction_cmodel_m_frozen_sva <= '0';
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_6 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_7 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva <= STD_LOGIC_VECTOR'("00000000000000000");
        dec_decompress_low_sva_5 <= STD_LOGIC_VECTOR'("000000000000000");
        dec_decompress_high_1_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        dec_decompress_value_3_sva <= '0';
        exit_dec_decompress_for_sva <= '0';
        main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva <= STD_LOGIC_VECTOR'("000000000");
        dec_decompress_value_1_sg1_sva <= '0';
        dec_decompress_value_1_sg2_sva <= '0';
        dec_decompress_value_1_sg3_sva <= '0';
        dec_decompress_value_1_sg4_sva <= '0';
        dec_decompress_value_1_sg5_sva <= '0';
        dec_decompress_value_1_sg6_sva <= '0';
        dec_decompress_value_1_sg7_sva <= '0';
        dec_decompress_value_1_sg8_sva <= '0';
        dec_decompress_value_1_sg9_sva <= '0';
        dec_decompress_value_1_sg10_sva <= '0';
        dec_decompress_value_1_sg11_sva <= '0';
        dec_decompress_value_1_sg12_sva <= '0';
        dec_decompress_value_1_sg13_sva <= '0';
        dec_decompress_value_1_sg14_sva_sg17 <= '0';
        unequal_tmp_8 <= '0';
        main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_1 <= STD_LOGIC_VECTOR'("00000000");
        main_decomp_Mn_Fonction_dec_m_input_input_byte_1_sva_dfm_1 <= STD_LOGIC_VECTOR'("00000000000000000");
        dec_decompress_value_1_sg14_sva_dfm_sg17 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg16 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg15 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg14 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg13 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg12 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg11 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg10 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg9 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg8 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg7 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg6 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg5 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg4 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg3 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg2 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_sg1 <= '0';
        dec_decompress_value_1_sg14_sva_dfm_1 <= '0';
        dec_decompress_value_1_sg13_sva_dfm <= '0';
        dec_decompress_value_1_sg12_sva_dfm <= '0';
        dec_decompress_value_1_sg11_sva_dfm <= '0';
        dec_decompress_value_1_sg10_sva_dfm <= '0';
        dec_decompress_value_1_sg9_sva_dfm <= '0';
        dec_decompress_value_1_sg8_sva_dfm <= '0';
        dec_decompress_value_1_sg7_sva_dfm <= '0';
        dec_decompress_value_1_sg6_sva_dfm <= '0';
        dec_decompress_value_1_sg5_sva_dfm <= '0';
        dec_decompress_value_1_sg4_sva_dfm <= '0';
        dec_decompress_value_1_sg3_sva_dfm <= '0';
        dec_decompress_value_1_sg2_sva_dfm <= '0';
        dec_decompress_value_1_sg1_sva_dfm <= '0';
        cmodel_reset_2_for_nor_itm <= '0';
        exit_dec_decompress_for_sva_dfm <= '0';
        cmodel_reset_2_for_mux_19_itm_1 <= STD_LOGIC_VECTOR'("0000");
        ModelA_getChar_for_i_1_sva <= STD_LOGIC_VECTOR'("000000000");
        dec_decompress_value_3_sva_dfm <= '0';
        dec_decompress_value_3_lpi_3 <= '0';
        dec_decompress_value_1_sg1_lpi_3 <= '0';
        dec_decompress_value_1_sg2_lpi_3 <= '0';
        dec_decompress_value_1_sg3_lpi_3 <= '0';
        dec_decompress_value_1_sg4_lpi_3 <= '0';
        dec_decompress_value_1_sg5_lpi_3 <= '0';
        dec_decompress_value_1_sg6_lpi_3 <= '0';
        dec_decompress_value_1_sg7_lpi_3 <= '0';
        dec_decompress_value_1_sg8_lpi_3 <= '0';
        dec_decompress_value_1_sg9_lpi_3 <= '0';
        dec_decompress_value_1_sg10_lpi_3 <= '0';
        dec_decompress_value_1_sg11_lpi_3 <= '0';
        dec_decompress_value_1_sg12_lpi_3 <= '0';
        dec_decompress_value_1_sg13_lpi_3 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg17 <= '0';
        dec_decompress_value_1_sg14_lpi_5 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg16 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg1 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg15 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg2 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg14 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg3 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg13 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg4 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg12 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg5 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg11 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg6 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg10 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg7 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg9 <= '0';
        dec_decompress_value_1_sg14_lpi_3_sg8 <= '0';
        main_decomp_Mn_Fonction_dec_m_input_input_byte_1_lpi_3 <= STD_LOGIC_VECTOR'("00000000000000000");
        main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3 <= STD_LOGIC_VECTOR'("00000000");
        main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3 <= STD_LOGIC_VECTOR'("00000000");
        main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_1 <= STD_LOGIC_VECTOR'("00000000");
        dec_decompress_for_1_range_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        dec_decompress_for_1_scaled_value_acc_mut <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000000");
        dec_m_output_putByte_slc_svs <= '0';
        main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva_1 <= STD_LOGIC_VECTOR'("00000000000000000");
        dec_decompress_for_1_acc_3_itm <= STD_LOGIC_VECTOR'("0000000000000000");
        ModelA_getChar_for_not_sxt <= '0';
        dec_decompress_for_1_scaled_value_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        ModelA_getChar_for_acc_2_psp_sva <= STD_LOGIC_VECTOR'("000000000");
        ModelA_getChar_for_slc_itm <= '0';
        ModelA_update_1_for_i_sva_sg1 <= STD_LOGIC_VECTOR'("00000000000000000000000");
        ModelA_update_1_for_i_sva_2 <= STD_LOGIC_VECTOR'("000000000");
        exit_ModelA_update_1_for_sva <= '0';
        ModelA_getChar_for_slc_1_itm <= '0';
        ModelA_getChar_for_slc_2_cse_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        ModelA_getChar_for_if_p_count_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        slc_ModelA_update_1_for_i_itm <= STD_LOGIC_VECTOR'("000000000");
        ModelA_getChar_for_if_p_low_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        main_decomp_Mn_Fonction_cmodel_m_frozen_sva_1 <= '0';
        ModelA_getChar_for_if_p_count_lpi_1_dfm <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        dec_decompress_for_1_mul_psp <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000");
        dec_decompress_for_1_mul_1_mut <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000");
        ModelA_getChar_for_if_p_low_lpi_1_dfm <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        ModelA_getChar_for_if_p_high_lpi_1_dfm <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        dec_decompress_low_sva_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        dec_decompress_high_1_sva_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg16 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg15 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg14 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg13 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg12 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg11 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg10 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg9 <= '0';
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg8 <= '0';
        unequal_tmp_9 <= '0';
        reg_div_mgc_div_b_tmp_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        reg_div_mgc_div_a_tmp <= STD_LOGIC_VECTOR'("000");
        reg_div_mgc_div_a_tmp_1 <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000");
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp <= '0';
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1 <=
            STD_LOGIC_VECTOR'("000000");
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp <= '0';
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1 <= STD_LOGIC_VECTOR'("0000000");
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp <= '0';
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1 <=
            STD_LOGIC_VECTOR'("0000000");
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp <=
            '0';
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1 <=
            STD_LOGIC_VECTOR'("0000000");
        reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp <= '0';
        reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp_1 <= STD_LOGIC_VECTOR'("0000000");
      ELSIF ( core_wen_drv = '1' ) THEN
        Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d_drv <= MUX1HOT_v_32_3_2(cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_7
            & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_6 & Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d_drv,
            STD_LOGIC_VECTOR'(((comp_compress_low_1_sva_1(14)) AND (fsm_output(59)))
            & ((NOT (comp_compress_low_1_sva_1(14))) AND (fsm_output(59))) & (NOT
            (fsm_output(59)))));
        dec_decompress_for_1_for_else_else_land_lpi_2_dfm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx0w0
            & dec_decompress_for_1_for_else_else_land_lpi_2_dfm), or_dcpl_1022 OR
            (NOT (fsm_output(56))));
        ModelA_getChar_for_if_p_count_lpi_1 <= MUX_v_32_2_2(ModelA_getChar_for_if_p_count_lpi_1
            & ModelA_getChar_for_if_p_count_lpi_1_dfm, or_dcpl_1144);
        ModelA_getChar_for_if_p_high_lpi_1 <= MUX_v_32_2_2(ModelA_getChar_for_if_p_high_lpi_1
            & ModelA_getChar_for_if_p_high_lpi_1_dfm, or_dcpl_1144);
        ModelA_getChar_for_if_p_low_lpi_1 <= MUX_v_32_2_2(ModelA_getChar_for_if_p_low_lpi_1
            & ModelA_getChar_for_if_p_low_lpi_1_dfm, or_dcpl_1144);
        reg_nblevels_triosy_mgc_io_sync_iswt0_cse <= (fsm_output(49)) AND dec_decompress_for_1_and_tmp;
        reg_Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_iswt0_cse
            <= fsm_output(59);
        reg_start_sync_mgc_bsync_vld_iswt0_cse <= NOT(or_dcpl_1201 OR or_dcpl_496
            OR or_dcpl_362 OR or_dcpl_87 OR or_dcpl_26 OR (fsm_output(15)) OR (fsm_output(17))
            OR (fsm_output(22)) OR or_dcpl_354 OR (fsm_output(19)) OR (fsm_output(12))
            OR or_dcpl_23 OR (fsm_output(20)) OR (fsm_output(3)) OR (fsm_output(11))
            OR (fsm_output(6)) OR (fsm_output(8)) OR (fsm_output(18)) OR (fsm_output(25))
            OR (fsm_output(27)) OR (fsm_output(16)) OR (fsm_output(5)) OR (fsm_output(24))
            OR (fsm_output(1)) OR (fsm_output(50)) OR (fsm_output(52)) OR (fsm_output(51))
            OR (fsm_output(53)) OR (fsm_output(60)) OR or_dcpl_474 OR or_dcpl_75
            OR or_dcpl_1162 OR or_dcpl_1158 OR or_dcpl_1155 OR or_dcpl_477 OR or_dcpl_1149
            OR (fsm_output(49)) OR (fsm_output(4)) OR (fsm_output(59)));
        reg_Vga_rsc_singleport_we_core_psct_cse <= and_192_rmff;
        reg_Comp_rsc_singleport_iswt0_cse <= NOT mux_146_itm;
        reg_Src_rsc_singleport_re_core_psct_cse <= and_dcpl_178;
        div_mgc_div_1_b <= MUX1HOT_v_32_3_2(ModelA_getProbability_p_count_sva & div_mgc_div_1_b_mx1
            & ModelA_getChar_for_if_p_count_lpi_1_dfm, STD_LOGIC_VECTOR'((or_dcpl_1208
            OR or_dcpl_1206) & (fsm_output(49)) & or_1237_cse));
        div_mgc_div_1_a <= MUX1HOT_v_64_3_2(z_out_6 & comp_compress_for_mul_mut &
            dec_decompress_for_1_mul_1_mut, STD_LOGIC_VECTOR'(or_2755_cse & (or_dcpl_26
            OR (fsm_output(15)) OR (fsm_output(12))) & or_1237_cse));
        cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("100000001")
            & cmodel_reset_for_acc_itm, fsm_output(3));
        cmodel_reset_for_nor_itm <= NOT((cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))
            OR (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(7))
            OR (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(6))
            OR (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(5))
            OR (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(4))
            OR (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(3))
            OR (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(2))
            OR (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(1))
            OR (cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(0)));
        cmodel_reset_for_acc_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(MUX_v_9_2_2(cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva
            & main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva,
            fsm_output(31))) + UNSIGNED'("111111111"), 9));
        cod_entropique_Mn_Fonction_comp_byte_to_encode_1_sva <= comp_getByte_mux_2_itm
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(fsm_output(18), 1),17));
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2 <= (MUX1HOT_v_32_3_2(cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2
            & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_5 & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_4,
            STD_LOGIC_VECTOR'(or_2756_cse & and_367_cse & and_369_cse))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(3)), 1),32));
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2 <= (MUX1HOT_v_8_3_2(cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2
            & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_5 & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_4,
            STD_LOGIC_VECTOR'(or_2756_cse & and_367_cse & and_369_cse))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(3)), 1),8));
        cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2 <= MUX1HOT_v_8_4_2(STD_LOGIC_VECTOR'("10000000")
            & cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2 & cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_5
            & cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_4, STD_LOGIC_VECTOR'((fsm_output(3))
            & or_2756_cse & and_367_cse & and_369_cse));
        comp_compress_pending_bits_1_lpi_2 <= (MUX_v_32_2_2(comp_compress_pending_bits_1_lpi_2
            & (comp_compress_pending_bits_1_lpi_2_dfm AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(comp_compress_for_for_else_slc_svs,
            1),32)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT comp_compress_for_for_slc_svs,
            1),32))), fsm_output(24))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(3)), 1),32));
        comp_compress_low_1_sva_4 <= (MUX_v_15_2_2((comp_compress_low_1_sva_1(14
            DOWNTO 0)) & comp_compress_low_1_sva_4, and_dcpl_192)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(3)), 1),15));
        cod_entropique_Mn_Fonction_cmodel_m_frozen_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(ModelA_getProbability_mux_itm
            & cod_entropique_Mn_Fonction_cmodel_m_frozen_sva), and_dcpl_192)) AND
            (NOT (fsm_output(3)));
        comp_compress_high_1_sva <= MUX1HOT_v_32_3_2(STD_LOGIC_VECTOR'("00000000000000001111111111111111")
            & comp_compress_high_1_sva_1 & comp_compress_high_1_sva, STD_LOGIC_VECTOR'((fsm_output(3))
            & (fsm_output(18)) & and_dcpl_192));
        ModelA_getProbability_p_count_sva <= MUX_v_32_2_2(ModelA_getProbability_p_count_sva
            & cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out,
            fsm_output(4));
        comp_getByte_slc_mdf_sva <= z_out_9(7);
        comp_getByte_mux_2_itm <= MUX1HOT_v_17_3_2(z_out_1 & STD_LOGIC_VECTOR'("10010110000000000")
            & comp_getByte_mux_2_itm, STD_LOGIC_VECTOR'(and_dcpl_178 & ((fsm_output(4))
            AND (NOT (z_out_9(7)))) & (or_dcpl_1208 OR or_dcpl_137 OR or_dcpl_1283
            OR or_dcpl_111 OR or_dcpl_1278 OR or_dcpl_1255 OR or_dcpl_1274 OR or_dcpl_124)));
        ModelA_update_for_i_sva_sg1 <= (MUX_v_23_2_2((z_out_10(31 DOWNTO 9)) & ModelA_update_for_i_sva_sg1,
            (fsm_output(10)) OR (fsm_output(9)))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(7)), 1),23));
        ModelA_update_for_i_sva_2 <= MUX1HOT_v_9_3_2(z_out_8 & ModelA_update_for_i_sva_2
            & (z_out_10(8 DOWNTO 0)), STD_LOGIC_VECTOR'((fsm_output(5)) & (or_dcpl_23
            OR or_dcpl_1368) & (fsm_output(8))));
        exit_ModelA_update_for_sva <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((NOT (readindex(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED(z_out_8(8
            DOWNTO 1)), 9) + SIGNED'("101111111"), 9)), 8))) & exit_ModelA_update_for_sva
            & (NOT (z_out_17(30)))), STD_LOGIC_VECTOR'((fsm_output(5)) & or_dcpl_1368
            & (fsm_output(8))));
        comp_compress_for_c_sg1_2_lpi_1_dfm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(comp_compress_for_c_sg1_2_lpi_1_dfm_1
            & comp_compress_for_c_sg1_2_lpi_1_dfm), or_1414_cse);
        comp_compress_for_c_1_lpi_1_dfm <= MUX_v_8_2_2(comp_compress_for_c_1_lpi_1_dfm_1
            & comp_compress_for_c_1_lpi_1_dfm, or_1414_cse);
        ModelA_getProbability_p_high_sva <= MUX_v_32_2_2(ModelA_getProbability_p_high_sva
            & cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out,
            fsm_output(6));
        ModelA_getProbability_p_low_sva <= MUX_v_32_2_2(ModelA_getProbability_p_low_sva
            & cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out,
            fsm_output(7));
        slc_ModelA_update_for_i_itm <= MUX_v_9_2_2(ModelA_update_for_i_sva_2 & slc_ModelA_update_for_i_itm,
            NOT((fsm_output(10)) OR (fsm_output(7))));
        comp_compress_for_mul_1_psp <= MUX_v_64_2_2(comp_compress_for_mul_1_psp &
            (z_out_7(63 DOWNTO 0)), fsm_output(11));
        comp_compress_for_acc_3_itm <= MUX_v_16_2_2(comp_compress_for_acc_3_itm &
            z_out_2, fsm_output(11));
        comp_compress_for_mul_mut <= MUX_v_64_2_2(comp_compress_for_mul_mut & z_out_6,
            fsm_output(11));
        ModelA_getProbability_mux_itm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(((NOT (z_out_3(32)))
            OR cod_entropique_Mn_Fonction_cmodel_m_frozen_sva) & ModelA_getProbability_mux_itm),
            or_dcpl_1208 OR or_dcpl_137 OR (fsm_output(23)) OR or_dcpl_134 OR (fsm_output(20))
            OR or_dcpl_1273 OR (fsm_output(24)));
        comp_compress_high_1_sva_1 <= MUX1HOT_v_32_3_2(z_out_4 & comp_compress_high_1_sva_1
            & (STD_LOGIC_VECTOR'("0000000000000000") & (MUX_v_15_2_2((comp_compress_high_1_sva_1(14
            DOWNTO 0)) & (TO_STDLOGICVECTOR(comp_compress_for_for_else_else_mux_2_itm_1)
            & comp_compress_for_for_else_else_mux_4_itm), comp_compress_for_for_and_2_itm))
            & TO_STDLOGICVECTOR('1')), STD_LOGIC_VECTOR'((fsm_output(16)) & (or_dcpl_137
            OR or_dcpl_354 OR or_dcpl_1419 OR (fsm_output(18))) & (fsm_output(24))));
        comp_compress_low_1_sva_1 <= MUX1HOT_v_32_3_2(z_out_5 & comp_compress_low_1_sva_1
            & (STD_LOGIC_VECTOR'("0000000000000000") & (MUX_v_15_2_2((comp_compress_low_1_sva_1(14
            DOWNTO 0)) & (TO_STDLOGICVECTOR(comp_compress_for_for_else_else_mux_1_itm_1)
            & comp_compress_for_for_else_else_mux_3_itm), comp_compress_for_for_and_2_itm))
            & TO_STDLOGICVECTOR('0')), STD_LOGIC_VECTOR'((fsm_output(17)) & (or_dcpl_1226
            OR or_dcpl_365 OR (fsm_output(39)) OR (fsm_output(30)) OR (fsm_output(26))
            OR or_dcpl_87 OR or_dcpl_1450 OR or_dcpl_1419 OR or_dcpl_343 OR (fsm_output(27))
            OR or_dcpl_80 OR or_dcpl_1210 OR (fsm_output(32)) OR or_dcpl_490 OR or_dcpl_1436
            OR or_dcpl_485 OR (fsm_output(56)) OR (fsm_output(47)) OR (fsm_output(42))
            OR or_dcpl_67 OR or_dcpl_479 OR (fsm_output(57)) OR (fsm_output(58))
            OR (fsm_output(49))) & (fsm_output(24))));
        comp_put_bit_plus_pending_3_for_i_sva <= (MUX_v_32_2_2(z_out_10 & comp_put_bit_plus_pending_3_for_i_sva,
            fsm_output(30))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(26)),
            1),32));
        unequal_tmp_6 <= unequal_tmp_10;
        comp_put_bit_plus_pending_2_for_i_sva <= (MUX_v_32_2_2(z_out_10 & comp_put_bit_plus_pending_2_for_i_sva,
            fsm_output(28))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(26)),
            1),32));
        comp_compress_for_for_else_slc_svs <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(comp_compress_for_for_else_slc_svs
            & (z_out_12(17))), fsm_output(18));
        comp_compress_for_for_slc_svs <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(comp_compress_for_for_slc_svs
            & (z_out_13(17))), fsm_output(18));
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1 <= MUX1HOT_v_32_3_2(cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1_mx1w0
            & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1 &
            (STD_LOGIC_VECTOR'("000000000000000") & z_out_1), STD_LOGIC_VECTOR'((fsm_output(18))
            & (or_dcpl_134 OR (or_1503_tmp AND (fsm_output(20)))) & ((NOT or_1503_tmp)
            AND (fsm_output(20)))));
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm <= (MUX1HOT_v_8_3_2(cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2
            & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_2,
            STD_LOGIC_VECTOR'((fsm_output(18)) & or_dcpl_134 & (fsm_output(20)))))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(((fsm_output(20)) AND
            (NOT (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(1)))
            AND nor_75_cse AND nor_73_cse AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(6))
            OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp)))
            OR and_dcpl), 1),8));
        comp_put_bit_plus_pending_for_i_sva <= (MUX_v_32_2_2(z_out_10 & comp_put_bit_plus_pending_for_i_sva,
            fsm_output(21))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(19)),
            1),32));
        exit_comp_put_bit_plus_pending_for_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (z_out_14(32))) & (NOT (z_out_18(33)))), fsm_output(20));
        comp_compress_pending_bits_1_lpi_2_dfm <= MUX_v_32_2_2(comp_compress_pending_bits_1_lpi_2_dfm_2
            & comp_compress_pending_bits_1_lpi_2_dfm, or_1509_cse);
        comp_compress_for_for_else_else_mux_2_itm_1 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (comp_compress_high_1_sva_1(14))) & comp_compress_for_for_else_else_mux_2_itm_1),
            or_1509_cse);
        comp_compress_for_for_else_else_mux_4_itm <= MUX_v_14_2_2((comp_compress_high_1_sva_1(13
            DOWNTO 0)) & comp_compress_for_for_else_else_mux_4_itm, or_1509_cse);
        comp_compress_for_for_else_else_mux_1_itm_1 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (comp_compress_low_1_sva_1(14))) & comp_compress_for_for_else_else_mux_1_itm_1),
            or_1509_cse);
        comp_compress_for_for_else_else_mux_3_itm <= MUX_v_14_2_2((comp_compress_low_1_sva_1(13
            DOWNTO 0)) & comp_compress_for_for_else_else_mux_3_itm, or_1509_cse);
        exit_comp_put_bit_plus_pending_1_for_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (z_out_14(32))) & (NOT (z_out_18(33)))), fsm_output(22));
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_3 <= MUX1HOT_v_32_3_2(cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1_mx1w0
            & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_3 &
            (STD_LOGIC_VECTOR'("000000000000000") & z_out_1), STD_LOGIC_VECTOR'((fsm_output(18))
            & (or_dcpl_1501 OR (or_1534_tmp AND (fsm_output(22)))) & ((NOT or_1534_tmp)
            AND (fsm_output(22)))));
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm_1 <= (MUX_v_8_2_2((cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_4
            OR STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(fsm_output(22), 1),8))) &
            cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm_1, (((cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(1))
            OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(2))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(3))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(4))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(5))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(6))
            OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp)
            AND (fsm_output(22))) OR or_dcpl_1501)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT((nor_36_cse
            AND nor_37_cse AND (NOT((cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(5))
            OR (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(6))))
            AND (NOT (cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1(7)))
            AND (fsm_output(22))) OR and_dcpl), 1),8));
        comp_put_bit_plus_pending_1_for_i_sva <= (MUX_v_32_2_2(z_out_10 & comp_put_bit_plus_pending_1_for_i_sva,
            fsm_output(23))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(19)),
            1),32));
        comp_compress_for_for_and_2_itm <= comp_compress_for_for_else_slc_svs AND
            (NOT comp_compress_for_for_slc_svs);
        cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_5 <= MUX_v_8_2_2((TO_STDLOGICVECTOR(reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp)
            & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1)
            & cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_5, or_dcpl_1511);
        cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_4 <= MUX_v_8_2_2((TO_STDLOGICVECTOR(reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp)
            & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1)
            & cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_4, or_dcpl_1449);
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_5 <= MUX_v_8_2_2(cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm_1
            & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_5, or_dcpl_1511);
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_4 <= MUX_v_8_2_2(cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2_dfm
            & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_4, or_dcpl_1449);
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_5 <= MUX_v_32_2_2(cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_3
            & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_5, or_dcpl_1511);
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_4 <= MUX_v_32_2_2(cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1
            & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_4, or_dcpl_1449);
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1 <= MUX1HOT_v_32_3_2(cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1_mx1w0
            & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1 & (STD_LOGIC_VECTOR'("000000000000000")
            & z_out_1), STD_LOGIC_VECTOR'((fsm_output(25)) & (or_dcpl_1518 OR (or_1552_tmp
            AND (fsm_output(27)))) & ((NOT or_1552_tmp) AND (fsm_output(27)))));
        comp_compress_pending_bits_sva <= MUX_v_32_2_2(comp_compress_pending_bits_1_lpi_2_dfm_2
            & comp_compress_pending_bits_sva, or_dcpl_1528 OR (fsm_output(29)) OR
            (fsm_output(27)));
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_dfm <= (MUX1HOT_v_8_3_2(cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_2
            & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_lpi_dfm & cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_8,
            STD_LOGIC_VECTOR'((fsm_output(25)) & or_dcpl_1518 & (fsm_output(27)))))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(((fsm_output(27)) AND
            (NOT (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(1)))
            AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(2))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(3))))
            AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(4))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(5))))
            AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(6))
            OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp)))
            OR and_dcpl_350), 1),8));
        exit_comp_put_bit_plus_pending_2_for_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (z_out_14(32))) & (NOT (z_out_18(33)))), fsm_output(27));
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_3 <= MUX1HOT_v_32_3_2(cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1_mx1w0
            & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_3 & (STD_LOGIC_VECTOR'("000000000000000")
            & z_out_1), STD_LOGIC_VECTOR'((fsm_output(25)) & (or_dcpl_362 OR (or_1566_tmp
            AND (fsm_output(29)))) & ((NOT or_1566_tmp) AND (fsm_output(29)))));
        cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_lpi_dfm <= (MUX_v_8_2_2((cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_1_sva_4
            OR STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(fsm_output(29), 1),8))) &
            cod_entropique_Mn_Fonction_comp_m_output_m_NextByte_lpi_dfm, (((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(0))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(1))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(2))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(3))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(4))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5))
            OR reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp)
            AND (fsm_output(29))) OR or_dcpl_362)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(((NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(0))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(1))))
            AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(2))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(3))))
            AND (NOT((reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(4))
            OR (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5))))
            AND (NOT reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp)
            AND (fsm_output(29))) OR and_dcpl_350), 1),8));
        exit_comp_put_bit_plus_pending_3_for_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (z_out_14(32))) & (NOT (z_out_18(33)))), fsm_output(29));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg16 <= dec_decompress_value_1_sg14_sva_dfm_sg16
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_1 <= dec_decompress_value_1_sg14_sva_dfm_1
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg15 <= dec_decompress_value_1_sg14_sva_dfm_sg15
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg1 <= dec_decompress_value_1_sg14_sva_dfm_sg1
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg14 <= dec_decompress_value_1_sg14_sva_dfm_sg14
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg2 <= dec_decompress_value_1_sg14_sva_dfm_sg2
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg13 <= dec_decompress_value_1_sg14_sva_dfm_sg13
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg3 <= dec_decompress_value_1_sg14_sva_dfm_sg3
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg12 <= dec_decompress_value_1_sg14_sva_dfm_sg12
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg4 <= dec_decompress_value_1_sg14_sva_dfm_sg4
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg11 <= dec_decompress_value_1_sg14_sva_dfm_sg11
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg5 <= dec_decompress_value_1_sg14_sva_dfm_sg5
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg10 <= dec_decompress_value_1_sg14_sva_dfm_sg10
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg6 <= dec_decompress_value_1_sg14_sva_dfm_sg6
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg9 <= dec_decompress_value_1_sg14_sva_dfm_sg9
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg7 <= dec_decompress_value_1_sg14_sva_dfm_sg7
            AND (fsm_output(32));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg8 <= dec_decompress_value_1_sg14_sva_dfm_sg8
            AND (fsm_output(32));
        dec_decompress_value_1_sg14_sva_sg16 <= dec_decompress_value_1_sg14_sva_dfm_sg16;
        dec_decompress_value_1_sg14_sva_5 <= dec_decompress_value_1_sg14_sva_dfm_1;
        dec_decompress_value_1_sg14_sva_sg15 <= dec_decompress_value_1_sg14_sva_dfm_sg15;
        dec_decompress_value_1_sg14_sva_sg1 <= dec_decompress_value_1_sg14_sva_dfm_sg1;
        dec_decompress_value_1_sg14_sva_sg14 <= dec_decompress_value_1_sg14_sva_dfm_sg14;
        dec_decompress_value_1_sg14_sva_sg2 <= dec_decompress_value_1_sg14_sva_dfm_sg2;
        dec_decompress_value_1_sg14_sva_sg13 <= dec_decompress_value_1_sg14_sva_dfm_sg13;
        dec_decompress_value_1_sg14_sva_sg3 <= dec_decompress_value_1_sg14_sva_dfm_sg3;
        dec_decompress_value_1_sg14_sva_sg12 <= dec_decompress_value_1_sg14_sva_dfm_sg12;
        dec_decompress_value_1_sg14_sva_sg4 <= dec_decompress_value_1_sg14_sva_dfm_sg4;
        dec_decompress_value_1_sg14_sva_sg11 <= dec_decompress_value_1_sg14_sva_dfm_sg11;
        dec_decompress_value_1_sg14_sva_sg5 <= dec_decompress_value_1_sg14_sva_dfm_sg5;
        dec_decompress_value_1_sg14_sva_sg10 <= dec_decompress_value_1_sg14_sva_dfm_sg10;
        dec_decompress_value_1_sg14_sva_sg6 <= dec_decompress_value_1_sg14_sva_dfm_sg6;
        dec_decompress_value_1_sg14_sva_sg9 <= dec_decompress_value_1_sg14_sva_dfm_sg9;
        dec_decompress_value_1_sg14_sva_sg7 <= dec_decompress_value_1_sg14_sva_dfm_sg7;
        dec_decompress_value_1_sg14_sva_sg8 <= dec_decompress_value_1_sg14_sva_dfm_sg8;
        main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva <= MUX_v_8_2_2(main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva
            & Comp_rsc_singleport_data_out_mxwt, and_497_cse);
        main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva <= MUX1HOT_v_8_3_2(STD_LOGIC_VECTOR'("00000001")
            & main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva & main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_1,
            STD_LOGIC_VECTOR'(or_dcpl_1528 & (fsm_output(31)) & (fsm_output(32))));
        main_decomp_Mn_Fonction_dec_m_input_input_byte_1_sva <= main_decomp_Mn_Fonction_dec_m_input_input_byte_1_sva_dfm_1
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(fsm_output(32), 1),17));
        dec_decompress_for_i_1_sva_2 <= cmodel_reset_2_for_mux_19_itm_1 AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(fsm_output(32),
            1),4));
        main_decomp_Mn_Fonction_cmodel_m_frozen_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(main_decomp_Mn_Fonction_cmodel_m_frozen_sva
            & main_decomp_Mn_Fonction_cmodel_m_frozen_sva_1), (NOT main_decomp_Mn_Fonction_cmodel_m_frozen_sva)
            AND (fsm_output(58)) AND (NOT ModelA_getChar_for_not_sxt))) AND (NOT
            or_dcpl_1528);
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_6 <= MUX_v_32_2_2(cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1
            & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_6, or_dcpl_1201
            OR or_dcpl_496 OR (fsm_output(30)) OR (fsm_output(29)) OR or_1237_cse
            OR or_dcpl_1589 OR or_dcpl_1585 OR or_dcpl_1158 OR or_dcpl_1155 OR or_dcpl_1575);
        cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_7 <= MUX_v_32_2_2(cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_3
            & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_7, or_dcpl_1201
            OR or_dcpl_496 OR (fsm_output(28)) OR (fsm_output(27)) OR or_1237_cse
            OR or_dcpl_1589 OR or_dcpl_1585 OR or_dcpl_1158 OR or_dcpl_1155 OR or_dcpl_1575);
        main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva <= (MUX1HOT_v_17_3_2(main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva
            & main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva_1 & STD_LOGIC_VECTOR'("10010110000000000"),
            STD_LOGIC_VECTOR'((or_dcpl_1226 OR or_dcpl_365 OR (fsm_output(39)) OR
            (fsm_output(32)) OR or_dcpl_490 OR or_dcpl_1436 OR or_dcpl_1637 OR or_dcpl_506
            OR (fsm_output(40)) OR (fsm_output(33))) & ((fsm_output(58)) AND dec_m_output_putByte_slc_svs)
            & ((fsm_output(58)) AND (NOT dec_m_output_putByte_slc_svs))))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            or_dcpl_1528, 1),17));
        dec_decompress_low_sva_5 <= (MUX_v_15_2_2(dec_decompress_low_sva_5 & (dec_decompress_low_sva_1(14
            DOWNTO 0)), fsm_output(56))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            or_dcpl_1528, 1),15));
        dec_decompress_high_1_sva <= MUX1HOT_v_32_3_2(STD_LOGIC_VECTOR'("00000000000000001111111111111111")
            & dec_decompress_high_1_sva_1 & dec_decompress_high_1_sva, STD_LOGIC_VECTOR'(or_dcpl_1528
            & (fsm_output(56)) & (and_dcpl_233 AND (NOT((fsm_output(28)) OR (fsm_output(56)))))));
        dec_decompress_value_3_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_3_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_m_input_get_bit_or_1_itm & dec_decompress_value_3_sva),
            exit_dec_decompress_for_sva))), fsm_output(32))) AND (NOT or_dcpl_1528);
        exit_dec_decompress_for_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(exit_dec_decompress_for_sva_dfm
            & exit_dec_decompress_for_sva), and_dcpl_233 AND (NOT((fsm_output(28))
            OR (fsm_output(32)))))) AND (NOT or_dcpl_1528);
        main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("100000001")
            & cmodel_reset_for_acc_itm, fsm_output(32));
        dec_decompress_value_1_sg1_sva <= dec_decompress_value_1_sg1_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg2_sva <= dec_decompress_value_1_sg2_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg3_sva <= dec_decompress_value_1_sg3_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg4_sva <= dec_decompress_value_1_sg4_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg5_sva <= dec_decompress_value_1_sg5_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg6_sva <= dec_decompress_value_1_sg6_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg7_sva <= dec_decompress_value_1_sg7_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg8_sva <= dec_decompress_value_1_sg8_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg9_sva <= dec_decompress_value_1_sg9_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg10_sva <= dec_decompress_value_1_sg10_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg11_sva <= dec_decompress_value_1_sg11_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg12_sva <= dec_decompress_value_1_sg12_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg13_sva <= dec_decompress_value_1_sg13_sva_dfm AND
            (fsm_output(32));
        dec_decompress_value_1_sg14_sva_sg17 <= dec_decompress_value_1_sg14_sva_dfm_sg17;
        unequal_tmp_8 <= NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(0))
            AND (NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(7)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(6))
            OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(5)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(4))
            OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(3)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(2))
            OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(1)))));
        main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_1 <= MUX1HOT_v_8_3_2(main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva
            & (TO_STDLOGICVECTOR(and_266_ssc) & and_385_itm) & main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3,
            STD_LOGIC_VECTOR'(and_392_cse & and_391_cse & (fsm_output(56))));
        main_decomp_Mn_Fonction_dec_m_input_input_byte_1_sva_dfm_1 <= MUX1HOT_v_17_3_2(main_decomp_Mn_Fonction_dec_m_input_input_byte_1_sva
            & z_out_1 & main_decomp_Mn_Fonction_dec_m_input_input_byte_1_lpi_3, STD_LOGIC_VECTOR'((((NOT
            (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(0))) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(1))
            OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(2)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(3))
            OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(4)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(5))
            OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(6)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(7))
            OR exit_dec_decompress_for_sva) AND (fsm_output(31))) & (and_dcpl_244
            AND (NOT (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(2))) AND
            (NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(3)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(4))))
            AND (NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(5)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(6))
            OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva(7)))) AND and_391_cse)
            & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg17 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg16
            & dec_decompress_value_1_sg14_sva_sg17 & dec_decompress_value_1_sg14_sva_dfm_sg17
            & dec_decompress_value_1_sg14_lpi_3_sg17), STD_LOGIC_VECTOR'(and_391_cse
            & and_392_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg16 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg16
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg15 & dec_decompress_value_1_sg14_sva_dfm_sg16
            & dec_decompress_value_1_sg14_lpi_3_sg16), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg15 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg15
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg14 & dec_decompress_value_1_sg14_sva_dfm_sg15
            & dec_decompress_value_1_sg14_lpi_3_sg15), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg14 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg14
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg13 & dec_decompress_value_1_sg14_sva_dfm_sg14
            & dec_decompress_value_1_sg14_lpi_3_sg14), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg13 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg13
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg12 & dec_decompress_value_1_sg14_sva_dfm_sg13
            & dec_decompress_value_1_sg14_lpi_3_sg13), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg12 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg12
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg11 & dec_decompress_value_1_sg14_sva_dfm_sg12
            & dec_decompress_value_1_sg14_lpi_3_sg12), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg11 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg11
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg10 & dec_decompress_value_1_sg14_sva_dfm_sg11
            & dec_decompress_value_1_sg14_lpi_3_sg11), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg10 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg10
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg9 & dec_decompress_value_1_sg14_sva_dfm_sg10
            & dec_decompress_value_1_sg14_lpi_3_sg10), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg9 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg9
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg8 & dec_decompress_value_1_sg14_sva_dfm_sg9
            & dec_decompress_value_1_sg14_lpi_3_sg9), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg8 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg8
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg7 & dec_decompress_value_1_sg14_sva_dfm_sg8
            & dec_decompress_value_1_sg14_lpi_3_sg8), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg7 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg7
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg6 & dec_decompress_value_1_sg14_sva_dfm_sg7
            & dec_decompress_value_1_sg14_lpi_3_sg7), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg6 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg6
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg5 & dec_decompress_value_1_sg14_sva_dfm_sg6
            & dec_decompress_value_1_sg14_lpi_3_sg6), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg5 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg5
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg4 & dec_decompress_value_1_sg14_sva_dfm_sg5
            & dec_decompress_value_1_sg14_lpi_3_sg5), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg4 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg4
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg3 & dec_decompress_value_1_sg14_sva_dfm_sg4
            & dec_decompress_value_1_sg14_lpi_3_sg4), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg3 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg3
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg2 & dec_decompress_value_1_sg14_sva_dfm_sg3
            & dec_decompress_value_1_sg14_lpi_3_sg3), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg2 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg2
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_sg1 & dec_decompress_value_1_sg14_sva_dfm_sg2
            & dec_decompress_value_1_sg14_lpi_3_sg2), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_sg1 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg1
            & dec_decompress_value_slc_dec_decompress_value_1_sg14_2_itm_1 & dec_decompress_value_1_sg14_sva_dfm_sg1
            & dec_decompress_value_1_sg14_lpi_3_sg1), STD_LOGIC_VECTOR'(and_392_cse
            & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg14_sva_dfm_1 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_5
            & dec_decompress_value_1_sg13_sva & dec_decompress_value_1_sg14_sva_dfm_1
            & dec_decompress_value_1_sg14_lpi_5), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg13_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg13_sva
            & dec_decompress_value_1_sg12_sva & dec_decompress_value_1_sg13_sva_dfm
            & dec_decompress_value_1_sg13_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg12_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg12_sva
            & dec_decompress_value_1_sg11_sva & dec_decompress_value_1_sg12_sva_dfm
            & dec_decompress_value_1_sg12_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg11_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg11_sva
            & dec_decompress_value_1_sg10_sva & dec_decompress_value_1_sg11_sva_dfm
            & dec_decompress_value_1_sg11_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg10_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg10_sva
            & dec_decompress_value_1_sg9_sva & dec_decompress_value_1_sg10_sva_dfm
            & dec_decompress_value_1_sg10_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg9_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg9_sva
            & dec_decompress_value_1_sg8_sva & dec_decompress_value_1_sg9_sva_dfm
            & dec_decompress_value_1_sg9_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg8_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg8_sva
            & dec_decompress_value_1_sg7_sva & dec_decompress_value_1_sg8_sva_dfm
            & dec_decompress_value_1_sg8_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg7_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg7_sva
            & dec_decompress_value_1_sg6_sva & dec_decompress_value_1_sg7_sva_dfm
            & dec_decompress_value_1_sg7_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg6_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg6_sva
            & dec_decompress_value_1_sg5_sva & dec_decompress_value_1_sg6_sva_dfm
            & dec_decompress_value_1_sg6_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg5_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg5_sva
            & dec_decompress_value_1_sg4_sva & dec_decompress_value_1_sg5_sva_dfm
            & dec_decompress_value_1_sg5_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg4_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg4_sva
            & dec_decompress_value_1_sg3_sva & dec_decompress_value_1_sg4_sva_dfm
            & dec_decompress_value_1_sg4_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg3_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg3_sva
            & dec_decompress_value_1_sg2_sva & dec_decompress_value_1_sg3_sva_dfm
            & dec_decompress_value_1_sg3_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg2_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg2_sva
            & dec_decompress_value_1_sg1_sva & dec_decompress_value_1_sg2_sva_dfm
            & dec_decompress_value_1_sg2_lpi_3), STD_LOGIC_VECTOR'(and_392_cse &
            and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        dec_decompress_value_1_sg1_sva_dfm <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg1_sva
            & dec_decompress_value_3_sva & dec_decompress_value_1_sg1_sva_dfm & dec_decompress_value_1_sg1_lpi_3),
            STD_LOGIC_VECTOR'(and_392_cse & and_391_cse & or_dcpl_1690 & (fsm_output(56))));
        cmodel_reset_2_for_nor_itm <= NOT((main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(8))
            OR (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(7))
            OR (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(6))
            OR (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(5))
            OR (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(4))
            OR (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(3))
            OR (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(2))
            OR (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(1))
            OR (main_decomp_Mn_Fonction_cmodel_cumulative_frequency_vinit_ndx_sva(0)));
        exit_dec_decompress_for_sva_dfm <= (dec_decompress_for_i_1_sva_1(4)) OR exit_dec_decompress_for_sva;
        cmodel_reset_2_for_mux_19_itm_1 <= dec_decompress_for_i_1_sva_1(3 DOWNTO
            0);
        ModelA_getChar_for_i_1_sva <= (MUX_v_9_2_2(ModelA_getChar_for_i_1_sva & ModelA_getChar_for_acc_2_psp_sva,
            and_503_cse)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(39)),
            1),9));
        dec_decompress_value_3_sva_dfm <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_3_sva_mx0w2
            & dec_decompress_value_3_lpi_3 & dec_decompress_value_3_sva_dfm), STD_LOGIC_VECTOR'((fsm_output(32))
            & (fsm_output(56)) & (NOT((fsm_output(32)) OR (fsm_output(56))))));
        dec_decompress_value_3_lpi_3 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_3_sva_mx0w2
            & dec_decompress_value_3_lpi_3 & (((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3_mx1(7))
            AND (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(7))) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3_mx1(6))
            AND (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(6))) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3_mx1(5))
            AND (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(5))) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3_mx1(4))
            AND (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(4))) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3_mx1(3))
            AND (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(3))) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3_mx1(2))
            AND (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(2))) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3_mx1(1))
            AND (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(1))) OR ((main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3_mx1(0))
            AND (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(0)))) & dec_decompress_value_3_sva_dfm),
            STD_LOGIC_VECTOR'((fsm_output(32)) & (or_dcpl_1226 OR or_dcpl_1670 OR
            or_dcpl_1230 OR or_dcpl_1739 OR or_dcpl_1162 OR or_dcpl_1733 OR or_dcpl_1730
            OR (fsm_output(33)) OR (fsm_output(49))) & (fsm_output(57)) & (fsm_output(58))));
        dec_decompress_value_1_sg1_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg1_sva_dfm
            & dec_decompress_value_1_sg1_lpi_3 & dec_decompress_value_3_lpi_3), STD_LOGIC_VECTOR'(or_dcpl_1690
            & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg2_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg2_sva_dfm
            & dec_decompress_value_1_sg2_lpi_3 & dec_decompress_value_1_sg1_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg3_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg3_sva_dfm
            & dec_decompress_value_1_sg3_lpi_3 & dec_decompress_value_1_sg2_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg4_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg4_sva_dfm
            & dec_decompress_value_1_sg4_lpi_3 & dec_decompress_value_1_sg3_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg5_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg5_sva_dfm
            & dec_decompress_value_1_sg5_lpi_3 & dec_decompress_value_1_sg4_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg6_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg6_sva_dfm
            & dec_decompress_value_1_sg6_lpi_3 & dec_decompress_value_1_sg5_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg7_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg7_sva_dfm
            & dec_decompress_value_1_sg7_lpi_3 & dec_decompress_value_1_sg6_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg8_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg8_sva_dfm
            & dec_decompress_value_1_sg8_lpi_3 & dec_decompress_value_1_sg7_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg9_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg9_sva_dfm
            & dec_decompress_value_1_sg9_lpi_3 & dec_decompress_value_1_sg8_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg10_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg10_sva_dfm
            & dec_decompress_value_1_sg10_lpi_3 & dec_decompress_value_1_sg9_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg11_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg11_sva_dfm
            & dec_decompress_value_1_sg11_lpi_3 & dec_decompress_value_1_sg10_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg12_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg12_sva_dfm
            & dec_decompress_value_1_sg12_lpi_3 & dec_decompress_value_1_sg11_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg13_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg13_sva_dfm
            & dec_decompress_value_1_sg13_lpi_3 & dec_decompress_value_1_sg12_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg14_lpi_3_sg17 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg17
            & dec_decompress_value_1_sg14_lpi_3_sg17 & (dec_decompress_value_1_sg14_sva_2_sg1(15))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(16)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg16),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_5 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_1
            & dec_decompress_value_1_sg14_lpi_5 & dec_decompress_value_1_sg13_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        dec_decompress_value_1_sg14_lpi_3_sg16 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg16
            & dec_decompress_value_1_sg14_lpi_3_sg16 & (dec_decompress_value_1_sg14_sva_2_sg1(14))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(15)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg15),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg1 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg1
            & dec_decompress_value_1_sg14_lpi_3_sg1 & (dec_decompress_value_1_sg14_lpi_3_dfm_3(0))
            & dec_decompress_value_1_sg14_lpi_5), STD_LOGIC_VECTOR'(or_dcpl_1690
            & or_1800_cse & ((NOT or_dcpl_1022) AND (fsm_output(56))) & (or_dcpl_1022
            AND (fsm_output(56)))));
        dec_decompress_value_1_sg14_lpi_3_sg15 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg15
            & dec_decompress_value_1_sg14_lpi_3_sg15 & (dec_decompress_value_1_sg14_sva_2_sg1(13))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(14)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg14),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg2
            & dec_decompress_value_1_sg14_lpi_3_sg2 & (dec_decompress_value_1_sg14_sva_2_sg1(0))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(1)) & dec_decompress_value_1_sg14_lpi_3_sg1),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg14 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg14
            & dec_decompress_value_1_sg14_lpi_3_sg14 & (dec_decompress_value_1_sg14_sva_2_sg1(12))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(13)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg13),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg3 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg3
            & dec_decompress_value_1_sg14_lpi_3_sg3 & (dec_decompress_value_1_sg14_sva_2_sg1(1))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(2)) & dec_decompress_value_1_sg14_lpi_3_sg2),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg13 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg13
            & dec_decompress_value_1_sg14_lpi_3_sg13 & (dec_decompress_value_1_sg14_sva_2_sg1(11))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(12)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg12),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg4 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg4
            & dec_decompress_value_1_sg14_lpi_3_sg4 & (dec_decompress_value_1_sg14_sva_2_sg1(2))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(3)) & dec_decompress_value_1_sg14_lpi_3_sg3),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg12 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg12
            & dec_decompress_value_1_sg14_lpi_3_sg12 & (dec_decompress_value_1_sg14_sva_2_sg1(10))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(11)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg11),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg5 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg5
            & dec_decompress_value_1_sg14_lpi_3_sg5 & (dec_decompress_value_1_sg14_sva_2_sg1(3))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(4)) & dec_decompress_value_1_sg14_lpi_3_sg4),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg11 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg11
            & dec_decompress_value_1_sg14_lpi_3_sg11 & (dec_decompress_value_1_sg14_sva_2_sg1(9))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(10)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg10),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg6 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg6
            & dec_decompress_value_1_sg14_lpi_3_sg6 & (dec_decompress_value_1_sg14_sva_2_sg1(4))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(5)) & dec_decompress_value_1_sg14_lpi_3_sg5),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg10 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg10
            & dec_decompress_value_1_sg14_lpi_3_sg10 & (dec_decompress_value_1_sg14_sva_2_sg1(8))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(9)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg9),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg7 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg7
            & dec_decompress_value_1_sg14_lpi_3_sg7 & (dec_decompress_value_1_sg14_sva_2_sg1(5))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(6)) & dec_decompress_value_1_sg14_lpi_3_sg6),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg9 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg9
            & dec_decompress_value_1_sg14_lpi_3_sg9 & (dec_decompress_value_1_sg14_sva_2_sg1(7))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(8)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg8),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        dec_decompress_value_1_sg14_lpi_3_sg8 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_dfm_sg8
            & dec_decompress_value_1_sg14_lpi_3_sg8 & (dec_decompress_value_1_sg14_sva_2_sg1(6))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(7)) & dec_decompress_value_1_sg14_lpi_3_sg7),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & and_388_cse & and_389_cse
            & and_390_cse));
        main_decomp_Mn_Fonction_dec_m_input_input_byte_1_lpi_3 <= MUX1HOT_v_17_3_2(main_decomp_Mn_Fonction_dec_m_input_input_byte_1_sva_dfm_1
            & main_decomp_Mn_Fonction_dec_m_input_input_byte_1_lpi_3 & z_out_1, STD_LOGIC_VECTOR'(or_dcpl_1690
            & (or_1800_cse OR (or_2552_tmp AND (fsm_output(56)))) & ((NOT or_2552_tmp)
            AND (fsm_output(56)))));
        main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3 <= MUX1HOT_v_8_4_2(Comp_rsc_singleport_data_out_mxwt
            & main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva & main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3
            & main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_1, STD_LOGIC_VECTOR'((and_497_cse
            OR ((NOT unequal_tmp_9) AND (fsm_output(57)))) & (or_1569_tmp AND (fsm_output(32)))
            & (or_dcpl_1226 OR or_dcpl_1670 OR or_dcpl_1230 OR or_dcpl_1739 OR or_dcpl_1162
            OR or_dcpl_2532 OR or_dcpl_1656 OR or_dcpl_479 OR (fsm_output(49)) OR
            (unequal_tmp_9 AND (fsm_output(57)))) & (fsm_output(58))));
        main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3 <= MUX1HOT_v_8_3_2(main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_1
            & main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3 & (TO_STDLOGICVECTOR(and_344_ssc)
            & ((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(7 DOWNTO 1))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT and_344_ssc, 1),7)))),
            STD_LOGIC_VECTOR'(or_dcpl_1690 & or_1800_cse & (fsm_output(56))));
        main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_sva_dfm_1 <= main_decomp_Mn_Fonction_dec_m_input_m_CurrentByte_1_lpi_3;
        dec_decompress_for_1_range_sva <= MUX_v_32_2_2(dec_decompress_for_1_range_sva
            & z_out_4, fsm_output(33));
        dec_decompress_for_1_scaled_value_acc_mut <= MUX_v_67_2_2(dec_decompress_for_1_scaled_value_acc_mut
            & dec_decompress_for_1_scaled_value_acc_mut_mx0w2, fsm_output(33));
        dec_m_output_putByte_slc_svs <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((z_out_9(7))
            & dec_m_output_putByte_slc_svs), or_2622_cse);
        main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva_1 <= MUX_v_17_2_2(z_out_1
            & main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva_1, or_2622_cse);
        dec_decompress_for_1_acc_3_itm <= MUX_v_16_2_2(z_out_2 & dec_decompress_for_1_acc_3_itm,
            or_dcpl_1226 OR or_dcpl_1670 OR or_dcpl_1230 OR or_dcpl_515 OR or_dcpl_1436
            OR or_dcpl_485 OR or_dcpl_1553 OR (fsm_output(40)) OR (fsm_output(49)));
        ModelA_getChar_for_not_sxt <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(ModelA_getChar_for_not_sxt
            & (NOT ModelA_getChar_for_slc_itm)), and_503_cse)) AND (NOT (fsm_output(43)));
        dec_decompress_for_1_scaled_value_sva <= MUX_v_32_2_2((div_mgc_div_z(31 DOWNTO
            0)) & dec_decompress_for_1_scaled_value_sva, or_dcpl_1560 OR (fsm_output(43))
            OR (fsm_output(41)) OR or_dcpl_528 OR or_dcpl_67);
        ModelA_getChar_for_acc_2_psp_sva <= MUX_v_9_2_2(z_out_8 & ModelA_getChar_for_acc_2_psp_sva,
            or_dcpl_1726 OR or_dcpl_1637 OR or_dcpl_506);
        ModelA_getChar_for_slc_itm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(z_out_8)
            + CONV_SIGNED(UNSIGNED'("11111111"), 9), 9)), 8)) & ModelA_getChar_for_slc_itm),
            or_dcpl_1726 OR or_dcpl_1733);
        ModelA_update_1_for_i_sva_sg1 <= (MUX_v_23_2_2((z_out_10(31 DOWNTO 9)) &
            ModelA_update_1_for_i_sva_sg1, or_dcpl_75)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(43)), 1),23));
        ModelA_update_1_for_i_sva_2 <= MUX1HOT_v_9_3_2(ModelA_getChar_for_acc_2_psp_sva
            & ModelA_update_1_for_i_sva_2 & (z_out_10(8 DOWNTO 0)), STD_LOGIC_VECTOR'((fsm_output(41))
            & (or_dcpl_75 OR (fsm_output(43)) OR (fsm_output(42))) & (fsm_output(44))));
        exit_ModelA_update_1_for_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(exit_ModelA_update_1_for_sva
            & (NOT (z_out_17(30)))), fsm_output(44));
        ModelA_getChar_for_slc_1_itm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(ModelA_getChar_for_slc_1_itm
            & (ModelA_getChar_for_if_acc_tmp(33))), fsm_output(41));
        ModelA_getChar_for_slc_2_cse_sva <= MUX_v_32_2_2(main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
            & ModelA_getChar_for_slc_2_cse_sva, or_dcpl_1726 OR or_dcpl_1553);
        ModelA_getChar_for_if_p_count_sva <= MUX_v_32_2_2(main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
            & ModelA_getChar_for_if_p_count_sva, or_dcpl_1560 OR (fsm_output(43))
            OR (fsm_output(47)) OR (fsm_output(48)));
        slc_ModelA_update_1_for_i_itm <= MUX_v_9_2_2(ModelA_update_1_for_i_sva_2
            & slc_ModelA_update_1_for_i_itm, NOT((fsm_output(46)) OR (fsm_output(43))));
        ModelA_getChar_for_if_p_low_sva <= MUX_v_32_2_2(main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
            & ModelA_getChar_for_if_p_low_sva, or_dcpl_1560 OR (fsm_output(47)) OR
            (fsm_output(48)));
        main_decomp_Mn_Fonction_cmodel_m_frozen_sva_1 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (z_out_3(32))) & main_decomp_Mn_Fonction_cmodel_m_frozen_sva_1), or_dcpl_1230
            OR or_dcpl_467 OR or_dcpl_2692 OR (fsm_output(57)) OR (fsm_output(49)));
        ModelA_getChar_for_if_p_count_lpi_1_dfm <= MUX1HOT_v_32_3_2(ModelA_getChar_for_if_p_count_lpi_1
            & ModelA_getChar_for_if_p_count_sva & ModelA_getChar_for_if_p_count_lpi_1_dfm,
            STD_LOGIC_VECTOR'(and_dcpl_326 & and_dcpl_327 & or_2733_cse));
        dec_decompress_for_1_mul_psp <= MUX_v_64_2_2(dec_decompress_for_1_mul_psp
            & (z_out_7(63 DOWNTO 0)), fsm_output(49));
        dec_decompress_for_1_mul_1_mut <= MUX_v_64_2_2(dec_decompress_for_1_mul_1_mut
            & z_out_6, fsm_output(49));
        ModelA_getChar_for_if_p_low_lpi_1_dfm <= MUX1HOT_v_32_3_2(ModelA_getChar_for_if_p_low_lpi_1
            & ModelA_getChar_for_if_p_low_sva & ModelA_getChar_for_if_p_low_lpi_1_dfm,
            STD_LOGIC_VECTOR'(and_dcpl_326 & and_dcpl_327 & or_2733_cse));
        ModelA_getChar_for_if_p_high_lpi_1_dfm <= MUX1HOT_v_32_3_2(ModelA_getChar_for_if_p_high_lpi_1
            & ModelA_getChar_for_slc_2_cse_sva & ModelA_getChar_for_if_p_high_lpi_1_dfm,
            STD_LOGIC_VECTOR'(and_dcpl_326 & and_dcpl_327 & or_2733_cse));
        dec_decompress_low_sva_1 <= MUX1HOT_v_32_3_2(z_out_5 & ((MUX1HOT_v_16_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(dec_decompress_low_sva_1(30
            DOWNTO 15)) + CONV_UNSIGNED(CONV_SIGNED('1', 1), 16), 16)) & (dec_decompress_low_sva_1(30
            DOWNTO 15)) & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (dec_decompress_low_sva_1(14)),
            1),16)), STD_LOGIC_VECTOR'(dec_decompress_for_1_for_nor_cse & (((NOT
            dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx1) AND dec_decompress_for_1_for_and_1_cse)
            OR (z_out_13(17))) & (dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx1
            AND dec_decompress_for_1_for_and_1_cse)))) & TO_STDLOGICVECTOR(MUX_s_1_2_2(STD_LOGIC_VECTOR'((dec_decompress_low_sva_1(14))
            & (NOT (dec_decompress_low_sva_1(14)))), dec_decompress_for_1_for_and_1_cse))
            & (dec_decompress_low_sva_1(13 DOWNTO 0)) & TO_STDLOGICVECTOR('0')) &
            dec_decompress_low_sva_1, STD_LOGIC_VECTOR'((fsm_output(54)) & (fsm_output(56))
            & (NOT((fsm_output(54)) OR (fsm_output(56))))));
        dec_decompress_high_1_sva_1 <= MUX1HOT_v_32_3_2(z_out_4 & ((MUX1HOT_v_16_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(dec_decompress_high_1_sva_1(30
            DOWNTO 15)) + CONV_UNSIGNED(CONV_SIGNED('1', 1), 16), 16)) & (dec_decompress_high_1_sva_1_dfm_sg1(16
            DOWNTO 1)) & (dec_decompress_high_1_sva_1(30 DOWNTO 15)), STD_LOGIC_VECTOR'(dec_decompress_for_1_for_nor_cse
            & dec_decompress_for_1_for_and_1_cse & (z_out_13(17))))) & TO_STDLOGICVECTOR(MUX_s_1_2_2(STD_LOGIC_VECTOR'((dec_decompress_high_1_sva_1(14))
            & (dec_decompress_high_1_sva_1_dfm_sg1(0))), dec_decompress_for_1_for_and_1_cse))
            & (dec_decompress_high_1_sva_1(13 DOWNTO 0)) & TO_STDLOGICVECTOR('1'))
            & dec_decompress_high_1_sva_1, STD_LOGIC_VECTOR'((fsm_output(55)) & (fsm_output(56))
            & (NOT((fsm_output(56)) OR (fsm_output(55))))));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg16 <= dec_decompress_value_1_sg14_lpi_3_sg16;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg15 <= dec_decompress_value_1_sg14_lpi_3_sg15;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg14 <= dec_decompress_value_1_sg14_lpi_3_sg14;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg13 <= dec_decompress_value_1_sg14_lpi_3_sg13;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg12 <= dec_decompress_value_1_sg14_lpi_3_sg12;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg11 <= dec_decompress_value_1_sg14_lpi_3_sg11;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg10 <= dec_decompress_value_1_sg14_lpi_3_sg10;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg9 <= dec_decompress_value_1_sg14_lpi_3_sg9;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg8 <= dec_decompress_value_1_sg14_lpi_3_sg8;
        unequal_tmp_9 <= NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(0))
            AND (NOT((main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(7)) OR
            (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(6)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(5))
            OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(4)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(3))
            OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(2)) OR (main_decomp_Mn_Fonction_dec_m_input_m_LastMask_lpi_3(1)))));
        reg_div_mgc_div_b_tmp_1 <= MUX1HOT_v_32_5_2(ModelA_getProbability_p_count_sva
            & z_out_4 & dec_decompress_for_1_range_sva & div_mgc_div_1_b_mx1 & ModelA_getChar_for_if_p_count_lpi_1_dfm,
            STD_LOGIC_VECTOR'((or_dcpl_1208 OR or_dcpl_1206 OR (fsm_output(16)))
            & (fsm_output(33)) & or_1252_cse & (fsm_output(49)) & or_1256_cse));
        reg_div_mgc_div_a_tmp <= (MUX_v_3_2_2((dec_decompress_for_1_scaled_value_acc_mut_mx0w2(66
            DOWNTO 64)) & (dec_decompress_for_1_scaled_value_acc_mut(66 DOWNTO 64)),
            or_1252_cse)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(49)),
            1),3)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT((fsm_output(11))
            OR or_1260_ssc OR or_1256_cse), 1),3));
        reg_div_mgc_div_a_tmp_1 <= MUX1HOT_v_64_5_2((z_out_7(63 DOWNTO 0)) & comp_compress_for_mul_1_psp
            & (dec_decompress_for_1_scaled_value_acc_mut_mx0w2(63 DOWNTO 0)) & (dec_decompress_for_1_scaled_value_acc_mut(63
            DOWNTO 0)) & dec_decompress_for_1_mul_psp, STD_LOGIC_VECTOR'(or_2755_cse
            & or_1260_ssc & (fsm_output(33)) & or_1252_cse & or_1256_cse));
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((NOT
            unequal_tmp_6) & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp
            & and_247_ssc), STD_LOGIC_VECTOR'((fsm_output(25)) & or_dcpl_362 & (fsm_output(29))));
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1 <=
            (MUX1HOT_v_6_3_2((cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(7
            DOWNTO 2)) & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1
            & (TO_STDLOGICVECTOR(reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp)
            & (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5
            DOWNTO 1))), STD_LOGIC_VECTOR'((fsm_output(25)) & or_dcpl_362 & (fsm_output(29)))))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(((fsm_output(29)) AND
            and_247_ssc) OR and_dcpl_350), 1),6));
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((NOT
            unequal_tmp_6) & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp
            & and_241_ssc), STD_LOGIC_VECTOR'((fsm_output(25)) & or_dcpl_1518 & (fsm_output(27))));
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1 <= (MUX1HOT_v_7_3_2((cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2(7
            DOWNTO 1)) & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1
            & (TO_STDLOGICVECTOR(reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp)
            & (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(6
            DOWNTO 1))), STD_LOGIC_VECTOR'((fsm_output(25)) & or_dcpl_1518 & (fsm_output(27)))))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(((fsm_output(27)) AND
            and_241_ssc) OR and_dcpl_350), 1),7));
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(and_223_ssc
            & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp
            & and_229_ssc), STD_LOGIC_VECTOR'((fsm_output(18)) & or_dcpl_134 & (fsm_output(20))));
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1 <=
            MUX1HOT_v_7_3_2(and_384_itm & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1
            & ((TO_STDLOGICVECTOR(reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp)
            & (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(6
            DOWNTO 1))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT and_229_ssc,
            1),7))), STD_LOGIC_VECTOR'((fsm_output(18)) & or_dcpl_134 & (fsm_output(20))));
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp <=
            MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(and_223_ssc & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp
            & and_235_ssc), STD_LOGIC_VECTOR'((fsm_output(18)) & or_dcpl_1501 & (fsm_output(22))));
        reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1 <=
            MUX1HOT_v_7_3_2(and_384_itm & reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1
            & ((TO_STDLOGICVECTOR(reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp)
            & (reg_cod_entropique_Mn_Fonction_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(6
            DOWNTO 1))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT and_235_ssc,
            1),7))), STD_LOGIC_VECTOR'((fsm_output(18)) & or_dcpl_1501 & (fsm_output(22))));
        reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp <= and_266_ssc;
        reg_main_decomp_Mn_Fonction_dec_m_input_m_LastMask_sva_dfm_tmp_1 <= and_385_itm;
      END IF;
    END IF;
  END PROCESS;
  mux1h_382_nl <= MUX1HOT_v_17_8_2(cod_entropique_Mn_Fonction_comp_byte_to_encode_1_sva
      & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1(16 DOWNTO
      0)) & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_3(16
      DOWNTO 0)) & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1(16
      DOWNTO 0)) & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_3(16
      DOWNTO 0)) & main_decomp_Mn_Fonction_dec_m_input_input_byte_1_sva & main_decomp_Mn_Fonction_dec_m_input_input_byte_1_lpi_3
      & main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva, STD_LOGIC_VECTOR'((fsm_output(4))
      & (fsm_output(20)) & (fsm_output(22)) & (fsm_output(27)) & (fsm_output(29))
      & (fsm_output(31)) & (fsm_output(56)) & (fsm_output(33))));
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux1h_382_nl) + UNSIGNED'("00000000000000001"),
      17));
  mux_149_nl <= MUX_v_15_2_2(comp_compress_low_1_sva_4 & dec_decompress_low_sva_5,
      fsm_output(33));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_149_nl), 16)
      + UNSIGNED'("1111111111111111"), 16));
  mux_150_nl <= MUX_v_32_2_2(cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
      & main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out,
      fsm_output(48));
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_150_nl), 33)
      + UNSIGNED'("111111111111111111100000000000001"), 33));
  mux1h_374_nl <= MUX1HOT_v_32_4_2((div_mgc_div_1_z(31 DOWNTO 0)) & (div_mgc_div_z(31
      DOWNTO 0)) & comp_compress_high_1_sva & dec_decompress_high_1_sva, STD_LOGIC_VECTOR'((fsm_output(16))
      & (fsm_output(55)) & (fsm_output(11)) & (fsm_output(33))));
  mux_157_nl <= MUX_v_14_2_2((NOT (comp_compress_low_1_sva_4(14 DOWNTO 1))) & (NOT
      (dec_decompress_low_sva_5(14 DOWNTO 1))), fsm_output(33));
  mux1h_375_nl <= MUX1HOT_v_15_3_2((comp_compress_for_acc_3_itm(15 DOWNTO 1)) & (dec_decompress_for_1_acc_3_itm(15
      DOWNTO 1)) & STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(TO_STDLOGICVECTOR('1') & (mux_157_nl))
      + SIGNED'("000000000000001"), 15)), STD_LOGIC_VECTOR'((fsm_output(16)) & (fsm_output(55))
      & ((fsm_output(11)) OR (fsm_output(33)))));
  mux1h_388_nl <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'((comp_compress_for_acc_3_itm(0))
      & (dec_decompress_for_1_acc_3_itm(0)) & (NOT (comp_compress_low_1_sva_4(0)))
      & (NOT (dec_decompress_low_sva_5(0)))), STD_LOGIC_VECTOR'((fsm_output(16))
      & (fsm_output(55)) & (fsm_output(11)) & (fsm_output(33))));
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux1h_374_nl) + CONV_UNSIGNED(SIGNED((mux1h_375_nl)
      & TO_STDLOGICVECTOR(mux1h_388_nl)), 32), 32));
  mux_151_nl <= MUX_v_15_2_2(comp_compress_low_1_sva_4 & dec_decompress_low_sva_5,
      fsm_output(54));
  mux_152_nl <= MUX_v_32_2_2((div_mgc_div_z(31 DOWNTO 0)) & (div_mgc_div_1_z(31 DOWNTO
      0)), fsm_output(54));
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_151_nl), 32)
      + UNSIGNED(mux_152_nl), 32));
  mux_153_nl <= MUX_v_32_2_2(z_out_4 & dec_decompress_for_1_range_sva, fsm_output(49));
  mux1h_389_nl <= MUX1HOT_v_32_3_2(ModelA_getProbability_p_high_sva & ModelA_getChar_for_if_p_low_sva
      & ModelA_getChar_for_if_p_low_lpi_1, STD_LOGIC_VECTOR'((NOT (fsm_output(49)))
      & and_dcpl_327 & and_dcpl_326));
  z_out_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(UNSIGNED(mux_153_nl) * UNSIGNED(mux1h_389_nl)),
      64));
  mux1h_376_nl <= MUX1HOT_v_32_4_2(main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
      & ModelA_getProbability_p_low_sva & ModelA_getChar_for_slc_2_cse_sva & ModelA_getChar_for_if_p_high_lpi_1,
      STD_LOGIC_VECTOR'((fsm_output(33)) & (fsm_output(11)) & and_dcpl_327 & and_dcpl_326));
  mux1h_377_nl <= MUX1HOT_v_32_3_2(((dec_decompress_for_1_scaled_value_acc_5_sdt(30
      DOWNTO 0)) & TO_STDLOGICVECTOR(dec_decompress_for_1_scaled_value_acc_4_sdt(0)))
      & z_out_4 & dec_decompress_for_1_range_sva, STD_LOGIC_VECTOR'((fsm_output(33))
      & (fsm_output(11)) & (fsm_output(49))));
  z_out_7 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'(CONV_SIGNED(UNSIGNED(mux1h_376_nl),
      33) * SIGNED(((dec_decompress_for_1_scaled_value_acc_5_sdt(32 DOWNTO 31)) AND
      STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT((fsm_output(11)) OR (fsm_output(49))),
      1),2))) & (mux1h_377_nl))), 66));
  mux_155_nl <= MUX_v_9_2_2(ModelA_getChar_for_i_1_sva & (TO_STDLOGICVECTOR(comp_compress_for_c_sg1_2_lpi_1_dfm_1)
      & comp_compress_for_c_1_lpi_1_dfm_1), fsm_output(5));
  z_out_8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux_155_nl) + UNSIGNED'("000000001"),
      9));
  mux_156_nl <= MUX_v_7_2_2((cod_entropique_Mn_Fonction_comp_byte_to_encode_1_sva(16
      DOWNTO 10)) & (main_decomp_Mn_Fonction_dec_m_output_index_range_1_sva(16 DOWNTO
      10)), fsm_output(33));
  z_out_9 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_156_nl), 8)
      + UNSIGNED'("10110101"), 8));
  mux1h_378_nl <= MUX1HOT_v_32_9_2((ModelA_update_for_i_sva_sg1 & ModelA_update_for_i_sva_2)
      & comp_put_bit_plus_pending_3_for_i_sva & comp_put_bit_plus_pending_2_for_i_sva
      & comp_put_bit_plus_pending_for_i_sva & cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2
      & comp_put_bit_plus_pending_1_for_i_sva & (ModelA_update_1_for_i_sva_sg1 &
      ModelA_update_1_for_i_sva_2) & cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
      & main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out,
      STD_LOGIC_VECTOR'((fsm_output(8)) & (fsm_output(29)) & (fsm_output(27)) & (fsm_output(20))
      & or_dcpl_343 & (fsm_output(22)) & (fsm_output(44)) & (fsm_output(9)) & (fsm_output(45))));
  z_out_10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux1h_378_nl) + UNSIGNED'("00000000000000000000000000000001"),
      32));
  mux_158_nl <= MUX_v_17_2_2((comp_compress_low_1_sva_1(31 DOWNTO 15)) & (dec_decompress_low_sva_1(31
      DOWNTO 15)), fsm_output(56));
  z_out_12 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_158_nl),
      18) + UNSIGNED'("111111111111111111"), 18));
  mux_159_nl <= MUX_v_17_2_2((comp_compress_high_1_sva_1(31 DOWNTO 15)) & (dec_decompress_high_1_sva_1(31
      DOWNTO 15)), fsm_output(56));
  z_out_13 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_159_nl),
      18) + UNSIGNED'("111111111111111111"), 18));
  mux_160_nl <= MUX_v_32_2_2((NOT comp_compress_pending_bits_1_lpi_2) & (NOT comp_compress_pending_bits_1_lpi_2_dfm_2),
      fsm_output(25));
  z_out_14 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(SIGNED(mux_160_nl), 33)
      + UNSIGNED'("000000000000000000000000000000001"), 33));
  mux_161_nl <= MUX_v_18_2_2((dec_decompress_high_1_sva_1(31 DOWNTO 14)) & (comp_compress_high_1_sva_1(31
      DOWNTO 14)), fsm_output(18));
  z_out_15 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_161_nl),
      19) + UNSIGNED'("1111111111111111101"), 19));
  mux1h_379_nl <= MUX1HOT_v_22_5_2((cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2(31
      DOWNTO 10)) & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_1(31
      DOWNTO 10)) & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_1(31
      DOWNTO 10)) & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_2_dfm_3(31
      DOWNTO 10)) & (cod_entropique_Mn_Fonction_comp_m_output_index_range_lpi_dfm_3(31
      DOWNTO 10)), STD_LOGIC_VECTOR'(or_dcpl_343 & (fsm_output(27)) & (fsm_output(20))
      & (fsm_output(22)) & (fsm_output(29))));
  z_out_16 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux1h_379_nl),
      23) + UNSIGNED'("11111111111111110110101"), 23));
  z_out_17 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_10(31 DOWNTO 1)) + UNSIGNED'("1111111111111111111111101111111"),
      31));
  mux_187_nl <= MUX_v_32_2_2((NOT comp_compress_pending_bits_1_lpi_2) & (NOT comp_compress_pending_bits_sva),
      (fsm_output(27)) OR (fsm_output(29)));
  z_out_18 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(SIGNED(z_out_10 & TO_STDLOGICVECTOR('1')),
      34) + CONV_UNSIGNED(SIGNED((mux_187_nl) & TO_STDLOGICVECTOR('1')), 34), 34));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    Main_Only_Comp_Decomp_Main_Fonction
--  Generated from file(s):
--   13) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_noW/Main_Only_Comp_Decomp.cpp
--   11) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_noW/Main_Cod_Entropique.cpp
--    2) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_noW/model.h
--    4) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_noW/Main_Decomp.cpp
--    6) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_noW/model.cpp
--   15) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_noW/Compressor.cpp
--    5) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_noW/Exchange.cpp
--   10) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_noW/Decompressor.cpp
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps.ALL;
USE work.singleport_ram_be_pkg.ALL;
USE work.Main_Only_Comp_Decomp_Main_Fonction_mux_pkg.ALL;


ENTITY Main_Only_Comp_Decomp_Main_Fonction IS
  PORT(
    start : IN STD_LOGIC;
    done : OUT STD_LOGIC;
    Main_Only_Comp_Decomp_Main_Fonction_return_rsc_z : OUT STD_LOGIC_VECTOR (31 DOWNTO
        0);
    nblevels_triosy_lz : OUT STD_LOGIC;
    Src_triosy_lz : OUT STD_LOGIC;
    Comp_triosy_lz : OUT STD_LOGIC;
    Vga_triosy_lz : OUT STD_LOGIC;
    Main_Only_Comp_Decomp_Main_Fonction_return_triosy_lz : OUT STD_LOGIC;
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    Src_rsc_singleport_data_in : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    Src_rsc_singleport_addr : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    Src_rsc_singleport_re : OUT STD_LOGIC;
    Src_rsc_singleport_we : OUT STD_LOGIC;
    Src_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    Comp_rsc_singleport_data_in : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    Comp_rsc_singleport_addr : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    Comp_rsc_singleport_re : OUT STD_LOGIC;
    Comp_rsc_singleport_we : OUT STD_LOGIC;
    Comp_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    Vga_rsc_singleport_data_in : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    Vga_rsc_singleport_addr : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    Vga_rsc_singleport_re : OUT STD_LOGIC;
    Vga_rsc_singleport_we : OUT STD_LOGIC;
    Vga_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END Main_Only_Comp_Decomp_Main_Fonction;

ARCHITECTURE v1 OF Main_Only_Comp_Decomp_Main_Fonction IS
  -- Default Constants
  SIGNAL PWR : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL core_wen : STD_LOGIC;
  SIGNAL Src_rsc_singleport_addr_core : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Src_rsc_singleport_re_core_sct : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_data_in_core : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Comp_rsc_singleport_addr_core : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Comp_rsc_singleport_re_core_sct : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_we_core_sct : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_data_in_core : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Vga_rsc_singleport_addr_core : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Vga_rsc_singleport_we_core_sct : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr
      : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re
      : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we
      : STD_LOGIC;
  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr
      : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re :
      STD_LOGIC;
  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we :
      STD_LOGIC;
  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mgc_start_sync_mgc_bsync_vld_vd : STD_LOGIC;
  SIGNAL mgc_done_sync_mgc_bsync_rdy_rd_core_sct : STD_LOGIC;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct
      : STD_LOGIC;
  SIGNAL Vga_triosy_mgc_io_sync_ld_core_sct : STD_LOGIC;
  SIGNAL Comp_triosy_mgc_io_sync_ld_core_sct : STD_LOGIC;
  SIGNAL Src_triosy_mgc_io_sync_ld_core_sct : STD_LOGIC;
  SIGNAL nblevels_triosy_mgc_io_sync_ld_core_sct : STD_LOGIC;
  SIGNAL div_mgc_div_a : STD_LOGIC_VECTOR (66 DOWNTO 0);
  SIGNAL div_mgc_div_b : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL div_mgc_div_z : STD_LOGIC_VECTOR (66 DOWNTO 0);
  SIGNAL div_mgc_div_1_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL div_mgc_div_1_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL div_mgc_div_1_z : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d_1 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_z : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in_1
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr_1
      : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re_1
      : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we_1
      : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out_1
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_en
      : STD_LOGIC;

  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in_1
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr_1
      : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re_1
      : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we_1
      : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out_1
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_en :
      STD_LOGIC;

  SIGNAL div_mgc_div_a_1 : STD_LOGIC_VECTOR (66 DOWNTO 0);
  SIGNAL div_mgc_div_b_1 : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL div_mgc_div_z_1 : STD_LOGIC_VECTOR (66 DOWNTO 0);

  SIGNAL div_mgc_div_1_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL div_mgc_div_1_b_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL div_mgc_div_1_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT Main_Only_Comp_Decomp_Main_Fonction_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      Src_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      Comp_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      core_wen : OUT STD_LOGIC;
      Src_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
      Src_rsc_singleport_re_core_sct : OUT STD_LOGIC;
      Comp_rsc_singleport_data_in_core : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      Comp_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
      Comp_rsc_singleport_re_core_sct : OUT STD_LOGIC;
      Comp_rsc_singleport_we_core_sct : OUT STD_LOGIC;
      Vga_rsc_singleport_data_in_core : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      Vga_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
      Vga_rsc_singleport_we_core_sct : OUT STD_LOGIC;
      Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d : OUT STD_LOGIC_VECTOR
          (31 DOWNTO 0);
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in
          : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr
          : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re :
          OUT STD_LOGIC;
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we :
          OUT STD_LOGIC;
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
          : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in
          : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr : OUT
          STD_LOGIC_VECTOR (8 DOWNTO 0);
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re : OUT
          STD_LOGIC;
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we : OUT
          STD_LOGIC;
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
          : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mgc_start_sync_mgc_bsync_vld_vd : IN STD_LOGIC;
      mgc_done_sync_mgc_bsync_rdy_rd_core_sct : OUT STD_LOGIC;
      Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct :
          OUT STD_LOGIC;
      Vga_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      Comp_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      Src_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      nblevels_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      div_mgc_div_a : OUT STD_LOGIC_VECTOR (66 DOWNTO 0);
      div_mgc_div_b : OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
      div_mgc_div_z : IN STD_LOGIC_VECTOR (66 DOWNTO 0);
      div_mgc_div_1_a : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      div_mgc_div_1_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      div_mgc_div_1_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_Src_rsc_singleport_data_out
      : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_Comp_rsc_singleport_data_out
      : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_Src_rsc_singleport_addr_core
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_Comp_rsc_singleport_data_in_core
      : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_Comp_rsc_singleport_addr_core
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_Vga_rsc_singleport_data_in_core
      : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_Vga_rsc_singleport_addr_core
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr
      : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr
      : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_a : STD_LOGIC_VECTOR
      (66 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_b : STD_LOGIC_VECTOR
      (32 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_z : STD_LOGIC_VECTOR
      (66 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_1_a : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_1_b : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_1_z : STD_LOGIC_VECTOR
      (63 DOWNTO 0);

BEGIN
  -- Default Constant Signal Assignments
  PWR <= '1';

  Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg : work.mgc_ioport_comps.mgc_out_stdreg
    GENERIC MAP(
      rscid => 5,
      width => 32
      )
    PORT MAP(
      d => Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d_1,
      z => Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_z
    );
  Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d_1 <= Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d;
  Main_Only_Comp_Decomp_Main_Fonction_return_rsc_z <= Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_z;

  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport : work.singleport_ram_be_pkg.singleport_ram_be
    GENERIC MAP(
      ram_id => 6,
      words => 258,
      width => 32,
      addr_width => 9,
      a_reset_active => 0,
      s_reset_active => 1,
      enable_active => 0,
      re_active => 0,
      we_active => 0,
      num_byte_enables => 1,
      clock_edge => 1,
      num_input_registers => 1,
      num_output_registers => 0,
      no_of_singleport_readwrite_port => 1
      )
    PORT MAP(
      data_in => cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in_1,
      addr => cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr_1,
      re => cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re_1,
      we => cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we_1,
      data_out => cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out_1,
      clk => clk,
      a_rst => PWR,
      s_rst => rst,
      en => cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_en
    );
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in_1
      <= cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in;
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr_1 <=
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr;
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re_1(0) <=
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re;
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we_1(0) <=
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we;
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
      <= cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out_1;
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_en <= NOT
      core_wen;

  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport : work.singleport_ram_be_pkg.singleport_ram_be
    GENERIC MAP(
      ram_id => 7,
      words => 258,
      width => 32,
      addr_width => 9,
      a_reset_active => 0,
      s_reset_active => 1,
      enable_active => 0,
      re_active => 0,
      we_active => 0,
      num_byte_enables => 1,
      clock_edge => 1,
      num_input_registers => 1,
      num_output_registers => 0,
      no_of_singleport_readwrite_port => 1
      )
    PORT MAP(
      data_in => main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in_1,
      addr => main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr_1,
      re => main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re_1,
      we => main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we_1,
      data_out => main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out_1,
      clk => clk,
      a_rst => PWR,
      s_rst => rst,
      en => main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_en
    );
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in_1 <=
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in;
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr_1 <= main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr;
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re_1(0) <= main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re;
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we_1(0) <= main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we;
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out <=
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out_1;
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_en <= NOT core_wen;

  mgc_start_sync_mgc_bsync_vld : work.mgc_ioport_comps.mgc_bsync_vld
    GENERIC MAP(
      rscid => 9,
      ready => 0,
      valid => 1
      )
    PORT MAP(
      vd => mgc_start_sync_mgc_bsync_vld_vd,
      vz => start
    );
  mgc_done_sync_mgc_bsync_rdy : work.mgc_ioport_comps.mgc_bsync_rdy
    GENERIC MAP(
      rscid => 10,
      ready => 1,
      valid => 0
      )
    PORT MAP(
      rd => mgc_done_sync_mgc_bsync_rdy_rd_core_sct,
      rz => done
    );
  Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync : work.mgc_ioport_comps.mgc_io_sync
    PORT MAP(
      ld => Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct,
      lz => Main_Only_Comp_Decomp_Main_Fonction_return_triosy_lz
    );
  Vga_triosy_mgc_io_sync : work.mgc_ioport_comps.mgc_io_sync
    PORT MAP(
      ld => Vga_triosy_mgc_io_sync_ld_core_sct,
      lz => Vga_triosy_lz
    );
  Comp_triosy_mgc_io_sync : work.mgc_ioport_comps.mgc_io_sync
    PORT MAP(
      ld => Comp_triosy_mgc_io_sync_ld_core_sct,
      lz => Comp_triosy_lz
    );
  Src_triosy_mgc_io_sync : work.mgc_ioport_comps.mgc_io_sync
    PORT MAP(
      ld => Src_triosy_mgc_io_sync_ld_core_sct,
      lz => Src_triosy_lz
    );
  nblevels_triosy_mgc_io_sync : work.mgc_ioport_comps.mgc_io_sync
    PORT MAP(
      ld => nblevels_triosy_mgc_io_sync_ld_core_sct,
      lz => nblevels_triosy_lz
    );
  div_mgc_div : work.mgc_comps.mgc_div
    GENERIC MAP(
      width_a => 67,
      width_b => 33,
      signd => 1
      )
    PORT MAP(
      a => div_mgc_div_a_1,
      b => div_mgc_div_b_1,
      z => div_mgc_div_z_1
    );
  div_mgc_div_a_1 <= div_mgc_div_a;
  div_mgc_div_b_1 <= div_mgc_div_b;
  div_mgc_div_z <= div_mgc_div_z_1;

  div_mgc_div_1 : work.mgc_comps.mgc_div
    GENERIC MAP(
      width_a => 64,
      width_b => 32,
      signd => 0
      )
    PORT MAP(
      a => div_mgc_div_1_a_1,
      b => div_mgc_div_1_b_1,
      z => div_mgc_div_1_z_1
    );
  div_mgc_div_1_a_1 <= div_mgc_div_1_a;
  div_mgc_div_1_b_1 <= div_mgc_div_1_b;
  div_mgc_div_1_z <= div_mgc_div_1_z_1;

  Main_Only_Comp_Decomp_Main_Fonction_core_inst : Main_Only_Comp_Decomp_Main_Fonction_core
    PORT MAP(
      clk => clk,
      rst => rst,
      Src_rsc_singleport_data_out => Main_Only_Comp_Decomp_Main_Fonction_core_inst_Src_rsc_singleport_data_out,
      Comp_rsc_singleport_data_out => Main_Only_Comp_Decomp_Main_Fonction_core_inst_Comp_rsc_singleport_data_out,
      core_wen => core_wen,
      Src_rsc_singleport_addr_core => Main_Only_Comp_Decomp_Main_Fonction_core_inst_Src_rsc_singleport_addr_core,
      Src_rsc_singleport_re_core_sct => Src_rsc_singleport_re_core_sct,
      Comp_rsc_singleport_data_in_core => Main_Only_Comp_Decomp_Main_Fonction_core_inst_Comp_rsc_singleport_data_in_core,
      Comp_rsc_singleport_addr_core => Main_Only_Comp_Decomp_Main_Fonction_core_inst_Comp_rsc_singleport_addr_core,
      Comp_rsc_singleport_re_core_sct => Comp_rsc_singleport_re_core_sct,
      Comp_rsc_singleport_we_core_sct => Comp_rsc_singleport_we_core_sct,
      Vga_rsc_singleport_data_in_core => Main_Only_Comp_Decomp_Main_Fonction_core_inst_Vga_rsc_singleport_data_in_core,
      Vga_rsc_singleport_addr_core => Main_Only_Comp_Decomp_Main_Fonction_core_inst_Vga_rsc_singleport_addr_core,
      Vga_rsc_singleport_we_core_sct => Vga_rsc_singleport_we_core_sct,
      Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d => Main_Only_Comp_Decomp_Main_Fonction_core_inst_Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d,
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in
          => Main_Only_Comp_Decomp_Main_Fonction_core_inst_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in,
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr
          => Main_Only_Comp_Decomp_Main_Fonction_core_inst_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr,
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re =>
          cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re,
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we =>
          cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we,
      cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
          => Main_Only_Comp_Decomp_Main_Fonction_core_inst_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out,
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in
          => Main_Only_Comp_Decomp_Main_Fonction_core_inst_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in,
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr =>
          Main_Only_Comp_Decomp_Main_Fonction_core_inst_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr,
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re => main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_re,
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we => main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_we,
      main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
          => Main_Only_Comp_Decomp_Main_Fonction_core_inst_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out,
      mgc_start_sync_mgc_bsync_vld_vd => mgc_start_sync_mgc_bsync_vld_vd,
      mgc_done_sync_mgc_bsync_rdy_rd_core_sct => mgc_done_sync_mgc_bsync_rdy_rd_core_sct,
      Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct =>
          Main_Only_Comp_Decomp_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct,
      Vga_triosy_mgc_io_sync_ld_core_sct => Vga_triosy_mgc_io_sync_ld_core_sct,
      Comp_triosy_mgc_io_sync_ld_core_sct => Comp_triosy_mgc_io_sync_ld_core_sct,
      Src_triosy_mgc_io_sync_ld_core_sct => Src_triosy_mgc_io_sync_ld_core_sct,
      nblevels_triosy_mgc_io_sync_ld_core_sct => nblevels_triosy_mgc_io_sync_ld_core_sct,
      div_mgc_div_a => Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_a,
      div_mgc_div_b => Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_b,
      div_mgc_div_z => Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_z,
      div_mgc_div_1_a => Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_1_a,
      div_mgc_div_1_b => Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_1_b,
      div_mgc_div_1_z => Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_1_z
    );
  Main_Only_Comp_Decomp_Main_Fonction_core_inst_Src_rsc_singleport_data_out <= Src_rsc_singleport_data_out;
  Main_Only_Comp_Decomp_Main_Fonction_core_inst_Comp_rsc_singleport_data_out <= Comp_rsc_singleport_data_out;
  Src_rsc_singleport_addr_core <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_Src_rsc_singleport_addr_core;
  Comp_rsc_singleport_data_in_core <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_Comp_rsc_singleport_data_in_core;
  Comp_rsc_singleport_addr_core <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_Comp_rsc_singleport_addr_core;
  Vga_rsc_singleport_data_in_core <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_Vga_rsc_singleport_data_in_core;
  Vga_rsc_singleport_addr_core <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_Vga_rsc_singleport_addr_core;
  Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_Main_Only_Comp_Decomp_Main_Fonction_return_rsc_mgc_out_stdreg_d;
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in <=
      Main_Only_Comp_Decomp_Main_Fonction_core_inst_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in;
  cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr;
  Main_Only_Comp_Decomp_Main_Fonction_core_inst_cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
      <= cod_entropique_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out;
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_in;
  main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_addr;
  Main_Only_Comp_Decomp_Main_Fonction_core_inst_main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out
      <= main_decomp_Mn_Fonction_cmodel_cumulative_frequency_rsc_singleport_data_out;
  div_mgc_div_a <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_a;
  div_mgc_div_b <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_b;
  Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_z <= div_mgc_div_z;
  div_mgc_div_1_a <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_1_a;
  div_mgc_div_1_b <= Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_1_b;
  Main_Only_Comp_Decomp_Main_Fonction_core_inst_div_mgc_div_1_z <= div_mgc_div_1_z;

  Src_rsc_singleport_data_in <= STD_LOGIC_VECTOR'("00000000");
  Src_rsc_singleport_addr <= Src_rsc_singleport_addr_core;
  Src_rsc_singleport_re <= NOT Src_rsc_singleport_re_core_sct;
  Src_rsc_singleport_we <= '1';
  Comp_rsc_singleport_data_in <= Comp_rsc_singleport_data_in_core;
  Comp_rsc_singleport_addr <= Comp_rsc_singleport_addr_core;
  Comp_rsc_singleport_re <= NOT Comp_rsc_singleport_re_core_sct;
  Comp_rsc_singleport_we <= NOT Comp_rsc_singleport_we_core_sct;
  Vga_rsc_singleport_data_in <= Vga_rsc_singleport_data_in_core;
  Vga_rsc_singleport_addr <= Vga_rsc_singleport_addr_core;
  Vga_rsc_singleport_re <= '1';
  Vga_rsc_singleport_we <= NOT Vga_rsc_singleport_we_core_sct;
END v1;



