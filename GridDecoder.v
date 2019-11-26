module GridDecoder(grid, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
    input [1:0] grid [2:0][2:0];
    output reg [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	always @(*) begin
		HEX5 = 7'b1111111;
		HEX4 = 7'b1111111;
		HEX3 = 7'b1111111;
		HEX2 = 7'b1111111;
		HEX1 = 7'b1111111;
		HEX0 = 7'b1111111;
        if (grid[0][0] == 2'd1)
            HEX5[0] = 1'b0;
        else if (grid[0][0] == 2'd2) 
            HEX2[0] = 1'b0;
        if (grid[0][1] == 2'd1)
            HEX4[0] = 1'b0;
        else if (grid[0][1] == 2'd2) 
            HEX1[0] = 1'b0;
        if (grid[0][2] == 2'd1)
            HEX3[0] = 1'b0;
        else if (grid[0][2] == 2'd2) 
            HEX0[0] = 1'b0;
        if (grid[1][0] == 2'd1)
            HEX5[6] = 1'b0;
        else if (grid[1][0] == 2'd2) 
            HEX2[6] = 1'b0;
        if (grid[1][1] == 2'd1)
            HEX4[6] = 1'b0;
        else if (grid[1][1] == 2'd2) 
            HEX1[6] = 1'b0;
        if (grid[1][2] == 2'd1)
            HEX3[6] = 1'b0;
        else if (grid[1][2] == 2'd2) 
            HEX0[6] = 1'b0;
        if (grid[2][0] == 2'd1)
            HEX5[3] = 1'b0;
        else if (grid[2][0] == 2'd2) 
            HEX2[3] = 1'b0;
        if (grid[2][1] == 2'd1)
            HEX4[3] = 1'b0;
        else if (grid[2][1] == 2'd2) 
            HEX1[3] = 1'b0;
        if (grid[2][2] == 2'd1)
            HEX3[3] = 1'b0;
        else if (grid[2][2] == 2'd2) 
            HEX0[3] = 1'b0;
	end
endmodule
