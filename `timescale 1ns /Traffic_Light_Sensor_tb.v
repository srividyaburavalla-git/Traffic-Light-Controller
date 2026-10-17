
`timescale 1ns / 1ps

module testbench;

reg clk, clr, SNS1, SNS2;
wire [1:0] TL1, TL2;

Traffic_Light_Sensor t1(clk, clr, SNS1, SNS2, TL1, TL2);

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    clr = 1;
    SNS1 = 0;
    SNS2 = 0;

    #10 clr = 0;
    #20 SNS2 = 1;
    #20 SNS2 = 0;
    #30 SNS1 = 1;
    #20 SNS1 = 0;

    #100 $finish;
end

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
end

endmodule
