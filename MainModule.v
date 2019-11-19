module MainModule(dir, grid, clk);
    // the four directions cursor can move
    // Up - 00, Down - 01, Right - 10, Left - 11
    input [1:0] dir;

    // the grid that displays tic-tac-toe
    reg output [8:0] grid;

endmodule

<<<<<<< HEAD
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
=======
module WinCondition(player, pos, winner);
    input player;  // player 0 has chess O, player 1 has chess X.
    input [8:0] pos;  // 00 represents O, 01 represents X, 10 represents empty.
    output winner;  // who win the game, 00:undetermine, 01: first player, 10: second player, 11: draw.
    wire check_full;  // 0 if not full, 1 if full.

    SpaceFull space_detector(.pos(pos[8:0]), .full(check_full));

    if (player == 1'b0) begin
        if ((pos[0] == 2'b00 && pos[1] == 2'b00 && pos[2] == 2'b00) ||  // horizontal
            (pos[3] == 2'b00 && pos[4] == 2'b00 && pos[5] == 2'b00) ||
            (pos[6] == 2'b00 && pos[7] == 2'b00 && pos[8] == 2'b00) ||
            (pos[0] == 2'b00 && pos[3] == 2'b00 && pos[6] == 2'b00) ||  // vertical
            (pos[1] == 2'b00 && pos[4] == 2'b00 && pos[7] == 2'b00) ||
            (pos[2] == 2'b00 && pos[5] == 2'b00 && pos[8] == 2'b00) ||
            (pos[0] == 2'b00 && pos[4] == 2'b00 && pos[8] == 2'b00) ||  // diagonal
            (pos[2] == 2'b00 && pos[4] == 2'b00 && pos[6] == 2'b00))
                assign winner = 2'b01;
        else assign winner = 2'b00;
    end

    else if (player == 1'b1) begin
        if ((pos[0] == 2'b01 && pos[1] == 2'b01 && pos[2] == 2'b01) ||  // horizontal
            (pos[3] == 2'b01 && pos[4] == 2'b01 && pos[5] == 2'b01) ||
            (pos[6] == 2'b01 && pos[7] == 2'b01 && pos[8] == 2'b01) ||
            (pos[0] == 2'b01 && pos[3] == 2'b01 && pos[6] == 2'b01) ||  // vertical
            (pos[1] == 2'b01 && pos[4] == 2'b01 && pos[7] == 2'b01) ||
            (pos[2] == 2'b01 && pos[5] == 2'b01 && pos[8] == 2'b01) ||
            (pos[0] == 2'b01 && pos[4] == 2'b01 && pos[8] == 2'b01) ||  // diagonal
            (pos[2] == 2'b01 && pos[4] == 2'b01 && pos[6] == 2'b01))
                assign winner = 2'b10;
        else assign winner = 2'b00;
    end

    if (winner = 2'b00 && check_full == 1'b1)
        assign winner = 2'b11;
endmodule

module SpaceFull(pos, full);
    input [8:0] pos;  // 00 represents O, 01 represents X, 10 represents empty.
    output full;  // 0 represents not full, 1 represents full.

    if (pos[0] != 10 && pos[1] != 10 && pos[2] != 10 &&
        pos[3] != 10 && pos[4] != 10 && pos[5] != 10 &&
        pos[6] != 10 && pos[7] != 10 && pos[8] != 10)
            assign full = 1'b1;
    else assign full = 1'b0;
>>>>>>> 870a50ec3e2c1cee204855ecd0b0b82d0414a4b1
endmodule