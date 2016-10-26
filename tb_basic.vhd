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
	signal A : std_logic;
	signal B : std_logic;
	signal C : std_logic;
	signal switch_state : std_logic;

	--Outputs
	signal state : std_logic;

	-- appropriate port name 
	constant switch_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut1: cmp_generator PORT MAP (
          A => X1,
          B => X2,
          state => state
        );
		  
   uut2: cmp_generator PORT MAP (
          C => X1,
          A => X2,
          state => state
        );
		  
	switch1 : entity work.cmp_switch PORT MAP (
          B => X1,
          C => X2,
          switch_state => state
        );
	

   -- Clock process definitions
   X1_process :process
   begin
		switch_state <= '0';
		wait for switch_period/2;
		switch_state <= '1';
		wait for switch_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for switch_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
