----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2018 12:58:01 PM
-- Design Name: 
-- Module Name: SelMux - Behavioral
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

entity SelMux is
  Port (
        clk:    in std_logic;
        rst:    in std_logic;
        Out_input: in std_logic_vector (7 downto 0);
        Alu_out:    in std_logic_vector (7 downto 0);
        input:      out std_logic_vector (7 downto 0);
        sellin: in std_logic
        
  );
end SelMux;

architecture Behavioral of SelMux is

begin



my: Process (sellin)
begin
--if (rising_edge(clk)) then
    if (sellin = '1') then
        input <= out_input;
    else
        input <= Alu_out;
    end if; --end sellIN
--end if; -- clk
end process; --selin
end Behavioral;
