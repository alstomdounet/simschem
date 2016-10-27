----------------------------------------------------------------------------------
-- Company: Private
-- Engineer: Guillaume MANCIET
-- 
-- Create Date: See configuration management
-- Design Name: 
-- Module Name: cmp_switch - Behavioral
-- Project Name: SimSchem
-- Target Devices: 
-- Tool versions: Used with Xilinx ISE 14.7
-- Description: 
-- Code below is inspired by VHDL-AMS/switch.vhd
--
-- Dependencies: 
--
-- Revision: See configuration management
--
----------------------------------------------------------------------------------
-- http://rouillard.org/ecrire-vhdl-et-ams.pdf

library ieee;
use ieee.std_logic_1164.all; 

entity switch is
port (X1, X2: inout std_logic; state: std_logic); 
end entity switch;

architecture arch of switch is
begin 
  process
	 impure function passant return boolean is  
	 -- Une fonction pour factoriser la condition “transistor passant” 
	begin 
	   return (state ='1');  
	end; 
	variable lasttime:time:=-1 ns; 
  begin
	X1 <='Z'; -- on libère X1 et X2 "de l'intérieur" 
	X2 <='Z';  -- pour connaître les contributions extérieures 
	
	wait for 0 ns;
	-- wait pour que X1 et X2 contiennent 
	-- les valeurs "extérieures" 
	
	if (state ='1') then  
		-- ici le switch est passant, il faut propager 
		X1 <= X2; -- deux affectations croisées qui prendront  
		X2 <= X1; -- effet simultanément sur le wait suivant 
				   -- (et pas avant, ce sont des signaux) 
	end if; 
	lasttime:=now; 
	wait on X1 'transaction, X2 'transaction, state
			until now/=lasttime or (passant and (X1 /= X2));
  end process; 
end; 
