module Prime_Number_Generator_Single(d_possible, clk);

parameter n = 512;  // Limit for a prime number
parameter m = 5;    // How many bits the value needs

output reg [(2*m)-1:0] d_possible;

input clk;            // Added clk  
integer k=0;          // Holder variable

wire [(m-1):0]possible_primes[(n-1):0];
wire [(m-1):0]primes[(n-1):0];

// Fill with numbers
genvar i,j, h;
generate
  for(i=0; i<n; i=i+1)begin 

      assign possible_primes[i]=i+2;
    end // for i
       
// Sort through the numbers to find the prime numbers    
  for(h=0; h<n; h=h+1)begin 
    for(j=2; j<(n/2); j=j+1)begin
        
        assign primes[h]=possible_primes[h]*(possible_primes[h]%j!=0 | possible_primes[h]==j);        
        
      end // for j

  end // for h   
   
endgenerate

// Output random prime numbers 
always @(posedge clk) begin
  if(primes[k]>0)
    d_possible=primes[k];
   
    k=k+1;
    if(k==(n+1))  k=0;
  
end // always block
      
endmodule
