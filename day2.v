1. STEP ONE 

module top_module( output one );

// Insert your code here
    assign one = 1;

endmodule


2. ZERO

module top_module(
    output zero
);// Module body starts after semicolon

endmodule

3. WIRE

module top_module( input in, output out );
assign out=in;
endmodule

4. WIRE4  

module top_module( 
    input a,b,c,
    output w,x,y,z );
assign w=a;
    assign x=b;
        assign y=b;
            assign z=c;
endmodule
