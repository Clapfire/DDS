----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2018 10:11:47 AM
-- Design Name: 
-- Module Name: MuxA - Behavioral
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

entity MuxA is
Port ( 
rst:        in std_logic;
clk:        in std_logic;
ain :       out std_logic_vector (7 downto 0);
SelectA:    in Std_logic_vector (1 downto 0);
RegOutA:    in std_logic_vector (7 downto 0);
RegOutB:    in std_logic_vector (7 downto 0);
RegOutC:    in std_logic_vector (7 downto 0);
RegOutD:    in std_logic_vector (7 downto 0)


);

end MuxA;

architecture Behavioral of MuxA is
signal a: std_logic_vector (7 downto 0);


begin

sela_process: process (clk)
begin
if (rising_edge(clk)) then 
   case SelectA is
      when "00" => a <= regoutA;
      when "01" => a <= regoutB;
      when "10" => a <= regoutc;
      when "11" => a <= regoutD;
             when others => a <= "00000000";
   end case;
end if;
end process sela_process;
Ain <= a;
end Behavioral;
