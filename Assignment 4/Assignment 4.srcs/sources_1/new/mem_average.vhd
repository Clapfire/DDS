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
           window : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           dataOut : out STD_LOGIC_VECTOR(7 downto 0)
           );
end mem_average;

architecture Behavioral of mem_average is

    type rom is array(0 to 15) of std_logic_vector(7 downto 0);
    signal sum : std_logic_vector(11 downto 0);
    signal sum16 : std_logic_vector(19 downto 0);
    shared variable values : rom;
    signal counter : std_logic_vector(3 downto 0);
begin

--rst_proc : process(writeAdr) begin
  --      values(conv_integer(writeAdr)) := dataIn;   
--end process;

--writeData : process(writeAdr) begin
  --  values(conv_integer(writeAdr)) := dataIn;    
--end process;

calculation : process(clk, rst) begin
    if(rst = '1') then
        counter <= "0000";
    elsif(rising_edge(clk)) then        
        values(conv_integer(counter)) := dataIn;
        counter <= counter + 1;
        
        if(window(3) = '1') then
        
            sum16 <= ("0000" & std_logic_vector((unsigned(values(0))*82) srl 10)) + ("0000" & std_logic_vector((unsigned(values(1))*92) srl 10)) + ("0000" & std_logic_vector((unsigned(values(2))*123) srl 10)) + ("0000" & std_logic_vector((unsigned(values(3))*172) srl 10))
                + ("0000" & std_logic_vector((unsigned(values(4))*238) srl 10)) + ("0000" & std_logic_vector((unsigned(values(5))*317) srl 10)) + ("0000" & std_logic_vector((unsigned(values(6))*407) srl 10)) + ("0000" & std_logic_vector((unsigned(values(7))*504) srl 10))
                + ("0000" & std_logic_vector((unsigned(values(8))*602) srl 10)) + ("0000" & std_logic_vector((unsigned(values(9))*699) srl 10)) + ("0000" & std_logic_vector((unsigned(values(10))*788) srl 10)) + ("0000" & std_logic_vector((unsigned(values(11))*868) srl 10))
                + ("0000" & std_logic_vector((unsigned(values(12))*934) srl 10)) + ("0000" & std_logic_vector((unsigned(values(13))*983) srl 10)) + ("0000" & std_logic_vector((unsigned(values(14))*1014) srl 10)) + ("0000" & std_logic_vector((unsigned(values(15))*1024) srl 10));
            dataOut <= sum16(10 downto 3);
            
        elsif(window(2) = '1') then
            if(counter = "1000") then
                counter <= "0000";
            end if;
            
            sum16 <= ("0000" & std_logic_vector((unsigned(values(0))*82) srl 10)) + ("0000" & std_logic_vector((unsigned(values(1))*129) srl 10)) + ("0000" & std_logic_vector((unsigned(values(2))*259) srl 10)) + ("0000" & std_logic_vector((unsigned(values(3))*448) srl 10))
                + ("0000" & std_logic_vector((unsigned(values(4))*658) srl 10)) + ("0000" & std_logic_vector((unsigned(values(5))*847) srl 10)) + ("0000" & std_logic_vector((unsigned(values(6))*977) srl 10)) + ("0000" & std_logic_vector((unsigned(values(7))*1024) srl 10));
            dataOut <= sum16(9 downto 2);
            
        elsif(window(1) = '1') then
            if(counter = "0100") then
                counter <= "0000";
            end if;
            
            sum <= ("0000" & values(0)) + ("0000" & values(1)) + ("0000" & values(2)) + ("0000" & values(3));
            dataOut <= sum(9 downto 2);
            
        elsif(window(0) = '1') then
            if(counter = "0010") then
                counter <= "0000";
            end if;
            
            sum <= ("0000" & values(0)) + ("0000" & values(1));
            dataOut <= sum(8 downto 1);
            
        else
            counter <= "0000";
            sum <= ("0000" & values(0));
            dataOut <= sum(7 downto 0);
        end if; 
        
    end if;
end process;

end Behavioral;
