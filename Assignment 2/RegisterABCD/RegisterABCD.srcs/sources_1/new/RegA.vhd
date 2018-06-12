----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2018 09:00:06 AM
-- Design Name: 
-- Module Name: RegC - Behavioral
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

entity RegA is
Port ( 
    Clk:            in  std_logic;
    rst:            in  std_logic;
    input:         in  std_logic_vector (7 downto 0);
    LoadA:          in  std_logic;
    RegOutA:        out std_logic_vector (7 downto 0)
);
end RegA;

architecture Behavioral of RegA is

signal RegA: std_logic_vector (7 downto 0);


begin

Reg_process: process (clk)
begin
    if (rising_edge(clk)) then
        if (loada = '1') then
            RegA <= input;
        end if; --loadA    
    end if; --clk
end process; -- reg_process

RegOutA <= regA;


end Behavioral;
