----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2018 02:03:28 PM
-- Design Name: 
-- Module Name: RegisterABCD - Behavioral
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

entity RegisterABCD is
    Port (  Mux_ALU_A : out std_logic_vector (7 downto 0);
            Mux_ALU_B : out std_logic_vector (7 downto 0);
            sel_A :     in STD_LOGIC_vector (1 downto 0);
            sel_b :     in STD_LOGIC_vector (1 downto 0);

            alu_mux_input:      in STD_LOGIC_vector (7 downto 0);
            alu_out:            in STD_LOGIC_vector (7 downto 0);
          
            sel_alu_mux:        in STD_LOGIC;

            enableA:    in std_logic;
            enableB:    in std_logic;
            enableC:    in std_logic;
            enableD:    in std_logic;
            clk:        in std_logic
            );
            
end RegisterABCD;

architecture Behavioral of RegisterABCD is

signal A: std_logic_vector (7 downto 0);
signal B: std_logic_vector (7 downto 0);

signal ABCD: std_logic_vector (7 downto 0);

signal   ALU_MUX_loadline:   STD_LOGIC_vector (7 downto 0);

signal reg_A_load: std_logic_vector (7 downto 0);
signal reg_B_load: std_logic_vector (7 downto 0);
signal reg_C_load: std_logic_vector (7 downto 0);
signal reg_D_load: std_logic_vector (7 downto 0);

-- signal end 
begin

my_process_alumux: process (clk, sel_alu_mux)
begin
if (rising_edge(clk)) then 
case (sel_alu_mux) is
    when '0' => ALU_MUX_loadline <= alu_out;
    when '1' => ALU_MUX_loadline <= alu_mux_input;
    when others => alu_mux_loadline <= "00000000";
    end case;
end if;
end process my_process_alumux;


my_process_Load_reg_A: process (clk, enablea)
begin
if (rising_edge(clk)) then 
case enablea is
    when '1' => reg_A_load <= ALU_MUX_loadline;
    when others => reg_A_load <= "00000000";
end case;
end if;
end process my_process_Load_reg_A;


my_process_load_reg_b : process (clk, enableb)
begin
if (rising_edge(clk)) then 
case enableB is
    when '1' => reg_B_load <= ALU_MUX_loadline;
    when others => reg_B_load <= "00000000";
end case;
end if;
end process my_process_Load_reg_B;


my_process_Load_reg_c: process (clk)
begin
if (rising_edge(clk)) then 
case enableC is
    when '1' => reg_C_load <= ALU_MUX_loadline;
    when others => reg_C_load <= "00000000";
end case;
end if;
end process my_process_Load_reg_C;


my_process_Load_reg_D: process (clk)
begin
if (rising_edge(clk)) then 
case enableD is
    when '1' => reg_D_load <= ALU_MUX_loadline;
    when others => reg_D_load <= "00000000";
end case;
end if;
    end process my_process_Load_reg_D;


my_process_sela: process (clk)
begin
if (rising_edge(clk)) then 
   case Sel_A is
      when "00" => a <= reg_a_load;
      when "01" => a <= reg_B_load;
      when "10" => a <= reg_c_load;
      when "11" => a <= reg_d_load;
            when others => a <= "00000000";
   end case;

    
    end if;
    Mux_ALU_A <= a;
    end process my_process_selA;

my_process_selb: process (clk)
begin
if (rising_edge(clk)) then 
      case Sel_B is
      when "00" => b <= reg_a_load;
      when "01" => b <= reg_B_load;
      when "10" => b <= reg_c_load;
      when "11" => b <= reg_d_load;
     when others => b <= "00000000";
    end case;
    
    end if;
    Mux_ALU_B <= b;
    end process my_process_selb;

end Behavioral;