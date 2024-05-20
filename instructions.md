# LUT Operations
| Instruction | Type Bit | Opcode | Example             | Notes                                |
|-------------|----------|--------|---------------------|--------------------------------------|
| BLT         | 1        | 000    | BLT 5 ⇔ 1_000_00101 | Branch if less than                   |
| BGT         | 1        | 001    | BGT 5 ⇔ 1_001_00101 | Branch if greater than                |
| BEQ         | 1        | 010    | BEQ 5 ⇔ 1_010_00101 | Branch if equal                       |
| BCH         | 1        | 011    | BRANCH 5 ⇔ 1_011_00101 | Unconditional branch                  |
| ACC         | 1        | 100    | ACC 5 ⇔ 1_100_00101 | Set Acc to  |


# NON-LUT Operations
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
