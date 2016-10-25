----------------------------------------------------------------------------------
-- Company: Private
-- Engineer: Guillaume MANCIET
-- 
-- Create Date: See configuration management
-- Design Name: 
-- Module Name: cmp_generator - Behavioral
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

entity cmp_generator is
    Port ( X1 : inout  STD_LOGIC;
           X2 : inout  STD_LOGIC;
           state : out  STD_LOGIC);
end cmp_generator;

architecture Behavioral of cmp_generator is

begin
	X2 <= '1';
	X1 <= '0';
	state <= X1 or X2;
end Behavioral;

