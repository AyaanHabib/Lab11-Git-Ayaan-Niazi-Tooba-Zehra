module immGen(
input [31:0] instruction,
output reg [31:0] imm
);
wire [6:0] opcode = instruction[6:0];
always @(*) begin
case (opcode)
7'b0000011, // I-type: lw
7'b0010011: // I-type: addi
imm = {{20{instruction[31]}}, instruction[31:20]};
7'b0100011: // S-type
imm = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
7'b1100011: // B-type
imm = {{20{instruction[31]}}, instruction[31], instruction[7],
instruction[30:25], instruction[11:8]};
default:
imm = 32'b0;
endcase
end
endmodule
