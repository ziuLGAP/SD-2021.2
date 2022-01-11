library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
entity RotationL is
port(
    X   : in STD_LOGIC_VECTOR(3 downto 0);
    R   : out STD_LOGIC_VECTOR(3 downto 0)
);
end RotationL;

architecture Behavioral of RotationL is
begin
R(0) <= X(3);
R(1) <= X(0);
R(2) <= X(1);
R(3) <= X(2);
end Behavioral;