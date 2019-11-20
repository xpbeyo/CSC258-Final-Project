module MainModule(dir, grid, clk, confirm, pos, resetm);
    // the four directions cursor can move

    // Idle = 3'b000, Up = 3'b001, Down = 3'b010, Right = 3'b011, Left = 3'b100

    input [2:0] dir;
    input pos;
    input confirm;

    // the grid that displays tic-tac-toe
    output [8:0] grid;

endmodule

module MileStoneOne(resetn, clk, confirm, pos);
    input resetn;
    input clk;
    input confirm;
    wire ld, value;
    wire end_signal;
    wire [8:0] grid;
    FSMControl control(.clk(clk), 
    .resetn(resetn), 
    .confirm(confirm), 
    end_sig(end_signal), 
    .ld(ld), 
    .value(value));
    DataPathGrid dg(.resetn(resetn), 
    .value(value), 
    .ld(ld), 
    .address(pos), 
    .clk(clk));


endmodule
module ChangeDirection(clk, dir, move, value, resetn, current_grid);
    input clk;
    input [2:0] dir;
    input resetn;
    reg [3:0] current_grid, next_grid;
    output [3:0] current_grid;

    localparam Idle = 3'b000, Up = 3'b001, Down = 3'b010, Right = 3'b011, Left = 3'b100;

    always (*) begin
        case (current_grid)
            4'b0000: begin
                if (dir == Idle)
                    next_grid = 4'b0000;
                else if (dir == Up)
                    next_grid = 4'b0000;
                else if (dir == Down)
                    next_grid = 4'b0011;
                else if (dir == Right) 
                    next_grid = 4'b0001;
                else if (dir == Left)
                    next_grid = 4'b0000;
            end
            
            4'b0001: begin
                if (dir == Idle)
                    next_grid = 4'b0001;
                else if (dir == Up)
                    next_grid = 4'b0001;
                else if (dir == Down)
                    next_grid = 4'b0100;
                else if (dir == Right) 
                    next_grid = 4'b0010;
                else if (dir == Left)
                    next_grid = 4'b0000;
            end

            4'b0010: begin
                if (dir == Idle)
                    next_grid = 4'b0010;
                else (dir == Up)
                    next_grid = 4'b0010;
                else if (dir == Down)
                    next_grid = 4'b0101;
                else if (dir == Right) 
                    next_grid = 4'b0010;
                else if (dir == Left)
                    next_grid = 4'b0001;
            end

            4'b0011: begin
                if (dir == Idle)
                    next_grid = 4'b0011;
                else if (dir == Up)
                    next_grid = 4'b0000;
                else if (dir == Down)
                    next_grid = 4'b0110;
                else if (dir == Right) 
                    next_grid = 4'b0100;
                else if (dir == Left)
                    next_grid = 4'b0011;
            end

            4'b0100: begin
                if (dir == Idle)
                    next_grid = 4'b0100;
                else if (dir == Up)
                    next_grid = 4'b0001;
                else if (dir == Down)
                    next_grid = 4'b0111;
                else if (dir == Right) 
                    next_grid = 4'b0101;
                else if (dir == Left)
                    next_grid = 4'b0011;
            end

            4'b0101: begin
                if (dir == Idle)
                    next_grid = 4'b0101;
                else if (dir == Up)
                    next_grid = 4'b0101;
                else if (dir == Down)
                    next_grid = 4'b1000;
                else if (dir == Right) 
                    next_grid = 4'b0101;
                else if (dir == Left)
                    next_grid = 4'b0100;
            end

            4'b0110: begin
                if (dir == Idle)
                    next_grid = 4'b0110;
                else if (dir == Up)
                    next_grid = 4'b0011;
                else if (dir == Down)
                    next_grid = 4'b0110;
                else if (dir == Right) 
                    next_grid = 4'b0111;
                else if (dir == Left)
                    next_grid = 4'b0110;
            end

            4'b0111: begin
                if (dir == Idle)
                    next_grid = 4'b0111;
                else if (dir == Up)
                    next_grid = 4'b0100;
                else if (dir == Down)
                    next_grid = 4'b0111;
                else if (dir == Right) 
                    next_grid = 4'b1000;
                else if (dir == Left)
                    next_grid = 4'b0110;
            end

            4'b1000: begin
                if (dir == Idle)
                    next_grid = 4'b1000;
                else if (dir == Up)
                    next_grid = 4'b0101;
                else if (dir == Down)
                    next_grid = 4'b1000;
                else if (dir == Right) 
                    next_grid = 4'b1000;
                else if (dir == Left)
                    next_grid = 4'b0111;
            end

            default: begin
                next_grid = 4'b0000;
            end
        endcase

    end

    always @(posedge clk) begin
        if (~resetn)
            current_grid <= 4'b0000;
        else
            current_grid <= next_grid;
    end


