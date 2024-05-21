module mux_3x1 #(parameter W=8) (
    input select,
    input select2,
    input [W-1:0] in0,
    input [W-1:0] in1,
    input [W-1:0] in2,
    output [W-1:0] out
);

assign out = select ? in1 : (select2 ? in2 : in0);

endmodule