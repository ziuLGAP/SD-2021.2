LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY full_adder IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below                    -- input bit example
    A        : IN  std_logic_vector(3 DOWNTO 0);
    B        : IN  std_logic_vector(3 DOWNTO 0);
  ------------------------------------------------------------------------------
  --Insert output ports below                    -- output bit example
    S        : OUT std_logic_vector(3 DOWNTO 0);
    C_out, ov        : OUT std_logic  -- output vector example
    );
END full_adder;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE RTL OF full_adder IS 
Signal
P, G, C : std_logic_vector(3 DOWNTO 0);
BEGIN
        G <= A AND B;
        P <= A XOR B;
        C(0) <= G(0) OR (P(0) AND '0');
        C(1) <= G(1) OR (P(1) AND C(0));
        C(2) <= G(2) OR (P(2) AND C(1));
        C(3) <= G(3) OR (P(3) AND C(2));
        S(0) <= (A(0) XOR B(0)) XOR (A(0) AND NOT A(0));
        S(1) <= (A(1) XOR B(1)) XOR C(0);
        S(2) <= (A(2) XOR B(2)) XOR C(1);
        S(3) <= (A(3) XOR B(3)) XOR C(2);
        C_out <= (C(3));
		  ov <= (C(3) XOR C(2));
END RTL;