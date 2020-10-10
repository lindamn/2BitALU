library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity three_input_and is
    port (
        i0, i1, i2: in std_logic;
        f: out std_logic
    );
end entity;

architecture arch of three_input_and is
    begin
        process is begin
            wait on i0, i1, i2;
            f <= i0 and i1 and i2;
    end process;
end architecture;