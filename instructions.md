# LUT Operations

| Instruction | Type Bit | Opcode |
|-------------|----------|--------|
| BLT         | 1        | 000    |
| BGT         | 1        | 001    |
| BEQ         | 1        | 010    |
| BRANCH      | 1        | 011    |
| ACC         | 1        | 100    |

# NON-LUT Operations

| Instruction | Type Bit | Opcode | Reg     |
|-------------|----------|--------|---------|
| LOAD        | 0        | 0000   | Reg     |
| STORE       | 0        | 0001   | Reg     |
| ADD         | 0        | 0010   | Reg     |
| SUB         | 0        | 0011   | Reg     |
| SHL         | 0        | 0100   | Reg     |
| SHR         | 0        | 0101   | Reg     |
| AND         | 0        | 0110   | Reg     |
| OR          | 0        | 0111   | Reg     |
| XOR         | 0        | 1000   | Reg     |
| POPCNT      | 0        | 1001   | Reg     |
| CMP         | 0        | 1010   | Reg     |
| MOV         | 0        | 1011   | Reg     |
| ACC TO REG  | 0        | 1100   | Reg     |
| REG TO ACC  | 0        | 1101   | Reg     |


