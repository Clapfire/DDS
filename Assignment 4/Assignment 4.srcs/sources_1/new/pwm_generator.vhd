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
           g_rst : in STD_LOGIC;
           pwm_output : out STD_LOGIC;
           pwm_output2 : out STD_LOGIC
           );
end pwm_generator;

architecture Structural of pwm_generator is

component dipCounter
    Port ( Dip_SW0 : in STD_LOGIC;
       Dip_SW1 : in STD_LOGIC;
       Dip_SW2 : in STD_LOGIC;
       Dip_SW3 : in STD_LOGIC;
       Clk : in STD_LOGIC;
       clkOut : out STD_LOGIC
       );
end component;

component ArrSwitch
    Port (sw4 : in STD_LOGIC;
       sw5 : in STD_LOGIC;
       sw6 : in STD_LOGIC;
       sw7 : in STD_LOGIC;
       clk : in STD_LOGIC;
       switches : out STD_LOGIC_VECTOR(3 downto 0)
       );
end component;

component mem_average
    Port ( dataIn : in STD_LOGIC_VECTOR(7 downto 0);
           --writeAdr : in STD_LOGIC_VECTOR (3 downto 0);
           window : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           dataOut : out STD_LOGIC_VECTOR(7 downto 0)
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
       clk : in STD_LOGIC;
       output : out STD_LOGIC_VECTOR (7 downto 0)
       );
end component;

--component averagerAddress
  --  Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
    --       clk : in STD_LOGIC;
      --     g_rst : in std_logic;
        --   address : out STD_LOGIC_VECTOR (3 downto 0));
--end component;

signal dip_to_5_bit_counter : std_logic;
signal address : std_logic_vector(4 downto 0);
signal rom_output : std_logic_vector(7 downto 0);
signal average_out : STD_LOGIC_VECTOR(7 downto 0);
signal arraySwitches : STD_LOGIC_VECTOR(3 downto 0);
signal averageAdr : STD_LOGIC_VECTOR(3 downto 0);


begin

dip_count_0_3 : dipCounter port map(Dip_SW0 => Dip_SW0,
                                Dip_SW1 => Dip_SW1,
                                Dip_SW2 => Dip_SW2,
                                Dip_SW3 => Dip_SW3,
                                Clk => Clk,
                                clkout => dip_to_5_bit_counter
                                );
                                
dip_count_4_7 : Arrswitch port map(sw4 => Dip_SW4,
                                sw5 => Dip_SW5,
                                sw6 => Dip_SW6,
                                sw7 => Dip_SW7,
                                clk => Clk,
                                switches => arraySwitches
                                );
                                
average_mem : mem_average port map(dataIn => rom_output,
                                --writeAdr => averageAdr,
                                window => arraySwitches,
                                clk => dip_to_5_bit_counter,
                                --dataIn => rom_output,
                                rst => g_rst,
                                dataOut => average_out
                                );

count_5 : BitCounter5 port map(clk => dip_to_5_bit_counter,
                               output => address
                               );
                               
--average_count : averagerAddress port map (input => arraySwitches,
  --                             clk => dip_to_5_bit_counter,
    --                           g_rst => g_rst,
      --                         address => averageAdr
        --                       );
                               
rom1 : rom port map(adr => address,
                   clk => dip_to_5_bit_counter,
                   output => rom_output
                   );
                   
pwm1 : pwm port map(Clk => Clk,
                    input => unsigned(rom_output),
                    output => pwm_output);
                    
pwm2 : pwm port map(Clk => Clk,
                    input => unsigned(average_out),
                    output => pwm_output2);
                    
end Structural;
