module branch_lut (
    input branch_lut_en,
    input logic[1:0] program_num,
    input [4:0] key,
    output logic [11:0] branch_pos
);



always_comb begin
    if (branch_lut_en) begin
        case(program_num)
            2'b01: begin
                case (key)
                    5'b00000: branch_pos = 12'd4; // 3*9
                    5'b00001: branch_pos = 12'd6; // 
                    5'b00010: branch_pos = 12'd69; // DONE
                    5'b00011: branch_pos = 12'd16; // INNERLOOP
                    5'b00100: branch_pos = 12'd55; // INCREMENTJ
                    5'b00101: branch_pos = 12'd59; // INCREMENTI
                    5'b00110: branch_pos = 12'd52; // GREATERTHAN
                    // 5'b00111: branch_pos = 12'd47; // LESSTHAN
                    default: branch_pos = 12'b0;
                endcase

            end
            2'b10: begin
                case (key)
                    5'b00000: branch_pos = 12'd4; // 3*9
                    5'b00001: branch_pos = 12'd6; //, 1
                    5'b00010: branch_pos = 12'd140; // DONE, 2
                    5'b00011: branch_pos = 12'd18; // INNERLOOP 3
                    5'b00100: branch_pos = 12'd124; // INCREMENTJ 4
                    5'b00101: branch_pos = 12'd129; // INCREMENTI 5
                    5'b00110: branch_pos = 12'd53; // GREATERTHAN 6
                    5'b00111: branch_pos = 12'd98; // CMPMIN 7 
                    5'b01000: branch_pos = 12'd106; // CMPMAX    8
                    5'b01001: branch_pos = 12'd114; // SETMIN 9
                    5'b01010: branch_pos = 12'd119; // SETMAX 10
                    5'b01011: branch_pos = 12'd75; // SEQ 2 11
                    5'b01100: branch_pos = 12'd87; // INVERT 12
                    5'b01101: branch_pos = 12'd83; // MSBCHECK 13
                    // 5'b00111: branch_pos = 12'd47; // LESSTHAN
                    default: branch_pos = 12'b0;
                endcase
            end
            2'b11: begin
                case(key)
                    5'b00000: branch_pos = 12'd4; // 3*9
                    5'b00001: branch_pos = 12'd6; //, 1
                    5'b00010: branch_pos = 12'd69; // DONE, 2
                    5'b00011: branch_pos = 12'd16; // INNERLOOP 3
                    5'b00100: branch_pos = 12'd55; // INCREMENTJ 4
                    5'b00101: branch_pos = 12'd59; // INCREMENTI 5
                    5'b00110: branch_pos = 12'd52; // GREATERTHAN 6
                    // 5'b00111: branch_pos = 12'd47; // LESSTHAN
                    default: branch_pos = 12'b0;
                endcase
            end
			default: begin
				branch_pos = 12'b0;
			end
        endcase
    end
    else
        branch_pos = 0; // stay same
end
endmodule

// always_comb begin
//     if (branch_lut_en) begin
        // case (key)
        //     5'b00000: branch_pos = 12'd4; // 3*9
        //     5'b00001: branch_pos = 12'd6; // 
        //     5'b00010: branch_pos = 12'd69; // DONE
        //     5'b00011: branch_pos = 12'd16; // INNERLOOP
        //     5'b00100: branch_pos = 12'd55; // INCREMENTJ
        //     5'b00101: branch_pos = 12'd59; // INCREMENTI
        //     5'b00110: branch_pos = 12'd52; // GREATERTHAN
        //     // 5'b00111: branch_pos = 12'd47; // LESSTHAN

        //     default: branch_pos = 12'b0;
        // endcase
//     end
//     else
//         branch_pos = 0; // stay same
// end
// endmodule