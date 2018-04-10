library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BitCounter8TB is
--  Port ( );
end BitCounter8TB;

architecture Behavioral of BitCounter8TB is

COMPONENT BitCounter8
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

signal clk : STD_LOGIC;
signal rst : STD_LOGIC;
signal output : STD_LOGIC_VECTOR(7 downto 0);

begin

counter : BitCounter8 PORT MAP(clk => clk,
                               rst => rst,
                               output => output);

rstTest : process
begin
    rst <= '1';
    wait for 100ns;
    rst <= '0';
    wait;
end process;

clkTest : process
begin
    wait for 10ns;
    clk <= '1';
    wait for 10ns;
    clk <= '0';
end process;

end Behavioral;
