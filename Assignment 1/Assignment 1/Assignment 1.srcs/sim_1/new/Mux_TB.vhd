----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2018 09:16:16 AM
-- Design Name: 
-- Module Name: Mux_TB - Behavioral
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



entity mux_TB is
end mux_TB;

architecture Behavioral of mux_TB is

component Mux_421 
    Port ( a_Mux : in STD_LOGIC_vector (7 downto 0);
           b_Mux : in STD_LOGIC_vector (7 downto 0);
           c_Mux : in STD_LOGIC_vector (7 downto 0);
           d_Mux : in STD_LOGIC_vector (7 downto 0);
           Select_1 : in STD_LOGIC_vector(1 downto 0);
           Mux_out : out STD_LOGIC_vector (7 downto 0));
end Component;

signal a_mux : std_logic_vector(7 downto 0) := (others => '0');
signal b_mux : std_logic_vector(7 downto 0) := (others => '0');
signal c_mux : std_logic_vector(7 downto 0) := (others => '0');
signal d_mux : std_logic_vector(7 downto 0) := (others => '0');
signal mux_out : std_logic_vector(7 downto 0) := (others => '0');
signal Select_1 : std_logic_vector(1 downto 0) := (others => '0');

begin

UUT: mux_421 PORT MAP (a_mux => a_mux,
                    b_mux => b_mux,
                    c_mux => c_mux,
                    d_mux => d_mux,
                    mux_out => mux_out,
                    Select_1 => Select_1);
                    
stim_proc: process
    begin
        wait for 100 ns;
        a_mux <= "00001111";
        b_mux <= "01010101";
        c_mux <= "00011000";
        d_mux <= "10101010";
        wait for 100 ns;
        
        Select_1 <= "01";
        wait for 100 ns;
        
        Select_1 <= "10";
        wait for 100 ns;
        
        Select_1 <= "11";
        wait for 100 ns;
        
                     
    end process;

end Behavioral;
