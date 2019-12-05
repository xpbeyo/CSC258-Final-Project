module NumToGridDecoder(num, num_board);
    input [3:0] num;
    output reg [14:0] num_board;
    always @(*) begin
        case (num)
            4'h0: num_board = 15'b111101101101111;
            4'h1: num_board = 15'b010010010010010;
            4'h2: num_board = 15'b111001111100111;
            4'h3: num_board = 15'b111001111001111;
            4'h4: num_board = 15'b101101111001001;
            4'h5: num_board = 15'b111100111001111;
            4'h6: num_board = 15'b111100111101111;
            4'h7: num_board = 15'b111001010010010;
            4'h8: num_board = 15'b111101111101111;
            4'h9: num_board = 15'b111101111001001;
            4'hA: num_board = 15'b111101111101101;
            4'hB: num_board = 15'b100100111101111;
            4'hC: num_board = 15'b111100100100111;
            4'hD: num_board = 15'b001001111101111;
            4'hE: num_board = 15'b111100111100111;
            4'hF: num_board = 15'b111100111100100;
            default: num_board = 15'b111101101101111;
        endcase
    end
endmodule