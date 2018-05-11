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
    Port ( dataIn : in STD_LOGIC_VECTOR(7 downto 0);
           --writeAdr : in STD_LOGIC_VECTOR (3 downto 0);
           --window : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           dataOut : out STD_LOGIC_VECTOR(7 downto 0)
           );
end mem_average;

architecture Behavioral of mem_average is

    type rom is array(0 to 3) of std_logic_vector(7 downto 0);
    signal sum : std_logic_vector(9 downto 0);
    shared variable values : rom;
    signal counter : std_logic_vector(1 downto 0);
begin

--rst_proc : process(writeAdr) begin
  --      values(conv_integer(writeAdr)) := dataIn;   
--end process;

--writeData : process(writeAdr) begin
  --  values(conv_integer(writeAdr)) := dataIn;    
--end process;

calculation : process(clk, rst) begin
    if(rst = '1') then
        counter <= "00";
    elsif(rising_edge(clk)) then        
        values(conv_integer(counter)) := dataIn;
        counter <= counter + 1;
        --sum <= "0000000000";
        sum <= ("00" & values(0)) +("00" & values(1)) + ("00" & values(2)) + ("00" & values(3));
        dataOut <= sum(9 downto 2); 
    end if;
end process;

end Behavioral;
