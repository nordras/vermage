const std = @import("std");
const lexer = @import("lexer.zig");

pub fn main() void {
    const input = "3 + 4";
    var index: usize = 0;

    const token1 = lexer.next_token(input, &index);
    const token2 = lexer.next_token(input, &index);
    const token3 = lexer.next_token(input, &index);

    if (token1.kind == .Number and token2.kind == .Plus and token3.kind == .Number) {
        const result = token1.value.? + token3.value.?;
        std.debug.print("Resultado: {}\n", .{result});
    }
}
