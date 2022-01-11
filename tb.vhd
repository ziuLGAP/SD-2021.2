library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity tb is
end tb;
architecture Tb of tb is
signal x,y   : unsigned(3 DOWNTO 0)  := "0000";
signal z     : unsigned(2 DOWNTO 0) := "000";
signal A,B   : std_logic_vector(17 DOWNTO 0);
signal C     : std_logic_vector(6 DOWNTO 0);
begin
id1: entity work.ALU port map(A,B,C);
process
    begin
	 wait for 20ns;
    x <= x + 1;
end process;
process
    begin
	 wait for 40ns;
    y <= y + 1;
end process;
process
    begin
	 wait for 60ns;
    z <= z + 1;
end process;
A(3 DOWNTO 0) <= std_logic_vector(x);
A(7 DOWNTO 4) <= std_logic_vector(y);
A(10 DOWNTO 8) <= std_logic_vector(z);
A(17 DOWNTO 11) <= "0000000"; 
end Tb;