module ActualToDraw(grid, x_out, y_out, colour_in, colour_out, clk, resetn);
    input [1:0] grid [2:0][2:0];
    input [2:0] colour_in;
    input clk, resetn;
    wire [7:0] x;
    wire [6:0] y;
    output [7:0] x_out;
    output [6:0] y_out;
    output [2:0] colour_out;
    assign colour_out = colour_in;
    reg [3:0] enable;

    always @(*) begin
        if (enable == 0) begin
            
        end

    end

    always @(posedge clk) begin
        if (~resetn) begin
            enable = 4'd0;
        end

    end
    



endmodule