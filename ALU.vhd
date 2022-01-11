LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY ALU IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below                    -- input bit example
    SW: in std_logic_vector(17 downto 0);
  ------------------------------------------------------------------------------
  --Insert output ports below                    -- output bit example
    G_LEDR: out std_logic_vector(17 downto 0);
    G_HEX7: out std_logic_vector(6 downto 0)
    );
END ALU;

ARCHITECTURE RTL OF ALU IS 

	COMPONENT full_adder IS
		PORT(
		a, b    : IN std_logic_vector(3 DOWNTO 0);
		s       : OUT std_logic_vector(3 DOWNTO 0);
		c_out, ov   : OUT std_logic
		);
		END COMPONENT;
		
	COMPONENT comp IS
		PORT(
		A       : IN std_logic_vector(3 DOWNTO 0);
		Y       : OUT std_logic_vector(3 DOWNTO 0)
		); 
		END COMPONENT;
		
	COMPONENT shifter3 IS
		PORT(
		Input  : IN std_logic_vector(3 DOWNTO 0);
		Output : OUT std_logic_vector(3 DOWNTO 0)
		);
		END COMPONENT;
		
	COMPONENT shifterR IS
		PORT(
		Input1  : IN std_logic_vector(3 DOWNTO 0);
		Output1 : OUT std_logic_vector(3 DOWNTO 0)
		);
		END COMPONENT;
		
	COMPONENT RotationL IS
		PORT(
		X  : IN std_logic_vector(3 DOWNTO 0);
		R : OUT std_logic_vector(3 DOWNTO 0)
		);
		END COMPONENT;
		
	COMPONENT RotationR IS
		PORT(
		X  : IN std_logic_vector(3 DOWNTO 0);
		R : OUT std_logic_vector(3 DOWNTO 0)
		);
		END COMPONENT;
		
SIGNAL 
S1,carry1,carry2,SOMA,SUB,SOMA1,TROCA,SHIFTER1,SHIFTER2,RotateL,RotateR,Comp1    : std_logic_vector(3 DOWNTO 0);
	
BEGIN

c1: comp port map(SW(7 DOWNTO 4),Comp1);
g1: full_adder port map(SW(3 DOWNTO 0),SW(7 DOWNTO 4), SOMA, carry1(0), carry1(1));
g2: full_adder port map(SW(3 DOWNTO 0),Comp1, SUB, carry1(2), carry2(0));
g3: full_adder port map(SW(3 DOWNTO 0),"0001",SOMA1, carry1(3), carry2(1));
g4: comp port map(SW(3 DOWNTO 0), TROCA);
g5: shifter3 port map(SW(3 DOWNTO 0), SHIFTER1);
g6: shifterR port map(SW(3 DOWNTO 0), SHIFTER2);
g7: RotationL port map(SW(3 DOWNTO 0), RotateL);
g8: RotationR port map(SW(3 DOWNTO 0), RotateR);
 
S1	<=  SOMA  when (SW(10 DOWNTO 8) = "000") else
		 SUB   when (SW(10 DOWNTO 8) = "001") else
		 SOMA1 when (SW(10 DOWNTO 8) = "010") else
		 TROCA when (SW(10 DOWNTO 8) = "011") else
		 SHIFTER1 when (SW(10 DOWNTO 8) = "100") else
		 SHIFTER2 when (SW(10 DOWNTO 8) = "101") else
		 RotateL when (SW(10 DOWNTO 8) = "110") else
		 RotateR when (SW(10 DOWNTO 8) = "111") else
		 "0000";
		 
G_LEDR(3 DOWNTO 0) <= S1;
		 
G_LEDR(4)	<=  carry1(1)   when (SW(10 DOWNTO 8) = "000") else
				    carry2(0)   when (SW(10 DOWNTO 8) = "001") else
				    carry2(1)   when (SW(10 DOWNTO 8) = "010") else
				    '0';
					 
G_LEDR(5)   <=  carry1(0)   when (SW(10 DOWNTO 8) = "000") else
				    carry1(2)   when (SW(10 DOWNTO 8) = "001") else
				    carry1(3)   when (SW(10 DOWNTO 8) = "010") else
				    '0';
					 
G_LEDR(6)   <=  NOT (SOMA(0) OR SOMA(1) OR SOMA(2) OR SOMA(3))     when (SW(10 DOWNTO 8) = "000") else
                NOT (SUB(0) OR SUB(1) OR SUB(2) OR SUB(3))         when (SW(10 DOWNTO 8) = "001") else
		          NOT (SOMA1(0) OR SOMA1(1) OR SOMA1(2) OR SOMA1(3)) when (SW(10 DOWNTO 8) = "010") else
		          NOT (TROCA(0) OR TROCA(1) OR TROCA(2) OR TROCA(3)) when (SW(10 DOWNTO 8) = "010") else
		          '0';
					 
G_LEDR(7)   <=  SOMA(3)  when (SW(10 DOWNTO 8) = "000") else
			       SUB(3)   when (SW(10 DOWNTO 8) = "001") else
			       SOMA1(3) when (SW(10 DOWNTO 8) = "010") else
			       TROCA(3) when (SW(10 DOWNTO 8) = "011") else
			       '0';
					 
G_LEDR(17 DOWNTO 8) <= "0000000000";

with S1 select
    G_HEX7 <=   "1000000" when "0000",
                "1111001" when "0001",
                "0100100" when "0010",
                "0110000" when "0011",
                "0011001" when "0100",
                "0010010" when "0101",
                "0000010" when "0110",
                "1111000" when "0111",
                "0000000" when "1000",
                "0011000" when "1001",
                "0001000" when "1010",
                "0000011" when "1011",
                "1000110" when "1100",
                "0100001" when "1101",
                "0000110" when "1110",
                "0001110" when "1111",
                "0000000" when others;
					 
END RTL;