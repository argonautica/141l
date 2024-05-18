module alu(
  input logic optype,
  input [3:0] OP,
  input [7:0] acc_in,
  input [7:0] reg_in,
  output logic [7:0] OUT,
  output z, // zero flag
  output c, // carry flag
  output n, // negative flag
  output v // overflow flag
);

always_comb begin
  OUT = 8'b0;
  z = 0;
  c = 0;
  n = 0;
  v = 0;
  
  if (optype == 1'b0) begin
    case (OP)
      4'b0010: {c, OUT} = acc_in + reg_in;
      4'b0011: {c, OUT} = acc_in - reg_in;
      4'b0100: OUT = acc_in << reg_in;
      4'b0101: OUT = acc_in >> reg_in;
      4'b0110: OUT = acc_in & reg_in;
      4'b0111: OUT = acc_in | reg_in;
      4'b1000: OUT = acc_in ^ reg_in;
      4'b1001: 
        // popcnt
        for (int i = 0; i < 8; i = i + 1) begin
          if (reg_in[i]) begin
            OUT = OUT + 1;
          end
      end
      4'b1010: begin
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
      default: OUT = 8'b0;
    endcase
  end
end
endmodule