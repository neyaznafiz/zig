const std = @import("std");
const ArrayList = std.ArrayList;

pub fn arrList() !void {
    const allocator = std.heap.page_allocator;

    var list = std.ArrayList([]const u8).init(allocator);

    const str = randomString();
    const len = str.len;
    for(0..len) |_| {
        try list.append(str);
        defer list.deinit();
    }

    // Access elements
    for (list.items, 0..) |item, idx| {
        std.debug.print("Index {d}: {s}\n", .{idx, item});
    }
}

fn randomString() []const u8 {
    const arr = [_]u8{'H', 'e', 'l', 'l', 'o'};
    return &arr; // Return a slice of the array
}