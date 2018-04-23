----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 09:14:26 AM
-- Design Name: 
-- Module Name: program_counter - Behavioral
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

entity program_counter is
    Port ( inc : in STD_LOGIC; --increment pc
           load : in STD_LOGIC; --load data
           clk : in STD_LOGIC;
           rst : in STD_LOGIC; --reset
           data : in STD_LOGIC_VECTOR (7 downto 0); 
           output : out unsigned (7 downto 0));
end program_counter;

architecture Behavioral of program_counter is
signal tmp: unsigned(7 downto 0);
begin
    process(clk)
    begin
        if(clk'event and clk = '1') then
            if(rst = '1') then
                tmp <= "00000000";
            elsif(load = '1') then
                tmp <= unsigned(data);
            elsif(inc = '1') then
                tmp <= tmp + 1;        
            end if;
        end if;
    end process;
    
    output <= tmp;
end Behavioral;
