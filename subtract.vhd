library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity subtract is
    port(
        a,b: in std_logic; --inputs; a-b
        bin: in std_logic; --borrow in 
        d: out std_logic; --difference
        bout: out std_logic --borrow out
    );
end entity;

architecture arch of subtract is
    signal x: std_logic;
    signal y: std_logic;
    signal z: std_logic;
    signal c: std_logic;
    signal e: std_logic;
    begin
        aXORb: entity work.xor_gate(arch) port map(a,b,x);
        NOTa: entity work.not_gate(arch) port map(a,y);
        bANDNOTa: entity work.and_gate(arch) port map(b,y,z);
        difference: entity work.xor_gate(arch) port map(bin,x,d);
        NOTaXORb: entity work.not_gate(arch) port map(x,c);
        binANDNOTaXORb: entity work.and_gate(arch) port map(bin,c,e);
        borrowOut: entity work.or_gate(arch) port map(e,z,bout);

end architecture;