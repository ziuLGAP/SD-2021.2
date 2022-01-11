LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shifterR IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
                        -- input bit example
    Input1        : IN  std_logic_vector(3 DOWNTO 0); -- input vector example
  ------------------------------------------------------------------------------
  --Insert output ports below
                        -- output bit example
    Output1       : OUT std_logic_vector(3 DOWNTO 0)  -- output vector example
    );
END shifterR;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF shifterR IS

BEGIN

Output1(3) <= '0';
Output1(2) <= Input1(3);
Output1(1) <= Input1(2);
Output1(0) <= Input1(1);

END TypeArchitecture;