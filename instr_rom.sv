// Create Date:    2017.01.25 
// Design Name: 
// Module Name:    InstROM 
// Description: Verilog module -- instruction ROM 	
//
module instr_ROM #(parameter A=10, W=9) (
  input       [A-1:0] instr_address,
  input logic[1:0] program_num,
  output logic[W-1:0] instr_out);
	 
// need $readmemh or $readmemb to initialize all of the elements
// declare ROM array
  logic[W-1:0] inst_rom[2**(A)];

  initial begin
//      $display("read from program %d", program_num);
		$readmemb("L:/Desktop/141l-main/141l-main/programs/p2_full_out.txt", inst_rom);
  end
    
// read from it
  always_comb instr_out = inst_rom[instr_address];

endmodule