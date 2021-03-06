`timescale 1ns/10ps
module local_mem_bias(
	clk,
	rst,
	
	write_bias_addr,
	write_bias_data,
	write_bias_signal,
	
	read_bias_addr,
	read_bias_data,
	read_bias_signal

);
localparam maximum_bias_num=10;

input clk;
input rst;
input read_bias_signal;
input write_bias_signal;
input [15:0]write_bias_data;
input [15:0]write_bias_addr;

input [15:0]read_bias_addr;
//input [15:0]bias_addr;

output logic [15:0] read_bias_data;


logic [15:0]bias_mem_out[maximum_bias_num];
always_ff@(posedge clk or posedge rst)
begin
	if(rst)
	begin
		for(int i=0;i<=maximum_bias_num-1;i++)
		begin
			bias_mem_out[i]<=16'd0;
		end
	end
//---------------------------------------------WRITE-----------------------------------------------------
	else
	begin
		if(write_bias_signal&&write_bias_addr<=16'd9)
		begin
			bias_mem_out[write_bias_addr[3:0]]<=write_bias_data;
		end
		else begin
			for(int i=0;i<=maximum_bias_num-1;i++)
			begin
				bias_mem_out[i]<=bias_mem_out[i];
			end
		end
		
	end
end

//---------------------------------------------READ-----------------------------------------------------
always_comb
begin
	if(read_bias_signal&&read_bias_addr<=16'd9)
	begin
		read_bias_data=bias_mem_out[read_bias_addr[3:0]];
	end
	else
	begin
		read_bias_data=16'd0;
	end
end
endmodule



