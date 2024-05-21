module acc_lut (
    input acc_lut_en,
    input logic [4:0] key,
    output logic [7:0] value
);

always_comb begin
    if (acc_lut_en) begin
        case (key)
            5'b00000: value = 8'b11111111; // max
            5'b00001: value = 8'b00111111; // 63
            5'b00010: value = 8'b00000000; // 0
            5'b00011: value = 8'b00000001; // 1
            
            default: value = 8'b0;
        endcase
    end else
        value = 0;

end
endmodule