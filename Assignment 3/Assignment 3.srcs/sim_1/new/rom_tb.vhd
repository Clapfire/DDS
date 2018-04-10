----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 09:45:50 AM
-- Design Name: 
-- Module Name: rom_tb - Behavioral
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

entity rom_tb is
--  Port ( );
end rom_tb;

architecture Behavioral of rom_tb is
    component rom
        Port ( adr : in STD_LOGIC_VECTOR (4 downto 0);
               output : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal adr : std_logic_vector(4 downto 0) := (others => '0');
    signal output : std_logic_vector(7 downto 0); 
begin
    uut : rom port map(
        adr => adr, output => output
    );
    
    stim_proc : process
    begin
        wait for 100 ns;
        
        adr <= "10101";
        wait for 100 ns;
        
        adr <= "11100";
        wait for 100 ns;
                
        adr <= "00011";
        wait for 100 ns;
        wait;
    end process;

end Behavioral;
