----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2018 04:02:18 PM
-- Design Name: 
-- Module Name: sim - Behavioral
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

entity sim is
--  Port ( );
end sim;

architecture Behavioral of sim is

component TopReg
Port (  
        rst : in std_logic;
        clk : in std_logic;
        Out_input : in STD_LOGIC_VECTOR (7 downto 0);
        output : out STD_LOGIC_VECTOR (7 downto 0);
        carryout : out std_logic;
        Stateout : out std_logic_vector(3 downto 0); -- state output for observation
        PC_extra : out STD_LOGIC_VECTOR(3 downto 0); -- extra output for observation in simulation
        ASM_input_extra : out STD_LOGIC_VECTOR(3 downto 0); -- extra output for observation in simulation
        
        oloadA: out std_logic;
        oloadB: out std_logic;
        oloadC: out std_logic;
        oLoadD: out std_logic;
        
        oregOutA : out STD_LOGIC_VECTOR (7 downto 0);
        oregOutB : out STD_LOGIC_VECTOR (7 downto 0);
        oregOutC : out STD_LOGIC_VECTOR (7 downto 0);
        oregOutD : out STD_LOGIC_VECTOR (7 downto 0);
        
        OutA : out STD_LOGIC_VECTOR (7 downto 0);
        OutINput : out STD_LOGIC_VECTOR (7 downto 0);
        OutB : out STD_LOGIC_VECTOR (7 downto 0)
        
        
        );

end component;

signal out_input : STD_LOGIC_VECTOR (7 downto 0) := "00010011";
signal rst : std_logic := '0';
signal clk : std_logic;
        --out
signal output : STD_LOGIC_VECTOR (7 downto 0);
signal carryout : std_logic;

signal Stateout: std_logic_vector(3 downto 0);
signal PC_extra : std_logic_vector(3 downto 0);
signal ASM_input_extra  : std_logic_vector(3 downto 0);

signal outa : STD_LOGIC_VECTOR (7 downto 0);
signal outb : STD_LOGIC_VECTOR (7 downto 0);

signal        oregOutA : STD_LOGIC_VECTOR (7 downto 0);
signal        oregOutB : STD_LOGIC_VECTOR (7 downto 0);
signal        oregOutC : STD_LOGIC_VECTOR (7 downto 0);
signal        oregOutD : STD_LOGIC_VECTOR (7 downto 0);

signal oloada : std_logic;
signal oloadb: std_logic;
signal oloadc : std_logic;
signal oloadd: std_logic;

begin
-- Create an Instance of the Unit Under Test (UUT) and "connect it" to the defined input and output signals
uut: TopReg PORT MAP (
Stateout => Stateout, PC_extra => PC_extra ,ASM_input_extra  => ASM_input_extra, 
Out_input => out_input, output => output, rst => rst, carryout => carryout, 
outA => Outa, Outb =>  outb,
oloadA => oloadA,
oloadB => oloadB,
oloadC => oloadC,
oloadD => oloadD,
oregOutA => oregoutA,
oregOutB => oregOutB,
oregOutC => oregOutC,
oregOutD => oregOutD,
clk => clk);


-- Clock process definitions, uncomment these process statements if you need a clock generation process
-- and give clock the right name. This process will run in parallel with the stimulus process.
clock_process :process
begin
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
end process;
 -- Stimulus process, this is where you define a sequence of input signals for the simulation. All signals mustbe defined.
stim_proc: process

begin
 wait for 100 ns; -- hold reset state for 100 ns.
-- Uncomment the following (and give the clock the right name) if you want the circuit to "settle" before youassign values to the inputs.
-- wait for <clk>_period*10;
wait for 300 ns;

end process;




end Behavioral;
