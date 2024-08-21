

module four_bit_carry_gen (last_carry,carry,c0,a,b);
    input [3:0] a,b;
    input c0;
    output [3:0] carry;
    output last_carry;

    assign carry[0]=c0;
    assign carry[1]=a[0]&b[0] | (a[0]|b[0])&c0;
    assign carry[2]=a[1]&b[1] | (a[1]|b[1])&(a[0]&b[0] | (a[0]|b[0])&c0);
    assign carry[3]=a[2]&b[2] | (a[2]|b[2])&(a[1]&b[1] | (a[1]|b[1])&(a[0]&b[0] | (a[0]|b[0])&c0));
    assign last_carry=a[3]&b[3] | (a[3]|b[3])&(a[2]&b[2] | (a[2]|b[2])&(a[1]&b[1] | (a[1]|b[1])&(a[0]&b[0] | (a[0]|b[0])&c0)));
endmodule

module four_bit_add ( carry,sum,a,b,c0);
    input [3:0] a,b;
    input c0;
    output [3:0] sum;
    output carry;
    wire [3:0] car;
    four_bit_carry_gen s (carry,car,c0,a,b);
    assign sum = car^a^b;

endmodule