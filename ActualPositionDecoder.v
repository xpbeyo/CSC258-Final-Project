
module ActualPositionDecoder(grid, i_x, i_y, x_out, y_out, colour_out);
    input [1:0] grid [2:0][2:0];  // 2'd0 empty, 2d'1 O, 2d'2 X.
    input i_x, i_y;
    output reg x_out, y_out, colour_out;
    always @(*) begin
        if (i_x == 0) begin
            if (i_y == 0) begin
                x = 37;
                y = 7;
                if (grid[i_x][i_y] == 2d'0)
                    colour = 3'b111;  //white
                else if (grid[i_x][i_y] == 2d'1)
                    colour = 3'b011;  //light blue
                else if (grid[i_x][i_y] == 2d'2)
                    colour = 3'b101;  //purple
            end
            else if (i_y == 1) begin
                x = 67;
                y = 7;
                if (grid[i_x][i_y] == 2d'0)
                    colour = 3'b111;  //white
                else if (grid[i_x][i_y] == 2d'1)
                    colour = 3'b011;  //light blue
                else if (grid[i_x][i_y] == 2d'2)
                    colour = 3'b101;  //purple
            end
            else if (i_y == 2) begin
                x = 97;
                y = 7;
                if (grid[i_x][i_y] == 2d'0)
                    colour = 3'b111;  //white
                else if (grid[i_x][i_y] == 2d'1)
                    colour = 3'b011;  //light blue
                else if (grid[i_x][i_y] == 2d'2)
                    colour = 3'b101;  //purple
            end
        end
        else if (i_x == 1) begin
            if (i_y == 0) begin
                x = 37;
                y = 37;
                if (grid[i_x][i_y] == 2d'0)
                    colour = 3'b111;  //white
                else if (grid[i_x][i_y] == 2d'1)
                    colour = 3'b011;  //light blue
                else if (grid[i_x][i_y] == 2d'2)
                    colour = 3'b101;  //purple
            end
            else if (i_y == 1) begin
                x = 67;
                y = 37;
                if (grid[i_x][i_y] == 2d'0)
                    colour = 3'b111;  //white
                else if (grid[i_x][i_y] == 2d'1)
                    colour = 3'b011;  //light blue
                else if (grid[i_x][i_y] == 2d'2)
                    colour = 3'b101;  //purple
            end
            else if (i_y == 2) begin
                x = 97;
                y = 37;
                if (grid[i_x][i_y] == 2d'0)
                    colour = 3'b111;  //white
                else if (grid[i_x][i_y] == 2d'1)
                    colour = 3'b011;  //light blue
                else if (grid[i_x][i_y] == 2d'2)
                    colour = 3'b101;  //purple
            end
        end
        else if (i_x == 2) begin
            if (i_y == 0) begin
                x = 37;
                y = 67;
                if (grid[i_x][i_y] == 2d'0)
                    colour = 3'b111;  //white
                else if (grid[i_x][i_y] == 2d'1)
                    colour = 3'b011;  //light blue
                else if (grid[i_x][i_y] == 2d'2)
                    colour = 3'b101;  //purple
            end
            else if (i_y == 1) begin
                x = 67;
                y = 67;
                if (grid[i_x][i_y] == 2d'0)
                    colour = 3'b111;  //white
                else if (grid[i_x][i_y] == 2d'1)
                    colour = 3'b011;  //light blue
                else if (grid[i_x][i_y] == 2d'2)
                    colour = 3'b101;  //purple
            end
            else if (i_y == 2) begin
                x = 97;
                y = 67;
                if (grid[i_x][i_y] == 2d'0)
                    colour = 3'b111;  //white
                else if (grid[i_x][i_y] == 2d'1)
                    colour = 3'b011;  //light blue
                else if (grid[i_x][i_y] == 2d'2)
                    colour = 3'b101;  //purple
            end
        end    
    end
endmodule