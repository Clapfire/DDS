----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 10:52:22 AM
-- Design Name: 
-- Module Name: pwm - Behavioral
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

entity pwm is
    Port ( clk : in STD_LOGIC;
           input : in unsigned (7 downto 0);
           counter_debug : out unsigned(7 downto 0);
           output : out STD_LOGIC);
           
end pwm;

architecture Behavioral of pwm is
signal counter : unsigned (7 downto 0);
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            counter <= counter + 1;
        end if;
    end process;
    
    process(clk)
    begin
        if(falling_edge(clk)) then
            if(input >= counter) then
                    output <= '1';
                else
                    output <= '0';
            end if;
        end if;
    end process;
    
    counter_debug <= counter;
    
end Behavioral;
