module reg_file #(parameter W=8, D=4) (
    input clk,
		input[10:0] pc,
    input write_enabled,
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
//        $display("Writing %d to register %d", registers[reg_from_number], reg_write_number);
        registers[reg_write_number] <= registers[reg_from_number];
    end else
    if (write_enabled) begin
//        $display("Writing %d to register %d", reg_write_data, reg_write_number);
			if (pc == 135 || pc == 144)
				$display("INCREMENT J to %d", reg_write_data);
			if (pc == 141)
				$display("INCREMENT I to %d", reg_write_data);
            if (pc == 25)
                $display("Setting MSB1 to %b", reg_write_data);
            if (pc == 30)	
                $display("Setting LSB1 to %b", reg_write_data);
            if (pc == 35)
                $display("Setting MSB2 to %b", reg_write_data);
            if (pc == 40)
                $display("Setting LSB2 to %b", reg_write_data);
//            if (pc == 48)
//                $display("Negated LSB1 and added %b", reg_write_data);
//            if (pc == 53)
//                $display("Negated MSB1 %b", reg_write_data);
            if (pc == 57)
                $display("nonabs diff lsb %b", reg_write_data);
            if (pc == 60)
                $display("nonabs diff msb %b", reg_write_data);
//            if (pc == 76)
//                $display("HAD TO NEGATE LSB %b", reg_write_data);
//            if (pc == 80)
//                $display("HAD TO NEGATE MSB %b", reg_write_data);
				if (pc == 106)
					$display("doing the negation cause MSB on samesign %b", reg_write_data);
            

					 
        registers[reg_write_number] <= reg_write_data;
    end
end

endmodule