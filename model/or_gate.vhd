library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- or gate; for s1 (001)

entity or_gate is
    port (r,s : in std_logic; t : out std_logic) ;
end entity ;

architecture arch of or_gate is
    begin
        process is begin
            wait on r,s;
            t <= r or s;
	end process;
end architecture ;