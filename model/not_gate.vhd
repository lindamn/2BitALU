library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- not gate; for s3 (011)

entity not_gate is
    port (r : in std_logic; s : out std_logic) ;
end entity ;

architecture arch of not_gate is
    begin
        process is begin
            wait on r;
            s <= not r;
	    end process;
end architecture ;