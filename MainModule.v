module MainModule
	(
		CLOCK_50,						//	On Board 50 MHz
		// Your inputs and outputs here
        KEY,
        SW,
        LEDR,
		// The ports below are for the VGA output.  Do not change.
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK_N,						//	VGA BLANK
		VGA_SYNC_N,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B   						//	VGA Blue[9:0]
	);

    // SW[3:0] that specifies the address of intended move
    // KEY[0] reset, KEY[1] confirm move
	input			CLOCK_50;				//	50 MHz
	input   [9:0]   SW;
	input   [3:0]   KEY;

    // LEDR[2] displays the end signal
    // LEDR[1:0] displays the outcome of the game
    output [2:0] LEDR;
	// Declare your inputs and outputs here
	// Do not change the following outputs
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
	
	wire resetn;
   wire  [17:0] grid;
	assign resetn = KEY[0];


	// Create the colour, x, y and writeEn wires that are inputs to the controller.
	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;
	wire writeEn;

    assign writeEn = 1'b1;
    MileStoneTwo mst(
        .resetn(KEY[0]),
        .clk(CLOCK_50),
        .confirm(KEY[1]),
        .address(SW[3:0]),
        .grid(grid[17:0]),
        .winner(LEDR[1:0]),
        .x_out(x),
        .y_out(y),
        .colour_out(colour),
		.end_signal(LEDR[2])
    );

	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x),
			.y(y),
			.plot(writeEn),
			/* Signals for the DAC to drive the monitor. */
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "chessgrid.mif";
			
	// Put your code here. Your code should produce signals x,y,colour and writeEn/plot
	// for the VGA controller, in addition to any other functionality your design may require.
    
    // Instansiate datapath
	// datapath d0(...);

    // Instansiate FSM control
    // control c0(...);
    
endmodule

module MileStoneTwo(resetn, clk, confirm, address, grid, winner, x_out, y_out, colour_out, end_signal);
    input resetn;
    input clk;
    input confirm;
    input [3:0] address;
    output [7:0] x_out;
    output [6:0] y_out;
    output [2:0] colour_out;
    output [1:0] winner;
    output [17:0] grid;
    wire ld;
	wire [1:0] value;
    output end_signal;
    WinCondition wc(.grid(grid[17:0]), 
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
	.grid(grid[17:0]),
    .clk(clk));

    ActualToDraw atd(
        .grid(grid),
        .x_out(x_out),
        .y_out(y_out),
        .colour_out(colour_out),
        .clk(clk),
        .resetn(resetn)
    );
endmodule
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
	always @(posedge clk) begin
        if (~resetn) begin
            current_state <= load_one_idle;
        end
        else
            current_state <= next_state;
    end
endmodule

module DataPathGrid(resetn, value, ld, address, grid, clk);
    // active low reset
    input resetn;
    input [1:0] value;
    input ld;
    input [3:0] address;
    output reg [17:0] grid;
    input clk;
    always @(posedge clk) begin
        if (~resetn) begin
            grid[17:16] = 2'd0;
            grid[15:14] = 2'd0;
            grid[13:12] = 2'd0;
            grid[11:10] = 2'd0;
            grid[9:8] = 2'd0;
            grid[7:6] = 2'd0;
            grid[5:4] = 2'd0;
            grid[3:2] = 2'd0;
            grid[1:0] = 2'd0;
		end
        else if (ld) begin
            if (address == 4'b0000)
                grid[17:16] <= value;
            else if (address == 4'b0001)
                grid[15:14] <= value;
            else if (address == 4'b0010)
                grid[13:12] <= value;
            else if (address == 4'b0011)
                grid[11:10] <= value;
            else if (address == 4'b0100)
                grid[9:8] <= value;
            else if (address == 4'b0101)
                grid[7:6] <= value;
            else if (address == 4'b0110)
                grid[5:4] <= value;
            else if (address == 4'b0111)
                grid[3:2] <= value;
            else if (address == 4'b1000)
                grid[1:0] <= value; 
        end
    end
endmodule
