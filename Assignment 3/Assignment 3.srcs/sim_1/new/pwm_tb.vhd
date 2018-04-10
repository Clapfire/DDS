----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 11:02:59 AM
-- Design Name: 
-- Module Name: pwm_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_tb is
--  Port ( );
end pwm_tb;

architecture Behavioral of pwm_tb is
    component pwm
        Port ( clk : in STD_LOGIC;
               input : in unsigned (7 downto 0);
               counter_debug : out unsigned(7 downto 0);
               output : out STD_LOGIC);
    end component;
    
    signal clk : std_logic := '0';
    signal input : unsigned (7 downto 0);
    signal output : std_logic;
    signal counter_debug : unsigned(7 downto 0); 
    
    constant clk_period : time := 10 ns;
begin
    uut : pwm port map(clk => clk, input => input, output => output, counter_debug => counter_debug);
    
    clk_process :process 
    begin 
        clk <= '0'; 
        wait for clk_period/2; 
        clk <= '1'; 
        wait for clk_period/2;
    end process;
    
    stim_proc : process
    begin
        wait for 100 ns;
        input <= "01010101";
    end process;
end Behavioral;
