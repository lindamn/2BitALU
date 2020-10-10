library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add is
    port(
        a,b: in std_logic;--first bit and second bit to be added
        cin: in std_logic; --carry in
        s: out std_logic; -- sum
        cout: out std_logic --carry out
    );
end entity;

architecture arch of add is
    signal x: std_logic;
    signal y: std_logic;
    signal z: std_logic;
    begin
        aXORb: entity work.xor_gate(arch) port map(a,b,x);
        sum: entity work.xor_gate(arch) port map(x,cin,s);
        cinANDaXORb: entity work.and_gate(arch) port map(cin,x,y);
        aANDb: entity work.and_gate(arch) port map(a,b,z);
        carryOut: entity work.or_gate(arch) port map (y,z,cout);
end architecture;
        
