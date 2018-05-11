----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 09:07:23 AM
-- Design Name: 
-- Module Name: rom - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom is
    Port ( adr : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0));
end rom;

architecture Behavioral of rom is

begin
    process(clk)
    type rom_type is array(0 to 31) of std_logic_vector(7 downto 0);
        variable rom_array_sine : rom_type := (x"80", x"98", x"B0", x"C6", x"D9", x"E9", x"F5", x"FC", 
                                          x"FF", x"FC", x"F5", x"E9", x"D9", x"C6", x"B0", x"98", 
                                          x"80", x"67", x"4F", x"39", x"26", x"16", x"0A", x"03", 
                                          x"01", x"03", x"0A", x"16", x"26", x"39", x"4F", x"67");   
                                          
        variable rom_array_square : rom_type := (x"FF", x"FF", x"FF", x"FF", x"FF", x"FF", x"FF", x"FF", 
                                                 x"FF", x"FF", x"FF", x"FF", x"FF", x"FF", x"FF", x"FF", 
                                                 x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", 
                                                 x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00");
                                                 
        variable rom_array_sawtooth : rom_type := (x"0", x"08", x"10", x"18", x"20", x"28", x"30", x"38", 
                                                   x"40", x"48", x"50", x"58", x"60", x"68", x"70", x"78", 
                                                   x"80", x"87", x"8F", x"97", x"9F", x"A7", x"AF", x"B7", 
                                                   x"BF", x"C7", x"CF", x"D7", x"DF", x"E7", x"EF", x"F7"); 
        variable rom_array_noisy_sine : rom_type := (x"87", x"92", x"C7", x"BD", x"F1", x"F6", x"EF", x"EB", 
                                                  x"FF", x"E8", x"E7", x"E0", x"CB", x"DD", x"AE", x"80", 
                                                  x"86", x"6F", x"65", x"31", x"39", x"01", x"0A", x"00", 
                                                  x"00", x"00", x"01", x"18", x"2C", x"44", x"5B", x"52"); 
    begin
        if(falling_edge(clk)) then
            output <= rom_array_noisy_sine(conv_integer(adr));
        end if;
    end process;

end Behavioral;
