----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2018 10:45:48 AM
-- Design Name: 
-- Module Name: dipSwitchesTB - Behavioral
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

entity dipSwitchesTB is
--  Port ( );
end dipSwitchesTB;

architecture Behavioral of dipSwitchesTB is

component dipSwitches
 Port (sw0 : in STD_LOGIC;
       sw1 : in STD_LOGIC;
       sw2 : in STD_LOGIC;
       sw3 : in STD_LOGIC;
       sw4 : in STD_LOGIC;
       sw5 : in STD_LOGIC;
       sw6 : in STD_LOGIC;
       sw7 : in STD_LOGIC;
       switches : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal sw0 : std_logic;
signal sw1 : std_logic;
signal sw2 : std_logic;
signal sw3 : std_logic;
signal sw4 : std_logic;
signal sw5 : std_logic;
signal sw6 : std_logic;
signal sw7 : std_logic;

signal switches : std_logic_vector(7 downto 0);
begin

dip : dipSwitches port map (sw0 => sw0,
                            sw1 => sw1,
                            sw2 => sw2,
                            sw3 => sw3,
                            sw4 => sw4,
                            sw5 => sw5,
                            sw6 => sw6,
                            sw7 => sw7,
                            switches => switches
                            );

switching : process
begin
    wait for 10ns;
    sw0 <= '0';
    sw1 <= '0';
    sw2 <= '0';
    sw3 <= '0';
    sw4 <= '0';
    sw5 <= '0';
    sw6 <= '0';
    sw7 <= '0';
    
    wait for 10ns;
    sw0 <= '1';
    sw1 <= '0';
    sw2 <= '0';
    sw3 <= '0';
    sw4 <= '0';
    sw5 <= '0';
    sw6 <= '0';
    sw7 <= '0';
    
    wait for 10ns;
    sw0 <= '1';
    sw1 <= '0';
    sw2 <= '1';
    sw3 <= '0';
    sw4 <= '1';
    sw5 <= '0';
    sw6 <= '1';
    sw7 <= '0';
    
    wait for 10ns;
    sw0 <= '0';
    sw1 <= '1';
    sw2 <= '0';
    sw3 <= '1';
    sw4 <= '0';
    sw5 <= '1';
    sw6 <= '0';
    sw7 <= '1';
    
    wait for 10ns;
    sw0 <= '1';
    sw1 <= '1';
    sw2 <= '1';
    sw3 <= '1';
    sw4 <= '1';
    sw5 <= '1';
    sw6 <= '1';
    sw7 <= '1';
    
end process;

end Behavioral;
