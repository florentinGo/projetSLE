
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
--  Generated date: Wed Feb  1 17:50:27 2017
-- ----------------------------------------------------------------------

-- 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;

PACKAGE Main_Comp_Decomp_Tot_Main_Fonction_mux_pkg IS 
  FUNCTION MUX_s_1_2_2(inputs : STD_LOGIC_VECTOR(1 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC;
  FUNCTION MUX_v_8_2_2(inputs : STD_LOGIC_VECTOR(15 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_32_2_2(inputs : STD_LOGIC_VECTOR(63 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_9_2_2(inputs : STD_LOGIC_VECTOR(17 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_8_10_2(inputs : STD_LOGIC_VECTOR(79 DOWNTO 0); sel : STD_LOGIC_VECTOR(9
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_s_1_9_2(inputs : STD_LOGIC_VECTOR(8 DOWNTO 0); sel : STD_LOGIC_VECTOR(8
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_s_1_12_2(inputs : STD_LOGIC_VECTOR(11 DOWNTO 0); sel : STD_LOGIC_VECTOR(11
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_v_7_14_2(inputs : STD_LOGIC_VECTOR(97 DOWNTO 0); sel : STD_LOGIC_VECTOR(13
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_s_1_13_2(inputs : STD_LOGIC_VECTOR(12 DOWNTO 0); sel : STD_LOGIC_VECTOR(12
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_v_5_15_2(inputs : STD_LOGIC_VECTOR(74 DOWNTO 0); sel : STD_LOGIC_VECTOR(14
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_s_1_11_2(inputs : STD_LOGIC_VECTOR(10 DOWNTO 0); sel : STD_LOGIC_VECTOR(10
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_v_8_19_2(inputs : STD_LOGIC_VECTOR(151 DOWNTO 0); sel : STD_LOGIC_VECTOR(18
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_s_1_18_2(inputs : STD_LOGIC_VECTOR(17 DOWNTO 0); sel : STD_LOGIC_VECTOR(17
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_s_1_19_2(inputs : STD_LOGIC_VECTOR(18 DOWNTO 0); sel : STD_LOGIC_VECTOR(18
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_v_5_22_2(inputs : STD_LOGIC_VECTOR(109 DOWNTO 0); sel : STD_LOGIC_VECTOR(21
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_s_1_16_2(inputs : STD_LOGIC_VECTOR(15 DOWNTO 0); sel : STD_LOGIC_VECTOR(15
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_v_8_6_2(inputs : STD_LOGIC_VECTOR(47 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_9_8_2(inputs : STD_LOGIC_VECTOR(71 DOWNTO 0); sel : STD_LOGIC_VECTOR(7
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_s_1_8_2(inputs : STD_LOGIC_VECTOR(7 DOWNTO 0); sel : STD_LOGIC_VECTOR(7
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_v_5_11_2(inputs : STD_LOGIC_VECTOR(54 DOWNTO 0); sel : STD_LOGIC_VECTOR(10
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_s_1_7_2(inputs : STD_LOGIC_VECTOR(6 DOWNTO 0); sel : STD_LOGIC_VECTOR(6
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_s_1_3_2(inputs : STD_LOGIC_VECTOR(2 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_v_9_11_2(inputs : STD_LOGIC_VECTOR(98 DOWNTO 0); sel : STD_LOGIC_VECTOR(10
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_32_3_2(inputs : STD_LOGIC_VECTOR(95 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_64_3_2(inputs : STD_LOGIC_VECTOR(191 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_4_2_2(inputs : STD_LOGIC_VECTOR(7 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_9_3_2(inputs : STD_LOGIC_VECTOR(26 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_2_2_2(inputs : STD_LOGIC_VECTOR(3 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_8_3_2(inputs : STD_LOGIC_VECTOR(23 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_8_4_2(inputs : STD_LOGIC_VECTOR(31 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_15_2_2(inputs : STD_LOGIC_VECTOR(29 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_7_2_2(inputs : STD_LOGIC_VECTOR(13 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_6_2_2(inputs : STD_LOGIC_VECTOR(11 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_5_2_2(inputs : STD_LOGIC_VECTOR(9 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_17_2_2(inputs : STD_LOGIC_VECTOR(33 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_16_2_2(inputs : STD_LOGIC_VECTOR(31 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_17_3_2(inputs : STD_LOGIC_VECTOR(50 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_23_2_2(inputs : STD_LOGIC_VECTOR(45 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_64_2_2(inputs : STD_LOGIC_VECTOR(127 DOWNTO 0); sel : STD_LOGIC)
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
  FUNCTION MUX1HOT_v_7_3_2(inputs : STD_LOGIC_VECTOR(20 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_16_3_2(inputs : STD_LOGIC_VECTOR(47 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_31_2_2(inputs : STD_LOGIC_VECTOR(61 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_30_3_2(inputs : STD_LOGIC_VECTOR(89 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_28_2_2(inputs : STD_LOGIC_VECTOR(55 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_32_4_2(inputs : STD_LOGIC_VECTOR(127 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
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
  FUNCTION MUX1HOT_v_32_13_2(inputs : STD_LOGIC_VECTOR(415 DOWNTO 0); sel : STD_LOGIC_VECTOR(12
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_8_11_2(inputs : STD_LOGIC_VECTOR(87 DOWNTO 0); sel : STD_LOGIC_VECTOR(10
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_8_9_2(inputs : STD_LOGIC_VECTOR(71 DOWNTO 0); sel : STD_LOGIC_VECTOR(8
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_2_7_2(inputs : STD_LOGIC_VECTOR(13 DOWNTO 0); sel : STD_LOGIC_VECTOR(6
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_17_8_2(inputs : STD_LOGIC_VECTOR(135 DOWNTO 0); sel : STD_LOGIC_VECTOR(7
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_15_3_2(inputs : STD_LOGIC_VECTOR(44 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_32_7_2(inputs : STD_LOGIC_VECTOR(223 DOWNTO 0); sel : STD_LOGIC_VECTOR(6
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_7_8_2(inputs : STD_LOGIC_VECTOR(55 DOWNTO 0); sel : STD_LOGIC_VECTOR(7
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_8_5_2(inputs : STD_LOGIC_VECTOR(39 DOWNTO 0); sel : STD_LOGIC_VECTOR(4
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_7_6_2(inputs : STD_LOGIC_VECTOR(41 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_4_4_2(inputs : STD_LOGIC_VECTOR(15 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_18_2_2(inputs : STD_LOGIC_VECTOR(35 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_32_6_2(inputs : STD_LOGIC_VECTOR(191 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_29_6_2(inputs : STD_LOGIC_VECTOR(173 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_s_1_6_2(inputs : STD_LOGIC_VECTOR(5 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
      DOWNTO 0))
    RETURN STD_LOGIC;
  FUNCTION MUX1HOT_v_2_3_2(inputs : STD_LOGIC_VECTOR(5 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_22_5_2(inputs : STD_LOGIC_VECTOR(109 DOWNTO 0); sel : STD_LOGIC_VECTOR(4
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
END Main_Comp_Decomp_Tot_Main_Fonction_mux_pkg;

PACKAGE BODY Main_Comp_Decomp_Tot_Main_Fonction_mux_pkg IS
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

FUNCTION MUX1HOT_v_8_10_2(inputs : STD_LOGIC_VECTOR(79 DOWNTO 0); sel : STD_LOGIC_VECTOR(9
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(79 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 7 DOWNTO 0) and tmp;
    FOR i in 1 TO 9 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*8-1 DOWNTO i*8) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_9_2(inputs : STD_LOGIC_VECTOR(8 DOWNTO 0); sel : STD_LOGIC_VECTOR(8
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(8 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 8 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_12_2(inputs : STD_LOGIC_VECTOR(11 DOWNTO 0); sel : STD_LOGIC_VECTOR(11
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(11 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 11 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_7_14_2(inputs : STD_LOGIC_VECTOR(97 DOWNTO 0); sel : STD_LOGIC_VECTOR(13
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(97 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 6 DOWNTO 0) and tmp;
    FOR i in 1 TO 13 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*7-1 DOWNTO i*7) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_13_2(inputs : STD_LOGIC_VECTOR(12 DOWNTO 0); sel : STD_LOGIC_VECTOR(12
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(12 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 12 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_5_15_2(inputs : STD_LOGIC_VECTOR(74 DOWNTO 0); sel : STD_LOGIC_VECTOR(14
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(74 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(4 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 4 DOWNTO 0) and tmp;
    FOR i in 1 TO 14 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*5-1 DOWNTO i*5) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_11_2(inputs : STD_LOGIC_VECTOR(10 DOWNTO 0); sel : STD_LOGIC_VECTOR(10
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(10 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 10 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_8_19_2(inputs : STD_LOGIC_VECTOR(151 DOWNTO 0); sel : STD_LOGIC_VECTOR(18
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(151 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 7 DOWNTO 0) and tmp;
    FOR i in 1 TO 18 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*8-1 DOWNTO i*8) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_18_2(inputs : STD_LOGIC_VECTOR(17 DOWNTO 0); sel : STD_LOGIC_VECTOR(17
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(17 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 17 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_19_2(inputs : STD_LOGIC_VECTOR(18 DOWNTO 0); sel : STD_LOGIC_VECTOR(18
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(18 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 18 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_5_22_2(inputs : STD_LOGIC_VECTOR(109 DOWNTO 0); sel : STD_LOGIC_VECTOR(21
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(109 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(4 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 4 DOWNTO 0) and tmp;
    FOR i in 1 TO 21 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*5-1 DOWNTO i*5) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_16_2(inputs : STD_LOGIC_VECTOR(15 DOWNTO 0); sel : STD_LOGIC_VECTOR(15
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(15 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 15 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
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

FUNCTION MUX1HOT_v_9_8_2(inputs : STD_LOGIC_VECTOR(71 DOWNTO 0); sel : STD_LOGIC_VECTOR(7
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(71 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(8 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(8 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 8 DOWNTO 0) and tmp;
    FOR i in 1 TO 7 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*9-1 DOWNTO i*9) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_8_2(inputs : STD_LOGIC_VECTOR(7 DOWNTO 0); sel : STD_LOGIC_VECTOR(7
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 7 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_5_11_2(inputs : STD_LOGIC_VECTOR(54 DOWNTO 0); sel : STD_LOGIC_VECTOR(10
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(54 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(4 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 4 DOWNTO 0) and tmp;
    FOR i in 1 TO 10 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*5-1 DOWNTO i*5) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_7_2(inputs : STD_LOGIC_VECTOR(6 DOWNTO 0); sel : STD_LOGIC_VECTOR(6
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 6 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
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

FUNCTION MUX1HOT_v_9_11_2(inputs : STD_LOGIC_VECTOR(98 DOWNTO 0); sel : STD_LOGIC_VECTOR(10
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(98 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(8 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(8 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 8 DOWNTO 0) and tmp;
    FOR i in 1 TO 10 LOOP 
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

FUNCTION MUX_v_4_2_2(inputs : STD_LOGIC_VECTOR(7 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(3 DOWNTO 0);
      WHEN '0' =>
        result := inputs(7 DOWNTO 4);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*4-1 DOWNTO i*4);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*4-1 DOWNTO i*4));
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

FUNCTION MUX_v_2_2_2(inputs : STD_LOGIC_VECTOR(3 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(3 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(1 DOWNTO 0);
      WHEN '0' =>
        result := inputs(3 DOWNTO 2);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*2-1 DOWNTO i*2);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*2-1 DOWNTO i*2));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
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

FUNCTION MUX_v_6_2_2(inputs : STD_LOGIC_VECTOR(11 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(11 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(5 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(5 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(5 DOWNTO 0);
      WHEN '0' =>
        result := inputs(11 DOWNTO 6);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*6-1 DOWNTO i*6);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*6-1 DOWNTO i*6));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_5_2_2(inputs : STD_LOGIC_VECTOR(9 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(9 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(4 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(4 DOWNTO 0);
      WHEN '0' =>
        result := inputs(9 DOWNTO 5);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*5-1 DOWNTO i*5);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*5-1 DOWNTO i*5));
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

FUNCTION MUX_v_31_2_2(inputs : STD_LOGIC_VECTOR(61 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(61 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(30 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(30 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(30 DOWNTO 0);
      WHEN '0' =>
        result := inputs(61 DOWNTO 31);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*31-1 DOWNTO i*31);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*31-1 DOWNTO i*31));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_v_30_3_2(inputs : STD_LOGIC_VECTOR(89 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(89 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(29 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(29 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 29 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*30-1 DOWNTO i*30) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX_v_28_2_2(inputs : STD_LOGIC_VECTOR(55 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(55 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(27 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(27 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(27 DOWNTO 0);
      WHEN '0' =>
        result := inputs(55 DOWNTO 28);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*28-1 DOWNTO i*28);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*28-1 DOWNTO i*28));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
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

FUNCTION MUX1HOT_v_32_13_2(inputs : STD_LOGIC_VECTOR(415 DOWNTO 0); sel : STD_LOGIC_VECTOR(12
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(415 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 31 DOWNTO 0) and tmp;
    FOR i in 1 TO 12 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*32-1 DOWNTO i*32) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_8_11_2(inputs : STD_LOGIC_VECTOR(87 DOWNTO 0); sel : STD_LOGIC_VECTOR(10
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(87 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 7 DOWNTO 0) and tmp;
    FOR i in 1 TO 10 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*8-1 DOWNTO i*8) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_8_9_2(inputs : STD_LOGIC_VECTOR(71 DOWNTO 0); sel : STD_LOGIC_VECTOR(8
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(71 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 7 DOWNTO 0) and tmp;
    FOR i in 1 TO 8 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*8-1 DOWNTO i*8) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_2_7_2(inputs : STD_LOGIC_VECTOR(13 DOWNTO 0); sel : STD_LOGIC_VECTOR(6
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(13 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 1 DOWNTO 0) and tmp;
    FOR i in 1 TO 6 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*2-1 DOWNTO i*2) and tmp);
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

FUNCTION MUX1HOT_v_32_7_2(inputs : STD_LOGIC_VECTOR(223 DOWNTO 0); sel : STD_LOGIC_VECTOR(6
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(223 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 31 DOWNTO 0) and tmp;
    FOR i in 1 TO 6 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*32-1 DOWNTO i*32) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_7_8_2(inputs : STD_LOGIC_VECTOR(55 DOWNTO 0); sel : STD_LOGIC_VECTOR(7
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(55 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 6 DOWNTO 0) and tmp;
    FOR i in 1 TO 7 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*7-1 DOWNTO i*7) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_8_5_2(inputs : STD_LOGIC_VECTOR(39 DOWNTO 0); sel : STD_LOGIC_VECTOR(4
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(39 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 7 DOWNTO 0) and tmp;
    FOR i in 1 TO 4 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*8-1 DOWNTO i*8) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_7_6_2(inputs : STD_LOGIC_VECTOR(41 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(41 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 6 DOWNTO 0) and tmp;
    FOR i in 1 TO 5 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*7-1 DOWNTO i*7) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_4_4_2(inputs : STD_LOGIC_VECTOR(15 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(15 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 3 DOWNTO 0) and tmp;
    FOR i in 1 TO 3 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*4-1 DOWNTO i*4) and tmp);
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

FUNCTION MUX1HOT_v_32_6_2(inputs : STD_LOGIC_VECTOR(191 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(191 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 31 DOWNTO 0) and tmp;
    FOR i in 1 TO 5 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*32-1 DOWNTO i*32) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_29_6_2(inputs : STD_LOGIC_VECTOR(173 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(173 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(28 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(28 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 28 DOWNTO 0) and tmp;
    FOR i in 1 TO 5 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*29-1 DOWNTO i*29) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_s_1_6_2(inputs : STD_LOGIC_VECTOR(5 DOWNTO 0); sel : STD_LOGIC_VECTOR(5
    DOWNTO 0))
RETURN STD_LOGIC IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(5 DOWNTO 0);
  VARIABLE result : STD_LOGIC;
  VARIABLE tmp : STD_LOGIC;
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := sel(0);
    result := inputs(0) and tmp;
    FOR i in 1 TO 5 LOOP 
      tmp := sel(i);
      result := result or ( inputs(i) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX1HOT_v_2_3_2(inputs : STD_LOGIC_VECTOR(5 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(5 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 1 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*2-1 DOWNTO i*2) and tmp);
    END LOOP;
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

END Main_Comp_Decomp_Tot_Main_Fonction_mux_pkg;



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
--  Generated date: Wed Feb  1 17:50:26 2017
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    Main_Comp_Decomp_Tot_Main_Fonction_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps.ALL;
USE work.singleport_ram_be_pkg.ALL;
USE work.Main_Comp_Decomp_Tot_Main_Fonction_mux_pkg.ALL;


ENTITY Main_Comp_Decomp_Tot_Main_Fonction_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (137 DOWNTO 0);
    st_cmodel_cumulative_frequency_vinit_1_tr0 : IN STD_LOGIC;
    st_copy_y_2_tr0 : IN STD_LOGIC;
    st_cmodel_cumulative_frequency_vinit_2_tr0 : IN STD_LOGIC;
    st_main_2_tr0 : IN STD_LOGIC;
    st_levels_tr0 : IN STD_LOGIC;
    st_passe_x_tr0 : IN STD_LOGIC;
    st_passe_y_8_tr0 : IN STD_LOGIC;
    st_passe_x_1_tr0 : IN STD_LOGIC;
    st_levels_1_tr0 : IN STD_LOGIC;
    st_passe_x_1_tr0_1 : IN STD_LOGIC;
    st_passe_y_1_8_tr0 : IN STD_LOGIC;
    st_passe_x_1_1_tr0 : IN STD_LOGIC;
    st_levels_2_tr0 : IN STD_LOGIC;
    st_copy_x_1_tr0 : IN STD_LOGIC;
    st_copy_y_1_2_tr0 : IN STD_LOGIC;
    st_copy_x_1_1_tr0 : IN STD_LOGIC;
    st_comp_compress_for_3_tr0 : IN STD_LOGIC;
    st_ModelA_update_for_2_tr0 : IN STD_LOGIC;
    st_comp_compress_for_for_tr0 : IN STD_LOGIC;
    st_comp_compress_for_for_tr1 : IN STD_LOGIC;
    st_comp_compress_for_for_1_tr0 : IN STD_LOGIC;
    st_comp_compress_for_for_1_tr1 : IN STD_LOGIC;
    st_comp_put_bit_plus_pending_for_1_tr0 : IN STD_LOGIC;
    st_comp_put_bit_plus_pending_1_for_1_tr0 : IN STD_LOGIC;
    st_main_4_tr0 : IN STD_LOGIC;
    st_main_4_tr1 : IN STD_LOGIC;
    st_comp_put_bit_plus_pending_2_for_1_tr0 : IN STD_LOGIC;
    st_comp_put_bit_plus_pending_3_for_1_tr0 : IN STD_LOGIC;
    st_copy_y_2_2_tr0 : IN STD_LOGIC;
    st_copy_x_2_1_tr0 : IN STD_LOGIC;
    st_copy_x_2_1_tr1 : IN STD_LOGIC;
    st_dec_decompress_for_1_tr0 : IN STD_LOGIC;
    st_ModelA_getChar_for_3_tr0 : IN STD_LOGIC;
    st_ModelA_update_1_for_2_tr0 : IN STD_LOGIC;
    st_ModelA_getChar_for_5_tr0 : IN STD_LOGIC;
    st_dec_decompress_for_1_7_tr0 : IN STD_LOGIC;
    st_dec_decompress_for_1_for_tr0 : IN STD_LOGIC;
    st_copy_y_3_2_tr0 : IN STD_LOGIC;
    st_copy_x_3_tr0 : IN STD_LOGIC;
    st_copy_x_3_tr1 : IN STD_LOGIC;
    st_main_5_tr0 : IN STD_LOGIC;
    st_hsplit_x_tr0 : IN STD_LOGIC;
    st_hsplit_y_tr0 : IN STD_LOGIC;
    st_inv_wave_Mn_Inv_Wave_Fct_for_1_1_tr0 : IN STD_LOGIC;
    st_hsplit_x_1_tr0 : IN STD_LOGIC;
    st_hsplit_y_1_tr0 : IN STD_LOGIC;
    st_inv_wave_Mn_Inv_Wave_Fct_for_1_2_tr0 : IN STD_LOGIC;
    st_copy_x_4_tr0 : IN STD_LOGIC;
    st_copy_y_4_2_tr0 : IN STD_LOGIC;
    st_copy_x_4_1_tr0 : IN STD_LOGIC
  );
END Main_Comp_Decomp_Tot_Main_Fonction_core_fsm;

ARCHITECTURE v1 OF Main_Comp_Decomp_Tot_Main_Fonction_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_1
  TYPE Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_1_ST IS (st_main, st_main_1, st_cmodel_cumulative_frequency_vinit,
      st_cmodel_cumulative_frequency_vinit_1, st_copy_y, st_copy_y_1, st_copy_y_2,
      st_cmodel_cumulative_frequency_vinit_2, st_main_2, st_levels, st_passe_x, st_passe_y,
      st_passe_y_1, st_passe_y_2, st_passe_y_3, st_passe_y_4, st_passe_y_5, st_passe_y_6,
      st_passe_y_7, st_passe_y_8, st_passe_x_1, st_levels_1, st_passe_x_1_1, st_passe_y_1_1,
      st_passe_y_1_1_1, st_passe_y_1_2, st_passe_y_1_3, st_passe_y_1_4, st_passe_y_1_5,
      st_passe_y_1_6, st_passe_y_1_7, st_passe_y_1_8, st_passe_x_1_1_1, st_levels_2,
      st_copy_x_1, st_copy_y_1_1, st_copy_y_1_1_1, st_copy_y_1_2, st_copy_x_1_1,
      st_levels_3, st_comp_compress_for, st_comp_compress_for_1, st_comp_compress_for_2,
      st_comp_compress_for_3, st_ModelA_update_for, st_ModelA_update_for_1, st_ModelA_update_for_2,
      st_comp_compress_for_4, st_comp_compress_for_5, st_comp_compress_for_6, st_comp_compress_for_7,
      st_comp_compress_for_8, st_comp_compress_for_9, st_comp_compress_for_10, st_comp_compress_for_for,
      st_comp_compress_for_for_1, st_comp_put_bit_plus_pending_for, st_comp_put_bit_plus_pending_for_1,
      st_comp_put_bit_plus_pending_1_for, st_comp_put_bit_plus_pending_1_for_1, st_comp_compress_for_for_2,
      st_main_3, st_main_4, st_comp_put_bit_plus_pending_2_for, st_comp_put_bit_plus_pending_2_for_1,
      st_comp_put_bit_plus_pending_3_for, st_comp_put_bit_plus_pending_3_for_1, st_copy_y_2_1,
      st_copy_y_2_1_1, st_copy_y_2_2, st_copy_x_2, st_copy_x_2_1, st_dec_decompress_for,
      st_dec_decompress_for_1, st_dec_decompress_for_1_1, st_dec_decompress_for_1_1_1,
      st_dec_decompress_for_1_2, st_dec_decompress_for_1_3, st_dec_decompress_for_1_4,
      st_dec_decompress_for_1_5, st_dec_decompress_for_1_6, st_ModelA_getChar_for,
      st_ModelA_getChar_for_1, st_ModelA_getChar_for_2, st_ModelA_getChar_for_3,
      st_ModelA_update_1_for, st_ModelA_update_1_for_1, st_ModelA_update_1_for_2,
      st_ModelA_getChar_for_4, st_ModelA_getChar_for_5, st_dec_decompress_for_1_7,
      st_dec_decompress_for_1_8, st_dec_decompress_for_1_9, st_dec_decompress_for_1_10,
      st_dec_decompress_for_1_11, st_dec_decompress_for_1_12, st_dec_decompress_for_1_13,
      st_dec_decompress_for_1_for, st_dec_decompress_for_1_for_1, st_dec_decompress_for_1_14,
      st_copy_y_3, st_copy_y_3_1, st_copy_y_3_2, st_copy_x_3, st_main_5, st_inv_wave_Mn_Inv_Wave_Fct_for_1,
      st_hsplit_x, st_hsplit_y, st_hsplit_y_1, st_hsplit_y_2, st_hsplit_y_3, st_hsplit_y_4,
      st_hsplit_y_5, st_hsplit_y_6, st_hsplit_y_7, st_hsplit_y_8, st_hsplit_x_1,
      st_inv_wave_Mn_Inv_Wave_Fct_for_1_1, st_hsplit_x_1_1, st_hsplit_y_1_1, st_hsplit_y_1_1_1,
      st_hsplit_y_1_2, st_hsplit_y_1_3, st_hsplit_y_1_4, st_hsplit_y_1_5, st_hsplit_y_1_6,
      st_hsplit_y_1_7, st_hsplit_y_1_8, st_hsplit_x_1_1_1, st_inv_wave_Mn_Inv_Wave_Fct_for_1_2,
      st_copy_x_4, st_copy_y_4, st_copy_y_4_1, st_copy_y_4_2, st_copy_x_4_1, st_inv_wave_Mn_Inv_Wave_Fct_for_1_3,
      st_main_6, st_main_7);

  SIGNAL state_var : Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_1_ST;
  SIGNAL state_var_NS : Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_1_ST;

BEGIN
  -- Default Constant Signal Assignments

  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_1 : PROCESS (st_cmodel_cumulative_frequency_vinit_1_tr0,
      st_copy_y_2_tr0, st_cmodel_cumulative_frequency_vinit_2_tr0, st_main_2_tr0,
      st_levels_tr0, st_passe_x_tr0, st_passe_y_8_tr0, st_passe_x_1_tr0, st_levels_1_tr0,
      st_passe_x_1_tr0_1, st_passe_y_1_8_tr0, st_passe_x_1_1_tr0, st_levels_2_tr0,
      st_copy_x_1_tr0, st_copy_y_1_2_tr0, st_copy_x_1_1_tr0, st_comp_compress_for_3_tr0,
      st_ModelA_update_for_2_tr0, st_comp_compress_for_for_tr0, st_comp_compress_for_for_tr1,
      st_comp_compress_for_for_1_tr0, st_comp_compress_for_for_1_tr1, st_comp_put_bit_plus_pending_for_1_tr0,
      st_comp_put_bit_plus_pending_1_for_1_tr0, st_main_4_tr0, st_main_4_tr1, st_comp_put_bit_plus_pending_2_for_1_tr0,
      st_comp_put_bit_plus_pending_3_for_1_tr0, st_copy_y_2_2_tr0, st_copy_x_2_1_tr0,
      st_copy_x_2_1_tr1, st_dec_decompress_for_1_tr0, st_ModelA_getChar_for_3_tr0,
      st_ModelA_update_1_for_2_tr0, st_ModelA_getChar_for_5_tr0, st_dec_decompress_for_1_7_tr0,
      st_dec_decompress_for_1_for_tr0, st_copy_y_3_2_tr0, st_copy_x_3_tr0, st_copy_x_3_tr1,
      st_main_5_tr0, st_hsplit_x_tr0, st_hsplit_y_tr0, st_inv_wave_Mn_Inv_Wave_Fct_for_1_1_tr0,
      st_hsplit_x_1_tr0, st_hsplit_y_1_tr0, st_inv_wave_Mn_Inv_Wave_Fct_for_1_2_tr0,
      st_copy_x_4_tr0, st_copy_y_4_2_tr0, st_copy_x_4_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN st_main =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001");
        state_var_NS <= st_main_1;
      WHEN st_main_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010");
        state_var_NS <= st_cmodel_cumulative_frequency_vinit;
      WHEN st_cmodel_cumulative_frequency_vinit =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100");
        state_var_NS <= st_cmodel_cumulative_frequency_vinit_1;
      WHEN st_cmodel_cumulative_frequency_vinit_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000");
        IF ( st_cmodel_cumulative_frequency_vinit_1_tr0 = '1' ) THEN
          state_var_NS <= st_cmodel_cumulative_frequency_vinit_2;
        ELSE
          state_var_NS <= st_copy_y;
        END IF;
      WHEN st_copy_y =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000");
        state_var_NS <= st_copy_y_1;
      WHEN st_copy_y_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000");
        state_var_NS <= st_copy_y_2;
      WHEN st_copy_y_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000");
        IF ( st_copy_y_2_tr0 = '1' ) THEN
          state_var_NS <= st_cmodel_cumulative_frequency_vinit_2;
        ELSE
          state_var_NS <= st_copy_y;
        END IF;
      WHEN st_cmodel_cumulative_frequency_vinit_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000");
        IF ( st_cmodel_cumulative_frequency_vinit_2_tr0 = '1' ) THEN
          state_var_NS <= st_main_2;
        ELSE
          state_var_NS <= st_cmodel_cumulative_frequency_vinit;
        END IF;
      WHEN st_main_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000");
        IF ( st_main_2_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for;
        ELSE
          state_var_NS <= st_levels;
        END IF;
      WHEN st_levels =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000");
        IF ( st_levels_tr0 = '1' ) THEN
          state_var_NS <= st_levels_1;
        ELSE
          state_var_NS <= st_passe_x;
        END IF;
      WHEN st_passe_x =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000");
        IF ( st_passe_x_tr0 = '1' ) THEN
          state_var_NS <= st_passe_x_1;
        ELSE
          state_var_NS <= st_passe_y;
        END IF;
      WHEN st_passe_y =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000");
        state_var_NS <= st_passe_y_1;
      WHEN st_passe_y_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000");
        state_var_NS <= st_passe_y_2;
      WHEN st_passe_y_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000");
        state_var_NS <= st_passe_y_3;
      WHEN st_passe_y_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000");
        state_var_NS <= st_passe_y_4;
      WHEN st_passe_y_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000");
        state_var_NS <= st_passe_y_5;
      WHEN st_passe_y_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000");
        state_var_NS <= st_passe_y_6;
      WHEN st_passe_y_6 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000");
        state_var_NS <= st_passe_y_7;
      WHEN st_passe_y_7 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000");
        state_var_NS <= st_passe_y_8;
      WHEN st_passe_y_8 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000");
        IF ( st_passe_y_8_tr0 = '1' ) THEN
          state_var_NS <= st_passe_x_1;
        ELSE
          state_var_NS <= st_passe_y;
        END IF;
      WHEN st_passe_x_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000");
        IF ( st_passe_x_1_tr0 = '1' ) THEN
          state_var_NS <= st_levels_1;
        ELSE
          state_var_NS <= st_passe_x;
        END IF;
      WHEN st_levels_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000");
        IF ( st_levels_1_tr0 = '1' ) THEN
          state_var_NS <= st_levels_2;
        ELSE
          state_var_NS <= st_passe_x_1_1;
        END IF;
      WHEN st_passe_x_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000");
        IF ( st_passe_x_1_tr0_1 = '1' ) THEN
          state_var_NS <= st_passe_x_1_1_1;
        ELSE
          state_var_NS <= st_passe_y_1_1;
        END IF;
      WHEN st_passe_y_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000");
        state_var_NS <= st_passe_y_1_1_1;
      WHEN st_passe_y_1_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000");
        state_var_NS <= st_passe_y_1_2;
      WHEN st_passe_y_1_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000");
        state_var_NS <= st_passe_y_1_3;
      WHEN st_passe_y_1_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000");
        state_var_NS <= st_passe_y_1_4;
      WHEN st_passe_y_1_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000");
        state_var_NS <= st_passe_y_1_5;
      WHEN st_passe_y_1_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000");
        state_var_NS <= st_passe_y_1_6;
      WHEN st_passe_y_1_6 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000");
        state_var_NS <= st_passe_y_1_7;
      WHEN st_passe_y_1_7 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000");
        state_var_NS <= st_passe_y_1_8;
      WHEN st_passe_y_1_8 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000");
        IF ( st_passe_y_1_8_tr0 = '1' ) THEN
          state_var_NS <= st_passe_x_1_1_1;
        ELSE
          state_var_NS <= st_passe_y_1_1;
        END IF;
      WHEN st_passe_x_1_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000");
        IF ( st_passe_x_1_1_tr0 = '1' ) THEN
          state_var_NS <= st_levels_2;
        ELSE
          state_var_NS <= st_passe_x_1_1;
        END IF;
      WHEN st_levels_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000");
        IF ( st_levels_2_tr0 = '1' ) THEN
          state_var_NS <= st_levels_3;
        ELSE
          state_var_NS <= st_copy_x_1;
        END IF;
      WHEN st_copy_x_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000");
        IF ( st_copy_x_1_tr0 = '1' ) THEN
          state_var_NS <= st_copy_x_1_1;
        ELSE
          state_var_NS <= st_copy_y_1_1;
        END IF;
      WHEN st_copy_y_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000");
        state_var_NS <= st_copy_y_1_1_1;
      WHEN st_copy_y_1_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000");
        state_var_NS <= st_copy_y_1_2;
      WHEN st_copy_y_1_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000");
        IF ( st_copy_y_1_2_tr0 = '1' ) THEN
          state_var_NS <= st_copy_x_1_1;
        ELSE
          state_var_NS <= st_copy_y_1_1;
        END IF;
      WHEN st_copy_x_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000");
        IF ( st_copy_x_1_1_tr0 = '1' ) THEN
          state_var_NS <= st_levels_3;
        ELSE
          state_var_NS <= st_copy_x_1;
        END IF;
      WHEN st_levels_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000");
        IF ( st_main_2_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for;
        ELSE
          state_var_NS <= st_levels;
        END IF;
      WHEN st_comp_compress_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000");
        state_var_NS <= st_comp_compress_for_1;
      WHEN st_comp_compress_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000");
        state_var_NS <= st_comp_compress_for_2;
      WHEN st_comp_compress_for_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_compress_for_3;
      WHEN st_comp_compress_for_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000");
        IF ( st_comp_compress_for_3_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_4;
        ELSE
          state_var_NS <= st_ModelA_update_for;
        END IF;
      WHEN st_ModelA_update_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_update_for_1;
      WHEN st_ModelA_update_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_update_for_2;
      WHEN st_ModelA_update_for_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000");
        IF ( st_ModelA_update_for_2_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_4;
        ELSE
          state_var_NS <= st_ModelA_update_for;
        END IF;
      WHEN st_comp_compress_for_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_compress_for_5;
      WHEN st_comp_compress_for_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_compress_for_6;
      WHEN st_comp_compress_for_6 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_compress_for_7;
      WHEN st_comp_compress_for_7 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_compress_for_8;
      WHEN st_comp_compress_for_8 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_compress_for_9;
      WHEN st_comp_compress_for_9 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_compress_for_10;
      WHEN st_comp_compress_for_10 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_compress_for_for;
      WHEN st_comp_compress_for_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000");
        IF ( st_comp_compress_for_for_tr0 = '1' ) THEN
          state_var_NS <= st_main_3;
        ELSIF ( st_comp_compress_for_for_tr1 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_for_1;
        ELSE
          state_var_NS <= st_comp_compress_for;
        END IF;
      WHEN st_comp_compress_for_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000");
        IF ( st_comp_compress_for_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_for_2;
        ELSIF ( st_comp_compress_for_for_1_tr1 = '1' ) THEN
          state_var_NS <= st_comp_put_bit_plus_pending_for;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_1_for;
        END IF;
      WHEN st_comp_put_bit_plus_pending_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_put_bit_plus_pending_for_1;
      WHEN st_comp_put_bit_plus_pending_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000");
        IF ( st_comp_put_bit_plus_pending_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_for_2;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_for;
        END IF;
      WHEN st_comp_put_bit_plus_pending_1_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_put_bit_plus_pending_1_for_1;
      WHEN st_comp_put_bit_plus_pending_1_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000");
        IF ( st_comp_put_bit_plus_pending_1_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_comp_compress_for_for_2;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_1_for;
        END IF;
      WHEN st_comp_compress_for_for_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_compress_for_for;
      WHEN st_main_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_main_4;
      WHEN st_main_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000");
        IF ( st_main_4_tr0 = '1' ) THEN
          state_var_NS <= st_copy_y_2_1;
        ELSIF ( st_main_4_tr1 = '1' ) THEN
          state_var_NS <= st_comp_put_bit_plus_pending_2_for;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_3_for;
        END IF;
      WHEN st_comp_put_bit_plus_pending_2_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_put_bit_plus_pending_2_for_1;
      WHEN st_comp_put_bit_plus_pending_2_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_comp_put_bit_plus_pending_2_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_copy_y_2_1;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_2_for;
        END IF;
      WHEN st_comp_put_bit_plus_pending_3_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_comp_put_bit_plus_pending_3_for_1;
      WHEN st_comp_put_bit_plus_pending_3_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_comp_put_bit_plus_pending_3_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_copy_y_2_1;
        ELSE
          state_var_NS <= st_comp_put_bit_plus_pending_3_for;
        END IF;
      WHEN st_copy_y_2_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_copy_y_2_1_1;
      WHEN st_copy_y_2_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_copy_y_2_2;
      WHEN st_copy_y_2_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_copy_y_2_2_tr0 = '1' ) THEN
          state_var_NS <= st_copy_x_2;
        ELSE
          state_var_NS <= st_copy_y_2_1;
        END IF;
      WHEN st_copy_x_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_copy_x_2_1;
      WHEN st_copy_x_2_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_copy_x_2_1_tr0 = '1' ) THEN
          state_var_NS <= st_dec_decompress_for;
        ELSIF ( st_copy_x_2_1_tr1 = '1' ) THEN
          state_var_NS <= st_copy_x_2;
        ELSE
          state_var_NS <= st_copy_y_2_1;
        END IF;
      WHEN st_dec_decompress_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1;
      WHEN st_dec_decompress_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_dec_decompress_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_dec_decompress_for_1_1;
        ELSE
          state_var_NS <= st_dec_decompress_for;
        END IF;
      WHEN st_dec_decompress_for_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_1_1;
      WHEN st_dec_decompress_for_1_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_2;
      WHEN st_dec_decompress_for_1_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_3;
      WHEN st_dec_decompress_for_1_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_4;
      WHEN st_dec_decompress_for_1_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_5;
      WHEN st_dec_decompress_for_1_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_6;
      WHEN st_dec_decompress_for_1_6 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_getChar_for;
      WHEN st_ModelA_getChar_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_getChar_for_1;
      WHEN st_ModelA_getChar_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_getChar_for_2;
      WHEN st_ModelA_getChar_for_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_getChar_for_3;
      WHEN st_ModelA_getChar_for_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_ModelA_getChar_for_3_tr0 = '1' ) THEN
          state_var_NS <= st_ModelA_getChar_for_4;
        ELSE
          state_var_NS <= st_ModelA_update_1_for;
        END IF;
      WHEN st_ModelA_update_1_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_update_1_for_1;
      WHEN st_ModelA_update_1_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_update_1_for_2;
      WHEN st_ModelA_update_1_for_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_ModelA_update_1_for_2_tr0 = '1' ) THEN
          state_var_NS <= st_ModelA_getChar_for_4;
        ELSE
          state_var_NS <= st_ModelA_update_1_for;
        END IF;
      WHEN st_ModelA_getChar_for_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_ModelA_getChar_for_5;
      WHEN st_ModelA_getChar_for_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_ModelA_getChar_for_5_tr0 = '1' ) THEN
          state_var_NS <= st_dec_decompress_for_1_7;
        ELSE
          state_var_NS <= st_ModelA_getChar_for;
        END IF;
      WHEN st_dec_decompress_for_1_7 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_dec_decompress_for_1_7_tr0 = '1' ) THEN
          state_var_NS <= st_copy_y_3;
        ELSE
          state_var_NS <= st_dec_decompress_for_1_8;
        END IF;
      WHEN st_dec_decompress_for_1_8 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_9;
      WHEN st_dec_decompress_for_1_9 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_10;
      WHEN st_dec_decompress_for_1_10 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_11;
      WHEN st_dec_decompress_for_1_11 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_12;
      WHEN st_dec_decompress_for_1_12 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_13;
      WHEN st_dec_decompress_for_1_13 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_for;
      WHEN st_dec_decompress_for_1_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_dec_decompress_for_1_for_tr0 = '1' ) THEN
          state_var_NS <= st_dec_decompress_for_1_14;
        ELSE
          state_var_NS <= st_dec_decompress_for_1_for_1;
        END IF;
      WHEN st_dec_decompress_for_1_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_for;
      WHEN st_dec_decompress_for_1_14 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_dec_decompress_for_1_1;
      WHEN st_copy_y_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_copy_y_3_1;
      WHEN st_copy_y_3_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_copy_y_3_2;
      WHEN st_copy_y_3_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_copy_y_3_2_tr0 = '1' ) THEN
          state_var_NS <= st_copy_x_3;
        ELSE
          state_var_NS <= st_copy_y_3;
        END IF;
      WHEN st_copy_x_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_copy_x_3_tr0 = '1' ) THEN
          state_var_NS <= st_main_5;
        ELSIF ( st_copy_x_3_tr1 = '1' ) THEN
          state_var_NS <= st_copy_x_3;
        ELSE
          state_var_NS <= st_copy_y_3;
        END IF;
      WHEN st_main_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_main_5_tr0 = '1' ) THEN
          state_var_NS <= st_main_6;
        ELSE
          state_var_NS <= st_inv_wave_Mn_Inv_Wave_Fct_for_1;
        END IF;
      WHEN st_inv_wave_Mn_Inv_Wave_Fct_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_x;
      WHEN st_hsplit_x =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_hsplit_x_tr0 = '1' ) THEN
          state_var_NS <= st_inv_wave_Mn_Inv_Wave_Fct_for_1_1;
        ELSE
          state_var_NS <= st_hsplit_y;
        END IF;
      WHEN st_hsplit_y =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_hsplit_y_tr0 = '1' ) THEN
          state_var_NS <= st_hsplit_x_1;
        ELSE
          state_var_NS <= st_hsplit_y_1;
        END IF;
      WHEN st_hsplit_y_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_2;
      WHEN st_hsplit_y_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_3;
      WHEN st_hsplit_y_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_4;
      WHEN st_hsplit_y_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_5;
      WHEN st_hsplit_y_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_6;
      WHEN st_hsplit_y_6 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_7;
      WHEN st_hsplit_y_7 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_8;
      WHEN st_hsplit_y_8 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y;
      WHEN st_hsplit_x_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_x;
      WHEN st_inv_wave_Mn_Inv_Wave_Fct_for_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_inv_wave_Mn_Inv_Wave_Fct_for_1_1_tr0 = '1' ) THEN
          state_var_NS <= st_inv_wave_Mn_Inv_Wave_Fct_for_1_2;
        ELSE
          state_var_NS <= st_hsplit_x_1_1;
        END IF;
      WHEN st_hsplit_x_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_hsplit_x_1_tr0 = '1' ) THEN
          state_var_NS <= st_inv_wave_Mn_Inv_Wave_Fct_for_1_2;
        ELSE
          state_var_NS <= st_hsplit_y_1_1;
        END IF;
      WHEN st_hsplit_y_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_hsplit_y_1_tr0 = '1' ) THEN
          state_var_NS <= st_hsplit_x_1_1_1;
        ELSE
          state_var_NS <= st_hsplit_y_1_1_1;
        END IF;
      WHEN st_hsplit_y_1_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_1_2;
      WHEN st_hsplit_y_1_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_1_3;
      WHEN st_hsplit_y_1_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_1_4;
      WHEN st_hsplit_y_1_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_1_5;
      WHEN st_hsplit_y_1_5 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_1_6;
      WHEN st_hsplit_y_1_6 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_1_7;
      WHEN st_hsplit_y_1_7 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_1_8;
      WHEN st_hsplit_y_1_8 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_y_1_1;
      WHEN st_hsplit_x_1_1_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_hsplit_x_1_1;
      WHEN st_inv_wave_Mn_Inv_Wave_Fct_for_1_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_inv_wave_Mn_Inv_Wave_Fct_for_1_2_tr0 = '1' ) THEN
          state_var_NS <= st_inv_wave_Mn_Inv_Wave_Fct_for_1_3;
        ELSE
          state_var_NS <= st_copy_x_4;
        END IF;
      WHEN st_copy_x_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_copy_x_4_tr0 = '1' ) THEN
          state_var_NS <= st_copy_x_4_1;
        ELSE
          state_var_NS <= st_copy_y_4;
        END IF;
      WHEN st_copy_y_4 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_copy_y_4_1;
      WHEN st_copy_y_4_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_copy_y_4_2;
      WHEN st_copy_y_4_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_copy_y_4_2_tr0 = '1' ) THEN
          state_var_NS <= st_copy_x_4_1;
        ELSE
          state_var_NS <= st_copy_y_4;
        END IF;
      WHEN st_copy_x_4_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_copy_x_4_1_tr0 = '1' ) THEN
          state_var_NS <= st_inv_wave_Mn_Inv_Wave_Fct_for_1_3;
        ELSE
          state_var_NS <= st_copy_x_4;
        END IF;
      WHEN st_inv_wave_Mn_Inv_Wave_Fct_for_1_3 =>
        fsm_output <= STD_LOGIC_VECTOR'("001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        IF ( st_main_5_tr0 = '1' ) THEN
          state_var_NS <= st_main_6;
        ELSE
          state_var_NS <= st_inv_wave_Mn_Inv_Wave_Fct_for_1;
        END IF;
      WHEN st_main_6 =>
        fsm_output <= STD_LOGIC_VECTOR'("010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_main_7;
      WHEN st_main_7 =>
        fsm_output <= STD_LOGIC_VECTOR'("100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state_var_NS <= st_main;
      WHEN OTHERS =>
        fsm_output <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        state_var_NS <= st_main;
    END CASE;
  END PROCESS Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_1;

  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_1_REG : PROCESS (clk)
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
  END PROCESS Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_1_REG;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps.ALL;
USE work.singleport_ram_be_pkg.ALL;
USE work.Main_Comp_Decomp_Tot_Main_Fonction_mux_pkg.ALL;


ENTITY Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : OUT STD_LOGIC;
    Src_rsc_singleport_re_core_sct : OUT STD_LOGIC;
    Src_rsc_singleport_we_core_sct : OUT STD_LOGIC;
    Comp_rsc_singleport_re_core_sct : OUT STD_LOGIC;
    Comp_rsc_singleport_we_core_sct : OUT STD_LOGIC;
    Vga_rsc_singleport_re_core_sct : OUT STD_LOGIC;
    Vga_rsc_singleport_we_core_sct : OUT STD_LOGIC;
    mgc_start_sync_mgc_bsync_vld_vd : IN STD_LOGIC;
    mgc_done_sync_mgc_bsync_rdy_rd_core_sct : OUT STD_LOGIC;
    Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct : OUT
        STD_LOGIC;
    Vga_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    Comp_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    Src_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    nblevels_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
    Src_rsc_singleport_oswt : IN STD_LOGIC;
    Src_rsc_singleport_bcwt : OUT STD_LOGIC;
    Src_rsc_singleport_re_core_psct : IN STD_LOGIC;
    Src_rsc_singleport_we_core_psct : IN STD_LOGIC;
    Comp_rsc_singleport_oswt : IN STD_LOGIC;
    Comp_rsc_singleport_bcwt : OUT STD_LOGIC;
    Comp_rsc_singleport_re_core_psct : IN STD_LOGIC;
    Comp_rsc_singleport_we_core_psct : IN STD_LOGIC;
    Vga_rsc_singleport_oswt : IN STD_LOGIC;
    Vga_rsc_singleport_bcwt : OUT STD_LOGIC;
    Vga_rsc_singleport_re_core_psct : IN STD_LOGIC;
    Vga_rsc_singleport_we_core_psct : IN STD_LOGIC;
    mgc_start_sync_mgc_bsync_vld_oswt : IN STD_LOGIC;
    mgc_done_sync_mgc_bsync_rdy_rd_core_psct : IN STD_LOGIC;
    Vga_triosy_mgc_io_sync_ld_core_psct : IN STD_LOGIC;
    Src_rsc_singleport_oswt_pff : IN STD_LOGIC;
    Comp_rsc_singleport_oswt_pff : IN STD_LOGIC;
    Vga_rsc_singleport_oswt_pff : IN STD_LOGIC
  );
END Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl;

ARCHITECTURE v1 OF Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL core_wen_drv : STD_LOGIC;
  SIGNAL Src_rsc_singleport_bcwt_drv : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_bcwt_drv : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_bcwt_drv : STD_LOGIC;

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
  SIGNAL mgc_start_sync_mgc_bsync_vld_pdswt0 : STD_LOGIC;
  SIGNAL mgc_start_sync_mgc_bsync_vld_biwt : STD_LOGIC;
  SIGNAL mgc_start_sync_mgc_bsync_vld_icwt : STD_LOGIC;
  SIGNAL mgc_start_sync_mgc_bsync_vld_bcwt : STD_LOGIC;
  SIGNAL mgc_done_sync_mgc_bsync_rdy_ogwt : STD_LOGIC;
  SIGNAL mgc_done_sync_mgc_bsync_rdy_pdswt0 : STD_LOGIC;
  SIGNAL mgc_done_sync_mgc_bsync_rdy_icwt : STD_LOGIC;
  SIGNAL mgc_done_sync_mgc_bsync_rdy_bcwt : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ogwt : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_icwt : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_bcwt : STD_LOGIC;
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
  SIGNAL and_25_cse : STD_LOGIC;
  SIGNAL and_33_cse : STD_LOGIC;
  SIGNAL Src_rsc_singleport_tiswt0_pff : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_tiswt0_pff : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_tiswt0_pff : STD_LOGIC;

BEGIN
  -- Default Constant Signal Assignments

  -- Output Reader Assignments
  core_wen <= core_wen_drv;
  Src_rsc_singleport_bcwt <= Src_rsc_singleport_bcwt_drv;
  Comp_rsc_singleport_bcwt <= Comp_rsc_singleport_bcwt_drv;
  Vga_rsc_singleport_bcwt <= Vga_rsc_singleport_bcwt_drv;

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
  and_25_cse <= mgc_done_sync_mgc_bsync_rdy_rd_core_psct AND core_wen_drv;
  mgc_done_sync_mgc_bsync_rdy_rd_core_sct <= mgc_done_sync_mgc_bsync_rdy_rd_core_psct
      AND mgc_done_sync_mgc_bsync_rdy_ogwt;
  Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ogwt <= mgc_done_sync_mgc_bsync_rdy_pdswt0
      OR Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_icwt;
  Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct <= mgc_done_sync_mgc_bsync_rdy_rd_core_psct
      AND Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ogwt;
  Vga_triosy_mgc_io_sync_pdswt0 <= (NOT core_wten) AND Vga_triosy_mgc_io_sync_ld_core_psct;
  Vga_triosy_mgc_io_sync_ogwt <= Vga_triosy_mgc_io_sync_pdswt0 OR Vga_triosy_mgc_io_sync_icwt;
  and_33_cse <= Vga_triosy_mgc_io_sync_ld_core_psct AND core_wen_drv;
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
      AND ((NOT Vga_rsc_singleport_oswt) OR Vga_rsc_singleport_biwt OR Vga_rsc_singleport_bcwt_drv)
      AND ((NOT mgc_start_sync_mgc_bsync_vld_oswt) OR mgc_start_sync_mgc_bsync_vld_biwt
      OR mgc_start_sync_mgc_bsync_vld_bcwt) AND ((NOT mgc_done_sync_mgc_bsync_rdy_rd_core_psct)
      OR mgc_done_sync_mgc_bsync_rdy_ogwt OR mgc_done_sync_mgc_bsync_rdy_bcwt) AND
      ((NOT mgc_done_sync_mgc_bsync_rdy_rd_core_psct) OR Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ogwt
      OR Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_bcwt) AND ((NOT
      Vga_triosy_mgc_io_sync_ld_core_psct) OR Vga_triosy_mgc_io_sync_ogwt OR Vga_triosy_mgc_io_sync_bcwt)
      AND ((NOT Vga_triosy_mgc_io_sync_ld_core_psct) OR Comp_triosy_mgc_io_sync_ogwt
      OR Comp_triosy_mgc_io_sync_bcwt) AND ((NOT Vga_triosy_mgc_io_sync_ld_core_psct)
      OR Src_triosy_mgc_io_sync_ogwt OR Src_triosy_mgc_io_sync_bcwt) AND ((NOT Vga_triosy_mgc_io_sync_ld_core_psct)
      OR nblevels_triosy_mgc_io_sync_ogwt OR nblevels_triosy_mgc_io_sync_bcwt);
  Src_rsc_singleport_re_core_sct <= Src_rsc_singleport_re_core_psct AND Src_rsc_singleport_tiswt0_pff;
  Src_rsc_singleport_tiswt0_pff <= core_wen_drv AND Src_rsc_singleport_oswt_pff;
  Src_rsc_singleport_we_core_sct <= Src_rsc_singleport_we_core_psct AND Src_rsc_singleport_tiswt0_pff;
  Comp_rsc_singleport_re_core_sct <= Comp_rsc_singleport_re_core_psct AND Comp_rsc_singleport_tiswt0_pff;
  Comp_rsc_singleport_tiswt0_pff <= core_wen_drv AND Comp_rsc_singleport_oswt_pff;
  Comp_rsc_singleport_we_core_sct <= Comp_rsc_singleport_we_core_psct AND Comp_rsc_singleport_tiswt0_pff;
  Vga_rsc_singleport_re_core_sct <= Vga_rsc_singleport_re_core_psct AND Vga_rsc_singleport_tiswt0_pff;
  Vga_rsc_singleport_tiswt0_pff <= core_wen_drv AND Vga_rsc_singleport_oswt_pff;
  Vga_rsc_singleport_we_core_sct <= Vga_rsc_singleport_we_core_psct AND Vga_rsc_singleport_tiswt0_pff;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        Src_rsc_singleport_icwt <= '0';
        Src_rsc_singleport_bcwt_drv <= '0';
        Comp_rsc_singleport_icwt <= '0';
        Comp_rsc_singleport_bcwt_drv <= '0';
        Vga_rsc_singleport_icwt <= '0';
        Vga_rsc_singleport_bcwt_drv <= '0';
        mgc_start_sync_mgc_bsync_vld_icwt <= '0';
        mgc_start_sync_mgc_bsync_vld_bcwt <= '0';
        mgc_done_sync_mgc_bsync_rdy_icwt <= '0';
        mgc_done_sync_mgc_bsync_rdy_bcwt <= '0';
        Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_icwt <= '0';
        Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_bcwt <= '0';
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
        Vga_rsc_singleport_bcwt_drv <= Vga_rsc_singleport_bcwt_drv XOR Vga_rsc_singleport_biwt
            XOR (Vga_rsc_singleport_oswt AND core_wen_drv);
        mgc_start_sync_mgc_bsync_vld_icwt <= mgc_start_sync_mgc_bsync_vld_icwt XOR
            mgc_start_sync_mgc_bsync_vld_pdswt0 XOR mgc_start_sync_mgc_bsync_vld_biwt;
        mgc_start_sync_mgc_bsync_vld_bcwt <= mgc_start_sync_mgc_bsync_vld_bcwt XOR
            mgc_start_sync_mgc_bsync_vld_biwt XOR (mgc_start_sync_mgc_bsync_vld_oswt
            AND core_wen_drv);
        mgc_done_sync_mgc_bsync_rdy_icwt <= mgc_done_sync_mgc_bsync_rdy_icwt XOR
            mgc_done_sync_mgc_bsync_rdy_pdswt0 XOR mgc_done_sync_mgc_bsync_rdy_ogwt;
        mgc_done_sync_mgc_bsync_rdy_bcwt <= mgc_done_sync_mgc_bsync_rdy_bcwt XOR
            mgc_done_sync_mgc_bsync_rdy_ogwt XOR and_25_cse;
        Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_icwt <= Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_icwt
            XOR mgc_done_sync_mgc_bsync_rdy_pdswt0 XOR Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ogwt;
        Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_bcwt <= Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_bcwt
            XOR Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ogwt
            XOR and_25_cse;
        Vga_triosy_mgc_io_sync_icwt <= Vga_triosy_mgc_io_sync_icwt XOR Vga_triosy_mgc_io_sync_pdswt0
            XOR Vga_triosy_mgc_io_sync_ogwt;
        Vga_triosy_mgc_io_sync_bcwt <= Vga_triosy_mgc_io_sync_bcwt XOR Vga_triosy_mgc_io_sync_ogwt
            XOR and_33_cse;
        Comp_triosy_mgc_io_sync_icwt <= Comp_triosy_mgc_io_sync_icwt XOR Vga_triosy_mgc_io_sync_pdswt0
            XOR Comp_triosy_mgc_io_sync_ogwt;
        Comp_triosy_mgc_io_sync_bcwt <= Comp_triosy_mgc_io_sync_bcwt XOR Comp_triosy_mgc_io_sync_ogwt
            XOR and_33_cse;
        Src_triosy_mgc_io_sync_icwt <= Src_triosy_mgc_io_sync_icwt XOR Vga_triosy_mgc_io_sync_pdswt0
            XOR Src_triosy_mgc_io_sync_ogwt;
        Src_triosy_mgc_io_sync_bcwt <= Src_triosy_mgc_io_sync_bcwt XOR Src_triosy_mgc_io_sync_ogwt
            XOR and_33_cse;
        nblevels_triosy_mgc_io_sync_icwt <= nblevels_triosy_mgc_io_sync_icwt XOR
            Vga_triosy_mgc_io_sync_pdswt0 XOR nblevels_triosy_mgc_io_sync_ogwt;
        nblevels_triosy_mgc_io_sync_bcwt <= nblevels_triosy_mgc_io_sync_bcwt XOR
            nblevels_triosy_mgc_io_sync_ogwt XOR and_33_cse;
        core_wten <= NOT core_wen_drv;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    Main_Comp_Decomp_Tot_Main_Fonction_core
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps.ALL;
USE work.singleport_ram_be_pkg.ALL;
USE work.Main_Comp_Decomp_Tot_Main_Fonction_mux_pkg.ALL;


ENTITY Main_Comp_Decomp_Tot_Main_Fonction_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    Src_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    Comp_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    Vga_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    core_wen : OUT STD_LOGIC;
    Src_rsc_singleport_data_in_core : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    Src_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    Src_rsc_singleport_re_core_sct : OUT STD_LOGIC;
    Src_rsc_singleport_we_core_sct : OUT STD_LOGIC;
    Comp_rsc_singleport_data_in_core : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    Comp_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    Comp_rsc_singleport_re_core_sct : OUT STD_LOGIC;
    Comp_rsc_singleport_we_core_sct : OUT STD_LOGIC;
    Vga_rsc_singleport_data_in_core : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    Vga_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    Vga_rsc_singleport_re_core_sct : OUT STD_LOGIC;
    Vga_rsc_singleport_we_core_sct : OUT STD_LOGIC;
    nblevels_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d : OUT STD_LOGIC_VECTOR
        (31 DOWNTO 0);
    cmodel_cumulative_frequency_rsc_singleport_data_in : OUT STD_LOGIC_VECTOR (31
        DOWNTO 0);
    cmodel_cumulative_frequency_rsc_singleport_addr : OUT STD_LOGIC_VECTOR (8 DOWNTO
        0);
    cmodel_cumulative_frequency_rsc_singleport_re : OUT STD_LOGIC;
    cmodel_cumulative_frequency_rsc_singleport_we : OUT STD_LOGIC;
    cmodel_cumulative_frequency_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (31
        DOWNTO 0);
    mgc_start_sync_mgc_bsync_vld_vd : IN STD_LOGIC;
    mgc_done_sync_mgc_bsync_rdy_rd_core_sct : OUT STD_LOGIC;
    Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct : OUT
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
END Main_Comp_Decomp_Tot_Main_Fonction_core;

ARCHITECTURE v1 OF Main_Comp_Decomp_Tot_Main_Fonction_core IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL core_wen_drv : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d_drv : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

  -- Interconnect Declarations
  SIGNAL Src_rsc_singleport_bcwt : STD_LOGIC;
  SIGNAL Src_rsc_singleport_data_out_mxwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Src_rsc_singleport_data_out_bfwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Comp_rsc_singleport_bcwt : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_data_out_mxwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Comp_rsc_singleport_data_out_bfwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Vga_rsc_singleport_bcwt : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_data_out_mxwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Vga_rsc_singleport_data_out_bfwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (137 DOWNTO 0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_for_1_nand_tmp : STD_LOGIC;
  SIGNAL dec_decompress_for_1_and_tmp : STD_LOGIC;
  SIGNAL ModelA_getChar_for_if_acc_tmp : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL comp_compress_for_and_tmp : STD_LOGIC;
  SIGNAL levels_nand_tmp : STD_LOGIC;
  SIGNAL or_dcpl_36 : STD_LOGIC;
  SIGNAL or_dcpl_39 : STD_LOGIC;
  SIGNAL or_dcpl_43 : STD_LOGIC;
  SIGNAL or_dcpl_53 : STD_LOGIC;
  SIGNAL or_dcpl_72 : STD_LOGIC;
  SIGNAL or_dcpl_81 : STD_LOGIC;
  SIGNAL or_dcpl_90 : STD_LOGIC;
  SIGNAL or_dcpl_121 : STD_LOGIC;
  SIGNAL or_dcpl_260 : STD_LOGIC;
  SIGNAL or_dcpl_594 : STD_LOGIC;
  SIGNAL or_dcpl_596 : STD_LOGIC;
  SIGNAL or_dcpl_597 : STD_LOGIC;
  SIGNAL or_dcpl_633 : STD_LOGIC;
  SIGNAL or_dcpl_634 : STD_LOGIC;
  SIGNAL or_dcpl_637 : STD_LOGIC;
  SIGNAL or_dcpl_639 : STD_LOGIC;
  SIGNAL or_dcpl_647 : STD_LOGIC;
  SIGNAL or_dcpl_655 : STD_LOGIC;
  SIGNAL or_dcpl_658 : STD_LOGIC;
  SIGNAL or_dcpl_664 : STD_LOGIC;
  SIGNAL or_dcpl_666 : STD_LOGIC;
  SIGNAL or_dcpl_669 : STD_LOGIC;
  SIGNAL or_dcpl_671 : STD_LOGIC;
  SIGNAL or_dcpl_677 : STD_LOGIC;
  SIGNAL or_dcpl_678 : STD_LOGIC;
  SIGNAL or_dcpl_683 : STD_LOGIC;
  SIGNAL or_dcpl_687 : STD_LOGIC;
  SIGNAL or_dcpl_693 : STD_LOGIC;
  SIGNAL or_dcpl_736 : STD_LOGIC;
  SIGNAL or_dcpl_741 : STD_LOGIC;
  SIGNAL or_dcpl_996 : STD_LOGIC;
  SIGNAL or_dcpl_1017 : STD_LOGIC;
  SIGNAL or_dcpl_1038 : STD_LOGIC;
  SIGNAL or_dcpl_1040 : STD_LOGIC;
  SIGNAL or_dcpl_1244 : STD_LOGIC;
  SIGNAL or_dcpl_1245 : STD_LOGIC;
  SIGNAL or_dcpl_1251 : STD_LOGIC;
  SIGNAL or_dcpl_1257 : STD_LOGIC;
  SIGNAL or_dcpl_1271 : STD_LOGIC;
  SIGNAL or_dcpl_1278 : STD_LOGIC;
  SIGNAL or_dcpl_1285 : STD_LOGIC;
  SIGNAL or_dcpl_1308 : STD_LOGIC;
  SIGNAL or_dcpl_1310 : STD_LOGIC;
  SIGNAL or_dcpl_1314 : STD_LOGIC;
  SIGNAL or_dcpl_1328 : STD_LOGIC;
  SIGNAL or_dcpl_1331 : STD_LOGIC;
  SIGNAL or_dcpl_1339 : STD_LOGIC;
  SIGNAL or_dcpl_1355 : STD_LOGIC;
  SIGNAL or_dcpl_1402 : STD_LOGIC;
  SIGNAL or_dcpl_1427 : STD_LOGIC;
  SIGNAL or_dcpl_1429 : STD_LOGIC;
  SIGNAL or_dcpl_1460 : STD_LOGIC;
  SIGNAL or_dcpl_1897 : STD_LOGIC;
  SIGNAL and_dcpl_198 : STD_LOGIC;
  SIGNAL or_dcpl_2023 : STD_LOGIC;
  SIGNAL or_dcpl_2024 : STD_LOGIC;
  SIGNAL or_dcpl_2058 : STD_LOGIC;
  SIGNAL or_dcpl_2059 : STD_LOGIC;
  SIGNAL or_dcpl_2070 : STD_LOGIC;
  SIGNAL or_dcpl_2081 : STD_LOGIC;
  SIGNAL or_dcpl_2439 : STD_LOGIC;
  SIGNAL or_dcpl_2494 : STD_LOGIC;
  SIGNAL or_dcpl_2527 : STD_LOGIC;
  SIGNAL or_dcpl_2537 : STD_LOGIC;
  SIGNAL or_dcpl_2569 : STD_LOGIC;
  SIGNAL or_dcpl_2610 : STD_LOGIC;
  SIGNAL or_dcpl_2626 : STD_LOGIC;
  SIGNAL or_dcpl_2643 : STD_LOGIC;
  SIGNAL or_dcpl_2651 : STD_LOGIC;
  SIGNAL or_dcpl_3160 : STD_LOGIC;
  SIGNAL or_dcpl_3164 : STD_LOGIC;
  SIGNAL or_dcpl_3173 : STD_LOGIC;
  SIGNAL or_dcpl_3175 : STD_LOGIC;
  SIGNAL or_dcpl_3198 : STD_LOGIC;
  SIGNAL or_dcpl_3202 : STD_LOGIC;
  SIGNAL or_dcpl_3214 : STD_LOGIC;
  SIGNAL or_dcpl_3217 : STD_LOGIC;
  SIGNAL or_dcpl_3220 : STD_LOGIC;
  SIGNAL or_dcpl_3225 : STD_LOGIC;
  SIGNAL or_dcpl_3233 : STD_LOGIC;
  SIGNAL or_dcpl_3236 : STD_LOGIC;
  SIGNAL or_dcpl_3247 : STD_LOGIC;
  SIGNAL or_dcpl_3248 : STD_LOGIC;
  SIGNAL or_dcpl_3249 : STD_LOGIC;
  SIGNAL or_dcpl_3251 : STD_LOGIC;
  SIGNAL or_dcpl_3267 : STD_LOGIC;
  SIGNAL or_dcpl_3274 : STD_LOGIC;
  SIGNAL and_dcpl_284 : STD_LOGIC;
  SIGNAL or_dcpl_3303 : STD_LOGIC;
  SIGNAL or_dcpl_3305 : STD_LOGIC;
  SIGNAL or_dcpl_3320 : STD_LOGIC;
  SIGNAL or_dcpl_3322 : STD_LOGIC;
  SIGNAL or_dcpl_3325 : STD_LOGIC;
  SIGNAL or_dcpl_3327 : STD_LOGIC;
  SIGNAL and_dcpl_289 : STD_LOGIC;
  SIGNAL or_dcpl_3331 : STD_LOGIC;
  SIGNAL or_dcpl_3333 : STD_LOGIC;
  SIGNAL or_dcpl_3335 : STD_LOGIC;
  SIGNAL and_dcpl_290 : STD_LOGIC;
  SIGNAL or_tmp_9 : STD_LOGIC;
  SIGNAL or_dcpl_3338 : STD_LOGIC;
  SIGNAL or_tmp_12 : STD_LOGIC;
  SIGNAL and_tmp_3 : STD_LOGIC;
  SIGNAL or_dcpl_3385 : STD_LOGIC;
  SIGNAL or_dcpl_3403 : STD_LOGIC;
  SIGNAL or_dcpl_3407 : STD_LOGIC;
  SIGNAL and_dcpl_294 : STD_LOGIC;
  SIGNAL nand_tmp : STD_LOGIC;
  SIGNAL or_tmp_22 : STD_LOGIC;
  SIGNAL or_dcpl_3454 : STD_LOGIC;
  SIGNAL or_dcpl_3458 : STD_LOGIC;
  SIGNAL or_dcpl_3472 : STD_LOGIC;
  SIGNAL or_dcpl_3502 : STD_LOGIC;
  SIGNAL or_dcpl_3508 : STD_LOGIC;
  SIGNAL or_dcpl_3520 : STD_LOGIC;
  SIGNAL and_dcpl_301 : STD_LOGIC;
  SIGNAL or_dcpl_3552 : STD_LOGIC;
  SIGNAL or_dcpl_3553 : STD_LOGIC;
  SIGNAL and_dcpl_307 : STD_LOGIC;
  SIGNAL or_dcpl_3689 : STD_LOGIC;
  SIGNAL or_dcpl_3731 : STD_LOGIC;
  SIGNAL or_dcpl_3734 : STD_LOGIC;
  SIGNAL or_dcpl_3752 : STD_LOGIC;
  SIGNAL or_dcpl_3759 : STD_LOGIC;
  SIGNAL or_dcpl_3767 : STD_LOGIC;
  SIGNAL or_dcpl_3776 : STD_LOGIC;
  SIGNAL or_dcpl_3873 : STD_LOGIC;
  SIGNAL or_dcpl_3880 : STD_LOGIC;
  SIGNAL or_dcpl_3890 : STD_LOGIC;
  SIGNAL or_dcpl_3905 : STD_LOGIC;
  SIGNAL or_dcpl_3906 : STD_LOGIC;
  SIGNAL or_dcpl_3907 : STD_LOGIC;
  SIGNAL or_dcpl_3909 : STD_LOGIC;
  SIGNAL or_dcpl_3913 : STD_LOGIC;
  SIGNAL or_dcpl_3914 : STD_LOGIC;
  SIGNAL or_dcpl_3916 : STD_LOGIC;
  SIGNAL or_dcpl_3922 : STD_LOGIC;
  SIGNAL or_dcpl_3925 : STD_LOGIC;
  SIGNAL or_dcpl_3930 : STD_LOGIC;
  SIGNAL or_dcpl_3940 : STD_LOGIC;
  SIGNAL or_dcpl_3943 : STD_LOGIC;
  SIGNAL or_dcpl_3948 : STD_LOGIC;
  SIGNAL or_dcpl_3951 : STD_LOGIC;
  SIGNAL or_dcpl_3957 : STD_LOGIC;
  SIGNAL or_dcpl_3958 : STD_LOGIC;
  SIGNAL and_dcpl_349 : STD_LOGIC;
  SIGNAL or_dcpl_4056 : STD_LOGIC;
  SIGNAL or_dcpl_4084 : STD_LOGIC;
  SIGNAL or_dcpl_4087 : STD_LOGIC;
  SIGNAL and_dcpl_363 : STD_LOGIC;
  SIGNAL and_dcpl_365 : STD_LOGIC;
  SIGNAL or_dcpl_4199 : STD_LOGIC;
  SIGNAL or_dcpl_4202 : STD_LOGIC;
  SIGNAL or_dcpl_4208 : STD_LOGIC;
  SIGNAL or_dcpl_4210 : STD_LOGIC;
  SIGNAL or_dcpl_4219 : STD_LOGIC;
  SIGNAL or_dcpl_4998 : STD_LOGIC;
  SIGNAL and_dcpl_479 : STD_LOGIC;
  SIGNAL and_dcpl_480 : STD_LOGIC;
  SIGNAL or_dcpl_5178 : STD_LOGIC;
  SIGNAL or_dcpl_5311 : STD_LOGIC;
  SIGNAL or_dcpl_5315 : STD_LOGIC;
  SIGNAL or_dcpl_5318 : STD_LOGIC;
  SIGNAL or_dcpl_5330 : STD_LOGIC;
  SIGNAL or_dcpl_5333 : STD_LOGIC;
  SIGNAL and_dcpl_489 : STD_LOGIC;
  SIGNAL or_dcpl_5408 : STD_LOGIC;
  SIGNAL or_dcpl_5412 : STD_LOGIC;
  SIGNAL or_dcpl_5709 : STD_LOGIC;
  SIGNAL ModelA_getChar_for_if_p_low_lpi_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getChar_for_if_p_high_lpi_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getChar_for_if_p_count_lpi_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL nblevels_1_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL cmodel_cumulative_frequency_vinit_ndx_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL cmodel_m_frozen_1_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_hi_7_sg3_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_hi_7_sg4_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_hi_7_sg2_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_hi_7_sg5_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_hi_7_sg1_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_hi_7_sg6_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_hi_7_sg7_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_wi_7_sg4_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_wi_7_sg3_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_wi_7_sg5_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_wi_7_sg2_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_wi_7_sg6_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_wi_7_sg1_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_wi_7_sg7_sva : STD_LOGIC;
  SIGNAL trans_ond_Mn_Trans_Ond_wi_7_sg8_sva : STD_LOGIC;
  SIGNAL trans_ond_image_copy_y_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL exit_copy_x_sva : STD_LOGIC;
  SIGNAL trans_ond_image_copy_x_1_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL trans_ond_image_copy_x_1_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL trans_ond_Trans_Ond_y_1_sva : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL trans_ond_Trans_Ond_x_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL exit_passe_y_sva : STD_LOGIC;
  SIGNAL trans_ond_moy_slc_Src_3_cse_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL trans_ond_moy_1_acc_cse_sg1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL trans_ond_sub_2_acc_1_cse_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL levels_nand_svs : STD_LOGIC;
  SIGNAL trans_ond_Trans_Ond_1_y_1_sva : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL trans_ond_Trans_Ond_1_x_1_sva : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL exit_passe_y_1_sva : STD_LOGIC;
  SIGNAL passe_y_1_acc_1_cse_1_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL trans_ond_moy_slc_Comp_11_cse_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL trans_ond_moy_7_acc_cse_sg1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL trans_ond_sub_8_acc_1_cse_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL trans_ond_image_copy_1_y_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL exit_copy_y_1_sva : STD_LOGIC;
  SIGNAL comp_byte_to_encode_1_sva : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL comp_compress_high_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_m_output_m_Mask_1_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_m_output_index_range_lpi_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_m_output_m_NextByte_1_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
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
  SIGNAL comp_m_output_index_range_lpi_2_dfm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_m_output_m_NextByte_1_lpi_2_dfm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_put_bit_plus_pending_for_i_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_comp_put_bit_plus_pending_for_sva : STD_LOGIC;
  SIGNAL comp_m_output_m_NextByte_1_lpi_4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_m_output_m_Mask_1_lpi_4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_m_output_index_range_lpi_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_compress_for_for_else_slc_svs : STD_LOGIC;
  SIGNAL comp_m_output_index_range_lpi_2_dfm_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_m_output_m_NextByte_1_lpi_2_dfm_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_m_output_m_Mask_1_lpi_2_dfm_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_put_bit_plus_pending_1_for_i_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_comp_put_bit_plus_pending_1_for_sva : STD_LOGIC;
  SIGNAL comp_m_output_m_Mask_1_lpi_5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_m_output_index_range_lpi_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_m_output_m_NextByte_1_lpi_5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_compress_pending_bits_1_lpi_2_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_compress_pending_bits_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_m_output_index_range_lpi_dfm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_m_output_m_NextByte_1_lpi_dfm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_put_bit_plus_pending_2_for_i_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_comp_put_bit_plus_pending_2_for_sva : STD_LOGIC;
  SIGNAL comp_m_output_index_range_lpi_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL unequal_tmp_6 : STD_LOGIC;
  SIGNAL comp_m_output_m_NextByte_lpi_dfm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_m_output_index_range_lpi_dfm_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL comp_put_bit_plus_pending_3_for_i_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_comp_put_bit_plus_pending_3_for_sva : STD_LOGIC;
  SIGNAL comp_m_output_index_range_lpi_7 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL trans_ond_image_copy_2_y_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL exit_copy_x_2_sva : STD_LOGIC;
  SIGNAL cmodel_cumulative_frequency_vinit_ndx_1_sva : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL trans_ond_image_copy_2_x_1_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL trans_ond_image_copy_2_x_1_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL exit_copy_x_2_sva_dfm : STD_LOGIC;
  SIGNAL cmodel_m_frozen_sva : STD_LOGIC;
  SIGNAL dec_m_input_m_CurrentByte_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_m_input_m_LastMask_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_m_input_input_byte_1_sva : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL dec_m_output_index_range_1_sva : STD_LOGIC_VECTOR (16 DOWNTO 0);
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
  SIGNAL unequal_tmp_8 : STD_LOGIC;
  SIGNAL dec_m_input_m_LastMask_sva_dfm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_m_input_m_CurrentByte_1_sva_dfm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_m_input_input_byte_1_sva_dfm : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL dec_decompress_value_1_sg13_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg12_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg11_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg10_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg9_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg8_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg7_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg6_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg5_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg4_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg3_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg2_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg1_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_3_sva_1 : STD_LOGIC;
  SIGNAL dec_decompress_for_i_1_sva_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL dec_m_input_input_byte_1_lpi_3 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL dec_m_input_m_CurrentByte_1_lpi_3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_m_input_m_LastMask_lpi_3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
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
  SIGNAL cmodel_m_frozen_sva_1 : STD_LOGIC;
  SIGNAL ModelA_getChar_for_not_sxt : STD_LOGIC;
  SIGNAL ModelA_getChar_for_if_p_low_lpi_1_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getChar_for_if_p_high_lpi_1_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ModelA_getChar_for_if_p_count_lpi_1_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL dec_m_output_putByte_slc_svs : STD_LOGIC;
  SIGNAL dec_m_output_index_range_1_sva_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL dec_decompress_high_1_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL dec_decompress_low_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL dec_decompress_for_1_for_else_else_land_lpi_2_dfm : STD_LOGIC;
  SIGNAL unequal_tmp_9 : STD_LOGIC;
  SIGNAL trans_ond_image_copy_3_y_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL exit_copy_x_3_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_himpairs_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_hi_1_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_1_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_i_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_inv_wave_Mn_Inv_Wave_Fct_for_sva : STD_LOGIC;
  SIGNAL trans_ond_image_copy_3_x_1_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL trans_ond_image_copy_3_x_1_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva_dfm_2 : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_dfm_3 : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_dfm_3 : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg29_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg28_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg27_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg26_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg25_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg24_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg23_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg22_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg21_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg20_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg19_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg18_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg17_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg16_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg15_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_i_2_sg1_sva : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_for_1_slc_2_mdf_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inv_wave_Inv_Wave_y_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_x_and_cse_sva : STD_LOGIC;
  SIGNAL inv_wave_Inv_Wave_x_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_for_1_nand_svs : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_mdf_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_1_mdf_sva : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inv_wave_Inv_Wave_1_y_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_x_1_and_cse_sva : STD_LOGIC;
  SIGNAL inv_wave_Inv_Wave_1_x_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL hsplit_y_1_slc_Vga_3_cse_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL inv_wave_image_copy_y_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inv_wave_image_copy_x_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL exit_copy_y_4_sva : STD_LOGIC;
  SIGNAL dec_decompress_for_1_scaled_value_acc_mut : STD_LOGIC_VECTOR (66 DOWNTO
      0);
  SIGNAL comp_compress_for_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL dec_decompress_for_1_mul_1_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL copy_y_slc_itm : STD_LOGIC;
  SIGNAL cmodel_reset_for_nor_itm : STD_LOGIC;
  SIGNAL cmodel_reset_for_acc_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_5_itm : STD_LOGIC_VECTOR
      (5 DOWNTO 0);
  SIGNAL passe_y_slc_trans_ond_Trans_Ond_x_1_itm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_6_itm : STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL passe_y_acc_7_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL trans_ond_moy_5_slc_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_3_itm : STD_LOGIC_VECTOR
      (5 DOWNTO 0);
  SIGNAL trans_ond_sub_5_acc_1_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL passe_y_acc_13_itm : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL trans_ond_Trans_Ond_1_x_slc_trans_ond_Trans_Ond_1_x_4_itm : STD_LOGIC_VECTOR
      (5 DOWNTO 0);
  SIGNAL passe_y_1_acc_7_itm : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL trans_ond_moy_11_slc_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL trans_ond_sub_11_acc_1_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL passe_y_1_acc_13_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL trans_ond_image_copy_1_x_slc_trans_ond_image_copy_1_x_1_itm : STD_LOGIC_VECTOR
      (5 DOWNTO 0);
  SIGNAL levels_asn_3_itm : STD_LOGIC;
  SIGNAL levels_asn_4_itm : STD_LOGIC;
  SIGNAL levels_asn_14_itm : STD_LOGIC;
  SIGNAL levels_asn_15_itm : STD_LOGIC;
  SIGNAL slc_ModelA_update_for_i_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL comp_compress_for_for_else_else_mux_3_itm : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL comp_compress_for_for_else_else_mux_4_itm : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL comp_compress_for_for_and_2_itm : STD_LOGIC;
  SIGNAL comp_compress_for_acc_3_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL ModelA_getProbability_mux_1_itm : STD_LOGIC;
  SIGNAL comp_getByte_mux_2_itm : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL copy_y_2_slc_itm : STD_LOGIC;
  SIGNAL cmodel_reset_1_for_nor_itm : STD_LOGIC;
  SIGNAL copy_x_2_mux_2_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL cmodel_reset_1_for_acc_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL slc_ModelA_update_1_for_i_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL ModelA_getChar_for_slc_1_itm : STD_LOGIC;
  SIGNAL ModelA_getChar_for_slc_itm : STD_LOGIC;
  SIGNAL dec_decompress_for_1_acc_3_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL copy_y_3_slc_itm : STD_LOGIC;
  SIGNAL hsplit_y_slc_inv_wave_Inv_Wave_x_16_itm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL hsplit_y_acc_2_itm : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL hsplit_y_slc_inv_wave_Inv_Wave_x_17_itm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL hsplit_y_acc_63_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_slc_inv_wave_Inv_Wave_x_9_itm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL hsplit_y_slc_9_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_slc_inv_wave_Inv_Wave_x_26_itm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL hsplit_y_slc_11_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_acc_38_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_slc_inv_wave_Inv_Wave_x_13_itm : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL hsplit_y_slc_13_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_acc_46_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_slc_inv_wave_Inv_Wave_x_27_itm : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_16_itm : STD_LOGIC_VECTOR (5 DOWNTO
      0);
  SIGNAL hsplit_y_1_acc_2_itm : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_17_itm : STD_LOGIC_VECTOR (5 DOWNTO
      0);
  SIGNAL hsplit_y_1_acc_63_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_9_itm : STD_LOGIC_VECTOR (5 DOWNTO
      0);
  SIGNAL hsplit_y_1_slc_9_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_26_itm : STD_LOGIC_VECTOR (5 DOWNTO
      0);
  SIGNAL hsplit_y_1_slc_11_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_1_acc_38_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_13_itm : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL hsplit_y_1_slc_13_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_1_acc_46_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_27_itm : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL copy_y_4_slc_inv_wave_image_copy_x_1_itm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL trans_ond_Mn_Trans_Ond_i_1_sg1_sva_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL trans_ond_image_copy_1_x_1_sva_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_compress_low_1_sva_4 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL ModelA_update_for_i_sva_sg1 : STD_LOGIC_VECTOR (22 DOWNTO 0);
  SIGNAL ModelA_update_for_i_sva_2 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL dec_decompress_low_sva_5 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL dec_decompress_value_1_sg14_sva_sg7 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg6 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg5 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg4 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg2 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_sg1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_5 : STD_LOGIC;
  SIGNAL dec_decompress_for_i_1_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg17 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg16 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg15 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg14 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg13 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg12 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg11 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg10 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg9 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg8 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg7 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg6 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg5 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg4 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg3 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg2 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_1_sg1 : STD_LOGIC;
  SIGNAL dec_decompress_value_1_sg14_sva_6 : STD_LOGIC;
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
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3 : STD_LOGIC_VECTOR (29 DOWNTO
      0);
  SIGNAL comp_compress_for_for_else_else_mux_1_itm_1 : STD_LOGIC;
  SIGNAL comp_compress_for_for_else_else_mux_2_itm_1 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg16 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg15 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg14 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg13 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg12 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg11 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg10 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg9 : STD_LOGIC;
  SIGNAL dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg8 : STD_LOGIC;
  SIGNAL passe_y_acc_49_psp : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL passe_y_acc_psp : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL passe_y_acc_51_psp : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL passe_y_1_acc_psp : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL passe_y_1_acc_49_psp : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL copy_y_1_acc_psp : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_compress_for_mul_1_psp : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL dec_decompress_for_1_mul_psp : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL hsplit_y_acc_psp : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL hsplit_y_acc_75_psp : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_acc_76_psp : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL hsplit_y_1_acc_psp : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL hsplit_y_1_acc_75_psp : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hsplit_y_1_acc_76_psp : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_7 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL passe_x_acc_3_cse_sg1 : STD_LOGIC;
  SIGNAL and_323_cse : STD_LOGIC;
  SIGNAL and_370_cse : STD_LOGIC;
  SIGNAL and_386_cse : STD_LOGIC;
  SIGNAL or_4126_cse : STD_LOGIC;
  SIGNAL exit_inv_wave_Mn_Inv_Wave_Fct_for_1_sva_mx0 : STD_LOGIC;
  SIGNAL exit_copy_x_4_sva_mx0 : STD_LOGIC;
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx0w0 : STD_LOGIC;
  SIGNAL dec_decompress_for_1_for_nor_cse : STD_LOGIC;
  SIGNAL dec_decompress_for_1_for_and_1_cse : STD_LOGIC;
  SIGNAL comp_getByte_Compressor_getByte_return_1_lpi_1_dfm : STD_LOGIC_VECTOR (7
      DOWNTO 0);
  SIGNAL exit_levels_sva_mx0 : STD_LOGIC;
  SIGNAL exit_passe_x_1_sva_mx0 : STD_LOGIC;
  SIGNAL ModelA_update_acc_2 : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL or_2695_cse : STD_LOGIC;
  SIGNAL reg_nblevels_triosy_mgc_io_sync_iswt0_cse : STD_LOGIC;
  SIGNAL reg_Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_iswt0_cse
      : STD_LOGIC;
  SIGNAL reg_start_sync_mgc_bsync_vld_iswt0_cse : STD_LOGIC;
  SIGNAL reg_Vga_rsc_singleport_iswt0_cse : STD_LOGIC;
  SIGNAL reg_Comp_rsc_singleport_iswt0_cse : STD_LOGIC;
  SIGNAL reg_Src_rsc_singleport_iswt0_cse : STD_LOGIC;
  SIGNAL or_3423_cse : STD_LOGIC;
  SIGNAL or_3427_cse : STD_LOGIC;
  SIGNAL or_3734_cse : STD_LOGIC;
  SIGNAL or_3870_cse : STD_LOGIC;
  SIGNAL and_454_cse : STD_LOGIC;
  SIGNAL and_462_cse : STD_LOGIC;
  SIGNAL or_4268_cse : STD_LOGIC;
  SIGNAL or_5090_cse : STD_LOGIC;
  SIGNAL or_5242_cse : STD_LOGIC;
  SIGNAL or_5392_cse : STD_LOGIC;
  SIGNAL or_5768_cse : STD_LOGIC;
  SIGNAL or_5849_cse : STD_LOGIC;
  SIGNAL reg_hsplit_y_1_acc_sdt_tmp_7 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL reg_hsplit_y_1_acc_67_sdt_tmp_8 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL reg_hsplit_y_acc_sdt_tmp_7 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL reg_hsplit_y_acc_67_sdt_tmp_8 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL and_361_ssc : STD_LOGIC;
  SIGNAL reg_div_mgc_div_b_tmp_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL or_3431_ssc : STD_LOGIC;
  SIGNAL reg_div_mgc_div_a_tmp : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL reg_div_mgc_div_a_tmp_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL reg_passe_y_acc_46_sdt_tmp_7 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL reg_passe_y_acc_43_sdt_tmp_6 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL reg_slc_slc_tmp_5 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL reg_passe_y_1_acc_44_sdt_tmp_6 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL and_349_ssc : STD_LOGIC;
  SIGNAL and_355_ssc : STD_LOGIC;
  SIGNAL and_367_ssc : STD_LOGIC;
  SIGNAL and_479_ssc : STD_LOGIC;
  SIGNAL and_343_ssc : STD_LOGIC;
  SIGNAL or_5964_cse : STD_LOGIC;
  SIGNAL or_5965_cse : STD_LOGIC;
  SIGNAL and_568_cse : STD_LOGIC;
  SIGNAL and_570_cse : STD_LOGIC;
  SIGNAL or_5942_cse : STD_LOGIC;
  SIGNAL or_5943_cse : STD_LOGIC;
  SIGNAL Src_rsc_singleport_re_core_sct_reg : STD_LOGIC;
  SIGNAL or_3401_rmff : STD_LOGIC;
  SIGNAL Src_rsc_singleport_we_core_sct_reg : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_re_core_sct_reg : STD_LOGIC;
  SIGNAL or_3373_rmff : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_we_core_sct_reg : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_re_core_sct_reg : STD_LOGIC;
  SIGNAL or_3326_rmff : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_we_core_sct_reg : STD_LOGIC;
  SIGNAL passe_y_1_acc_psp_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL copy_y_1_acc_psp_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_m_output_m_NextByte_1_sva_4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_m_output_m_NextByte_1_sva_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL comp_m_output_m_NextByte_1_sva_8 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL ModelA_getChar_for_i_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL comp_compress_for_c_sg1_2_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL comp_compress_for_c_1_lpi_1_dfm_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_267_itm : STD_LOGIC;
  SIGNAL copy_x_1_acc_3_itm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL z_out_7 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL z_out_8 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_9 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_10 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_11 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_12 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_13 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_15 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_16 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL z_out_17 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL z_out_18 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_19 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_20 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out_21 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out_22 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out_23 : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL z_out_24 : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL z_out_25 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL z_out_26 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_27 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL z_out_28 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL z_out_29 : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL z_out_30 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_31 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL z_out_32 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_33 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_34 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_35 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL z_out_36 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL z_out_37 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_38 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_39 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_40 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out_42 : STD_LOGIC_VECTOR (17 DOWNTO 0);
  SIGNAL z_out_43 : STD_LOGIC_VECTOR (17 DOWNTO 0);
  SIGNAL z_out_44 : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL z_out_45 : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL z_out_46 : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL z_out_48 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_49 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL z_out_50 : STD_LOGIC_VECTOR (22 DOWNTO 0);
  SIGNAL z_out_51 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL z_out_52 : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL z_out_53 : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx1 : STD_LOGIC;
  SIGNAL div_mgc_div_1_b_mx1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL dec_decompress_for_1_scaled_value_acc_mut_mx0w2 : STD_LOGIC_VECTOR (66 DOWNTO
      0);
  SIGNAL trans_ond_Trans_Ond_x_1_sva_mx0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL passe_y_acc_43_sdt_mx0w0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL trans_ond_image_copy_1_y_1_sva_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL trans_ond_Trans_Ond_1_y_1_sva_1 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL trans_ond_image_copy_1_x_1_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL trans_ond_Mn_Trans_Ond_i_1_sg1_sva_1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL unequal_tmp_10 : STD_LOGIC;
  SIGNAL comp_m_output_index_range_lpi_2_dfm_1_mx1w0 : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL comp_m_output_index_range_lpi_dfm_1_mx1w0 : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL dec_m_input_m_CurrentByte_1_sva_mx1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_decompress_value_3_sva_2 : STD_LOGIC;
  SIGNAL dec_m_input_m_CurrentByte_1_lpi_3_mx1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_decompress_for_1_scaled_value_acc_4_sdt : STD_LOGIC_VECTOR (32 DOWNTO
      0);
  SIGNAL trans_ond_image_copy_3_y_1_sva_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_decompress_value_1_sg14_sva_2_sg1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL dec_decompress_value_1_sg14_lpi_3_dfm_3 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL dec_decompress_high_1_sva_1_dfm_sg1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL hsplit_x_and_cse_sva_1 : STD_LOGIC;
  SIGNAL inv_wave_Inv_Wave_x_sva_mx0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL hsplit_y_and_4_cse_sva : STD_LOGIC;
  SIGNAL hsplit_x_1_and_cse_sva_1 : STD_LOGIC;
  SIGNAL inv_wave_Inv_Wave_1_x_sva_mx0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL hsplit_y_1_and_4_cse_sva : STD_LOGIC;
  SIGNAL or_5969_cse : STD_LOGIC;
  SIGNAL or_5974_cse : STD_LOGIC;
  SIGNAL or_5975_cse : STD_LOGIC;
  SIGNAL or_3895_tmp : STD_LOGIC;
  SIGNAL or_3864_tmp : STD_LOGIC;
  SIGNAL or_3913_tmp : STD_LOGIC;
  SIGNAL or_3927_tmp : STD_LOGIC;
  SIGNAL reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp : STD_LOGIC;
  SIGNAL reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1 : STD_LOGIC_VECTOR (5 DOWNTO
      0);
  SIGNAL reg_comp_m_output_m_Mask_2_lpi_dfm_tmp : STD_LOGIC;
  SIGNAL reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL or_5020_tmp : STD_LOGIC;
  SIGNAL and_508_tmp : STD_LOGIC;
  SIGNAL or_5972_ssc : STD_LOGIC;
  SIGNAL dec_decompress_for_1_scaled_value_acc_5_sdt : STD_LOGIC_VECTOR (32 DOWNTO
      0);
  SIGNAL or_5991_cse : STD_LOGIC;
  SIGNAL reg_trans_ond_sub_acc_1_itm_cse : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL reg_copy_y_acc_8_psp_cse : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_664_cse : STD_LOGIC;
  SIGNAL and_665_cse : STD_LOGIC;
  SIGNAL and_666_cse : STD_LOGIC;
  SIGNAL and_691_cse : STD_LOGIC;
  SIGNAL reg_hsplit_y_acc_5_cse_sva_cse : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL reg_hsplit_y_acc_30_itm_cse : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL nor_90_cse : STD_LOGIC;
  SIGNAL or_5990_cse : STD_LOGIC;
  SIGNAL or_cse : STD_LOGIC;
  SIGNAL or_5988_cse : STD_LOGIC;
  SIGNAL and_861_m1c : STD_LOGIC;
  SIGNAL and_864_m1c : STD_LOGIC;
  SIGNAL and_716_cse : STD_LOGIC;
  SIGNAL and_769_cse : STD_LOGIC;
  SIGNAL and_770_cse : STD_LOGIC;
  SIGNAL or_6010_cse : STD_LOGIC;
  SIGNAL or_6012_cse : STD_LOGIC;
  SIGNAL or_6008_cse : STD_LOGIC;
  SIGNAL or_5981_cse : STD_LOGIC;
  SIGNAL and_755_cse : STD_LOGIC;
  SIGNAL or_6014_cse : STD_LOGIC;
  SIGNAL and_866_cse : STD_LOGIC;
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_530 : STD_LOGIC;
  SIGNAL or_dcpl_5934 : STD_LOGIC;
  SIGNAL nor_108_m1c : STD_LOGIC;
  SIGNAL or_5976_cse_1 : STD_LOGIC;
  SIGNAL nor_110_cse : STD_LOGIC;
  SIGNAL passe_y_1_acc_45_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL passe_y_1_acc_43_itm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_587_itm : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL inv_wave_Mn_Inv_Wave_Fct_for_and_22_itm : STD_LOGIC;
  SIGNAL reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp : STD_LOGIC;
  SIGNAL reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1 : STD_LOGIC_VECTOR (6 DOWNTO
      0);
  SIGNAL reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp : STD_LOGIC;
  SIGNAL reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1 : STD_LOGIC_VECTOR (6 DOWNTO
      0);
  SIGNAL copy_x_3_and_8_tmp : STD_LOGIC;
  SIGNAL and_863_cse : STD_LOGIC;
  SIGNAL nor_127_cse : STD_LOGIC;
  SIGNAL trans_ond_sub_2_and_cse : STD_LOGIC;
  SIGNAL mux_308_cse : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL and_968_cse : STD_LOGIC;
  SIGNAL and_969_cse : STD_LOGIC;
  SIGNAL or_6009_cse : STD_LOGIC;
  SIGNAL mux_327_cse : STD_LOGIC;
  SIGNAL or_5985_cse : STD_LOGIC;
  SIGNAL or_5986_cse : STD_LOGIC;

  SIGNAL mux_265_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL mux1h_28_nl : STD_LOGIC;
  SIGNAL mux1h_256_nl : STD_LOGIC;
  SIGNAL mux1h_257_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL mux1h_261_nl : STD_LOGIC;
  SIGNAL mux1h_258_nl : STD_LOGIC;
  SIGNAL mux1h_259_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mux1h_260_nl : STD_LOGIC;
  SIGNAL mux1h_26_nl : STD_LOGIC;
  SIGNAL mux1h_242_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_243_nl : STD_LOGIC;
  SIGNAL mux1h_244_nl : STD_LOGIC;
  SIGNAL mux1h_245_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mux1h_246_nl : STD_LOGIC;
  SIGNAL mux1h_24_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mux1h_238_nl : STD_LOGIC;
  SIGNAL mux1h_239_nl : STD_LOGIC;
  SIGNAL mux1h_240_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mux1h_241_nl : STD_LOGIC;
  SIGNAL mux1h_23_nl : STD_LOGIC;
  SIGNAL mux1h_248_nl : STD_LOGIC;
  SIGNAL mux1h_249_nl : STD_LOGIC;
  SIGNAL mux1h_250_nl : STD_LOGIC;
  SIGNAL mux1h_251_nl : STD_LOGIC;
  SIGNAL mux1h_252_nl : STD_LOGIC;
  SIGNAL mux1h_253_nl : STD_LOGIC;
  SIGNAL mux1h_254_nl : STD_LOGIC;
  SIGNAL mux1h_255_nl : STD_LOGIC;
  SIGNAL mux_269_nl : STD_LOGIC;
  SIGNAL mux_268_nl : STD_LOGIC;
  SIGNAL mux1h_790_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_741_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_332_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL mux_292_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL mux1h_742_nl : STD_LOGIC;
  SIGNAL mux1h_798_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_744_nl : STD_LOGIC;
  SIGNAL mux1h_799_nl : STD_LOGIC;
  SIGNAL mux1h_793_nl : STD_LOGIC;
  SIGNAL mux1h_794_nl : STD_LOGIC;
  SIGNAL mux1h_795_nl : STD_LOGIC;
  SIGNAL mux1h_796_nl : STD_LOGIC;
  SIGNAL mux1h_797_nl : STD_LOGIC;
  SIGNAL mux1h_800_nl : STD_LOGIC;
  SIGNAL mux1h_801_nl : STD_LOGIC;
  SIGNAL mux1h_802_nl : STD_LOGIC;
  SIGNAL mux1h_803_nl : STD_LOGIC;
  SIGNAL mux1h_804_nl : STD_LOGIC;
  SIGNAL mux1h_805_nl : STD_LOGIC;
  SIGNAL mux1h_806_nl : STD_LOGIC;
  SIGNAL mux1h_807_nl : STD_LOGIC;
  SIGNAL mux1h_808_nl : STD_LOGIC;
  SIGNAL mux1h_809_nl : STD_LOGIC;
  SIGNAL mux1h_745_nl : STD_LOGIC;
  SIGNAL mux_294_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL mux_423_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL mux_295_nl : STD_LOGIC;
  SIGNAL mux_424_nl : STD_LOGIC;
  SIGNAL mux_425_nl : STD_LOGIC;
  SIGNAL mux_426_nl : STD_LOGIC;
  SIGNAL mux_427_nl : STD_LOGIC;
  SIGNAL mux_428_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL mux1h_746_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_747_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL mux1h_810_nl : STD_LOGIC;
  SIGNAL mux1h_748_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_749_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_430_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_751_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_417_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_753_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_303_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_754_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL mux_304_nl : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL mux1h_755_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_756_nl : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL mux_322_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL mux1h_811_nl : STD_LOGIC;
  SIGNAL mux_305_nl : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL mux_306_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_757_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_758_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_759_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_431_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_432_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_418_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_763_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_307_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_764_nl : STD_LOGIC;
  SIGNAL mux1h_812_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL mux_312_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_813_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_765_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_766_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_767_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_769_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL mux1h_770_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_771_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL mux_314_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_315_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL mux1h_772_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL mux_433_nl : STD_LOGIC;
  SIGNAL mux_434_nl : STD_LOGIC;
  SIGNAL mux_435_nl : STD_LOGIC;
  SIGNAL mux_436_nl : STD_LOGIC;
  SIGNAL mux_437_nl : STD_LOGIC;
  SIGNAL mux_317_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL mux_318_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL mux_319_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL mux_438_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_419_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_439_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_777_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_321_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_440_nl : STD_LOGIC;
  SIGNAL mux1h_778_nl : STD_LOGIC;
  SIGNAL mux1h_814_nl : STD_LOGIC;
  SIGNAL mux1h_815_nl : STD_LOGIC;
  SIGNAL mux1h_816_nl : STD_LOGIC;
  SIGNAL mux1h_817_nl : STD_LOGIC;
  SIGNAL mux1h_818_nl : STD_LOGIC;
  SIGNAL mux1h_819_nl : STD_LOGIC;
  SIGNAL mux_441_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL mux1h_779_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL mux_323_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL mux_324_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL mux_325_nl : STD_LOGIC_VECTOR (17 DOWNTO 0);
  SIGNAL mux1h_780_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_824_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux1h_782_nl : STD_LOGIC_VECTOR (28 DOWNTO 0);
  SIGNAL mux1h_820_nl : STD_LOGIC;
  SIGNAL mux1h_821_nl : STD_LOGIC;
  SIGNAL mux1h_783_nl : STD_LOGIC;
  SIGNAL mux1h_784_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mux1h_827_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL mux1h_787_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mux1h_786_nl : STD_LOGIC;
  SIGNAL mux1h_785_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux1h_825_nl : STD_LOGIC;
  SIGNAL mux1h_826_nl : STD_LOGIC;
  SIGNAL mux_326_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL mux1h_788_nl : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL mux_443_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL mux_329_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_331_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  COMPONENT Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : OUT STD_LOGIC;
      Src_rsc_singleport_re_core_sct : OUT STD_LOGIC;
      Src_rsc_singleport_we_core_sct : OUT STD_LOGIC;
      Comp_rsc_singleport_re_core_sct : OUT STD_LOGIC;
      Comp_rsc_singleport_we_core_sct : OUT STD_LOGIC;
      Vga_rsc_singleport_re_core_sct : OUT STD_LOGIC;
      Vga_rsc_singleport_we_core_sct : OUT STD_LOGIC;
      mgc_start_sync_mgc_bsync_vld_vd : IN STD_LOGIC;
      mgc_done_sync_mgc_bsync_rdy_rd_core_sct : OUT STD_LOGIC;
      Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct :
          OUT STD_LOGIC;
      Vga_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      Comp_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      Src_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      nblevels_triosy_mgc_io_sync_ld_core_sct : OUT STD_LOGIC;
      Src_rsc_singleport_oswt : IN STD_LOGIC;
      Src_rsc_singleport_bcwt : OUT STD_LOGIC;
      Src_rsc_singleport_re_core_psct : IN STD_LOGIC;
      Src_rsc_singleport_we_core_psct : IN STD_LOGIC;
      Comp_rsc_singleport_oswt : IN STD_LOGIC;
      Comp_rsc_singleport_bcwt : OUT STD_LOGIC;
      Comp_rsc_singleport_re_core_psct : IN STD_LOGIC;
      Comp_rsc_singleport_we_core_psct : IN STD_LOGIC;
      Vga_rsc_singleport_oswt : IN STD_LOGIC;
      Vga_rsc_singleport_bcwt : OUT STD_LOGIC;
      Vga_rsc_singleport_re_core_psct : IN STD_LOGIC;
      Vga_rsc_singleport_we_core_psct : IN STD_LOGIC;
      mgc_start_sync_mgc_bsync_vld_oswt : IN STD_LOGIC;
      mgc_done_sync_mgc_bsync_rdy_rd_core_psct : IN STD_LOGIC;
      Vga_triosy_mgc_io_sync_ld_core_psct : IN STD_LOGIC;
      Src_rsc_singleport_oswt_pff : IN STD_LOGIC;
      Comp_rsc_singleport_oswt_pff : IN STD_LOGIC;
      Vga_rsc_singleport_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Src_rsc_singleport_re_core_psct
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Src_rsc_singleport_we_core_psct
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_re_core_psct
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_we_core_psct
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Vga_rsc_singleport_re_core_psct
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Vga_rsc_singleport_we_core_psct
      : STD_LOGIC;

  COMPONENT Main_Comp_Decomp_Tot_Main_Fonction_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (137 DOWNTO 0);
      st_cmodel_cumulative_frequency_vinit_1_tr0 : IN STD_LOGIC;
      st_copy_y_2_tr0 : IN STD_LOGIC;
      st_cmodel_cumulative_frequency_vinit_2_tr0 : IN STD_LOGIC;
      st_main_2_tr0 : IN STD_LOGIC;
      st_levels_tr0 : IN STD_LOGIC;
      st_passe_x_tr0 : IN STD_LOGIC;
      st_passe_y_8_tr0 : IN STD_LOGIC;
      st_passe_x_1_tr0 : IN STD_LOGIC;
      st_levels_1_tr0 : IN STD_LOGIC;
      st_passe_x_1_tr0_1 : IN STD_LOGIC;
      st_passe_y_1_8_tr0 : IN STD_LOGIC;
      st_passe_x_1_1_tr0 : IN STD_LOGIC;
      st_levels_2_tr0 : IN STD_LOGIC;
      st_copy_x_1_tr0 : IN STD_LOGIC;
      st_copy_y_1_2_tr0 : IN STD_LOGIC;
      st_copy_x_1_1_tr0 : IN STD_LOGIC;
      st_comp_compress_for_3_tr0 : IN STD_LOGIC;
      st_ModelA_update_for_2_tr0 : IN STD_LOGIC;
      st_comp_compress_for_for_tr0 : IN STD_LOGIC;
      st_comp_compress_for_for_tr1 : IN STD_LOGIC;
      st_comp_compress_for_for_1_tr0 : IN STD_LOGIC;
      st_comp_compress_for_for_1_tr1 : IN STD_LOGIC;
      st_comp_put_bit_plus_pending_for_1_tr0 : IN STD_LOGIC;
      st_comp_put_bit_plus_pending_1_for_1_tr0 : IN STD_LOGIC;
      st_main_4_tr0 : IN STD_LOGIC;
      st_main_4_tr1 : IN STD_LOGIC;
      st_comp_put_bit_plus_pending_2_for_1_tr0 : IN STD_LOGIC;
      st_comp_put_bit_plus_pending_3_for_1_tr0 : IN STD_LOGIC;
      st_copy_y_2_2_tr0 : IN STD_LOGIC;
      st_copy_x_2_1_tr0 : IN STD_LOGIC;
      st_copy_x_2_1_tr1 : IN STD_LOGIC;
      st_dec_decompress_for_1_tr0 : IN STD_LOGIC;
      st_ModelA_getChar_for_3_tr0 : IN STD_LOGIC;
      st_ModelA_update_1_for_2_tr0 : IN STD_LOGIC;
      st_ModelA_getChar_for_5_tr0 : IN STD_LOGIC;
      st_dec_decompress_for_1_7_tr0 : IN STD_LOGIC;
      st_dec_decompress_for_1_for_tr0 : IN STD_LOGIC;
      st_copy_y_3_2_tr0 : IN STD_LOGIC;
      st_copy_x_3_tr0 : IN STD_LOGIC;
      st_copy_x_3_tr1 : IN STD_LOGIC;
      st_main_5_tr0 : IN STD_LOGIC;
      st_hsplit_x_tr0 : IN STD_LOGIC;
      st_hsplit_y_tr0 : IN STD_LOGIC;
      st_inv_wave_Mn_Inv_Wave_Fct_for_1_1_tr0 : IN STD_LOGIC;
      st_hsplit_x_1_tr0 : IN STD_LOGIC;
      st_hsplit_y_1_tr0 : IN STD_LOGIC;
      st_inv_wave_Mn_Inv_Wave_Fct_for_1_2_tr0 : IN STD_LOGIC;
      st_copy_x_4_tr0 : IN STD_LOGIC;
      st_copy_y_4_2_tr0 : IN STD_LOGIC;
      st_copy_x_4_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR
      (137 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_y_2_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_cmodel_cumulative_frequency_vinit_2_tr0
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_levels_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_passe_x_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_passe_x_1_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_levels_1_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_passe_x_1_tr0_1 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_1_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_1_1_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_3_tr0
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr0
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr1
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr0
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr1
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_main_4_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_main_4_tr1 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_y_2_2_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_2_1_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_2_1_tr1 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_tr0
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_3_tr0
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_5_tr0
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_7_tr0
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_for_tr0
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_y_3_2_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_3_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_3_tr1 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_x_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_y_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_inv_wave_Mn_Inv_Wave_Fct_for_1_1_tr0
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_x_1_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_y_1_tr0 : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_inv_wave_Mn_Inv_Wave_Fct_for_1_2_tr0
      : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_4_tr0 : STD_LOGIC;

BEGIN
  -- Default Constant Signal Assignments

  -- Output Reader Assignments
  core_wen <= core_wen_drv;
  Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d <= Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d_drv;

  Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst : Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen_drv,
      Src_rsc_singleport_re_core_sct => Src_rsc_singleport_re_core_sct_reg,
      Src_rsc_singleport_we_core_sct => Src_rsc_singleport_we_core_sct_reg,
      Comp_rsc_singleport_re_core_sct => Comp_rsc_singleport_re_core_sct_reg,
      Comp_rsc_singleport_we_core_sct => Comp_rsc_singleport_we_core_sct_reg,
      Vga_rsc_singleport_re_core_sct => Vga_rsc_singleport_re_core_sct_reg,
      Vga_rsc_singleport_we_core_sct => Vga_rsc_singleport_we_core_sct_reg,
      mgc_start_sync_mgc_bsync_vld_vd => mgc_start_sync_mgc_bsync_vld_vd,
      mgc_done_sync_mgc_bsync_rdy_rd_core_sct => mgc_done_sync_mgc_bsync_rdy_rd_core_sct,
      Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct =>
          Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct,
      Vga_triosy_mgc_io_sync_ld_core_sct => Vga_triosy_mgc_io_sync_ld_core_sct,
      Comp_triosy_mgc_io_sync_ld_core_sct => Comp_triosy_mgc_io_sync_ld_core_sct,
      Src_triosy_mgc_io_sync_ld_core_sct => Src_triosy_mgc_io_sync_ld_core_sct,
      nblevels_triosy_mgc_io_sync_ld_core_sct => nblevels_triosy_mgc_io_sync_ld_core_sct,
      Src_rsc_singleport_oswt => reg_Src_rsc_singleport_iswt0_cse,
      Src_rsc_singleport_bcwt => Src_rsc_singleport_bcwt,
      Src_rsc_singleport_re_core_psct => Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Src_rsc_singleport_re_core_psct,
      Src_rsc_singleport_we_core_psct => Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Src_rsc_singleport_we_core_psct,
      Comp_rsc_singleport_oswt => reg_Comp_rsc_singleport_iswt0_cse,
      Comp_rsc_singleport_bcwt => Comp_rsc_singleport_bcwt,
      Comp_rsc_singleport_re_core_psct => Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_re_core_psct,
      Comp_rsc_singleport_we_core_psct => Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_we_core_psct,
      Vga_rsc_singleport_oswt => reg_Vga_rsc_singleport_iswt0_cse,
      Vga_rsc_singleport_bcwt => Vga_rsc_singleport_bcwt,
      Vga_rsc_singleport_re_core_psct => Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Vga_rsc_singleport_re_core_psct,
      Vga_rsc_singleport_we_core_psct => Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Vga_rsc_singleport_we_core_psct,
      mgc_start_sync_mgc_bsync_vld_oswt => reg_start_sync_mgc_bsync_vld_iswt0_cse,
      mgc_done_sync_mgc_bsync_rdy_rd_core_psct => reg_Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_iswt0_cse,
      Vga_triosy_mgc_io_sync_ld_core_psct => reg_nblevels_triosy_mgc_io_sync_iswt0_cse,
      Src_rsc_singleport_oswt_pff => or_3401_rmff,
      Comp_rsc_singleport_oswt_pff => or_3373_rmff,
      Vga_rsc_singleport_oswt_pff => or_3326_rmff
    );
  Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Src_rsc_singleport_re_core_psct
      <= (fsm_output(12)) OR (fsm_output(14)) OR or_dcpl_72 OR (fsm_output(13)) OR
      (fsm_output(35)) OR (fsm_output(67));
  Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Src_rsc_singleport_we_core_psct
      <= (NOT mux_267_itm) OR or_dcpl_3249;
  Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_re_core_psct
      <= or_dcpl_3338 OR or_dcpl_3335 OR or_dcpl_3333 OR or_dcpl_3331 OR and_dcpl_289;
  Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Comp_rsc_singleport_we_core_psct
      <= or_dcpl_3327 OR or_dcpl_3325 OR or_dcpl_3322 OR or_dcpl_3320;
  Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Vga_rsc_singleport_re_core_psct
      <= or_dcpl_639 OR (fsm_output(122)) OR or_dcpl_3305;
  Main_Comp_Decomp_Tot_Main_Fonction_core_wait_ctrl_inst_Vga_rsc_singleport_we_core_psct
      <= or_dcpl_3303 OR and_dcpl_284 OR (fsm_output(132));

  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst : Main_Comp_Decomp_Tot_Main_Fonction_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen_drv,
      fsm_output => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_fsm_output,
      st_cmodel_cumulative_frequency_vinit_1_tr0 => exit_copy_x_sva,
      st_copy_y_2_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_y_2_tr0,
      st_cmodel_cumulative_frequency_vinit_2_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_cmodel_cumulative_frequency_vinit_2_tr0,
      st_main_2_tr0 => exit_levels_sva_mx0,
      st_levels_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_levels_tr0,
      st_passe_x_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_passe_x_tr0,
      st_passe_y_8_tr0 => exit_passe_y_sva,
      st_passe_x_1_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_passe_x_1_tr0,
      st_levels_1_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_levels_1_tr0,
      st_passe_x_1_tr0_1 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_passe_x_1_tr0_1,
      st_passe_y_1_8_tr0 => exit_passe_y_1_sva,
      st_passe_x_1_1_tr0 => exit_passe_x_1_sva_mx0,
      st_levels_2_tr0 => or_dcpl_81,
      st_copy_x_1_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_1_tr0,
      st_copy_y_1_2_tr0 => exit_copy_y_1_sva,
      st_copy_x_1_1_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_1_1_tr0,
      st_comp_compress_for_3_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_3_tr0,
      st_ModelA_update_for_2_tr0 => exit_ModelA_update_for_sva,
      st_comp_compress_for_for_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr0,
      st_comp_compress_for_for_tr1 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr1,
      st_comp_compress_for_for_1_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr0,
      st_comp_compress_for_for_1_tr1 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr1,
      st_comp_put_bit_plus_pending_for_1_tr0 => exit_comp_put_bit_plus_pending_for_sva,
      st_comp_put_bit_plus_pending_1_for_1_tr0 => exit_comp_put_bit_plus_pending_1_for_sva,
      st_main_4_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_main_4_tr0,
      st_main_4_tr1 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_main_4_tr1,
      st_comp_put_bit_plus_pending_2_for_1_tr0 => exit_comp_put_bit_plus_pending_2_for_sva,
      st_comp_put_bit_plus_pending_3_for_1_tr0 => exit_comp_put_bit_plus_pending_3_for_sva,
      st_copy_y_2_2_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_y_2_2_tr0,
      st_copy_x_2_1_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_2_1_tr0,
      st_copy_x_2_1_tr1 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_2_1_tr1,
      st_dec_decompress_for_1_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_tr0,
      st_ModelA_getChar_for_3_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_3_tr0,
      st_ModelA_update_1_for_2_tr0 => exit_ModelA_update_1_for_sva,
      st_ModelA_getChar_for_5_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_5_tr0,
      st_dec_decompress_for_1_7_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_7_tr0,
      st_dec_decompress_for_1_for_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_for_tr0,
      st_copy_y_3_2_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_y_3_2_tr0,
      st_copy_x_3_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_3_tr0,
      st_copy_x_3_tr1 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_3_tr1,
      st_main_5_tr0 => exit_inv_wave_Mn_Inv_Wave_Fct_for_1_sva_mx0,
      st_hsplit_x_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_x_tr0,
      st_hsplit_y_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_y_tr0,
      st_inv_wave_Mn_Inv_Wave_Fct_for_1_1_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_inv_wave_Mn_Inv_Wave_Fct_for_1_1_tr0,
      st_hsplit_x_1_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_x_1_tr0,
      st_hsplit_y_1_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_y_1_tr0,
      st_inv_wave_Mn_Inv_Wave_Fct_for_1_2_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_inv_wave_Mn_Inv_Wave_Fct_for_1_2_tr0,
      st_copy_x_4_tr0 => Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_4_tr0,
      st_copy_y_4_2_tr0 => exit_copy_y_4_sva,
      st_copy_x_4_1_tr0 => exit_copy_x_4_sva_mx0
    );
  fsm_output <= Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_fsm_output;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_y_2_tr0 <= NOT copy_y_slc_itm;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_cmodel_cumulative_frequency_vinit_2_tr0
      <= (exit_copy_x_sva OR (NOT (z_out_51(4)))) AND cmodel_reset_for_nor_itm;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_levels_tr0 <= NOT (z_out_25(7));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_passe_x_tr0 <= NOT (z_out_4(8));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_passe_x_1_tr0 <= NOT (z_out_40(8));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_levels_1_tr0 <= exit_passe_x_1_sva_mx0
      OR (NOT levels_nand_tmp);
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_passe_x_1_tr0_1 <= NOT (z_out_25(7));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_1_tr0 <= NOT (z_out_4(8));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_1_1_tr0 <= NOT (copy_x_1_acc_3_itm(9));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_3_tr0 <=
      cmodel_m_frozen_1_sva OR exit_ModelA_update_for_sva;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr0 <=
      (NOT((comp_compress_for_c_1_lpi_1_dfm(7)) OR (comp_compress_for_c_1_lpi_1_dfm(6))))
      AND (NOT((comp_compress_for_c_1_lpi_1_dfm(5)) OR (comp_compress_for_c_1_lpi_1_dfm(4))))
      AND (NOT((comp_compress_for_c_1_lpi_1_dfm(3)) OR (comp_compress_for_c_1_lpi_1_dfm(2))
      OR (comp_compress_for_c_1_lpi_1_dfm(1)))) AND (NOT (comp_compress_for_c_1_lpi_1_dfm(0)))
      AND comp_compress_for_c_sg1_2_lpi_1_dfm AND (NOT (z_out_43(17))) AND (NOT((comp_compress_low_1_sva_1(14))
      AND (z_out_44(18)))) AND (z_out_42(17));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_tr1 <=
      (z_out_43(17)) OR (NOT (z_out_42(17))) OR ((comp_compress_low_1_sva_1(14))
      AND (z_out_44(18)));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr0
      <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((comp_compress_for_for_slc_svs AND exit_comp_put_bit_plus_pending_for_sva)
      & ((NOT comp_compress_for_for_slc_svs) OR exit_comp_put_bit_plus_pending_for_sva)),
      exit_comp_put_bit_plus_pending_1_for_sva OR comp_compress_for_for_else_slc_svs);
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_comp_compress_for_for_1_tr1
      <= (NOT exit_comp_put_bit_plus_pending_for_sva) AND comp_compress_for_for_slc_svs;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_main_4_tr0 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(exit_comp_put_bit_plus_pending_2_for_sva
      & exit_comp_put_bit_plus_pending_3_for_sva), comp_compress_low_1_sva_1(14));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_main_4_tr1 <= NOT(exit_comp_put_bit_plus_pending_2_for_sva
      OR (comp_compress_low_1_sva_1(14)));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_y_2_2_tr0 <= NOT copy_y_2_slc_itm;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_2_1_tr0 <= exit_copy_x_2_sva_dfm
      AND cmodel_reset_1_for_nor_itm;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_2_1_tr1 <= exit_copy_x_2_sva_dfm
      AND (NOT cmodel_reset_1_for_nor_itm);
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_tr0 <=
      dec_decompress_for_i_1_sva_1(4);
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_3_tr0 <=
      (NOT ModelA_getChar_for_slc_1_itm) OR cmodel_m_frozen_sva;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_ModelA_getChar_for_5_tr0 <=
      ModelA_getChar_for_slc_1_itm OR (NOT ModelA_getChar_for_slc_itm);
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_7_tr0
      <= dec_decompress_for_1_and_tmp;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_dec_decompress_for_1_for_tr0
      <= (NOT (z_out_43(17))) AND (z_out_42(17)) AND (NOT((z_out_44(18)) AND (dec_decompress_low_sva_1(14))));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_y_3_2_tr0 <= NOT copy_y_3_slc_itm;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_3_tr0 <= or_dcpl_2024
      AND or_dcpl_2023;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_3_tr1 <= or_dcpl_2024
      AND and_dcpl_198;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_x_tr0 <= NOT (z_out_52(32));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_y_tr0 <= NOT (z_out_53(32));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_inv_wave_Mn_Inv_Wave_Fct_for_1_1_tr0
      <= NOT inv_wave_Mn_Inv_Wave_Fct_for_1_nand_tmp;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_x_1_tr0 <= NOT (z_out_52(32));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_hsplit_y_1_tr0 <= NOT (z_out_53(32));
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_inv_wave_Mn_Inv_Wave_Fct_for_1_2_tr0
      <= (NOT inv_wave_Mn_Inv_Wave_Fct_for_1_nand_svs) OR exit_copy_x_4_sva_mx0;
  Main_Comp_Decomp_Tot_Main_Fonction_core_fsm_inst_st_copy_x_4_tr0 <= NOT (z_out_23(32));

  Src_rsc_singleport_data_out_mxwt <= MUX_v_8_2_2(Src_rsc_singleport_data_out & Src_rsc_singleport_data_out_bfwt,
      Src_rsc_singleport_bcwt);
  Comp_rsc_singleport_data_out_mxwt <= MUX_v_8_2_2(Comp_rsc_singleport_data_out &
      Comp_rsc_singleport_data_out_bfwt, Comp_rsc_singleport_bcwt);
  Vga_rsc_singleport_data_out_mxwt <= MUX_v_8_2_2(Vga_rsc_singleport_data_out & Vga_rsc_singleport_data_out_bfwt,
      Vga_rsc_singleport_bcwt);
  or_2695_cse <= (or_dcpl_81 AND (fsm_output(33))) OR ((fsm_output(38)) AND (NOT
      (copy_x_1_acc_3_itm(9))));
  or_3326_rmff <= or_dcpl_3303 OR and_dcpl_284 OR (fsm_output(132)) OR (fsm_output(120))
      OR or_dcpl_2494 OR or_dcpl_3305;
  or_3373_rmff <= or_dcpl_3338 OR or_dcpl_3335 OR or_dcpl_3333 OR (fsm_output(108))
      OR or_dcpl_669 OR (fsm_output(36)) OR (fsm_output(68)) OR (fsm_output(5)) OR
      or_dcpl_3325 OR or_dcpl_3322 OR or_dcpl_3320 OR and_dcpl_289;
  or_3401_rmff <= (NOT mux_267_itm) OR or_dcpl_3248 OR (fsm_output(28)) OR (fsm_output(29))
      OR (fsm_output(12)) OR (fsm_output(14)) OR or_dcpl_2651 OR or_dcpl_1257;
  or_5990_cse <= (fsm_output(47)) OR (fsm_output(90));
  or_3423_cse <= or_dcpl_3403 OR or_dcpl_1328;
  or_3427_cse <= or_dcpl_3407 OR or_dcpl_1244;
  div_mgc_div_b <= TO_STDLOGICVECTOR('0') & reg_div_mgc_div_b_tmp_1;
  or_3431_ssc <= or_dcpl_3385 OR (fsm_output(48)) OR (fsm_output(52));
  div_mgc_div_a <= reg_div_mgc_div_a_tmp & reg_div_mgc_div_a_tmp_1;
  or_5942_cse <= (fsm_output(111)) OR (fsm_output(112));
  or_5943_cse <= (fsm_output(113)) OR (fsm_output(114));
  or_5964_cse <= (fsm_output(13)) OR (fsm_output(14));
  and_568_cse <= (NOT(comp_compress_for_for_else_slc_svs OR comp_compress_for_for_slc_svs))
      AND (fsm_output(60));
  and_570_cse <= comp_compress_for_for_slc_svs AND (fsm_output(60));
  or_5991_cse <= or_dcpl_3385 OR or_dcpl_596 OR or_dcpl_3508 OR or_dcpl_1314 OR or_dcpl_3502
      OR or_dcpl_1308 OR or_dcpl_3553 OR (fsm_output(40)) OR (fsm_output(45)) OR
      (comp_compress_for_for_and_2_itm AND (fsm_output(60)));
  or_3734_cse <= or_dcpl_3385 OR or_dcpl_596 OR or_dcpl_3508 OR or_dcpl_1314 OR or_dcpl_3502
      OR or_dcpl_1308 OR or_dcpl_3552 OR or_dcpl_736;
  or_3864_tmp <= (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(1)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(3))
      OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(4)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(5))
      OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(6)) OR reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp
      OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(2)) OR (NOT (z_out_50(22)));
  nor_110_cse <= NOT((reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(4)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(5)));
  and_349_ssc <= (NOT((reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(1)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(3))))
      AND nor_110_cse AND (NOT((reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(6)) OR
      reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(2))));
  or_3870_cse <= or_dcpl_3502 OR or_dcpl_1308;
  and_355_ssc <= (NOT((reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(1)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(3))))
      AND (NOT((reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(4)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(5))))
      AND (NOT((reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(6)) OR reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp
      OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(2))));
  comp_m_output_m_Mask_1_lpi_2_dfm_1 <= TO_STDLOGICVECTOR(reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp)
      & reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1;
  or_3895_tmp <= (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(1)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(3))
      OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(4)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(5))
      OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(6)) OR reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp
      OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(2)) OR (NOT (z_out_50(22)));
  or_3913_tmp <= (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(2)) OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(3))
      OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(4)) OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(5))
      OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(6)) OR reg_comp_m_output_m_Mask_2_lpi_dfm_tmp
      OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(1)) OR (NOT (z_out_50(22)));
  and_361_ssc <= (NOT((reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(2)) OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(3))))
      AND (NOT((reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(4)) OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(5))))
      AND (NOT((reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(6)) OR reg_comp_m_output_m_Mask_2_lpi_dfm_tmp
      OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(1))));
  or_3927_tmp <= (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(1)) OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(2))
      OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(3)) OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(4))
      OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5)) OR reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp
      OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(0)) OR (NOT (z_out_50(22)));
  and_367_ssc <= (NOT((reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(1)) OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(2))))
      AND (NOT((reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(3)) OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(4))))
      AND (NOT((reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5)) OR reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp
      OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(0))));
  and_691_cse <= (NOT unequal_tmp_8) AND (fsm_output(73));
  and_454_cse <= ((dec_m_input_m_LastMask_sva(1)) OR (dec_m_input_m_LastMask_sva(2))
      OR (dec_m_input_m_LastMask_sva(3)) OR (dec_m_input_m_LastMask_sva(4)) OR (dec_m_input_m_LastMask_sva(5))
      OR (dec_m_input_m_LastMask_sva(6)) OR (dec_m_input_m_LastMask_sva(7)) OR (NOT
      (dec_m_input_m_LastMask_sva(0)))) AND (fsm_output(72));
  and_462_cse <= (NOT((dec_m_input_m_LastMask_sva(1)) OR (dec_m_input_m_LastMask_sva(2))
      OR (dec_m_input_m_LastMask_sva(3)))) AND (NOT((dec_m_input_m_LastMask_sva(4))
      OR (dec_m_input_m_LastMask_sva(5)))) AND (NOT((dec_m_input_m_LastMask_sva(6))
      OR (dec_m_input_m_LastMask_sva(7)))) AND (dec_m_input_m_LastMask_sva(0)) AND
      (fsm_output(72));
  and_716_cse <= (NOT ModelA_getChar_for_slc_1_itm) AND (fsm_output(89));
  or_4268_cse <= or_dcpl_3403 OR or_dcpl_3520 OR or_dcpl_4210 OR or_dcpl_4208 OR
      or_dcpl_3951 OR or_dcpl_3225 OR or_dcpl_677 OR (fsm_output(90)) OR or_dcpl_4056;
  and_664_cse <= dec_decompress_for_1_for_nor_cse AND (fsm_output(97));
  and_665_cse <= dec_decompress_for_1_for_and_1_cse AND (fsm_output(97));
  and_666_cse <= (z_out_43(17)) AND (fsm_output(97));
  or_5020_tmp <= (dec_m_input_m_LastMask_lpi_3(1)) OR (dec_m_input_m_LastMask_lpi_3(2))
      OR (dec_m_input_m_LastMask_lpi_3(3)) OR (dec_m_input_m_LastMask_lpi_3(4)) OR
      (dec_m_input_m_LastMask_lpi_3(5)) OR (dec_m_input_m_LastMask_lpi_3(6)) OR (dec_m_input_m_LastMask_lpi_3(7))
      OR (NOT (dec_m_input_m_LastMask_lpi_3(0)));
  and_479_ssc <= (NOT((dec_m_input_m_LastMask_lpi_3(1)) OR (dec_m_input_m_LastMask_lpi_3(2))))
      AND (NOT((dec_m_input_m_LastMask_lpi_3(3)) OR (dec_m_input_m_LastMask_lpi_3(4))))
      AND (NOT((dec_m_input_m_LastMask_lpi_3(5)) OR (dec_m_input_m_LastMask_lpi_3(6))))
      AND (NOT (dec_m_input_m_LastMask_lpi_3(7))) AND (dec_m_input_m_LastMask_lpi_3(0));
  or_5090_cse <= or_dcpl_3403 OR or_dcpl_3520 OR or_dcpl_4210 OR or_dcpl_4208 OR
      or_dcpl_3951 OR or_dcpl_3225 OR or_dcpl_4998 OR or_dcpl_4056;
  copy_x_3_and_8_tmp <= inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1 AND (z_out_45(33))
      AND (NOT exit_inv_wave_Mn_Inv_Wave_Fct_for_sva);
  and_755_cse <= exit_inv_wave_Mn_Inv_Wave_Fct_for_sva AND (fsm_output(103));
  and_508_tmp <= and_dcpl_198 AND (NOT((z_out_25(7)) AND (z_out_4(8))));
  nor_90_cse <= NOT((fsm_output(103)) OR (fsm_output(90)));
  or_5242_cse <= or_dcpl_3407 OR or_dcpl_3472 OR (fsm_output(98)) OR (fsm_output(97))
      OR (fsm_output(109)) OR or_dcpl_3331 OR (fsm_output(103)) OR (fsm_output(127))
      OR (fsm_output(130)) OR or_dcpl_664 OR (fsm_output(111)) OR or_dcpl_2439 OR
      (fsm_output(114)) OR or_dcpl_655 OR or_dcpl_3767 OR (fsm_output(102)) OR (fsm_output(123))
      OR (fsm_output(124)) OR or_dcpl_2527 OR (fsm_output(101)) OR or_dcpl_2569 OR
      or_dcpl_3752 OR or_dcpl_5178 OR or_dcpl_3905 OR (fsm_output(104)) OR or_dcpl_3164;
  or_5392_cse <= or_dcpl_5333 OR or_dcpl_5330 OR or_dcpl_3303 OR or_dcpl_3202 OR
      or_dcpl_5318 OR or_dcpl_5315 OR or_dcpl_5311 OR or_dcpl_634 OR (fsm_output(104));
  and_861_m1c <= (NOT exit_inv_wave_Mn_Inv_Wave_Fct_for_sva) AND (fsm_output(103));
  and_864_m1c <= (z_out_45(33)) AND and_861_m1c;
  and_769_cse <= (NOT inv_wave_Mn_Inv_Wave_Fct_for_1_nand_svs) AND (fsm_output(135));
  and_770_cse <= inv_wave_Mn_Inv_Wave_Fct_for_1_nand_svs AND (fsm_output(135));
  and_863_cse <= (NOT (z_out_45(33))) AND and_861_m1c;
  or_6014_cse <= and_863_cse OR and_755_cse OR ((NOT inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1)
      AND and_864_m1c);
  and_866_cse <= inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1 AND and_864_m1c;
  or_5768_cse <= or_dcpl_5333 OR or_dcpl_5330 OR or_dcpl_3303 OR or_dcpl_5412 OR
      or_dcpl_5408 OR or_dcpl_2527 OR (fsm_output(107)) OR or_dcpl_3173 OR or_dcpl_5178;
  or_5849_cse <= (fsm_output(131)) OR (fsm_output(127)) OR (fsm_output(130)) OR (fsm_output(128))
      OR (fsm_output(132)) OR (fsm_output(133)) OR (fsm_output(123)) OR or_dcpl_647
      OR (fsm_output(126)) OR (fsm_output(120)) OR or_dcpl_2494 OR or_dcpl_3909;
  dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx0w0 <= (z_out_44(18)) AND (dec_decompress_low_sva_1(14));
  dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx1 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx0w0
      & dec_decompress_for_1_for_else_else_land_lpi_2_dfm), or_dcpl_1897);
  div_mgc_div_1_b_mx1 <= MUX_v_32_2_2(ModelA_getChar_for_if_p_count_sva & ModelA_getChar_for_if_p_count_lpi_1,
      ModelA_getChar_for_not_sxt);
  dec_decompress_for_1_scaled_value_acc_mut_mx0w2 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(SIGNED(z_out_29),
      67) + CONV_SIGNED(CONV_SIGNED('1', 1), 67), 67));
  exit_levels_sva_mx0 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT (readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(TO_STDLOGICVECTOR('1')
      & (NOT (nblevels_1_sva(2 DOWNTO 0)))) + CONV_SIGNED(CONV_UNSIGNED('1', 1),
      4), 4)), 3))) & (NOT (readindex(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED(trans_ond_Mn_Trans_Ond_i_1_sg1_sva_1
      & STD_LOGIC_VECTOR'("01")), 6) + CONV_SIGNED(SIGNED(TO_STDLOGICVECTOR('1')
      & (NOT (nblevels_1_sva(2 DOWNTO 0))) & TO_STDLOGICVECTOR('1')), 6), 6)), 5)))),
      fsm_output(39));
  trans_ond_Trans_Ond_x_1_sva_mx0 <= trans_ond_Trans_Ond_x_1_sva AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
      (fsm_output(10)), 1),8));
  passe_y_acc_43_sdt_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(trans_ond_Trans_Ond_y_1_sva),
      8) + CONV_UNSIGNED(UNSIGNED(trans_ond_Trans_Ond_x_1_sva(7 DOWNTO 6)), 8), 8));
  trans_ond_image_copy_1_y_1_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED(trans_ond_image_copy_1_y_1_sva(6
      DOWNTO 0)), 8) + CONV_SIGNED(CONV_UNSIGNED('1', 1), 8), 8));
  levels_nand_tmp <= NOT((nblevels_1_sva(0)) AND (UNSIGNED(trans_ond_Mn_Trans_Ond_i_1_sg1_sva_2)
      = UNSIGNED(nblevels_1_sva(2 DOWNTO 1))));
  exit_passe_x_1_sva_mx0 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT (z_out_31(6))) & (NOT
      (z_out_32(7)))), fsm_output(32));
  trans_ond_Trans_Ond_1_y_1_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(trans_ond_Trans_Ond_1_y_1_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED('1', 1), 6), 6));
  passe_y_1_acc_45_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(trans_ond_Trans_Ond_1_y_1_sva
      & TO_STDLOGICVECTOR('1')), 8) + CONV_UNSIGNED(UNSIGNED'(trans_ond_Mn_Trans_Ond_hi_7_sg7_sva
      & trans_ond_Mn_Trans_Ond_hi_7_sg6_sva & trans_ond_Mn_Trans_Ond_hi_7_sg5_sva
      & trans_ond_Mn_Trans_Ond_hi_7_sg4_sva & trans_ond_Mn_Trans_Ond_hi_7_sg3_sva
      & trans_ond_Mn_Trans_Ond_hi_7_sg2_sva & (trans_ond_Trans_Ond_1_x_1_sva(6))),
      8), 8));
  passe_y_1_acc_43_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(trans_ond_Trans_Ond_1_y_1_sva
      & TO_STDLOGICVECTOR('1')), 10) + CONV_UNSIGNED(UNSIGNED(trans_ond_Trans_Ond_1_y_1_sva
      & STD_LOGIC_VECTOR'("00") & TO_STDLOGICVECTOR(trans_ond_Trans_Ond_1_x_1_sva(6))),
      10), 10));
  passe_y_1_acc_psp_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_35(7
      DOWNTO 2)), 8) + CONV_UNSIGNED(UNSIGNED(trans_ond_Trans_Ond_1_y_1_sva & TO_STDLOGICVECTOR('1')),
      8), 8));
  copy_y_1_acc_psp_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_8(7
      DOWNTO 2)), 8) + UNSIGNED(trans_ond_image_copy_1_y_1_sva), 8));
  trans_ond_image_copy_1_x_1_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED(trans_ond_image_copy_1_x_1_sva_2),
      9) + CONV_SIGNED(CONV_UNSIGNED('1', 1), 9), 9));
  trans_ond_Mn_Trans_Ond_i_1_sg1_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED(trans_ond_Mn_Trans_Ond_i_1_sg1_sva_2),
      3) + CONV_SIGNED(CONV_UNSIGNED('1', 1), 3), 3));
  comp_compress_for_c_sg1_2_lpi_1_dfm_1 <= (NOT comp_getByte_slc_mdf_sva) OR comp_compress_for_and_tmp;
  comp_compress_for_c_1_lpi_1_dfm_1 <= comp_getByte_Compressor_getByte_return_1_lpi_1_dfm
      AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT comp_compress_for_and_tmp,
      1),8));
  comp_compress_for_and_tmp <= (NOT comp_getByte_slc_mdf_sva) AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(7))
      AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(6)) AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(5))
      AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(4)) AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(3))
      AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(2)) AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(1))
      AND (comp_getByte_Compressor_getByte_return_1_lpi_1_dfm(0));
  comp_getByte_Compressor_getByte_return_1_lpi_1_dfm <= Comp_rsc_singleport_data_out_mxwt
      OR STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT comp_getByte_slc_mdf_sva, 1),8));
  ModelA_update_acc_2 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED(cmodel_cumulative_frequency_rsc_singleport_data_out),
      33) + CONV_SIGNED(SIGNED'("100000000000001"), 33), 33));
  unequal_tmp_10 <= (comp_m_output_m_Mask_1_lpi_2(7)) OR (comp_m_output_m_Mask_1_lpi_2(6))
      OR (comp_m_output_m_Mask_1_lpi_2(5)) OR (comp_m_output_m_Mask_1_lpi_2(4)) OR
      (comp_m_output_m_Mask_1_lpi_2(3)) OR (comp_m_output_m_Mask_1_lpi_2(2)) OR (comp_m_output_m_Mask_1_lpi_2(1));
  comp_m_output_index_range_lpi_2_dfm_1_mx1w0 <= MUX_v_32_2_2(z_out_1 & comp_m_output_index_range_lpi_2,
      (comp_m_output_m_Mask_1_lpi_2(2)) OR (comp_m_output_m_Mask_1_lpi_2(3)) OR (comp_m_output_m_Mask_1_lpi_2(4))
      OR (comp_m_output_m_Mask_1_lpi_2(5)) OR (comp_m_output_m_Mask_1_lpi_2(6)) OR
      (comp_m_output_m_Mask_1_lpi_2(7)) OR (comp_m_output_m_Mask_1_lpi_2(1)) OR (NOT
      (z_out_50(22))));
  and_343_ssc <= (NOT((comp_m_output_m_Mask_1_lpi_2(2)) OR (comp_m_output_m_Mask_1_lpi_2(3))))
      AND (NOT((comp_m_output_m_Mask_1_lpi_2(4)) OR (comp_m_output_m_Mask_1_lpi_2(5))))
      AND (NOT((comp_m_output_m_Mask_1_lpi_2(6)) OR (comp_m_output_m_Mask_1_lpi_2(7))
      OR (comp_m_output_m_Mask_1_lpi_2(1))));
  and_587_itm <= (comp_m_output_m_Mask_1_lpi_2(7 DOWNTO 1)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
      and_343_ssc, 1),7));
  comp_m_output_m_NextByte_1_sva_4 <= comp_m_output_m_NextByte_1_lpi_2 OR comp_m_output_m_Mask_1_lpi_2;
  comp_m_output_m_NextByte_1_sva_2 <= comp_m_output_m_NextByte_1_lpi_2_dfm OR (TO_STDLOGICVECTOR(reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp)
      & reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1);
  comp_m_output_index_range_lpi_dfm_1_mx1w0 <= MUX_v_32_2_2(z_out_1 & comp_m_output_index_range_lpi_2,
      or_tmp_12 OR unequal_tmp_6);
  comp_m_output_m_NextByte_1_sva_8 <= comp_m_output_m_NextByte_1_lpi_dfm OR (TO_STDLOGICVECTOR(reg_comp_m_output_m_Mask_2_lpi_dfm_tmp)
      & reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1);
  dec_m_input_m_CurrentByte_1_sva_mx1 <= MUX_v_8_2_2(Comp_rsc_singleport_data_out_mxwt
      & dec_m_input_m_CurrentByte_1_sva, unequal_tmp_8);
  dec_decompress_value_3_sva_2 <= ((dec_m_input_m_CurrentByte_1_sva_mx1(7)) AND (dec_m_input_m_LastMask_sva_dfm(7)))
      OR ((dec_m_input_m_CurrentByte_1_sva_mx1(6)) AND (dec_m_input_m_LastMask_sva_dfm(6)))
      OR ((dec_m_input_m_CurrentByte_1_sva_mx1(5)) AND (dec_m_input_m_LastMask_sva_dfm(5)))
      OR ((dec_m_input_m_CurrentByte_1_sva_mx1(4)) AND (dec_m_input_m_LastMask_sva_dfm(4)))
      OR ((dec_m_input_m_CurrentByte_1_sva_mx1(3)) AND (dec_m_input_m_LastMask_sva_dfm(3)))
      OR ((dec_m_input_m_CurrentByte_1_sva_mx1(2)) AND (dec_m_input_m_LastMask_sva_dfm(2)))
      OR ((dec_m_input_m_CurrentByte_1_sva_mx1(1)) AND (dec_m_input_m_LastMask_sva_dfm(1)))
      OR ((dec_m_input_m_CurrentByte_1_sva_mx1(0)) AND (dec_m_input_m_LastMask_sva_dfm(0)));
  dec_m_input_m_CurrentByte_1_lpi_3_mx1 <= MUX_v_8_2_2(Comp_rsc_singleport_data_out_mxwt
      & dec_m_input_m_CurrentByte_1_lpi_3, unequal_tmp_9);
  dec_decompress_for_1_scaled_value_acc_4_sdt <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED'(dec_decompress_value_1_sg14_sva_1_sg17
      & dec_decompress_value_1_sg14_sva_1_sg16 & dec_decompress_value_1_sg14_sva_1_sg15
      & dec_decompress_value_1_sg14_sva_1_sg14 & dec_decompress_value_1_sg14_sva_1_sg13
      & dec_decompress_value_1_sg14_sva_1_sg12 & dec_decompress_value_1_sg14_sva_1_sg11
      & dec_decompress_value_1_sg14_sva_1_sg10 & dec_decompress_value_1_sg14_sva_1_sg9
      & dec_decompress_value_1_sg14_sva_1_sg8 & dec_decompress_value_1_sg14_sva_1_sg7
      & dec_decompress_value_1_sg14_sva_1_sg6 & dec_decompress_value_1_sg14_sva_1_sg5
      & dec_decompress_value_1_sg14_sva_1_sg4 & dec_decompress_value_1_sg14_sva_1_sg3
      & dec_decompress_value_1_sg14_sva_1_sg2 & dec_decompress_value_1_sg14_sva_1_sg1
      & dec_decompress_value_1_sg14_sva_6 & dec_decompress_value_1_sg13_sva_1 & dec_decompress_value_1_sg12_sva_1
      & dec_decompress_value_1_sg11_sva_1 & dec_decompress_value_1_sg10_sva_1 & dec_decompress_value_1_sg9_sva_1
      & dec_decompress_value_1_sg8_sva_1 & dec_decompress_value_1_sg7_sva_1 & dec_decompress_value_1_sg6_sva_1
      & dec_decompress_value_1_sg5_sva_1 & dec_decompress_value_1_sg4_sva_1 & dec_decompress_value_1_sg3_sva_1
      & dec_decompress_value_1_sg2_sva_1 & dec_decompress_value_1_sg1_sva_1 & dec_decompress_value_3_sva_1),
      33) + CONV_UNSIGNED(UNSIGNED(STD_LOGIC_VECTOR'("11111111111111111") & (NOT
      dec_decompress_low_sva_5)), 33), 33));
  ModelA_getChar_for_if_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR('1')
      & dec_decompress_for_1_scaled_value_sva & TO_STDLOGICVECTOR('1')) + CONV_UNSIGNED(UNSIGNED((NOT
      cmodel_cumulative_frequency_rsc_singleport_data_out) & TO_STDLOGICVECTOR('1')),
      34), 34));
  trans_ond_image_copy_3_y_1_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(trans_ond_image_copy_3_y_1_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED('1', 1), 8), 8));
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
  dec_decompress_for_1_for_nor_cse <= NOT((z_out_42(17)) OR (z_out_43(17)));
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
  dec_decompress_for_1_for_and_1_cse <= (z_out_42(17)) AND (NOT (z_out_43(17)));
  dec_decompress_high_1_sva_1_dfm_sg1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(dec_decompress_high_1_sva_1(30
      DOWNTO 14)) + CONV_UNSIGNED(CONV_SIGNED('1', 1), 17), 17));
  inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1 <= (z_out_4(8)) AND (z_out_25(7));
  inv_wave_Mn_Inv_Wave_Fct_for_and_22_itm <= inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva
      AND (NOT inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1);
  exit_inv_wave_Mn_Inv_Wave_Fct_for_1_sva_mx0 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
      (z_out_23(32))) & (NOT (z_out_45(33)))), fsm_output(135));
  hsplit_x_and_cse_sva_1 <= (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(29)) AND inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva;
  inv_wave_Inv_Wave_x_sva_mx0 <= inv_wave_Inv_Wave_x_sva AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
      (fsm_output(106)), 1),9));
  hsplit_y_and_4_cse_sva <= inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg29_sva_dfm_2 AND inv_wave_Mn_Inv_Wave_Fct_for_1_slc_2_mdf_sva;
  inv_wave_Mn_Inv_Wave_Fct_for_1_nand_tmp <= NOT((inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva_dfm_2(0))
      AND (UNSIGNED(inv_wave_Mn_Inv_Wave_Fct_i_2_sg1_sva) = UNSIGNED(inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva_dfm_2(31
      DOWNTO 1))));
  hsplit_x_1_and_cse_sva_1 <= (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(28)) AND
      inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_mdf_sva;
  inv_wave_Inv_Wave_1_x_sva_mx0 <= inv_wave_Inv_Wave_1_x_sva AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
      (fsm_output(118)), 1),9));
  hsplit_y_1_and_4_cse_sva <= inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg28_sva_dfm_2 AND
      inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_1_mdf_sva;
  exit_copy_x_4_sva_mx0 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT (z_out_23(32))) & (NOT
      (z_out_45(33)))), fsm_output(134));
  dec_decompress_for_1_and_tmp <= (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(8)) AND (NOT((ModelA_getChar_for_i_1_lpi_1_dfm_mx0(7))
      OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(6)) OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(5))
      OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(4)) OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(3))
      OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(2)) OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(1))
      OR (ModelA_getChar_for_i_1_lpi_1_dfm_mx0(0))));
  or_dcpl_36 <= (fsm_output(11)) OR (fsm_output(13));
  or_dcpl_39 <= (fsm_output(18)) OR (fsm_output(15));
  or_dcpl_43 <= (fsm_output(16)) OR (fsm_output(17));
  or_dcpl_53 <= (fsm_output(27)) OR (fsm_output(28));
  or_dcpl_72 <= (fsm_output(4)) OR (fsm_output(11));
  or_dcpl_81 <= NOT(levels_nand_svs AND passe_x_acc_3_cse_sg1);
  or_dcpl_90 <= (fsm_output(25)) OR (fsm_output(26));
  or_dcpl_121 <= (fsm_output(38)) OR (fsm_output(33));
  or_dcpl_260 <= (fsm_output(15)) OR (fsm_output(12));
  or_dcpl_594 <= (fsm_output(53)) OR (fsm_output(46));
  or_dcpl_596 <= (fsm_output(48)) OR (fsm_output(47));
  or_dcpl_597 <= (fsm_output(49)) OR (fsm_output(50));
  or_dcpl_633 <= (fsm_output(104)) OR (fsm_output(135));
  or_dcpl_634 <= (fsm_output(129)) OR (fsm_output(105));
  or_dcpl_637 <= (fsm_output(119)) OR (fsm_output(118));
  or_dcpl_639 <= (fsm_output(120)) OR (fsm_output(121));
  or_dcpl_647 <= (fsm_output(124)) OR (fsm_output(125));
  or_dcpl_655 <= (fsm_output(132)) OR (fsm_output(133));
  or_dcpl_658 <= (fsm_output(114)) OR (fsm_output(88));
  or_dcpl_664 <= (fsm_output(117)) OR (fsm_output(128));
  or_dcpl_666 <= (fsm_output(99)) OR (fsm_output(127));
  or_dcpl_669 <= (fsm_output(110)) OR (fsm_output(131));
  or_dcpl_671 <= (fsm_output(97)) OR (fsm_output(109));
  or_dcpl_677 <= (fsm_output(74)) OR (fsm_output(82));
  or_dcpl_678 <= (fsm_output(95)) OR (fsm_output(96));
  or_dcpl_683 <= (fsm_output(84)) OR (fsm_output(89));
  or_dcpl_687 <= (fsm_output(85)) OR (fsm_output(87));
  or_dcpl_693 <= (fsm_output(63)) OR (fsm_output(65));
  or_dcpl_736 <= (fsm_output(60)) OR (fsm_output(45));
  or_dcpl_741 <= (fsm_output(55)) OR (fsm_output(59));
  or_dcpl_996 <= (fsm_output(36)) OR (fsm_output(68));
  or_dcpl_1017 <= (fsm_output(52)) OR (fsm_output(73));
  or_dcpl_1038 <= (fsm_output(8)) OR (fsm_output(39));
  or_dcpl_1040 <= (fsm_output(66)) OR (fsm_output(62));
  or_dcpl_1244 <= (fsm_output(94)) OR (fsm_output(95));
  or_dcpl_1245 <= (fsm_output(91)) OR (fsm_output(93));
  or_dcpl_1251 <= (fsm_output(73)) OR (fsm_output(72));
  or_dcpl_1257 <= (fsm_output(35)) OR (fsm_output(67));
  or_dcpl_1271 <= (fsm_output(88)) OR (fsm_output(83));
  or_dcpl_1278 <= (fsm_output(98)) OR (fsm_output(74));
  or_dcpl_1285 <= (fsm_output(87)) OR (fsm_output(84));
  or_dcpl_1308 <= (fsm_output(58)) OR (fsm_output(56));
  or_dcpl_1310 <= (fsm_output(57)) OR (fsm_output(55));
  or_dcpl_1314 <= (fsm_output(42)) OR (fsm_output(44));
  or_dcpl_1328 <= (fsm_output(75)) OR (fsm_output(79));
  or_dcpl_1331 <= (fsm_output(76)) OR (fsm_output(77));
  or_dcpl_1339 <= (fsm_output(20)) OR (fsm_output(31));
  or_dcpl_1355 <= (fsm_output(82)) OR (fsm_output(97));
  or_dcpl_1402 <= (fsm_output(83)) OR (fsm_output(86));
  or_dcpl_1427 <= (fsm_output(92)) OR (fsm_output(94));
  or_dcpl_1429 <= (fsm_output(89)) OR (fsm_output(91));
  or_dcpl_1460 <= (fsm_output(80)) OR (fsm_output(81));
  or_dcpl_1897 <= (z_out_43(17)) OR (NOT (z_out_42(17)));
  and_dcpl_198 <= (NOT exit_inv_wave_Mn_Inv_Wave_Fct_for_sva) AND (z_out_45(33));
  or_dcpl_2023 <= exit_inv_wave_Mn_Inv_Wave_Fct_for_sva OR (NOT (z_out_45(33)));
  or_dcpl_2024 <= exit_copy_x_3_sva OR (NOT (z_out_51(4)));
  or_dcpl_2058 <= (fsm_output(118)) OR (fsm_output(134));
  or_dcpl_2059 <= (fsm_output(122)) OR (fsm_output(119));
  or_dcpl_2070 <= (fsm_output(115)) OR (fsm_output(116));
  or_dcpl_2081 <= (fsm_output(109)) OR (fsm_output(108));
  or_dcpl_2439 <= (fsm_output(112)) OR (fsm_output(113));
  or_dcpl_2494 <= (fsm_output(121)) OR (fsm_output(122));
  or_dcpl_2527 <= (fsm_output(125)) OR (fsm_output(126));
  or_dcpl_2537 <= (fsm_output(123)) OR (fsm_output(124));
  or_dcpl_2569 <= (fsm_output(107)) OR (fsm_output(120));
  or_dcpl_2610 <= (fsm_output(97)) OR (fsm_output(137));
  or_dcpl_2626 <= (fsm_output(26)) OR (fsm_output(23)) OR (fsm_output(24));
  or_dcpl_2643 <= (fsm_output(10)) OR (fsm_output(19));
  or_dcpl_2651 <= or_dcpl_72 OR (fsm_output(13));
  or_dcpl_3160 <= (fsm_output(3)) OR (fsm_output(6));
  or_dcpl_3164 <= (fsm_output(135)) OR (fsm_output(136));
  or_dcpl_3173 <= or_dcpl_639 OR or_dcpl_2059;
  or_dcpl_3175 <= (fsm_output(86)) OR (fsm_output(45));
  or_dcpl_3198 <= (fsm_output(106)) OR (fsm_output(102));
  or_dcpl_3202 <= or_dcpl_655 OR or_dcpl_2070;
  or_dcpl_3214 <= (fsm_output(130)) OR (fsm_output(117));
  or_dcpl_3217 <= (fsm_output(131)) OR (fsm_output(103));
  or_dcpl_3220 <= (fsm_output(108)) OR (fsm_output(110));
  or_dcpl_3225 <= or_dcpl_678 OR (fsm_output(98));
  or_dcpl_3233 <= or_dcpl_1245 OR or_dcpl_1427;
  or_dcpl_3236 <= or_dcpl_687 OR or_dcpl_683;
  or_dcpl_3247 <= (fsm_output(28)) OR (fsm_output(29));
  or_dcpl_3248 <= (fsm_output(30)) OR (fsm_output(27));
  or_dcpl_3249 <= or_dcpl_3248 OR or_dcpl_3247;
  or_dcpl_3251 <= (fsm_output(54)) OR (fsm_output(61));
  or_dcpl_3267 <= (fsm_output(64)) OR (fsm_output(71));
  or_dcpl_3274 <= (fsm_output(80)) OR (fsm_output(66));
  and_dcpl_284 <= (fsm_output(90)) AND (NOT dec_decompress_for_1_and_tmp) AND dec_m_output_putByte_slc_svs;
  or_dcpl_3303 <= or_5942_cse OR or_5943_cse;
  or_dcpl_3305 <= ((fsm_output(119)) AND (z_out_53(32))) OR (fsm_output(100));
  or_dcpl_3320 <= or_dcpl_39 OR (fsm_output(101));
  or_dcpl_3322 <= or_dcpl_647 OR (fsm_output(126));
  or_dcpl_3325 <= or_dcpl_43 OR (fsm_output(123));
  or_dcpl_3327 <= or_dcpl_996 OR (fsm_output(5));
  and_dcpl_289 <= (fsm_output(107)) AND (z_out_53(32));
  or_dcpl_3331 <= or_dcpl_3220 OR (fsm_output(131));
  or_dcpl_3333 <= (fsm_output(24)) OR (fsm_output(109));
  or_dcpl_3335 <= or_dcpl_90 OR (fsm_output(23));
  and_dcpl_290 <= (fsm_output(40)) AND (z_out_32(7));
  or_tmp_9 <= (NOT (fsm_output(72))) OR (NOT (dec_m_input_m_LastMask_sva(0))) OR
      (dec_m_input_m_LastMask_sva(7)) OR (dec_m_input_m_LastMask_sva(6)) OR (dec_m_input_m_LastMask_sva(5))
      OR (dec_m_input_m_LastMask_sva(4)) OR (dec_m_input_m_LastMask_sva(3)) OR (dec_m_input_m_LastMask_sva(2))
      OR (dec_m_input_m_LastMask_sva(1));
  mux_265_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT(((dec_decompress_low_sva_1(14))
      AND (z_out_44(18))) OR (NOT (z_out_42(17))) OR (z_out_43(17)) OR (NOT or_tmp_9)))
      & or_tmp_9), (NOT (fsm_output(97))) OR (NOT (dec_m_input_m_LastMask_lpi_3(0)))
      OR (dec_m_input_m_LastMask_lpi_3(7)) OR (dec_m_input_m_LastMask_lpi_3(6)) OR
      (dec_m_input_m_LastMask_lpi_3(5)) OR (dec_m_input_m_LastMask_lpi_3(4)) OR (dec_m_input_m_LastMask_lpi_3(3))
      OR (dec_m_input_m_LastMask_lpi_3(2)) OR (dec_m_input_m_LastMask_lpi_3(1)));
  or_dcpl_3338 <= (NOT (mux_265_nl)) OR and_dcpl_290;
  or_tmp_12 <= (NOT (z_out_50(22))) OR (comp_m_output_m_Mask_1_lpi_2(1)) OR (comp_m_output_m_Mask_1_lpi_2(7))
      OR (comp_m_output_m_Mask_1_lpi_2(6)) OR (comp_m_output_m_Mask_1_lpi_2(5)) OR
      (comp_m_output_m_Mask_1_lpi_2(4)) OR (comp_m_output_m_Mask_1_lpi_2(3)) OR (comp_m_output_m_Mask_1_lpi_2(2));
  and_tmp_3 <= ((NOT (fsm_output(65))) OR (NOT (z_out_50(22))) OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(0))
      OR reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5))
      OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(4)) OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(3))
      OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(2)) OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(1)))
      AND ((NOT (fsm_output(63))) OR (NOT (z_out_50(22))) OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(1))
      OR reg_comp_m_output_m_Mask_2_lpi_dfm_tmp OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(6))
      OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(5)) OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(4))
      OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(3)) OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(2)))
      AND ((NOT (fsm_output(56))) OR (NOT (z_out_50(22))) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(2))
      OR reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(6))
      OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(5)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(4))
      OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(3)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(1)))
      AND ((NOT (fsm_output(58))) OR (NOT (z_out_50(22))) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(2))
      OR reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(6))
      OR (comp_m_output_m_Mask_1_lpi_2_dfm_1(5)) OR (comp_m_output_m_Mask_1_lpi_2_dfm_1(4))
      OR (comp_m_output_m_Mask_1_lpi_2_dfm_1(3)) OR (comp_m_output_m_Mask_1_lpi_2_dfm_1(1)));
  mux_266_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(and_tmp_3 & (((NOT((NOT (z_out_42(17)))
      OR (z_out_43(17)))) OR (NOT (z_out_50(22))) OR (comp_m_output_m_Mask_1_lpi_2(1))
      OR (comp_m_output_m_Mask_1_lpi_2(7)) OR (comp_m_output_m_Mask_1_lpi_2(6)) OR
      (comp_m_output_m_Mask_1_lpi_2(5)) OR (comp_m_output_m_Mask_1_lpi_2(4)) OR (comp_m_output_m_Mask_1_lpi_2(3))
      OR (comp_m_output_m_Mask_1_lpi_2(2))) AND and_tmp_3)), fsm_output(54));
  mux_267_itm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((mux_266_nl) & (or_tmp_12 AND and_tmp_3)),
      fsm_output(61));
  or_dcpl_3385 <= or_dcpl_597 OR (fsm_output(51));
  or_dcpl_3403 <= or_dcpl_1331 OR (fsm_output(78));
  or_dcpl_3407 <= or_dcpl_1245 OR (fsm_output(92));
  and_dcpl_294 <= (fsm_output(73)) AND (dec_decompress_for_i_1_sva_1(4));
  nand_tmp <= NOT((fsm_output(54)) AND (NOT(((z_out_44(18)) AND (comp_compress_low_1_sva_1(14)))
      OR (NOT (z_out_42(17))) OR (z_out_43(17)) OR (NOT((NOT comp_compress_for_c_sg1_2_lpi_1_dfm)
      OR (comp_compress_for_c_1_lpi_1_dfm(0)) OR (comp_compress_for_c_1_lpi_1_dfm(1))
      OR (comp_compress_for_c_1_lpi_1_dfm(2)) OR (comp_compress_for_c_1_lpi_1_dfm(3))
      OR (comp_compress_for_c_1_lpi_1_dfm(4)) OR (comp_compress_for_c_1_lpi_1_dfm(5))
      OR (comp_compress_for_c_1_lpi_1_dfm(6)) OR (comp_compress_for_c_1_lpi_1_dfm(7)))))));
  or_tmp_22 <= ModelA_getChar_for_slc_1_itm OR (NOT nand_tmp);
  or_dcpl_3454 <= or_dcpl_260 OR (fsm_output(14));
  or_dcpl_3458 <= or_dcpl_43 OR (fsm_output(18));
  or_dcpl_3472 <= or_dcpl_1244 OR (fsm_output(96));
  or_dcpl_3502 <= or_dcpl_1310 OR (fsm_output(59));
  or_dcpl_3508 <= or_dcpl_594 OR (fsm_output(43));
  or_dcpl_3520 <= or_dcpl_1328 OR (fsm_output(80));
  and_dcpl_301 <= NOT((fsm_output(8)) OR (fsm_output(39)));
  or_dcpl_3552 <= (fsm_output(54)) OR (fsm_output(52));
  or_dcpl_3553 <= or_dcpl_3552 OR (fsm_output(41));
  and_323_cse <= and_dcpl_301 AND (NOT (fsm_output(54)));
  and_dcpl_307 <= NOT((fsm_output(10)) OR (fsm_output(19)));
  or_dcpl_3689 <= (fsm_output(42)) OR (fsm_output(45));
  or_dcpl_3731 <= (fsm_output(59)) OR (fsm_output(58));
  or_dcpl_3734 <= (fsm_output(53)) OR (fsm_output(57));
  or_dcpl_3752 <= or_dcpl_2494 OR (fsm_output(119));
  or_dcpl_3759 <= (fsm_output(126)) OR (fsm_output(101));
  or_dcpl_3767 <= or_dcpl_2070 OR (fsm_output(106));
  or_dcpl_3776 <= (fsm_output(128)) OR (fsm_output(90)) OR (fsm_output(111));
  or_dcpl_3873 <= (fsm_output(57)) OR (fsm_output(56));
  or_dcpl_3880 <= (fsm_output(62)) OR (fsm_output(64));
  or_dcpl_3890 <= or_dcpl_1040 OR (fsm_output(64));
  or_dcpl_3905 <= (fsm_output(105)) OR (fsm_output(100));
  or_dcpl_3906 <= or_dcpl_3905 OR or_dcpl_633;
  or_dcpl_3907 <= (fsm_output(134)) OR (fsm_output(129));
  or_dcpl_3909 <= or_dcpl_637 OR or_dcpl_3907;
  or_dcpl_3913 <= or_dcpl_2569 OR or_dcpl_2494;
  or_dcpl_3914 <= (fsm_output(86)) OR (fsm_output(70));
  or_dcpl_3916 <= or_dcpl_3759 OR (fsm_output(67));
  or_dcpl_3922 <= (fsm_output(68)) OR (fsm_output(123)) OR or_dcpl_647;
  or_dcpl_3925 <= (fsm_output(133)) OR (fsm_output(115)) OR (fsm_output(116));
  or_dcpl_3930 <= or_dcpl_658 OR (fsm_output(83)) OR (fsm_output(132));
  or_dcpl_3940 <= or_dcpl_666 OR or_dcpl_3214;
  or_dcpl_3943 <= or_dcpl_2081 OR (fsm_output(110));
  or_dcpl_3948 <= or_dcpl_1278 OR or_dcpl_1355;
  or_dcpl_3951 <= (fsm_output(93)) OR (fsm_output(92)) OR (fsm_output(94));
  or_dcpl_3957 <= or_dcpl_1285 OR or_dcpl_1429;
  or_dcpl_3958 <= (fsm_output(72)) OR (fsm_output(85));
  and_dcpl_349 <= NOT((fsm_output(66)) OR (fsm_output(62)));
  and_370_cse <= and_dcpl_349 AND (NOT((fsm_output(64)) OR (fsm_output(71))));
  or_dcpl_4056 <= or_dcpl_1271 OR (fsm_output(86));
  or_dcpl_4084 <= (fsm_output(82)) OR (fsm_output(88)) OR or_dcpl_1402;
  or_dcpl_4087 <= or_dcpl_687 OR (fsm_output(84));
  or_4126_cse <= and_dcpl_294 OR (fsm_output(72)) OR (fsm_output(99));
  and_dcpl_363 <= (fsm_output(73)) AND (NOT (dec_decompress_for_i_1_sva_1(4)));
  and_dcpl_365 <= NOT((fsm_output(71)) OR (fsm_output(97)));
  and_386_cse <= ((NOT (fsm_output(73))) OR (dec_decompress_for_i_1_sva_1(4))) AND
      and_dcpl_365;
  or_dcpl_4199 <= (fsm_output(82)) OR (fsm_output(90)) OR (fsm_output(88));
  or_dcpl_4202 <= or_dcpl_678 OR (fsm_output(74));
  or_dcpl_4208 <= or_dcpl_683 OR (fsm_output(91));
  or_dcpl_4210 <= (fsm_output(81)) OR (fsm_output(85)) OR (fsm_output(87));
  or_dcpl_4219 <= (fsm_output(73)) OR (fsm_output(99));
  or_dcpl_4998 <= or_dcpl_1355 OR (fsm_output(90));
  and_dcpl_479 <= (fsm_output(90)) AND ModelA_getChar_for_not_sxt;
  and_dcpl_480 <= (fsm_output(90)) AND (NOT ModelA_getChar_for_not_sxt);
  or_dcpl_5178 <= or_dcpl_2058 OR (fsm_output(129));
  or_dcpl_5311 <= or_dcpl_2059 OR or_dcpl_2058;
  or_dcpl_5315 <= (fsm_output(126)) OR (fsm_output(107)) OR or_dcpl_639;
  or_dcpl_5318 <= (fsm_output(106)) OR (fsm_output(123)) OR or_dcpl_647;
  or_dcpl_5330 <= (fsm_output(127)) OR (fsm_output(130)) OR or_dcpl_664;
  or_dcpl_5333 <= or_dcpl_2081 OR or_dcpl_669;
  and_dcpl_489 <= NOT((fsm_output(104)) OR (fsm_output(135)));
  or_dcpl_5408 <= (fsm_output(116)) OR (fsm_output(106)) OR or_dcpl_2537;
  or_dcpl_5412 <= or_dcpl_655 OR (fsm_output(115));
  or_dcpl_5709 <= or_dcpl_2023 OR (NOT (z_out_25(7)));
  copy_x_1_acc_3_itm <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED(trans_ond_image_copy_1_y_1_sva_1
      & TO_STDLOGICVECTOR('1')), 10) + CONV_SIGNED(SIGNED'('1' & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg7_sva)
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg6_sva) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg5_sva)
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg4_sva) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg3_sva)
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg2_sva) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg1_sva)
      & '1'), 10), 10));
  or_5965_cse <= (fsm_output(27)) OR (fsm_output(29));
  Src_rsc_singleport_data_in_core <= MUX1HOT_v_8_10_2((z_out_13(8 DOWNTO 1)) & reg_trans_ond_sub_acc_1_itm_cse
      & trans_ond_moy_11_slc_itm & trans_ond_sub_11_acc_1_itm & comp_m_output_m_NextByte_1_sva_4
      & comp_m_output_m_NextByte_1_lpi_2 & comp_m_output_m_NextByte_1_sva_2 & comp_m_output_m_NextByte_1_lpi_2_dfm_1
      & comp_m_output_m_NextByte_1_sva_8 & comp_m_output_m_NextByte_lpi_dfm, STD_LOGIC_VECTOR'((fsm_output(27))
      & (fsm_output(28)) & (fsm_output(29)) & (fsm_output(30)) & (((NOT (z_out_43(17)))
      AND (fsm_output(54))) OR ((comp_compress_low_1_sva_1(14)) AND (fsm_output(61))))
      & (((z_out_43(17)) AND (fsm_output(54))) OR ((NOT (comp_compress_low_1_sva_1(14)))
      AND (fsm_output(61)))) & (fsm_output(56)) & (fsm_output(58)) & (fsm_output(63))
      & (fsm_output(65))));
  or_cse <= (fsm_output(4)) OR (fsm_output(67));
  or_5988_cse <= (fsm_output(4)) OR (fsm_output(11)) OR (fsm_output(35)) OR (fsm_output(67));
  mux1h_28_nl <= MUX1HOT_s_1_9_2(STD_LOGIC_VECTOR'((z_out_30(8)) & (z_out_34(8))
      & (passe_y_acc_49_psp(8)) & (passe_y_acc_psp(7)) & (comp_m_output_index_range_lpi_2(16))
      & (comp_m_output_index_range_lpi_2_dfm_1(16)) & (comp_m_output_index_range_lpi_2_dfm_3(16))
      & (comp_m_output_index_range_lpi_dfm_1(16)) & (comp_m_output_index_range_lpi_dfm_3(16))),
      STD_LOGIC_VECTOR'(or_cse & (fsm_output(11)) & (fsm_output(12)) & or_5964_cse
      & or_dcpl_3251 & (fsm_output(56)) & (fsm_output(58)) & (fsm_output(63)) & (fsm_output(65))));
  mux1h_256_nl <= MUX1HOT_s_1_12_2(STD_LOGIC_VECTOR'((z_out_30(7)) & (z_out_34(7))
      & (passe_y_acc_49_psp(7)) & (passe_y_acc_psp(6)) & (passe_y_1_acc_49_psp(7))
      & (passe_y_1_acc_13_itm(15)) & (copy_y_1_acc_psp_1(7)) & (comp_m_output_index_range_lpi_2(15))
      & (comp_m_output_index_range_lpi_2_dfm_1(15)) & (comp_m_output_index_range_lpi_2_dfm_3(15))
      & (comp_m_output_index_range_lpi_dfm_1(15)) & (comp_m_output_index_range_lpi_dfm_3(15))),
      STD_LOGIC_VECTOR'(or_cse & (fsm_output(11)) & (fsm_output(12)) & or_5964_cse
      & (fsm_output(29)) & (fsm_output(30)) & (fsm_output(35)) & or_dcpl_3251 & (fsm_output(56))
      & (fsm_output(58)) & (fsm_output(63)) & (fsm_output(65))));
  mux1h_257_nl <= MUX1HOT_v_7_14_2((z_out_30(6 DOWNTO 0)) & (z_out_34(6 DOWNTO 0))
      & (passe_y_acc_49_psp(6 DOWNTO 0)) & ((passe_y_acc_psp(5 DOWNTO 0)) & TO_STDLOGICVECTOR(reg_passe_y_acc_43_sdt_tmp_6(1)))
      & (passe_y_1_acc_1_cse_1_sva(8 DOWNTO 2)) & (passe_y_1_acc_7_itm(14 DOWNTO
      8)) & (passe_y_1_acc_49_psp(6 DOWNTO 0)) & (passe_y_1_acc_13_itm(14 DOWNTO
      8)) & (copy_y_1_acc_psp_1(6 DOWNTO 0)) & (comp_m_output_index_range_lpi_2(14
      DOWNTO 8)) & (comp_m_output_index_range_lpi_2_dfm_1(14 DOWNTO 8)) & (comp_m_output_index_range_lpi_2_dfm_3(14
      DOWNTO 8)) & (comp_m_output_index_range_lpi_dfm_1(14 DOWNTO 8)) & (comp_m_output_index_range_lpi_dfm_3(14
      DOWNTO 8)), STD_LOGIC_VECTOR'(or_cse & (fsm_output(11)) & (fsm_output(12))
      & or_5964_cse & (fsm_output(27)) & (fsm_output(28)) & (fsm_output(29)) & (fsm_output(30))
      & (fsm_output(35)) & or_dcpl_3251 & (fsm_output(56)) & (fsm_output(58)) & (fsm_output(63))
      & (fsm_output(65))));
  mux1h_261_nl <= MUX1HOT_s_1_12_2(STD_LOGIC_VECTOR'((z_out_8(1)) & (reg_trans_ond_sub_acc_1_itm_cse(1))
      & (reg_passe_y_acc_43_sdt_tmp_6(0)) & (passe_y_1_acc_1_cse_1_sva(1)) & (passe_y_1_acc_7_itm(7))
      & (reg_slc_slc_tmp_5(1)) & (passe_y_1_acc_13_itm(7)) & (comp_m_output_index_range_lpi_2(7))
      & (comp_m_output_index_range_lpi_2_dfm_1(7)) & (comp_m_output_index_range_lpi_2_dfm_3(7))
      & (comp_m_output_index_range_lpi_dfm_1(7)) & (comp_m_output_index_range_lpi_dfm_3(7))),
      STD_LOGIC_VECTOR'(or_5988_cse & (fsm_output(12)) & or_5964_cse & (fsm_output(27))
      & (fsm_output(28)) & (fsm_output(29)) & (fsm_output(30)) & or_dcpl_3251 & (fsm_output(56))
      & (fsm_output(58)) & (fsm_output(63)) & (fsm_output(65))));
  mux1h_258_nl <= MUX1HOT_s_1_13_2(STD_LOGIC_VECTOR'((z_out_8(0)) & (reg_trans_ond_sub_acc_1_itm_cse(0))
      & (passe_y_slc_trans_ond_Trans_Ond_x_1_itm(5)) & (trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_5_itm(5))
      & (passe_y_1_acc_1_cse_1_sva(0)) & (passe_y_1_acc_7_itm(6)) & (reg_slc_slc_tmp_5(0))
      & (passe_y_1_acc_13_itm(6)) & (comp_m_output_index_range_lpi_2(6)) & (comp_m_output_index_range_lpi_2_dfm_1(6))
      & (comp_m_output_index_range_lpi_2_dfm_3(6)) & (comp_m_output_index_range_lpi_dfm_1(6))
      & (comp_m_output_index_range_lpi_dfm_3(6))), STD_LOGIC_VECTOR'(or_5988_cse
      & (fsm_output(12)) & (fsm_output(13)) & (fsm_output(14)) & (fsm_output(27))
      & (fsm_output(28)) & (fsm_output(29)) & (fsm_output(30)) & or_dcpl_3251 & (fsm_output(56))
      & (fsm_output(58)) & (fsm_output(63)) & (fsm_output(65))));
  mux1h_259_nl <= MUX1HOT_v_5_15_2((trans_ond_image_copy_x_1_sva(5 DOWNTO 1)) & (trans_ond_Trans_Ond_x_1_sva(4
      DOWNTO 0)) & trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_6_itm & (passe_y_slc_trans_ond_Trans_Ond_x_1_itm(4
      DOWNTO 0)) & (trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_5_itm(4 DOWNTO
      0)) & (trans_ond_Trans_Ond_1_x_slc_trans_ond_Trans_Ond_1_x_4_itm(5 DOWNTO 1))
      & (passe_y_1_acc_7_itm(5 DOWNTO 1)) & (passe_y_1_acc_13_itm(5 DOWNTO 1)) &
      (trans_ond_image_copy_1_x_1_sva_2(5 DOWNTO 1)) & (comp_m_output_index_range_lpi_2(5
      DOWNTO 1)) & (comp_m_output_index_range_lpi_2_dfm_1(5 DOWNTO 1)) & (comp_m_output_index_range_lpi_2_dfm_3(5
      DOWNTO 1)) & (comp_m_output_index_range_lpi_dfm_1(5 DOWNTO 1)) & (comp_m_output_index_range_lpi_dfm_3(5
      DOWNTO 1)) & (trans_ond_image_copy_2_x_1_sva(5 DOWNTO 1)), STD_LOGIC_VECTOR'((fsm_output(4))
      & (fsm_output(11)) & (fsm_output(12)) & (fsm_output(13)) & (fsm_output(14))
      & or_5965_cse & (fsm_output(28)) & (fsm_output(30)) & (fsm_output(35)) & or_dcpl_3251
      & (fsm_output(56)) & (fsm_output(58)) & (fsm_output(63)) & (fsm_output(65))
      & (fsm_output(67))));
  mux1h_260_nl <= MUX1HOT_s_1_11_2(STD_LOGIC_VECTOR'((trans_ond_image_copy_x_1_sva(0))
      & (trans_ond_Trans_Ond_1_x_slc_trans_ond_Trans_Ond_1_x_4_itm(0)) & (passe_y_1_acc_7_itm(0))
      & (passe_y_1_acc_13_itm(0)) & (trans_ond_image_copy_1_x_1_sva_2(0)) & (comp_m_output_index_range_lpi_2(0))
      & (comp_m_output_index_range_lpi_2_dfm_1(0)) & (comp_m_output_index_range_lpi_2_dfm_3(0))
      & (comp_m_output_index_range_lpi_dfm_1(0)) & (comp_m_output_index_range_lpi_dfm_3(0))
      & (trans_ond_image_copy_2_x_1_sva(0))), STD_LOGIC_VECTOR'((fsm_output(4)) &
      or_5965_cse & (fsm_output(28)) & (fsm_output(30)) & (fsm_output(35)) & or_dcpl_3251
      & (fsm_output(56)) & (fsm_output(58)) & (fsm_output(63)) & (fsm_output(65))
      & (fsm_output(67))));
  Src_rsc_singleport_addr_core <= TO_STDLOGICVECTOR((mux1h_28_nl) AND (NOT((fsm_output(27))
      OR (fsm_output(28)) OR (fsm_output(29)) OR (fsm_output(30)) OR (fsm_output(35)))))
      & TO_STDLOGICVECTOR((mux1h_256_nl) AND (NOT((fsm_output(27)) OR (fsm_output(28)))))
      & (mux1h_257_nl) & TO_STDLOGICVECTOR(mux1h_261_nl) & TO_STDLOGICVECTOR(mux1h_258_nl)
      & (mux1h_259_nl) & TO_STDLOGICVECTOR(((mux1h_260_nl) AND (NOT((fsm_output(12))
      OR (fsm_output(14))))) OR (fsm_output(11)) OR (fsm_output(13)));
  Src_rsc_singleport_re_core_sct <= Src_rsc_singleport_re_core_sct_reg;
  Src_rsc_singleport_we_core_sct <= Src_rsc_singleport_we_core_sct_reg;
  Comp_rsc_singleport_data_in_core <= MUX1HOT_v_8_10_2(Src_rsc_singleport_data_out_mxwt
      & (z_out_13(8 DOWNTO 1)) & reg_trans_ond_sub_acc_1_itm_cse & trans_ond_moy_5_slc_itm
      & trans_ond_sub_5_acc_1_itm & Vga_rsc_singleport_data_out_mxwt & (z_out_13(7
      DOWNTO 0)) & reg_hsplit_y_acc_30_itm_cse & hsplit_y_1_acc_38_itm & hsplit_y_1_acc_46_itm,
      STD_LOGIC_VECTOR'(or_dcpl_3327 & (fsm_output(15)) & (fsm_output(16)) & (fsm_output(17))
      & (fsm_output(18)) & (fsm_output(101)) & (fsm_output(123)) & (fsm_output(124))
      & (fsm_output(125)) & (fsm_output(126))));
  or_6010_cse <= (fsm_output(5)) OR (fsm_output(68)) OR (fsm_output(101));
  or_6012_cse <= (fsm_output(5)) OR (fsm_output(36)) OR (fsm_output(68)) OR (fsm_output(101));
  mux1h_26_nl <= MUX1HOT_s_1_13_2(STD_LOGIC_VECTOR'((reg_copy_y_acc_8_psp_cse(8))
      & (passe_y_acc_51_psp(8)) & (passe_y_acc_13_itm(16)) & (comp_byte_to_encode_1_sva(16))
      & (dec_m_input_input_byte_1_sva(16)) & (dec_m_input_input_byte_1_lpi_3(16))
      & (z_out_2(16)) & (reg_hsplit_y_acc_5_cse_sva_cse(10)) & (hsplit_y_acc_2_itm(16))
      & (hsplit_y_acc_psp(8)) & (hsplit_y_1_acc_75_psp(7)) & (hsplit_y_1_acc_76_psp(8))
      & (z_out_48(10))), STD_LOGIC_VECTOR'(or_6010_cse & (fsm_output(17)) & (fsm_output(18))
      & (fsm_output(40)) & (fsm_output(72)) & (fsm_output(97)) & (fsm_output(107))
      & (fsm_output(108)) & (fsm_output(109)) & (fsm_output(110)) & or_dcpl_2537
      & or_dcpl_2527 & (fsm_output(131))));
  mux1h_242_nl <= MUX1HOT_v_8_19_2((reg_copy_y_acc_8_psp_cse(7 DOWNTO 0)) & passe_y_acc_psp
      & (passe_y_acc_7_itm(15 DOWNTO 8)) & (passe_y_acc_51_psp(7 DOWNTO 0)) & (passe_y_acc_13_itm(15
      DOWNTO 8)) & passe_y_1_acc_psp_1 & passe_y_1_acc_psp & (passe_y_1_acc_1_cse_1_sva(8
      DOWNTO 1)) & copy_y_1_acc_psp & (comp_byte_to_encode_1_sva(15 DOWNTO 8)) &
      (dec_m_input_input_byte_1_sva(15 DOWNTO 8)) & (dec_m_input_input_byte_1_lpi_3(15
      DOWNTO 8)) & (z_out_2(15 DOWNTO 8)) & (reg_hsplit_y_acc_5_cse_sva_cse(9 DOWNTO
      2)) & (hsplit_y_acc_2_itm(15 DOWNTO 8)) & (hsplit_y_acc_psp(7 DOWNTO 0)) &
      ((hsplit_y_1_acc_75_psp(6 DOWNTO 0)) & TO_STDLOGICVECTOR(reg_hsplit_y_1_acc_sdt_tmp_7(1)))
      & (hsplit_y_1_acc_76_psp(7 DOWNTO 0)) & (z_out_48(9 DOWNTO 2)), STD_LOGIC_VECTOR'(or_6010_cse
      & (fsm_output(15)) & (fsm_output(16)) & (fsm_output(17)) & (fsm_output(18))
      & (fsm_output(23)) & (fsm_output(24)) & or_dcpl_90 & (fsm_output(36)) & (fsm_output(40))
      & (fsm_output(72)) & (fsm_output(97)) & (fsm_output(107)) & (fsm_output(108))
      & (fsm_output(109)) & (fsm_output(110)) & or_dcpl_2537 & or_dcpl_2527 & (fsm_output(131))));
  mux1h_243_nl <= MUX1HOT_s_1_18_2(STD_LOGIC_VECTOR'((reg_trans_ond_sub_acc_1_itm_cse(1))
      & (reg_passe_y_acc_43_sdt_tmp_6(1)) & (passe_y_acc_7_itm(7)) & (reg_passe_y_acc_46_sdt_tmp_7(1))
      & (passe_y_acc_13_itm(7)) & (z_out_35(1)) & (reg_passe_y_1_acc_44_sdt_tmp_6(1))
      & (passe_y_1_acc_1_cse_1_sva(0)) & (comp_byte_to_encode_1_sva(7)) & (dec_m_input_input_byte_1_sva(7))
      & (dec_m_input_input_byte_1_lpi_3(7)) & (z_out_2(7)) & (reg_hsplit_y_acc_5_cse_sva_cse(1))
      & (hsplit_y_acc_2_itm(7)) & (reg_hsplit_y_acc_sdt_tmp_7(1)) & (reg_hsplit_y_1_acc_sdt_tmp_7(0))
      & (reg_hsplit_y_1_acc_67_sdt_tmp_8(1)) & (z_out_48(1))), STD_LOGIC_VECTOR'(or_6012_cse
      & (fsm_output(15)) & (fsm_output(16)) & (fsm_output(17)) & (fsm_output(18))
      & (fsm_output(23)) & (fsm_output(24)) & or_dcpl_90 & (fsm_output(40)) & (fsm_output(72))
      & (fsm_output(97)) & (fsm_output(107)) & (fsm_output(108)) & (fsm_output(109))
      & (fsm_output(110)) & or_dcpl_2537 & or_dcpl_2527 & (fsm_output(131))));
  mux1h_244_nl <= MUX1HOT_s_1_19_2(STD_LOGIC_VECTOR'((reg_trans_ond_sub_acc_1_itm_cse(0))
      & (reg_passe_y_acc_43_sdt_tmp_6(0)) & (passe_y_acc_7_itm(6)) & (reg_passe_y_acc_46_sdt_tmp_7(0))
      & (passe_y_acc_13_itm(6)) & (z_out_35(0)) & (reg_passe_y_1_acc_44_sdt_tmp_6(0))
      & (trans_ond_Trans_Ond_1_x_slc_trans_ond_Trans_Ond_1_x_4_itm(5)) & (comp_byte_to_encode_1_sva(6))
      & (dec_m_input_input_byte_1_sva(6)) & (dec_m_input_input_byte_1_lpi_3(6)) &
      (z_out_2(6)) & (reg_hsplit_y_acc_5_cse_sva_cse(0)) & (hsplit_y_acc_2_itm(6))
      & (reg_hsplit_y_acc_sdt_tmp_7(0)) & (hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_9_itm(5))
      & (hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_26_itm(5)) & (reg_hsplit_y_1_acc_67_sdt_tmp_8(0))
      & (z_out_48(0))), STD_LOGIC_VECTOR'(or_6012_cse & (fsm_output(15)) & (fsm_output(16))
      & (fsm_output(17)) & (fsm_output(18)) & (fsm_output(23)) & (fsm_output(24))
      & or_dcpl_90 & (fsm_output(40)) & (fsm_output(72)) & (fsm_output(97)) & (fsm_output(107))
      & (fsm_output(108)) & (fsm_output(109)) & (fsm_output(110)) & (fsm_output(123))
      & (fsm_output(124)) & or_dcpl_2527 & (fsm_output(131))));
  mux1h_245_nl <= MUX1HOT_v_5_22_2((trans_ond_image_copy_x_1_sva(5 DOWNTO 1)) & (trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_5_itm(5
      DOWNTO 1)) & (passe_y_acc_7_itm(5 DOWNTO 1)) & (trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_3_itm(5
      DOWNTO 1)) & (passe_y_acc_13_itm(5 DOWNTO 1)) & (trans_ond_Trans_Ond_1_x_1_sva(4
      DOWNTO 0)) & (trans_ond_Trans_Ond_1_x_slc_trans_ond_Trans_Ond_1_x_4_itm(4 DOWNTO
      0)) & (trans_ond_image_copy_1_x_slc_trans_ond_image_copy_1_x_1_itm(5 DOWNTO
      1)) & (comp_byte_to_encode_1_sva(5 DOWNTO 1)) & (trans_ond_image_copy_2_x_1_sva(5
      DOWNTO 1)) & (dec_m_input_input_byte_1_sva(5 DOWNTO 1)) & (dec_m_input_input_byte_1_lpi_3(5
      DOWNTO 1)) & (trans_ond_image_copy_3_x_1_sva(5 DOWNTO 1)) & (z_out_2(5 DOWNTO
      1)) & (hsplit_y_slc_inv_wave_Inv_Wave_x_17_itm(5 DOWNTO 1)) & (hsplit_y_acc_2_itm(5
      DOWNTO 1)) & (hsplit_y_slc_inv_wave_Inv_Wave_x_16_itm(5 DOWNTO 1)) & (hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_9_itm(4
      DOWNTO 0)) & (hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_26_itm(4 DOWNTO 0)) & hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_13_itm
      & hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_27_itm & (inv_wave_image_copy_x_sva(5
      DOWNTO 1)), STD_LOGIC_VECTOR'((fsm_output(5)) & (fsm_output(15)) & (fsm_output(16))
      & (fsm_output(17)) & (fsm_output(18)) & (fsm_output(23)) & ((fsm_output(24))
      OR (fsm_output(25)) OR (fsm_output(26))) & (fsm_output(36)) & (fsm_output(40))
      & (fsm_output(68)) & (fsm_output(72)) & (fsm_output(97)) & (fsm_output(101))
      & (fsm_output(107)) & (fsm_output(108)) & (fsm_output(109)) & (fsm_output(110))
      & (fsm_output(123)) & (fsm_output(124)) & (fsm_output(125)) & (fsm_output(126))
      & (fsm_output(131))));
  mux1h_246_nl <= MUX1HOT_s_1_16_2(STD_LOGIC_VECTOR'((trans_ond_image_copy_x_1_sva(0))
      & (trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_5_itm(0)) & (passe_y_acc_7_itm(0))
      & (trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_3_itm(0)) & (passe_y_acc_13_itm(0))
      & (trans_ond_image_copy_1_x_slc_trans_ond_image_copy_1_x_1_itm(0)) & (comp_byte_to_encode_1_sva(0))
      & (trans_ond_image_copy_2_x_1_sva(0)) & (dec_m_input_input_byte_1_sva(0)) &
      (dec_m_input_input_byte_1_lpi_3(0)) & (trans_ond_image_copy_3_x_1_sva(0)) &
      (z_out_2(0)) & (hsplit_y_slc_inv_wave_Inv_Wave_x_17_itm(0)) & (hsplit_y_acc_2_itm(0))
      & (hsplit_y_slc_inv_wave_Inv_Wave_x_16_itm(0)) & (inv_wave_image_copy_x_sva(0))),
      STD_LOGIC_VECTOR'((fsm_output(5)) & (fsm_output(15)) & (fsm_output(16)) & (fsm_output(17))
      & (fsm_output(18)) & (fsm_output(36)) & (fsm_output(40)) & (fsm_output(68))
      & (fsm_output(72)) & (fsm_output(97)) & (fsm_output(101)) & (fsm_output(107))
      & (fsm_output(108)) & (fsm_output(109)) & (fsm_output(110)) & (fsm_output(131))));
  Comp_rsc_singleport_addr_core <= TO_STDLOGICVECTOR((mux1h_26_nl) AND (NOT((fsm_output(15))
      OR (fsm_output(16)) OR (fsm_output(23)) OR (fsm_output(24)) OR (fsm_output(25))
      OR (fsm_output(26)) OR (fsm_output(36))))) & (mux1h_242_nl) & TO_STDLOGICVECTOR(mux1h_243_nl)
      & TO_STDLOGICVECTOR(mux1h_244_nl) & (mux1h_245_nl) & TO_STDLOGICVECTOR(((mux1h_246_nl)
      AND (NOT((fsm_output(24)) OR (fsm_output(26)) OR (fsm_output(123)) OR (fsm_output(125)))))
      OR (fsm_output(23)) OR (fsm_output(25)) OR (fsm_output(124)) OR (fsm_output(126)));
  Comp_rsc_singleport_re_core_sct <= Comp_rsc_singleport_re_core_sct_reg;
  Comp_rsc_singleport_we_core_sct <= Comp_rsc_singleport_we_core_sct_reg;
  Vga_rsc_singleport_data_in_core <= MUX1HOT_v_8_6_2((ModelA_getChar_for_i_1_lpi_1_dfm_mx0(7
      DOWNTO 0)) & (z_out_13(7 DOWNTO 0)) & reg_hsplit_y_acc_30_itm_cse & hsplit_y_acc_38_itm
      & hsplit_y_acc_46_itm & Comp_rsc_singleport_data_out_mxwt, STD_LOGIC_VECTOR'((fsm_output(90))
      & (fsm_output(111)) & (fsm_output(112)) & (fsm_output(113)) & (fsm_output(114))
      & (fsm_output(132))));
  or_6008_cse <= (fsm_output(120)) OR (fsm_output(132));
  mux1h_24_nl <= MUX1HOT_v_9_8_2((dec_m_output_index_range_1_sva(16 DOWNTO 8)) &
      z_out_30 & (hsplit_y_acc_75_psp & TO_STDLOGICVECTOR(reg_hsplit_y_acc_sdt_tmp_7(1)))
      & hsplit_y_acc_76_psp & (z_out_2(16 DOWNTO 8)) & (reg_hsplit_y_acc_5_cse_sva_cse(10
      DOWNTO 2)) & (hsplit_y_1_acc_2_itm(16 DOWNTO 8)) & hsplit_y_1_acc_psp, STD_LOGIC_VECTOR'((fsm_output(90))
      & (fsm_output(100)) & or_5942_cse & or_5943_cse & (fsm_output(119)) & or_6008_cse
      & (fsm_output(121)) & (fsm_output(122))));
  mux1h_238_nl <= MUX1HOT_s_1_8_2(STD_LOGIC_VECTOR'((dec_m_output_index_range_1_sva(7))
      & (z_out_8(1)) & (reg_hsplit_y_acc_sdt_tmp_7(0)) & (reg_hsplit_y_acc_67_sdt_tmp_8(1))
      & (z_out_2(7)) & (reg_hsplit_y_acc_5_cse_sva_cse(1)) & (hsplit_y_1_acc_2_itm(7))
      & (reg_hsplit_y_1_acc_sdt_tmp_7(1))), STD_LOGIC_VECTOR'((fsm_output(90)) &
      (fsm_output(100)) & or_5942_cse & or_5943_cse & (fsm_output(119)) & or_6008_cse
      & (fsm_output(121)) & (fsm_output(122))));
  mux1h_239_nl <= MUX1HOT_s_1_9_2(STD_LOGIC_VECTOR'((dec_m_output_index_range_1_sva(6))
      & (z_out_8(0)) & (hsplit_y_slc_inv_wave_Inv_Wave_x_9_itm(5)) & (hsplit_y_slc_inv_wave_Inv_Wave_x_26_itm(5))
      & (reg_hsplit_y_acc_67_sdt_tmp_8(0)) & (z_out_2(6)) & (reg_hsplit_y_acc_5_cse_sva_cse(0))
      & (hsplit_y_1_acc_2_itm(6)) & (reg_hsplit_y_1_acc_sdt_tmp_7(0))), STD_LOGIC_VECTOR'((fsm_output(90))
      & (fsm_output(100)) & (fsm_output(111)) & (fsm_output(112)) & or_5943_cse &
      (fsm_output(119)) & or_6008_cse & (fsm_output(121)) & (fsm_output(122))));
  mux1h_240_nl <= MUX1HOT_v_5_11_2((dec_m_output_index_range_1_sva(5 DOWNTO 1)) &
      (trans_ond_image_copy_3_x_1_sva(5 DOWNTO 1)) & (hsplit_y_slc_inv_wave_Inv_Wave_x_9_itm(4
      DOWNTO 0)) & (hsplit_y_slc_inv_wave_Inv_Wave_x_26_itm(4 DOWNTO 0)) & hsplit_y_slc_inv_wave_Inv_Wave_x_13_itm
      & hsplit_y_slc_inv_wave_Inv_Wave_x_27_itm & (z_out_2(5 DOWNTO 1)) & (hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_17_itm(5
      DOWNTO 1)) & (hsplit_y_1_acc_2_itm(5 DOWNTO 1)) & (hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_16_itm(5
      DOWNTO 1)) & (copy_y_4_slc_inv_wave_image_copy_x_1_itm(5 DOWNTO 1)), STD_LOGIC_VECTOR'((fsm_output(90))
      & (fsm_output(100)) & (fsm_output(111)) & (fsm_output(112)) & (fsm_output(113))
      & (fsm_output(114)) & (fsm_output(119)) & (fsm_output(120)) & (fsm_output(121))
      & (fsm_output(122)) & (fsm_output(132))));
  mux1h_241_nl <= MUX1HOT_s_1_7_2(STD_LOGIC_VECTOR'((dec_m_output_index_range_1_sva(0))
      & (trans_ond_image_copy_3_x_1_sva(0)) & (z_out_2(0)) & (hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_17_itm(0))
      & (hsplit_y_1_acc_2_itm(0)) & (hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_16_itm(0))
      & (copy_y_4_slc_inv_wave_image_copy_x_1_itm(0))), STD_LOGIC_VECTOR'((fsm_output(90))
      & (fsm_output(100)) & (fsm_output(119)) & (fsm_output(120)) & (fsm_output(121))
      & (fsm_output(122)) & (fsm_output(132))));
  Vga_rsc_singleport_addr_core <= (mux1h_24_nl) & TO_STDLOGICVECTOR(mux1h_238_nl)
      & TO_STDLOGICVECTOR(mux1h_239_nl) & (mux1h_240_nl) & TO_STDLOGICVECTOR(((mux1h_241_nl)
      AND (NOT((fsm_output(111)) OR (fsm_output(113))))) OR (fsm_output(112)) OR
      (fsm_output(114)));
  Vga_rsc_singleport_re_core_sct <= Vga_rsc_singleport_re_core_sct_reg;
  Vga_rsc_singleport_we_core_sct <= Vga_rsc_singleport_we_core_sct_reg;
  mux1h_23_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((cmodel_cumulative_frequency_vinit_ndx_sva(8))
      & (z_out(8)) & (cmodel_cumulative_frequency_vinit_ndx_1_sva(8))), STD_LOGIC_VECTOR'((fsm_output(2))
      & or_dcpl_3175 & (fsm_output(70))));
  mux1h_248_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(((cmodel_cumulative_frequency_vinit_ndx_sva(7))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_sva(8)))) & (z_out(7)) & ((cmodel_cumulative_frequency_vinit_ndx_1_sva(7))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_1_sva(8))))), STD_LOGIC_VECTOR'((fsm_output(2))
      & or_dcpl_3175 & (fsm_output(70))));
  mux1h_249_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(((cmodel_cumulative_frequency_vinit_ndx_sva(6))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_sva(8)))) & (z_out(6)) & ((cmodel_cumulative_frequency_vinit_ndx_1_sva(6))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_1_sva(8))))), STD_LOGIC_VECTOR'((fsm_output(2))
      & or_dcpl_3175 & (fsm_output(70))));
  mux1h_250_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(((cmodel_cumulative_frequency_vinit_ndx_sva(5))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_sva(8)))) & (z_out(5)) & ((cmodel_cumulative_frequency_vinit_ndx_1_sva(5))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_1_sva(8))))), STD_LOGIC_VECTOR'((fsm_output(2))
      & or_dcpl_3175 & (fsm_output(70))));
  mux1h_251_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(((cmodel_cumulative_frequency_vinit_ndx_sva(4))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_sva(8)))) & (z_out(4)) & ((cmodel_cumulative_frequency_vinit_ndx_1_sva(4))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_1_sva(8))))), STD_LOGIC_VECTOR'((fsm_output(2))
      & or_dcpl_3175 & (fsm_output(70))));
  mux1h_252_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(((cmodel_cumulative_frequency_vinit_ndx_sva(3))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_sva(8)))) & (z_out(3)) & ((cmodel_cumulative_frequency_vinit_ndx_1_sva(3))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_1_sva(8))))), STD_LOGIC_VECTOR'((fsm_output(2))
      & or_dcpl_3175 & (fsm_output(70))));
  mux1h_253_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(((cmodel_cumulative_frequency_vinit_ndx_sva(2))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_sva(8)))) & (z_out(2)) & ((cmodel_cumulative_frequency_vinit_ndx_1_sva(2))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_1_sva(8))))), STD_LOGIC_VECTOR'((fsm_output(2))
      & or_dcpl_3175 & (fsm_output(70))));
  mux1h_254_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(((cmodel_cumulative_frequency_vinit_ndx_sva(1))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_sva(8)))) & (z_out(1)) & ((cmodel_cumulative_frequency_vinit_ndx_1_sva(1))
      AND (NOT (cmodel_cumulative_frequency_vinit_ndx_1_sva(8))))), STD_LOGIC_VECTOR'((fsm_output(2))
      & or_dcpl_3175 & (fsm_output(70))));
  mux1h_255_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((cmodel_cumulative_frequency_vinit_ndx_sva(0))
      & (z_out(0)) & (cmodel_cumulative_frequency_vinit_ndx_1_sva(0))), STD_LOGIC_VECTOR'((fsm_output(2))
      & or_dcpl_3175 & (fsm_output(70))));
  cmodel_cumulative_frequency_rsc_singleport_data_in <= ((z_out(31 DOWNTO 9)) AND
      STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT((fsm_output(2)) OR (fsm_output(70))),
      1),23))) & TO_STDLOGICVECTOR(mux1h_23_nl) & TO_STDLOGICVECTOR(mux1h_248_nl)
      & TO_STDLOGICVECTOR(mux1h_249_nl) & TO_STDLOGICVECTOR(mux1h_250_nl) & TO_STDLOGICVECTOR(mux1h_251_nl)
      & TO_STDLOGICVECTOR(mux1h_252_nl) & TO_STDLOGICVECTOR(mux1h_253_nl) & TO_STDLOGICVECTOR(mux1h_254_nl)
      & TO_STDLOGICVECTOR(mux1h_255_nl);
  cmodel_cumulative_frequency_rsc_singleport_addr <= MUX1HOT_v_9_11_2(cmodel_cumulative_frequency_vinit_ndx_sva
      & STD_LOGIC_VECTOR'("100000001") & STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR(comp_compress_for_c_sg1_2_lpi_1_dfm_1)
      & comp_compress_for_c_1_lpi_1_dfm_1) + CONV_UNSIGNED(CONV_UNSIGNED('1', 1),
      9), 9)) & (TO_STDLOGICVECTOR(comp_compress_for_c_sg1_2_lpi_1_dfm) & comp_compress_for_c_1_lpi_1_dfm)
      & ModelA_update_for_i_sva_2 & slc_ModelA_update_for_i_itm & cmodel_cumulative_frequency_vinit_ndx_1_sva
      & z_out_4 & ModelA_getChar_for_i_1_sva & ModelA_update_1_for_i_sva_2 & slc_ModelA_update_1_for_i_itm,
      STD_LOGIC_VECTOR'((fsm_output(2)) & (or_dcpl_1038 OR (fsm_output(47)) OR (fsm_output(54))
      OR (fsm_output(73)) OR (fsm_output(82)) OR (fsm_output(99)) OR (fsm_output(88)))
      & (fsm_output(41)) & (fsm_output(42)) & (fsm_output(44)) & (fsm_output(45))
      & (fsm_output(70)) & (fsm_output(81)) & (fsm_output(83)) & (fsm_output(85))
      & (fsm_output(86))));
  mux_268_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(or_tmp_22 & (NOT nand_tmp)), (NOT (fsm_output(88)))
      OR cmodel_m_frozen_sva);
  mux_269_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((mux_268_nl) & or_tmp_22), fsm_output(83));
  cmodel_cumulative_frequency_rsc_singleport_re <= NOT((mux_269_nl) OR (or_dcpl_1038
      AND exit_levels_sva_mx0) OR ((fsm_output(47)) AND (NOT cmodel_m_frozen_1_sva))
      OR and_dcpl_294 OR (fsm_output(81)) OR (fsm_output(42)) OR (fsm_output(44))
      OR (fsm_output(41)) OR ((fsm_output(82)) AND (ModelA_getChar_for_if_acc_tmp(33)))
      OR (fsm_output(85)) OR (fsm_output(99)));
  cmodel_cumulative_frequency_rsc_singleport_we <= NOT(or_dcpl_3175 OR (fsm_output(2))
      OR (fsm_output(70)));
  or_5969_cse <= (fsm_output(105)) OR (fsm_output(117));
  or_5974_cse <= (fsm_output(13)) OR (fsm_output(15));
  or_5975_cse <= (fsm_output(25)) OR (fsm_output(109)) OR (fsm_output(27)) OR (fsm_output(111));
  or_5976_cse_1 <= (fsm_output(121)) OR (fsm_output(123));
  or_5972_ssc <= (fsm_output(10)) OR (fsm_output(34));
  dec_decompress_for_1_scaled_value_acc_5_sdt <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(dec_decompress_for_1_scaled_value_acc_4_sdt(32
      DOWNTO 1)), 33) + CONV_UNSIGNED(SIGNED'("10000000000000000000000000000001"),
      33), 33));
  or_5981_cse <= (fsm_output(44)) OR (fsm_output(85));
  and_dcpl <= (NOT unequal_tmp_10) AND (fsm_output(54));
  and_dcpl_530 <= (NOT unequal_tmp_6) AND (fsm_output(61));
  or_dcpl_5934 <= (fsm_output(56)) OR (fsm_output(58));
  nor_108_m1c <= NOT(or_dcpl_5934 OR or_dcpl_693);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        Src_rsc_singleport_data_out_bfwt <= STD_LOGIC_VECTOR'("00000000");
        Comp_rsc_singleport_data_out_bfwt <= STD_LOGIC_VECTOR'("00000000");
        Vga_rsc_singleport_data_out_bfwt <= STD_LOGIC_VECTOR'("00000000");
      ELSE
        Src_rsc_singleport_data_out_bfwt <= Src_rsc_singleport_data_out_mxwt;
        Comp_rsc_singleport_data_out_bfwt <= Comp_rsc_singleport_data_out_mxwt;
        Vga_rsc_singleport_data_out_bfwt <= Vga_rsc_singleport_data_out_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        dec_decompress_for_1_for_else_else_land_lpi_2_dfm <= '0';
        ModelA_getChar_for_if_p_count_lpi_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        ModelA_getChar_for_if_p_high_lpi_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        ModelA_getChar_for_if_p_low_lpi_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d_drv <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        cmodel_m_frozen_1_sva <= '0';
        trans_ond_Mn_Trans_Ond_hi_7_sg7_sva <= '0';
        trans_ond_Mn_Trans_Ond_hi_7_sg6_sva <= '0';
        trans_ond_Mn_Trans_Ond_hi_7_sg5_sva <= '0';
        trans_ond_Mn_Trans_Ond_hi_7_sg4_sva <= '0';
        trans_ond_Mn_Trans_Ond_hi_7_sg3_sva <= '0';
        trans_ond_Mn_Trans_Ond_hi_7_sg2_sva <= '0';
        trans_ond_Mn_Trans_Ond_hi_7_sg1_sva <= '0';
        trans_ond_Mn_Trans_Ond_wi_7_sg8_sva <= '0';
        trans_ond_Mn_Trans_Ond_wi_7_sg7_sva <= '0';
        trans_ond_Mn_Trans_Ond_wi_7_sg6_sva <= '0';
        trans_ond_Mn_Trans_Ond_wi_7_sg5_sva <= '0';
        trans_ond_Mn_Trans_Ond_wi_7_sg4_sva <= '0';
        trans_ond_Mn_Trans_Ond_wi_7_sg3_sva <= '0';
        trans_ond_Mn_Trans_Ond_wi_7_sg2_sva <= '0';
        trans_ond_Mn_Trans_Ond_wi_7_sg1_sva <= '0';
        trans_ond_image_copy_y_1_sva <= STD_LOGIC_VECTOR'("00000000");
        reg_nblevels_triosy_mgc_io_sync_iswt0_cse <= '0';
        reg_Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_iswt0_cse
            <= '0';
        reg_start_sync_mgc_bsync_vld_iswt0_cse <= '0';
        reg_Vga_rsc_singleport_iswt0_cse <= '0';
        reg_Comp_rsc_singleport_iswt0_cse <= '0';
        reg_Src_rsc_singleport_iswt0_cse <= '0';
        div_mgc_div_1_b <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        div_mgc_div_1_a <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000");
        trans_ond_image_copy_x_1_sva <= STD_LOGIC_VECTOR'("000000000");
        nblevels_1_sva <= STD_LOGIC_VECTOR'("0000");
        exit_copy_x_sva <= '0';
        cmodel_cumulative_frequency_vinit_ndx_sva <= STD_LOGIC_VECTOR'("000000000");
        cmodel_reset_for_acc_itm <= STD_LOGIC_VECTOR'("000000000");
        cmodel_reset_for_nor_itm <= '0';
        copy_y_slc_itm <= '0';
        reg_copy_y_acc_8_psp_cse <= STD_LOGIC_VECTOR'("000000000");
        trans_ond_image_copy_x_1_sva_1 <= STD_LOGIC_VECTOR'("000000000");
        trans_ond_Mn_Trans_Ond_i_1_sg1_sva_2 <= STD_LOGIC_VECTOR'("00");
        comp_byte_to_encode_1_sva <= STD_LOGIC_VECTOR'("00000000000000000");
        comp_m_output_index_range_lpi_2 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_m_output_m_NextByte_1_lpi_2 <= STD_LOGIC_VECTOR'("00000000");
        comp_m_output_m_Mask_1_lpi_2 <= STD_LOGIC_VECTOR'("00000000");
        comp_compress_pending_bits_1_lpi_2 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_compress_low_1_sva_4 <= STD_LOGIC_VECTOR'("000000000000000");
        comp_compress_high_1_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        trans_ond_Trans_Ond_y_1_sva <= STD_LOGIC_VECTOR'("0000000");
        passe_x_acc_3_cse_sg1 <= '0';
        trans_ond_Trans_Ond_x_1_sva <= STD_LOGIC_VECTOR'("00000000");
        exit_passe_y_sva <= '0';
        trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_3_itm <= STD_LOGIC_VECTOR'("000000");
        trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_5_itm <= STD_LOGIC_VECTOR'("000000");
        passe_y_slc_trans_ond_Trans_Ond_x_1_itm <= STD_LOGIC_VECTOR'("000000");
        trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_6_itm <= STD_LOGIC_VECTOR'("00000");
        passe_y_acc_13_itm <= STD_LOGIC_VECTOR'("00000000000000000");
        passe_y_acc_51_psp <= STD_LOGIC_VECTOR'("000000000");
        passe_y_acc_7_itm <= STD_LOGIC_VECTOR'("0000000000000000");
        passe_y_acc_psp <= STD_LOGIC_VECTOR'("00000000");
        passe_y_acc_49_psp <= STD_LOGIC_VECTOR'("000000000");
        trans_ond_moy_slc_Src_3_cse_sva <= STD_LOGIC_VECTOR'("00000000");
        trans_ond_sub_2_acc_1_cse_sva <= STD_LOGIC_VECTOR'("00000000");
        trans_ond_moy_1_acc_cse_sg1_sva <= STD_LOGIC_VECTOR'("00000000");
        trans_ond_sub_5_acc_1_itm <= STD_LOGIC_VECTOR'("00000000");
        trans_ond_moy_5_slc_itm <= STD_LOGIC_VECTOR'("00000000");
        reg_trans_ond_sub_acc_1_itm_cse <= STD_LOGIC_VECTOR'("00000000");
        trans_ond_image_copy_1_y_1_sva <= STD_LOGIC_VECTOR'("00000000");
        levels_nand_svs <= '0';
        trans_ond_Trans_Ond_1_y_1_sva <= STD_LOGIC_VECTOR'("000000");
        trans_ond_Trans_Ond_1_x_1_sva <= STD_LOGIC_VECTOR'("0000000");
        exit_passe_y_1_sva <= '0';
        trans_ond_Trans_Ond_1_x_slc_trans_ond_Trans_Ond_1_x_4_itm <= STD_LOGIC_VECTOR'("000000");
        passe_y_1_acc_13_itm <= STD_LOGIC_VECTOR'("0000000000000000");
        passe_y_1_acc_49_psp <= STD_LOGIC_VECTOR'("00000000");
        passe_y_1_acc_7_itm <= STD_LOGIC_VECTOR'("000000000000000");
        passe_y_1_acc_1_cse_1_sva <= STD_LOGIC_VECTOR'("000000000");
        passe_y_1_acc_psp <= STD_LOGIC_VECTOR'("00000000");
        trans_ond_moy_slc_Comp_11_cse_sva <= STD_LOGIC_VECTOR'("00000000");
        trans_ond_sub_8_acc_1_cse_sva <= STD_LOGIC_VECTOR'("00000000");
        trans_ond_moy_7_acc_cse_sg1_sva <= STD_LOGIC_VECTOR'("00000000");
        trans_ond_sub_11_acc_1_itm <= STD_LOGIC_VECTOR'("00000000");
        trans_ond_moy_11_slc_itm <= STD_LOGIC_VECTOR'("00000000");
        trans_ond_image_copy_1_x_1_sva_2 <= STD_LOGIC_VECTOR'("00000000");
        levels_asn_15_itm <= '0';
        levels_asn_14_itm <= '0';
        levels_asn_4_itm <= '0';
        levels_asn_3_itm <= '0';
        exit_copy_y_1_sva <= '0';
        trans_ond_image_copy_1_x_slc_trans_ond_image_copy_1_x_1_itm <= STD_LOGIC_VECTOR'("000000");
        copy_y_1_acc_psp <= STD_LOGIC_VECTOR'("00000000");
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
        ModelA_getProbability_mux_1_itm <= '0';
        comp_compress_high_1_sva_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_compress_low_1_sva_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        unequal_tmp_6 <= '0';
        comp_compress_for_for_else_slc_svs <= '0';
        comp_compress_for_for_slc_svs <= '0';
        comp_m_output_index_range_lpi_2_dfm_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_m_output_m_NextByte_1_lpi_2_dfm <= STD_LOGIC_VECTOR'("00000000");
        comp_put_bit_plus_pending_for_i_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        exit_comp_put_bit_plus_pending_for_sva <= '0';
        comp_compress_pending_bits_1_lpi_2_dfm <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_compress_for_for_else_else_mux_2_itm_1 <= '0';
        comp_compress_for_for_else_else_mux_4_itm <= STD_LOGIC_VECTOR'("00000000000000");
        comp_compress_for_for_else_else_mux_1_itm_1 <= '0';
        comp_compress_for_for_else_else_mux_3_itm <= STD_LOGIC_VECTOR'("00000000000000");
        exit_comp_put_bit_plus_pending_1_for_sva <= '0';
        comp_m_output_index_range_lpi_2_dfm_3 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_m_output_m_NextByte_1_lpi_2_dfm_1 <= STD_LOGIC_VECTOR'("00000000");
        comp_put_bit_plus_pending_1_for_i_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_compress_for_for_and_2_itm <= '0';
        comp_m_output_m_Mask_1_lpi_5 <= STD_LOGIC_VECTOR'("00000000");
        comp_m_output_m_Mask_1_lpi_4 <= STD_LOGIC_VECTOR'("00000000");
        comp_m_output_m_NextByte_1_lpi_5 <= STD_LOGIC_VECTOR'("00000000");
        comp_m_output_m_NextByte_1_lpi_4 <= STD_LOGIC_VECTOR'("00000000");
        comp_m_output_index_range_lpi_5 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_m_output_index_range_lpi_4 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_m_output_index_range_lpi_dfm_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_compress_pending_bits_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_m_output_m_NextByte_1_lpi_dfm <= STD_LOGIC_VECTOR'("00000000");
        exit_comp_put_bit_plus_pending_2_for_sva <= '0';
        comp_m_output_index_range_lpi_dfm_3 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_m_output_m_NextByte_lpi_dfm <= STD_LOGIC_VECTOR'("00000000");
        exit_comp_put_bit_plus_pending_3_for_sva <= '0';
        comp_m_output_index_range_lpi_6 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_m_output_index_range_lpi_7 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        trans_ond_image_copy_2_y_1_sva <= STD_LOGIC_VECTOR'("00000000");
        cmodel_cumulative_frequency_vinit_ndx_1_sva <= STD_LOGIC_VECTOR'("000000000");
        exit_copy_x_2_sva <= '0';
        trans_ond_image_copy_2_x_1_sva <= STD_LOGIC_VECTOR'("000000000");
        comp_put_bit_plus_pending_2_for_i_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        comp_put_bit_plus_pending_3_for_i_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        copy_y_2_slc_itm <= '0';
        trans_ond_image_copy_2_x_1_sva_1 <= STD_LOGIC_VECTOR'("000000000");
        exit_copy_x_2_sva_dfm <= '0';
        cmodel_reset_1_for_nor_itm <= '0';
        cmodel_reset_1_for_acc_itm <= STD_LOGIC_VECTOR'("000000000");
        copy_x_2_mux_2_itm <= STD_LOGIC_VECTOR'("00000000");
        dec_m_input_input_byte_1_sva <= STD_LOGIC_VECTOR'("00000000000000000");
        cmodel_m_frozen_sva <= '0';
        dec_m_output_index_range_1_sva <= STD_LOGIC_VECTOR'("00000000000000000");
        dec_decompress_value_1_sg14_sva_1_sg17 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg16 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg15 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg14 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg13 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg12 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg11 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg10 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg9 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg8 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg7 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg6 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg5 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg4 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg3 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg2 <= '0';
        dec_decompress_value_1_sg14_sva_1_sg1 <= '0';
        dec_decompress_value_1_sg14_sva_6 <= '0';
        dec_decompress_value_1_sg13_sva_1 <= '0';
        dec_decompress_value_1_sg12_sva_1 <= '0';
        dec_decompress_value_1_sg11_sva_1 <= '0';
        dec_decompress_value_1_sg10_sva_1 <= '0';
        dec_decompress_value_1_sg9_sva_1 <= '0';
        dec_decompress_value_1_sg8_sva_1 <= '0';
        dec_decompress_value_1_sg7_sva_1 <= '0';
        dec_decompress_value_1_sg6_sva_1 <= '0';
        dec_decompress_value_1_sg5_sva_1 <= '0';
        dec_decompress_value_1_sg4_sva_1 <= '0';
        dec_decompress_value_1_sg3_sva_1 <= '0';
        dec_decompress_value_1_sg2_sva_1 <= '0';
        dec_decompress_value_1_sg1_sva_1 <= '0';
        dec_decompress_low_sva_5 <= STD_LOGIC_VECTOR'("000000000000000");
        dec_decompress_high_1_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        dec_m_input_m_CurrentByte_1_sva <= STD_LOGIC_VECTOR'("00000000");
        dec_m_input_m_LastMask_sva <= STD_LOGIC_VECTOR'("00000000");
        dec_decompress_for_i_1_sva_2 <= STD_LOGIC_VECTOR'("0000");
        dec_decompress_value_3_sva <= '0';
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
        dec_decompress_value_1_sg14_sva_5 <= '0';
        dec_decompress_value_1_sg14_sva_sg1 <= '0';
        dec_decompress_value_1_sg14_sva_sg2 <= '0';
        dec_decompress_value_1_sg14_sva_sg3 <= '0';
        dec_decompress_value_1_sg14_sva_sg4 <= '0';
        dec_decompress_value_1_sg14_sva_sg5 <= '0';
        dec_decompress_value_1_sg14_sva_sg6 <= '0';
        dec_decompress_value_1_sg14_sva_sg7 <= '0';
        dec_m_input_input_byte_1_sva_dfm <= STD_LOGIC_VECTOR'("00000000000000000");
        dec_m_input_m_LastMask_sva_dfm <= STD_LOGIC_VECTOR'("00000000");
        dec_decompress_for_i_1_sva_1 <= STD_LOGIC_VECTOR'("00000");
        unequal_tmp_8 <= '0';
        ModelA_getChar_for_i_1_sva <= STD_LOGIC_VECTOR'("000000000");
        dec_decompress_value_3_sva_1 <= '0';
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
        dec_m_input_input_byte_1_lpi_3 <= STD_LOGIC_VECTOR'("00000000000000000");
        dec_m_input_m_CurrentByte_1_lpi_3 <= STD_LOGIC_VECTOR'("00000000");
        dec_m_input_m_LastMask_lpi_3 <= STD_LOGIC_VECTOR'("00000000");
        dec_m_input_m_CurrentByte_1_sva_dfm <= STD_LOGIC_VECTOR'("00000000");
        dec_decompress_for_1_range_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        dec_decompress_for_1_scaled_value_acc_mut <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000000");
        dec_m_output_putByte_slc_svs <= '0';
        dec_m_output_index_range_1_sva_1 <= STD_LOGIC_VECTOR'("00000000000000000");
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
        cmodel_m_frozen_sva_1 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_1_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_hi_1_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_7 <= STD_LOGIC_VECTOR'("0000000");
        exit_inv_wave_Mn_Inv_Wave_Fct_for_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        inv_wave_Mn_Inv_Wave_Fct_himpairs_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        trans_ond_image_copy_3_y_1_sva <= STD_LOGIC_VECTOR'("00000000");
        inv_wave_Mn_Inv_Wave_Fct_i_1_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        exit_copy_x_3_sva <= '0';
        trans_ond_image_copy_3_x_1_sva <= STD_LOGIC_VECTOR'("000000000");
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
        copy_y_3_slc_itm <= '0';
        trans_ond_image_copy_3_x_1_sva_1 <= STD_LOGIC_VECTOR'("000000000");
        inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva_dfm_2 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        inv_wave_Mn_Inv_Wave_Fct_i_2_sg1_sva <= STD_LOGIC_VECTOR'("0000000000000000000000000000000");
        inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3 <= STD_LOGIC_VECTOR'("000000000000000000000000000000");
        inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg28_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg27_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg26_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg25_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg24_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg23_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg22_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg21_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg20_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg19_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg18_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg17_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg16_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg15_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg29_sva_dfm_2 <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_dfm_3 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_dfm_3 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_for_1_slc_2_mdf_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_2 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_2 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        inv_wave_Inv_Wave_y_sva <= STD_LOGIC_VECTOR'("00000000");
        hsplit_x_and_cse_sva <= '0';
        inv_wave_Inv_Wave_x_sva <= STD_LOGIC_VECTOR'("000000000");
        hsplit_y_slc_inv_wave_Inv_Wave_x_27_itm <= STD_LOGIC_VECTOR'("00000");
        hsplit_y_slc_inv_wave_Inv_Wave_x_13_itm <= STD_LOGIC_VECTOR'("00000");
        hsplit_y_slc_inv_wave_Inv_Wave_x_26_itm <= STD_LOGIC_VECTOR'("000000");
        hsplit_y_slc_inv_wave_Inv_Wave_x_9_itm <= STD_LOGIC_VECTOR'("000000");
        hsplit_y_slc_inv_wave_Inv_Wave_x_16_itm <= STD_LOGIC_VECTOR'("000000");
        hsplit_y_slc_inv_wave_Inv_Wave_x_17_itm <= STD_LOGIC_VECTOR'("000000");
        hsplit_y_acc_76_psp <= STD_LOGIC_VECTOR'("000000000");
        hsplit_y_acc_75_psp <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_acc_psp <= STD_LOGIC_VECTOR'("000000000");
        hsplit_y_acc_2_itm <= STD_LOGIC_VECTOR'("00000000000000000");
        reg_hsplit_y_acc_5_cse_sva_cse <= STD_LOGIC_VECTOR'("00000000000");
        hsplit_y_slc_13_itm <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_slc_11_itm <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_slc_9_itm <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_acc_63_itm <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_acc_46_itm <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_acc_38_itm <= STD_LOGIC_VECTOR'("00000000");
        reg_hsplit_y_acc_30_itm_cse <= STD_LOGIC_VECTOR'("00000000");
        inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_mdf_sva <= '0';
        inv_wave_image_copy_y_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_1_mdf_sva <= '0';
        inv_wave_Mn_Inv_Wave_Fct_for_1_nand_svs <= '0';
        inv_wave_Inv_Wave_1_y_sva <= STD_LOGIC_VECTOR'("00000000");
        inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_3 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_3 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        hsplit_x_1_and_cse_sva <= '0';
        inv_wave_Inv_Wave_1_x_sva <= STD_LOGIC_VECTOR'("000000000");
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_27_itm <= STD_LOGIC_VECTOR'("00000");
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_13_itm <= STD_LOGIC_VECTOR'("00000");
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_26_itm <= STD_LOGIC_VECTOR'("000000");
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_9_itm <= STD_LOGIC_VECTOR'("000000");
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_16_itm <= STD_LOGIC_VECTOR'("000000");
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_17_itm <= STD_LOGIC_VECTOR'("000000");
        hsplit_y_1_acc_76_psp <= STD_LOGIC_VECTOR'("000000000");
        hsplit_y_1_acc_75_psp <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_1_acc_psp <= STD_LOGIC_VECTOR'("000000000");
        hsplit_y_1_acc_2_itm <= STD_LOGIC_VECTOR'("00000000000000000");
        hsplit_y_1_slc_Vga_3_cse_sva <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_1_slc_13_itm <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_1_slc_11_itm <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_1_slc_9_itm <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_1_acc_63_itm <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_1_acc_46_itm <= STD_LOGIC_VECTOR'("00000000");
        hsplit_y_1_acc_38_itm <= STD_LOGIC_VECTOR'("00000000");
        inv_wave_image_copy_x_sva <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        exit_copy_y_4_sva <= '0';
        copy_y_4_slc_inv_wave_image_copy_x_1_itm <= STD_LOGIC_VECTOR'("000000");
        reg_hsplit_y_1_acc_sdt_tmp_7 <= STD_LOGIC_VECTOR'("00");
        reg_hsplit_y_1_acc_67_sdt_tmp_8 <= STD_LOGIC_VECTOR'("00");
        reg_hsplit_y_acc_sdt_tmp_7 <= STD_LOGIC_VECTOR'("00");
        reg_hsplit_y_acc_67_sdt_tmp_8 <= STD_LOGIC_VECTOR'("00");
        reg_div_mgc_div_b_tmp_1 <= STD_LOGIC_VECTOR'("00000000000000000000000000000000");
        reg_div_mgc_div_a_tmp <= STD_LOGIC_VECTOR'("000");
        reg_div_mgc_div_a_tmp_1 <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000");
        reg_passe_y_acc_46_sdt_tmp_7 <= STD_LOGIC_VECTOR'("00");
        reg_passe_y_acc_43_sdt_tmp_6 <= STD_LOGIC_VECTOR'("00");
        reg_slc_slc_tmp_5 <= STD_LOGIC_VECTOR'("00");
        reg_passe_y_1_acc_44_sdt_tmp_6 <= STD_LOGIC_VECTOR'("00");
        reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp <= '0';
        reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1 <= STD_LOGIC_VECTOR'("000000");
        reg_comp_m_output_m_Mask_2_lpi_dfm_tmp <= '0';
        reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1 <= STD_LOGIC_VECTOR'("0000000");
        reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp <= '0';
        reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1 <= STD_LOGIC_VECTOR'("0000000");
        reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp <= '0';
        reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1 <= STD_LOGIC_VECTOR'("0000000");
      ELSIF ( core_wen_drv = '1' ) THEN
        dec_decompress_for_1_for_else_else_land_lpi_2_dfm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx0w0
            & dec_decompress_for_1_for_else_else_land_lpi_2_dfm), or_dcpl_1897 OR
            (NOT (fsm_output(97))));
        ModelA_getChar_for_if_p_count_lpi_1 <= MUX_v_32_2_2(ModelA_getChar_for_if_p_count_lpi_1
            & ModelA_getChar_for_if_p_count_lpi_1_dfm, or_dcpl_2610);
        ModelA_getChar_for_if_p_high_lpi_1 <= MUX_v_32_2_2(ModelA_getChar_for_if_p_high_lpi_1
            & ModelA_getChar_for_if_p_high_lpi_1_dfm, or_dcpl_2610);
        ModelA_getChar_for_if_p_low_lpi_1 <= MUX_v_32_2_2(ModelA_getChar_for_if_p_low_lpi_1
            & ModelA_getChar_for_if_p_low_lpi_1_dfm, or_dcpl_2610);
        Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d_drv <= MUX1HOT_v_32_3_2(comp_m_output_index_range_lpi_7
            & comp_m_output_index_range_lpi_6 & Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d_drv,
            STD_LOGIC_VECTOR'(((comp_compress_low_1_sva_1(14)) AND (fsm_output(136)))
            & ((NOT (comp_compress_low_1_sva_1(14))) AND (fsm_output(136))) & (NOT
            (fsm_output(136)))));
        cmodel_m_frozen_1_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(ModelA_getProbability_mux_1_itm
            & cmodel_m_frozen_1_sva), NOT((fsm_output(54)) OR (fsm_output(1)))))
            AND (NOT (fsm_output(1)));
        trans_ond_Mn_Trans_Ond_hi_7_sg7_sva <= (trans_ond_Mn_Trans_Ond_hi_7_sg7_sva
            AND (NOT (fsm_output(39)))) OR (fsm_output(1));
        trans_ond_Mn_Trans_Ond_hi_7_sg6_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg6_sva
            & (trans_ond_Mn_Trans_Ond_hi_7_sg7_sva AND (NOT levels_nand_svs))), or_2695_cse))
            OR (fsm_output(1));
        trans_ond_Mn_Trans_Ond_hi_7_sg5_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg5_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(levels_asn_4_itm & levels_asn_3_itm),
            levels_nand_svs))), fsm_output(39))) OR (fsm_output(1));
        trans_ond_Mn_Trans_Ond_hi_7_sg4_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg4_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg5_sva
            & levels_asn_4_itm), levels_nand_svs))), fsm_output(39))) OR (fsm_output(1));
        trans_ond_Mn_Trans_Ond_hi_7_sg3_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg3_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg4_sva
            & trans_ond_Mn_Trans_Ond_hi_7_sg5_sva), levels_nand_svs))), fsm_output(39)))
            AND (NOT (fsm_output(1)));
        trans_ond_Mn_Trans_Ond_hi_7_sg2_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg2_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg3_sva
            & trans_ond_Mn_Trans_Ond_hi_7_sg4_sva), levels_nand_svs))), fsm_output(39)))
            AND (NOT (fsm_output(1)));
        trans_ond_Mn_Trans_Ond_hi_7_sg1_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg1_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg2_sva
            & trans_ond_Mn_Trans_Ond_hi_7_sg3_sva), levels_nand_svs))), fsm_output(39)))
            AND (NOT (fsm_output(1)));
        trans_ond_Mn_Trans_Ond_wi_7_sg8_sva <= (trans_ond_Mn_Trans_Ond_wi_7_sg8_sva
            AND (NOT (fsm_output(39)))) OR (fsm_output(1));
        trans_ond_Mn_Trans_Ond_wi_7_sg7_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg7_sva
            & (trans_ond_Mn_Trans_Ond_wi_7_sg8_sva AND (NOT levels_nand_svs))), or_2695_cse))
            AND (NOT (fsm_output(1)));
        trans_ond_Mn_Trans_Ond_wi_7_sg6_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg6_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(levels_asn_15_itm & levels_asn_14_itm),
            levels_nand_svs))), fsm_output(39))) OR (fsm_output(1));
        trans_ond_Mn_Trans_Ond_wi_7_sg5_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg5_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg6_sva
            & levels_asn_15_itm), levels_nand_svs))), fsm_output(39))) AND (NOT (fsm_output(1)));
        trans_ond_Mn_Trans_Ond_wi_7_sg4_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg4_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg5_sva
            & trans_ond_Mn_Trans_Ond_wi_7_sg6_sva), levels_nand_svs))), fsm_output(39)))
            AND (NOT (fsm_output(1)));
        trans_ond_Mn_Trans_Ond_wi_7_sg3_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg3_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg4_sva
            & trans_ond_Mn_Trans_Ond_wi_7_sg5_sva), levels_nand_svs))), fsm_output(39)))
            AND (NOT (fsm_output(1)));
        trans_ond_Mn_Trans_Ond_wi_7_sg2_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg2_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg3_sva
            & trans_ond_Mn_Trans_Ond_wi_7_sg4_sva), levels_nand_svs))), fsm_output(39)))
            AND (NOT (fsm_output(1)));
        trans_ond_Mn_Trans_Ond_wi_7_sg1_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg1_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg2_sva
            & trans_ond_Mn_Trans_Ond_wi_7_sg3_sva), levels_nand_svs))), fsm_output(39)))
            AND (NOT (fsm_output(1)));
        trans_ond_image_copy_y_1_sva <= (MUX_v_8_2_2(trans_ond_image_copy_y_1_sva
            & z_out_25, fsm_output(7))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(1)), 1),8));
        reg_nblevels_triosy_mgc_io_sync_iswt0_cse <= or_dcpl_633 AND exit_inv_wave_Mn_Inv_Wave_Fct_for_1_sva_mx0;
        reg_Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_iswt0_cse
            <= fsm_output(136);
        reg_start_sync_mgc_bsync_vld_iswt0_cse <= NOT(or_dcpl_2643 OR (fsm_output(3))
            OR (fsm_output(37)) OR (fsm_output(6)) OR (fsm_output(7)) OR (fsm_output(34))
            OR or_dcpl_1339 OR (fsm_output(9)) OR (fsm_output(22)) OR (fsm_output(21))
            OR (fsm_output(32)) OR (fsm_output(49)) OR (fsm_output(50)) OR (fsm_output(51))
            OR or_dcpl_1331 OR (fsm_output(78)) OR (fsm_output(75)) OR (fsm_output(79))
            OR or_dcpl_3274 OR (fsm_output(62)) OR (fsm_output(48)) OR or_dcpl_1038
            OR (fsm_output(47)) OR (fsm_output(81)) OR or_dcpl_3267 OR or_dcpl_594
            OR (fsm_output(43)) OR (fsm_output(42)) OR (fsm_output(44)) OR (fsm_output(69))
            OR (fsm_output(57)) OR or_dcpl_741 OR or_dcpl_1308 OR or_dcpl_693 OR
            or_dcpl_3251 OR or_dcpl_1017 OR or_dcpl_3249 OR (fsm_output(41)) OR (fsm_output(60))
            OR (fsm_output(72)) OR or_dcpl_90 OR (fsm_output(23)) OR (fsm_output(24))
            OR or_dcpl_121 OR or_dcpl_3236 OR or_dcpl_3233 OR or_dcpl_3225 OR or_dcpl_677
            OR or_dcpl_671 OR or_dcpl_3220 OR or_dcpl_3217 OR or_dcpl_666 OR or_dcpl_3214
            OR (fsm_output(128)) OR (fsm_output(1)) OR (fsm_output(137)) OR (fsm_output(90))
            OR (fsm_output(111)) OR or_dcpl_2439 OR or_dcpl_658 OR (fsm_output(83))
            OR (fsm_output(40)) OR or_dcpl_3202 OR or_dcpl_3198 OR or_dcpl_996 OR
            (fsm_output(5)) OR (fsm_output(16)) OR (fsm_output(17)) OR or_dcpl_2537
            OR or_dcpl_2527 OR or_dcpl_39 OR (fsm_output(101)) OR (fsm_output(12))
            OR (fsm_output(14)) OR (fsm_output(4)) OR or_dcpl_36 OR or_dcpl_1257
            OR or_dcpl_3175 OR (fsm_output(2)) OR (fsm_output(70)) OR (fsm_output(107))
            OR or_dcpl_3173 OR or_dcpl_2058 OR or_dcpl_634 OR (fsm_output(100)) OR
            (fsm_output(104)) OR or_dcpl_3164);
        reg_Vga_rsc_singleport_iswt0_cse <= or_3326_rmff;
        reg_Comp_rsc_singleport_iswt0_cse <= or_3373_rmff;
        reg_Src_rsc_singleport_iswt0_cse <= or_3401_rmff;
        div_mgc_div_1_b <= MUX1HOT_v_32_3_2(ModelA_getProbability_p_count_sva & div_mgc_div_1_b_mx1
            & ModelA_getChar_for_if_p_count_lpi_1_dfm, STD_LOGIC_VECTOR'((or_dcpl_3385
            OR or_dcpl_596) & (fsm_output(90)) & or_dcpl_3233));
        div_mgc_div_1_a <= MUX1HOT_v_64_3_2(z_out_28 & comp_compress_for_mul_mut
            & dec_decompress_for_1_mul_1_mut, STD_LOGIC_VECTOR'(or_5990_cse & (or_dcpl_597
            OR (fsm_output(51)) OR (fsm_output(48))) & or_dcpl_3233));
        trans_ond_image_copy_x_1_sva <= (MUX_v_9_2_2(trans_ond_image_copy_x_1_sva_1
            & trans_ond_image_copy_x_1_sva, NOT((fsm_output(3)) OR (fsm_output(6)))))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(3)), 1),9));
        nblevels_1_sva <= MUX_v_4_2_2(nblevels_rsc_mgc_in_wire_d & nblevels_1_sva,
            or_dcpl_2643 OR (fsm_output(3)) OR (fsm_output(37)) OR (fsm_output(6))
            OR (fsm_output(7)) OR (fsm_output(34)) OR or_dcpl_1339 OR (fsm_output(9))
            OR (fsm_output(22)) OR (fsm_output(21)) OR (fsm_output(32)) OR or_dcpl_3385
            OR or_dcpl_3403 OR or_dcpl_3520 OR or_dcpl_1040 OR (fsm_output(48)) OR
            or_dcpl_1038 OR (fsm_output(47)) OR (fsm_output(81)) OR (fsm_output(64))
            OR (fsm_output(71)) OR or_dcpl_3508 OR or_dcpl_1314 OR (fsm_output(69))
            OR or_dcpl_3502 OR or_dcpl_1308 OR (fsm_output(63)) OR (fsm_output(65))
            OR (fsm_output(54)) OR (fsm_output(61)) OR or_dcpl_1017 OR (fsm_output(30))
            OR or_dcpl_53 OR (fsm_output(29)) OR (fsm_output(41)) OR (fsm_output(60))
            OR (fsm_output(72)) OR (fsm_output(25)) OR or_dcpl_2626 OR or_dcpl_121
            OR (fsm_output(85)) OR or_dcpl_1285 OR (fsm_output(89)) OR or_dcpl_3407
            OR or_dcpl_3472 OR or_dcpl_1278 OR (fsm_output(82)) OR (fsm_output(97))
            OR (fsm_output(99)) OR (fsm_output(90)) OR or_dcpl_1271 OR (fsm_output(40))
            OR or_dcpl_3327 OR or_dcpl_3458 OR or_dcpl_3454 OR or_dcpl_2651 OR or_dcpl_1257
            OR (fsm_output(86)) OR (fsm_output(45)) OR (fsm_output(2)) OR (fsm_output(70)));
        exit_copy_x_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(((NOT (z_out_51(4))) OR
            exit_copy_x_sva) & exit_copy_x_sva), NOT((fsm_output(7)) OR (fsm_output(1)))))
            AND (NOT (fsm_output(1)));
        cmodel_cumulative_frequency_vinit_ndx_sva <= MUX1HOT_v_9_3_2(STD_LOGIC_VECTOR'("100000001")
            & cmodel_cumulative_frequency_vinit_ndx_sva & cmodel_reset_for_acc_itm,
            STD_LOGIC_VECTOR'((fsm_output(1)) & (or_dcpl_3160 OR (fsm_output(5))
            OR (fsm_output(4)) OR (fsm_output(2))) & (fsm_output(7))));
        cmodel_reset_for_acc_itm <= MUX_v_9_2_2(z_out_4 & cmodel_reset_for_acc_itm,
            or_dcpl_3160 OR (fsm_output(5)) OR (fsm_output(4)));
        cmodel_reset_for_nor_itm <= NOT((cmodel_cumulative_frequency_vinit_ndx_sva(8))
            OR (cmodel_cumulative_frequency_vinit_ndx_sva(7)) OR (cmodel_cumulative_frequency_vinit_ndx_sva(6))
            OR (cmodel_cumulative_frequency_vinit_ndx_sva(5)) OR (cmodel_cumulative_frequency_vinit_ndx_sva(4))
            OR (cmodel_cumulative_frequency_vinit_ndx_sva(3)) OR (cmodel_cumulative_frequency_vinit_ndx_sva(2))
            OR (cmodel_cumulative_frequency_vinit_ndx_sva(1)) OR (cmodel_cumulative_frequency_vinit_ndx_sva(0)));
        copy_y_slc_itm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(copy_y_slc_itm & (z_out_5(3))),
            fsm_output(4));
        reg_copy_y_acc_8_psp_cse <= z_out_30;
        trans_ond_image_copy_x_1_sva_1 <= MUX_v_9_2_2(trans_ond_image_copy_x_1_sva_1
            & z_out_4, fsm_output(4));
        trans_ond_Mn_Trans_Ond_i_1_sg1_sva_2 <= (MUX_v_2_2_2((trans_ond_Mn_Trans_Ond_i_1_sg1_sva_1(1
            DOWNTO 0)) & trans_ond_Mn_Trans_Ond_i_1_sg1_sva_2, and_dcpl_301)) AND
            STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(8)), 1),2));
        comp_byte_to_encode_1_sva <= comp_getByte_mux_2_itm AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(fsm_output(54),
            1),17));
        comp_m_output_index_range_lpi_2 <= (MUX1HOT_v_32_3_2(comp_m_output_index_range_lpi_2
            & comp_m_output_index_range_lpi_5 & comp_m_output_index_range_lpi_4,
            STD_LOGIC_VECTOR'(or_5991_cse & and_568_cse & and_570_cse))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            or_dcpl_1038, 1),32));
        comp_m_output_m_NextByte_1_lpi_2 <= (MUX1HOT_v_8_3_2(comp_m_output_m_NextByte_1_lpi_2
            & comp_m_output_m_NextByte_1_lpi_5 & comp_m_output_m_NextByte_1_lpi_4,
            STD_LOGIC_VECTOR'(or_5991_cse & and_568_cse & and_570_cse))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            or_dcpl_1038, 1),8));
        comp_m_output_m_Mask_1_lpi_2 <= MUX1HOT_v_8_4_2(STD_LOGIC_VECTOR'("10000000")
            & comp_m_output_m_Mask_1_lpi_2 & comp_m_output_m_Mask_1_lpi_5 & comp_m_output_m_Mask_1_lpi_4,
            STD_LOGIC_VECTOR'(or_dcpl_1038 & or_5991_cse & and_568_cse & and_570_cse));
        comp_compress_pending_bits_1_lpi_2 <= (MUX_v_32_2_2(comp_compress_pending_bits_1_lpi_2
            & (comp_compress_pending_bits_1_lpi_2_dfm AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(comp_compress_for_for_else_slc_svs,
            1),32)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT comp_compress_for_for_slc_svs,
            1),32))), fsm_output(60))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            or_dcpl_1038, 1),32));
        comp_compress_low_1_sva_4 <= (MUX_v_15_2_2((comp_compress_low_1_sva_1(14
            DOWNTO 0)) & comp_compress_low_1_sva_4, and_323_cse)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            or_dcpl_1038, 1),15));
        comp_compress_high_1_sva <= MUX1HOT_v_32_3_2(STD_LOGIC_VECTOR'("00000000000000001111111111111111")
            & comp_compress_high_1_sva_1 & comp_compress_high_1_sva, STD_LOGIC_VECTOR'(or_dcpl_1038
            & (fsm_output(54)) & and_323_cse));
        trans_ond_Trans_Ond_y_1_sva <= (MUX_v_7_2_2(z_out_31 & trans_ond_Trans_Ond_y_1_sva,
            NOT((fsm_output(20)) OR (fsm_output(9))))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(9)), 1),7));
        passe_x_acc_3_cse_sg1 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((z_out_25(7)) & passe_x_acc_3_cse_sg1),
            or_dcpl_2643 OR (fsm_output(20)) OR (fsm_output(31)) OR (fsm_output(22))
            OR (fsm_output(21)) OR (fsm_output(32)) OR (fsm_output(30)) OR (fsm_output(27))
            OR or_dcpl_3247 OR (fsm_output(25)) OR or_dcpl_2626 OR or_dcpl_3458 OR
            or_dcpl_3454 OR or_dcpl_36);
        trans_ond_Trans_Ond_x_1_sva <= (MUX_v_8_2_2(z_out_25 & trans_ond_Trans_Ond_x_1_sva,
            (fsm_output(19)) OR (fsm_output(16)) OR (fsm_output(17)) OR (fsm_output(18))
            OR or_dcpl_260 OR (fsm_output(14)) OR (fsm_output(13)))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(10)), 1),8));
        exit_passe_y_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(exit_passe_y_sva & (NOT
            (z_out_38(9)))), fsm_output(11));
        trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_3_itm <= MUX_v_6_2_2((trans_ond_Trans_Ond_x_1_sva_mx0(5
            DOWNTO 0)) & trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_3_itm, and_dcpl_307);
        trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_5_itm <= MUX_v_6_2_2((trans_ond_Trans_Ond_x_1_sva_mx0(5
            DOWNTO 0)) & trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_5_itm, and_dcpl_307);
        passe_y_slc_trans_ond_Trans_Ond_x_1_itm <= MUX_v_6_2_2((trans_ond_Trans_Ond_x_1_sva_mx0(5
            DOWNTO 0)) & passe_y_slc_trans_ond_Trans_Ond_x_1_itm, and_dcpl_307);
        trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_6_itm <= MUX_v_5_2_2((trans_ond_Trans_Ond_x_1_sva_mx0(4
            DOWNTO 0)) & trans_ond_Trans_Ond_x_slc_trans_ond_Trans_Ond_x_6_itm, and_dcpl_307);
        passe_y_acc_13_itm <= MUX_v_17_2_2(passe_y_acc_13_itm & z_out_6, fsm_output(11));
        passe_y_acc_51_psp <= MUX_v_9_2_2(passe_y_acc_51_psp & z_out_32, fsm_output(11));
        passe_y_acc_7_itm <= MUX_v_16_2_2(passe_y_acc_7_itm & z_out_7, fsm_output(11));
        passe_y_acc_psp <= MUX_v_8_2_2(passe_y_acc_psp & z_out_36, fsm_output(11));
        passe_y_acc_49_psp <= z_out_34;
        trans_ond_moy_slc_Src_3_cse_sva <= Src_rsc_singleport_data_out_mxwt;
        trans_ond_sub_2_acc_1_cse_sva <= MUX_v_8_2_2(trans_ond_sub_2_acc_1_cse_sva
            & (z_out_8(7 DOWNTO 0)), fsm_output(13));
        trans_ond_moy_1_acc_cse_sg1_sva <= MUX_v_8_2_2(trans_ond_moy_1_acc_cse_sg1_sva
            & (z_out_11(8 DOWNTO 1)), fsm_output(13));
        trans_ond_sub_5_acc_1_itm <= MUX_v_8_2_2(trans_ond_sub_5_acc_1_itm & (z_out_9(7
            DOWNTO 0)), fsm_output(15));
        trans_ond_moy_5_slc_itm <= MUX_v_8_2_2(trans_ond_moy_5_slc_itm & (z_out_12(8
            DOWNTO 1)), fsm_output(15));
        reg_trans_ond_sub_acc_1_itm_cse <= z_out_8(7 DOWNTO 0);
        trans_ond_image_copy_1_y_1_sva <= (MUX_v_8_2_2(trans_ond_image_copy_1_y_1_sva_1
            & trans_ond_image_copy_1_y_1_sva, NOT((fsm_output(38)) OR (fsm_output(33)))))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(33)), 1),8));
        levels_nand_svs <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(levels_nand_svs & levels_nand_tmp),
            fsm_output(21));
        trans_ond_Trans_Ond_1_y_1_sva <= (MUX_v_6_2_2(trans_ond_Trans_Ond_1_y_1_sva_1
            & trans_ond_Trans_Ond_1_y_1_sva, NOT((fsm_output(21)) OR (fsm_output(32)))))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(21)), 1),6));
        trans_ond_Trans_Ond_1_x_1_sva <= (MUX_v_7_2_2(z_out_31 & trans_ond_Trans_Ond_1_x_1_sva,
            (fsm_output(31)) OR (fsm_output(30)) OR or_dcpl_53 OR (fsm_output(29))
            OR (fsm_output(25)) OR (fsm_output(26)) OR (fsm_output(24)))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(22)), 1),7));
        exit_passe_y_1_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(exit_passe_y_1_sva &
            (NOT (z_out_40(8)))), fsm_output(23));
        trans_ond_Trans_Ond_1_x_slc_trans_ond_Trans_Ond_1_x_4_itm <= MUX_v_6_2_2(((trans_ond_Trans_Ond_1_x_1_sva(5
            DOWNTO 0)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(22)),
            1),6))) & trans_ond_Trans_Ond_1_x_slc_trans_ond_Trans_Ond_1_x_4_itm,
            NOT((fsm_output(31)) OR (fsm_output(22))));
        passe_y_1_acc_13_itm <= MUX_v_16_2_2(passe_y_1_acc_13_itm & z_out_7, fsm_output(23));
        passe_y_1_acc_49_psp <= MUX_v_8_2_2(passe_y_1_acc_49_psp & z_out_36, fsm_output(23));
        passe_y_1_acc_7_itm <= MUX_v_15_2_2(passe_y_1_acc_7_itm & STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED((passe_y_1_acc_43_itm(9
            DOWNTO 1)) & (trans_ond_Trans_Ond_1_x_1_sva(5 DOWNTO 0))) + CONV_UNSIGNED(UNSIGNED'(trans_ond_Mn_Trans_Ond_wi_7_sg8_sva
            & trans_ond_Mn_Trans_Ond_wi_7_sg7_sva & trans_ond_Mn_Trans_Ond_wi_7_sg6_sva
            & trans_ond_Mn_Trans_Ond_wi_7_sg5_sva & trans_ond_Mn_Trans_Ond_wi_7_sg4_sva
            & trans_ond_Mn_Trans_Ond_wi_7_sg3_sva & trans_ond_Mn_Trans_Ond_wi_7_sg2_sva),
            15), 15)), fsm_output(23));
        passe_y_1_acc_1_cse_1_sva <= MUX_v_9_2_2(passe_y_1_acc_1_cse_1_sva & (passe_y_1_acc_43_itm(9
            DOWNTO 1)), fsm_output(23));
        passe_y_1_acc_psp <= passe_y_1_acc_psp_1;
        trans_ond_moy_slc_Comp_11_cse_sva <= Comp_rsc_singleport_data_out_mxwt;
        trans_ond_sub_8_acc_1_cse_sva <= MUX_v_8_2_2(trans_ond_sub_8_acc_1_cse_sva
            & (z_out_8(7 DOWNTO 0)), fsm_output(25));
        trans_ond_moy_7_acc_cse_sg1_sva <= MUX_v_8_2_2(trans_ond_moy_7_acc_cse_sg1_sva
            & (z_out_11(8 DOWNTO 1)), fsm_output(25));
        trans_ond_sub_11_acc_1_itm <= MUX_v_8_2_2(trans_ond_sub_11_acc_1_itm & (z_out_9(7
            DOWNTO 0)), fsm_output(27));
        trans_ond_moy_11_slc_itm <= MUX_v_8_2_2(trans_ond_moy_11_slc_itm & (z_out_12(8
            DOWNTO 1)), fsm_output(27));
        trans_ond_image_copy_1_x_1_sva_2 <= (MUX_v_8_2_2((trans_ond_image_copy_1_x_1_sva_1(7
            DOWNTO 0)) & trans_ond_image_copy_1_x_1_sva_2, (fsm_output(37)) OR (fsm_output(36))))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(34)), 1),8));
        levels_asn_15_itm <= trans_ond_Mn_Trans_Ond_wi_7_sg7_sva;
        levels_asn_14_itm <= trans_ond_Mn_Trans_Ond_wi_7_sg8_sva;
        levels_asn_4_itm <= trans_ond_Mn_Trans_Ond_hi_7_sg6_sva;
        levels_asn_3_itm <= trans_ond_Mn_Trans_Ond_hi_7_sg7_sva;
        exit_copy_y_1_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(exit_copy_y_1_sva & (NOT
            (readindex(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED(trans_ond_image_copy_1_x_1_sva_1
            & TO_STDLOGICVECTOR('1')), 11) + CONV_SIGNED(SIGNED'('1' & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg8_sva)
            & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg7_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg6_sva)
            & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg5_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg4_sva)
            & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg3_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg2_sva)
            & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg1_sva) & '1'), 11), 11)), 10)))),
            fsm_output(35));
        trans_ond_image_copy_1_x_slc_trans_ond_image_copy_1_x_1_itm <= MUX_v_6_2_2(((trans_ond_image_copy_1_x_1_sva_2(5
            DOWNTO 0)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(34)),
            1),6))) & trans_ond_image_copy_1_x_slc_trans_ond_image_copy_1_x_1_itm,
            NOT((fsm_output(37)) OR (fsm_output(34))));
        copy_y_1_acc_psp <= copy_y_1_acc_psp_1;
        ModelA_getProbability_p_count_sva <= MUX_v_32_2_2(ModelA_getProbability_p_count_sva
            & cmodel_cumulative_frequency_rsc_singleport_data_out, fsm_output(40));
        comp_getByte_slc_mdf_sva <= z_out_32(7);
        comp_getByte_mux_2_itm <= MUX1HOT_v_17_3_2(z_out_16 & STD_LOGIC_VECTOR'("10010110000000000")
            & comp_getByte_mux_2_itm, STD_LOGIC_VECTOR'(and_dcpl_290 & ((fsm_output(40))
            AND (NOT (z_out_32(7)))) & (or_dcpl_3385 OR or_dcpl_596 OR or_dcpl_3508
            OR or_dcpl_1314 OR or_dcpl_3502 OR or_dcpl_1308 OR or_dcpl_3553 OR or_dcpl_736)));
        ModelA_update_for_i_sva_sg1 <= (MUX_v_23_2_2((z_out(31 DOWNTO 9)) & ModelA_update_for_i_sva_sg1,
            (fsm_output(46)) OR (fsm_output(45)))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(43)), 1),23));
        ModelA_update_for_i_sva_2 <= MUX1HOT_v_9_3_2(z_out_4 & ModelA_update_for_i_sva_2
            & (z_out(8 DOWNTO 0)), STD_LOGIC_VECTOR'((fsm_output(41)) & ((fsm_output(46))
            OR (fsm_output(43)) OR or_dcpl_3689) & (fsm_output(44))));
        exit_ModelA_update_for_sva <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((NOT (z_out_40(8)))
            & exit_ModelA_update_for_sva & (NOT (z_out_46(30)))), STD_LOGIC_VECTOR'((fsm_output(41))
            & or_dcpl_3689 & (fsm_output(44))));
        comp_compress_for_c_sg1_2_lpi_1_dfm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(comp_compress_for_c_sg1_2_lpi_1_dfm_1
            & comp_compress_for_c_sg1_2_lpi_1_dfm), or_3734_cse);
        comp_compress_for_c_1_lpi_1_dfm <= MUX_v_8_2_2(comp_compress_for_c_1_lpi_1_dfm_1
            & comp_compress_for_c_1_lpi_1_dfm, or_3734_cse);
        ModelA_getProbability_p_high_sva <= MUX_v_32_2_2(ModelA_getProbability_p_high_sva
            & cmodel_cumulative_frequency_rsc_singleport_data_out, fsm_output(42));
        ModelA_getProbability_p_low_sva <= MUX_v_32_2_2(ModelA_getProbability_p_low_sva
            & cmodel_cumulative_frequency_rsc_singleport_data_out, fsm_output(43));
        slc_ModelA_update_for_i_itm <= MUX_v_9_2_2(ModelA_update_for_i_sva_2 & slc_ModelA_update_for_i_itm,
            NOT((fsm_output(46)) OR (fsm_output(43))));
        comp_compress_for_mul_1_psp <= MUX_v_64_2_2(comp_compress_for_mul_1_psp &
            (z_out_29(63 DOWNTO 0)), fsm_output(47));
        comp_compress_for_acc_3_itm <= MUX_v_16_2_2(comp_compress_for_acc_3_itm &
            z_out_17, fsm_output(47));
        comp_compress_for_mul_mut <= MUX_v_64_2_2(comp_compress_for_mul_mut & z_out_28,
            fsm_output(47));
        ModelA_getProbability_mux_1_itm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(((NOT (ModelA_update_acc_2(32)))
            OR cmodel_m_frozen_1_sva) & ModelA_getProbability_mux_1_itm), or_dcpl_3385
            OR or_dcpl_3734 OR (fsm_output(55)) OR or_dcpl_3731 OR (fsm_output(56))
            OR or_dcpl_3552 OR (fsm_output(60)));
        comp_compress_high_1_sva_1 <= MUX1HOT_v_32_3_2(z_out_18 & comp_compress_high_1_sva_1
            & (STD_LOGIC_VECTOR'("0000000000000000") & (MUX_v_15_2_2((comp_compress_high_1_sva_1(14
            DOWNTO 0)) & (TO_STDLOGICVECTOR(comp_compress_for_for_else_else_mux_2_itm_1)
            & comp_compress_for_for_else_else_mux_4_itm), comp_compress_for_for_and_2_itm))
            & TO_STDLOGICVECTOR('1')), STD_LOGIC_VECTOR'((fsm_output(52)) & (or_dcpl_3734
            OR or_dcpl_741 OR or_dcpl_1308 OR (fsm_output(54))) & (fsm_output(60))));
        comp_compress_low_1_sva_1 <= MUX1HOT_v_32_3_2(z_out_19 & comp_compress_low_1_sva_1
            & (STD_LOGIC_VECTOR'("0000000000000000") & (MUX_v_15_2_2((comp_compress_low_1_sva_1(14
            DOWNTO 0)) & (TO_STDLOGICVECTOR(comp_compress_for_for_else_else_mux_1_itm_1)
            & comp_compress_for_for_else_else_mux_3_itm), comp_compress_for_for_and_2_itm))
            & TO_STDLOGICVECTOR('0')), STD_LOGIC_VECTOR'((fsm_output(53)) & (or_dcpl_3403
            OR or_dcpl_3520 OR or_dcpl_1040 OR (fsm_output(81)) OR or_dcpl_3267 OR
            (fsm_output(69)) OR (fsm_output(57)) OR (fsm_output(55)) OR or_dcpl_3731
            OR (fsm_output(56)) OR (fsm_output(63)) OR (fsm_output(65)) OR or_dcpl_3251
            OR or_dcpl_1251 OR (fsm_output(85)) OR or_dcpl_1285 OR or_dcpl_1429 OR
            (fsm_output(93)) OR or_dcpl_1427 OR or_dcpl_3225 OR or_dcpl_677 OR or_dcpl_671
            OR (fsm_output(108)) OR or_dcpl_669 OR (fsm_output(103)) OR (fsm_output(99))
            OR (fsm_output(127)) OR or_dcpl_3214 OR or_dcpl_3776 OR or_dcpl_2439
            OR or_dcpl_658 OR (fsm_output(83)) OR or_dcpl_655 OR or_dcpl_3767 OR
            (fsm_output(102)) OR (fsm_output(68)) OR or_dcpl_2537 OR (fsm_output(125))
            OR or_dcpl_3759 OR (fsm_output(67)) OR (fsm_output(86)) OR (fsm_output(70))
            OR or_dcpl_2569 OR or_dcpl_3752 OR or_dcpl_2058 OR or_dcpl_634 OR (fsm_output(100))
            OR or_dcpl_633) & (fsm_output(60))));
        unequal_tmp_6 <= unequal_tmp_10;
        comp_compress_for_for_else_slc_svs <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(comp_compress_for_for_else_slc_svs
            & (z_out_42(17))), fsm_output(54));
        comp_compress_for_for_slc_svs <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(comp_compress_for_for_slc_svs
            & (z_out_43(17))), fsm_output(54));
        comp_m_output_index_range_lpi_2_dfm_1 <= MUX1HOT_v_32_3_2(comp_m_output_index_range_lpi_2_dfm_1_mx1w0
            & comp_m_output_index_range_lpi_2_dfm_1 & (STD_LOGIC_VECTOR'("000000000000000")
            & z_out_16), STD_LOGIC_VECTOR'((fsm_output(54)) & (or_dcpl_1310 OR (or_3864_tmp
            AND (fsm_output(56)))) & ((NOT or_3864_tmp) AND (fsm_output(56)))));
        comp_m_output_m_NextByte_1_lpi_2_dfm <= (MUX1HOT_v_8_3_2(comp_m_output_m_NextByte_1_lpi_2
            & comp_m_output_m_NextByte_1_lpi_2_dfm & comp_m_output_m_NextByte_1_sva_2,
            STD_LOGIC_VECTOR'((fsm_output(54)) & or_dcpl_1310 & (fsm_output(56)))))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(((fsm_output(56)) AND
            (NOT (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(1))) AND (NOT((reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(2))
            OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(3)))) AND nor_110_cse
            AND (NOT((reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(6)) OR reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp)))
            OR and_dcpl), 1),8));
        comp_put_bit_plus_pending_for_i_sva <= (MUX_v_32_2_2(z_out & comp_put_bit_plus_pending_for_i_sva,
            fsm_output(57))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(55)),
            1),32));
        exit_comp_put_bit_plus_pending_for_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (z_out_23(32))) & (NOT (z_out_45(33)))), fsm_output(56));
        comp_compress_pending_bits_1_lpi_2_dfm <= MUX_v_32_2_2(z_out & comp_compress_pending_bits_1_lpi_2_dfm,
            or_3870_cse);
        comp_compress_for_for_else_else_mux_2_itm_1 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (comp_compress_high_1_sva_1(14))) & comp_compress_for_for_else_else_mux_2_itm_1),
            or_3870_cse);
        comp_compress_for_for_else_else_mux_4_itm <= MUX_v_14_2_2((comp_compress_high_1_sva_1(13
            DOWNTO 0)) & comp_compress_for_for_else_else_mux_4_itm, or_3870_cse);
        comp_compress_for_for_else_else_mux_1_itm_1 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (comp_compress_low_1_sva_1(14))) & comp_compress_for_for_else_else_mux_1_itm_1),
            or_3870_cse);
        comp_compress_for_for_else_else_mux_3_itm <= MUX_v_14_2_2((comp_compress_low_1_sva_1(13
            DOWNTO 0)) & comp_compress_for_for_else_else_mux_3_itm, or_3870_cse);
        exit_comp_put_bit_plus_pending_1_for_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (z_out_23(32))) & (NOT (z_out_45(33)))), fsm_output(58));
        comp_m_output_index_range_lpi_2_dfm_3 <= MUX1HOT_v_32_3_2(comp_m_output_index_range_lpi_2_dfm_1_mx1w0
            & comp_m_output_index_range_lpi_2_dfm_3 & (STD_LOGIC_VECTOR'("000000000000000")
            & z_out_16), STD_LOGIC_VECTOR'((fsm_output(54)) & (or_dcpl_741 OR (or_3895_tmp
            AND (fsm_output(58)))) & ((NOT or_3895_tmp) AND (fsm_output(58)))));
        comp_m_output_m_NextByte_1_lpi_2_dfm_1 <= (MUX_v_8_2_2((comp_m_output_m_NextByte_1_sva_4
            OR STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(fsm_output(58), 1),8))) &
            comp_m_output_m_NextByte_1_lpi_2_dfm_1, (((reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(1))
            OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(2)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(3))
            OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(4)) OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(5))
            OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(6)) OR reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp)
            AND (fsm_output(58))) OR or_dcpl_741)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(((NOT((comp_m_output_m_Mask_1_lpi_2_dfm_1(1))
            OR (comp_m_output_m_Mask_1_lpi_2_dfm_1(2)))) AND (NOT((comp_m_output_m_Mask_1_lpi_2_dfm_1(3))
            OR (comp_m_output_m_Mask_1_lpi_2_dfm_1(4)))) AND (NOT((reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(5))
            OR (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(6)))) AND (NOT reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp)
            AND (fsm_output(58))) OR and_dcpl), 1),8));
        comp_put_bit_plus_pending_1_for_i_sva <= (MUX_v_32_2_2(z_out & comp_put_bit_plus_pending_1_for_i_sva,
            fsm_output(59))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(55)),
            1),32));
        comp_compress_for_for_and_2_itm <= comp_compress_for_for_else_slc_svs AND
            (NOT comp_compress_for_for_slc_svs);
        comp_m_output_m_Mask_1_lpi_5 <= MUX_v_8_2_2((TO_STDLOGICVECTOR(reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp)
            & reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1) & comp_m_output_m_Mask_1_lpi_5,
            or_dcpl_3873);
        comp_m_output_m_Mask_1_lpi_4 <= MUX_v_8_2_2((TO_STDLOGICVECTOR(reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp)
            & reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1) & comp_m_output_m_Mask_1_lpi_4,
            or_dcpl_3731);
        comp_m_output_m_NextByte_1_lpi_5 <= MUX_v_8_2_2(comp_m_output_m_NextByte_1_lpi_2_dfm_1
            & comp_m_output_m_NextByte_1_lpi_5, or_dcpl_3873);
        comp_m_output_m_NextByte_1_lpi_4 <= MUX_v_8_2_2(comp_m_output_m_NextByte_1_lpi_2_dfm
            & comp_m_output_m_NextByte_1_lpi_4, or_dcpl_3731);
        comp_m_output_index_range_lpi_5 <= MUX_v_32_2_2(comp_m_output_index_range_lpi_2_dfm_3
            & comp_m_output_index_range_lpi_5, or_dcpl_3873);
        comp_m_output_index_range_lpi_4 <= MUX_v_32_2_2(comp_m_output_index_range_lpi_2_dfm_1
            & comp_m_output_index_range_lpi_4, or_dcpl_3731);
        comp_m_output_index_range_lpi_dfm_1 <= MUX1HOT_v_32_3_2(comp_m_output_index_range_lpi_dfm_1_mx1w0
            & comp_m_output_index_range_lpi_dfm_1 & (STD_LOGIC_VECTOR'("000000000000000")
            & z_out_16), STD_LOGIC_VECTOR'((fsm_output(61)) & (or_dcpl_3880 OR (or_3913_tmp
            AND (fsm_output(63)))) & ((NOT or_3913_tmp) AND (fsm_output(63)))));
        comp_compress_pending_bits_sva <= MUX_v_32_2_2(z_out & comp_compress_pending_bits_sva,
            or_dcpl_3890 OR or_dcpl_693);
        comp_m_output_m_NextByte_1_lpi_dfm <= (MUX1HOT_v_8_3_2(comp_m_output_m_NextByte_1_lpi_2
            & comp_m_output_m_NextByte_1_lpi_dfm & comp_m_output_m_NextByte_1_sva_8,
            STD_LOGIC_VECTOR'((fsm_output(61)) & or_dcpl_3880 & (fsm_output(63)))))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(((fsm_output(63)) AND
            (NOT (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(1))) AND (NOT((reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(2))
            OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(3)))) AND (NOT((reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(4))
            OR (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(5)))) AND (NOT((reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(6))
            OR reg_comp_m_output_m_Mask_2_lpi_dfm_tmp))) OR and_dcpl_530), 1),8));
        exit_comp_put_bit_plus_pending_2_for_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (z_out_23(32))) & (NOT (z_out_45(33)))), fsm_output(63));
        comp_m_output_index_range_lpi_dfm_3 <= MUX1HOT_v_32_3_2(comp_m_output_index_range_lpi_dfm_1_mx1w0
            & comp_m_output_index_range_lpi_dfm_3 & (STD_LOGIC_VECTOR'("000000000000000")
            & z_out_16), STD_LOGIC_VECTOR'((fsm_output(61)) & (or_dcpl_1040 OR (or_3927_tmp
            AND (fsm_output(65)))) & ((NOT or_3927_tmp) AND (fsm_output(65)))));
        comp_m_output_m_NextByte_lpi_dfm <= (MUX_v_8_2_2((comp_m_output_m_NextByte_1_sva_4
            OR STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(fsm_output(65), 1),8))) &
            comp_m_output_m_NextByte_lpi_dfm, (((reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(0))
            OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(1)) OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(2))
            OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(3)) OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(4))
            OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5)) OR reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp)
            AND (fsm_output(65))) OR or_dcpl_1040)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(((NOT((reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(0))
            OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(1)))) AND (NOT((reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(2))
            OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(3)))) AND (NOT((reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(4))
            OR (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5)))) AND (NOT reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp)
            AND (fsm_output(65))) OR and_dcpl_530), 1),8));
        exit_comp_put_bit_plus_pending_3_for_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (z_out_23(32))) & (NOT (z_out_45(33)))), fsm_output(65));
        comp_m_output_index_range_lpi_6 <= MUX_v_32_2_2(comp_m_output_index_range_lpi_dfm_1
            & comp_m_output_index_range_lpi_6, or_dcpl_3403 OR or_dcpl_1328 OR or_dcpl_3274
            OR (fsm_output(81)) OR (fsm_output(71)) OR (fsm_output(69)) OR (fsm_output(65))
            OR (fsm_output(73)) OR or_dcpl_3958 OR or_dcpl_3957 OR or_dcpl_3951 OR
            or_dcpl_678 OR or_dcpl_3948 OR or_dcpl_3943 OR or_dcpl_3217 OR or_dcpl_3940
            OR or_dcpl_3776 OR or_dcpl_2439 OR or_dcpl_3930 OR or_dcpl_3925 OR or_dcpl_3198
            OR or_dcpl_3922 OR or_dcpl_3916 OR or_dcpl_3914 OR or_dcpl_3913 OR or_dcpl_3909
            OR or_dcpl_3906);
        comp_m_output_index_range_lpi_7 <= MUX_v_32_2_2(comp_m_output_index_range_lpi_dfm_3
            & comp_m_output_index_range_lpi_7, or_dcpl_3403 OR or_dcpl_1328 OR or_dcpl_1460
            OR or_dcpl_3267 OR (fsm_output(69)) OR (fsm_output(63)) OR (fsm_output(73))
            OR or_dcpl_3958 OR or_dcpl_3957 OR or_dcpl_3951 OR or_dcpl_678 OR or_dcpl_3948
            OR or_dcpl_3943 OR or_dcpl_3217 OR or_dcpl_3940 OR or_dcpl_3776 OR or_dcpl_2439
            OR or_dcpl_3930 OR or_dcpl_3925 OR or_dcpl_3198 OR or_dcpl_3922 OR or_dcpl_3916
            OR or_dcpl_3914 OR or_dcpl_3913 OR or_dcpl_3909 OR or_dcpl_3906);
        trans_ond_image_copy_2_y_1_sva <= (MUX_v_8_2_2(trans_ond_image_copy_2_y_1_sva
            & copy_x_2_mux_2_itm, fsm_output(71))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            or_dcpl_3890, 1),8));
        cmodel_cumulative_frequency_vinit_ndx_1_sva <= MUX1HOT_v_9_3_2(STD_LOGIC_VECTOR'("100000001")
            & cmodel_reset_1_for_acc_itm & cmodel_cumulative_frequency_vinit_ndx_1_sva,
            STD_LOGIC_VECTOR'(or_dcpl_3890 & (fsm_output(71)) & and_370_cse));
        exit_copy_x_2_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(exit_copy_x_2_sva_dfm
            & exit_copy_x_2_sva), and_370_cse)) AND (NOT or_dcpl_3890);
        trans_ond_image_copy_2_x_1_sva <= (MUX_v_9_2_2(trans_ond_image_copy_2_x_1_sva_1
            & trans_ond_image_copy_2_x_1_sva, and_dcpl_349 AND (NOT (fsm_output(64)))
            AND (NOT((fsm_output(71)) OR (fsm_output(69)))))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(or_dcpl_1040
            OR or_dcpl_3267), 1),9));
        comp_put_bit_plus_pending_2_for_i_sva <= (MUX_v_32_2_2(z_out & comp_put_bit_plus_pending_2_for_i_sva,
            fsm_output(64))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(62)),
            1),32));
        comp_put_bit_plus_pending_3_for_i_sva <= (MUX_v_32_2_2(z_out & comp_put_bit_plus_pending_3_for_i_sva,
            fsm_output(66))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(62)),
            1),32));
        copy_y_2_slc_itm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(copy_y_2_slc_itm & (z_out_5(3))),
            fsm_output(67));
        trans_ond_image_copy_2_x_1_sva_1 <= MUX_v_9_2_2(trans_ond_image_copy_2_x_1_sva_1
            & z_out_4, fsm_output(67));
        exit_copy_x_2_sva_dfm <= (NOT (z_out_51(4))) OR exit_copy_x_2_sva;
        cmodel_reset_1_for_nor_itm <= NOT((cmodel_cumulative_frequency_vinit_ndx_1_sva(8))
            OR (cmodel_cumulative_frequency_vinit_ndx_1_sva(7)) OR (cmodel_cumulative_frequency_vinit_ndx_1_sva(6))
            OR (cmodel_cumulative_frequency_vinit_ndx_1_sva(5)) OR (cmodel_cumulative_frequency_vinit_ndx_1_sva(4))
            OR (cmodel_cumulative_frequency_vinit_ndx_1_sva(3)) OR (cmodel_cumulative_frequency_vinit_ndx_1_sva(2))
            OR (cmodel_cumulative_frequency_vinit_ndx_1_sva(1)) OR (cmodel_cumulative_frequency_vinit_ndx_1_sva(0)));
        cmodel_reset_1_for_acc_itm <= z_out_4;
        copy_x_2_mux_2_itm <= z_out_25;
        dec_m_input_input_byte_1_sva <= dec_m_input_input_byte_1_sva_dfm AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(fsm_output(73),
            1),17));
        cmodel_m_frozen_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(cmodel_m_frozen_sva
            & cmodel_m_frozen_sva_1), (NOT cmodel_m_frozen_sva) AND (fsm_output(99))
            AND (NOT ModelA_getChar_for_not_sxt))) AND (NOT (fsm_output(71)));
        dec_m_output_index_range_1_sva <= (MUX1HOT_v_17_3_2(dec_m_output_index_range_1_sva
            & dec_m_output_index_range_1_sva_1 & STD_LOGIC_VECTOR'("10010110000000000"),
            STD_LOGIC_VECTOR'((or_dcpl_3403 OR or_dcpl_1328 OR or_dcpl_1460 OR or_dcpl_1251
            OR or_dcpl_4087 OR (fsm_output(89)) OR (fsm_output(74)) OR or_dcpl_4084)
            & ((fsm_output(99)) AND dec_m_output_putByte_slc_svs) & ((fsm_output(99))
            AND (NOT dec_m_output_putByte_slc_svs))))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(71)), 1),17));
        dec_decompress_value_1_sg14_sva_1_sg17 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg17
            & dec_decompress_value_1_sg14_sva_1_sg16 & dec_decompress_value_1_sg14_lpi_3_sg17),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg16 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg15
            & dec_decompress_value_1_sg14_lpi_3_sg16 & dec_decompress_value_1_sg14_sva_1_sg16),
            STD_LOGIC_VECTOR'(and_dcpl_363 & (fsm_output(97)) & and_386_cse))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg15 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg14
            & dec_decompress_value_1_sg14_lpi_3_sg15 & dec_decompress_value_1_sg14_sva_1_sg15),
            STD_LOGIC_VECTOR'(and_dcpl_363 & (fsm_output(97)) & and_386_cse))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg14 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg13
            & dec_decompress_value_1_sg14_lpi_3_sg14 & dec_decompress_value_1_sg14_sva_1_sg14),
            STD_LOGIC_VECTOR'(and_dcpl_363 & (fsm_output(97)) & and_386_cse))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg13 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg12
            & dec_decompress_value_1_sg14_lpi_3_sg13 & dec_decompress_value_1_sg14_sva_1_sg13),
            STD_LOGIC_VECTOR'(and_dcpl_363 & (fsm_output(97)) & and_386_cse))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg12 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg11
            & dec_decompress_value_1_sg14_lpi_3_sg12 & dec_decompress_value_1_sg14_sva_1_sg12),
            STD_LOGIC_VECTOR'(and_dcpl_363 & (fsm_output(97)) & and_386_cse))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg11 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg10
            & dec_decompress_value_1_sg14_lpi_3_sg11 & dec_decompress_value_1_sg14_sva_1_sg11),
            STD_LOGIC_VECTOR'(and_dcpl_363 & (fsm_output(97)) & and_386_cse))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg10 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg9
            & dec_decompress_value_1_sg14_lpi_3_sg10 & dec_decompress_value_1_sg14_sva_1_sg10),
            STD_LOGIC_VECTOR'(and_dcpl_363 & (fsm_output(97)) & and_386_cse))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg9 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg7
            & dec_decompress_value_1_sg14_lpi_3_sg9 & dec_decompress_value_1_sg14_sva_1_sg9),
            STD_LOGIC_VECTOR'(and_dcpl_363 & (fsm_output(97)) & and_386_cse))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg8 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg8
            & dec_decompress_value_1_sg14_sva_sg6 & dec_decompress_value_1_sg14_lpi_3_sg8),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg7 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg7
            & dec_decompress_value_1_sg14_sva_sg5 & dec_decompress_value_1_sg14_lpi_3_sg7),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg6 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg6
            & dec_decompress_value_1_sg14_sva_sg4 & dec_decompress_value_1_sg14_lpi_3_sg6),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg5 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg5
            & dec_decompress_value_1_sg14_sva_sg3 & dec_decompress_value_1_sg14_lpi_3_sg5),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg4 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg4
            & dec_decompress_value_1_sg14_sva_sg2 & dec_decompress_value_1_sg14_lpi_3_sg4),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg3 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg3
            & dec_decompress_value_1_sg14_sva_sg1 & dec_decompress_value_1_sg14_lpi_3_sg3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg2
            & dec_decompress_value_1_sg14_sva_5 & dec_decompress_value_1_sg14_lpi_3_sg2),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_1_sg1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg1
            & dec_decompress_value_1_sg13_sva & dec_decompress_value_1_sg14_lpi_3_sg1),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_6 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_6
            & dec_decompress_value_1_sg12_sva & dec_decompress_value_1_sg14_lpi_5),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg13_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg13_sva_1
            & dec_decompress_value_1_sg11_sva & dec_decompress_value_1_sg13_lpi_3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg12_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg12_sva_1
            & dec_decompress_value_1_sg10_sva & dec_decompress_value_1_sg12_lpi_3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg11_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg11_sva_1
            & dec_decompress_value_1_sg9_sva & dec_decompress_value_1_sg11_lpi_3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg10_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg10_sva_1
            & dec_decompress_value_1_sg8_sva & dec_decompress_value_1_sg10_lpi_3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg9_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg9_sva_1
            & dec_decompress_value_1_sg7_sva & dec_decompress_value_1_sg9_lpi_3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg8_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg8_sva_1
            & dec_decompress_value_1_sg6_sva & dec_decompress_value_1_sg8_lpi_3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg7_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg7_sva_1
            & dec_decompress_value_1_sg5_sva & dec_decompress_value_1_sg7_lpi_3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg6_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg6_sva_1
            & dec_decompress_value_1_sg4_sva & dec_decompress_value_1_sg6_lpi_3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg5_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg5_sva_1
            & dec_decompress_value_1_sg3_sva & dec_decompress_value_1_sg5_lpi_3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg4_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg4_sva_1
            & dec_decompress_value_1_sg2_sva & dec_decompress_value_1_sg4_lpi_3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg3_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg3_sva_1
            & dec_decompress_value_1_sg1_sva & dec_decompress_value_1_sg3_lpi_3),
            STD_LOGIC_VECTOR'(or_4126_cse & and_dcpl_363 & (fsm_output(97))))) AND
            (NOT (fsm_output(71)));
        dec_decompress_value_1_sg2_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg2_sva_1
            & dec_decompress_value_3_sva & dec_decompress_value_1_sg2_lpi_3), STD_LOGIC_VECTOR'(or_4126_cse
            & and_dcpl_363 & (fsm_output(97))))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg1_sva_1 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg1_sva_1
            & dec_decompress_value_3_sva_2 & dec_decompress_value_1_sg1_lpi_3), STD_LOGIC_VECTOR'(or_4126_cse
            & and_dcpl_363 & (fsm_output(97))))) AND (NOT (fsm_output(71)));
        dec_decompress_low_sva_5 <= (MUX_v_15_2_2(dec_decompress_low_sva_5 & (dec_decompress_low_sva_1(14
            DOWNTO 0)), fsm_output(97))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(71)), 1),15));
        dec_decompress_high_1_sva <= MUX1HOT_v_32_3_2(STD_LOGIC_VECTOR'("00000000000000001111111111111111")
            & dec_decompress_high_1_sva_1 & dec_decompress_high_1_sva, STD_LOGIC_VECTOR'((fsm_output(71))
            & (fsm_output(97)) & and_dcpl_365));
        dec_m_input_m_CurrentByte_1_sva <= MUX_v_8_2_2(dec_m_input_m_CurrentByte_1_sva
            & Comp_rsc_singleport_data_out_mxwt, and_691_cse);
        dec_m_input_m_LastMask_sva <= MUX1HOT_v_8_3_2(STD_LOGIC_VECTOR'("00000001")
            & dec_m_input_m_LastMask_sva_dfm & dec_m_input_m_LastMask_sva, STD_LOGIC_VECTOR'((fsm_output(71))
            & (fsm_output(73)) & (NOT((fsm_output(71)) OR (fsm_output(73))))));
        dec_decompress_for_i_1_sva_2 <= (dec_decompress_for_i_1_sva_1(3 DOWNTO 0))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(fsm_output(73), 1),4));
        dec_decompress_value_3_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_3_sva
            & dec_decompress_value_3_sva_2), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg1_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg1_sva
            & dec_decompress_value_3_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg2_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg2_sva
            & dec_decompress_value_1_sg1_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg3_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg3_sva
            & dec_decompress_value_1_sg2_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg4_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg4_sva
            & dec_decompress_value_1_sg3_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg5_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg5_sva
            & dec_decompress_value_1_sg4_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg6_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg6_sva
            & dec_decompress_value_1_sg5_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg7_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg7_sva
            & dec_decompress_value_1_sg6_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg8_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg8_sva
            & dec_decompress_value_1_sg7_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg9_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg9_sva
            & dec_decompress_value_1_sg8_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg10_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg10_sva
            & dec_decompress_value_1_sg9_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg11_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg11_sva
            & dec_decompress_value_1_sg10_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg12_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg12_sva
            & dec_decompress_value_1_sg11_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg13_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg13_sva
            & dec_decompress_value_1_sg12_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_5 <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_5
            & dec_decompress_value_1_sg13_sva), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_sg1 <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg1
            & dec_decompress_value_1_sg14_sva_5), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_sg2 <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg2
            & dec_decompress_value_1_sg14_sva_sg1), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_sg3 <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg3
            & dec_decompress_value_1_sg14_sva_sg2), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_sg4 <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg4
            & dec_decompress_value_1_sg14_sva_sg3), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_sg5 <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg5
            & dec_decompress_value_1_sg14_sva_sg4), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_sg6 <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg6
            & dec_decompress_value_1_sg14_sva_sg5), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_decompress_value_1_sg14_sva_sg7 <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_sg7
            & dec_decompress_value_1_sg14_sva_sg6), fsm_output(73))) AND (NOT (fsm_output(71)));
        dec_m_input_input_byte_1_sva_dfm <= MUX1HOT_v_17_3_2(dec_m_input_input_byte_1_sva
            & z_out_16 & dec_m_input_input_byte_1_lpi_3, STD_LOGIC_VECTOR'(and_454_cse
            & and_462_cse & (fsm_output(97))));
        dec_m_input_m_LastMask_sva_dfm <= MUX1HOT_v_8_3_2((TO_STDLOGICVECTOR('0')
            & (dec_m_input_m_LastMask_sva(7 DOWNTO 1))) & STD_LOGIC_VECTOR'("10000000")
            & dec_m_input_m_LastMask_lpi_3, STD_LOGIC_VECTOR'(and_454_cse & and_462_cse
            & (fsm_output(97))));
        dec_decompress_for_i_1_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(dec_decompress_for_i_1_sva_2),
            5) + CONV_UNSIGNED(CONV_UNSIGNED('1', 1), 5), 5));
        unequal_tmp_8 <= NOT((dec_m_input_m_LastMask_sva(0)) AND (NOT((dec_m_input_m_LastMask_sva(7))
            OR (dec_m_input_m_LastMask_sva(6)) OR (dec_m_input_m_LastMask_sva(5))
            OR (dec_m_input_m_LastMask_sva(4)) OR (dec_m_input_m_LastMask_sva(3))
            OR (dec_m_input_m_LastMask_sva(2)) OR (dec_m_input_m_LastMask_sva(1)))));
        ModelA_getChar_for_i_1_sva <= (MUX_v_9_2_2(ModelA_getChar_for_i_1_sva & ModelA_getChar_for_acc_2_psp_sva,
            and_716_cse)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(80)),
            1),9));
        dec_decompress_value_3_sva_1 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_3_sva_2
            & dec_decompress_value_3_lpi_3 & dec_decompress_value_3_sva_1), STD_LOGIC_VECTOR'((fsm_output(73))
            & (fsm_output(97)) & (NOT((fsm_output(73)) OR (fsm_output(97))))));
        dec_decompress_value_3_lpi_3 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_3_sva_2
            & dec_decompress_value_3_lpi_3 & (((dec_m_input_m_CurrentByte_1_lpi_3_mx1(7))
            AND (dec_m_input_m_LastMask_lpi_3(7))) OR ((dec_m_input_m_CurrentByte_1_lpi_3_mx1(6))
            AND (dec_m_input_m_LastMask_lpi_3(6))) OR ((dec_m_input_m_CurrentByte_1_lpi_3_mx1(5))
            AND (dec_m_input_m_LastMask_lpi_3(5))) OR ((dec_m_input_m_CurrentByte_1_lpi_3_mx1(4))
            AND (dec_m_input_m_LastMask_lpi_3(4))) OR ((dec_m_input_m_CurrentByte_1_lpi_3_mx1(3))
            AND (dec_m_input_m_LastMask_lpi_3(3))) OR ((dec_m_input_m_CurrentByte_1_lpi_3_mx1(2))
            AND (dec_m_input_m_LastMask_lpi_3(2))) OR ((dec_m_input_m_CurrentByte_1_lpi_3_mx1(1))
            AND (dec_m_input_m_LastMask_lpi_3(1))) OR ((dec_m_input_m_CurrentByte_1_lpi_3_mx1(0))
            AND (dec_m_input_m_LastMask_lpi_3(0)))) & dec_decompress_value_3_sva_1),
            STD_LOGIC_VECTOR'((fsm_output(73)) & (or_dcpl_3403 OR or_dcpl_3520 OR
            or_dcpl_4210 OR or_dcpl_4208 OR or_dcpl_3951 OR or_dcpl_4202 OR or_dcpl_4199
            OR or_dcpl_1402) & (fsm_output(98)) & (fsm_output(99))));
        dec_decompress_value_1_sg1_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg1_sva_1
            & dec_decompress_value_1_sg1_lpi_3 & dec_decompress_value_3_lpi_3), STD_LOGIC_VECTOR'(or_dcpl_4219
            & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg2_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg2_sva_1
            & dec_decompress_value_1_sg2_lpi_3 & dec_decompress_value_1_sg1_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg3_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg3_sva_1
            & dec_decompress_value_1_sg3_lpi_3 & dec_decompress_value_1_sg2_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg4_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg4_sva_1
            & dec_decompress_value_1_sg4_lpi_3 & dec_decompress_value_1_sg3_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg5_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg5_sva_1
            & dec_decompress_value_1_sg5_lpi_3 & dec_decompress_value_1_sg4_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg6_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg6_sva_1
            & dec_decompress_value_1_sg6_lpi_3 & dec_decompress_value_1_sg5_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg7_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg7_sva_1
            & dec_decompress_value_1_sg7_lpi_3 & dec_decompress_value_1_sg6_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg8_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg8_sva_1
            & dec_decompress_value_1_sg8_lpi_3 & dec_decompress_value_1_sg7_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg9_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg9_sva_1
            & dec_decompress_value_1_sg9_lpi_3 & dec_decompress_value_1_sg8_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg10_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg10_sva_1
            & dec_decompress_value_1_sg10_lpi_3 & dec_decompress_value_1_sg9_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg11_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg11_sva_1
            & dec_decompress_value_1_sg11_lpi_3 & dec_decompress_value_1_sg10_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg12_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg12_sva_1
            & dec_decompress_value_1_sg12_lpi_3 & dec_decompress_value_1_sg11_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg13_lpi_3 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg13_sva_1
            & dec_decompress_value_1_sg13_lpi_3 & dec_decompress_value_1_sg12_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg14_lpi_3_sg17 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg17
            & dec_decompress_value_1_sg14_lpi_3_sg17 & (dec_decompress_value_1_sg14_sva_2_sg1(15))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(16)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg16),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_5 <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_6
            & dec_decompress_value_1_sg14_lpi_5 & dec_decompress_value_1_sg13_lpi_3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_decompress_value_1_sg14_lpi_3_sg16 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg16
            & dec_decompress_value_1_sg14_lpi_3_sg16 & (dec_decompress_value_1_sg14_sva_2_sg1(14))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(15)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg15),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg1 <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg1
            & dec_decompress_value_1_sg14_lpi_3_sg1 & (dec_decompress_value_1_sg14_lpi_3_dfm_3(0))
            & dec_decompress_value_1_sg14_lpi_5), STD_LOGIC_VECTOR'(or_dcpl_4219
            & or_4268_cse & ((NOT or_dcpl_1897) AND (fsm_output(97))) & (or_dcpl_1897
            AND (fsm_output(97)))));
        dec_decompress_value_1_sg14_lpi_3_sg15 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg15
            & dec_decompress_value_1_sg14_lpi_3_sg15 & (dec_decompress_value_1_sg14_sva_2_sg1(13))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(14)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg14),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg2
            & dec_decompress_value_1_sg14_lpi_3_sg2 & (dec_decompress_value_1_sg14_sva_2_sg1(0))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(1)) & dec_decompress_value_1_sg14_lpi_3_sg1),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg14 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg14
            & dec_decompress_value_1_sg14_lpi_3_sg14 & (dec_decompress_value_1_sg14_sva_2_sg1(12))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(13)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg13),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg3 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg3
            & dec_decompress_value_1_sg14_lpi_3_sg3 & (dec_decompress_value_1_sg14_sva_2_sg1(1))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(2)) & dec_decompress_value_1_sg14_lpi_3_sg2),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg13 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg13
            & dec_decompress_value_1_sg14_lpi_3_sg13 & (dec_decompress_value_1_sg14_sva_2_sg1(11))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(12)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg12),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg4 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg4
            & dec_decompress_value_1_sg14_lpi_3_sg4 & (dec_decompress_value_1_sg14_sva_2_sg1(2))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(3)) & dec_decompress_value_1_sg14_lpi_3_sg3),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg12 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg12
            & dec_decompress_value_1_sg14_lpi_3_sg12 & (dec_decompress_value_1_sg14_sva_2_sg1(10))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(11)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg11),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg5 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg5
            & dec_decompress_value_1_sg14_lpi_3_sg5 & (dec_decompress_value_1_sg14_sva_2_sg1(3))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(4)) & dec_decompress_value_1_sg14_lpi_3_sg4),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg11 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg11
            & dec_decompress_value_1_sg14_lpi_3_sg11 & (dec_decompress_value_1_sg14_sva_2_sg1(9))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(10)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg10),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg6 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg6
            & dec_decompress_value_1_sg14_lpi_3_sg6 & (dec_decompress_value_1_sg14_sva_2_sg1(4))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(5)) & dec_decompress_value_1_sg14_lpi_3_sg5),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg10 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg10
            & dec_decompress_value_1_sg14_lpi_3_sg10 & (dec_decompress_value_1_sg14_sva_2_sg1(8))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(9)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg9),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg7 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg7
            & dec_decompress_value_1_sg14_lpi_3_sg7 & (dec_decompress_value_1_sg14_sva_2_sg1(5))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(6)) & dec_decompress_value_1_sg14_lpi_3_sg6),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg9 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg9
            & dec_decompress_value_1_sg14_lpi_3_sg9 & (dec_decompress_value_1_sg14_sva_2_sg1(7))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(8)) & dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg8),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_decompress_value_1_sg14_lpi_3_sg8 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(dec_decompress_value_1_sg14_sva_1_sg8
            & dec_decompress_value_1_sg14_lpi_3_sg8 & (dec_decompress_value_1_sg14_sva_2_sg1(6))
            & (dec_decompress_value_1_sg14_lpi_3_dfm_3(7)) & dec_decompress_value_1_sg14_lpi_3_sg7),
            STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & and_664_cse & and_665_cse
            & and_666_cse));
        dec_m_input_input_byte_1_lpi_3 <= MUX1HOT_v_17_3_2(dec_m_input_input_byte_1_sva_dfm
            & dec_m_input_input_byte_1_lpi_3 & z_out_16, STD_LOGIC_VECTOR'(or_dcpl_4219
            & (or_4268_cse OR (or_5020_tmp AND (fsm_output(97)))) & ((NOT or_5020_tmp)
            AND (fsm_output(97)))));
        dec_m_input_m_CurrentByte_1_lpi_3 <= MUX1HOT_v_8_4_2(Comp_rsc_singleport_data_out_mxwt
            & dec_m_input_m_CurrentByte_1_sva & dec_m_input_m_CurrentByte_1_lpi_3
            & dec_m_input_m_CurrentByte_1_sva_dfm, STD_LOGIC_VECTOR'((and_691_cse
            OR ((NOT unequal_tmp_9) AND (fsm_output(98)))) & (unequal_tmp_8 AND (fsm_output(73)))
            & (or_dcpl_3403 OR or_dcpl_3520 OR or_dcpl_4210 OR or_dcpl_4208 OR or_dcpl_3951
            OR or_dcpl_4202 OR or_dcpl_4998 OR or_dcpl_4056 OR (unequal_tmp_9 AND
            (fsm_output(98)))) & (fsm_output(99))));
        dec_m_input_m_LastMask_lpi_3 <= MUX1HOT_v_8_3_2(dec_m_input_m_LastMask_sva_dfm
            & dec_m_input_m_LastMask_lpi_3 & (TO_STDLOGICVECTOR(and_479_ssc) & ((dec_m_input_m_LastMask_lpi_3(7
            DOWNTO 1)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT and_479_ssc,
            1),7)))), STD_LOGIC_VECTOR'(or_dcpl_4219 & or_4268_cse & (fsm_output(97))));
        dec_m_input_m_CurrentByte_1_sva_dfm <= dec_m_input_m_CurrentByte_1_lpi_3;
        dec_decompress_for_1_range_sva <= MUX_v_32_2_2(dec_decompress_for_1_range_sva
            & z_out_18, fsm_output(74));
        dec_decompress_for_1_scaled_value_acc_mut <= MUX_v_67_2_2(dec_decompress_for_1_scaled_value_acc_mut
            & dec_decompress_for_1_scaled_value_acc_mut_mx0w2, fsm_output(74));
        dec_m_output_putByte_slc_svs <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((z_out_32(7))
            & dec_m_output_putByte_slc_svs), or_5090_cse);
        dec_m_output_index_range_1_sva_1 <= MUX_v_17_2_2(z_out_16 & dec_m_output_index_range_1_sva_1,
            or_5090_cse);
        dec_decompress_for_1_acc_3_itm <= MUX_v_16_2_2(z_out_17 & dec_decompress_for_1_acc_3_itm,
            or_dcpl_3403 OR or_dcpl_3520 OR or_dcpl_4210 OR or_dcpl_683 OR or_dcpl_3407
            OR or_dcpl_1244 OR or_dcpl_4199 OR or_dcpl_1402);
        ModelA_getChar_for_not_sxt <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(ModelA_getChar_for_not_sxt
            & (NOT ModelA_getChar_for_slc_itm)), and_716_cse)) AND (NOT (fsm_output(84)));
        dec_decompress_for_1_scaled_value_sva <= MUX_v_32_2_2((div_mgc_div_z(31 DOWNTO
            0)) & dec_decompress_for_1_scaled_value_sva, or_dcpl_4210 OR or_dcpl_683
            OR or_dcpl_4084);
        ModelA_getChar_for_acc_2_psp_sva <= MUX_v_9_2_2(z_out_4 & ModelA_getChar_for_acc_2_psp_sva,
            or_dcpl_3236 OR or_dcpl_4084);
        ModelA_getChar_for_slc_itm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((z_out_20(8))
            & ModelA_getChar_for_slc_itm), or_dcpl_687 OR (fsm_output(84)) OR (fsm_output(82))
            OR or_dcpl_4056);
        ModelA_update_1_for_i_sva_sg1 <= (MUX_v_23_2_2((z_out(31 DOWNTO 9)) & ModelA_update_1_for_i_sva_sg1,
            (fsm_output(87)) OR (fsm_output(86)))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(84)), 1),23));
        ModelA_update_1_for_i_sva_2 <= MUX1HOT_v_9_3_2(ModelA_getChar_for_acc_2_psp_sva
            & ModelA_update_1_for_i_sva_2 & (z_out(8 DOWNTO 0)), STD_LOGIC_VECTOR'((fsm_output(82))
            & (or_dcpl_1285 OR or_dcpl_1402) & (fsm_output(85))));
        exit_ModelA_update_1_for_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(exit_ModelA_update_1_for_sva
            & (NOT (z_out_46(30)))), fsm_output(85));
        ModelA_getChar_for_slc_1_itm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(ModelA_getChar_for_slc_1_itm
            & (ModelA_getChar_for_if_acc_tmp(33))), fsm_output(82));
        ModelA_getChar_for_slc_2_cse_sva <= MUX_v_32_2_2(cmodel_cumulative_frequency_rsc_singleport_data_out
            & ModelA_getChar_for_slc_2_cse_sva, or_dcpl_3236 OR or_dcpl_4056);
        ModelA_getChar_for_if_p_count_sva <= MUX_v_32_2_2(cmodel_cumulative_frequency_rsc_singleport_data_out
            & ModelA_getChar_for_if_p_count_sva, or_dcpl_4087 OR (fsm_output(89))
            OR (fsm_output(88)) OR (fsm_output(86)));
        slc_ModelA_update_1_for_i_itm <= MUX_v_9_2_2(ModelA_update_1_for_i_sva_2
            & slc_ModelA_update_1_for_i_itm, NOT((fsm_output(87)) OR (fsm_output(84))));
        ModelA_getChar_for_if_p_low_sva <= MUX_v_32_2_2(cmodel_cumulative_frequency_rsc_singleport_data_out
            & ModelA_getChar_for_if_p_low_sva, or_dcpl_687 OR (fsm_output(89)) OR
            (fsm_output(88)) OR (fsm_output(86)));
        cmodel_m_frozen_sva_1 <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT (ModelA_update_acc_2(32)))
            & cmodel_m_frozen_sva_1), or_dcpl_3407 OR or_dcpl_1244 OR (fsm_output(96))
            OR (fsm_output(98)) OR (fsm_output(97)) OR (fsm_output(90)));
        inv_wave_Mn_Inv_Wave_Fct_wi_1_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_1_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_1_sva &
            inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva), inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1))),
            z_out_45(33))) & inv_wave_Mn_Inv_Wave_Fct_wi_1_sva), exit_inv_wave_Mn_Inv_Wave_Fct_for_sva))
            & inv_wave_Mn_Inv_Wave_Fct_wi_1_sva), nor_90_cse)) AND (NOT (fsm_output(90)));
        inv_wave_Mn_Inv_Wave_Fct_hi_1_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_hi_1_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_hi_1_sva &
            (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_7(0))), inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1))),
            z_out_45(33))) & inv_wave_Mn_Inv_Wave_Fct_hi_1_sva), exit_inv_wave_Mn_Inv_Wave_Fct_for_sva))
            & inv_wave_Mn_Inv_Wave_Fct_hi_1_sva), nor_90_cse)) AND (NOT (fsm_output(90)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva
            & inv_wave_Mn_Inv_Wave_Fct_for_and_22_itm), z_out_45(33))) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva),
            exit_inv_wave_Mn_Inv_Wave_Fct_for_sva)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva),
            nor_90_cse)) OR (fsm_output(90));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva), inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1))),
            z_out_45(33))) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva), exit_inv_wave_Mn_Inv_Wave_Fct_for_sva))
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva), nor_90_cse)) AND (NOT (fsm_output(90)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva), inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1))),
            z_out_45(33))) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva), exit_inv_wave_Mn_Inv_Wave_Fct_for_sva))
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva), nor_90_cse)) OR (fsm_output(90));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva), inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1))),
            z_out_45(33))) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva), exit_inv_wave_Mn_Inv_Wave_Fct_for_sva))
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva), nor_90_cse)) AND (NOT (fsm_output(90)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva), inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1))),
            z_out_45(33))) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva), exit_inv_wave_Mn_Inv_Wave_Fct_for_sva))
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva), nor_90_cse)) AND (NOT (fsm_output(90)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva), inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1))),
            z_out_45(33))) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva), exit_inv_wave_Mn_Inv_Wave_Fct_for_sva))
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva), nor_90_cse)) AND (NOT (fsm_output(90)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva), inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1))),
            z_out_45(33))) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva), exit_inv_wave_Mn_Inv_Wave_Fct_for_sva))
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva), nor_90_cse)) AND (NOT (fsm_output(90)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'((MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva
            & (MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva), inv_wave_Mn_Inv_Wave_Fct_for_land_lpi_1_dfm_1))),
            z_out_45(33))) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva), exit_inv_wave_Mn_Inv_Wave_Fct_for_sva))
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva), nor_90_cse)) AND (NOT (fsm_output(90)));
        inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_7 <= MUX1HOT_v_7_3_2(STD_LOGIC_VECTOR'("1111000")
            & inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_7 & (TO_STDLOGICVECTOR('0') & (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_7(6
            DOWNTO 1))), STD_LOGIC_VECTOR'((fsm_output(90)) & (((NOT copy_x_3_and_8_tmp)
            AND (fsm_output(103))) OR nor_90_cse) & (copy_x_3_and_8_tmp AND (fsm_output(103)))));
        exit_inv_wave_Mn_Inv_Wave_Fct_for_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((NOT
            (z_out_45(33))) & exit_inv_wave_Mn_Inv_Wave_Fct_for_sva), and_755_cse
            OR nor_90_cse)) AND (NOT (fsm_output(90)));
        inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva <= (MUX_v_32_2_2(z_out & inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva,
            ((or_dcpl_5709 OR (NOT((z_out_4(8)) AND inv_wave_Mn_Inv_Wave_Fct_wi_1_sva)))
            AND (fsm_output(103))) OR nor_90_cse)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(90)), 1),32));
        inv_wave_Mn_Inv_Wave_Fct_himpairs_sva <= (MUX_v_32_2_2(z_out_1 & inv_wave_Mn_Inv_Wave_Fct_himpairs_sva,
            ((or_dcpl_5709 OR (NOT((z_out_4(8)) AND inv_wave_Mn_Inv_Wave_Fct_hi_1_sva)))
            AND (fsm_output(103))) OR nor_90_cse)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(90)), 1),32));
        inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva <= MUX1HOT_v_32_3_2((STD_LOGIC_VECTOR'("0000000000000000000000000000")
            & nblevels_1_sva) & inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva & inv_wave_Mn_Inv_Wave_Fct_i_1_sva,
            STD_LOGIC_VECTOR'((fsm_output(90)) & (((NOT and_508_tmp) AND (fsm_output(103)))
            OR nor_90_cse) & (and_508_tmp AND (fsm_output(103)))));
        trans_ond_image_copy_3_y_1_sva <= (MUX_v_8_2_2(trans_ond_image_copy_3_y_1_sva
            & trans_ond_image_copy_3_y_1_sva_1, fsm_output(103))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(90)), 1),8));
        inv_wave_Mn_Inv_Wave_Fct_i_1_sva <= (MUX_v_32_2_2(inv_wave_Mn_Inv_Wave_Fct_i_1_sva
            & STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(inv_wave_Mn_Inv_Wave_Fct_i_1_sva)
            + CONV_SIGNED(CONV_UNSIGNED('1', 1), 32), 32)), fsm_output(103))) AND
            STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(90)), 1),32));
        exit_copy_x_3_sva <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'(((NOT (z_out_51(4)))
            OR exit_copy_x_3_sva) & exit_copy_x_3_sva), nor_90_cse)) AND (NOT (fsm_output(90)));
        trans_ond_image_copy_3_x_1_sva <= (MUX_v_9_2_2(trans_ond_image_copy_3_x_1_sva_1
            & trans_ond_image_copy_3_x_1_sva, nor_90_cse AND (NOT (fsm_output(102)))))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(nor_90_cse, 1),9));
        ModelA_getChar_for_if_p_count_lpi_1_dfm <= MUX1HOT_v_32_3_2(ModelA_getChar_for_if_p_count_lpi_1
            & ModelA_getChar_for_if_p_count_sva & ModelA_getChar_for_if_p_count_lpi_1_dfm,
            STD_LOGIC_VECTOR'(and_dcpl_479 & and_dcpl_480 & or_5242_cse));
        dec_decompress_for_1_mul_psp <= MUX_v_64_2_2(dec_decompress_for_1_mul_psp
            & (z_out_29(63 DOWNTO 0)), fsm_output(90));
        dec_decompress_for_1_mul_1_mut <= MUX_v_64_2_2(dec_decompress_for_1_mul_1_mut
            & z_out_28, fsm_output(90));
        ModelA_getChar_for_if_p_low_lpi_1_dfm <= MUX1HOT_v_32_3_2(ModelA_getChar_for_if_p_low_lpi_1
            & ModelA_getChar_for_if_p_low_sva & ModelA_getChar_for_if_p_low_lpi_1_dfm,
            STD_LOGIC_VECTOR'(and_dcpl_479 & and_dcpl_480 & or_5242_cse));
        ModelA_getChar_for_if_p_high_lpi_1_dfm <= MUX1HOT_v_32_3_2(ModelA_getChar_for_if_p_high_lpi_1
            & ModelA_getChar_for_slc_2_cse_sva & ModelA_getChar_for_if_p_high_lpi_1_dfm,
            STD_LOGIC_VECTOR'(and_dcpl_479 & and_dcpl_480 & or_5242_cse));
        dec_decompress_low_sva_1 <= MUX1HOT_v_32_3_2(z_out_19 & ((MUX1HOT_v_16_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(dec_decompress_low_sva_1(30
            DOWNTO 15)) + CONV_UNSIGNED(CONV_SIGNED('1', 1), 16), 16)) & (dec_decompress_low_sva_1(30
            DOWNTO 15)) & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (dec_decompress_low_sva_1(14)),
            1),16)), STD_LOGIC_VECTOR'(dec_decompress_for_1_for_nor_cse & (((NOT
            dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx1) AND dec_decompress_for_1_for_and_1_cse)
            OR (z_out_43(17))) & (dec_decompress_for_1_for_else_else_land_lpi_2_dfm_mx1
            AND dec_decompress_for_1_for_and_1_cse)))) & TO_STDLOGICVECTOR(MUX_s_1_2_2(STD_LOGIC_VECTOR'((dec_decompress_low_sva_1(14))
            & (NOT (dec_decompress_low_sva_1(14)))), dec_decompress_for_1_for_and_1_cse))
            & (dec_decompress_low_sva_1(13 DOWNTO 0)) & TO_STDLOGICVECTOR('0')) &
            dec_decompress_low_sva_1, STD_LOGIC_VECTOR'((fsm_output(95)) & (fsm_output(97))
            & (NOT((fsm_output(95)) OR (fsm_output(97))))));
        dec_decompress_high_1_sva_1 <= MUX1HOT_v_32_3_2(z_out_18 & ((MUX1HOT_v_16_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(dec_decompress_high_1_sva_1(30
            DOWNTO 15)) + CONV_UNSIGNED(CONV_SIGNED('1', 1), 16), 16)) & (dec_decompress_high_1_sva_1_dfm_sg1(16
            DOWNTO 1)) & (dec_decompress_high_1_sva_1(30 DOWNTO 15)), STD_LOGIC_VECTOR'(dec_decompress_for_1_for_nor_cse
            & dec_decompress_for_1_for_and_1_cse & (z_out_43(17))))) & TO_STDLOGICVECTOR(MUX_s_1_2_2(STD_LOGIC_VECTOR'((dec_decompress_high_1_sva_1(14))
            & (dec_decompress_high_1_sva_1_dfm_sg1(0))), dec_decompress_for_1_for_and_1_cse))
            & (dec_decompress_high_1_sva_1(13 DOWNTO 0)) & TO_STDLOGICVECTOR('1'))
            & dec_decompress_high_1_sva_1, STD_LOGIC_VECTOR'((fsm_output(96)) & (fsm_output(97))
            & (NOT((fsm_output(96)) OR (fsm_output(97))))));
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg16 <= dec_decompress_value_1_sg14_lpi_3_sg16;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg15 <= dec_decompress_value_1_sg14_lpi_3_sg15;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg14 <= dec_decompress_value_1_sg14_lpi_3_sg14;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg13 <= dec_decompress_value_1_sg14_lpi_3_sg13;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg12 <= dec_decompress_value_1_sg14_lpi_3_sg12;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg11 <= dec_decompress_value_1_sg14_lpi_3_sg11;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg10 <= dec_decompress_value_1_sg14_lpi_3_sg10;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg9 <= dec_decompress_value_1_sg14_lpi_3_sg9;
        dec_decompress_value_slc_dec_decompress_value_1_sg14_lpi_3_itm_sg8 <= dec_decompress_value_1_sg14_lpi_3_sg8;
        unequal_tmp_9 <= NOT((dec_m_input_m_LastMask_lpi_3(0)) AND (NOT((dec_m_input_m_LastMask_lpi_3(7))
            OR (dec_m_input_m_LastMask_lpi_3(6)) OR (dec_m_input_m_LastMask_lpi_3(5))
            OR (dec_m_input_m_LastMask_lpi_3(4)) OR (dec_m_input_m_LastMask_lpi_3(3))
            OR (dec_m_input_m_LastMask_lpi_3(2)) OR (dec_m_input_m_LastMask_lpi_3(1)))));
        copy_y_3_slc_itm <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(copy_y_3_slc_itm & (z_out_5(3))),
            fsm_output(100));
        trans_ond_image_copy_3_x_1_sva_1 <= MUX_v_9_2_2(trans_ond_image_copy_3_x_1_sva_1
            & z_out_4, fsm_output(100));
        inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva_dfm_2 <= MUX_v_32_2_2(inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva
            & inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva_dfm_2, or_dcpl_5333 OR or_dcpl_5330
            OR or_dcpl_3303 OR or_dcpl_3202 OR or_dcpl_5318 OR or_dcpl_5315 OR or_dcpl_5311
            OR or_dcpl_634 OR or_dcpl_633);
        inv_wave_Mn_Inv_Wave_Fct_i_2_sg1_sva <= (MUX_v_31_2_2(z_out_46 & inv_wave_Mn_Inv_Wave_Fct_i_2_sg1_sva,
            and_dcpl_489)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(104)),
            1),31));
        inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3 <= MUX1HOT_v_30_3_2((STD_LOGIC_VECTOR'("00000000000000000000000")
            & (MUX_v_7_2_2(inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_7 & (TO_STDLOGICVECTOR('0')
            & (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_7(6 DOWNTO 1))), copy_x_3_and_8_tmp)))
            & inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3 & ((MUX_v_28_2_2((inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(28
            DOWNTO 1)) & (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(27 DOWNTO 0)),
            inv_wave_Mn_Inv_Wave_Fct_for_1_nand_svs)) & TO_STDLOGICVECTOR(MUX_s_1_2_2(STD_LOGIC_VECTOR'((inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(0))
            & inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2), inv_wave_Mn_Inv_Wave_Fct_for_1_nand_svs))
            & TO_STDLOGICVECTOR(MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva), inv_wave_Mn_Inv_Wave_Fct_for_1_nand_svs))),
            STD_LOGIC_VECTOR'((fsm_output(103)) & or_5392_cse & (fsm_output(135))));
        inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_hi_1_sva
            & (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_7(0)) & inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva & inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_mdf_sva),
            STD_LOGIC_VECTOR'(or_6014_cse & and_866_cse & or_5392_cse & and_769_cse
            & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg28_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg28_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg27_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg26_sva_dfm_2),
            STD_LOGIC_VECTOR'((or_dcpl_5333 OR or_dcpl_5330 OR or_dcpl_3303 OR or_dcpl_5412
            OR or_dcpl_5408 OR or_dcpl_2527 OR or_dcpl_2569 OR or_dcpl_2494 OR or_dcpl_637
            OR or_dcpl_3907 OR (fsm_output(105))) & and_769_cse & and_770_cse)))
            AND (NOT (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg27_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg26_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg25_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg27_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg26_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg25_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg24_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg26_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg25_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg24_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg23_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg25_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg24_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg23_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg22_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg24_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg23_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg22_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg21_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg23_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg22_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg21_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg20_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg22_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg21_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg20_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg19_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg21_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg20_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg19_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg18_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg20_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg19_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg18_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg17_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg19_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg18_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg17_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg16_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg18_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg17_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg16_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg15_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg17_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg16_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg15_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg16_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg15_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg15_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2),
            STD_LOGIC_VECTOR'(and_769_cse & and_770_cse & and_dcpl_489))) AND (NOT
            (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva
            & inv_wave_Mn_Inv_Wave_Fct_for_and_22_itm & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2),
            STD_LOGIC_VECTOR'((and_863_cse OR and_755_cse) & and_864_m1c & or_5392_cse
            & and_769_cse & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2),
            STD_LOGIC_VECTOR'(or_6014_cse & and_866_cse & or_5392_cse & and_769_cse
            & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2),
            STD_LOGIC_VECTOR'(or_6014_cse & and_866_cse & or_5392_cse & and_769_cse
            & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2),
            STD_LOGIC_VECTOR'(or_6014_cse & and_866_cse & or_5392_cse & and_769_cse
            & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2),
            STD_LOGIC_VECTOR'(or_6014_cse & and_866_cse & or_5392_cse & and_769_cse
            & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2),
            STD_LOGIC_VECTOR'(or_6014_cse & and_866_cse & or_5392_cse & and_769_cse
            & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2),
            STD_LOGIC_VECTOR'(or_6014_cse & and_866_cse & or_5392_cse & and_769_cse
            & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_for_1_slc_2_mdf_sva),
            STD_LOGIC_VECTOR'(or_6014_cse & and_866_cse & or_5392_cse & and_769_cse
            & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2 <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_1_sva
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva & inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_for_1_slc_2_mdf_sva & inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_1_mdf_sva),
            STD_LOGIC_VECTOR'(or_6014_cse & and_866_cse & or_5392_cse & and_769_cse
            & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg29_sva_dfm_2 <= (MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg29_sva_dfm_2
            & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg28_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg27_sva_dfm_2),
            STD_LOGIC_VECTOR'((or_dcpl_3943 OR or_5942_cse OR (fsm_output(113)) OR
            (fsm_output(114)) OR (fsm_output(115)) OR (fsm_output(116)) OR (fsm_output(106))
            OR (fsm_output(107)) OR (fsm_output(105))) & and_769_cse & and_770_cse)))
            AND (NOT (fsm_output(104)));
        inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_dfm_3 <= MUX1HOT_v_32_4_2(inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva
            & inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_dfm_3 & inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_2
            & inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_3, STD_LOGIC_VECTOR'((fsm_output(103))
            & (fsm_output(104)) & and_769_cse & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_dfm_3 <= MUX1HOT_v_32_4_2(inv_wave_Mn_Inv_Wave_Fct_himpairs_sva
            & inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_dfm_3 & inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_2
            & inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_3, STD_LOGIC_VECTOR'((fsm_output(103))
            & (fsm_output(104)) & and_769_cse & and_770_cse));
        inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva
            & (z_out_23(32))), fsm_output(105));
        inv_wave_Mn_Inv_Wave_Fct_for_1_slc_2_mdf_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_for_1_slc_2_mdf_sva
            & (z_out_24(32))), fsm_output(105));
        inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_2 <= MUX_v_32_2_2(z_out & inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_2,
            or_5768_cse);
        inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_2 <= MUX_v_32_2_2(z_out_1 & inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_2,
            or_5768_cse);
        inv_wave_Inv_Wave_y_sva <= (MUX_v_8_2_2(inv_wave_Inv_Wave_y_sva & z_out_25,
            fsm_output(116))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(105)),
            1),8));
        hsplit_x_and_cse_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(hsplit_x_and_cse_sva_1
            & hsplit_x_and_cse_sva), or_dcpl_3943 OR or_5942_cse OR or_5943_cse OR
            (fsm_output(115)) OR (fsm_output(107)));
        inv_wave_Inv_Wave_x_sva <= (MUX_v_9_2_2(z_out_4 & inv_wave_Inv_Wave_x_sva,
            NOT((fsm_output(106)) OR (fsm_output(107))))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(106)), 1),9));
        hsplit_y_slc_inv_wave_Inv_Wave_x_27_itm <= MUX_v_5_2_2((inv_wave_Inv_Wave_x_sva_mx0(4
            DOWNTO 0)) & hsplit_y_slc_inv_wave_Inv_Wave_x_27_itm, or_dcpl_2081 OR
            (fsm_output(110)) OR (fsm_output(111)) OR or_dcpl_2439 OR (fsm_output(107)));
        hsplit_y_slc_inv_wave_Inv_Wave_x_13_itm <= MUX_v_5_2_2((inv_wave_Inv_Wave_x_sva_mx0(4
            DOWNTO 0)) & hsplit_y_slc_inv_wave_Inv_Wave_x_13_itm, or_dcpl_3943 OR
            or_5942_cse OR (fsm_output(107)));
        hsplit_y_slc_inv_wave_Inv_Wave_x_26_itm <= MUX_v_6_2_2((inv_wave_Inv_Wave_x_sva_mx0(5
            DOWNTO 0)) & hsplit_y_slc_inv_wave_Inv_Wave_x_26_itm, or_dcpl_3943 OR
            (fsm_output(111)) OR (fsm_output(107)));
        hsplit_y_slc_inv_wave_Inv_Wave_x_9_itm <= MUX_v_6_2_2((inv_wave_Inv_Wave_x_sva_mx0(5
            DOWNTO 0)) & hsplit_y_slc_inv_wave_Inv_Wave_x_9_itm, or_dcpl_2081 OR
            (fsm_output(110)) OR (fsm_output(107)));
        hsplit_y_slc_inv_wave_Inv_Wave_x_16_itm <= MUX_v_6_2_2((inv_wave_Inv_Wave_x_sva_mx0(5
            DOWNTO 0)) & hsplit_y_slc_inv_wave_Inv_Wave_x_16_itm, or_dcpl_2081 OR
            (fsm_output(107)));
        hsplit_y_slc_inv_wave_Inv_Wave_x_17_itm <= MUX_v_6_2_2((inv_wave_Inv_Wave_x_sva_mx0(5
            DOWNTO 0)) & hsplit_y_slc_inv_wave_Inv_Wave_x_17_itm, fsm_output(107));
        hsplit_y_acc_76_psp <= MUX_v_9_2_2(hsplit_y_acc_76_psp & z_out_26, fsm_output(107));
        hsplit_y_acc_75_psp <= MUX_v_8_2_2(hsplit_y_acc_75_psp & z_out_27, fsm_output(107));
        hsplit_y_acc_psp <= MUX_v_9_2_2(hsplit_y_acc_psp & z_out_34, fsm_output(107));
        hsplit_y_acc_2_itm <= MUX_v_17_2_2(hsplit_y_acc_2_itm & z_out_3, fsm_output(107));
        reg_hsplit_y_acc_5_cse_sva_cse <= z_out_48;
        hsplit_y_slc_13_itm <= MUX_v_8_2_2(hsplit_y_slc_13_itm & (z_out_21(8 DOWNTO
            1)), fsm_output(109));
        hsplit_y_slc_11_itm <= MUX_v_8_2_2(hsplit_y_slc_11_itm & (z_out_22(8 DOWNTO
            1)), fsm_output(109));
        hsplit_y_slc_9_itm <= MUX_v_8_2_2(hsplit_y_slc_9_itm & (z_out_20(8 DOWNTO
            1)), fsm_output(109));
        hsplit_y_acc_63_itm <= MUX_v_8_2_2(hsplit_y_acc_63_itm & (z_out_11(7 DOWNTO
            0)), fsm_output(109));
        hsplit_y_acc_46_itm <= MUX_v_8_2_2(hsplit_y_acc_46_itm & (z_out_12(7 DOWNTO
            0)), fsm_output(111));
        hsplit_y_acc_38_itm <= MUX_v_8_2_2(hsplit_y_acc_38_itm & (z_out_15(7 DOWNTO
            0)), fsm_output(111));
        reg_hsplit_y_acc_30_itm_cse <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_21(8
            DOWNTO 1)) + UNSIGNED(MUX_v_8_2_2(hsplit_y_slc_9_itm & hsplit_y_1_slc_9_itm,
            fsm_output(123))), 8));
        inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_mdf_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((z_out_23(32))
            & inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_mdf_sva), or_5849_cse);
        inv_wave_image_copy_y_sva <= (MUX_v_32_2_2(z_out & inv_wave_image_copy_y_sva,
            NOT((fsm_output(134)) OR (fsm_output(129))))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(129)), 1),32));
        inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_1_mdf_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((z_out_24(32))
            & inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_1_mdf_sva), or_5849_cse);
        inv_wave_Mn_Inv_Wave_Fct_for_1_nand_svs <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_for_1_nand_svs
            & inv_wave_Mn_Inv_Wave_Fct_for_1_nand_tmp), fsm_output(117));
        inv_wave_Inv_Wave_1_y_sva <= (MUX_v_8_2_2(inv_wave_Inv_Wave_1_y_sva & z_out_25,
            fsm_output(128))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(117)),
            1),8));
        inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_3 <= MUX_v_32_2_2(z_out & inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_3,
            or_5849_cse);
        inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_3 <= MUX_v_32_2_2(z_out_1 & inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_3,
            or_5849_cse);
        hsplit_x_1_and_cse_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(hsplit_x_1_and_cse_sva_1
            & hsplit_x_1_and_cse_sva), (fsm_output(127)) OR (fsm_output(123)) OR
            (fsm_output(124)) OR or_dcpl_2527 OR or_dcpl_3173);
        inv_wave_Inv_Wave_1_x_sva <= (MUX_v_9_2_2(z_out_4 & inv_wave_Inv_Wave_1_x_sva,
            NOT((fsm_output(119)) OR (fsm_output(118))))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(118)), 1),9));
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_27_itm <= MUX_v_5_2_2((inv_wave_Inv_Wave_1_x_sva_mx0(4
            DOWNTO 0)) & hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_27_itm, or_dcpl_2537
            OR (fsm_output(125)) OR (fsm_output(120)) OR or_dcpl_3752);
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_13_itm <= MUX_v_5_2_2((inv_wave_Inv_Wave_1_x_sva_mx0(4
            DOWNTO 0)) & hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_13_itm, or_dcpl_2537
            OR (fsm_output(120)) OR or_dcpl_3752);
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_26_itm <= MUX_v_6_2_2((inv_wave_Inv_Wave_1_x_sva_mx0(5
            DOWNTO 0)) & hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_26_itm, (fsm_output(123))
            OR (fsm_output(120)) OR (fsm_output(121)) OR or_dcpl_2059);
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_9_itm <= MUX_v_6_2_2((inv_wave_Inv_Wave_1_x_sva_mx0(5
            DOWNTO 0)) & hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_9_itm, or_dcpl_3173);
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_16_itm <= MUX_v_6_2_2((inv_wave_Inv_Wave_1_x_sva_mx0(5
            DOWNTO 0)) & hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_16_itm, or_dcpl_639
            OR (fsm_output(119)));
        hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_17_itm <= MUX_v_6_2_2((inv_wave_Inv_Wave_1_x_sva_mx0(5
            DOWNTO 0)) & hsplit_y_1_slc_inv_wave_Inv_Wave_1_x_17_itm, fsm_output(119));
        hsplit_y_1_acc_76_psp <= MUX_v_9_2_2(hsplit_y_1_acc_76_psp & z_out_26, fsm_output(119));
        hsplit_y_1_acc_75_psp <= MUX_v_8_2_2(hsplit_y_1_acc_75_psp & z_out_27, fsm_output(119));
        hsplit_y_1_acc_psp <= MUX_v_9_2_2(hsplit_y_1_acc_psp & z_out_34, fsm_output(119));
        hsplit_y_1_acc_2_itm <= MUX_v_17_2_2(hsplit_y_1_acc_2_itm & z_out_3, fsm_output(119));
        hsplit_y_1_slc_Vga_3_cse_sva <= Vga_rsc_singleport_data_out_mxwt;
        hsplit_y_1_slc_13_itm <= MUX_v_8_2_2(hsplit_y_1_slc_13_itm & (z_out_21(8
            DOWNTO 1)), fsm_output(121));
        hsplit_y_1_slc_11_itm <= MUX_v_8_2_2(hsplit_y_1_slc_11_itm & (z_out_22(8
            DOWNTO 1)), fsm_output(121));
        hsplit_y_1_slc_9_itm <= MUX_v_8_2_2(hsplit_y_1_slc_9_itm & (z_out_20(8 DOWNTO
            1)), fsm_output(121));
        hsplit_y_1_acc_63_itm <= MUX_v_8_2_2(hsplit_y_1_acc_63_itm & (z_out_11(7
            DOWNTO 0)), fsm_output(121));
        hsplit_y_1_acc_46_itm <= MUX_v_8_2_2(hsplit_y_1_acc_46_itm & (z_out_12(7
            DOWNTO 0)), fsm_output(123));
        hsplit_y_1_acc_38_itm <= MUX_v_8_2_2(hsplit_y_1_acc_38_itm & (z_out_15(7
            DOWNTO 0)), fsm_output(123));
        inv_wave_image_copy_x_sva <= (MUX_v_32_2_2(z_out & inv_wave_image_copy_x_sva,
            or_dcpl_655)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(130)),
            1),32));
        exit_copy_y_4_sva <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(exit_copy_y_4_sva & (NOT
            (z_out_45(33)))), fsm_output(131));
        copy_y_4_slc_inv_wave_image_copy_x_1_itm <= MUX_v_6_2_2(((inv_wave_image_copy_x_sva(5
            DOWNTO 0)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(130)),
            1),6))) & copy_y_4_slc_inv_wave_image_copy_x_1_itm, NOT((fsm_output(130))
            OR (fsm_output(133))));
        reg_hsplit_y_1_acc_sdt_tmp_7 <= MUX_v_2_2_2(reg_hsplit_y_1_acc_sdt_tmp_7
            & (z_out_8(1 DOWNTO 0)), fsm_output(119));
        reg_hsplit_y_1_acc_67_sdt_tmp_8 <= MUX_v_2_2_2(reg_hsplit_y_1_acc_67_sdt_tmp_8
            & (z_out_40(1 DOWNTO 0)), fsm_output(119));
        reg_hsplit_y_acc_sdt_tmp_7 <= MUX_v_2_2_2(reg_hsplit_y_acc_sdt_tmp_7 & (z_out_8(1
            DOWNTO 0)), fsm_output(107));
        reg_hsplit_y_acc_67_sdt_tmp_8 <= MUX_v_2_2_2(reg_hsplit_y_acc_67_sdt_tmp_8
            & (z_out_40(1 DOWNTO 0)), fsm_output(107));
        reg_div_mgc_div_b_tmp_1 <= MUX1HOT_v_32_5_2(ModelA_getProbability_p_count_sva
            & z_out_18 & dec_decompress_for_1_range_sva & div_mgc_div_1_b_mx1 & ModelA_getChar_for_if_p_count_lpi_1_dfm,
            STD_LOGIC_VECTOR'((or_dcpl_3385 OR or_dcpl_596 OR (fsm_output(52))) &
            (fsm_output(74)) & or_3423_cse & (fsm_output(90)) & or_3427_cse));
        reg_div_mgc_div_a_tmp <= (MUX_v_3_2_2((dec_decompress_for_1_scaled_value_acc_mut_mx0w2(66
            DOWNTO 64)) & (dec_decompress_for_1_scaled_value_acc_mut(66 DOWNTO 64)),
            or_3423_cse)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(90)),
            1),3)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT((fsm_output(47))
            OR or_3431_ssc OR or_3427_cse), 1),3));
        reg_div_mgc_div_a_tmp_1 <= MUX1HOT_v_64_5_2((z_out_29(63 DOWNTO 0)) & comp_compress_for_mul_1_psp
            & (dec_decompress_for_1_scaled_value_acc_mut_mx0w2(63 DOWNTO 0)) & (dec_decompress_for_1_scaled_value_acc_mut(63
            DOWNTO 0)) & dec_decompress_for_1_mul_psp, STD_LOGIC_VECTOR'(or_5990_cse
            & or_3431_ssc & (fsm_output(74)) & or_3423_cse & or_3427_cse));
        reg_passe_y_acc_46_sdt_tmp_7 <= MUX_v_2_2_2(reg_passe_y_acc_46_sdt_tmp_7
            & (z_out_33(1 DOWNTO 0)), fsm_output(11));
        reg_passe_y_acc_43_sdt_tmp_6 <= MUX_v_2_2_2(reg_passe_y_acc_43_sdt_tmp_6
            & (passe_y_acc_43_sdt_mx0w0(1 DOWNTO 0)), fsm_output(11));
        reg_slc_slc_tmp_5 <= MUX_v_2_2_2(reg_slc_slc_tmp_5 & (passe_y_1_acc_45_itm(2
            DOWNTO 1)), fsm_output(23));
        reg_passe_y_1_acc_44_sdt_tmp_6 <= z_out_35(1 DOWNTO 0);
        reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((NOT
            unequal_tmp_6) & reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp & and_367_ssc),
            STD_LOGIC_VECTOR'((fsm_output(61)) & or_dcpl_1040 & (fsm_output(65))));
        reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1 <= (MUX1HOT_v_6_3_2((comp_m_output_m_Mask_1_lpi_2(7
            DOWNTO 2)) & reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1 & (TO_STDLOGICVECTOR(reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp)
            & (reg_comp_m_output_m_Mask_lpi_dfm_sg1_tmp_1(5 DOWNTO 1))), STD_LOGIC_VECTOR'((fsm_output(61))
            & or_dcpl_1040 & (fsm_output(65))))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(((fsm_output(65))
            AND and_367_ssc) OR and_dcpl_530), 1),6));
        reg_comp_m_output_m_Mask_2_lpi_dfm_tmp <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((NOT
            unequal_tmp_6) & reg_comp_m_output_m_Mask_2_lpi_dfm_tmp & and_361_ssc),
            STD_LOGIC_VECTOR'((fsm_output(61)) & or_dcpl_3880 & (fsm_output(63))));
        reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1 <= (MUX1HOT_v_7_3_2((comp_m_output_m_Mask_1_lpi_2(7
            DOWNTO 1)) & reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1 & (TO_STDLOGICVECTOR(reg_comp_m_output_m_Mask_2_lpi_dfm_tmp)
            & (reg_comp_m_output_m_Mask_2_lpi_dfm_tmp_1(6 DOWNTO 1))), STD_LOGIC_VECTOR'((fsm_output(61))
            & or_dcpl_3880 & (fsm_output(63))))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(((fsm_output(63))
            AND and_361_ssc) OR and_dcpl_530), 1),7));
        reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(and_343_ssc
            & reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp & and_349_ssc), STD_LOGIC_VECTOR'((fsm_output(54))
            & or_dcpl_1310 & (fsm_output(56))));
        reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1 <= MUX1HOT_v_7_3_2(and_587_itm
            & reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1 & ((TO_STDLOGICVECTOR(reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp)
            & (reg_comp_m_output_m_Mask_1_lpi_2_dfm_tmp_1(6 DOWNTO 1))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            and_349_ssc, 1),7))), STD_LOGIC_VECTOR'((fsm_output(54)) & or_dcpl_1310
            & (fsm_output(56))));
        reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(and_343_ssc
            & reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp & and_355_ssc), STD_LOGIC_VECTOR'((fsm_output(54))
            & or_dcpl_741 & (fsm_output(58))));
        reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1 <= MUX1HOT_v_7_3_2(and_587_itm
            & reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1 & ((TO_STDLOGICVECTOR(reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp)
            & (reg_comp_m_output_m_Mask_1_lpi_2_dfm_1_tmp_1(6 DOWNTO 1))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            and_355_ssc, 1),7))), STD_LOGIC_VECTOR'((fsm_output(54)) & or_dcpl_741
            & (fsm_output(58))));
      END IF;
    END IF;
  END PROCESS;
  mux1h_790_nl <= MUX1HOT_v_32_13_2(cmodel_cumulative_frequency_rsc_singleport_data_out
      & inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva & inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_dfm_3
      & inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_2 & (ModelA_update_for_i_sva_sg1 &
      ModelA_update_for_i_sva_2) & comp_put_bit_plus_pending_for_i_sva & comp_compress_pending_bits_1_lpi_2
      & comp_put_bit_plus_pending_1_for_i_sva & comp_put_bit_plus_pending_2_for_i_sva
      & comp_put_bit_plus_pending_3_for_i_sva & (ModelA_update_1_for_i_sva_sg1 &
      ModelA_update_1_for_i_sva_2) & inv_wave_image_copy_y_sva & inv_wave_image_copy_x_sva,
      STD_LOGIC_VECTOR'(((fsm_output(45)) OR (fsm_output(86))) & (fsm_output(103))
      & (fsm_output(105)) & (fsm_output(117)) & (fsm_output(44)) & (fsm_output(56))
      & or_dcpl_3251 & (fsm_output(58)) & (fsm_output(63)) & (fsm_output(65)) & (fsm_output(85))
      & (fsm_output(134)) & (fsm_output(131))));
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux1h_790_nl) + CONV_UNSIGNED(SIGNED'(or_5969_cse
      & '1'), 32), 32));
  mux1h_741_nl <= MUX1HOT_v_32_4_2(inv_wave_Mn_Inv_Wave_Fct_himpairs_sva & inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_dfm_3
      & inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_2 & comp_m_output_index_range_lpi_2,
      STD_LOGIC_VECTOR'((fsm_output(103)) & (fsm_output(105)) & (fsm_output(117))
      & or_dcpl_3251));
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux1h_741_nl) + CONV_UNSIGNED(SIGNED'(or_5969_cse
      & '1'), 32), 32));
  mux_332_nl <= MUX_v_6_2_2((inv_wave_Inv_Wave_1_x_sva(5 DOWNTO 0)) & (inv_wave_Inv_Wave_x_sva(5
      DOWNTO 0)), fsm_output(107));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_48 & (mux_332_nl)) + UNSIGNED(z_out_6),
      17));
  mux_292_nl <= MUX_v_6_2_2((inv_wave_Inv_Wave_x_sva(5 DOWNTO 0)) & (inv_wave_Inv_Wave_1_x_sva(5
      DOWNTO 0)), fsm_output(119));
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_34 & (z_out_8(1 DOWNTO
      0)) & (mux_292_nl)) + UNSIGNED(z_out_6), 17));
  mux1h_742_nl <= MUX1HOT_s_1_9_2(STD_LOGIC_VECTOR'((cmodel_cumulative_frequency_vinit_ndx_sva(8))
      & (cmodel_cumulative_frequency_vinit_ndx_1_sva(8)) & (inv_wave_Inv_Wave_x_sva(8))
      & (inv_wave_Inv_Wave_1_x_sva(8)) & (ModelA_getChar_for_i_1_sva(8)) & (trans_ond_image_copy_x_1_sva(8))
      & comp_compress_for_c_sg1_2_lpi_1_dfm_1 & (trans_ond_image_copy_2_x_1_sva(8))
      & (trans_ond_image_copy_3_x_1_sva(8))), STD_LOGIC_VECTOR'((fsm_output(2)) &
      (fsm_output(70)) & (fsm_output(107)) & (fsm_output(119)) & (fsm_output(81))
      & (fsm_output(4)) & (fsm_output(41)) & (fsm_output(67)) & (fsm_output(100))));
  mux1h_798_nl <= MUX1HOT_v_8_11_2((cmodel_cumulative_frequency_vinit_ndx_sva(7 DOWNTO
      0)) & (cmodel_cumulative_frequency_vinit_ndx_1_sva(7 DOWNTO 0)) & (inv_wave_Inv_Wave_x_sva(7
      DOWNTO 0)) & (inv_wave_Inv_Wave_1_x_sva(7 DOWNTO 0)) & (ModelA_getChar_for_i_1_sva(7
      DOWNTO 0)) & (trans_ond_image_copy_x_1_sva(7 DOWNTO 0)) & STD_LOGIC_VECTOR'((NOT
      trans_ond_Mn_Trans_Ond_wi_7_sg8_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg7_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg6_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg5_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg4_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg3_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg2_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg1_sva))
      & comp_compress_for_c_1_lpi_1_dfm_1 & (trans_ond_image_copy_2_x_1_sva(7 DOWNTO
      0)) & (trans_ond_image_copy_3_x_1_sva(7 DOWNTO 0)) & STD_LOGIC_VECTOR'((NOT
      inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva)),
      STD_LOGIC_VECTOR'((fsm_output(2)) & (fsm_output(70)) & (fsm_output(107)) &
      (fsm_output(119)) & (fsm_output(81)) & (fsm_output(4)) & or_5972_ssc & (fsm_output(41))
      & (fsm_output(67)) & (fsm_output(100)) & (fsm_output(103))));
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR((mux1h_742_nl)
      OR or_5972_ssc OR (fsm_output(103))) & (mux1h_798_nl)) + CONV_UNSIGNED(SIGNED'(((fsm_output(2))
      OR (fsm_output(70))) & '1'), 9), 9));
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_4(8 DOWNTO
      6)), 4) + UNSIGNED'("1011"), 4));
  nor_127_cse <= NOT((fsm_output(107)) OR (fsm_output(119)));
  mux1h_744_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_32(8)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg15_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_799_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_32(7)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_793_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_32(6)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_794_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_32(5)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_795_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_32(4)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_796_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_32(3)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_797_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_32(2)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_800_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_32(1)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_801_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_32(0)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_802_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_33(1)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_803_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_33(0)) & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_804_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((trans_ond_Trans_Ond_x_1_sva(5))
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2),
      STD_LOGIC_VECTOR'((fsm_output(11)) & (fsm_output(107)) & (fsm_output(119))));
  mux1h_805_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((trans_ond_Trans_Ond_x_1_sva(4))
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2),
      STD_LOGIC_VECTOR'((fsm_output(11)) & (fsm_output(107)) & (fsm_output(119))));
  mux1h_806_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((trans_ond_Trans_Ond_x_1_sva(3))
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2),
      STD_LOGIC_VECTOR'((fsm_output(11)) & (fsm_output(107)) & (fsm_output(119))));
  mux1h_807_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((trans_ond_Trans_Ond_x_1_sva(2))
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2),
      STD_LOGIC_VECTOR'((fsm_output(11)) & (fsm_output(107)) & (fsm_output(119))));
  mux1h_808_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((trans_ond_Trans_Ond_x_1_sva(1))
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2),
      STD_LOGIC_VECTOR'((fsm_output(11)) & (fsm_output(107)) & (fsm_output(119))));
  mux1h_809_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((trans_ond_Trans_Ond_x_1_sva(0))
      & inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_for_1_slc_2_mdf_sva),
      STD_LOGIC_VECTOR'((fsm_output(11)) & (fsm_output(107)) & (fsm_output(119))));
  mux1h_745_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg1_sva
      & hsplit_y_and_4_cse_sva & hsplit_y_1_and_4_cse_sva), STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  z_out_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'((mux1h_744_nl) & (mux1h_799_nl)
      & (mux1h_793_nl) & (mux1h_794_nl) & (mux1h_795_nl) & (mux1h_796_nl) & (mux1h_797_nl)
      & (mux1h_800_nl) & (mux1h_801_nl) & (mux1h_802_nl) & (mux1h_803_nl) & (mux1h_804_nl)
      & (mux1h_805_nl) & (mux1h_806_nl) & (mux1h_807_nl) & (mux1h_808_nl) & (mux1h_809_nl))
      + CONV_UNSIGNED(UNSIGNED'((trans_ond_Mn_Trans_Ond_wi_7_sg8_sva AND nor_127_cse)
      & (trans_ond_Mn_Trans_Ond_wi_7_sg7_sva AND nor_127_cse) & (trans_ond_Mn_Trans_Ond_wi_7_sg6_sva
      AND nor_127_cse) & (trans_ond_Mn_Trans_Ond_wi_7_sg5_sva AND nor_127_cse) &
      (trans_ond_Mn_Trans_Ond_wi_7_sg4_sva AND nor_127_cse) & (trans_ond_Mn_Trans_Ond_wi_7_sg3_sva
      AND nor_127_cse) & (trans_ond_Mn_Trans_Ond_wi_7_sg2_sva AND nor_127_cse) &
      (mux1h_745_nl)), 17), 17));
  mux_294_nl <= MUX_v_2_2_2((passe_y_acc_43_sdt_mx0w0(1 DOWNTO 0)) & (passe_y_1_acc_45_itm(2
      DOWNTO 1)), fsm_output(23));
  mux_423_nl <= MUX_v_6_2_2((trans_ond_Trans_Ond_x_1_sva(5 DOWNTO 0)) & (trans_ond_Trans_Ond_1_x_1_sva(5
      DOWNTO 0)), fsm_output(23));
  mux_295_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg7_sva
      & trans_ond_Mn_Trans_Ond_wi_7_sg8_sva), fsm_output(23));
  mux_424_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg6_sva
      & trans_ond_Mn_Trans_Ond_wi_7_sg7_sva), fsm_output(23));
  mux_425_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg5_sva
      & trans_ond_Mn_Trans_Ond_wi_7_sg6_sva), fsm_output(23));
  mux_426_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg4_sva
      & trans_ond_Mn_Trans_Ond_wi_7_sg5_sva), fsm_output(23));
  mux_427_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg3_sva
      & trans_ond_Mn_Trans_Ond_wi_7_sg4_sva), fsm_output(23));
  mux_428_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg2_sva
      & trans_ond_Mn_Trans_Ond_wi_7_sg3_sva), fsm_output(23));
  mux_429_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_wi_7_sg1_sva
      & trans_ond_Mn_Trans_Ond_wi_7_sg2_sva), fsm_output(23));
  z_out_7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_36 & (mux_294_nl) & (mux_423_nl))
      + CONV_UNSIGNED(UNSIGNED'((trans_ond_Mn_Trans_Ond_wi_7_sg8_sva AND (NOT (fsm_output(23))))
      & (mux_295_nl) & (mux_424_nl) & (mux_425_nl) & (mux_426_nl) & (mux_427_nl)
      & (mux_428_nl) & (mux_429_nl)), 16), 16));
  trans_ond_sub_2_and_cse <= (z_out_37(9)) AND (z_out_37(1));
  or_5985_cse <= (fsm_output(13)) OR (fsm_output(25));
  or_5986_cse <= (fsm_output(15)) OR (fsm_output(27));
  mux1h_746_nl <= MUX1HOT_v_8_9_2((z_out_37(9 DOWNTO 2)) & (z_out_39(9 DOWNTO 2))
      & trans_ond_image_copy_y_1_sva & (trans_ond_Trans_Ond_y_1_sva & TO_STDLOGICVECTOR('1'))
      & trans_ond_image_copy_1_y_1_sva & trans_ond_image_copy_2_y_1_sva & trans_ond_image_copy_3_y_1_sva
      & inv_wave_Inv_Wave_y_sva & inv_wave_Inv_Wave_1_y_sva, STD_LOGIC_VECTOR'(or_5985_cse
      & or_5986_cse & (fsm_output(4)) & (fsm_output(11)) & (fsm_output(35)) & (fsm_output(67))
      & (fsm_output(100)) & (fsm_output(107)) & (fsm_output(119))));
  mux1h_747_nl <= MUX1HOT_v_2_7_2((trans_ond_image_copy_x_1_sva(8 DOWNTO 7)) & (trans_ond_Trans_Ond_x_1_sva(7
      DOWNTO 6)) & STD_LOGIC_VECTOR'('0' & (trans_ond_image_copy_1_x_1_sva_2(7)))
      & (trans_ond_image_copy_2_x_1_sva(8 DOWNTO 7)) & (trans_ond_image_copy_3_x_1_sva(8
      DOWNTO 7)) & (inv_wave_Inv_Wave_x_sva(8 DOWNTO 7)) & (inv_wave_Inv_Wave_1_x_sva(8
      DOWNTO 7)), STD_LOGIC_VECTOR'((fsm_output(4)) & (fsm_output(11)) & (fsm_output(35))
      & (fsm_output(67)) & (fsm_output(100)) & (fsm_output(107)) & (fsm_output(119))));
  mux1h_810_nl <= MUX1HOT_s_1_9_2(STD_LOGIC_VECTOR'(trans_ond_sub_2_and_cse & ((z_out_39(9))
      AND (z_out_39(1))) & (trans_ond_image_copy_x_1_sva(6)) & (trans_ond_Trans_Ond_x_1_sva(5))
      & (trans_ond_image_copy_1_x_1_sva_2(6)) & (trans_ond_image_copy_2_x_1_sva(6))
      & (trans_ond_image_copy_3_x_1_sva(6)) & (inv_wave_Inv_Wave_x_sva(6)) & (inv_wave_Inv_Wave_1_x_sva(6))),
      STD_LOGIC_VECTOR'(or_5985_cse & or_5986_cse & (fsm_output(4)) & (fsm_output(11))
      & (fsm_output(35)) & (fsm_output(67)) & (fsm_output(100)) & (fsm_output(107))
      & (fsm_output(119))));
  z_out_8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux1h_746_nl),
      9) + CONV_UNSIGNED(UNSIGNED(((mux1h_747_nl) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT((fsm_output(13))
      OR (fsm_output(15)) OR (fsm_output(25)) OR (fsm_output(27))), 1),2))) & TO_STDLOGICVECTOR(mux1h_810_nl)),
      9), 9));
  z_out_9 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_38(9 DOWNTO
      2)), 9) + CONV_UNSIGNED(CONV_UNSIGNED((z_out_38(9)) AND (z_out_38(1)), 1),
      9), 9));
  z_out_10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_37(9 DOWNTO
      2)), 9) + CONV_UNSIGNED(CONV_UNSIGNED(trans_ond_sub_2_and_cse, 1), 9), 9));
  mux1h_748_nl <= MUX1HOT_v_8_3_2(Src_rsc_singleport_data_out_mxwt & Comp_rsc_singleport_data_out_mxwt
      & Vga_rsc_singleport_data_out_mxwt, STD_LOGIC_VECTOR'(or_5974_cse & or_5975_cse
      & or_5976_cse_1));
  mux1h_749_nl <= MUX1HOT_v_8_3_2(trans_ond_moy_slc_Src_3_cse_sva & trans_ond_moy_slc_Comp_11_cse_sva
      & hsplit_y_1_slc_Vga_3_cse_sva, STD_LOGIC_VECTOR'(or_5974_cse & or_5975_cse
      & or_5976_cse_1));
  z_out_11 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux1h_748_nl),
      9) + CONV_UNSIGNED(UNSIGNED(mux1h_749_nl), 9), 9));
  mux_430_nl <= MUX_v_8_2_2((z_out_10(7 DOWNTO 0)) & (z_out_22(8 DOWNTO 1)), (fsm_output(111))
      OR (fsm_output(123)));
  mux1h_751_nl <= MUX1HOT_v_8_4_2(trans_ond_sub_2_acc_1_cse_sva & trans_ond_sub_8_acc_1_cse_sva
      & hsplit_y_slc_13_itm & hsplit_y_1_slc_13_itm, STD_LOGIC_VECTOR'((fsm_output(15))
      & (fsm_output(27)) & (fsm_output(111)) & (fsm_output(123))));
  z_out_12 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_430_nl),
      9) + CONV_UNSIGNED(UNSIGNED(mux1h_751_nl), 9), 9));
  mux_417_nl <= MUX_v_8_2_2((z_out_11(7 DOWNTO 0)) & (z_out_11(8 DOWNTO 1)), (fsm_output(27))
      OR (fsm_output(15)));
  mux1h_753_nl <= MUX1HOT_v_8_4_2(trans_ond_moy_7_acc_cse_sg1_sva & trans_ond_moy_1_acc_cse_sg1_sva
      & hsplit_y_1_acc_63_itm & hsplit_y_acc_63_itm, STD_LOGIC_VECTOR'((fsm_output(27))
      & (fsm_output(15)) & (fsm_output(123)) & (fsm_output(111))));
  z_out_13 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_417_nl),
      9) + CONV_UNSIGNED(UNSIGNED(mux1h_753_nl), 9), 9));
  mux_303_nl <= MUX_v_8_2_2(hsplit_y_slc_11_itm & hsplit_y_1_slc_11_itm, fsm_output(123));
  z_out_15 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_22(8 DOWNTO
      1)), 9) + CONV_UNSIGNED(UNSIGNED(mux_303_nl), 9), 9));
  mux1h_754_nl <= MUX1HOT_v_17_8_2(comp_byte_to_encode_1_sva & (comp_m_output_index_range_lpi_2_dfm_1(16
      DOWNTO 0)) & (comp_m_output_index_range_lpi_2_dfm_3(16 DOWNTO 0)) & (comp_m_output_index_range_lpi_dfm_1(16
      DOWNTO 0)) & (comp_m_output_index_range_lpi_dfm_3(16 DOWNTO 0)) & dec_m_input_input_byte_1_sva
      & dec_m_input_input_byte_1_lpi_3 & dec_m_output_index_range_1_sva, STD_LOGIC_VECTOR'((fsm_output(40))
      & (fsm_output(56)) & (fsm_output(58)) & (fsm_output(63)) & (fsm_output(65))
      & (fsm_output(72)) & (fsm_output(97)) & (fsm_output(74))));
  z_out_16 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux1h_754_nl) + UNSIGNED'("00000000000000001"),
      17));
  mux_304_nl <= MUX_v_15_2_2(comp_compress_low_1_sva_4 & dec_decompress_low_sva_5,
      fsm_output(74));
  z_out_17 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_304_nl),
      16) + UNSIGNED'("1111111111111111"), 16));
  mux1h_755_nl <= MUX1HOT_v_32_4_2((div_mgc_div_1_z(31 DOWNTO 0)) & (div_mgc_div_z(31
      DOWNTO 0)) & comp_compress_high_1_sva & dec_decompress_high_1_sva, STD_LOGIC_VECTOR'((fsm_output(52))
      & (fsm_output(96)) & (fsm_output(47)) & (fsm_output(74))));
  mux_322_nl <= MUX_v_14_2_2((NOT (comp_compress_low_1_sva_4(14 DOWNTO 1))) & (NOT
      (dec_decompress_low_sva_5(14 DOWNTO 1))), fsm_output(74));
  mux1h_756_nl <= MUX1HOT_v_15_3_2((comp_compress_for_acc_3_itm(15 DOWNTO 1)) & (dec_decompress_for_1_acc_3_itm(15
      DOWNTO 1)) & STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(TO_STDLOGICVECTOR('1') & (mux_322_nl))
      + SIGNED'("000000000000001"), 15)), STD_LOGIC_VECTOR'((fsm_output(52)) & (fsm_output(96))
      & ((fsm_output(47)) OR (fsm_output(74)))));
  mux1h_811_nl <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'((comp_compress_for_acc_3_itm(0))
      & (dec_decompress_for_1_acc_3_itm(0)) & (NOT (comp_compress_low_1_sva_4(0)))
      & (NOT (dec_decompress_low_sva_5(0)))), STD_LOGIC_VECTOR'((fsm_output(52))
      & (fsm_output(96)) & (fsm_output(47)) & (fsm_output(74))));
  z_out_18 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux1h_755_nl) + CONV_UNSIGNED(SIGNED((mux1h_756_nl)
      & TO_STDLOGICVECTOR(mux1h_811_nl)), 32), 32));
  mux_305_nl <= MUX_v_15_2_2(comp_compress_low_1_sva_4 & dec_decompress_low_sva_5,
      fsm_output(95));
  mux_306_nl <= MUX_v_32_2_2((div_mgc_div_z(31 DOWNTO 0)) & (div_mgc_div_1_z(31 DOWNTO
      0)), fsm_output(95));
  z_out_19 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_305_nl),
      32) + UNSIGNED(mux_306_nl), 32));
  mux1h_757_nl <= MUX1HOT_v_8_3_2((z_out_4(8 DOWNTO 1)) & (NOT Comp_rsc_singleport_data_out_mxwt)
      & (NOT Vga_rsc_singleport_data_out_mxwt), STD_LOGIC_VECTOR'((fsm_output(81))
      & (fsm_output(109)) & (fsm_output(121))));
  mux1h_758_nl <= MUX1HOT_v_8_3_2(STD_LOGIC_VECTOR'("01111111") & (NOT trans_ond_moy_slc_Comp_11_cse_sva)
      & (NOT hsplit_y_1_slc_Vga_3_cse_sva), STD_LOGIC_VECTOR'((fsm_output(81)) &
      (fsm_output(109)) & (fsm_output(121))));
  z_out_20 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((mux1h_757_nl)
      & TO_STDLOGICVECTOR((z_out_4(0)) OR (fsm_output(109)) OR (fsm_output(121)))),
      10) + CONV_UNSIGNED(UNSIGNED((mux1h_758_nl) & TO_STDLOGICVECTOR('1')), 10),
      10));
  mux1h_759_nl <= MUX1HOT_v_8_4_2((NOT Comp_rsc_singleport_data_out_mxwt) & Comp_rsc_singleport_data_out_mxwt
      & (NOT Vga_rsc_singleport_data_out_mxwt) & Vga_rsc_singleport_data_out_mxwt,
      STD_LOGIC_VECTOR'((fsm_output(109)) & (fsm_output(111)) & (fsm_output(121))
      & (fsm_output(123))));
  mux_431_nl <= MUX_v_8_2_2(trans_ond_moy_slc_Comp_11_cse_sva & hsplit_y_1_slc_Vga_3_cse_sva,
      or_5976_cse_1);
  z_out_21 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((mux1h_759_nl)
      & TO_STDLOGICVECTOR('1')), 10) + CONV_UNSIGNED(UNSIGNED((mux_431_nl) & TO_STDLOGICVECTOR('1')),
      10), 10));
  mux_432_nl <= MUX_v_8_2_2(Comp_rsc_singleport_data_out_mxwt & Vga_rsc_singleport_data_out_mxwt,
      or_5976_cse_1);
  mux_418_nl <= MUX_v_8_2_2((NOT trans_ond_moy_slc_Comp_11_cse_sva) & (NOT hsplit_y_1_slc_Vga_3_cse_sva),
      or_5976_cse_1);
  z_out_22 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((mux_432_nl)
      & TO_STDLOGICVECTOR('1')), 10) + CONV_UNSIGNED(UNSIGNED((mux_418_nl) & TO_STDLOGICVECTOR('1')),
      10), 10));
  mux1h_763_nl <= MUX1HOT_v_32_7_2((NOT inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_dfm_3)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_himpairs_sva_2) & (NOT comp_compress_pending_bits_1_lpi_2)
      & (NOT z_out) & (NOT inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva_dfm_2) & ((NOT (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(28
      DOWNTO 0))) & TO_STDLOGICVECTOR(NOT inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2)
      & TO_STDLOGICVECTOR(NOT inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva) & TO_STDLOGICVECTOR(NOT
      inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_mdf_sva)) & STD_LOGIC_VECTOR'((NOT
      inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg28_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg27_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg26_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg25_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg24_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg23_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg22_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg21_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg20_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg19_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg18_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg17_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg16_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg15_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_for_1_slc_2_mdf_sva) & (NOT inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_1_mdf_sva)),
      STD_LOGIC_VECTOR'((fsm_output(105)) & (fsm_output(117)) & (fsm_output(54))
      & (fsm_output(61)) & (fsm_output(104)) & (fsm_output(129)) & (fsm_output(130))));
  z_out_23 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(SIGNED(mux1h_763_nl),
      33) + UNSIGNED'("000000000000000000000000000000001"), 33));
  mux_307_nl <= MUX_v_32_2_2((NOT inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_dfm_3) &
      (NOT inv_wave_Mn_Inv_Wave_Fct_wimpairs_sva_2), fsm_output(117));
  z_out_24 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(SIGNED(mux_307_nl), 33)
      + UNSIGNED'("000000000000000000000000000000001"), 33));
  mux1h_764_nl <= MUX1HOT_s_1_5_2(STD_LOGIC_VECTOR'((inv_wave_Inv_Wave_y_sva(7))
      & (inv_wave_Inv_Wave_1_y_sva(7)) & (trans_ond_image_copy_y_1_sva(7)) & (trans_ond_Trans_Ond_x_1_sva(7))
      & (trans_ond_image_copy_2_y_1_sva(7))), STD_LOGIC_VECTOR'((fsm_output(116))
      & (fsm_output(128)) & (fsm_output(7)) & (fsm_output(11)) & (fsm_output(70))));
  mux1h_812_nl <= MUX1HOT_v_7_8_2((inv_wave_Inv_Wave_y_sva(6 DOWNTO 0)) & (inv_wave_Inv_Wave_1_y_sva(6
      DOWNTO 0)) & (trans_ond_image_copy_y_1_sva(6 DOWNTO 0)) & STD_LOGIC_VECTOR'((NOT
      trans_ond_Mn_Trans_Ond_hi_7_sg7_sva) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg6_sva)
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg5_sva) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg4_sva)
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg3_sva) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg2_sva)
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg1_sva)) & (trans_ond_Trans_Ond_x_1_sva(6
      DOWNTO 0)) & (trans_ond_image_copy_2_y_1_sva(6 DOWNTO 0)) & (NOT inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_7)
      & STD_LOGIC_VECTOR'((NOT trans_ond_Mn_Trans_Ond_wi_7_sg8_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg7_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg6_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg5_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg4_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg3_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg2_sva)), STD_LOGIC_VECTOR'((fsm_output(116))
      & (fsm_output(128)) & (fsm_output(7)) & (fsm_output(9)) & (fsm_output(11))
      & (fsm_output(70)) & (fsm_output(103)) & (fsm_output(22))));
  z_out_25 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR((mux1h_764_nl)
      OR (fsm_output(9)) OR (fsm_output(103)) OR (fsm_output(22))) & (mux1h_812_nl))
      + UNSIGNED'("00000001"), 8));
  mux_308_cse <= MUX_v_8_2_2(inv_wave_Inv_Wave_y_sva & inv_wave_Inv_Wave_1_y_sva,
      fsm_output(119));
  z_out_26 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux_308_cse & TO_STDLOGICVECTOR('1'))
      + CONV_UNSIGNED(UNSIGNED(z_out_40(9 DOWNTO 2)), 9), 9));
  z_out_27 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux_308_cse) + CONV_UNSIGNED(UNSIGNED(z_out_8(8
      DOWNTO 2)), 8), 8));
  and_968_cse <= (NOT ModelA_getChar_for_not_sxt) AND (fsm_output(90));
  and_969_cse <= ModelA_getChar_for_not_sxt AND (fsm_output(90));
  mux_312_nl <= MUX_v_32_2_2(z_out_18 & dec_decompress_for_1_range_sva, fsm_output(90));
  mux1h_813_nl <= MUX1HOT_v_32_3_2(ModelA_getProbability_p_high_sva & ModelA_getChar_for_if_p_low_sva
      & ModelA_getChar_for_if_p_low_lpi_1, STD_LOGIC_VECTOR'((NOT (fsm_output(90)))
      & and_968_cse & and_969_cse));
  z_out_28 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(UNSIGNED(mux_312_nl) * UNSIGNED(mux1h_813_nl)),
      64));
  mux1h_765_nl <= MUX1HOT_v_32_4_2(cmodel_cumulative_frequency_rsc_singleport_data_out
      & ModelA_getProbability_p_low_sva & ModelA_getChar_for_slc_2_cse_sva & ModelA_getChar_for_if_p_high_lpi_1,
      STD_LOGIC_VECTOR'((fsm_output(74)) & (fsm_output(47)) & and_968_cse & and_969_cse));
  mux1h_766_nl <= MUX1HOT_v_32_3_2(((dec_decompress_for_1_scaled_value_acc_5_sdt(30
      DOWNTO 0)) & TO_STDLOGICVECTOR(dec_decompress_for_1_scaled_value_acc_4_sdt(0)))
      & z_out_18 & dec_decompress_for_1_range_sva, STD_LOGIC_VECTOR'((fsm_output(74))
      & (fsm_output(47)) & (fsm_output(90))));
  z_out_29 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'(CONV_SIGNED(UNSIGNED(mux1h_765_nl),
      33) * SIGNED(((dec_decompress_for_1_scaled_value_acc_5_sdt(32 DOWNTO 31)) AND
      STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT((fsm_output(47)) OR (fsm_output(90))),
      1),2))) & (mux1h_766_nl))), 66));
  mux1h_767_nl <= MUX1HOT_v_8_3_2(trans_ond_image_copy_y_1_sva & trans_ond_image_copy_2_y_1_sva
      & trans_ond_image_copy_3_y_1_sva, STD_LOGIC_VECTOR'((fsm_output(4)) & (fsm_output(67))
      & (fsm_output(100))));
  z_out_30 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux1h_767_nl),
      9) + CONV_UNSIGNED(UNSIGNED(z_out_8(7 DOWNTO 2)), 9), 9));
  mux1h_769_nl <= MUX1HOT_v_7_3_2(trans_ond_Trans_Ond_y_1_sva & STD_LOGIC_VECTOR'('1'
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg7_sva) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg6_sva)
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg5_sva) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg4_sva)
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg3_sva) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg2_sva))
      & trans_ond_Trans_Ond_1_x_1_sva, STD_LOGIC_VECTOR'((fsm_output(20)) & (fsm_output(21))
      & (fsm_output(23))));
  z_out_31 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux1h_769_nl) + UNSIGNED'("0000001"),
      7));
  mux1h_770_nl <= MUX1HOT_v_8_5_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_33(8
      DOWNTO 2)), 8) + CONV_UNSIGNED(UNSIGNED'(trans_ond_Mn_Trans_Ond_hi_7_sg7_sva
      & trans_ond_Mn_Trans_Ond_hi_7_sg6_sva & trans_ond_Mn_Trans_Ond_hi_7_sg5_sva
      & trans_ond_Mn_Trans_Ond_hi_7_sg4_sva & trans_ond_Mn_Trans_Ond_hi_7_sg3_sva
      & trans_ond_Mn_Trans_Ond_hi_7_sg2_sva & trans_ond_Mn_Trans_Ond_hi_7_sg1_sva),
      8), 8)) & STD_LOGIC_VECTOR'('1' & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg7_sva)
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg6_sva) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg5_sva)
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg4_sva) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg3_sva)
      & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg2_sva) & '1') & STD_LOGIC_VECTOR'("10110101")
      & inv_wave_Inv_Wave_y_sva & inv_wave_Inv_Wave_1_y_sva, STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(32)) & ((fsm_output(40)) OR (fsm_output(74))) & (fsm_output(107))
      & (fsm_output(119))));
  mux1h_771_nl <= MUX1HOT_v_7_6_2(trans_ond_Trans_Ond_y_1_sva & (trans_ond_Trans_Ond_1_y_1_sva_1
      & TO_STDLOGICVECTOR('1')) & (comp_byte_to_encode_1_sva(16 DOWNTO 10)) & (dec_m_output_index_range_1_sva(16
      DOWNTO 10)) & (STD_LOGIC_VECTOR'("000") & z_out_49) & (z_out_33(8 DOWNTO 2)),
      STD_LOGIC_VECTOR'((fsm_output(11)) & (fsm_output(32)) & (fsm_output(40)) &
      (fsm_output(74)) & (fsm_output(107)) & (fsm_output(119))));
  z_out_32 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux1h_770_nl),
      9) + CONV_UNSIGNED(UNSIGNED(mux1h_771_nl), 9), 9));
  mux_314_nl <= MUX_v_8_2_2(z_out_35 & inv_wave_Inv_Wave_1_y_sva, fsm_output(119));
  mux_315_nl <= MUX_v_7_2_2(trans_ond_Trans_Ond_y_1_sva & (STD_LOGIC_VECTOR'("000")
      & z_out_49), fsm_output(119));
  z_out_33 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_314_nl),
      9) + CONV_UNSIGNED(UNSIGNED(mux_315_nl), 9), 9));
  mux1h_772_nl <= MUX1HOT_v_8_3_2((trans_ond_Trans_Ond_y_1_sva & TO_STDLOGICVECTOR('1'))
      & inv_wave_Inv_Wave_y_sva & inv_wave_Inv_Wave_1_y_sva, STD_LOGIC_VECTOR'((fsm_output(11))
      & (fsm_output(107)) & (fsm_output(119))));
  z_out_34 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux1h_772_nl),
      9) + CONV_UNSIGNED(UNSIGNED(z_out_8(8 DOWNTO 2)), 9), 9));
  mux_316_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg7_sva
      & (trans_ond_Trans_Ond_1_y_1_sva(5))), fsm_output(23));
  mux_433_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg6_sva
      & (trans_ond_Trans_Ond_1_y_1_sva(4))), fsm_output(23));
  mux_434_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg5_sva
      & (trans_ond_Trans_Ond_1_y_1_sva(3))), fsm_output(23));
  mux_435_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg4_sva
      & (trans_ond_Trans_Ond_1_y_1_sva(2))), fsm_output(23));
  mux_436_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg3_sva
      & (trans_ond_Trans_Ond_1_y_1_sva(1))), fsm_output(23));
  mux_437_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(trans_ond_Mn_Trans_Ond_hi_7_sg2_sva
      & (trans_ond_Trans_Ond_1_y_1_sva(0))), fsm_output(23));
  mux_317_nl <= MUX_v_2_2_2((trans_ond_Trans_Ond_x_1_sva(7 DOWNTO 6)) & (trans_ond_Trans_Ond_1_x_1_sva(6
      DOWNTO 5)), fsm_output(23));
  z_out_35 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED'((mux_316_nl)
      & (mux_433_nl) & (mux_434_nl) & (mux_435_nl) & (mux_436_nl) & (mux_437_nl)
      & (trans_ond_Mn_Trans_Ond_hi_7_sg1_sva OR (fsm_output(23)))), 8) + CONV_UNSIGNED(UNSIGNED(mux_317_nl),
      8), 8));
  mux_318_nl <= MUX_v_7_2_2(trans_ond_Trans_Ond_y_1_sva & STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR(trans_ond_Mn_Trans_Ond_hi_7_sg7_sva)
      & (passe_y_1_acc_45_itm(7 DOWNTO 3))), 7) + CONV_UNSIGNED(UNSIGNED'(trans_ond_Mn_Trans_Ond_hi_7_sg6_sva
      & trans_ond_Mn_Trans_Ond_hi_7_sg5_sva & trans_ond_Mn_Trans_Ond_hi_7_sg4_sva
      & trans_ond_Mn_Trans_Ond_hi_7_sg3_sva & trans_ond_Mn_Trans_Ond_hi_7_sg2_sva),
      7), 7)), fsm_output(23));
  mux_319_nl <= MUX_v_6_2_2((passe_y_acc_43_sdt_mx0w0(7 DOWNTO 2)) & trans_ond_Trans_Ond_1_y_1_sva,
      fsm_output(23));
  z_out_36 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_318_nl),
      8) + CONV_UNSIGNED(UNSIGNED(mux_319_nl), 8), 8));
  mux_438_nl <= MUX_v_8_2_2(Src_rsc_singleport_data_out_mxwt & Comp_rsc_singleport_data_out_mxwt,
      (fsm_output(25)) OR (fsm_output(27)));
  mux_419_nl <= MUX_v_8_2_2((NOT trans_ond_moy_slc_Src_3_cse_sva) & (NOT trans_ond_moy_slc_Comp_11_cse_sva),
      (fsm_output(27)) OR (fsm_output(25)));
  z_out_37 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR('1')
      & (mux_438_nl) & TO_STDLOGICVECTOR('1')), 11) + CONV_UNSIGNED(UNSIGNED((mux_419_nl)
      & TO_STDLOGICVECTOR('1')), 11), 11));
  mux_439_nl <= MUX_v_8_2_2((z_out_10(7 DOWNTO 0)) & STD_LOGIC_VECTOR'((NOT trans_ond_Mn_Trans_Ond_wi_7_sg8_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg7_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg6_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg5_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg4_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg3_sva) & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg2_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg1_sva)), fsm_output(11));
  mux1h_777_nl <= MUX1HOT_v_8_3_2((NOT trans_ond_sub_2_acc_1_cse_sva) & (NOT trans_ond_sub_8_acc_1_cse_sva)
      & z_out_25, STD_LOGIC_VECTOR'((fsm_output(15)) & (fsm_output(27)) & (fsm_output(11))));
  z_out_38 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR('1')
      & (mux_439_nl) & TO_STDLOGICVECTOR('1')), 11) + CONV_UNSIGNED(UNSIGNED((mux1h_777_nl)
      & TO_STDLOGICVECTOR('1')), 11), 11));
  mux_321_nl <= MUX_v_8_2_2((NOT trans_ond_moy_1_acc_cse_sg1_sva) & (NOT trans_ond_moy_7_acc_cse_sg1_sva),
      fsm_output(27));
  z_out_39 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR('1')
      & (z_out_11(8 DOWNTO 1)) & TO_STDLOGICVECTOR('1')), 11) + CONV_UNSIGNED(UNSIGNED((mux_321_nl)
      & TO_STDLOGICVECTOR('1')), 11), 11));
  mux_440_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((inv_wave_Inv_Wave_y_sva(7)) & (inv_wave_Inv_Wave_1_y_sva(7))),
      fsm_output(119));
  mux1h_778_nl <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'((inv_wave_Inv_Wave_y_sva(6))
      & (inv_wave_Inv_Wave_1_y_sva(6)) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg7_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg8_sva)), STD_LOGIC_VECTOR'((fsm_output(107))
      & (fsm_output(119)) & (fsm_output(20)) & (fsm_output(23))));
  mux1h_814_nl <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'((inv_wave_Inv_Wave_y_sva(5))
      & (inv_wave_Inv_Wave_1_y_sva(5)) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg6_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg7_sva)), STD_LOGIC_VECTOR'((fsm_output(107))
      & (fsm_output(119)) & (fsm_output(20)) & (fsm_output(23))));
  mux1h_815_nl <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'((inv_wave_Inv_Wave_y_sva(4))
      & (inv_wave_Inv_Wave_1_y_sva(4)) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg5_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg6_sva)), STD_LOGIC_VECTOR'((fsm_output(107))
      & (fsm_output(119)) & (fsm_output(20)) & (fsm_output(23))));
  mux1h_816_nl <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'((inv_wave_Inv_Wave_y_sva(3))
      & (inv_wave_Inv_Wave_1_y_sva(3)) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg4_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg5_sva)), STD_LOGIC_VECTOR'((fsm_output(107))
      & (fsm_output(119)) & (fsm_output(20)) & (fsm_output(23))));
  mux1h_817_nl <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'((inv_wave_Inv_Wave_y_sva(2))
      & (inv_wave_Inv_Wave_1_y_sva(2)) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg3_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg4_sva)), STD_LOGIC_VECTOR'((fsm_output(107))
      & (fsm_output(119)) & (fsm_output(20)) & (fsm_output(23))));
  mux1h_818_nl <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'((inv_wave_Inv_Wave_y_sva(1))
      & (inv_wave_Inv_Wave_1_y_sva(1)) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg2_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg3_sva)), STD_LOGIC_VECTOR'((fsm_output(107))
      & (fsm_output(119)) & (fsm_output(20)) & (fsm_output(23))));
  mux1h_819_nl <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'((inv_wave_Inv_Wave_y_sva(0))
      & (inv_wave_Inv_Wave_1_y_sva(0)) & (NOT trans_ond_Mn_Trans_Ond_hi_7_sg1_sva)
      & (NOT trans_ond_Mn_Trans_Ond_wi_7_sg2_sva)), STD_LOGIC_VECTOR'((fsm_output(107))
      & (fsm_output(119)) & (fsm_output(20)) & (fsm_output(23))));
  mux_441_nl <= MUX_v_4_2_2((z_out_31(6 DOWNTO 3)) & (z_out_4(8 DOWNTO 5)), fsm_output(41));
  mux1h_779_nl <= MUX1HOT_v_4_4_2((inv_wave_Inv_Wave_x_sva(8 DOWNTO 5)) & (inv_wave_Inv_Wave_1_x_sva(8
      DOWNTO 5)) & ((z_out_31(2 DOWNTO 0)) & TO_STDLOGICVECTOR('1')) & (z_out_4(4
      DOWNTO 1)), STD_LOGIC_VECTOR'((fsm_output(107)) & (fsm_output(119)) & ((fsm_output(20))
      OR (fsm_output(23))) & (fsm_output(41))));
  z_out_40 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED'(((mux_440_nl)
      OR (fsm_output(20)) OR (fsm_output(23)) OR (fsm_output(41))) & ((mux1h_778_nl)
      AND (NOT (fsm_output(41)))) & ((mux1h_814_nl) OR (fsm_output(41))) & ((mux1h_815_nl)
      OR (fsm_output(41))) & ((mux1h_816_nl) OR (fsm_output(41))) & ((mux1h_817_nl)
      OR (fsm_output(41))) & ((mux1h_818_nl) OR (fsm_output(41))) & ((mux1h_819_nl)
      OR (fsm_output(41))) & '1'), 10) + CONV_UNSIGNED(UNSIGNED(((mux_441_nl) AND
      STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(nor_127_cse, 1),4))) & (mux1h_779_nl)),
      10), 10));
  mux_323_nl <= MUX_v_17_2_2((comp_compress_low_1_sva_1(31 DOWNTO 15)) & (dec_decompress_low_sva_1(31
      DOWNTO 15)), fsm_output(97));
  z_out_42 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_323_nl),
      18) + UNSIGNED'("111111111111111111"), 18));
  mux_324_nl <= MUX_v_17_2_2((comp_compress_high_1_sva_1(31 DOWNTO 15)) & (dec_decompress_high_1_sva_1(31
      DOWNTO 15)), fsm_output(97));
  z_out_43 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_324_nl),
      18) + UNSIGNED'("111111111111111111"), 18));
  mux_325_nl <= MUX_v_18_2_2((dec_decompress_high_1_sva_1(31 DOWNTO 14)) & (comp_compress_high_1_sva_1(31
      DOWNTO 14)), fsm_output(54));
  z_out_44 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_325_nl),
      19) + UNSIGNED'("1111111111111111101"), 19));
  mux1h_780_nl <= MUX1HOT_v_32_3_2(inv_wave_Mn_Inv_Wave_Fct_i_1_sva & (z_out_46 &
      TO_STDLOGICVECTOR('0')) & z_out, STD_LOGIC_VECTOR'((fsm_output(103)) & (fsm_output(135))
      & ((fsm_output(134)) OR (fsm_output(58)) OR (fsm_output(56)) OR (fsm_output(65))
      OR (fsm_output(63)) OR (fsm_output(131)))));
  mux1h_824_nl <= MUX1HOT_v_32_6_2((NOT inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva) &
      (NOT inv_wave_Mn_Inv_Wave_Fct_nbLevels_sva_dfm_2) & ((NOT (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(28
      DOWNTO 0))) & TO_STDLOGICVECTOR(NOT inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2)
      & TO_STDLOGICVECTOR(NOT inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva) & TO_STDLOGICVECTOR(NOT
      inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_mdf_sva)) & STD_LOGIC_VECTOR'((NOT
      inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg28_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg27_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg26_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg25_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg24_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg23_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg22_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg21_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg20_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg19_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg18_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg17_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg16_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg15_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2) & (NOT inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2)
      & (NOT inv_wave_Mn_Inv_Wave_Fct_for_1_slc_2_mdf_sva) & (NOT inv_wave_Mn_Inv_Wave_Fct_for_1_if_2_slc_1_mdf_sva))
      & (NOT comp_compress_pending_bits_1_lpi_2) & (NOT comp_compress_pending_bits_sva),
      STD_LOGIC_VECTOR'(((fsm_output(103)) AND nor_108_m1c) & ((fsm_output(135))
      AND nor_108_m1c) & ((fsm_output(134)) AND nor_108_m1c) & ((fsm_output(131))
      AND nor_108_m1c) & or_dcpl_5934 & or_dcpl_693));
  z_out_45 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(SIGNED((mux1h_780_nl)
      & TO_STDLOGICVECTOR('1')), 34) + CONV_UNSIGNED(SIGNED((mux1h_824_nl) & TO_STDLOGICVECTOR('1')),
      34), 34));
  or_6009_cse <= (NOT((fsm_output(135)) OR (fsm_output(106)) OR (fsm_output(118))
      OR (fsm_output(107)) OR (fsm_output(119)))) OR or_5981_cse;
  mux1h_782_nl <= MUX1HOT_v_29_6_2((inv_wave_Mn_Inv_Wave_Fct_i_2_sg1_sva(30 DOWNTO
      2)) & (z_out(31 DOWNTO 3)) & (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(29
      DOWNTO 1)) & (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(28 DOWNTO 0)) & STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg29_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg28_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg27_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg26_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg25_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg24_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg23_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg22_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg21_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg20_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg19_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg18_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg17_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg16_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg15_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2)
      & STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg28_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg27_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg26_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg25_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg24_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg23_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg22_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg21_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg20_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg19_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg18_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg17_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg16_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg15_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg14_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg13_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg12_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg11_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg10_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg9_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg8_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg7_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg6_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg5_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg4_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg3_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg2_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_sg1_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2), STD_LOGIC_VECTOR'((fsm_output(135))
      & or_5981_cse & (fsm_output(106)) & (fsm_output(118)) & (fsm_output(107)) &
      (fsm_output(119))));
  mux1h_820_nl <= MUX1HOT_s_1_6_2(STD_LOGIC_VECTOR'((inv_wave_Mn_Inv_Wave_Fct_i_2_sg1_sva(1))
      & (z_out(2)) & (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(0)) & inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_wi_sg1_1_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2),
      STD_LOGIC_VECTOR'((fsm_output(135)) & or_5981_cse & (fsm_output(106)) & (fsm_output(118))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_821_nl <= MUX1HOT_s_1_6_2(STD_LOGIC_VECTOR'((inv_wave_Mn_Inv_Wave_Fct_i_2_sg1_sva(0))
      & (z_out(1)) & inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva
      & inv_wave_Mn_Inv_Wave_Fct_wi_1_sva_dfm_2 & inv_wave_Mn_Inv_Wave_Fct_for_1_slc_2_mdf_sva),
      STD_LOGIC_VECTOR'((fsm_output(135)) & or_5981_cse & (fsm_output(106)) & (fsm_output(118))
      & (fsm_output(107)) & (fsm_output(119))));
  mux1h_783_nl <= MUX1HOT_s_1_4_2(STD_LOGIC_VECTOR'(hsplit_x_and_cse_sva_1 & hsplit_x_1_and_cse_sva_1
      & hsplit_y_and_4_cse_sva & hsplit_y_1_and_4_cse_sva), STD_LOGIC_VECTOR'((fsm_output(106))
      & (fsm_output(118)) & (fsm_output(107)) & (fsm_output(119))));
  z_out_46 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED((mux1h_782_nl) & TO_STDLOGICVECTOR(mux1h_820_nl)
      & TO_STDLOGICVECTOR(mux1h_821_nl)) + CONV_UNSIGNED(SIGNED'(or_6009_cse & '0'
      & or_6009_cse & or_6009_cse & or_6009_cse & or_6009_cse & or_6009_cse & or_6009_cse
      & ((mux1h_783_nl) OR (fsm_output(135)) OR or_5981_cse)), 31), 31));
  mux1h_784_nl <= MUX1HOT_v_9_3_2((inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(9 DOWNTO
      1)) & (inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(8 DOWNTO 0)) & (inv_wave_image_copy_x_sva(16
      DOWNTO 8)), STD_LOGIC_VECTOR'((fsm_output(107)) & (fsm_output(119)) & (fsm_output(131))));
  mux1h_827_nl <= MUX1HOT_v_2_3_2((z_out_32(1 DOWNTO 0)) & (z_out_33(1 DOWNTO 0))
      & (inv_wave_image_copy_y_sva(1 DOWNTO 0)), STD_LOGIC_VECTOR'((fsm_output(107))
      & (fsm_output(119)) & (fsm_output(131))));
  mux1h_787_nl <= MUX1HOT_v_9_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(inv_wave_Inv_Wave_y_sva),
      9) + CONV_UNSIGNED(UNSIGNED(z_out_32(8 DOWNTO 2)), 9), 9)) & z_out_32 & (inv_wave_image_copy_y_sva(10
      DOWNTO 2)), STD_LOGIC_VECTOR'((fsm_output(107)) & (fsm_output(119)) & (fsm_output(131))));
  mux1h_786_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(0))
      & inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2 & (inv_wave_image_copy_x_sva(7))),
      STD_LOGIC_VECTOR'((fsm_output(107)) & (fsm_output(119)) & (fsm_output(131))));
  mux1h_785_nl <= MUX1HOT_v_8_3_2((inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(7 DOWNTO
      0)) & ((inv_wave_Mn_Inv_Wave_Fct_hi_sg1_sva_dfm_3(6 DOWNTO 0)) & TO_STDLOGICVECTOR(inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2))
      & (inv_wave_image_copy_y_sva(8 DOWNTO 1)), STD_LOGIC_VECTOR'((fsm_output(107))
      & (fsm_output(119)) & (fsm_output(131))));
  mux1h_825_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva & (inv_wave_image_copy_y_sva(0))),
      STD_LOGIC_VECTOR'((fsm_output(107)) & (fsm_output(119)) & (fsm_output(131))));
  mux1h_826_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'(inv_wave_Mn_Inv_Wave_Fct_hi_1_sva_dfm_2
      & inv_wave_Mn_Inv_Wave_Fct_for_1_slc_1_mdf_sva & (inv_wave_image_copy_x_sva(6))),
      STD_LOGIC_VECTOR'((fsm_output(107)) & (fsm_output(119)) & (fsm_output(131))));
  z_out_48 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED((mux1h_784_nl) & (mux1h_827_nl))
      + UNSIGNED((mux1h_787_nl) & TO_STDLOGICVECTOR(mux1h_786_nl) & TO_STDLOGICVECTOR('0'))
      + UNSIGNED((mux1h_785_nl) & TO_STDLOGICVECTOR(mux1h_825_nl) & TO_STDLOGICVECTOR('0')
      & TO_STDLOGICVECTOR(mux1h_826_nl)), 11));
  mux_327_cse <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(hsplit_x_and_cse_sva & hsplit_x_1_and_cse_sva),
      fsm_output(119));
  mux_326_nl <= MUX_v_3_2_2((inv_wave_Inv_Wave_x_sva(8 DOWNTO 6)) & (inv_wave_Inv_Wave_1_x_sva(8
      DOWNTO 6)), fsm_output(119));
  z_out_49 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_326_nl),
      4) + CONV_UNSIGNED(UNSIGNED'(mux_327_cse & '0' & mux_327_cse), 4), 4));
  mux1h_788_nl <= MUX1HOT_v_22_5_2((comp_m_output_index_range_lpi_2(31 DOWNTO 10))
      & (comp_m_output_index_range_lpi_dfm_3(31 DOWNTO 10)) & (comp_m_output_index_range_lpi_dfm_1(31
      DOWNTO 10)) & (comp_m_output_index_range_lpi_2_dfm_1(31 DOWNTO 10)) & (comp_m_output_index_range_lpi_2_dfm_3(31
      DOWNTO 10)), STD_LOGIC_VECTOR'(or_dcpl_3251 & (fsm_output(65)) & (fsm_output(63))
      & (fsm_output(56)) & (fsm_output(58))));
  z_out_50 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux1h_788_nl),
      23) + UNSIGNED'("11111111111111110110101"), 23));
  mux_443_nl <= MUX_v_4_2_2((z_out_25(7 DOWNTO 4)) & (trans_ond_image_copy_3_y_1_sva_1(7
      DOWNTO 4)), fsm_output(103));
  z_out_51 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR('1') & (mux_443_nl))
      + UNSIGNED'("00001"), 5));
  mux_329_nl <= MUX_v_8_2_2(inv_wave_Inv_Wave_y_sva & inv_wave_Inv_Wave_1_y_sva,
      fsm_output(118));
  z_out_52 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(SIGNED((NOT z_out_46)
      & TO_STDLOGICVECTOR('1')), 33) + CONV_UNSIGNED(UNSIGNED((mux_329_nl) & TO_STDLOGICVECTOR('1')),
      33), 33));
  mux_331_nl <= MUX_v_9_2_2(inv_wave_Inv_Wave_x_sva & inv_wave_Inv_Wave_1_x_sva,
      fsm_output(119));
  z_out_53 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(SIGNED((NOT z_out_46)
      & TO_STDLOGICVECTOR('1')), 33) + CONV_UNSIGNED(UNSIGNED((mux_331_nl) & TO_STDLOGICVECTOR('1')),
      33), 33));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    Main_Comp_Decomp_Tot_Main_Fonction
--  Generated from file(s):
--   16) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Main_Comp_Decomp_Tot.cpp
--    9) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_tot/model.h
--   12) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_tot/model.cpp
--    5) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Compressor.cpp
--   14) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Decompressor.cpp
--   11) $PROJECT_HOME/../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Exchange.cpp
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps.ALL;
USE work.singleport_ram_be_pkg.ALL;
USE work.Main_Comp_Decomp_Tot_Main_Fonction_mux_pkg.ALL;


ENTITY Main_Comp_Decomp_Tot_Main_Fonction IS
  PORT(
    start : IN STD_LOGIC;
    done : OUT STD_LOGIC;
    nblevels_rsc_z : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_z : OUT STD_LOGIC_VECTOR (31 DOWNTO
        0);
    nblevels_triosy_lz : OUT STD_LOGIC;
    Src_triosy_lz : OUT STD_LOGIC;
    Comp_triosy_lz : OUT STD_LOGIC;
    Vga_triosy_lz : OUT STD_LOGIC;
    Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_lz : OUT STD_LOGIC;
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
END Main_Comp_Decomp_Tot_Main_Fonction;

ARCHITECTURE v1 OF Main_Comp_Decomp_Tot_Main_Fonction IS
  -- Default Constants
  SIGNAL PWR : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL core_wen : STD_LOGIC;
  SIGNAL Src_rsc_singleport_data_in_core : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Src_rsc_singleport_addr_core : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Src_rsc_singleport_re_core_sct : STD_LOGIC;
  SIGNAL Src_rsc_singleport_we_core_sct : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_data_in_core : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Comp_rsc_singleport_addr_core : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Comp_rsc_singleport_re_core_sct : STD_LOGIC;
  SIGNAL Comp_rsc_singleport_we_core_sct : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_data_in_core : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Vga_rsc_singleport_addr_core : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Vga_rsc_singleport_re_core_sct : STD_LOGIC;
  SIGNAL Vga_rsc_singleport_we_core_sct : STD_LOGIC;
  SIGNAL nblevels_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL cmodel_cumulative_frequency_rsc_singleport_data_in : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL cmodel_cumulative_frequency_rsc_singleport_addr : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL cmodel_cumulative_frequency_rsc_singleport_re : STD_LOGIC;
  SIGNAL cmodel_cumulative_frequency_rsc_singleport_we : STD_LOGIC;
  SIGNAL cmodel_cumulative_frequency_rsc_singleport_data_out : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL mgc_start_sync_mgc_bsync_vld_vd : STD_LOGIC;
  SIGNAL mgc_done_sync_mgc_bsync_rdy_rd_core_sct : STD_LOGIC;
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct
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

  SIGNAL nblevels_rsc_mgc_in_wire_d_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL nblevels_rsc_mgc_in_wire_z : STD_LOGIC_VECTOR (3 DOWNTO 0);

  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d_1 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_z : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

  SIGNAL cmodel_cumulative_frequency_rsc_singleport_data_in_1 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL cmodel_cumulative_frequency_rsc_singleport_addr_1 : STD_LOGIC_VECTOR (8
      DOWNTO 0);
  SIGNAL cmodel_cumulative_frequency_rsc_singleport_re_1 : STD_LOGIC_VECTOR (0 DOWNTO
      0);
  SIGNAL cmodel_cumulative_frequency_rsc_singleport_we_1 : STD_LOGIC_VECTOR (0 DOWNTO
      0);
  SIGNAL cmodel_cumulative_frequency_rsc_singleport_data_out_1 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL cmodel_cumulative_frequency_rsc_singleport_en : STD_LOGIC;

  SIGNAL div_mgc_div_a_1 : STD_LOGIC_VECTOR (66 DOWNTO 0);
  SIGNAL div_mgc_div_b_1 : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL div_mgc_div_z_1 : STD_LOGIC_VECTOR (66 DOWNTO 0);

  SIGNAL div_mgc_div_1_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL div_mgc_div_1_b_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL div_mgc_div_1_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT Main_Comp_Decomp_Tot_Main_Fonction_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      Src_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      Comp_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      Vga_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      core_wen : OUT STD_LOGIC;
      Src_rsc_singleport_data_in_core : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      Src_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
      Src_rsc_singleport_re_core_sct : OUT STD_LOGIC;
      Src_rsc_singleport_we_core_sct : OUT STD_LOGIC;
      Comp_rsc_singleport_data_in_core : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      Comp_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
      Comp_rsc_singleport_re_core_sct : OUT STD_LOGIC;
      Comp_rsc_singleport_we_core_sct : OUT STD_LOGIC;
      Vga_rsc_singleport_data_in_core : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      Vga_rsc_singleport_addr_core : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
      Vga_rsc_singleport_re_core_sct : OUT STD_LOGIC;
      Vga_rsc_singleport_we_core_sct : OUT STD_LOGIC;
      nblevels_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d : OUT STD_LOGIC_VECTOR
          (31 DOWNTO 0);
      cmodel_cumulative_frequency_rsc_singleport_data_in : OUT STD_LOGIC_VECTOR (31
          DOWNTO 0);
      cmodel_cumulative_frequency_rsc_singleport_addr : OUT STD_LOGIC_VECTOR (8 DOWNTO
          0);
      cmodel_cumulative_frequency_rsc_singleport_re : OUT STD_LOGIC;
      cmodel_cumulative_frequency_rsc_singleport_we : OUT STD_LOGIC;
      cmodel_cumulative_frequency_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (31
          DOWNTO 0);
      mgc_start_sync_mgc_bsync_vld_vd : IN STD_LOGIC;
      mgc_done_sync_mgc_bsync_rdy_rd_core_sct : OUT STD_LOGIC;
      Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct :
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
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Src_rsc_singleport_data_out
      : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Comp_rsc_singleport_data_out
      : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Vga_rsc_singleport_data_out
      : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Src_rsc_singleport_data_in_core
      : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Src_rsc_singleport_addr_core
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Comp_rsc_singleport_data_in_core
      : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Comp_rsc_singleport_addr_core
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Vga_rsc_singleport_data_in_core
      : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Vga_rsc_singleport_addr_core
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_nblevels_rsc_mgc_in_wire_d
      : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_cmodel_cumulative_frequency_rsc_singleport_data_in
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_cmodel_cumulative_frequency_rsc_singleport_addr
      : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_cmodel_cumulative_frequency_rsc_singleport_data_out
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_a : STD_LOGIC_VECTOR
      (66 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_b : STD_LOGIC_VECTOR
      (32 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_z : STD_LOGIC_VECTOR
      (66 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_1_a : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_1_b : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_1_z : STD_LOGIC_VECTOR
      (63 DOWNTO 0);

BEGIN
  -- Default Constant Signal Assignments
  PWR <= '1';

  nblevels_rsc_mgc_in_wire : work.mgc_ioport_comps.mgc_in_wire
    GENERIC MAP(
      rscid => 4,
      width => 4
      )
    PORT MAP(
      d => nblevels_rsc_mgc_in_wire_d_1,
      z => nblevels_rsc_mgc_in_wire_z
    );
  nblevels_rsc_mgc_in_wire_d <= nblevels_rsc_mgc_in_wire_d_1;
  nblevels_rsc_mgc_in_wire_z <= nblevels_rsc_z;

  Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg : work.mgc_ioport_comps.mgc_out_stdreg
    GENERIC MAP(
      rscid => 5,
      width => 32
      )
    PORT MAP(
      d => Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d_1,
      z => Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_z
    );
  Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d_1 <= Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d;
  Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_z <= Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_z;

  cmodel_cumulative_frequency_rsc_singleport : work.singleport_ram_be_pkg.singleport_ram_be
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
      data_in => cmodel_cumulative_frequency_rsc_singleport_data_in_1,
      addr => cmodel_cumulative_frequency_rsc_singleport_addr_1,
      re => cmodel_cumulative_frequency_rsc_singleport_re_1,
      we => cmodel_cumulative_frequency_rsc_singleport_we_1,
      data_out => cmodel_cumulative_frequency_rsc_singleport_data_out_1,
      clk => clk,
      a_rst => PWR,
      s_rst => rst,
      en => cmodel_cumulative_frequency_rsc_singleport_en
    );
  cmodel_cumulative_frequency_rsc_singleport_data_in_1 <= cmodel_cumulative_frequency_rsc_singleport_data_in;
  cmodel_cumulative_frequency_rsc_singleport_addr_1 <= cmodel_cumulative_frequency_rsc_singleport_addr;
  cmodel_cumulative_frequency_rsc_singleport_re_1(0) <= cmodel_cumulative_frequency_rsc_singleport_re;
  cmodel_cumulative_frequency_rsc_singleport_we_1(0) <= cmodel_cumulative_frequency_rsc_singleport_we;
  cmodel_cumulative_frequency_rsc_singleport_data_out <= cmodel_cumulative_frequency_rsc_singleport_data_out_1;
  cmodel_cumulative_frequency_rsc_singleport_en <= NOT core_wen;

  mgc_start_sync_mgc_bsync_vld : work.mgc_ioport_comps.mgc_bsync_vld
    GENERIC MAP(
      rscid => 8,
      ready => 0,
      valid => 1
      )
    PORT MAP(
      vd => mgc_start_sync_mgc_bsync_vld_vd,
      vz => start
    );
  mgc_done_sync_mgc_bsync_rdy : work.mgc_ioport_comps.mgc_bsync_rdy
    GENERIC MAP(
      rscid => 9,
      ready => 1,
      valid => 0
      )
    PORT MAP(
      rd => mgc_done_sync_mgc_bsync_rdy_rd_core_sct,
      rz => done
    );
  Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync : work.mgc_ioport_comps.mgc_io_sync
    PORT MAP(
      ld => Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct,
      lz => Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_lz
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

  Main_Comp_Decomp_Tot_Main_Fonction_core_inst : Main_Comp_Decomp_Tot_Main_Fonction_core
    PORT MAP(
      clk => clk,
      rst => rst,
      Src_rsc_singleport_data_out => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Src_rsc_singleport_data_out,
      Comp_rsc_singleport_data_out => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Comp_rsc_singleport_data_out,
      Vga_rsc_singleport_data_out => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Vga_rsc_singleport_data_out,
      core_wen => core_wen,
      Src_rsc_singleport_data_in_core => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Src_rsc_singleport_data_in_core,
      Src_rsc_singleport_addr_core => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Src_rsc_singleport_addr_core,
      Src_rsc_singleport_re_core_sct => Src_rsc_singleport_re_core_sct,
      Src_rsc_singleport_we_core_sct => Src_rsc_singleport_we_core_sct,
      Comp_rsc_singleport_data_in_core => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Comp_rsc_singleport_data_in_core,
      Comp_rsc_singleport_addr_core => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Comp_rsc_singleport_addr_core,
      Comp_rsc_singleport_re_core_sct => Comp_rsc_singleport_re_core_sct,
      Comp_rsc_singleport_we_core_sct => Comp_rsc_singleport_we_core_sct,
      Vga_rsc_singleport_data_in_core => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Vga_rsc_singleport_data_in_core,
      Vga_rsc_singleport_addr_core => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Vga_rsc_singleport_addr_core,
      Vga_rsc_singleport_re_core_sct => Vga_rsc_singleport_re_core_sct,
      Vga_rsc_singleport_we_core_sct => Vga_rsc_singleport_we_core_sct,
      nblevels_rsc_mgc_in_wire_d => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_nblevels_rsc_mgc_in_wire_d,
      Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d,
      cmodel_cumulative_frequency_rsc_singleport_data_in => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_cmodel_cumulative_frequency_rsc_singleport_data_in,
      cmodel_cumulative_frequency_rsc_singleport_addr => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_cmodel_cumulative_frequency_rsc_singleport_addr,
      cmodel_cumulative_frequency_rsc_singleport_re => cmodel_cumulative_frequency_rsc_singleport_re,
      cmodel_cumulative_frequency_rsc_singleport_we => cmodel_cumulative_frequency_rsc_singleport_we,
      cmodel_cumulative_frequency_rsc_singleport_data_out => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_cmodel_cumulative_frequency_rsc_singleport_data_out,
      mgc_start_sync_mgc_bsync_vld_vd => mgc_start_sync_mgc_bsync_vld_vd,
      mgc_done_sync_mgc_bsync_rdy_rd_core_sct => mgc_done_sync_mgc_bsync_rdy_rd_core_sct,
      Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct =>
          Main_Comp_Decomp_Tot_Main_Fonction_return_triosy_mgc_io_sync_ld_core_sct,
      Vga_triosy_mgc_io_sync_ld_core_sct => Vga_triosy_mgc_io_sync_ld_core_sct,
      Comp_triosy_mgc_io_sync_ld_core_sct => Comp_triosy_mgc_io_sync_ld_core_sct,
      Src_triosy_mgc_io_sync_ld_core_sct => Src_triosy_mgc_io_sync_ld_core_sct,
      nblevels_triosy_mgc_io_sync_ld_core_sct => nblevels_triosy_mgc_io_sync_ld_core_sct,
      div_mgc_div_a => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_a,
      div_mgc_div_b => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_b,
      div_mgc_div_z => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_z,
      div_mgc_div_1_a => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_1_a,
      div_mgc_div_1_b => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_1_b,
      div_mgc_div_1_z => Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_1_z
    );
  Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Src_rsc_singleport_data_out <= Src_rsc_singleport_data_out;
  Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Comp_rsc_singleport_data_out <= Comp_rsc_singleport_data_out;
  Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Vga_rsc_singleport_data_out <= Vga_rsc_singleport_data_out;
  Src_rsc_singleport_data_in_core <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Src_rsc_singleport_data_in_core;
  Src_rsc_singleport_addr_core <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Src_rsc_singleport_addr_core;
  Comp_rsc_singleport_data_in_core <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Comp_rsc_singleport_data_in_core;
  Comp_rsc_singleport_addr_core <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Comp_rsc_singleport_addr_core;
  Vga_rsc_singleport_data_in_core <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Vga_rsc_singleport_data_in_core;
  Vga_rsc_singleport_addr_core <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Vga_rsc_singleport_addr_core;
  Main_Comp_Decomp_Tot_Main_Fonction_core_inst_nblevels_rsc_mgc_in_wire_d <= nblevels_rsc_mgc_in_wire_d;
  Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_Main_Comp_Decomp_Tot_Main_Fonction_return_rsc_mgc_out_stdreg_d;
  cmodel_cumulative_frequency_rsc_singleport_data_in <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_cmodel_cumulative_frequency_rsc_singleport_data_in;
  cmodel_cumulative_frequency_rsc_singleport_addr <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_cmodel_cumulative_frequency_rsc_singleport_addr;
  Main_Comp_Decomp_Tot_Main_Fonction_core_inst_cmodel_cumulative_frequency_rsc_singleport_data_out
      <= cmodel_cumulative_frequency_rsc_singleport_data_out;
  div_mgc_div_a <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_a;
  div_mgc_div_b <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_b;
  Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_z <= div_mgc_div_z;
  div_mgc_div_1_a <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_1_a;
  div_mgc_div_1_b <= Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_1_b;
  Main_Comp_Decomp_Tot_Main_Fonction_core_inst_div_mgc_div_1_z <= div_mgc_div_1_z;

  Src_rsc_singleport_data_in <= Src_rsc_singleport_data_in_core;
  Src_rsc_singleport_addr <= Src_rsc_singleport_addr_core;
  Src_rsc_singleport_re <= NOT Src_rsc_singleport_re_core_sct;
  Src_rsc_singleport_we <= NOT Src_rsc_singleport_we_core_sct;
  Comp_rsc_singleport_data_in <= Comp_rsc_singleport_data_in_core;
  Comp_rsc_singleport_addr <= Comp_rsc_singleport_addr_core;
  Comp_rsc_singleport_re <= NOT Comp_rsc_singleport_re_core_sct;
  Comp_rsc_singleport_we <= NOT Comp_rsc_singleport_we_core_sct;
  Vga_rsc_singleport_data_in <= Vga_rsc_singleport_data_in_core;
  Vga_rsc_singleport_addr <= Vga_rsc_singleport_addr_core;
  Vga_rsc_singleport_re <= NOT Vga_rsc_singleport_re_core_sct;
  Vga_rsc_singleport_we <= NOT Vga_rsc_singleport_we_core_sct;
END v1;



