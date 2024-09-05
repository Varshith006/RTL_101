1.D flip-flop
module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//
    always @ (posedge clk) begin
    	q <= d;
    
    end

endmodule

2.D flip-flops

module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
     always @ (posedge clk) begin
    	q <= d;
    end

endmodule

3.DFF with reset

module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    always @ (posedge clk) begin
        //this is an active high  synchronous reset
        if (reset) q<=8'b0;
        else q <= d;
    end

endmodule

4.DFF with reset value

module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    always @ (negedge clk) begin
        //this is an active high  synchronous reset
        if (reset==1'b1) q<=8'h34;
        else q <= d;
    end

endmodule

5.DFF with asynchronous reset

module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
     always @ (posedge clk or posedge areset ) begin
        //this is an active high  asynchronous reset
        if (areset==1'b1) q<= 1'b0;
        else q <= d;
    end

endmodule

6.DFF with byte enable

module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @ (posedge clk) begin
        //this is an active high  synchronous reset
        if (resetn==1'b0) q<= 1'b0;
        else begin
            case(byteena)
				2'b00: q       <= q;
                2'b01: q[7:0]  <= d[7:0];
                2'b10: q[15:8] <= d[15:8];
                2'b11: q       <= d;
            endcase
        end
    end	
endmodule
7.D latch
module top_module (
    input d, 
    input ena,
    output q);
     always @ (*) begin
        if (ena) q<=d;
    end

endmodule
