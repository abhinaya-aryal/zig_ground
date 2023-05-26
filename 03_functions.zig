const std = @import("std");
const stdout = std.io.getStdOut().writer();

fn addInt(a: i32, b: i32) i32 {
    return a + b;
}

pub fn main() !void {
    var a: i32 = 400000;
    var b: i32 = 600000;
    var sum = addInt(a, b);

    try stdout.print("Sum = {d}\n", .{sum});
}
