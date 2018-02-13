----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 10:59:19 AM
-- Design Name: 
-- Module Name: Alu8 - Structural
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

entity Alu8 is
    Port ( Ain : in STD_LOGIC_VECTOR (7 downto 0);
           Bin : in STD_LOGIC_VECTOR (7 downto 0);
           AluOut : out STD_LOGIC_VECTOR (7 downto 0);
           Select_1 : in STD_LOGIC_VECTOR (1 downto 0);
           carryIn : in STD_LOGIC;
           carryOut : out STD_LOGIC);
end Alu8;

architecture Structural of Alu8 is

COMPONENT Adder8    
    Port(
        a : IN STD_LOGIC_VECTOR(7 downto 0);
        b : IN STD_LOGIC_VECTOR(7 downto 0);
        sum : OUT STD_LOGIC_VECTOR(7 downto 0);  
        carryIn : IN STD_LOGIC;
        carryOut : OUT STD_LOGIC);
end COMPONENT;

COMPONENT Logic
    Port(
        a : IN STD_LOGIC_VECTOR(7 downto 0);
        b : IN STD_LOGIC_VECTOR(7 downto 0);
        AndOut : OUT STD_LOGIC_VECTOR(7 downto 0);
        OrOut : OUT STD_LOGIC_VECTOR(7 downto 0);
        InvA : OUT STD_LOGIC_VECTOR(7 downto 0));
end COMPONENT;

COMPONENT MUX_421
    Port(
        a_Mux : IN STD_LOGIC_VECTOR(7 downto 0); 
        b_Mux : IN STD_LOGIC_VECTOR(7 downto 0);
        c_Mux : IN STD_LOGIC_VECTOR(7 downto 0); 
        d_Mux : IN STD_LOGIC_VECTOR(7 downto 0); 
        Mux_Out : OUT STD_LOGIC_VECTOR(7 downto 0);
        Select_1 : IN STD_LOGIC_VECTOR(1 downto 0));
end COMPONENT;

signal adderOutToMux : STD_LOGIC_VECTOR (7 downto 0);
signal logicAndToMux : STD_LOGIC_VECTOR (7 downto 0);
signal logicOrToMux : STD_LOGIC_VECTOR (7 downto 0);
signal logicInvToMux : STD_LOGIC_VECTOR (7 downto 0);

begin

c1 : Adder8 PORT MAP(a => Ain, 
                     b => Bin, 
                     carryIn => carryIn, 
                     carryOut => carryOut, 
                     sum => adderOutToMux);
c2 : Logic PORT MAP(a => Ain, 
                    b => Bin, 
                    AndOut => logicAndToMux, 
                    OrOut => logicOrToMux, 
                    InvA => logicInvToMux);
c3 : Mux_421 PORT MAP(a_Mux => adderOutToMux, 
                        b_Mux => logicAndToMux, 
                        c_Mux => logicOrToMux, 
                        d_Mux => logicInvToMux, 
                        Mux_Out => AluOut, 
                        Select_1 => Select_1); 

end Structural;
