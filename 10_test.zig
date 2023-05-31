const std = @import("std");

fn addOne(number: i32) i32 {
    return number + 1;
}

test "for 20" {
    try std.testing.expect(addOne(20) == 21);
}

// NOTE: Run by using `zig test <filename>` command
