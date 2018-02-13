----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 10:57:00 AM
-- Design Name: 
-- Module Name: Mux_421 - Behavioral
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


-- /* from book 
----------------------------------------------------------------
-- A 4:1 multiplexer implemented as behavioral model using case
-- statement.
--
-- Required signals:
----------------------------------------------------------------
-- SEL: in std_logic_vector(1 downto 0);
-- A, B, C, D: in std_logic;
-- MUX_OUT: out std_logic;
----------------------------------------------------------------
-- */

entity Mux_421 is
    Port ( Mux_in_from_adder : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           Select_1 : in STD_LOGIC_vector(1 downto 0);
           Mux_out : out STD_LOGIC); 
end Mux_421;

architecture Behavioral of Mux_421 is
begin

-- my stuff
process (Select_1, A, B, C, D)
begin
    case Select_1 is
        when  "00" => Mux_out <= A;
        when  "01" => Mux_out <= B;
        when  "10" => Mux_out <= C;
        when  "11" => Mux_out <= D; 
        -- when others => (others => '0');
        when others => Mux_out <= A;
    end case;
end process;

--end my stuff               
end Behavioral;
