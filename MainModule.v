module MainModule(dir, grid, clk);
    // the four directions cursor can move
    // Up - 00, Down - 01, Right - 10, Left - 11
    input [1:0] dir;

    // the grid that displays tic-tac-toe
    reg output [8:0] grid;

endmodule

module LoadGrid(value, select, clk);
    input [1:0] value;
    input [3:0] select;
    reg [8:0] grid;
    input clk;
    always @(posedge clk) begin
        if (select == 4'b0000)
            grid[0] = value;
        else if (select == 4'b0001)
            grid[1] = value;
        else if (select == 4'b0010)
            grid[2] = value;
        else if (select == 4'b0011)
            grid[3] = value;
        else if (select == 4'b0100)
            grid[4] = value;
        else if (select == 4'b0101)
            grid[5] = value;
        else if (select == 4'b0110)
            grid[6] = value;
        else if (select == 4'b0111)
            grid[7] = value;
        else
            grid[8] = value;                            
    end
endmodule