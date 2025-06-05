# Write an FSM that checks if a given bit stream is divisible by 5

module (
     input clk,
     input rst_n,
     input bit_stream,
     output reg isDivisibleBy5
);

parameter SIZE = 3;
reg [SIZE-1:0] state, next_state;
always@(posedge clk or negedge rst_n) begin
     if(!rst_n)
          state <= 0;
     else
          state <= next_state;
end

always@(*) begin
     case(state)
          3'b000: next_state = bit_stream ? 3'b001 : 3'b000; // 0
          3'b001: next_state = bit_stream ? 3'b010 : 3'b001; // 1
          3'b010: next_state = bit_stream ? 3'b011 : 3'b010; // 2
          3'b011: next_state = bit_stream ? 3'b100 : 3'b011; // 3
          3'b100: next_state = bit_stream ? 3'b101 : 3'b100; // 4
          default: next_state = state;
     endcase

     isDivisibleBy5 = (next_state == 3'b000);
endmodule