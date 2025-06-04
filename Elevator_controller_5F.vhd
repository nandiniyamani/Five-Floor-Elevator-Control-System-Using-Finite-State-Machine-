----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.06.2025 11:34:12
-- Design Name: 
-- Module Name: Elevator_controller_5F - Behavioral
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

entity Elevator_Controller_5F is 
    Port ( 
        CLK    : in  STD_LOGIC;        -- Clock signal 
        RESET  : in  STD_LOGIC;        -- Reset signal 
        CALL1  : in  STD_LOGIC;        -- Call button for floor 1 
        CALL2  : in  STD_LOGIC;        -- Call button for floor 2 
        CALL3  : in  STD_LOGIC;        -- Call button for floor 3 
        CALL4  : in  STD_LOGIC;        -- Call button for floor 4 
        CALL5  : in  STD_LOGIC;        -- Call button for floor 5 
        FB1    : in  STD_LOGIC;        -- Elevator button for floor 1 
        FB2    : in  STD_LOGIC;        -- Elevator button for floor 2 
        FB3    : in  STD_LOGIC;        -- Elevator button for floor 3 
        FB4    : in  STD_LOGIC;        -- Elevator button for floor 4 
        FB5    : in  STD_LOGIC;        -- Elevator button for floor 5 
        FS1    : in  STD_LOGIC;        -- Floor sensor for floor 1 
        FS2    : in  STD_LOGIC;        -- Floor sensor for floor 2 
        FS3    : in  STD_LOGIC;        -- Floor sensor for floor 3 
        FS4    : in  STD_LOGIC;        -- Floor sensor for floor 4 
        FS5    : in  STD_LOGIC;        -- Floor sensor for floor 5 
        UP     : out STD_LOGIC;        -- Motor up signal 
        DOWN   : out STD_LOGIC;        -- Motor down signal 
        DO     : out STD_LOGIC;        -- Door open signal 
        DC     : out STD_LOGIC         -- Door close signal 
    ); 
end Elevator_Controller_5F; 
 
architecture Behavioral of Elevator_Controller_5F is 
 
    -- State enumeration type 
    type state_type is (S1, S2, S3, S4, S5, MOVING_UP, MOVING_DOWN); 
    signal present_state, next_state : state_type; 
 
