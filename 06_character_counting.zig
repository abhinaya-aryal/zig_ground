const std = @import("std");
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    var count: u32 = 0;
    var c = stdin.readByte() catch |err| switch (err) {
        error.EndOfStream => {
            try stdout.print("\n\nNo. of characters = {d}\n\n", .{count});
            std.os.exit(0);
        },
        else => |e| return e,
    };
    while (true) {
        count += 1;
        c = stdin.readByte() catch |err| switch (err) {
            error.EndOfStream => {
                try stdout.print("\n\nNo. of characters = {d}\n\n", .{count});
                std.os.exit(0);
            },
            else => |e| return e,
        };
    }
}
