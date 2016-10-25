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
--
-- Dependencies: 
--
-- Revision: See configuration management
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity cmp_switch is
    Port ( X1 : inout  STD_LOGIC;
           X2 : inout  STD_LOGIC;
           state : in  STD_LOGIC);
end cmp_switch;

architecture Behavioral of cmp_switch is

begin
	X1 <= X2 when state = '1' else (others => 'Z'); -- code taken from http://www.edaboard.com/thread55243.html

end Behavioral;

