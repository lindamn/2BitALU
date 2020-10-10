library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_tb is
end alu_tb;

architecture behavior of alu_tb is
    component alu is
        port (
            s0,s1,s2: in std_logic; --0 is most significant, 2 is least significant
            i0,i1: in std_logic; --first 2 bit input
            j0,j1: in std_logic; --second 2 bit input
            k0,k1: out std_logic; --2 bit output
            cout: out std_logic --carry out
        );
    end component;

    signal test0: std_logic;
    signal test1: std_logic;
    signal test2: std_logic;
    signal input0: std_logic;
    signal input1: std_logic;
    signal input2: std_logic;
    signal input3: std_logic;
    signal s0,s1,s2,i0,i1,j0,j1,k0,k1,cout: std_logic;
    signal out0,out1,cout1: std_logic;
begin
    uut: alu port map(s0=>test0,s1=>test1,s2=>test2,i0=>input0,i1=>input1,j0=>input2,j1=>input3,k0=>out0,k1=>out1,cout=>cout1);
    process begin
        test0 <= '1';
        test1 <= '1';
        test2 <= '1';
        input0 <= '0';
        input1 <= '1';
        input2 <= '0';
        input3 <= '0';
        wait for 10 ns;
        assert (out0 = '1' and out1 = '0') report "Error" severity error;
        report "Done with the test." 
        severity NOTE;
        
        test0 <= '1';
        test1 <= '0';
        test2 <= '0';
        input0 <= '0';
        input1 <= '1';
        input2 <= '0';
        input3 <= '0';
        wait for 10 ns;
        assert (out0 = '0' and out1 = '1') report "Error" severity error;
        report "Done with the test." 
        severity NOTE;

        test0 <= '0';
        test1 <= '0';
        test2 <= '0';
        input0 <= '1';
        input1 <= '1';
        input2 <= '0';
        input3 <= '0';
        wait for 10 ns;
        assert (out0 = '0' and out1 = '0') report "Error" severity error;
        report "Done with the test." 
        severity NOTE;

        test0 <= '0';
        test1 <= '0';
        test2 <= '1';
        input0 <= '1';
        input1 <= '1';
        input2 <= '0';
        input3 <= '0';
        wait for 10 ns;
        assert (out0 = '1' and out1 = '1') report "Error" severity error;
        report "Done with the test." 
        severity NOTE;

        test0 <= '0';
        test1 <= '1';
        test2 <= '0';
        input0 <= '1';
        input1 <= '1';
        input2 <= '0';
        input3 <= '0';
        wait for 10 ns;
        assert (out0 = '1' and out1 = '1') report "Error" severity error;
        report "Done with the test." 
        severity NOTE;

        test0 <= '0';
        test1 <= '1';
        test2 <= '1';
        input0 <= '1';
        input1 <= '0';
        input2 <= '0';
        input3 <= '0';
        wait for 10 ns;
        assert (out0 = '0' and out1 = '1') report "Error" severity error;
        report "Done with the test." 
        severity NOTE;

        test0 <= '1';
        test1 <= '0';
        test2 <= '0';
        input0 <= '1';
        input1 <= '0';
        input2 <= '1';
        input3 <= '1';
        wait for 10 ns;
        assert (out0 = '0' and out1 = '1' and cout1 ='1') report "Error" severity error;
        report "Done with the test." 
        severity NOTE;

        test0 <= '1';
        test1 <= '0';
        test2 <= '1';
        input0 <= '1';
        input1 <= '0';
        input2 <= '1';
        input3 <= '1';
        wait for 10 ns;
        assert (out0 = '1' and out1 = '0') report "Error" severity error;
        report "Done with the test." 
        severity NOTE;

        test0 <= '1';
        test1 <= '1';
        test2 <= '0';
        input0 <= '1';
        input1 <= '0';
        input2 <= '1';
        input3 <= '1';
        wait for 10 ns;
        assert (out0 = '1' and out1 = '1') report "Error" severity error;
        report "Done with the test." 
        severity NOTE;


		wait;
    end process;
end architecture;