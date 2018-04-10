----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2018 10:23:23 AM
-- Design Name: 
-- Module Name: dipCounterTB - Behavioral
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

entity dipCounterTB is
--  Port ( );
end dipCounterTB;

architecture Behavioral of dipCounterTB is

COMPONENT dipCounter
       Port ( Dip_SW0 : in STD_LOGIC;
       Dip_SW1 : in STD_LOGIC;
       Dip_SW2 : in STD_LOGIC;
       Dip_SW3 : in STD_LOGIC;
       Dip_SW4 : in STD_LOGIC;
       Dip_SW5 : in STD_LOGIC;
       Dip_SW6 : in STD_LOGIC;
       Dip_SW7 : in STD_LOGIC;
       Clk : in STD_LOGIC;
       clkOut : out STD_LOGIC
       );
end COMPONENT;

signal Dip_SW0 : STD_LOGIC;
signal Dip_SW1 : STD_LOGIC;
signal Dip_SW2 : STD_LOGIC;
signal Dip_SW3 : STD_LOGIC;
signal Dip_SW4 : STD_LOGIC;
signal Dip_SW5 : STD_LOGIC;
signal Dip_SW6 : STD_LOGIC;
signal Dip_SW7 : STD_LOGIC;
signal Clk : STD_LOGIC;

signal clkOut : STD_LOGIC;


begin
uut: dipCounter PORT MAP(Dip_SW0 => Dip_SW0,
                         Dip_SW1 => Dip_SW1,
                         Dip_SW2 => Dip_SW2,
                         Dip_SW3 => Dip_SW3,
                         Dip_SW4 => Dip_SW4,
                         Dip_SW5 => Dip_SW5,
                         Dip_SW6 => Dip_SW6,
                         Dip_SW7 => Dip_SW7,
                         Clk => Clk,
                         clkOut => clkOut
                         );

clock : process
begin
    wait for 10 ns;
    Clk <= '0';
    wait for 10 ns;
    Clk <= '1';
end process;

switches : process
begin
    Dip_SW0 <= '0';
    Dip_SW1 <= '0';
    Dip_SW2 <= '0';
    Dip_SW3 <= '0';
    Dip_SW4 <= '0';
    Dip_SW5 <= '0';
    Dip_SW6 <= '0';
    Dip_SW7 <= '0';
    
    wait for 10us;
    Dip_SW0 <= '1';
    Dip_SW1 <= '0';
    Dip_SW2 <= '0';
    Dip_SW3 <= '0';
    Dip_SW4 <= '0';
    Dip_SW5 <= '0';
    Dip_SW6 <= '0';
    Dip_SW7 <= '0';
    wait for 10us;
    
    Dip_SW0 <= '0';
    Dip_SW1 <= '1';
    Dip_SW2 <= '0';
    Dip_SW3 <= '0';
    Dip_SW4 <= '0';
    Dip_SW5 <= '0';
    Dip_SW6 <= '0';
    Dip_SW7 <= '0';
    wait for 10us;
    
    Dip_SW0 <= '1';
    Dip_SW1 <= '1';
    Dip_SW2 <= '0';
    Dip_SW3 <= '0';
    Dip_SW4 <= '0';
    Dip_SW5 <= '0';
    Dip_SW6 <= '0';
    Dip_SW7 <= '0';
    wait for 10us;
    
    Dip_SW0 <= '0';
    Dip_SW1 <= '0';
    Dip_SW2 <= '1';
    Dip_SW3 <= '0';
    Dip_SW4 <= '0';
    Dip_SW5 <= '0';
    Dip_SW6 <= '0';
    Dip_SW7 <= '0';
    wait for 10us;
    
    Dip_SW0 <= '1';
    Dip_SW1 <= '0';
    Dip_SW2 <= '1';
    Dip_SW3 <= '0';
    Dip_SW4 <= '0';
    Dip_SW5 <= '0';
    Dip_SW6 <= '0';
    Dip_SW7 <= '0';
    wait for 10us;
    
    Dip_SW0 <= '0';
    Dip_SW1 <= '1';
    Dip_SW2 <= '1';
    Dip_SW3 <= '0';
    Dip_SW4 <= '0';
    Dip_SW5 <= '0';
    Dip_SW6 <= '0';
    Dip_SW7 <= '0';
    wait for 10us;

    Dip_SW0 <= '1';
    Dip_SW1 <= '1';
    Dip_SW2 <= '1';
    Dip_SW3 <= '0';
    Dip_SW4 <= '0';
    Dip_SW5 <= '0';
    Dip_SW6 <= '0';
    Dip_SW7 <= '0';
    wait for 10us;
end process;

end Behavioral;
