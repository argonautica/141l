// Create Date:    2017.01.25
// Design Name:    CSE141L
// Module Name:    DataMem
// Last Update:    2022.01.13

// Memory can only read (LDR) or write (STR) on each Clk cycle, so there is a single
// address pointer for both read and write operations.
//
// Parameters:
//  - A: Address Width. This controls the number of entries in memory
//  - W: Data Width. This controls the size of each entry in memory
// This memory can hold `(2**A) * W` bits of data.
//
// WI22 is a 256-entry single-byte (8 bit) data memory.
module data_mem #(parameter W=8, A=8) (				
    input clk,
    input [W-1:0]   data_to_write,
    input [A-1:0]   addr,
    input read_enabled,
    input write_enabled,
    input reset,
    // input program_number,
    output logic [W-1:0]  data_out

);

// 8x256 two-dimensional array -- the memory itself
logic [W-1:0] core[2**A];

// reads are combinational
always_comb
  if(read_enabled) begin
    $display("Reading from memory at address %d", addr);
    data_out = core[addr];
  end else
    data_out = 0;
  
// writes are sequential

always_ff @ (posedge clk)
  if(reset) begin
    // todo: initialize memory
  end 
  else if(write_enabled)
    core[addr] <= data_to_write;
endmodule
