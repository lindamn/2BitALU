library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- and gate; for s0 (000)

entity and_gate is
    port (r,s : in std_logic; t : out std_logic) ;
end entity ;

architecture arch of and_gate is
    begin
        process is begin
            wait on r,s;
            t <= r and s;
	end process;
end architecture ;