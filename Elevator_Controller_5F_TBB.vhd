----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.06.2025 11:38:43
-- Design Name: 
-- Module Name: Elevator_Controller_5F_TBB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Elevator_Controller_5F_TBB is -- Testbench does not have ports 
end Elevator_Controller_5F_TBB; 
 
architecture Behavioral of Elevator_Controller_5F_TBB is 
 
    -- Component declaration 
    component Elevator_Controller_5F 
        Port ( 
            CLK    : in  STD_LOGIC; 
            RESET  : in  STD_LOGIC; 
            CALL1  : in  STD_LOGIC; 
            CALL2  : in  STD_LOGIC; 
            CALL3  : in  STD_LOGIC; 
            CALL4  : in  STD_LOGIC; 
            CALL5  : in  STD_LOGIC; 
            FB1    : in  STD_LOGIC; 
            FB2    : in  STD_LOGIC; 
            FB3    : in  STD_LOGIC; 
            FB4    : in  STD_LOGIC; 
            FB5    : in  STD_LOGIC; 
            FS1    : in  STD_LOGIC; 
            FS2    : in  STD_LOGIC; 
            FS3    : in  STD_LOGIC; 
            FS4    : in  STD_LOGIC; 
            FS5    : in  STD_LOGIC; 
            UP     : out STD_LOGIC; 
            DOWN   : out STD_LOGIC; 
            DO     : out STD_LOGIC; 
            DC     : out STD_LOGIC 
        ); 
    end component; 
 
    -- Testbench signals 
    signal CLK    : STD_LOGIC := '0'; 
    signal RESET  : STD_LOGIC := '0'; 
    signal CALL1  : STD_LOGIC := '0'; 
    signal CALL2  : STD_LOGIC := '0'; 
    signal CALL3  : STD_LOGIC := '0'; 
    signal CALL4  : STD_LOGIC := '0'; 
    signal CALL5  : STD_LOGIC := '0'; 
    signal FB1    : STD_LOGIC := '0'; 
    signal FB2    : STD_LOGIC := '0'; 
    signal FB3    : STD_LOGIC := '0'; 
    signal FB4    : STD_LOGIC := '0'; 
    signal FB5    : STD_LOGIC := '0'; 
    signal FS1    : STD_LOGIC := '0'; 
    signal FS2    : STD_LOGIC := '0'; 
    signal FS3    : STD_LOGIC := '0'; 
    signal FS4    : STD_LOGIC := '0'; 
    signal FS5    : STD_LOGIC := '0'; 
    signal UP     : STD_LOGIC; 
    signal DOWN   : STD_LOGIC; 
    signal DO     : STD_LOGIC; 
    signal DC     : STD_LOGIC; 
 
    -- Clock generation 
    constant CLK_PERIOD : time := 10 ns; 
 
begin 
 
    -- Instantiate the Unit Under Test (UUT) 
    UUT: Elevator_Controller_5F 
        Port map ( 
            CLK    => CLK, 
            RESET  => RESET, 
            CALL1  => CALL1, 
            CALL2  => CALL2, 
            CALL3  => CALL3, 
            CALL4  => CALL4, 
            CALL5  => CALL5, 
            FB1    => FB1, 
            FB2    => FB2, 
            FB3    => FB3, 
            FB4    => FB4, 
            FB5    => FB5, 
            FS1    => FS1, 
            FS2    => FS2, 
            FS3    => FS3, 
            FS4    => FS4, 
            FS5    => FS5, 
            UP     => UP, 
            DOWN   => DOWN, 
            DO     => DO, 
            DC     => DC 
        ); 
 
    -- Clock generation 
    CLK_Process : process 
    begin 
        CLK <= '0'; 
        wait for CLK_PERIOD / 2; 
        CLK <= '1'; 
        wait for CLK_PERIOD / 2; 
    end process; 
 
    -- Stimulus process 
    Stimulus : process 
    begin 
        -- Test reset condition 
        RESET <= '1'; 
        wait for 20 ns; 
        RESET <= '0'; 
 
        -- Test moving to floor 3 from floor 1 
        CALL3 <= '1'; 
        wait for 40 ns; 
        CALL3 <= '0'; 
 
        -- Simulate arrival at floor 3 
        FS3 <= '1'; 
        wait for 20 ns; 
        FS3 <= '0'; 
 
        -- Test moving to floor 5 
        CALL5 <= '1'; 
        wait for 40 ns; 
        CALL5 <= '0'; 
 
        -- Simulate arrival at floor 5 
        FS5 <= '1'; 
        wait for 20 ns; 
        FS5 <= '0'; 
 
        -- Test moving back to floor 1 
        CALL1 <= '1'; 
        wait for 40 ns; 
        CALL1 <= '0'; 
 
        -- Simulate arrival at floor 1 
        FS1 <= '1'; 
        wait for 20 ns; 
        FS1 <= '0'; 
 
        -- Test button inside the elevator for floor 4 
        FB4 <= '1'; 
        wait for 40 ns; 
        FB4 <= '0'; 
 
        -- Simulate arrival at floor 4 
        FS4 <= '1'; 
        wait for 20 ns; 
        FS4 <= '0'; 
 
        -- Test simultaneous calls to floor 2 and 5 
        CALL2 <= '1'; 
        CALL5 <= '1'; 
        wait for 40 ns; 
        CALL2 <= '0'; 
        CALL5 <= '0'; 
 
        -- Simulate arrival at floor 2 
        FS2 <= '1'; 
        wait for 20 ns; 
        FS2 <= '0'; 
 
        -- Simulate arrival at floor 5 
        FS5 <= '1'; 
        wait for 20 ns; 
        FS5 <= '0'; 
 
        -- End simulation 
        wait; 
    end process; 
 
end Behavioral; 
