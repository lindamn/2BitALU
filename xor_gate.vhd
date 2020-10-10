library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- xor gate; for s2 (010)

entity xor_gate is
    port (r,s : in std_logic; t : out std_logic) ;
end entity ;

architecture arch of xor_gate is
    begin
        process is begin
            wait on r,s;
            t <= r xor s;
	end process;
end architecture ; -- arch