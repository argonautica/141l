module ALU(
  input logic type,
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
  if (type == 1'b0) begin
    case (OP)
      4'0010: {c, OUT} = acc_in + reg_in;
      4'0011: {c, OUT} = acc_in - reg_in;
      4'0100: OUT = acc_in << reg_in;
      4'0101: OUT = acc_in >> reg_in;
      4'0110: OUT = acc_in & reg_in;
      4'0111: OUT = acc_in | reg_in;
      4'1000: OUT = acc_in ^ reg_in;
      4'1010: begin
        if (acc_in > reg_in) begin
          z = 0
          n = 0
        end else if (acc_in < reg_in) begin
          z = 0
          n = 1
        end else begin
          z = 1
          n = 0
        end
      end
      default: OUT = 8'b0;
    endcase
  end
end
endmodule