module ActualToDraw(grid, p1_decoded, p2_decoded, tie_decoded, x_out, y_out, colour_out, clk, resetn);
    input [17:0] grid;
    input clk, resetn;
    input [14:0] p1_decoded, p2_decoded, tie_decoded;
    reg [4:0] pos_i, pos_j;
    reg [3:0] score_location;
    reg [1:0] which_one;
    reg [4:0] width;
    wire [7:0] x;
    wire [6:0] y;
    output [7:0] x_out;
    output [6:0] y_out;
    output [2:0] colour_out;
    reg [4:0] enable;
	
    localparam piece_width = 5'd26, num_width = 5'd2;

    // Counters
    reg [4:0] count_x, count_y; 
    ActualPositionDecoder apd(
        .grid(grid[17:0]),
        .i_x(pos_i),
        .i_y(pos_j),
        .p1_decoded(p1_decoded),
        .p2_decoded(p2_decoded),
        .tie_decoded(tie_decoded),
        .which_one(which_one),
		.score_location(score_location),
        .x_out(x),
        .y_out(y),
        .colour_out(colour_out)
    );

    always @(posedge clk) begin
        case (enable)
            5'd0: begin
                pos_i <= 5'd17;
                pos_j <= 5'd16;
            end
            5'd1: begin
                pos_i <= 5'd15;
                pos_j <= 5'd14;
            end
            5'd2: begin
                pos_i <= 5'd13;
                pos_j <= 5'd12;
            end
            5'd3: begin
                pos_i <= 5'd11;
                pos_j <= 5'd10;
            end
            5'd4: begin
                pos_i <= 5'd9;
                pos_j <= 5'd8;
            end
            5'd5: begin
                pos_i <= 5'd7;
                pos_j <= 5'd6;
            end
            5'd6: begin
                pos_i <= 5'd5;
                pos_j <= 5'd4;
            end
            5'd7: begin
                pos_i <= 5'd3;
                pos_j <= 5'd2;
            end
            5'd8: begin
                pos_i <= 5'd1;
                pos_j <= 5'd0;
            end
            5'd9: begin
                score_location <= 4'hE;
            end
            5'd10: begin
                score_location <= 4'hD;
            end
            5'd11: begin
                score_location <= 4'hC;
            end
            5'd12: begin
                score_location <= 4'hB;
            end
            5'd13: begin
                score_location <= 4'hA;
            end
            5'd14: begin
                score_location <= 4'h9;
            end
            5'd15: begin
                score_location <= 4'h8;
            end
            5'd16: begin
                score_location <= 4'h7;
            end
            5'd17: begin
                score_location <= 4'h6;
            end
            5'd18: begin
                score_location <= 4'h5;
            end
            5'd19: begin
                score_location <= 4'h4;
            end
            5'd20: begin
                score_location <= 4'h3;
            end
            5'd21: begin
                score_location <= 4'h2;
            end
            5'd22: begin
                score_location <= 4'h1;
            end
            5'd23: begin
                score_location <= 4'h0;
            end
			default: begin
				score_location <= 4'hE;
			end

        endcase


    end

    // Counter for x
    always @(posedge clk) begin
        if (~resetn) begin
		    enable <= 5'd0;
            count_x <= 5'd0;
            which_one <= 2'b00;
            width <= piece_width;
        end
        else begin
            if (which_one == 2'b00) begin
                width <= piece_width;
            end
            else begin
                width <= num_width;
            end
            if (count_x == width) begin
                if (count_y == width) begin
                    if (which_one == 2'b11) begin
                        if (enable < 5'd23) begin
                            enable <= enable + 5'd1;
                        end
                        else begin
                            enable <= 5'd0;
                            which_one <= 2'b00;
                        end
                    end
                    else begin
                        if (enable < 5'd8)
                            enable <= enable + 5'd1;
                        else if (enable == 5'd8) begin
                            which_one <= which_one + 1'b1;
                            enable <= enable + 5'd1;
                        end
                        else if (enable == 5'd23) begin
                            which_one <= which_one + 1'b1;
                            enable <= 5'd9; 
                        end
                        else begin
                            enable <= enable + 5'd1;
                        end
                    end
                end
                count_x <= 5'd0;
				end
            else begin
                count_x <= count_x + 5'd1;
            end
        end
    end

    assign enable_y = (count_x == width) ? 1 : 0;

    always @(posedge clk) begin
        if (~resetn) begin
            count_y <= 5'd0;
        end

        else if (enable_y) begin
            if (count_y == width) begin
                count_y <= 5'd0;
            end

            else
                count_y <= count_y + 5'd1;
        end

    end

    assign x_out = x + count_x;
    assign y_out = y + count_y;
endmodule
