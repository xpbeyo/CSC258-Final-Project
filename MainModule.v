// // Part 2 skeleton

// module part2
// 	(
// 		CLOCK_50,						//	On Board 50 MHz
// 		// Your inputs and outputs here
//         KEY,
//         SW,
// 		// The ports below are for the VGA output.  Do not change.
// 		VGA_CLK,   						//	VGA Clock
// 		VGA_HS,							//	VGA H_SYNC
// 		VGA_VS,							//	VGA V_SYNC
// 		VGA_BLANK_N,						//	VGA BLANK
// 		VGA_SYNC_N,						//	VGA SYNC
// 		VGA_R,   						//	VGA Red[9:0]
// 		VGA_G,	 						//	VGA Green[9:0]
// 		VGA_B   						//	VGA Blue[9:0]
// 	);

// 	input			CLOCK_50;				//	50 MHz
// 	input   [9:0]   SW;
// 	input   [3:0]   KEY;

// 	// Declare your inputs and outputs here
// 	// Do not change the following outputs
// 	output			VGA_CLK;   				//	VGA Clock
// 	output			VGA_HS;					//	VGA H_SYNC
// 	output			VGA_VS;					//	VGA V_SYNC
// 	output			VGA_BLANK_N;				//	VGA BLANK
// 	output			VGA_SYNC_N;				//	VGA SYNC
// 	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
// 	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
// 	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
	
// 	wire resetn;
// 	assign resetn = KEY[0];
	
// 	// Create the colour, x, y and writeEn wires that are inputs to the controller.
// 	wire [2:0] colour;
// 	wire [7:0] x;
// 	wire [6:0] y;
// 	wire writeEn;

// 	// Create an Instance of a VGA controller - there can be only one!
// 	// Define the number of colours as well as the initial background
// 	// image file (.MIF) for the controller.
// 	vga_adapter VGA(
// 			.resetn(resetn),
// 			.clock(CLOCK_50),
// 			.colour(colour),
// 			.x(x),
// 			.y(y),
// 			.plot(writeEn),
// 			/* Signals for the DAC to drive the monitor. */
// 			.VGA_R(VGA_R),
// 			.VGA_G(VGA_G),
// 			.VGA_B(VGA_B),
// 			.VGA_HS(VGA_HS),
// 			.VGA_VS(VGA_VS),
// 			.VGA_BLANK(VGA_BLANK_N),
// 			.VGA_SYNC(VGA_SYNC_N),
// 			.VGA_CLK(VGA_CLK));
// 		defparam VGA.RESOLUTION = "160x120";
// 		defparam VGA.MONOCHROME = "FALSE";
// 		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
// 		defparam VGA.BACKGROUND_IMAGE = "black.mif";
			
// 	// Put your code here. Your code should produce signals x,y,colour and writeEn/plot
// 	// for the VGA controller, in addition to any other functionality your design may require.
    
//     // Instansiate datapath
// 	// datapath d0(...);

//     // Instansiate FSM control
//     // control c0(...);
    
// endmodule


module MainModule(SW, KEY, LEDR, CLOCK_50, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
    // SW[3:0] that specifies the address of intended move
    input [3:0] SW;
    // KEY0 clock, KEY1 reset, KEY2 confirm move
    input [2:0] KEY;
    // LEDR[1:0] displays the outcome of the game
	 
	input CLOCK_50;
	 
    output [2:0] LEDR;
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
    wire [1:0] grid [2:0][2:0];;
    MileStoneOne mso(
        .resetn(KEY[1]),
        .clk(CLOCK_50),
        .confirm(KEY[2]),
        .address(SW[3:0]),
        .grid(grid[2:0][2:0]]),
        .winner(LEDR[1:0]),
		.end_signal(LEDR[2])
    );

    GridDecoder gd(grid[2:0][2:0], 
    HEX5[6:0], 
    HEX4[6:0], 
    HEX3[6:0], 
    HEX2[6:0], 
    HEX1[6:0], 
    HEX0[6:0]);
	

endmodule

