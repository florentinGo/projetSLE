-------------------------------------------------------------------------------
-- packageVGA.vhd		Bibliothèque VGA
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package packageVGA is

constant HM: integer := 799;		-- Taille max horizontale
constant HD: integer := 640;		-- Taille image horizontale
constant HF: integer := 16;		-- Front porch horizontal
constant HB: integer := 48;		-- Back porch horizontal
constant HP: integer := 96;		-- Pulse horizontal
constant VM: integer := 523;		-- Taille max verticale
constant VD: integer := 480;		-- Taille image verticale
constant VF: integer := 11;		-- Front porch vertical
constant VB: integer := 31;		-- Back porch vertical
constant VP: integer := 2;			-- Pulse vertical

type coordonnee is
record
x : STD_LOGIC_VECTOR (9 downto 0);
y : STD_LOGIC_VECTOR (8 downto 0);
end record;

-- purpose: map addr
function map_addr (
	addrX : std_logic_vector(8 downto 0);
	addrY : std_logic_vector(7 downto 0) )
	return std_logic_vector is

	variable x,y      : integer range 0 to 1024;
	variable addr_res : integer range 0 to 2**17-1;
	variable res      : std_logic_vector(16 downto 0); 

	begin  -- map_addr
	-- recupere les coord
	x        := to_integer(unsigned(addrX));
	y        := to_integer(unsigned(addrY));
	addr_res := x+320*y;
	res      := std_logic_vector(to_unsigned(addr_res,17));
	return res;
end map_addr;

-- purpose : RGB2LUM
-- NB : Seuls les 7 bits de poids faibles sont significatifs
--function rgb2lum (
--	data_rgb : std_logic_vector(15 downto 0))
--	return std_logic_vector is

--	variable res : std_logic_vector(7 downto 0);

--	begin

--	res :=	(("000" & data_rgb(15 downto 11))	-- red
--		+ data_rgb(10 downto 5)		-- green
--		+ data_rgb(4 downto 0));		-- blue
		
--	return res;
--end rgb2lum;

-- purpose: LUM2RGB and saturation
function saturate (
	data_source : std_logic_vector(7 downto 0);
	saturate : std_logic)
	return std_logic_vector is

	variable res      : std_logic_vector(15 downto 0); 

	begin  -- saturate
	
	if saturate = '1' then --res := data_source(4 downto 0) & 
					 --data_source(4 downto 0) & data_source(0) & 
					 --data_source(4 downto 0);

		res := data_source(7 downto 3) & data_source(7 downto 3) & data_source(7) & data_source(7 downto 3);
		
	else --res :=	data_source(6 downto 2) &
			--data_source(6 downto 1) &
			--data_source(6 downto 2);

	       res := 	data_source(4 downto 0) & 
		      	data_source(4 downto 0) & data_source(0) & 
			data_source(4 downto 0);
	end if;

	return res;
end saturate;


end packageVGA;
