----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2018 09:15:08 AM
-- Design Name: 
-- Module Name: adder_tb - Behavioral
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

entity adder_tb is
--  Port ( );
end adder_tb;

architecture Behavioral of adder_tb is
component adder8
Port (     A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Sum : out STD_LOGIC_VECTOR (7 downto 0);
           Carryin : in STD_LOGIC;
           Carryout : out STD_LOGIC);
end component;

signal a : std_logic_vector(7 downto 0) :=(others => '0');
signal b : std_logic_vector(7 downto 0) :=(others => '0');
signal carryin : std_logic := '0';

signal carryout : std_logic;
signal sum : std_logic_vector(7 downto 0);           
begin
uut : adder8 port map(
a => a, b => b, carryin => carryin, carryout => carryout, sum => sum);

stim_proc: process
begin
    wait for 100 ns;
    
    a <= "10101010";
    b <= "01010101";
    carryin <= '0';
    wait for 100 ns; 
    
    a <= "10101010";
    b <= "01010101";
    carryin <= '1';
    wait for 100 ns; 
        
    a <= "00001111";
    b <= "11111111";
    carryin <= '0';
    wait for 100 ns; 
end process;
end Behavioral;
