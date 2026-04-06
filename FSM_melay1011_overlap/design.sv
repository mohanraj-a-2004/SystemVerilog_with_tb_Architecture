module melay_1011(input logic clk,
	rst, din, output logic dout);

	typedef enum logic [1:0] {s0, s1, s2, s3} state_t;
	state_t state;

	always_ff @(posedge clk or posedge rst) begin
		if (rst) begin
			dout <= 1'b0;
			state <= s0;
		end
		else begin
			case(state)
				s0:begin
					if (din) begin
						state <= s1;
						dout <= 1'b0;
					end
					else
						dout <= 1'b0;
				end
				s1:begin
					if (~din) begin
						state <= s2;
						dout <= 1'b0;
					end
					else 
						dout <= 1'b0;
				end
				s2:begin
					if (din) begin
						state <= s3;
						dout <= 1'b0;
					end
					else begin
						state <= s0;
						dout <= 1'b0;
					end
				end
				s3:begin
					if (din) begin
						state <= s1;
						dout <= 1'b1;
					end
					else begin
						state <= s2;
						dout <= 1'b0;
					end
				end
			endcase
		end
	end

endmodule