module mux_2x1 #(parameter W=8) (
    input select,
    input [W-1:0] in0,
    input [W-1:0] in1,
    output [W-1:0] out
);

assign out = select ? in1 : in0;

endmodule