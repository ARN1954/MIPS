
# MIPS Project

## Introduction to MIPS

MIPS (Microprocessor without Interlocked Pipeline Stages) is a Reduced Instruction Set Computer (RISC) architecture. It's known for its simplicity and efficiency, making it a popular choice for educational purposes and embedded systems. This project likely involves simulating or working with MIPS assembly language.

A key step in working with MIPS is often converting assembly code into a `.hex` format. This format is commonly used to load programs into simulators or hardware implementations of MIPS processors. The `.hex` file represents the program's instructions in a hexadecimal format suitable for memory loading.

## 5-Stage Pipeline

MIPS architecture often employs a 5-stage pipeline to improve performance. This pipeline consists of the following stages:

1.  **Instruction Fetch (IF):** Fetches the instruction from memory.
2.  **Instruction Decode (ID):** Decodes the instruction and reads the registers.
3.  **Execute (EX):** Performs the ALU operation.
4.  **Memory Access (MEM):** Accesses memory if required.
5.  **Write Back (WB):** Writes the result back to the register file.

Pipelining allows multiple instructions to be in different stages of execution simultaneously, increasing throughput.

## Key Features

*   **RISC Architecture:** Simplified instruction set for faster execution.
*   **Load/Store Architecture:** Memory access is limited to load and store instructions.
*   **Fixed Instruction Length:** Instructions are typically 32 bits long.
*   **General-Purpose Registers:** MIPS has 32 general-purpose registers for storing data.

## Opcode Table (Example)

| Opcode (Hex) | Instruction | Description                                       |
| :----------- | :---------- | :------------------------------------------------ |
| 0x00         | R-type      | Register-to-register operations (add, sub, etc.) |
| 0x02         | j           | Jump                                              |
| 0x04         | beq         | Branch if equal                                   |
| 0x05         | bne         | Branch if not equal                               |
| 0x08         | addi        | Add immediate                                     |
| 0x09         | addiu       | Add immediate unsigned                            |
| 0x0c         | andi        | AND immediate                                     |
| 0x0d         | ori         | OR immediate                                      |
| 0x0f         | lui         | Load upper immediate                              |
| 0x23         | lw          | Load word                                         |
| 0x2b         | sw          | Store word                                        |
| 0x3f         | halt         | Halt Instruction (custom)                         |

> **Note:** This table is not exhaustive and may need to be extended based on the specific instructions used in your project.  Refer to a comprehensive MIPS reference for a complete listing.

## Example Programs

### Example 1

This example demonstrates basic arithmetic operations and the `jal` (jump and link) instruction.

*   Lines 0-2 initialize registers `$1`, `$2`, and `$3` with the values 10, 20, and 25, respectively.
*   Lines 3, 4, and 6 execute jump and link instructions, jumping to a subroutine.
*   Line 5 adds the contents of registers `$1` and `$2` and stores the result (30) in `$4`.
*   Line 7 adds the contents of registers `$4` and `$3` and stores the result (55) in `$5`.
*   Line 8 executes the `halt` instruction, ending the program.

> **Note:** Replace this with the actual output of the program (e.g., register values, memory contents) if run in a simulator or on actual hardware.  Include an image if possible.

![Example 1 Output](example1_output.png)

### Example 2

This example demonstrates more basic arithmetic operations.

*   Line 0 initializes register `$1` with the value 120.
*   Line 2 adds the value in register `$1` to `$2` (assuming `$2` is initially 0).
*   Line 4 adds the immediate value 45 to the current value in `$2`.
*   Line 6 adds the unsigned immediate value 1 to the value in `$1` and stores the result in `$2`.
*   Line 8 halts the program execution.

assembly
Address	Hex Instruction	Binary	MIPS Assembly	Description	Effect
0	32'h28010078	0010 1000 0000 0001 0000 0000 0111 1000	addi $1, $0, 120	Add immediate 120 to $0, store in $1	R1 = 120
1	32'h0cc77800	0000 1100 1100 0111 0111 1000 0000 0000	nop	No Operation	No effect
2	32'h20220000	0010 0000 0010 0010 0000 0000 0000 0000	add $2, $1, $2	Add registers $1 and $2, store in $2	R2 = R1 + R2
3	32'h0cc77800	0000 1100 1100 0111 0111 1000 0000 0000	nop	No Operation	No effect
4	32'h2842002D	0010 1000 0100 0010 0000 0000 0010 1101	addi $2, $2, 45	Add immediate 45 to $2, store in $2	R2 = R2 + 45
5	32'h0cc77800	0000 1100 1100 0111 0111 1000 0000 0000	nop	No Operation	No effect
6	32'h24220001	0010 0100 0010 0010 0000 0000 0000 0001	addiu $2, $1, 1	Add immediate unsigned 1 to $1, store in $2	R2 = R1 + 1
7	32'h0cc77800	0000 1100 1100 0111 0111 1000 0000 0000	nop	No Operation	No effect
8	32'hFC000000	1111 1100 0000 0000 0000 0000 0000 0000	halt	Halt instruction (custom)	End program
## Build Instructions

>  Provide detailed instructions on how to build your MIPS project.  This might include commands for assembling the code, linking object files, and creating an executable.  Specify any required tools or dependencies.  For example:

> 
> MIPS-Project/
> ├── src/          # Source code files
> │   └── main.s    # Main assembly file
> ├── include/      # Header files (if any)
> ├── lib/          # Libraries (if any)
> ├── build/        # Build artifacts (object files, executables)
> ├── docs/         # Documentation
> ├── examples/     # Example programs
> ├── README.md     # This file
> └── LICENSE       # License information
> 