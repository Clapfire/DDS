----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2018 09:23:36 AM
-- Design Name: 
-- Module Name: Logic_tb - Behavioral
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

entity Logic_tb is
end Logic_tb;

architecture Behavioral of Logic_tb is

component Logic
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Andout : out STD_LOGIC_VECTOR (7 downto 0);
           Orout : out STD_LOGIC_VECTOR (7 downto 0);
           InvA : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal A : std_logic_vector(7 downto 0) := (others => '0');
signal B : std_logic_vector(7 downto 0) := (others => '0');
signal Andout : std_logic_vector(7 downto 0) := (others => '0');
signal Orout : std_logic_vector(7 downto 0) := (others => '0');
signal InvA : std_logic_vector(7 downto 0) := (others => '0');

begin

UUT: Logic PORT MAP (A => A,
                    B => B,
                    Andout => Andout,
                    Orout => Orout,
                    InvA => InvA);

stim_proc: process
    begin
        wait for 10 ns;
        A <= "00001111";
        B <= "01010101";
        wait for 10 ns;
        
        A <= "11111111";
        B <= "00000000";
        wait for 10 ns;
        
        A <= "11110000";
        B <= "00001111";
        wait for 10 ns;
        
                     
    end process;

end Behavioral;
