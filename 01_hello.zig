const std = @import("std");

pub fn main() !void {
    // std.debug.print("Hello World!\n", .{});
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello World!!!\n", .{});
}
