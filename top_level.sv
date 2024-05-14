module top_level
(
    input clk, start,
    output logic done;
);


// Parameters
parameter PC_WIDTH = 11;
parameter REG_WIDTH = 4;

// Permissions
logic memory_read_enabled;
logic memory_write_enabled;
logic register_write_enabled;
logic branch_enabled;
logic fetch_acc_enabled;


// Register File
logic[REG_WIDTH-1:0] reg_index;
logic [REG_WIDTH-1:0] source_reg_index;
logic reg_to_reg;


// memory write stuff
logic[7:0] memory_write_addr;


logic [8:0] inst;


logic[PC_WIDTH-1:0] pc;
logic[7:0] branch_reg;
logic[10:0] branch_lut;


wire[7:0] reg_out, acc_out;
wire[7:0] reg_write_data;

logic z, c, n, v;

Control control(
    .z(z),
    .c(c),
    .n(n),
    .v(v),
    .inst(inst),
    .memory_read_en(memory_read_enabled),
    .memory_write_en(memory_write_enabled),
    .reg_write_en(register_write_enabled),
    .reg_write_number(reg_index),
    .reg_to_reg(reg_to_reg),
    .branch_en(branch_enabled),
    .fetch_acc_en(fetch_acc_enabled),
    .reg_from_number(source_reg_index),
    // .write_value(reg_write_data)
);

// Register File

reg_file reg_file(
    .clk(clk),
    .write_enabled(register_write_enabled),
    .reg_to_reg(reg_to_reg),
    .reg_write_number(reg_index),
    .reg_from_number(source_reg_index),
    .reg_write_data(reg_write_data), // fix this
    .acc_out(acc_out),
    .reg_out(reg_out)
);

instr_ROM instr_rom(
    .instr_address(pc),
    .instr_out(inst)
);

data_mem data_mem(
    .clk(clk),
    .data_to_write(acc_out),
    .addr(reg_out),
    .read_en(memory_read_enabled),
    .write_en(memory_write_enabled),
    .reset(0),
    .data_out(reg_write_data)
);

alu alu(
    .type(inst[8]),
    .OP(inst[7:4]),
    .acc_in(acc_out),
    .reg_in(reg_out),
    .OUT(reg_write_data),
    .z(z),
    .c(c),
    .n(n),
    .v(v)
);

acc_lut acc_lut(
    .acc_lut_en(fetch_acc_enabled),
    .key(inst[4:0]),
    .value(reg_write_data)
);

branch_lut branch_lut(
    .branch_lut_en(branch_enabled),
    .key(inst[4:0]),
    .branch_pos(branch_pos)
);



always_ff @(posedge clk) begin
    if (start ) begin

    end else begin
        
    end

end