module register_file (
  input  logic        clk, rst, RegWriteW,
  input  logic [4:0]  A1, A2, RdW,
  input  logic [31:0] ResultW,
  output logic [31:0] RD1, RD2
);
  logic [31:0] Registers[31:0];

  initial begin
	$readmemh("register.mem", Registers);
  end

   assign RD1 = Registers[A1];   
   assign RD2 = Registers[A2];

always_comb begin
  $writememh("register.mem",Registers);
end

  integer i;
  always_ff @(posedge clk) begin
    if (rst) begin
      for(i = 0; i < 32; i=i+1)
        Registers[i] <= 32'd0;
    end else if (RegWriteW && (|RdW)) begin
      Registers[RdW] <= ResultW;
    end
  end

endmodule
