----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2018 08:33:22 AM
-- Design Name: 
-- Module Name: upDownCounter - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity upDownCounter is
    Port ( up : in STD_LOGIC;
           en : in STD_LOGIC;
           cOut : out STD_LOGIC_VECTOR (7 downto 0);
           rst : in STD_LOGIC;
           clk : in STD_LOGIC);
end upDownCounter;

architecture Behavioral of upDownCounter is

signal intCount : std_logic_vector(7 downto 0); --internal counter

begin

COUNTER: process (clk)
begin
    if (rising_edge(clk)) then
        if (en = '1') then
            if (rst = '1') then
                intCount <= "00000000";
            else
                if (up = '1') then
                    intCount <= intCount+1;
                else
                    intCount <= intCount-1;
                end if;
            end if;
            cOut <= intCount;
        end if;
     end if;
end process;
end Behavioral;
