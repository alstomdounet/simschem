--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:13:23 10/25/2016
-- Design Name:   
-- Module Name:   C:/FPGA/simschem/tb_basic.vhd
-- Project Name:  SimSchem
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cmp_generator
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_basic IS
END tb_basic;
 
ARCHITECTURE behavior OF tb_basic IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cmp_generator
    PORT(
         X1 : INOUT  std_logic;
         X2 : INOUT  std_logic;
         state : OUT  std_logic
        );
    END COMPONENT;
    

	--BiDirs
   signal X1 : std_logic;
   signal X2 : std_logic;

 	--Outputs
   signal state : std_logic;
   -- appropriate port name 
 
   constant X1_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cmp_generator PORT MAP (
          X1 => X1,
          X2 => X2,
          state => state
        );

   -- Clock process definitions
   X1_process :process
   begin
		X1 <= '0';
		wait for X1_period/2;
		X1 <= '1';
		wait for X1_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for X1_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
