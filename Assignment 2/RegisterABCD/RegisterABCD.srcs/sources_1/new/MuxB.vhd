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

entity MuxB is
Port ( 
rst:        in std_logic;
clk:        in std_logic;
Bin :       out std_logic_vector (7 downto 0);
SelectB:    in Std_logic_vector (1 downto 0);
RegOutA:    in std_logic_vector (7 downto 0);
RegOutB:    in std_logic_vector (7 downto 0);
RegOutC:    in std_logic_vector (7 downto 0);
RegOutD:    in std_logic_vector (7 downto 0)


);

end MuxB;

architecture Behavioral of MuxB is

signal B: std_logic_vector (7 downto 0);

begin

sela_process: process (clk)
begin
if (rising_edge(clk)) then 
   case SelectB is
      when "00" => B <= regoutA;
      when "01" => B <= regoutB;
      when "10" => B <= regoutc;
      when "11" => B <= regoutD;
             when others => B <= "00000000";
   end case;

    
    end if;
    end process sela_process;

    Bin <= B;

end Behavioral;
