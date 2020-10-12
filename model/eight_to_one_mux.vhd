library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity eight_to_one_mux is
    port(
        i0,i1,i2,i3,i4,i5,i6,i7: in std_logic;
        s0,s1,s2: in std_logic;
        f: out std_logic
    );
end entity;

architecture arch of eight_to_one_mux is
    signal nots0, nots1, nots2: std_logic;
    signal and0, and1, and2, and3, and4, and5, and6, and7: std_logic;
    begin
        NOT0: entity work.not_gate(arch) port map(s0,nots0);
        NOT1: entity work.not_gate(arch) port map(s1,nots1);
        NOT2: entity work.not_gate(arch) port map(s2,nots2);
        --and gate
        ANDi0: entity work.four_input_and(arch) port map(i0,nots0,nots1,nots2,and0);
        --or gate
        ANDi1: entity work.four_input_and(arch) port map(i1,nots0,nots1,s2,and1);
        --xor gate
        ANDi2: entity work.four_input_and(arch) port map(i2,nots0,s1,nots2,and2);
        --not gate
        ANDi3: entity work.four_input_and(arch) port map(i3,nots0,s1,s2,and3);
        --add operation
        ANDi4: entity work.four_input_and(arch) port map(i4,s0,nots1,nots2,and4);
        --1s complement subtraction
        ANDi5: entity work.four_input_and(arch) port map(i5,s0,nots1,s2,and5);
        --2s complement subtraction
        ANDi6: entity work.four_input_and(arch) port map(i6,s0,s1,nots2,and6);
        --increment
        ANDi7: entity work.four_input_and(arch) port map(i7,s0,s1,s2,and7);
        --output
        ORall: entity work.eight_input_or(arch) port map(and0,and1,and2,and3,and4,and5,and6,and7,f);
end architecture;