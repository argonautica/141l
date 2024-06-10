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
            5'b00100: value = 8'd64; // 64
            5'b00101: value = 8'd65; // 65
            5'b00110: value = 8'd66; // 66
            5'b00111: value = 8'b10000000; // MSB SET
            
            default: value = 8'b0;
        endcase
    end else
        value = 0;

end
endmodule