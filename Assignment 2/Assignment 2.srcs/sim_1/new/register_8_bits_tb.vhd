----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2018 12:22:19 PM
-- Design Name: 
-- Module Name: register_8_bits_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_8_bits_tb is
--  Port ( );
end register_8_bits_tb;

architecture Behavioral of register_8_bits_tb is
component register_8_bits
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC);
end component;
    signal input : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal output : STD_LOGIC_VECTOR (7 downto 0);
    signal clk :  STD_LOGIC;
    constant clk_period : time := 20 ns;
    signal en : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
begin
uut : register_8_bits port map(
input => input, output => output, en => en, rst => rst, clk => clk );

clk_process :process 
begin 
    clk <= '0'; 
    wait for clk_period/2; 
    clk <= '1'; 
    wait for clk_period/2;
end process;

stim_process : process
begin
    wait for 100ns;
    wait for clk_period*10;
    
    input <= "10101010";
    wait for clk_period*3;
    
    en <= '1';
    wait for clk_period*3;
    
    en <= '0';
    rst <= '1';
    wait for clk_period*3;
end process;
end Behavioral;