endmodule
module FSMControl(clk, resetn, confirm, end_sig, ld, value);
    input clk;
    input resetn;
    input confirm;
    input end_sig;
    reg current_state, next_state;
    output reg ld, value;
    localparam load_one_idle = 4'd0, loa_one = 4'd1, load_b_idle = 4'd2, load_b = 4'd3, end_state = 4'd4;
    always @(posedge clk) begin
        if (~resetn) begin
            current_state <= load_one_idle;
        end
            current_state <= next_state;
    end
    always @(*) begin
        case (current_state)
            load_one_idle: begin
                if (end_sig)
                    next_state = end_state;
                else begin
                    if (confirm)
                        next_state = load_one;
                    else
                        next_state = load_one_idle;

            end
            load_one: begin
                if (end_sig)
                    next_state = end_state;
                else begin
                    if (confirm)
                        next_state = load_one;
                    else
                        next_state = load_two_idle;

            end
            load_two_idle: begin
                if (end_sig)
                    next_state = end_state;
                else begin
                    if (confirm)
                        next_state = load_two;
                    else
                        next_state = load_two_idle;

            end
            load_two: begin
                if (end_sig)
                    next_state = end_state;
                else begin
                    if (confirm)
                        next_state = load_two;
                    else
                        next_state = load_one_idle;

            end

            end_state: begin
                next_state = end_state;
            end

            default:
                next_state = load_one_idle;
        endcase


    end
    always @(*) begin
        value = 2'd0;
        ld = 1'b0;

        case (current_state):
            load_one: begin
                value = 2'd1;
                ld = 1'b1;
            end
            load_two: begin
                value = 2'd2;
                ld = 1'b1;
            end

    end

endmodule
module DataPathGrid(resetn, value, ld, address, clk);
    // active low reset
    input resetn;
    input value;
    input ld;
    input [3:0] address;
    reg output [8:0] grid;
    input clk;
    always @(posedge clk) begin
        if (~resetn)
            grid[8:0] <= 9'd000000000;
            value <= 1'd1;
        else if (ld) begin
            if (address == 4'b0000)
                grid[0] <= value;
            else if (address == 4'b0001)
                grid[1] <= value;
            else if (address == 4'b0010)
                grid[2] <= value;
            else if (address == 4'b0011)
                grid[3] <= value;
            else if (address == 4'b0100)
                grid[4] <= value;
            else if (address == 4'b0101)
                grid[5] <= value;
            else if (address == 4'b0110)
                grid[6] <= value;
            else if (address == 4'b0111)
                grid[7] <= value;
            else if (address == 4'b1000)
                grid[8] <= value; 
        end                           
    end
endmodule
module WinCondition(player, pos, winner, end_signal);
    input player;  // player 0 has chess O, player 1 has chess X.
    input [8:0] pos;  // 00 represents O, 01 represents X, 10 represents empty.
    output winner;  // who win the game, 00:undetermine, 01: first player, 10: second player, 11: draw.
    output end_signal;  // 0 if not end, 1 if end.
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
            (pos[2] == 2'b00 && pos[4] == 2'b00 && pos[6] == 2'b00)) begin
                assign winner = 2'b01;
                assign end_signal = 1'b1;
            end
        else begin
            assign winner = 2'b00;
            assign end_signal = 1'b0;
        end
    end

    else if (player == 1'b1) begin
        if ((pos[0] == 2'b01 && pos[1] == 2'b01 && pos[2] == 2'b01) ||  // horizontal
            (pos[3] == 2'b01 && pos[4] == 2'b01 && pos[5] == 2'b01) ||
            (pos[6] == 2'b01 && pos[7] == 2'b01 && pos[8] == 2'b01) ||
            (pos[0] == 2'b01 && pos[3] == 2'b01 && pos[6] == 2'b01) ||  // vertical
            (pos[1] == 2'b01 && pos[4] == 2'b01 && pos[7] == 2'b01) ||
            (pos[2] == 2'b01 && pos[5] == 2'b01 && pos[8] == 2'b01) ||
            (pos[0] == 2'b01 && pos[4] == 2'b01 && pos[8] == 2'b01) ||  // diagonal
            (pos[2] == 2'b01 && pos[4] == 2'b01 && pos[6] == 2'b01)) begin
                assign winner = 2'b10;
                assign end_signal = 1'b1;
        else begin
            assign winner = 2'b00;
            assign end_signal = 1'b0;
        end
    end

    if (winner = 2'b00 && check_full == 1'b1) begin
        assign winner = 2'b11;
        assign end_signal = 1'b1
    end
endmodule

module SpaceFull(pos, full);
    input [8:0] pos;  // 00 represents O, 01 represents X, 10 represents empty.
    output full;  // 0 represents not full, 1 represents full.

    if (pos[0] != 10 && pos[1] != 10 && pos[2] != 10 &&
        pos[3] != 10 && pos[4] != 10 && pos[5] != 10 &&
        pos[6] != 10 && pos[7] != 10 && pos[8] != 10)
            assign full = 1'b1;
    else assign full = 1'b0;
endmodule
