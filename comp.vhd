LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

ENTITY comp IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    A        : IN  std_logic_vector(3 DOWNTO 0); -- input vector example
  ------------------------------------------------------------------------------
  --Insert output ports below
    Y       : OUT std_logic_vector(3 DOWNTO 0)  -- output vector example
    );
END comp;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE func OF comp IS

BEGIN

Y <= ((not (A)) + '1');

END func;