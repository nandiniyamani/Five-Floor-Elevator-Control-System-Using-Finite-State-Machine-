# 🛗 Five-Floor Elevator Control System using FSM (Finite State Machine)

## 📌 Overview

This project implements a **finite state machine (FSM)-based control system** for a five-floor elevator, designed as part of academic coursework at the **University of South Florida**. The system manages elevator movement, floor selection, and door operations through well-defined states and transitions, emphasizing both **efficiency** and **safety**.

---

## 🧠 Abstract

A finite state machine (FSM) model is used to design a control logic for a five-floor elevator system. The system consists of **seven key states**—five idle states (one for each floor) and two movement states (MOVING_UP and MOVING_DOWN). This FSM manages real-time elevator operations such as processing user requests, directing the elevator between floors, and safely handling door mechanisms. The transitions are triggered by floor call requests (`CALLx`), internal button selections (`FBx`), and position sensors (`FSx`). Simulation results confirm the FSM's robustness in efficiently handling concurrent requests, reducing delay, and ensuring safe operations.

---

## ⚙️ FSM Structure

### 🟦 States

- **S1 – S5:** Idle states (Elevator stopped at floors 1 to 5)
- **MOVING_UP:** Transition state when moving upward
- **MOVING_DOWN:** Transition state when moving downward

### 📥 Inputs

| Signal | Description                          |
|--------|--------------------------------------|
| CALLx  | External call request from floor x   |
| FBx    | Floor button pressed inside elevator |
| FSx    | Floor sensor (current position)      |
| DO/DC  | Door open/close control              |

### 🔄 Transitions

- Elevator moves from idle to movement state upon receiving a valid request.
- MOVING_UP or MOVING_DOWN transitions back to an idle state upon reaching the target floor.
- Request priority is based on direction and position to minimize unnecessary movement.

---
### state diagram
----
![FSM Diagram](gallery/fsm.png)

## 🛠 Features

- ✅ **Seven-state FSM for dynamic control**
- 🔄 **Smooth state transitions** based on real-time input
- 🧭 **Request direction logic** avoids zigzagging between floors
- 🕒 **Efficient simulation** with reduced latency
- 🚪 **Safe door operations**, managed by state transitions
- 🔌 **Tested on Xilinx Vivado**, targeting Artix-7 FPGA

---


---

## 🧪 Simulation Results

- ✅ Successfully completed **100% test coverage** across all seven states.
- ⚡ Reduced delay during multiple simultaneous request conditions.
- 🧠 Handles edge cases such as:
  - Repeated floor selections
  - Requests during door transitions
  - Movement interruptions

---

## 📚 Tools & Technologies

- 💻 **Language:** VHDL
- 🧪 **Simulation:** Xilinx Vivado Simulator
- ⚙️ **Target Device:** Artix-7 FPGA (xc7a35tcpg236-1)

---

## 🏁 Conclusion

The FSM-based elevator controller provides a reliable, scalable, and safety-aware solution to multi-floor elevator operation. It successfully simulates real-world elevator behavior, minimizes delay, and handles user requests effectively.

---



