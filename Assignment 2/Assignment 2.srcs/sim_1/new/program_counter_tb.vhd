----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 10:15:50 AM
-- Design Name: 
-- Module Name: program_counter_tb - Behavioral
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

entity program_counter_tb is
--  Port ( );
end program_counter_tb;

architecture Behavioral of program_counter_tb is
    
    component program_counter
        Port ( inc : in STD_LOGIC; --increment pc
               load : in STD_LOGIC; --load data
               clk : in STD_LOGIC;
               rst : in STD_LOGIC; --reset
               data : in STD_LOGIC_VECTOR (7 downto 0); 
               output : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    --inputs
    signal inc : std_logic := '0';
    signal load : std_logic := '0';
    signal rst : std_logic := '0';
    signal data : std_logic_vector(7 downto 0) := (others => '0');
    signal clk : std_logic;
    --outputs
    signal output : std_logic_vector(7 downto 0);
    
    constant clk_period : time := 20 ns;
begin
    uut : program_counter port map(
    inc => inc, load => load, rst => rst, data => data, output => output, clk => clk);
    
    clk_process :process 
    begin 
        clk <= '0'; 
        wait for clk_period/2; 
        clk <= '1'; 
        wait for clk_period/2;
    end process;
    
    stim_process : process
    begin
        wait for 100ns;
        wait for clk_period*10;
        
        inc <= '1';
        wait for clk_period*10;
        
        inc <= '0';
        data <= "10101010";
        wait for clk_period*10;
        
        load <= '1';
        wait for clk_period*10;
        
        load <= '0';
        rst <= '1';
        wait for clk_period*10;
        
        rst <= '0';
        inc <= '1';
        
        wait;
        
    end process;
end Behavioral;