begin 
 
    -- State Transition Process 
    process (CLK, RESET) 
    begin 
        if RESET = '1' then 
            present_state <= S1; -- Reset to idle at floor 1 
        elsif rising_edge(CLK) then 
            present_state <= next_state; -- Transition to next state 
        end if; 
    end process; 
 
    -- Next State Logic 
    process (present_state, CALL1, CALL2, CALL3, CALL4, CALL5, FB1, FB2, FB3, FB4, FB5, FS1, FS2, FS3, FS4, 
FS5) 
    begin 
        case present_state is 
            -- Idle at floor 1 
            when S1 => 
                if CALL2 = '1' or FB2 = '1' then 
                    next_state <= MOVING_UP; 
                elsif CALL3 = '1' or FB3 = '1' then 
                    next_state <= MOVING_UP; 
                elsif CALL4 = '1' or FB4 = '1' then 
                    next_state <= MOVING_UP; 
                elsif CALL5 = '1' or FB5 = '1' then 
                    next_state <= MOVING_UP; 
                else 
                    next_state <= S1; 
                end if; 
 
            -- Idle at floor 2 
            when S2 => 
                if CALL1 = '1' or FB1 = '1' then 
                    next_state <= MOVING_DOWN; 
                elsif CALL3 = '1' or FB3 = '1' then 
                    next_state <= MOVING_UP; 
                elsif CALL4 = '1' or FB4 = '1' then 
                    next_state <= MOVING_UP; 
                elsif CALL5 = '1' or FB5 = '1' then 
                    next_state <= MOVING_UP; 
                else 
                    next_state <= S2; 
                end if; 
 
            -- Idle at floor 3 
            when S3 => 
                if CALL1 = '1' or FB1 = '1' then 
                    next_state <= MOVING_DOWN; 
                elsif CALL2 = '1' or FB2 = '1' then 
                    next_state <= MOVING_DOWN; 
                elsif CALL4 = '1' or FB4 = '1' then 
                    next_state <= MOVING_UP; 
                elsif CALL5 = '1' or FB5 = '1' then 
                    next_state <= MOVING_UP; 
                else 
                    next_state <= S3; 
                end if; 
 
            -- Idle at floor 4 
            when S4 => 
                if CALL1 = '1' or FB1 = '1' then 
                    next_state <= MOVING_DOWN; 
                elsif CALL2 = '1' or FB2 = '1' then 
                    next_state <= MOVING_DOWN; 
                elsif CALL3 = '1' or FB3 = '1' then 
                    next_state <= MOVING_DOWN; 
                elsif CALL5 = '1' or FB5 = '1' then 
                    next_state <= MOVING_UP; 
                else 
                    next_state <= S4; 
                end if; 
 
            -- Idle at floor 5 
            when S5 => 
                if CALL1 = '1' or FB1 = '1' then 
                    next_state <= MOVING_DOWN; 
                elsif CALL2 = '1' or FB2 = '1' then 
                    next_state <= MOVING_DOWN; 
                elsif CALL3 = '1' or FB3 = '1' then 
                    next_state <= MOVING_DOWN; 
                elsif CALL4 = '1' or FB4 = '1' then 
                    next_state <= MOVING_DOWN; 
                else 
                    next_state <= S5; 
                end if; 
 
            -- Moving up state 
            when MOVING_UP => 
                if FS1 = '1' then 
                    next_state <= S1; 
                elsif FS2 = '1' then 
                    next_state <= S2; 
                elsif FS3 = '1' then 
                    next_state <= S3; 
                elsif FS4 = '1' then 
                    next_state <= S4; 
                elsif FS5 = '1' then 
                    next_state <= S5; 
                else 
                    next_state <= MOVING_UP; 
                end if; 
 
            -- Moving down state 
            when MOVING_DOWN => 
                if FS5 = '1' then 
                    next_state <= S5; 
                elsif FS4 = '1' then 
                    next_state <= S4; 
                elsif FS3 = '1' then 
                    next_state <= S3; 
                elsif FS2 = '1' then 
                    next_state <= S2; 
                elsif FS1 = '1' then 
                    next_state <= S1; 
                else 
                    next_state <= MOVING_DOWN; 
                end if; 
 
            -- Default case 
            when others => 
                next_state <= S1; 
        end case; 
    end process; 
 
    -- Output Logic 
    process (present_state, FS1, FS2, FS3, FS4, FS5) 
    begin 
        -- Default outputs 
        UP    <= '0'; 
        DOWN  <= '0'; 
        DO    <= '0'; 
        DC    <= '1'; 
 
        case present_state is 
            -- Idle at floors 
            when S1 => 
                if (FS1 = '1') then 
                    DO <= '1';  -- Open door 
                    DC <= '0';  -- Door closed 
                else 
                    DO <= '0';  -- Open door 
                    DC <= '1';  -- Door closed 
                end if; 
                 
            when S2 => 
                if (FS2 = '1') then 
                    DO <= '1';  -- Open door 
                    DC <= '0';  -- Door closed 
                else 
                    DO <= '0';  -- Open door 
                    DC <= '1';  -- Door closed 
                end if; 
                 
            when S3 => 
                if (FS3 = '1') then 
                    DO <= '1';  -- Open door 
                    DC <= '0';  -- Door closed 
                else 
                    DO <= '0';  -- Open door 
                    DC <= '1';  -- Door closed 
                end if; 
             
            when S4 => 
                if (FS4 = '1') then 
                    DO <= '1';  -- Open door 
                    DC <= '0';  -- Door closed 
                else 
                    DO <= '0';  -- Open door 
                    DC <= '1';  -- Door closed 
                end if; 
             
            when S5 => 
                if (FS5 = '1') then 
                    DO <= '1';  -- Open door 
                    DC <= '0';  -- Door closed 
                else 
                    DO <= '0';  -- Open door 
                    DC <= '1';  -- Door closed 
                end if; 
 
            -- Moving up 
            when MOVING_UP => 
                UP <= '1';  -- Move up 
                DC <= '1';  -- Door closed 
 
            -- Moving down 
            when MOVING_DOWN => 
                DOWN <= '1'; -- Move down 
                DC   <= '1'; -- Door closed 
 
            -- Default case 
            when others => 
                UP    <= '0'; 
                DOWN  <= '0'; 
                DO    <= '0'; 
                DC    <= '1'; 
        end case; 
    end process; 
 
end Behavioral;