module MileStoneOne(resetn, clk, confirm, address, grid, winner, end_signal);
    input resetn;
    input clk;
    input confirm;
    output [1:0] winner;
    output [1:0] grid [2:0][2:0];;
    input [3:0] address;
    wire ld;
	wire [1:0] value;
    output end_signal;
    WinCondition wc(.grid(grid[2:0][2:0]), 
    .winner(winner[1:0]), 
    .end_signal(end_signal));

    FSMControl control(.clk(clk), 
    .resetn(resetn), 
    .confirm(confirm), 
    .end_sig(end_signal), 
    .ld(ld), 
    .value(value));

    DataPathGrid dg(
	 .resetn(resetn), 
    .value(value), 
    .ld(ld), 
    .address(address),
	 .grid(grid[2:0][2:0]),
    .clk(clk));


endmodule
//module ChangeDirection(clk, dir, resetn, current_grid);
//    input clk;
//    input [2:0] dir;
//    input resetn;
//    reg [3:0] current_grid, next_grid;
//    output [3:0] current_grid;
//
//    localparam Idle = 3'b000, Up = 3'b001, Down = 3'b010, Right = 3'b011, Left = 3'b100;
//
//    always @(*) begin
//        case (current_grid)
//            4'b0000: begin
//                if (dir == Idle)
//                    next_grid = 4'b0000;
//                else if (dir == Up)
//                    next_grid = 4'b0000;
//                else if (dir == Down)
//                    next_grid = 4'b0011;
//                else if (dir == Right) 
//                    next_grid = 4'b0001;
//                else if (dir == Left)
//                    next_grid = 4'b0000;
//            end
//            
//            4'b0001: begin
//                if (dir == Idle)
//                    next_grid = 4'b0001;
//                else if (dir == Up)
//                    next_grid = 4'b0001;
//                else if (dir == Down)
//                    next_grid = 4'b0100;
//                else if (dir == Right) 
//                    next_grid = 4'b0010;
//                else if (dir == Left)
//                    next_grid = 4'b0000;
//            end
//
//            4'b0010: begin
//                if (dir == Idle)
//                    next_grid = 4'b0010;
//                else if (dir == Up)
//                    next_grid = 4'b0010;
//                else if (dir == Down)
//                    next_grid = 4'b0101;
//                else if (dir == Right) 
//                    next_grid = 4'b0010;
//                else if (dir == Left)
//                    next_grid = 4'b0001;
//            end
//
//            4'b0011: begin
//                if (dir == Idle)
//                    next_grid = 4'b0011;
//                else if (dir == Up)
//                    next_grid = 4'b0000;
//                else if (dir == Down)
//                    next_grid = 4'b0110;
//                else if (dir == Right) 
//                    next_grid = 4'b0100;
//                else if (dir == Left)
//                    next_grid = 4'b0011;
//            end
//
//            4'b0100: begin
//                if (dir == Idle)
//                    next_grid = 4'b0100;
//                else if (dir == Up)
//                    next_grid = 4'b0001;
//                else if (dir == Down)
//                    next_grid = 4'b0111;
//                else if (dir == Right) 
//                    next_grid = 4'b0101;
//                else if (dir == Left)
//                    next_grid = 4'b0011;
//            end
//
//            4'b0101: begin
//                if (dir == Idle)
//                    next_grid = 4'b0101;
//                else if (dir == Up)
//                    next_grid = 4'b0101;
//                else if (dir == Down)
//                    next_grid = 4'b1000;
//                else if (dir == Right) 
//                    next_grid = 4'b0101;
//                else if (dir == Left)
//                    next_grid = 4'b0100;
//            end
//
//            4'b0110: begin
//                if (dir == Idle)
//                    next_grid = 4'b0110;
//                else if (dir == Up)
//                    next_grid = 4'b0011;
//                else if (dir == Down)
//                    next_grid = 4'b0110;
//                else if (dir == Right) 
//                    next_grid = 4'b0111;
//                else if (dir == Left)
//                    next_grid = 4'b0110;
//            end
//
//            4'b0111: begin
//                if (dir == Idle)
//                    next_grid = 4'b0111;
//                else if (dir == Up)
//                    next_grid = 4'b0100;
//                else if (dir == Down)
//                    next_grid = 4'b0111;
//                else if (dir == Right) 
//                    next_grid = 4'b1000;
//                else if (dir == Left)
//                    next_grid = 4'b0110;
//            end
//
//            4'b1000: begin
//                if (dir == Idle)
//                    next_grid = 4'b1000;
//                else if (dir == Up)
//                    next_grid = 4'b0101;
//                else if (dir == Down)
//                    next_grid = 4'b1000;
//                else if (dir == Right) 
//                    next_grid = 4'b1000;
//                else if (dir == Left)
//                    next_grid = 4'b0111;
//            end
//
//            default: begin
//                next_grid = 4'b0000;
//            end
//        endcase
//
//    end
//
//    always @(gridedge clk) begin
//        if (~resetn)
//            current_grid <= 4'b0000;
//        else
//            current_grid <= next_grid;
//    end
//
//
//endmodule
module FSMControl(clk, resetn, confirm, end_sig, ld, value);
    input clk;
    input resetn;
    input confirm;
    input end_sig;
    reg [3:0] current_state, next_state;
    output reg ld;
	output reg [1:0] value;
    localparam load_one_idle = 4'd0, load_one = 4'd1, load_two_idle = 4'd2, load_two = 4'd3,end_state = 4'd4;
    always @(*) begin
        case (current_state)
            load_one_idle: begin
                if (end_sig)
                    next_state = end_state;
                else begin
                    if (~confirm)
                        next_state = load_one;
                    else
                        next_state = load_one_idle;
					end
            end
            load_one: begin
                if (end_sig)
                    next_state = end_state;
                else begin
                    if (~confirm)
                        next_state = load_one;
                    else
                        next_state = load_two_idle;
					end

            end
            load_two_idle: begin
                if (end_sig)
                    next_state = end_state;
                else begin
                    if (~confirm)
                        next_state = load_two;
                    else
                        next_state = load_two_idle;
					end
            end
            load_two: begin
                if (end_sig)
                    next_state = end_state;
                else begin
                    if (~confirm)
                        next_state = load_two;
                    else
                        next_state = load_one_idle;
					end
            end

            end_state: begin
                next_state = end_state;
            end

            default: begin
                next_state = load_one_idle;
				end
        endcase


    end
    always @(*) begin
        value = 2'd0;
        ld = 1'b0;

        case (current_state)
            load_one: begin
                value = 2'd1;
                ld = 1'b1;
            end
            load_two: begin
                value = 2'd2;
                ld = 1'b1;
            end
		endcase

    end
	always @(gridedge clk) begin
        if (~resetn) begin
            current_state <= load_one_idle;
        end
        else
            current_state <= next_state;
    end
