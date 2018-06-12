
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;



entity Programasm is
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
end Programasm;

architecture Behavioral of Programasm is
type state_type is (st1_Reset, st2_DecodeAndExecute, st3_Wait, st4_Execute, st5_Wait);
   signal state, next_state : state_type;
      
   signal ASM_input : std_logic_vector(3 downto 0); --intern data fra programrom
   signal PC : std_logic_vector(3 downto 0); -- intern program counter
   signal Increment_PC : std_logic; -- message to increment PC
begin

 SYNC_PROC: process (clk)
   begin
      if (falling_edge(clk)) then
         if (reset = '1') then
            state <= st1_reset;
         else
            state <= next_state;
         end if;
      end if;
   end process;

   OUTPUT_DECODE: process (state, ASM_input)
   begin
      
      if (state = st1_reset) then
                  SelInput <= '0';
                  LoadA <= '0';
                  LoadB <= '0';
                  LoadC <= '0';
                  LoadD <= '0';
                  SelA <= "00";
                  SelB <= "00";
                  AluFunc <= "00";
                  Carry <= '0';
                  Increment_PC <= '0';
                  stateout <= "0001";
      end if;
      
      if (state = st2_DecodeAndExecute) then
         case ASM_input is -- decode the instruction
            when "0000" => -- Load A
                        SelInput <= '1';
                        LoadA <= '1';
                        LoadB <= '0';
                        LoadC <= '0';
                        LoadD <= '0';
                        SelA <= "00"; -- Areg on output A
                        SelB <= "01"; -- Breg on output B
                        AluFunc <= "00";
                        Carry <= '0';
                        Increment_PC <= '1'; -- increment PC
                         stateout <= "0010";
            when "0001" =>
                SelInput <= '1'; -- Load B
                        LoadA <= '0';
                        LoadB <= '1';
                        LoadC <= '0';
                        LoadD <= '0';
                        SelA <= "00";
                        SelB <= "01";
                        AluFunc <= "00";
                        Carry <= '0';
                        Increment_PC <= '1'; -- increment PC
                         stateout <= "0011";
            when "0010" => -- Load C
                         SelInput <= '1';
                         LoadA <= '0';
                         LoadB <= '0';
                         LoadC <= '1';
                         LoadD <= '0';
                         SelA <= "10"; -- Creg on output A
                         SelB <= "11"; -- Dreg on putput B
                         AluFunc <= "00";
                         Carry <= '0'; 
                         Increment_PC <= '1'; -- increment PC
                          stateout <= "0100";
            when "0011" => -- Load D
                         SelInput <= '1';
                         LoadA <= '0';
                         LoadB <= '0';
                         LoadC <= '0';
                         LoadD <= '1';
                         SelA <= "10"; -- Creg on output A
                         SelB <= "11"; -- Dreg on putput B
                         AluFunc <= "00";
                         Carry <= '0'; 
                         Increment_PC <= '1'; -- increment PC
                          stateout <= "0101";
            when "0101" => -- A = B + C
                         SelInput <= '0';
                         LoadA <= '1';
                         LoadB <= '0';
                         LoadC <= '0';
                         LoadD <= '0';
                         SelA <= "01"; -- Breg on output A
                         SelB <= "10"; -- Creg on putput B
                         AluFunc <= "00"; --Add
                         Carry <= '0'; 
                         Increment_PC <= '1'; -- increment PC
                          stateout <= "0110";                         
            when "1101" => -- Halt
                         SelInput <= '0';
                         LoadA <= '0';
                         LoadB <= '0';
                         LoadC <= '0';
                         LoadD <= '0';
                         SelA <= "00"; -- Areg on output A
                         SelB <= "00"; -- Areg on putput B
                         AluFunc <= "00";
                         Carry <= '0'; 
                         Increment_PC <= '0'; -- Do not increment PC
                          stateout <= "0111";
              when "1110" => -- A = B - C: (A = B + (-C))
                         SelInput <= '0';
                         LoadA <= '0';
                         LoadB <= '0';
                         LoadC <= '1';
                         LoadD <= '0';
                         SelA <= "11"; -- Creg on output A
                         SelB <= "00"; -- Areg on putput B - but not used
                         AluFunc <= "11"; -- Not A
                         Carry <= '0'; 
                         Increment_PC <= '0'; -- Do not increment PC
                          stateout <= "1000";
                                   
            when others => null; 
        end case;                    
      end if;  
      
        if (state = st3_Wait) then
         SelInput <= '0';
         LoadA <= '0';
         LoadB <= '0';
         LoadC <= '0';
         LoadD <= '0';
         SelA <= "00";
         SelB <= "00";
         AluFunc <= "00";
         Carry <= '0';
         Increment_PC <= '0'; --wait state - for correct timing.
         stateout <= "1001";
         end if;    
        
        if (state = st4_Execute) then
          if (ASM_Input = "1110") then -- second part of the sub instruction
              SelInput <= '0';
              LoadA <= '1';
              LoadB <= '0';
              LoadC <= '0';
              LoadD <= '0';
              SelA <= "01"; -- Breg on output A
              SelB <= "10"; -- Creg on putput B
              AluFunc <= "00"; -- Add
              Carry <= '1'; 
              Increment_PC <= '1'; -- Increment PC
              stateout <= "1010";
            end if;
        end if;
                   
        if (state = st5_Wait) then
         SelInput <= '0';
         LoadA <= '0';
         LoadB <= '0';
         LoadC <= '0';
         LoadD <= '0';
         SelA <= "00";
         SelB <= "00";
         AluFunc <= "00";
         Carry <= '0';
         Increment_PC <= '0'; -- Do not increment PC
         stateout <= "1011";
        end if; 
                          
   end process;

   NEXT_STATE_DECODE: process (state, ASM_input)
   begin
      next_state <= state;  
      case (state) is
         when st1_Reset =>
             next_state <= st2_decodeAndExecute;
             
         when st2_DecodeAndExecute =>
           if(ASM_input = "1110") then
              next_state <= st5_Wait;
           else      
              next_state <= st3_Wait;
           end if; 
                   
         when st3_Wait =>
              next_state <= st2_DecodeAndExecute;
           
         when st4_Execute =>
            next_state <= st3_Wait;
            
         when st5_wait =>
             next_state <= st4_Execute;
             
         when others => next_state <= st1_Reset;
      end case;
   end process;
   
   Program_Mem : process (Clk)
   type rom_type is array (0 to 15) of std_logic_vector (3 downto 0);                 
       variable ROM : rom_type:= (X"0", X"1", X"2", X"3", X"5", X"E", X"D", X"D",
                                  X"0", X"0", X"0", X"0", X"0", X"0", X"0", X"0");          
   Begin
   if (rising_edge(clk)) then
   if(state = st1_reset) then
        PC <= "0000";
   else
        Asm_input <= ROM(conv_integer(PC));
            if( Increment_PC = '1') then 
                PC <= PC+1;
            end if;
   end if;
   end if; 
   end process;
   
   
-- Extra outputs for observation in simulations
PC_extra <= PC;
ASM_input_extra <= ASM_input;

end Behavioral;
