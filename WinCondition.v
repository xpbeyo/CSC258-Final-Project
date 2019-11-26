module WinCondition(grid, winner, end_signal);
    // player one has chess O, player two has chess X.
    input [1:0] grid [2:0][2:0];  // 2'd1 represents O, 2'd2 represents X, 2'd0 represents empty.
    output reg [1:0] winner;  // who win the game, 2'b00:undetermine, 2'b01: first player, 2'b10: second player, 2'b11: draw.
    output reg end_signal;  // 0 if not end, 1 if end.
    wire check_full;  // 0 if not full, 1 if full.

    SpaceFull space_detector(.grid(grid[17:0]), .full(check_full));
	always @(*) begin
		if ((grid[2][2] == 2'd1 && grid[2][1] == 2'd1 && grid[2][0] == 2'd1) ||  // horizontal
			  (grid[1][2] == 2'd1 && grid[1][1] == 2'd1 && grid[1][0] == 2'd1) ||
			  (grid[0][2] == 2'd1 && grid[0][1] == 2'd1 && grid[0][0] == 2'd1) ||
			  (grid[2][2] == 2'd1 && grid[1][2] == 2'd1 && grid[0][2] == 2'd1) ||  // vertical
			  (grid[2][1] == 2'd1 && grid[1][1] == 2'd1 && grid[0][1] == 2'd1) ||
			  (grid[2][0] == 2'd1 && grid[1][0] == 2'd1 && grid[0][0] == 2'd1) ||
			  (grid[2][2] == 2'd1 && grid[1][1] == 2'd1 && grid[0][0] == 2'd1) ||  // diagonal
			  (grid[2][0] == 2'd1 && grid[1][1] == 2'd1 && grid[0][2] == 2'd1)) begin
					winner = 2'b01;
					end_signal = 1'b1;
			end
	

		else if ((grid[2][2] == 2'd2 && grid[2][1] == 2'd2 && grid[2][0] == 2'd2) ||  // horizontal
			  (grid[1][2] == 2'd2 && grid[1][1] == 2'd2 && grid[1][0] == 2'd2) ||
			  (grid[0][2] == 2'd2 && grid[0][1] == 2'd2 && grid[0][0] == 2'd2) ||
			  (grid[2][2] == 2'd2 && grid[1][2] == 2'd2 && grid[0][2] == 2'd2) ||  // vertical
			  (grid[2][1] == 2'd2 && grid[1][1] == 2'd2 && grid[0][1] == 2'd2) ||
			  (grid[2][0] == 2'd2 && grid[1][0] == 2'd2 && grid[0][0] == 2'd2) ||
			  (grid[2][2] == 2'd2 && grid[1][1] == 2'd2 && grid[0][0] == 2'd2) ||  // diagonal
			  (grid[2][0] == 2'd2 && grid[1][1] == 2'd2 && grid[0][2] == 2'd2)) begin
					winner = 2'b10;
					end_signal = 1'b1;
			  end
		else begin
            winner = 2'b00;
            end_signal = 1'b0;
		end

		if (winner == 2'b00 && check_full == 1'b1) begin
            winner = 2'b11;
            end_signal = 1'b1;
		end
	end
endmodule

module SpaceFull(grid, full);
    input [1:0] grid [2:0][2:0];  // 2'd1 represents O, 2'd2 represents X, 2'd0 represents empty.
    output reg full;  // 0 represents not full, 1 represents full.
	always @(*) begin
        if (grid[0][0] != 2'd0 && grid[0][1] != 2'd0 && grid[0][2] != 2'd0 &&
            grid[1][0] != 2'd0 && grid[1][1] != 2'd0 && grid[1][2] != 2'd0 &&
            grid[2][0] != 2'd0 && grid[2][1] != 2'd0 && grid[2][2] != 2'd0)
                full = 1'b1;
        else full = 1'b0;
	end
endmodule
