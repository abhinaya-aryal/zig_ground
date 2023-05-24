const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var start: f16 = 0;
    const end = 300;

    try stdout.print("{s:2}\t {s:3}\n", .{ "F", "C" });

    while (start <= end) {
        const celsius = 5 * (start - 32) / 9;
        try stdout.print("{d}\t {d:.1}\n", .{ start, celsius });
        start += 20;
    }
    try stdout.print("\n", .{});
}
