library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port (
        s0,s1,s2: in std_logic; --0 is most significant, 2 is least significant
        i0,i1: in std_logic; --first 2 bit input
        j0,j1: in std_logic; --second 2 bit input
        k0,k1: out std_logic; --2 bit output
        cout: out std_logic --carry out
    );
end entity alu;

architecture structural of alu is
    signal cout1,cout2,cout3,cout4: std_logic;
    signal bout1,bout2: std_logic;
    signal temp1,temp2,temp3: std_logic;
    signal and0, and1: std_logic;
    signal or0, or1: std_logic;
    signal xor0, xor1: std_logic;
    signal not0, not1, not2, not3: std_logic;
    signal add0, add1: std_logic;
    signal inc0, inc1: std_logic;
    signal sub1s0, sub1s1, sub1s0temp, sub1s1temp: std_logic;
    signal sub2s0, sub2s1: std_logic;
    signal addcout, inccout, sub1scout, sub2scout: std_logic;
    signal bit02s, bit12s: std_logic;
    signal trash1: std_logic;
    begin
        --and operation
        bit0AND: entity work.and_gate(arch) port map(i0,j0,and0);
        bit1AND: entity work.and_gate(arch) port map(i1,j1,and1);
        --or operation
        bit0OR: entity work.or_gate(arch) port map(i0,j0,or0);
        bit1OR: entity work.or_gate(arch) port map(i1,j1,or1);
        --xor operation
        bit0XOR: entity work.xor_gate(arch) port map(i0,j0,xor0);
        bit1XOR: entity work.xor_gate(arch) port map(i1,j1,xor1);
        --not operation
        bit0NOT: entity work.not_gate(arch) port map(i0,not0);
        bit1NOT: entity work.not_gate(arch) port map(i1,not1);
        --add operation
        bit0ADD: entity work.add(arch) port map(i1,j1,'0',add1,cout1);
        bit1ADD: entity work.add(arch) port map(i0,j1,cout1,add0,addcout);
        --1s complement
        j01SCOMPLEMENT: entity work.not_gate(arch) port map(j1,not2);
        j11SCOMPLEMENT: entity work.not_gate(arch) port map(j0,not3);
        bit0SUB1s: entity work.add(arch) port map(i1,not3,'0',sub1s1temp,bout1);
        bit1SUB1s: entity work.add(arch) port map(i0,not2,bout1,sub1s0temp,sub1scout);
        addCOUT: entity work.add(arch) port map(sub1s1temp,sub1scout,'0',sub1s1,cout4);
        addCOUT2: entity work.add(arch) port map(sub1s0temp,'0',cout4,sub1s0,trash1);
        --2s complement
        bit0PLUS1: entity work.add(arch) port map(not3,'1','0',bit02s,cout3);
        bit1PLUS1: entity work.add(arch) port map(not2,cout3,'0',bit12s,temp3);
        bit0SUB2s: entity work.add(arch) port map(i1,bit02s,'0',sub2s1,bout2);
        bit1SUB2s: entity work.add(arch) port map(i0,bit12s,bout2,sub2s0,sub2scout);
        --inc operation
        bit0INC: entity work.add(arch) port map(i1,'1','0',inc1,cout2);
        bit1INC: entity work.add(arch) port map(i0,cout2,'0',inc0,inccout);
        --1st bit in mux
        bit0MUX: entity work.eight_to_one_mux(arch) port map(and1,or1,xor1,not1,add1,sub1s1,sub2s1,inc1,s0,s1,s2,k1);
        --2nd bit in mux
        bit1MUX: entity work.eight_to_one_mux(arch) port map(and0,or0,xor0,not0,add0,sub1s0,sub2s0,inc0,s0,s1,s2,k0);
        --cout in mux
        coutMUX: entity work.four_to_one_mux(arch) port map(addcout,sub1scout,'0',inccout,s1,s2,cout);
end architecture structural;