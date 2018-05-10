----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2018 11:43:24 AM
-- Design Name: 
-- Module Name: averagerAddress - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity averagerAddress is
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           address : out STD_LOGIC_VECTOR (3 downto 0));
end averagerAddress;

architecture Behavioral of averagerAddress is
signal counter : std_logic_vector(3 downto 0);
signal rst : std_logic;


begin
counter_proc : process(clk, rst) begin
                    if(rst = '1') then
                        counter <= "0000";
                    elsif(rising_edge(clk)) then
                        counter <= counter + 1;
                    end if;
               end process;
address <= counter;
rst_proc : process(clk) begin
                if(falling_edge(clk))then
                    if(counter = input) then
                        rst <= '1';
                    else
                        rst <= '0';
                    end if;
                end if;
           end process;


end Behavioral;
