module mynand(in1,in2,out);
input in1, in2;
output out;
assign out = ~(in1&in2);
endmodule

module somefunction(a,b,c,d,o);
input a, b, c, d;
output o;
wire e, f;
mynand nand1(a,b,e);
mynand nand2(c,d,f);
mynand nand3(e,f,o);
endmodule

module mux21(a,b,sel,y);
input a, b, sel;
output y;
wire y;
assign y = (sel) ? b : a;
endmodule

module decoder3x8(in,out);
input [2:0] in;
output [7:0] out;
wire [7:0] out;
assign out = (in == 3'b000) ? 8'b0000_0001:
             (in == 3'b001) ? 8'b0000_0010:
             (in == 3'b010) ? 8'b0000_0100:
             (in == 3'b011) ? 8'b0000_1000:
             (in == 3'b100) ? 8'b0001_0000:
             (in == 3'b101) ? 8'b0010_0000:
             (in == 3'b110) ? 8'b0100_0000:
             (in == 3'b111) ? 8'b1000_0000: 8'h00;
endmodule

module mux_21(a,b,sel,y);
input a, b, sel;
output y;
reg y;
always@(a or b or sel)
begin
if(sel == 1'b0) y=a;
else y=b;
end
endmodule

module decoder_3x8(in,out);
input [2:0] in;
output [7:0] out;
reg [7:0] out;
always@(in)
begin
	case (in)  
             3'b000: out = 8'b0000_0001;
             3'b001: out = 8'b0000_0010;
             3'b010: out = 8'b0000_0100;
             3'b011: out = 8'b0000_1000;
             3'b100: out = 8'b0001_0000;
             3'b101: out = 8'b0010_0000;
             3'b110: out = 8'b0100_0000;
             3'b111: out = 8'b1000_0000;
	endcase
end
endmodule

module flip_flop (clk,reset,q,d);
input clk, reset, d;
output q;
reg q;
always@(posedge clk)
begin
 if(reset == 1)
 begin
 q <= 0;
 end
 else
 begin
 q <= d;
 end
end
endmodule

module counter(clk, reset, enable, count);
input clk, reset, enable;
output [3:0] count;
reg [3:0] count;
always@(posedge clk)
if(reset == 1'b1)
begin
count <= 0;
end
else if(enable == 1'b1)
begin
count <= count + 1;
end
endmodule

module memory(clk, addr, data_in, data_out, rd, wr);
input clk, rd, wr;
input[7:0] addr;
input[7:0] data_in;
output[7:0] data_out;
reg[7:0] my_memory [0:255];
assign data_out = my_memory[addr];
always@(posedge clk) if(wr& !rd) my_memory[addr]<=data_in;
initial
begin
$readmemh("memory.list", my_memory);
end
endmodule

