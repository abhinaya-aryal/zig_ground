const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    const hello_world =
        \\
        \\const std = @import("std");
        \\const stdout = std.io.getStdOut().writer();
        \\
        \\pub fn main() !void {
        \\  try stdout.print("Hello {s}!!", .{"world"});
        \\}
        \\
        \\
    ;
    try stdout.writeAll(hello_world);
}
