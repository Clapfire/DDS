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
    Port ( a_Mux : in STD_LOGIC_vector (7 downto 0);
           b_Mux : in STD_LOGIC_vector (7 downto 0);
           c_Mux : in STD_LOGIC_vector (7 downto 0);
           d_Mux : in STD_LOGIC_vector (7 downto 0);
           Select_1 : in STD_LOGIC_vector(1 downto 0);
           Mux_out : out STD_LOGIC_vector (7 downto 0));
end Mux_421;

architecture Behavioral of Mux_421 is
begin

-- my stuff
process (Select_1, A_Mux, B_Mux, C_Mux, D_Mux)
begin
    case Select_1 is
        when  "00" => Mux_out <= A_Mux;
        when  "01" => Mux_out <= B_Mux;
        when  "10" => Mux_out <= C_Mux;
        when  "11" => Mux_out <= D_Mux; 
        -- when others => (others => '0');
        when others => null;
    end case;
end process;

--end my stuff               
end Behavioral;
