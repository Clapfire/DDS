----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 10:23:25 AM
-- Design Name: 
-- Module Name: Adder8 - Behavioral
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

entity Adder8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Sum : out STD_LOGIC_VECTOR (7 downto 0);
           Carryin : in STD_LOGIC;
           Carryout : out STD_LOGIC);
end Adder8;

architecture Behavioral of Adder8 is

begin

Process(A, B, Carryin)
    variable vsum   : std_logic_vector(7 downto 0);
    variable carry : std_logic;
Begin
    carry := Carryin;
    for i in 0 to 7 loop
        vsum(i) := (A(i) xor B(i)) xor carry;
        carry := A(i) and B(i);
    end loop;
    
    Carryout <= carry;
       Sum <= vsum;
end Process;

   
   
end Behavioral;
