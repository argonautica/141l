import re
import argparse

# Define the opcode dictionary
OPCODES = {
    'BLT':  ('1', '000'),
    'BGT':  ('1', '001'),
    'BEQ':  ('1', '010'),
    'BCH':  ('1', '011'),
    'ACC':  ('1', '100'),
    'LOAD': ('0', '0000'),
    'STORE':('0', '0001'),
    'ADD':  ('0', '0010'),
    'SUB':  ('0', '0011'),
    'SHL':  ('0', '0100'),
    'SHR':  ('0', '0101'),
    'AND':  ('0', '0110'),
    'OR':   ('0', '0111'),
    'XOR':  ('0', '1000'),
    'POPCNT':('0', '1001'),
    'CMP':  ('0', '1010'),
    'MOV':  ('0', '1011'),
    'AR':   ('0', '1100'),
    'RA':   ('0', '1101')
}

def assemble_line(line):
    # Remove comments and extra spaces, make lowercase
    line = re.sub(r'//.*', '', line).strip().lower()
    if not line:
        return None
    
    parts = line.split()
    instr = parts[0].upper()
    if instr not in OPCODES:
        raise ValueError(f"Unknown instruction: {instr}")
    
    type_bit, opcode = OPCODES[instr]
    operand = int(parts[1]) if len(parts) > 1 else 0
    
    if type_bit == '1':
        # LUT operations use 5-bit operand
        operand_bin = format(operand, '05b')
        machine_code = f"{type_bit}{opcode}{operand_bin}"
    else:
        # Non-LUT operations use 4-bit operand
        operand_bin = format(operand, '04b')
        machine_code = f"{type_bit}{opcode}{operand_bin}"
    
    return machine_code

def assemble_file(input_file, output_file):
    with open(input_file, 'r') as f:
        lines = f.readlines()
    
    machine_codes = []
    for line in lines:
        try:
            machine_code = assemble_line(line)
            if machine_code:
                machine_codes.append(machine_code)
        except ValueError as e:
            print(e)
    
    with open(output_file, 'w') as f:
        for code in machine_codes:
            f.write(code + '\n')

def main():
    parser = argparse.ArgumentParser(description="Assemble a text file of instructions into machine code.")
    parser.add_argument("filename", help="The base name of the input file (without _in.txt or _out.txt).")
    
    args = parser.parse_args()
    input_file = f"{args.filename}.txt"
    output_file = f"{args.filename}_out.txt"
    
    assemble_file(input_file, output_file)
    print(f"Assembly complete. Output written to {output_file}")

if __name__ == "__main__":
    main()
