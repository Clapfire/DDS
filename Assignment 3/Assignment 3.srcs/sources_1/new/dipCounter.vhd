----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 09:40:49 AM
-- Design Name: 
-- Module Name: dipCounter - Structural
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

entity dipCounter is
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
end dipCounter;

architecture Structural of dipCounter is

COMPONENT BitCounter12
    Port ( clk : in STD_LOGIC;
       rst : in STD_LOGIC;
       output : out STD_LOGIC_VECTOR (11 downto 0));
end COMPONENT;

COMPONENT BitComparator12
    Port ( a : in STD_LOGIC_VECTOR (11 downto 0);
       b : in STD_LOGIC_VECTOR (11 downto 0);
       output : out STD_LOGIC;
       rst : out STD_LOGIC
       );
end COMPONENT;

COMPONENT dipSwitches
    Port ( sw0 : in STD_LOGIC;
       sw1 : in STD_LOGIC;
       sw2 : in STD_LOGIC;
       sw3 : in STD_LOGIC;
       sw4 : in STD_LOGIC;
       sw5 : in STD_LOGIC;
       sw6 : in STD_LOGIC;
       sw7 : in STD_LOGIC;
       switches : out STD_LOGIC_VECTOR (11 downto 0));
end COMPONENT;

signal compToRst : STD_LOGIC;
signal counterToComp : STD_LOGIC_VECTOR(11 downto 0);
signal switchesOut : STD_LOGIC_VECTOR(11 downto 0);

begin

c1 : BitCounter12 PORT MAP ( clk => Clk,
                            rst => compToRst,
                            output => counterToComp
                            );
c2 : dipSwitches PORT MAP (sw0 => Dip_SW0,
                           sw1 => Dip_SW1,
                           sw2 => Dip_SW2,
                           sw3 => Dip_SW3,
                           sw4 => Dip_SW4,
                           sw5 => Dip_SW5,
                           sw6 => Dip_SW6,
                           sw7 => Dip_SW7,
                           switches => switchesOut
                           );
c3 : bitComparator12 PORT MAP (
                           a => switchesOut,
                           b => counterToComp,
                           output => clkOut,
                           rst => compToRst
                           );
    
end Structural;
