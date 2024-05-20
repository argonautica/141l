module branch_lut (
    input branch_lut_en,
    input [4:0] key,
    output logic [11:0] branch_pos
);

always_comb begin
    if (branch_lut_en) begin
        case (key)
            5'b00000: branch_pos = 12'd27; // 3*9
            default: branch_pos = 12'b0;
        endcase
    end
    else
        branch_pos = 0; // stay same
end
endmodule