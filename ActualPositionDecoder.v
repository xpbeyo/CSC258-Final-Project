
module ActualPositionDecoder(grid, i_x, i_y, p1, p2, tie, which_one, score_location, x_out, y_out, colour_out);
    input  [17:0] grid;  // 2'd0 empty, 2d'1 O, 2d'2 X.
    input [7:0] i_x;
    input [6:0] i_y;
    input [14:0] p1, p2, tie;  // 1'b0 white, 1'b1 black.
    input [1:0] which_one;  // 2'b00 grid, 2'b01 p1, 2'b10 p2, 2'b11 tie.
    input [3:0] score_location;  // 4'h0, 4'h1, ... , 4'h9, 4'hA, 4'hB, ... ,4'hE
    output reg [7:0] x_out;
    output reg [6:0] y_out;
    output reg [2:0] colour_out;
    always @(*) begin
          if (which_one == 2'b00) begin
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
          else if (which_one == 2'b01) begin  //p1
               if (score_location == 4'h0) begin
                    x_out = 8'd44;
                    y_out = 7'd103;
                    if (p1[0] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[0] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h1) begin
                    x_out = 8'd46;
                    y_out = 7'd103;
                    if (p1[1] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[1] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h2) begin
                    x_out = 8'd48;
                    y_out = 7'd103;
                    if (p1[2] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[2] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h3) begin
                    x_out = 8'd44;
                    y_out = 7'd105;
                    if (p1[3] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[3] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h4) begin
                    x_out = 8'd46;
                    y_out = 7'd105;
                    if (p1[4] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[4] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h5) begin
                    x_out = 8'd48;
                    y_out = 7'd105;
                    if (p1[5] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[5] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h6) begin
                    x_out = 8'd44;
                    y_out = 7'd107;
                    if (p1[6] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[6] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h7) begin
                    x_out = 8'd46;
                    y_out = 7'd107;
                    if (p1[7] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[7] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h8) begin
                    x_out = 8'd48;
                    y_out = 7'd107;
                    if (p1[8] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[8] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h9) begin
                    x_out = 8'd44;
                    y_out = 7'd109;
                    if (p1[9] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[9] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hA) begin
                    x_out = 8'd46;
                    y_out = 7'd109;
                    if (p1[10] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[10] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hB) begin
                    x_out = 8'd48;
                    y_out = 7'd109;
                    if (p1[11] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[11] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hC) begin
                    x_out = 8'd44;
                    y_out = 7'd111;
                    if (p1[12] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[12] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hD) begin
                    x_out = 8'd46;
                    y_out = 7'd111;
                    if (p1[13] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[13] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hE) begin
                    x_out = 8'd48;
                    y_out = 7'd111;
                    if (p1[14] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1[14] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
          end
          else if(which_one == 2'b10) begin  //p2
               if (score_location == 4'h0) begin
                    x_out = 8'd84;
                    y_out = 7'd103;
                    if (p2[0] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[0] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h1) begin
                    x_out = 8'd86;
                    y_out = 7'd103;
                    if (p2[1] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[1] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h2) begin
                    x_out = 8'd88;
                    y_out = 7'd103;
                    if (p2[2] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[2] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h3) begin
                    x_out = 8'd84;
                    y_out = 7'd105;
                    if (p2[3] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[3] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h4) begin
                    x_out = 8'd86;
                    y_out = 7'd105;
                    if (p2[4] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[4] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h5) begin
                    x_out = 8'd88;
                    y_out = 7'd105;
                    if (p2[5] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[5] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h6) begin
                    x_out = 8'd84;
                    y_out = 7'd107;
                    if (p2[6] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[6] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h7) begin
                    x_out = 8'd86;
                    y_out = 7'd107;
                    if (p2[7] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[7] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h8) begin
                    x_out = 8'd88;
                    y_out = 7'd107;
                    if (p2[8] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[8] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h9) begin
                    x_out = 8'd84;
                    y_out = 7'd109;
                    if (p2[9] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[9] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hA) begin
                    x_out = 8'd86;
                    y_out = 7'd109;
                    if (p2[10] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[10] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hB) begin
                    x_out = 8'd88;
                    y_out = 7'd109;
                    if (p2[11] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[11] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hC) begin
                    x_out = 8'd84;
                    y_out = 7'd111;
                    if (p2[12] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[12] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hD) begin
                    x_out = 8'd86;
                    y_out = 7'd111;
                    if (p2[13] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[13] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hE) begin
                    x_out = 8'd88;
                    y_out = 7'd111;
                    if (p2[14] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2[14] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
          end
          else begin  //tie
               if (score_location == 4'h0) begin
                    x_out = 8'd124;
                    y_out = 7'd103;
                    if (tie[0] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[0] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h1) begin
                    x_out = 8'd126;
                    y_out = 7'd103;
                    if (tie[1] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[1] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h2) begin
                    x_out = 8'd128;
                    y_out = 7'd103;
                    if (tie[2] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[2] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h3) begin
                    x_out = 8'd124;
                    y_out = 7'd105;
                    if (tie[3] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[3] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h4) begin
                    x_out = 8'd126;
                    y_out = 7'd105;
                    if (tie[4] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[4] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h5) begin
                    x_out = 8'd128;
                    y_out = 7'd105;
                    if (tie[5] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[5] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h6) begin
                    x_out = 8'd124;
                    y_out = 7'd107;
                    if (tie[6] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[6] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h7) begin
                    x_out = 8'd126;
                    y_out = 7'd107;
                    if (tie[7] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[7] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h8) begin
                    x_out = 8'd128;
                    y_out = 7'd107;
                    if (tie[8] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[8] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h9) begin
                    x_out = 8'd124;
                    y_out = 7'd109;
                    if (tie[9] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[9] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hA) begin
                    x_out = 8'd126;
                    y_out = 7'd109;
                    if (tie[10] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[10] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hB) begin
                    x_out = 8'd128;
                    y_out = 7'd109;
                    if (tie[11] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[11] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hC) begin
                    x_out = 8'd124;
                    y_out = 7'd111;
                    if (tie[12] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[12] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hD) begin
                    x_out = 8'd126;
                    y_out = 7'd111;
                    if (tie[13] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[13] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hE) begin
                    x_out = 8'd128;
                    y_out = 7'd111;
                    if (tie[14] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie[14] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
          end
    end
endmodule
