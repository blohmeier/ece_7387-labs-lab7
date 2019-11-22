module controller (state, transfer_sel, sender_en, ld_senderReceiver, receiver_we, set_busy, clr_busy, clk, reset, transfer, senderReceiver_eq);
	input clk, reset, transfer, senderReceiver_eq;
	output [6:0] state; //state output for debugging
	output transfer_sel, sender_en, ld_senderReceiver, receiver_we;
	output set_busy, clr_busy;

	reg [6:0] state;

// State Encoding Here
	parameter A=7’b0000000, B=7’b0101000, C=7’b0000111, D=7’b1000111, E=7’b0010000;

// Register and Combinational Transition logic here
	always @(posedge clk or posedge reset)
		begin
			if (reset == 1’b1)
				state<=A;
			else
				case (state)
				A: 	if (transfer == 1’b1)
						state <= B;
					else
						state <= A;
				B: state <= C;
				C: state <= D;
				D: 	if (senderReceiver_eq == 1’b1)
						state <= E;
					else
						state <= D;
				D: state <= E;
				E: state <= A;
				default: state <= A;
				endcase
		end
// Outputs are directly the state encoding signals
assign set_busy = state[5];
assign clr_busy = state[4];
assign ld_senderReceiver = state[3];
assign transfer_sel = state[2];
assign receiver_we = state[1];
assign sender_en = state[0];
endmodule
