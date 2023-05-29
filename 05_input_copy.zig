const std = @import("std");
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();

fn readInput() !*u8 {
    var c = stdin.readByte() catch |err| switch (err) {
        error.EndOfStream => {
            std.os.exit(0);
        },
        else => |e| return e,
    };
    return &c;
}

pub fn main() !void {
    var c = try readInput();
    while (true) {
        try stdout.writeByte(c.*);
        c = try readInput();
    }

    try stdout.writeByte('\n');
}
