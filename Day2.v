// Design and verify various flavours of a D flip-flop
// input     logic      clk,
//input     logic      reset,

//input     logic      d_i,         -> D input to the flop

//output    logic      q_norst_o,   -> Q output from non-resettable flop
//output    logic      q_syncrst_o, -> Q output from flop using synchronous reset
//output    logic      q_asyncrst_o -> Q output from flop using asynchrnoous reset

module dff(
     input d_i,
     output q_norst_o,
     output q_syncrst_o,
     output q_asyncrst_o,
     input clk,
     input reset
);
//No reset
always@ (posedge clk) begin
     q_norst_o <= d_i;

end

//Synchronous reset
always@(posedge clk) begin
     if (reset)
          q_syncrst_o <= 1'b0;
     else 
          q_syncrst_o <= d_i;

end

//Asynchronous reset
always@(posedge clk or posedge reset) begin
     if(reset)
          q_asyncrst_o <= 1'b0;
     else
          q_asyncrst_o <= d_i;


end



endmodule