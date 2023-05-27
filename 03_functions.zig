const std = @import("std");
const stdout = std.io.getStdOut().writer();

fn addInt(a: u8, b: u8) u9 {
    return a + b;
}

pub fn main() !void {
    var a: u8 = 40;
    var b: u8 = 60;
    var sum = addInt(a, b);

    try stdout.print("Sum = {d}\n", .{sum});
}
