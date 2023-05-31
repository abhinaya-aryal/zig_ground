const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn Stack(comptime T: type) type {
    return struct {
        const Self = @This();
        const Node = struct {
            value: T,
            next: ?*Node,
        };
        allocator: std.mem.Allocator,
        length: usize,
        head: ?*Node,

        pub fn init(allocator: std.mem.Allocator) Self {
            return .{
                .allocator = allocator,
                .head = null,
                .length = 0,
            };
        }

        pub fn push(self: *Self, value: T) !void {
            self.length += 1;
            var next = try self.allocator.create(Node);
            next.value = value;
            if (self.head) |head| {
                next.next = head;
                self.head = next;
            } else {
                self.head = next;
                next.next = null;
            }
        }

        pub fn pop(self: *Self) void {
            if (self.head) |head| {
                self.head = head.next;
                self.allocator.destroy(head);
                self.length -= 1;
            }
        }

        pub fn print(self: *Self) !void {
            try stdout.print("\nThe current length of stack is: {d}\n", .{self.length});
            if (self.length == 0) {
                try stdout.print("Empty Stack!!", .{});
            } else {
                var current = self.head;
                while (current) |curr| {
                    try stdout.print("{d}\t", .{curr.value});
                    current = curr.next;
                }
            }
            try stdout.print("\n\n", .{});
        }
    };
}

const IntStack = Stack(i32);

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    const allocator = arena.allocator();

    defer arena.deinit();

    var stack = IntStack.init(allocator);

    try stack.print();
    try stack.push(2);
    try stack.print();
    try stack.push(4);
    try stack.print();
    stack.pop();
    try stack.print();
    stack.pop();
    try stack.print();
    try stack.push(2);
    try stack.push(20);
    try stack.push(2000);
    try stack.print();

    var stack2 = IntStack.init(allocator);
    try stack2.print();
    try stack2.push(33);
    try stack2.push(44);
    try stack2.push(55);
    try stack2.print();
    stack2.pop();
    try stack2.print();
    try stack2.push(66);
    try stack2.print();
}
