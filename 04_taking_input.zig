const std = @import("std");
const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

fn take_input(buffer: []u8) !u16 {
    try stdout.print("Enter a number: ", .{});
    const input = try stdin.readUntilDelimiter(buffer, '\n');
    return std.fmt.parseInt(u16, input, 10);
}

pub fn main() !void {
    var buffer: [10]u8 = undefined;
    const user_input = try take_input(&buffer);
    try stdout.print("You entered: {d}\n", .{user_input});
}
