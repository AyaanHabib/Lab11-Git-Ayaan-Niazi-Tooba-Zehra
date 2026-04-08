module branchAdder(
input [31:0] pc,
input [31:0] imm,
output [31:0] branch_target
);
assign branch_target=pc+(imm<<1);
endmodule
