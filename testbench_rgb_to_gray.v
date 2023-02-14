`timescale 10ps/1ps

module testbench_rgb_to_gray ();
	parameter HEIGHT_RGB = 1153;
	parameter WIDTH_RGB = 2048; 
	parameter CHANNEL_RGB = 3;
	
	reg [7:0] mem_rgb [0: (WIDTH_RGB * HEIGHT_RGB * CHANNEL_RGB) - 1]; 
	reg [7:0] R,G,B;
	reg clk, reset; 
	wire [7:0] out; 
	wire done;
	reg [7:0] mem_gray [0: (WIDTH_RGB * HEIGHT_RGB)-1];
	
	rgb_to_gray  rgb(.clk(clk),.reset(reset), .R(R), .G(G), .B(B) , .out(out), .done(done));
	reg [31:0]i,j;
	initial begin 
		forever begin 
			#1 clk = ~clk;
		end
	end
	
	always @(posedge clk) begin 
		if (reset) begin 
			i<=0;
			j<=0;
		end
	end
	
	always @(posedge clk ) begin 
		R <= mem_rgb[i];
		G <= mem_rgb[i+1];
		B <= mem_rgb[i+2];
	end
	
	always @ (posedge clk) begin  
		if (done == 1'b1) begin 
			if (i <= ((WIDTH_RGB * HEIGHT_RGB * CHANNEL_RGB) - 1 - 2)) begin 
							i<=i+3;
							j<=j+1; 
							mem_gray[j] <= out; 
			end
			else begin 
				if (i > ((WIDTH_RGB * HEIGHT_RGB * CHANNEL_RGB) - 1 - 2)) begin 
						$writememb("bai2_out",mem_gray);
						$stop;
				end
			end
		end
	end
	
	initial begin 
		$readmemb("bai2_in",mem_rgb );	
		clk =0; 
		reset=1;
		#2 reset=0;
	end
endmodule
