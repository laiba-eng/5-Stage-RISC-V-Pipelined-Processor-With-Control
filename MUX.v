module mux32bit(a,b,c,sel,out);
input [31:0] a,b,c;
input [1:0] sel;
output reg [31:0] out; 
always @(*) begin 
case(sel)
2'b00 : out <= a;
2'b01 : out <= b;
2'b10 : out <= c;
default: out <=32'b0;
endcase
end
endmodule


module mux32bit2(a,b,sel,out);
input [31:0] a,b;
input  sel;
output reg [31:0] out; 
always @(*) begin 
case(sel)
1'b0 : out <= a;
1'b1 : out <= b;
default: out <=32'b0;
endcase
end
endmodule
