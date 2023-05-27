const std = @import("std");
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    var c = try stdin.readByte();
    while (true) {
        try stdout.writeByte(c);
        c = try stdin.readByte();
    }

    try stdout.writeByte('\n');
}
