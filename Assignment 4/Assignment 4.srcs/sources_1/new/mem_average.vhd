----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2018 12:08:06 PM
-- Design Name: 
-- Module Name: mem_average - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_average is
    Port ( dataIn : in STD_LOGIC;
           rst : in STD_LOGIC;
           writeAdr : in STD_LOGIC_VECTOR (3 downto 0);
           window : in STD_LOGIC_VECTOR (3 downto 0);
           dataOut : out STD_LOGIC_VECTOR(7 downto 0)
           );
end mem_average;

architecture Behavioral of mem_average is

    type rom is array(0 to 15) of std_logic_vector(7 downto 0);
    signal sum : std_logic_vector(24 downto 0);
    shared variable sum_divided : unsigned;
    signal windowSize : std_logic_vector(3 downto 0);
    shared variable values : rom;
    
begin



calculation : process(window) begin
    if(window = "0000") then
    sum <= "0000000000000000000000000000";
    elsif(window = "0001") then
        for I in 0 to 1 loop
            sum <= sum + std_logic_vector(values(I));
        end loop;
        
        sum_divided := unsigned(sum) srl 1;
        
    elsif(window = "0011") then
        for I in 0 to 3 loop
                sum <= sum + std_logic_vector(values(I));
        end loop;
        
        sum_divided := unsigned(sum) srl 2;
        
    elsif(window = "0111") then
        for I in 0 to 7 loop
                sum <= sum + std_logic_vector(values(I));
        end loop;
        
        sum_divided := unsigned(sum) srl 3;
        
    elsif(window = "1111") then
        for I in 0 to 15 loop
                sum <= sum + std_logic_vector(values(I));
        end loop;
        
        sum_divided := unsigned(sum) srl 4;
        
    end if;
    
    dataOut <= std_logic_vector(sum_divided);
    
end process;

end Behavioral;
