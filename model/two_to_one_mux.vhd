library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux2to1 is
    port(
        i0,i1: in std_logic;
        s: in std_logic;
        f: out std_logic
    );
end entity;

architecture twoToOne of mux2to1 is
    signal notS: std_logic;
    signal temp1,temp2: std_logic;
    begin
        NOTs: entity work.not_gate(arch) port map(s,notS);
        i0ANDNOTs: entity work.and_gate(arch) port map(i0,notS,temp1);
        i1ANDs: entity work.and_gate(arch) port map(i1,s,temp2);
        result: entity work.or_gate(arch) port map(temp1,temp2,f);
end architecture;