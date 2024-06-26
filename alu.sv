module alu(
  input logic optype,
  input[10:0] pc,
  input [3:0] OP,
  input [7:0] acc_in,
  input [7:0] reg_in,
  input c_in,
  output logic [7:0] OUT,
  output logic z, // zero flag
  output logic c, // carry flag
  output logic n, // negative flag
  output logic v // overflow flag
);

integer i;
always_latch begin
//  z = 0;
//  c = 0;
//  n = 0;
//  v = 0;
  OUT = 0;
  c = c_in;
  if (optype == 1'b0) begin
    case (OP)
      4'b0010:  begin
        {c, OUT} = acc_in + reg_in + c_in;
      end
      4'b0011: {c, OUT} = acc_in - reg_in;
      4'b0100: OUT = acc_in << reg_in;
      4'b0101: OUT = acc_in >> reg_in;
      4'b0110: OUT = acc_in & reg_in;
      4'b0111: OUT = acc_in | reg_in;
      4'b1000: OUT = acc_in ^ reg_in;
      4'b1001: begin
        // popcnt
        OUT = 0;
          for (i = 0; i < 8; i = i + 1) begin
            if (reg_in[i]) begin
              OUT = OUT + 1;
            end
          end
          if (OUT > 8) begin
          end
			 end
      4'b1011: begin 
        // clearflags
        c = 0;
      end

    endcase
  end
end

always_latch begin
  if (OP == 4'b1010) begin
			// $display("acc, %d, reg: %d", acc_in, reg_in);
        if (acc_in > reg_in) begin
          z = 0;
          n = 0;
        end else if (acc_in < reg_in) begin
          z = 0;
          n = 1;
        end else begin
          z = 1;
          n = 0;
        end
      end
end
endmodule