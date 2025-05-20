const std = @import("std");

pub const TokenType = enum {
    Number,
    Plus,
    EOF,
};

pub const Token = struct {
    kind: TokenType,
    value: ?i64 = null,
};

pub fn next_token(input: []const u8, index: *usize) Token {
    while (*index < input.len and std.ascii.isWhitespace(input[*index])) : (index.* += 1) {}

    if (*index >= input.len) return Token{ .kind = .EOF };

    const c = input[*index];
    index.* += 1;

    return switch (c) {
        '+' => Token{ .kind = .Plus },
        '0'...'9' => {
            var num: i64 = c - '0';
            while (*index < input.len and std.ascii.isDigit(input[*index])) : (index.* += 1) {
                num = num * 10 + (input[*index] - '0');
            }
            Token{ .kind = .Number, .value = num }
        },
        else => unreachable,
    };
}
