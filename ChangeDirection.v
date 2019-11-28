module ChangeDirection(clk, dir, resetn, current_grid);
   input clk;
   input [2:0] dir;
   input resetn;
   reg [3:0] current_grid, next_grid;
   output [3:0] current_grid;

   localparam Idle = 3'b000, Up = 3'b001, Down = 3'b010, Right = 3'b011, Left = 3'b100;

   always @(*) begin
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
               else if (dir == Up)
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