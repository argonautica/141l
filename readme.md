





Program 1

Write a program to find the least and greatest Hamming
distances among all pairs of values in an array of 32 two-byte half-words. Assume all values are
signed 16-bit (“half-word”) integers. The array of integers runs from data memory location 0 to 63.
Even-numbered addresses are MSBs, following odd addresses are LSBs, e.g. a concatenation of
addresses 0 and 1 forms a 16-bit two’s complement half-word. Write the minimum distance in
location 64 and the maximum in 65.

Instructions Needed

LOAD 
STORE
XOR
POPCNT
CMP
BLT
BGT
BEQ
ADD
SUB
ACC TO REG
REG TO ACC






Program 2


Closest and farthest arithmetic pairs -- Write a program to find the absolute values of the least and
greatest arithmetic difference among all pairs of incoming values from Program 2. Assume again that
all values are two’s complement (“signed”) 16-bit integers. The array of integers starts at location 0.
Write the absolute value of the minimum difference in locations 66-67 and the maximum in 68-69.
Format: mem[66] = MSB of smallest absolute value difference among pairs; mem[67] = LSB.
mem[68] = MSB of largest absolute value difference among pairs, mem[69] = LSB.


Instructions Needed:

LOAD
STORE
SUB
ABS
ADD
CMP
BLT
BGT
BEQ
OR 
AND
SHR
MOV




Program 3

Double-precision (16x16 bits = 32-bit product) two’s complement multiplication using shift-
and-add (a direct c=a*b – multiplication operation is not allowed, although this can be a
programming macro that breaks down into a subroutine).
Operands are stored in memory locations 0-3, 4-7, ..., 60-63, where the format is:
mem[4N+0]: most significant (signed) byte of operand AN
mem[4N+1]: least significant (unsigned) byte of operand AN
mem[4N+2]: most significant (signed) byte of operand BN
mem[4N+3]: least significant (unsigned) byte of operand BN
All of these independent variable values will be injected directly into your data memory to start
the program.
You will then return your results to data_mem 64-127, where the format is:
mem[64+4N+0]: most significant (signed) byte of product of AN * BN
mem[64+4N+1]: second (unsigned) byte of same product
mem[64+4N+2]: thrid (unsigned) byte


LOAD
STORE
SHL
ADD
CMP
BGT
BLT
BRANCh
ADD




| Instruction | Type Bit | Opcode | Example             | Notes                                |
|-------------|----------|--------|---------------------|--------------------------------------|
| BLT         | 1        | 000    | BLT 5 ⇔ 1_000_00101 | Branch if less than                   |
| BGT         | 1        | 001    | BGT 5 ⇔ 1_001_00101 | Branch if greater than                |
| BEQ         | 1        | 010    | BEQ 5 ⇔ 1_010_00101 | Branch if equal                       |
| BCH         | 1        | 011    | BRANCH 5 ⇔ 1_011_00101 | Unconditional branch                  |
| ACC         | 1        | 100    | ACC 5 ⇔ 1_100_00101 | Set Acc to  |



| Instruction | Type Bit | Opcode | Example              | Notes                                   |
|-------------|----------|--------|----------------------|-----------------------------------------|
| LOAD        | 0        | 0000   | LOAD ⇔ 0_0000_0001   | Load from memory into accumulator       |
| STORE       | 0        | 0001   | STORE ⇔ 0_0001_0001  | Store from accumulator into memory      |
| ADD         | 0        | 0010   | ADD ⇔ 0_0010_0001    | Add value in accumulator to register   |
| SUB         | 0        | 0011   | SUB ⇔ 0_0011_0001    | Subtract value in accumulator from register |
| SHL         | 0        | 0100   | SHL ⇔ 0_0100_0001    | Shift left logical with value in accumulator |
| SHR         | 0        | 0101   | SHR ⇔ 0_0101_0001    | Shift right logical with value in accumulator |
| AND         | 0        | 0110   | AND ⇔ 0_0110_0001    | Bitwise AND with value in accumulator   |
| OR          | 0        | 0111   | OR ⇔ 0_0111_0001     | Bitwise OR with value in accumulator    |
| XOR         | 0        | 1000   | XOR ⇔ 0_1000_0001    | Bitwise XOR with value in accumulator   |
| POPCNT      | 0        | 1001   | POPCNT ⇔ 0_1001_0001 | Population count (count of set bits) with value in accumulator |
| CMP         | 0        | 1010   | CMP ⇔ 0_1010_0001    | Compare value in accumulator with register |
| MOV         | 0        | 1011   | MOV ⇔ 0_1011_0001    | Move value in accumulator to register   |
| AR          | 0        | 1100   | ACC TO REG ⇔ 0_1100_0001 | Move accumulator value to register |
| RA          | 0        | 1101   | REG TO ACC ⇔ 0_1101_0001 | Move register value to accumulator    |
