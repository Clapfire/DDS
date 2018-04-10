----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2018 11:45:30 AM
-- Design Name: 
-- Module Name: pwm_generator - Structural
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_generator is
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
end pwm_generator;

architecture Structural of pwm_generator is

component dipCounter
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
end component;

component BitCounter5
    Port ( clk : in STD_LOGIC;
       output : out STD_LOGIC_VECTOR (4 downto 0)
       );
end component;

component pwm
    Port ( clk : in STD_LOGIC;
       input : in unsigned (7 downto 0);
       counter_debug : out unsigned(7 downto 0);
       output : out STD_LOGIC
       );
end component;

component rom
    Port ( adr : in STD_LOGIC_VECTOR (4 downto 0);
       output : out STD_LOGIC_VECTOR (7 downto 0)
       );
end component;

signal dip_to_5_bit_counter : std_logic;
signal address : std_logic_vector(4 downto 0);
signal rom_output : std_logic_vector(7 downto 0);

begin

dip_count : dipCounter port map(Dip_SW0 => Dip_SW0,
                                Dip_SW1 => Dip_SW1,
                                Dip_SW2 => Dip_SW2,
                                Dip_SW3 => Dip_SW3,
                                Dip_SW4 => Dip_SW4,
                                Dip_SW5 => Dip_SW5,
                                Dip_SW6 => Dip_SW6,
                                Dip_SW7 => Dip_SW7,
                                Clk => Clk,
                                clkout => dip_to_5_bit_counter
                                );

count_5 : BitCounter5 port map(clk => dip_to_5_bit_counter,
                               output => address
                               );
                               
rom1 : rom port map(adr => address,
                   output => rom_output
                   );
                   
pwm1 : pwm port map(Clk => Clk,
                    input => unsigned(rom_output),
                    output => pwm_output);
                    
end Structural;
