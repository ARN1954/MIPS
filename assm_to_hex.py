import re

opcode_map = {
    'ADD':  '000000',
    'SUB':  '000001',
    'AND':  '000010',
    'OR':   '000011',
    'SLT':  '000100',
    'MUL':  '000101',

    'ADDI': '001010',
    'SUBI': '001011',
    'SLTI': '001100',
    'MULI': '001101',
    'LW':   '001000',
    'SW':   '001001',
    'BEQZ': '001110',
    'BNEQZ':'001101',
    'HLT':  '111111',
    'NOP':  '00000000000000000000000000000000'
}

def reg_to_bin(reg):
    reg = re.sub(r'[^\d]', '', reg)  # Extract only digits
    reg_num = int(reg)
    return format(reg_num, '05b')

def imm_to_bin(imm, bits):
    # Handle offset(base) format for SW/LW
    if '(' in imm:
        offset, base = imm.split('(')
        base = base.replace(')', '')
        offset = int(offset)
        base_num = int(re.sub(r'[^\d]', '', base))
        return format(offset, '016b')  # For simplicity, using offset only
    try:
        imm = re.sub(r'[^0-9\-]', '', imm)
        imm = int(imm)
        if imm < 0:
            imm = (1 << bits) + imm
        return format(imm, f'0{bits}b')
    except ValueError:
        raise ValueError(f"Invalid immediate value: {imm}")

def assemble_line(line):
    line = line.split('//')[0].strip()  # Remove comments
    if not line:
        return None

    # Special handling for SW/LW with memory access syntax
    if line.upper().startswith(('SW ', 'LW ')):
        parts = re.split(r'[,\s]+', line, maxsplit=2)
        if len(parts) < 3:
            raise ValueError(f"{parts[0]} requires 2 operands (rt, offset(base))")
        instr = parts[0].upper()
        rt = parts[1].strip()
        mem_access = parts[2].strip()
        
        # Parse offset(base) format
        if '(' in mem_access and ')' in mem_access:
            offset, base = mem_access.split('(')
            base = base.replace(')', '').strip()
            offset = offset.strip()
            imm_bin = imm_to_bin(offset, 16)
            return (opcode_map[instr] + 
                   reg_to_bin(base) + 
                   reg_to_bin(rt) + 
                   imm_bin)
        else:
            raise ValueError(f"Invalid memory access format: {mem_access}")
    
    # Normal instruction processing
    tokens = [t.strip() for t in re.split(r'[,\s]+', line) if t.strip()]
    if not tokens:
        return None

    instr = tokens[0].upper()
    
    if instr == 'NOP':
        return opcode_map['NOP']
    if instr == 'HLT':
        return opcode_map[instr] + '0' * 26

    try:
        if instr in ['ADD', 'SUB', 'AND', 'OR', 'SLT', 'MUL']:
            if len(tokens) != 4:
                raise ValueError(f"{instr} requires 3 operands")
            rd, rs, rt = tokens[1], tokens[2], tokens[3]
            return (opcode_map[instr] + reg_to_bin(rs) + reg_to_bin(rt) + 
                    reg_to_bin(rd) + '0' * 11)
        
        elif instr in ['ADDI', 'SUBI', 'SLTI', 'MULI', 'BEQZ', 'BNEQZ']:
            if len(tokens) != 4:
                raise ValueError(f"{instr} requires 3 operands")
            rt, rs, imm = tokens[1], tokens[2], tokens[3]
            imm_bin = imm_to_bin(imm, 16)
            return opcode_map[instr] + reg_to_bin(rs) + reg_to_bin(rt) + imm_bin
        
        else:
            raise ValueError(f"Unknown instruction: {instr}")
    except Exception as e:
        raise ValueError(f"Error processing line: {line}\n{str(e)}")

def assemble_file(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            hex_instr = assemble_line(line)
            if hex_instr:
                outfile.write(hex_instr + '\n')

if __name__ == "__main__":
    assemble_file('eg_1.asm', 'mem.h')
    print("✅ Assembly successful!")