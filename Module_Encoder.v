module encoder(
  input [3:0] A,
  input reset,
  input ready,
  output reg [3:0] S
);

  always @(posedge reset or posedge ready) begin
    if (reset) begin
      S <= 4'b0000; 
    end else if (ready) begin
      S[0] <= ~A[3] & ~A[2] & A[1] & A[0] | ~A[3] & A[2] & ~A[1] | ~A[3] & A[2] & ~A[0] | A[3] & ~A[2] & ~A[0] | A[3] & A[2] & A[1];
      S[1] <= ((~A[3] & ~A[1]) | (~A[2] & ~A[1] & ~A[0]) | (~A[3] & A[2]) | (A[3] & ~A[2] & A[1] & A[0]));
      S[2] <= ((~A[3] & ~A[0]) | (~A[2] & A[1] & A[0]) | (A[3] & A[2] & A[0]));
      S[3] <= ((A[2] & ~A[1]) | (A[2] & A[0]) | (A[3] & ~A[2] & A[1]));
    end
  end

endmodule
        
module test_bench();

  reg [3:0] A;
  reg reset;
  reg ready;
  wire [3:0] S;

  encoder uut (
    .A(A),
    .reset(reset),
    .ready(ready),
    .S(S)
  );


  initial begin
  $dumpfile("Module_encoder.vcd");
  $dumpvars(0,A, S, ready, reset );
    ready = 0;
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10 
    A = 4'b0000;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10
    A = 4'b0001;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10
    A = 4'b0010;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b0011;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b0100;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b0101;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b0110;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b0111;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b1000;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b1001;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b1010;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b1011;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b1100;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b1101;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b1110;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    reset = 1;
    #10
    reset = 0; 
    ready = 0;
    #10   
    A = 4'b1111;    
    reset = 0;
    ready = 1;
    #10
    ready = 0; 
    $display("%b %b", A, S);
    #10
    $finish;
  end

endmodule
