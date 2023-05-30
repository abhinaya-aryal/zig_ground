const std = @import("std");
const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

fn readInput() !u8 {
    var c = stdin.readByte() catch |err| switch (err) {
        error.EndOfStream => {
            try stdout.writeByte('\n');
            std.os.exit(0);
        },
        else => |e| return e,
    };
    return c;
}

pub fn main() !void {
    var space: u8 = 0;
    var character = try readInput();
    while (true) {
        if (character == ' ') {
            space += 1;
        } else if (character != ' ') {
            space = 0;
        }
        if (space <= 1) {
            try stdout.writeByte(character);
        }
        character = try readInput();
    }
}
