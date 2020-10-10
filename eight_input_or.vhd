library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity eight_input_or is
    port (
        i0, i1, i2, i3, i4, i5, i6, i7: in std_logic;
        f: out std_logic
    );
end entity;

architecture arch of eight_input_or is
    begin
        process is begin
            wait on i0, i1, i2, i3, i4, i5, i6, i7;
            f <= i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7;
    end process;
end architecture;