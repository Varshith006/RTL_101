1.VECTOR 0

module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); 
 assign outv = vec;
    assign   o0 = vec[0];
    assign   o1 = vec[1];
    assign   o2 = vec[2];
    

endmodule

2.VECTOR 1

`default_nettype none   
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
   
    
    assign out_hi = in[15:8];
    assign out_lo = in[7:0];
endmodule

3.VECTOR 2

`default_nettype none

module top_module( 
    input [31:0] in,
    output [31:0] out );//

    assign out[7:0] = in[31:24];
    assign out[15:8] = in[23:16];
    assign out[23:16] = in[15:8];
    assign out[31:24] = in[7:0];
endmodule

4.VECTOR GATES

module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
 assign out_or_bitwise = a|b;
    assign out_or_logical = a||b;
    assign out_not[5:3]   = ~b; //this is bitwise not
    assign out_not[2:0]   = ~a;
endmodule

5.GATES 4

module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and = in[3] && in[2] && in[1] && in[0];
    assign out_or = in[3] || in[2] || in[1] || in[0];
    assign out_xor = in[3] ^ in[2] ^ in[1] ^ in[0];
endmodule

6.VECTOR 3

module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
    wire [31:0] concat_reg; //raise an error when work with reg. Reason unknown???
    assign concat_reg = {a[4:0], b[4:0], c[4:0], d[4:0], e[4:0], f[4:0], 2'b11};
    assign w = concat_reg[31:24];
    assign x = concat_reg[23:16];
    assign y = concat_reg[15:8];
    assign z = concat_reg[7:0];

endmodule

7.VECTORR

module top_module( 
    input [7:0] in,
    output [7:0] out
);
assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};
endmodule

8.VECTOR 4

module top_module (
    input [7:0] in,
    output [31:0] out );//

    // assign out = { replicate-sign-bit , the-input };
assign out = { {24{in[7]}} , in[7:0] };
endmodule

9.VECTOR 5

module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
assign out = ~{ {5{a}},{5{b}},{5{c}},{5{d}},{5{e}}} ^ { {5{a,b,c,d,e}}};
endmodule
