----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2018 11:32:52 AM
-- Design Name: 
-- Module Name: BitCounter5 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BitCounter5 is
    Port ( clk : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (4 downto 0));
end BitCounter5;

architecture Behavioral of BitCounter5 is

signal count : std_logic_vector(4 downto 0);

begin

Process(clk)

Begin
    if (rising_edge(clk)) then
        count <= count + 1;
    end if;
end process;

    output <= count;
end Behavioral;