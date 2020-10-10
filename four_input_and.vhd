library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity four_input_and is
    port (
        i0, i1, i2, i3: in std_logic;
        f: out std_logic
    );
end entity;

architecture arch of four_input_and is
    begin
        process is begin
            wait on i0, i1, i2, i3;
            f <= i0 and i1 and i2 and i3;
    end process;
end architecture;