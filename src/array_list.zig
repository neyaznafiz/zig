const std = @import("std");

pub fn arrList() !void {
    var gpa_mem = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa_mem.allocator();

    const name_1 = "Jon";
    const name_2 = "Deo";
    const name_3 = "Jems";

    const new_1 = try allocator.alloc(u8, name_1.len);
    std.mem.copyForwards(u8, new_1, name_1);

    const new_2 = try allocator.alloc(u8, name_2.len);
    std.mem.copyForwards(u8, new_2, name_2);

    const new_3 = try allocator.alloc(u8, name_3.len);
    std.mem.copyForwards(u8, new_3, name_3);


    var mod = try MyModule.init(allocator, new_1, new_2, new_3);
    defer mod.deinit();
    mod.print();

    allocator.free(new_1);
    allocator.free(new_2);
    allocator.free(new_3);

    // mod.print();
}

const MyModule = struct {
    list: std.ArrayList([]const u8),


    fn init(heap: std.mem.Allocator, name_1: []const u8, name_2: []const u8, name_3: []const u8) !MyModule {
        var module = std.ArrayList([]const u8).init(heap);
        try module.append(name_1);
        try module.append(name_2);
        try module.append(name_3);

        return MyModule { .list = module };
    }

    fn deinit(self: *MyModule) void {
        self.list.deinit();
    }


    fn print(self: *MyModule) void {
        std.debug.print("{s}\n", .{self.list.items[0]});
        std.debug.print("{s}\n", .{self.list.items[1]});
        std.debug.print("{s}\n", .{self.list.items[2]});
        
    }

};
