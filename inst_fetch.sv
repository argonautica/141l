module InstFetch #(parameter PC_WIDTH=11)(	  // PC width -- up to 32, if you like
  input                reset,		  // reset, init, etc. -- force PC to 0 
                       start,		  // begin next program in series (request issued by test bench)
                       ckl,			  // PC can change on pos. edges only
                       branch_abs,	  // jump conditionally to Target value	   
                       branch_rel,	  // jump conditionally to Target + PC
                       ALU_flag,	  // flag from ALU, e.g. Zero, Carry, Overflow, Negative (from ARM)
  input        [T-1:0] Target,	      // jump ... "how high?"
  output logic [T-1:0] pc        // the program counter register itself
  );

  always_ff @(posedge ckl) begin
    if (reset) begin
      pc <= 0;
    end else if (start) begin
      pc <= 0; // fill in for program number (not pc)
    end else if (branch_abs) begin
      pc <= Target;
    end else if (branch_rel) begin
      pc <= pc + Target;
    end else begin
      pc <= pc + 1;
    end
  end