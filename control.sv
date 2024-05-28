module control (
    input [8:0] inst,
    input logic z, // zero flag
    input logic c, // carry flag
    input logic n, // negative flag
    input logic v, // overflow flag
    output logic memory_read_en,
    output logic memory_write_en,
    output logic reg_write_en,
    output logic [3:0] reg_write_number, // index of register to write to
    output logic reg_to_reg, // if 1, write to reg_write_number from reg_from_number
    output logic branch_en,
    output logic fetch_acc_en,
    // output logic [4:0] branch_key,
    // output logic [4:0] acc_key,
    output logic [3:0] reg_from_number // index of register to read from if reg to reg transfer
    // output [7:0] write_value;

);

always_comb begin
   
    
    reg_write_en = 0;
    reg_write_number = 0; // accumulator
    reg_to_reg = 0;
    branch_en = 0;
    memory_write_en = 0;
    fetch_acc_en = 0;
    reg_from_number = 0;
    memory_read_en = 0;

    if (inst[8]) begin
       case (inst[7:5])
            3'b000: begin
                // BLT
                if (n) begin
                    if (~z) begin
                        branch_en = 1;
                        // branch_key = inst[4:0];
                    end
                end
            end
            3'b001: begin
                // BGT
                if (~n) begin
                    if (~z) begin
                        branch_en = 1;
                        // branch_key = inst[4:0];
                    end
                end
            end
            3'b010: begin
                // BEQ
                if (z) begin
                    branch_en = 1;
                    // branch_key = inst[4:0];
                end
            end
            3'b011: begin
                // UNCONDITIONAL
                branch_en = 1;
                // branch_key = inst[4:0];
            end
            3'b100: begin
                // ACC
                // acc_key = inst[4:0];
                fetch_acc_en = 1;
                reg_write_en = 1;
                reg_write_number = 0;
                
            end
            default: begin
                
            end
       endcase
    end else begin
        case(inst[7:4])
            4'b0000: begin
                // LOAD
                memory_read_en = 1;
                reg_write_en = 1;
                reg_write_number = 0;
                reg_from_number = inst[3:0];
            end
            4'b0001: begin
                // STORE
                memory_write_en = 1;
                reg_from_number = inst[3:0];
            end
				4'b1010: begin
                    // cmp
					reg_write_en = 0;
					reg_from_number = inst[3:0];
				end
            4'b1100: begin
                // acc to reg
                reg_write_en = 1;
                reg_to_reg = 1;
                reg_write_number = inst[3:0];
                reg_from_number = 0;

            end
            4'b1101: begin
                // reg to acc
                reg_write_en = 1;
                reg_to_reg = 1;
                reg_write_number = 0;
                reg_from_number = inst[3:0];
            end
            default: begin
                reg_write_en = 1;
                memory_write_en = 0;
                reg_write_number = 0;
                reg_from_number = inst[3:0];
            end
        endcase
    end
end
endmodule