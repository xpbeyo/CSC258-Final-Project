
module ActualPositionDecoder(grid, i_x, i_y, x_out, y_out, colour_out);
    input  [17:0] grid;  // 2'd0 empty, 2d'1 O, 2d'2 X.
    input [7:0] i_x;
    input [6:0] i_y;
    output reg [7:0] x_out;
    output reg [6:0] y_out;
    output reg [2:0] colour_out;
    always @(*) begin
        if (i_x == 5'd17 & i_y == 5'd16) begin
            x_out = 8'd37;
            y_out = 7'd7;
            if (grid[17:16] == 2'd0) begin
                colour_out = 3'b111;  //white
            end
            else if (grid[17:16] == 2'd1) begin
                 colour_out = 3'b011;  //light blue
            end
            else if (grid[17:16] == 2'd2) begin
                 colour_out = 3'b101;  //purple
            end
        end
        else if (i_x == 5'd15 & i_y == 5'd14) begin
             x_out = 8'd67;
             y_out = 7'd7;
            if (grid[15:14] == 2'd0) begin
                 colour_out = 3'b111;  //white
            end
            else if (grid[15:14] == 2'd1) begin
                 colour_out = 3'b011;  //light blue
            end
            else if (grid[15:14] == 2'd2) begin
                 colour_out = 3'b101;  //purple
            end
        end
        else if (i_x == 5'd13 & i_y == 5'd12) begin
             x_out = 8'd97;
             y_out = 7'd7;
            if (grid[13:12] == 2'd0) begin
                 colour_out = 3'b111;  //white
            end
            else if (grid[13:12] == 2'd1) begin
                 colour_out = 3'b011;  //light blue
            end
            else if (grid[13:12] == 2'd2) begin
                 colour_out = 3'b101;  //purple
            end
        end
        else if (i_x == 5'd11 & i_y == 5'd10) begin
             x_out = 8'd37;
             y_out = 7'd37;
            if (grid[11:10] == 2'd0) begin
                 colour_out = 3'b111;  //white
            end
            else if (grid[11:10] == 2'd1) begin
                 colour_out = 3'b011;  //light blue
            end
            else if (grid[11:10] == 2'd2) begin
                 colour_out = 3'b101;  //purple
            end
        end
        else if (i_x == 5'd9 & i_y == 5'd8) begin
             x_out = 8'd67;
             y_out = 7'd37;
            if (grid[9:8] == 2'd0) begin
                 colour_out = 3'b111;  //white
            end
            else if (grid[9:8] == 2'd1) begin
                 colour_out = 3'b011;  //light blue
            end
            else if (grid[9:8] == 2'd2) begin
                 colour_out = 3'b101;  //purple
            end
        end
        else if (i_x == 5'd7 & i_y == 5'd6) begin
             x_out = 8'd97;
             y_out = 7'd37;
            if (grid[7:6] == 2'd0) begin
                 colour_out = 3'b111;  //white
            end
            else if (grid[7:6] == 2'd1) begin
                 colour_out = 3'b011;  //light blue
            end
            else if (grid[7:6] == 2'd2) begin
                 colour_out = 3'b101;  //purple
            end
        end
        else if (i_x == 5'd5 & i_y == 5'd4) begin
             x_out = 8'd37;
             y_out = 7'd67;
            if (grid[5:4] == 2'd0) begin
                 colour_out = 3'b111;  //white
            end
            else if (grid[5:4] == 2'd1) begin
                 colour_out = 3'b011;  //light blue
            end
            else if (grid[5:4] == 2'd2) begin
                 colour_out = 3'b101;  //purple
            end
        end
        else if (i_x == 5'd3 & i_y == 5'd2) begin
             x_out = 8'd67;
             y_out = 7'd67;
            if (grid[3:2] == 2'd0) begin
                 colour_out = 3'b111;  //white
            end
            else if (grid[3:2] == 2'd1) begin
                 colour_out = 3'b011;  //light blue
            end
            else if (grid[3:2] == 2'd2) begin
                 colour_out = 3'b101;  //purple
            end
        end
        else if (i_x == 5'd1 & i_y == 5'd0) begin
             x_out = 8'd97;
             y_out = 7'd67;
            if (grid[1:0] == 2'd0) begin
                 colour_out = 3'b111;  //white
            end
            else if (grid[1:0] == 2'd1) begin
                 colour_out = 3'b011;  //light blue
            end
            else if (grid[1:0] == 2'd2) begin
                 colour_out = 3'b101;  //purple
            end
        end  
    end
endmodule
