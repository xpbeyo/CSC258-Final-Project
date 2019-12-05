
module ActualPositionDecoder(grid, i_x, i_y, p1_decoded, p2_decoded, tie_decoded, which_one, score_location, x_out, y_out, colour_out);
    input  [17:0] grid;  // 2'd0 empty, 2d'1 O, 2d'2 X.
    input [7:0] i_x;
    input [6:0] i_y;
    input [14:0] p1_decoded, p2_decoded, tie_decoded;  // 1'b0 white, 1'b1 black.
    input [1:0] which_one;  // 2'b00 grid, 2'b01 p1_decoded, 2'b10 p2_decoded, 2'b11 tie_decoded.
    input [3:0] score_location;  // 4'h0, 4'h1, ... , 4'h9, 4'hA, 4'hB, ... ,4'hE
    output reg [7:0] x_out;
    output reg [6:0] y_out;
    output reg [2:0] colour_out;
    always @(*) begin
          if (which_one == 2'b00) begin
               if (i_x == 5'd17 & i_y == 5'd16) begin
                    x_out = 8'd36;
                    y_out = 7'd6;
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
                    x_out = 8'd66;
                    y_out = 7'd6;
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
                    x_out = 8'd96;
                    y_out = 7'd6;
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
                    x_out = 8'd36;
                    y_out = 7'd36;
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
                    x_out = 8'd66;
                    y_out = 7'd36;
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
                    x_out = 8'd96;
                    y_out = 7'd36;
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
                    x_out = 8'd36;
                    y_out = 7'd66;
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
                    x_out = 8'd66;
                    y_out = 7'd66;
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
                    x_out = 8'd96;
                    y_out = 7'd66;
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
          else if (which_one == 2'b01) begin  //p1_decoded
               if (score_location == 4'h0) begin
                    x_out = 8'd43;
                    y_out = 7'd102;
                    if (p1_decoded[0] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[0] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h1) begin
                    x_out = 8'd45;
                    y_out = 7'd102;
                    if (p1_decoded[1] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[1] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h2) begin
                    x_out = 8'd46;
                    y_out = 7'd102;
                    if (p1_decoded[2] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[2] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h3) begin
                    x_out = 8'd43;
                    y_out = 7'd104;
                    if (p1_decoded[3] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[3] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h4) begin
                    x_out = 8'd45;
                    y_out = 7'd104;
                    if (p1_decoded[4] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[4] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h5) begin
                    x_out = 8'd47;
                    y_out = 7'd104;
                    if (p1_decoded[5] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[5] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h6) begin
                    x_out = 8'd43;
                    y_out = 7'd106;
                    if (p1_decoded[6] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[6] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h7) begin
                    x_out = 8'd45;
                    y_out = 7'd106;
                    if (p1_decoded[7] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[7] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h8) begin
                    x_out = 8'd47;
                    y_out = 7'd106;
                    if (p1_decoded[8] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[8] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h9) begin
                    x_out = 8'd43;
                    y_out = 7'd108;
                    if (p1_decoded[9] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[9] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hA) begin
                    x_out = 8'd45;
                    y_out = 7'd108;
                    if (p1_decoded[10] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[10] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hB) begin
                    x_out = 8'd47;
                    y_out = 7'd108;
                    if (p1_decoded[11] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[11] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hC) begin
                    x_out = 8'd43;
                    y_out = 7'd110;
                    if (p1_decoded[12] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[12] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hD) begin
                    x_out = 8'd45;
                    y_out = 7'd110;
                    if (p1_decoded[13] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[13] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hE) begin
                    x_out = 8'd47;
                    y_out = 7'd110;
                    if (p1_decoded[14] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p1_decoded[14] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
          end
          else if(which_one == 2'b10) begin  //p2_decoded
               if (score_location == 4'h0) begin
                    x_out = 8'd83;
                    y_out = 7'd102;
                    if (p2_decoded[0] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[0] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h1) begin
                    x_out = 8'd85;
                    y_out = 7'd102;
                    if (p2_decoded[1] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[1] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h2) begin
                    x_out = 8'd87;
                    y_out = 7'd102;
                    if (p2_decoded[2] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[2] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h3) begin
                    x_out = 8'd83;
                    y_out = 7'd104;
                    if (p2_decoded[3] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[3] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h4) begin
                    x_out = 8'd85;
                    y_out = 7'd104;
                    if (p2_decoded[4] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[4] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h5) begin
                    x_out = 8'd87;
                    y_out = 7'd104;
                    if (p2_decoded[5] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[5] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h6) begin
                    x_out = 8'd83;
                    y_out = 7'd106;
                    if (p2_decoded[6] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[6] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h7) begin
                    x_out = 8'd85;
                    y_out = 7'd106;
                    if (p2_decoded[7] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[7] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h8) begin
                    x_out = 8'd87;
                    y_out = 7'd106;
                    if (p2_decoded[8] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[8] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h9) begin
                    x_out = 8'd83;
                    y_out = 7'd108;
                    if (p2_decoded[9] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[9] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hA) begin
                    x_out = 8'd85;
                    y_out = 7'd108;
                    if (p2_decoded[10] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[10] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hB) begin
                    x_out = 8'd87;
                    y_out = 7'd108;
                    if (p2_decoded[11] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[11] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hC) begin
                    x_out = 8'd83;
                    y_out = 7'd110;
                    if (p2_decoded[12] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[12] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hD) begin
                    x_out = 8'd85;
                    y_out = 7'd110;
                    if (p2_decoded[13] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[13] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hE) begin
                    x_out = 8'd87;
                    y_out = 7'd110;
                    if (p2_decoded[14] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (p2_decoded[14] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
          end
          else begin  //tie_decoded
               if (score_location == 4'h0) begin
                    x_out = 8'd123;
                    y_out = 7'd102;
                    if (tie_decoded[0] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[0] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h1) begin
                    x_out = 8'd125;
                    y_out = 7'd102;
                    if (tie_decoded[1] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[1] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h2) begin
                    x_out = 8'd127;
                    y_out = 7'd102;
                    if (tie_decoded[2] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[2] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h3) begin
                    x_out = 8'd123;
                    y_out = 7'd104;
                    if (tie_decoded[3] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[3] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h4) begin
                    x_out = 8'd125;
                    y_out = 7'd104;
                    if (tie_decoded[4] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[4] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h5) begin
                    x_out = 8'd127;
                    y_out = 7'd104;
                    if (tie_decoded[5] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[5] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h6) begin
                    x_out = 8'd123;
                    y_out = 7'd106;
                    if (tie_decoded[6] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[6] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h7) begin
                    x_out = 8'd125;
                    y_out = 7'd106;
                    if (tie_decoded[7] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[7] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h8) begin
                    x_out = 8'd127;
                    y_out = 7'd106;
                    if (tie_decoded[8] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[8] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'h9) begin
                    x_out = 8'd123;
                    y_out = 7'd108;
                    if (tie_decoded[9] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[9] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hA) begin
                    x_out = 8'd125;
                    y_out = 7'd108;
                    if (tie_decoded[10] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[10] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hB) begin
                    x_out = 8'd127;
                    y_out = 7'd108;
                    if (tie_decoded[11] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[11] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hC) begin
                    x_out = 8'd123;
                    y_out = 7'd110;
                    if (tie_decoded[12] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[12] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hD) begin
                    x_out = 8'd125;
                    y_out = 7'd110;
                    if (tie_decoded[13] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[13] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
               else if (score_location == 4'hE) begin
                    x_out = 8'd127;
                    y_out = 7'd110;
                    if (tie_decoded[14] == 1'b0) begin
                         colour_out = 3'b111;
                    end
                    else if (tie_decoded[14] == 1'b1) begin
                         colour_out = 3'b000;
                    end
               end
          end
    end
endmodule
