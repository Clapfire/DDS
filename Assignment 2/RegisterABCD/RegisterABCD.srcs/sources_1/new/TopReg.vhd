----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2018 09:54:17 AM
-- Design Name: 
-- Module Name: TopReg - Behavioral
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

entity TopReg is
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
        
        OutINput : out STD_LOGIC_VECTOR (7 downto 0);
        OutA : out STD_LOGIC_VECTOR (7 downto 0);
        OutB : out STD_LOGIC_VECTOR (7 downto 0)
        
        
        );


end TopReg;

architecture structural of TopReg is

component RegA
Port ( 
    Clk:            in  std_logic;
    rst:            in  std_logic;
    input:          in  std_logic_vector (7 downto 0);
    LoadA:          in  std_logic;
    RegOutA:         out std_logic_vector (7 downto 0)
);
end component; 

component RegB
Port ( 
    Clk:            in  std_logic;
    rst:            in  std_logic;
    input:          in  std_logic_vector (7 downto 0);
    LoadB:          in  std_logic;
    RegOutB:         out std_logic_vector (7 downto 0)
);
end component; 

component regC
Port ( 
    Clk:            in  std_logic;
    rst:            in  std_logic;
    input:          in  std_logic_vector (7 downto 0);
    LoadC:          in  std_logic;
    RegOutc:         out std_logic_vector (7 downto 0)
);
end component; 

component RegD
Port ( 
    Clk:            in  std_logic;
    rst:            in  std_logic;
    input:          in  std_logic_vector (7 downto 0);
    LoadD:          in  std_logic;
    RegOutD:         out std_logic_vector (7 downto 0)
);
end component; 

component programasm
    Port ( Reset : in STD_LOGIC;
       Clk : in STD_LOGIC;
       SelInput : out STD_LOGIC;
       AluFunc : out STD_LOGIC_VECTOR (1 downto 0);
       LoadA : out STD_LOGIC;
       LoadB : out STD_LOGIC;
       LoadC : out STD_LOGIC;
       LoadD : out STD_LOGIC;
       SelA : out STD_LOGIC_VECTOR (1 downto 0);
       SelB : out STD_LOGIC_VECTOR (1 downto 0);
       Carry : out STD_LOGIC; -- output to control the carryin signal
       Stateout : out std_logic_vector(3 downto 0); -- state output for observation
       PC_extra : out STD_LOGIC_VECTOR(3 downto 0); -- extra output for observation in simulation
       ASM_input_extra : out STD_LOGIC_VECTOR(3 downto 0)); -- extra output for observation in simulation
end component;

component MuxA
Port ( 
rst:        in std_logic;
clk:        in std_logic;
ain :       out std_logic_vector (7 downto 0);
SelectA:    in Std_logic_vector (1 downto 0);
RegOutA:    in std_logic_vector (7 downto 0);
RegOutB:    in std_logic_vector (7 downto 0);
RegOutC:    in std_logic_vector (7 downto 0);
RegOutD:    in std_logic_vector (7 downto 0));
end component;

component MuxB
Port ( 
rst:        in std_logic;
clk:        in std_logic;
Bin :       out std_logic_vector (7 downto 0);
SelectB:    in Std_logic_vector (1 downto 0);
RegOutA:    in std_logic_vector (7 downto 0);
RegOutB:    in std_logic_vector (7 downto 0);
RegOutC:    in std_logic_vector (7 downto 0);
RegOutD:    in std_logic_vector (7 downto 0));
end component;

component Alu8 
    Port ( Ain : in STD_LOGIC_VECTOR (7 downto 0);
           Bin : in STD_LOGIC_VECTOR (7 downto 0);
           AluOut : out STD_LOGIC_VECTOR (7 downto 0);
           select_1 : in STD_LOGIC_VECTOR (1 downto 0);
           carryIn : in STD_LOGIC;
           carryOut : out STD_LOGIC
);
end component;

component SelMux 
  Port (
        clk:    in std_logic;
        rst:    in std_logic;
        Out_input: in std_logic_vector (7 downto 0);
        Alu_out:    in std_logic_vector (7 downto 0);
        input:      out std_logic_vector (7 downto 0);
        sellin: in std_logic    
  );
end component;

-- signalss 
signal loadA: std_logic;
signal loadB: std_logic;
signal loadC: std_logic;
signal loadD: std_logic;

signal RegoutA:  std_logic_vector (7 downto 0);
signal RegoutB:  std_logic_vector (7 downto 0);
signal RegoutC:  std_logic_vector (7 downto 0);
signal RegoutD:  std_logic_vector (7 downto 0);

signal selA: std_logic_vector (1 downto 0);
signal selB: std_logic_vector (1 downto 0);

signal A: Std_logic_vector (7 downto 0);
signal B: Std_logic_vector (7 downto 0);
signal Aluout: Std_logic_vector (7 downto 0);
signal alu_func: Std_logic_vector (1 downto 0);
signal input : STD_LOGIC_VECTOR (7 downto 0);

signal sellin: std_logic;
signal carry: std_logic;
signal carryin : std_logic;
-- end signals 

begin



alu8_1: Alu8 port map
(ain => a, bin => b, carryin => carryin, aluout => aluout, select_1 => alu_func, carryout => carry);
-- carryin => carry


MuxA_1: MuxA port map
(regoutA => regoutA, regoutb => regoutB, regoutc => regoutc, regoutD => regoutD, clk => clk, rst => rst, selectA => selA, ain => a);

MuxB_1: MuxB port map
(regoutA => regoutA, regoutb => regoutB, regoutc => regoutc, regoutD => regoutD, clk => clk, rst => rst, selectB => selB, bin => b);


RegA_1: RegA port map
(regoutA => regoutA, loadA => loadA, input => input, clk => clk, rst => rst);

regB_1: Regb port map
(regoutB => regoutB, loadB => loadB, input => input, clk => clk, rst => rst);

RegC_1: RegC port map
(regoutc => regoutC, loadC => loadC, input => input, clk => clk, rst => rst);

RegD_1: RegD port map
(regoutd => regoutD, loadd => loadd , input => input, clk => clk, rst => rst);

progamasm_1: programasm port map
(loada => loada, loadb => loadb, loadc => loadC, loadD => loadD, clk => clk, Reset => rst, selA => selA, selb => selB, alufunc => alu_func,
 selinput => sellin, 
 --carry => carryout, 
 stateout => stateout, pc_extra => pc_extra, ASM_input_extra => ASM_input_extra);

sel_in_1: selmux port map
(rst => rst, clk => clk, out_input => out_input, alu_out => aluout, input => input, sellin => sellin); 

output <= aluout;
carryout <= carry;
outA <= a;
outB <= B;

oregOutA <= regOutA;
oregOutB <= regOutB;
oregOutC <= regOutC;
oregOutD <= regOutD;

oloadA <= loada;
oloadB <= loadB;
oloadC <= loadC;
oloadD <= loadD;
end structural;