endmodule

module DataPathGrid(resetn, value, ld, address, grid, draw_grid, clk);
    // active low reset
    input resetn;
    input [1:0] value;
    input ld;
    input [3:0] address;
    output reg [1:0] grid [2:0][2:0];
    output reg [2:0] draw_grid [0:159][0:119];
    input clk;
    always @(gridedge clk) begin
        if (~resetn) begin
            grid[0][0] = 2'd0;
            grid[0][1] = 2'd0;
            grid[0][2] = 2'd0;
            grid[1][0] = 2'd0;
            grid[1][1] = 2'd0;
            grid[1][2] = 2'd0;
            grid[2][0] = 2'd0;
            grid[2][1] = 2'd0;
            grid[2][2] = 2'd0;
		end
        else if (ld) begin
            if (address == 4'b0000)
                grid[0][0] <= value;
            else if (address == 4'b0001)
                grid[0][1] <= value;
            else if (address == 4'b0010)
                grid[0][2] <= value;
            else if (address == 4'b0011)
                grid[1][0] <= value;
            else if (address == 4'b0100)
                grid[1][1] <= value;
            else if (address == 4'b0101)
                grid[1][2] <= value;
            else if (address == 4'b0110)
                grid[2][0] <= value;
            else if (address == 4'b0111)
                grid[2][1] <= value;
            else if (address == 4'b1000)
                grid[2][2] <= value; 
        end
        for (y = 0; y < 160; y = y + 1) begin
            for (x = 0; x < 120; x = x + 1) begin
                if (grid[y][x] == 2'd1) begin
                    

                end

            end
        end
    end
endmodule

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