const std = @import("std");
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();

fn readInput(count: u32) !void {
    _ = stdin.readByte() catch |err| switch (err) {
        error.EndOfStream => {
            try stdout.print("\n\nNo. of characters = {d}\n\n", .{count});
            std.os.exit(0);
        },
        else => |e| return e,
    };
}

pub fn main() !void {
    var count: u32 = 0;
    try readInput(count);
    while (true) {
        count += 1;
        try readInput(count);
    }
}
