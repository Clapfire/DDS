----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 08:49:53 PM
-- Design Name: 
-- Module Name: Alu8_tb - Behavioral
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

entity Alu8_tb is
end Alu8_tb;

architecture Behavioral of Alu8_tb is

component Alu8
PORT(
    Ain : IN std_logic_vector(7 downto 0);
    Bin : IN std_logic_vector(7 downto 0);
    carryIn : IN std_logic;
    carryOut : OUT std_logic;
    AluOut : OUT std_logic_vector(7 downto 0);
    Select_1 : IN STD_LOGIC_VECTOR (1 downto 0)
    );
end component;

signal Ain : std_logic_vector(7 downto 0) := (others => '0');
signal Bin : std_logic_vector(7 downto 0) := (others => '0');
signal carryIn : std_logic := '0';
signal carryOut : std_logic := '0';
signal aluOut : std_logic_vector(7 downto 0) := (others => '0');
signal Select_1 : std_logic_vector(1 downto 0) := (others => '0');

begin

UUT: alu8 PORT MAP (Ain => Ain,
                    Bin => Bin,
                    carryIn => carryIn,
                    carryOut => carryOut,
                    aluOut => aluOut,
                    Select_1 => Select_1);
                    
stim_proc: process
    begin
        wait for 10 ns;
        Ain <= "00010011";
        Bin <= "11101100";
        carryin <= '1';
        wait for 100 ns;
        
        Select_1 <= "01";
        wait for 100 ns;
        
        Select_1 <= "10";
        wait for 100 ns;
        
        Select_1 <= "11";
        wait for 100 ns;
        
                     
    end process;

end Behavioral;
