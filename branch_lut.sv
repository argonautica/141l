module branch_lut (
    input branch_lut_en,
    input [4:0] key,
    output logic [11:0] branch_pos
);

always_comb begin
    if (branch_lut_en) begin
        case (key)
            5'b00000: branch_pos = 12'd4; // 3*9
            5'b00001: branch_pos = 12'd6; // 
            5'b00010: branch_pos = 12'd45; // DONE
            5'b00011: branch_pos = 12'd14; // INNERLOOP
            5'b00100: branch_pos = 12'd34; // INCREMENTJ
            5'b00101: branch_pos = 12'd38; // INCREMENTI

            default: branch_pos = 12'b0;
        endcase
    end
    else
        branch_pos = 0; // stay same
end
endmodule