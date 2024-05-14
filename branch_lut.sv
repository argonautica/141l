module branch_lut (
    input lut_en,
    input [4:0] key,
    output [10:0] branch_pos
)

always_comb begin
    if (branch_en) begin
        case (key):
            default: branch_pos = 11'b0;
        endcase
    end
end
endmodule