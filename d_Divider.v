// Ended up not needing "n" based off of the block diagram
module d_Divider(d, e, L);
  
  parameter size =4;
  output [((size*2)-1):0]d;
  input [(size-1):0]e;
  input [((size*2)-1):0]L;
  
  parameter k=2;  //Can assign k as any integer so long as its smaller than L
  
  assign d=((k*L)+1)/e;
  
endmodule