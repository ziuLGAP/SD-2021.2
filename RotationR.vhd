library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
entity RotationR is
port(
    X   : in STD_LOGIC_VECTOR(3 downto 0);
    R   : out STD_LOGIC_VECTOR(3 downto 0)
);
end RotationR;

architecture Behavioral of RotationR is
begin
R(0) <= X(1);
R(1) <= X(2);
R(2) <= X(3);
R(3) <= X(0);
end Behavioral;