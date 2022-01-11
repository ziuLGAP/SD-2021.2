--------------------------------------------------------------------------------
-- Project : Pedro Eduardo  
-- File    :
-- Autor   :
-- Date    :
--
--------------------------------------------------------------------------------
-- Description :
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shifter3 IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
                        -- input bit example
    Input        : IN  std_logic_vector(3 DOWNTO 0); -- input vector example
  ------------------------------------------------------------------------------
  --Insert output ports below
                        -- output bit example
    Output        : OUT std_logic_vector(3 DOWNTO 0)  -- output vector example
    );
END shifter3;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF shifter3 IS

BEGIN

Output(0) <= Input(1) AND (NOT Input(1));
Output(1) <= Input(0);
Output(2) <= Input(1);
Output(3) <= Input(2);

END TypeArchitecture;