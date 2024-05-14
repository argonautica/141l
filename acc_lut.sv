module acc_lut (
    input acc_lut_en,
    input logic [4:0] key,
    output [7:0] value
)

always_comb begin
    if (acc_lut_en) begin
        case (key)
            default: value = 8'b0;
        endcase
    end
end
endmodule