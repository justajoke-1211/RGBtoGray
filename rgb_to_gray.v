module rgb_to_gray (clk,reset, R, G, B, out, done);
	input clk, reset;
	input [7:0]R,G,B;
	output [7:0]out;
	output done;
	wire out_e;
	
	rgb_to_gray_controller controller (.clk(clk), .reset(reset), .out_e(out_e), .done(done));
	rgb_to_gray_datapath datapath (.out_e(out_e), .R(R),.G(G),.B(B), .out(out));
endmodule

module rgb_to_gray_datapath (out_e, R,G,B , out);
	input [7:0] R,G,B;
	input out_e;
	output [7:0] out;
	wire [7:0] gray_out;
	wire [23:0] r,g,b, weight_r, weight_g, weight_b;
	wire [47:0] gray;
	assign r= {R,16'b0};
	assign g= {G,16'b0};
	assign b= {B,16'b0};
		
	assign weight_r=24'b000000000100110010001011;
	assign weight_g=24'b000000001001011001000110;
	assign weight_b=24'b000000000001110100101111;
		
	assign gray=weight_r*r + weight_g*g + weight_b*b;
	assign gray_out= gray[47:32];
	bufif1 buff [7:0] (out, gray_out, out_e);

endmodule

module rgb_to_gray_controller (clk,reset,out_e, done);
	input clk, reset;
	output reg out_e, done;
	reg [2:0] current_state, next_state;
	
	always @ (posedge clk ) begin 
		if (reset)
			current_state <=0;
		else 
			current_state <= next_state;
	end

	
	always @* begin 
		done <= 0;
		case ( current_state ) 
			3'b000: out_e<=0;
			3'b001:	begin 
							out_e <= 1;
							done <= 1;
						end
		endcase
	end
	
	always @* begin 
		case ( current_state ) 
			3'b000: next_state <= current_state + 1;
			3'b001: next_state <= 0;
		endcase
	end

endmodule
