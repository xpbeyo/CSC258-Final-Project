module ActualToDraw(grid, x_out, y_out, colour_out, clk, resetn);
    input [1:0] grid [2:0][2:0];
    input clk, resetn;
    reg pos_i, pos_j;
    wire [7:0] x;
    wire [6:0] y;
    output [7:0] x_out;
    output [6:0] y_out;
    output [2:0] colour_out;
    reg [3:0] enable;
    localparam piece_width = 5'd26;

    // Counters
    reg [4:0] count_x, count_y; 
    ActualPositionDecoder apd(
        .grid(grid),
        .i_x(pos_i),
        .i_y(pos_j),
        .x_out(x),
        .y_out(y),
        .colour_out(colour_out)
    );

    always @(*) begin
        case (enable)
            4'd0: begin
                pos_i = 4'd0;
                pos_j = 4'd0;
            end
            4'd1: begin
                pos_i = 4'd0;
                pos_j = 4'd1;
            end
            4'd2: begin
                pos_i = 4'd0;
                pos_j = 4'd2;
            end
            4'd3: begin
                pos_i = 4'd1;
                pos_j = 4'd0;
            end
            4'd4: begin
                pos_i = 4'd1;
                pos_j = 4'd1;
            end
            4'd5: begin
                pos_i = 4'd1;
                pos_j = 4'd2;
            end
            4'd6: begin
                pos_i = 4'd2;
                pos_j = 4'd0;
            end
            4'd7: begin
                pos_i = 4'd2;
                pos_j = 4'd1;
            end
            4'd8: begin
                pos_i = 4'd2;
                pos_j = 4'd2;
            end

        endcase


    end

    always @(posedge clk) begin
        if (~resetn) begin
            enable <= 4'd0;
        end
    end

    // Counter for x
    always @(posedge clk) begin
        if (~resetn) begin
            count_x <= 5'd0;
        end
        else begin
            if (count_x == piece_width)
                if (count_y == piece_width) begin
                    if (enable < 4'd8)
                        enable <= enable + 4'd1;
                    else
                        enable <= 4'd0;
                end
                count_x <= 5'd0;
            else begin
                count_x <= count_x + 5'd1;
            end

        end
    end

    assign enable_y = (count_x == piece_width) ? 1 : 0;

    always @(posedge clk) begin
        if (~resetn) begin
            count_y <= 5'd0;
        end

        else if (enable_y) begin
            if (count_y) == piece_width begin
                count_y == 5'd27;
            end

            else
                count_y <= count_y + 5'd1;


        end

    end

    assign x_out = x + count_x;
    assign y_out = y + count_y;



endmodule