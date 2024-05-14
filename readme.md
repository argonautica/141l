





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

