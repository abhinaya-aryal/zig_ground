const std = @import("std");
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();

fn readInput() !u8 {
    var byte = stdin.readByte() catch |err| switch (err) {
        error.EndOfStream => {
            std.os.exit(0);
        },
        else => |e| return e,
    };
    return byte;
}

pub fn main() !void {
    var character = try readInput();
    while (true) {
        try stdout.writeByte(character);
        character = try readInput();
    }
    try stdout.writeByte('\n');
}
