const std = @import("std");
const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

fn readInput(lcount: *u32) !u8 {
    var c = stdin.readByte() catch |err| switch (err) {
        error.EndOfStream => {
            try stdout.print("\n\nNo. of lines= {d}\n\n", .{lcount.*});
            std.os.exit(0);
        },
        else => |e| return e,
    };
    return c;
}

pub fn main() !void {
    var lcount: u32 = 1;
    var char = try readInput(&lcount);
    while (true) {
        if (char == '\n') {
            lcount += 1;
        }
        char = try readInput(&lcount);
    }
}
