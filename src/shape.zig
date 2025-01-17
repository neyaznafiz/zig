const std = @import("std");
const Allocator = std.mem.Allocator;
const print = std.debug.print;

pub fn initialize() !void {
    // const rect = [_]Rectangle{.{.x = 0, .y = 0}} ** 20;
    // var rect: [20]Rectangle = undefined;
    // for(0..rect.len) |i| {
    //     rect[i] = initRect(10 + i, 20 + i);
    //     rect[i].zoom();
    //     rect[i].printZoom();
    // }

    var gpa_mem = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(gpa_mem.deinit() == .ok);
    const heap = gpa_mem.allocator();

    const rect = try shapeBuilder(heap, 100, 200);
    defer heap.destroy(rect);
    rect.*.zoom();
    rect.*.printZoom();

    const data = try heap.alloc(u8, rect.*.x);
    defer heap.free(data);
    print("{d} \n", .{data.len});
}

fn shapeBuilder(heap: Allocator, x: u64, y: u64) !*Rectangle {
    const rect = try heap.create(Rectangle);
    rect.* = initRect(x, y);
    return rect;

    // var rect = shape.initRect(x, y);
    // return &rect;
}

fn initRect(x: u64, y: u64) Rectangle {
    return .{
        .x = x,
        .y = y
    };
}

const Rectangle = struct {
    x: u64,
    y: u64,

    fn zoom(self: *Rectangle) void {
        self.x *= 2;
        self.y *= 2;
    }

    fn printZoom(self: *const Rectangle) void {
        print("x: {d}, y: {d} \n", .{self.x, self.y});
    }
};