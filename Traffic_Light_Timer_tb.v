
`timescale 1ns / 1ps

module testbench;

reg clk;
reg clr;
wire [5:0] lights;

Traffic_Light_Timer t1(clk, clr, lights);

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    clr = 1;
    #10 clr = 0;
    #1000 $finish;
end

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
end

endmodule
