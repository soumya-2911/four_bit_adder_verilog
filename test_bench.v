`include "module.v"

module test_bench;
    reg [3:0] a,b;
    wire [3:0] sum;
    wire carry;

    four_bit_add f(carry, sum, a, b, 1'b0);
    initial begin
        $dumpfile("four_bit_add.vcd");
        $dumpvars(0,f);
        $monitor ($time,"a=%h, b=%h, sum=%h, carry=%b",a,b,sum,carry);
        #5 a=4'hA;b=4'hA;
        #5 a=4'hB;b=4'h2;
        #5 $finish;
    end
endmodule