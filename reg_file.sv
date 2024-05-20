module reg_file #(parameter W=8, D=4) (
    input clk, 
    write_enabled,
    input reg_to_reg,
    input[D-1:0] reg_write_number,
    input [D-1:0] reg_from_number,
    input[W-1:0] reg_write_data,
    output[W-1:0] acc_out,
    output[W-1:0] reg_out
);

logic [W-1:0] registers[2**D];

assign acc_out = registers[0];
assign reg_out = registers[reg_from_number];

always_ff @(posedge clk) begin
    if (reg_to_reg) begin
        registers[reg_write_number] <= registers[reg_from_number];
    end else
    if (write_enabled) begin
        $display("Writing to register %d", reg_write_number);
        registers[reg_write_number] <= reg_write_data;
    end
end

endmodule