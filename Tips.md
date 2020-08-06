# Some useful tips

## Vector

Vectors must be declared as:

``` verilog
type [upper:lower] vector_name;
```

Here are some examples:

``` verilog
wire [7:0] w;         // 8-bit wire
reg  [4:1] x;         // 4-bit reg
output reg [0:0] y;   // 1-bit reg that is also an output port (this is still a vector)
input wire [3:-2] z;  // 6-bit wire input (negative ranges are allowed)
output [3:0] a;       // 4-bit output wire. Type is 'wire' unless specified otherwise.
wire [0:7] b;         // 8-bit wire where b[0] is the most-significant bit.
```

* notice that the negative ranges are allowed
* writing `vec[0:3]` when *vec* is declared `wire [3:0] vec` is illegal

Implicit nets

``` verilog
wire [2:0] a, c;   // Two vectors
assign a = 3'b101;  // a = 101
assign b = a;       // b =   1  implicitly-created wire
assign c = b;       // c = 001  <-- bug
my_module i1 (d,e); // d and e are implicitly one-bit wide if not declared.
                    // This could be a bug if the port was intended to be a vector.
```

Unpacked vs. Packed Arrays

``` verilog
reg [7:0] mem [255:0];   // 256 unpacked elements, each of which is a 8-bit packed vector of reg.
reg mem2 [28:0];         // 29 unpacked elements, each of which is a 1-bit reg.
```

Part-Select

``` verilog
w[3:0]      // Only the lower 4 bits of w
x[1]        // The lowest bit of x
x[1:1]      // ...also the lowest bit of x
z[-1:-2]    // Two lowest bits of z
b[3:0]      // Illegal. Vector part-select must match the direction of the declaration.
b[0:3]      // The *upper* 4 bits of b.
assign w[3:0] = b[0:3];    // Assign upper 4 bits of b to lower 4 bits of w. w[3]=b[0], w[2]=b[1], etc.
```

Concatenation operator

``` verilog
input [15:0] in;
output [23:0] out;
assign {out[7:0], out[15:8]} = in;         // Swap two bytes. Right side and left side are both 16-bit vectors.
assign out[15:0] = {in[7:0], in[15:8]};    // This is the same thing.
assign out = {in[7:0], in[15:8]};       // This is different. The 16-bit vector on the right is extended to
                                        // match the 24-bit vector on the left, so out[23:16] are zero.
                                        // In the first two examples, out[23:16] are not assigned.
```

Bitwise Operator (2.2.4)

A bitwise operation between two N-bit vectors replicates the operation for each bit of the vector and produces a N-bit output, while a logical operation treats the entire vector as a boolean value (true = non-zero, false = zero) and produces a 1-bit output.

bitwise: ```|```
operation: ```||```

Replication Operator (2.2.8)

Examples:

```verilog
{5{1'b1}}           // 5'b11111 (or 5'd31 or 5'h1f)
{2{a,b,c}}          // The same as {a,b,c,a,b,c}
{3'd5, {2{3'd6}}}   // 9'b101_110_110. It's a concatenation of 101 with
                    // the second vector, which is two copies of 3'b110.
```

## Modules Hierachy

Connecting Signals to Module Ports

By position

``` verilog
mod_a instance1(wa, wb, wc);
```

By name

``` verilog
mod_a instance2( .out(wc), .in1(wa), .in2(wb));
```

## Procedures (Always block)

   [casez explaination](https://hdlbits.01xz.net/wiki/Always_casez)

   3.1.2.3 9-to-1 mux: another way to write default in case block

``` verilog
always @(*) begin
    out = '1;       // '1 is a special literal syntax for a number with all bits set to 1.
                    // '0, 'x, and 'z are also valid.
                    // I prefer to assign a default value to 'out' instead of using a
                    // default case.
    case (sel)
        ...
    endcase
end
```

3.2.1 Several Edge Detectors

3.2.2 Several Counters

3.2.3.4 A systmetic way to write SR

**3.2.4.3 Conway's Game:**
The idea is to extend the top row of the original map with the lasp row, vice versa. In this case, I found that the up, down, left, right indices are associated with certain bit shift with unique pattern. The up/down right and up/down left are with some symmetric pattern shift.

**3.2.5 FSM CODING STANDARD**
A finite state machine is usually coded in three parts:

* State transition logic
* State flip-flops
* Output logic

It is sometimes possible to combine one or more of these blobs of code
together, but be careful: Some blobs are combinational circuits, while some are clocked (DFFs)

A sample version can be found at 3.2.5.1
