----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2018 11:34:11 AM
-- Design Name: 
-- Module Name: ArrSwitch - Behavioral
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

entity ArrSwitch is
    Port ( sw4 : in STD_LOGIC;
           sw5 : in STD_LOGIC;
           sw6 : in STD_LOGIC;
           sw7 : in STD_LOGIC;
           switches : out STD_LOGIC_VECTOR (3 downto 0));
end ArrSwitch;

architecture Behavioral of ArrSwitch is

begin
process (sw4, sw5, sw6, sw7)
begin
    --if(rising_edge(clk)) then
        if (sw4 = '1') then switches <= "0001"; --1
        elsif (sw5 = '1') then switches <= "0011"; --3
            elsif (sw6 = '1')then switches <= "0111"; --7
                elsif (sw7 = '1') then switches <= "1111"; --15
                    else switches <= "0000";
        end if;
    --end if;
end process;
       
end Behavioral;
