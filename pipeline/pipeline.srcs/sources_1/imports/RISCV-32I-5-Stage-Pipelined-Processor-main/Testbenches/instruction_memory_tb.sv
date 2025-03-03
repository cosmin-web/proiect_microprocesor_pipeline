module instruction_memory_tb ();

logic [31:0] PCF,instruction;

  logic         clk;
  logic         rst;
  logic         PCSrcE, StallF;  
  logic [31:0]  PCTargetE;       


program_counter UUT (clk, rst, PCSrcE, StallF, PCTargetE, PCF);
instruction_memory dut (.PCF(PCF),.instruction(instruction));


 initial begin    
    clk<= 0;
    forever #5 clk <=~ clk;  
  end

initial begin
    
    rst<=1;
    PCSrcE<=0;
    StallF = 0;
    PCTargetE = 32'd0; 
    
    #10
    rst=0;
    PCSrcE=0; 
    StallF= 0;
    PCTargetE = 32'd10;
    
    #10
    rst=0;
    PCSrcE=0;
    StallF = 0;
    PCTargetE = 32'd20;
    
    #10
    rst=0;
    PCSrcE=0;
    StallF = 1;
    PCTargetE = 32'd30;

    #10
    rst=0;
    PCSrcE=1; 
    StallF = 0;
    PCTargetE= 32'd40;


     #10
    rst=0;
    PCSrcE=1; 
    StallF = 0;
    PCTargetE= 32'd92;


    #10
    rst=0;
    PCSrcE=0; 
    StallF = 0;
    PCTargetE = 32'd50;

    #10
    rst=0;
    PCSrcE=1;    
    StallF= 1; 
    PCTargetE = 32'd60;

    #10
    rst=1; 
    PCSrcE=1;    
    StallF = 1; 
    PCTargetE = 32'd70;

    #10        
$stop;

end

endmodule