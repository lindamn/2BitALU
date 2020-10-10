library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity four_to_one_mux is
    port(
        i0,i1,i2,i3: in std_logic;
        s0, s1: in std_logic;
        f: out std_logic
    );
end entity;

architecture arch of four_to_one_mux is
    signal nots0, nots1: std_logic;
    signal and0, and1, and2, and3: std_logic;
    begin
        NOT0: entity work.not_gate(arch) port map(s0,nots0);
        NOT1: entity work.not_gate(arch) port map(s1,nots1);
        --add
        ANDi0: entity work.three_input_and(arch) port map(i0,nots0,nots1,and0);
        --unused
        ANDi1: entity work.three_input_and(arch) port map(i1,nots0,s1,and1);
        --2s complement
        ANDi2: entity work.three_input_and(arch) port map(i2,s0,nots1,and2);
        --increment
        ANDi3: entity work.three_input_and(arch) port map(i3,s0,s1,and3);
        ORall: entity work.four_input_or(arch) port map(and0,and1,and2,and3,f);
end architecture;