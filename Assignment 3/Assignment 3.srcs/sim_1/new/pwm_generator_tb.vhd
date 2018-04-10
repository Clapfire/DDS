----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2018 12:15:01 PM
-- Design Name: 
-- Module Name: pwm_generator_tb - Behavioral
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

entity pwm_generator_tb is
--  Port ( );
end pwm_generator_tb;

architecture Behavioral of pwm_generator_tb is

component pwm_generator
    Port ( Clk : in STD_LOGIC;
       Dip_SW0 : in STD_LOGIC;
       Dip_SW1 : in STD_LOGIC;
       Dip_SW2 : in STD_LOGIC;
       Dip_SW3 : in STD_LOGIC;
       Dip_SW4 : in STD_LOGIC;
       Dip_SW5 : in STD_LOGIC;
       Dip_SW6 : in STD_LOGIC;
       Dip_SW7 : in STD_LOGIC;
       pwm_output : out STD_LOGIC
       );
end component;

signal Clk : std_logic;
signal Dip_SW0 : std_logic;
signal Dip_SW1 : std_logic;
signal Dip_SW2 : std_logic;
signal Dip_SW3 : std_logic;
signal Dip_SW4 : std_logic;
signal Dip_SW5 : std_logic;
signal Dip_SW6 : std_logic;
signal Dip_SW7 : std_logic;

signal pwm_output : std_logic;

begin

pwm : pwm_generator port map(Clk => Clk,
                             Dip_SW0 => Dip_SW0,
                             Dip_SW1 => Dip_SW1,
                             Dip_SW2 => Dip_SW2,
                             Dip_SW3 => Dip_SW3,
                             Dip_SW4 => Dip_SW4,
                             Dip_SW5 => Dip_SW5,
                             Dip_SW6 => Dip_SW6,
                             Dip_SW7 => Dip_SW7,
                             pwm_output => pwm_output
                             );

clock : process
begin
    Clk <= '1';
    wait for 10 ns;
    Clk <= '0';
    wait for 10 ns;
end process;

switches : process
begin
    Dip_SW0 <= '1';
    Dip_SW1 <= '0';
    Dip_SW2 <= '0';
    Dip_SW3 <= '0';
    Dip_SW4 <= '0';
    Dip_SW5 <= '0';
    Dip_SW6 <= '0';
    Dip_SW7 <= '0';
    wait for 100us;
    
    Dip_SW0 <= '0';
    Dip_SW1 <= '1';
    Dip_SW2 <= '0';
    Dip_SW3 <= '0';
    Dip_SW4 <= '0';
    Dip_SW5 <= '0';
    Dip_SW6 <= '0';
    Dip_SW7 <= '0';
    wait;
end process;
end Behavioral;
