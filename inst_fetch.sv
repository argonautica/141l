module inst_fetch #(parameter PC_WIDTH=11)(	  // PC width -- up to 32, if you like
  input                reset,		  // reset, init, etc. -- force PC to 0 
                       start,		  // begin next program in series (request issued by test bench)
                       clk,			  // PC can change on pos. edges only
                       branch_en,	  // branch enabled
                      //  branch_abs,	  // jump conditionally to Target value	   
                      //  branch_rel,	  // jump conditionally to Target + PC
                      //  ALU_flag,	  // flag from ALU, e.g. Zero, Carry, Overflow, Negative (from ARM)
  input        [PC_WIDTH-1:0] target,	      // jump ... "how high?"
  output logic [PC_WIDTH-1:0] pc        // the program counter register itself
  );

  always_ff @(posedge clk) begin
    if (reset) begin
      pc <= 0;
    end else if (start) begin
      pc <= 0; // fill in for program number (not pc)
    end else if (branch_en) begin
      pc <= target;
    end else begin
      pc <= pc + 1;
    end
  end
  endmodule