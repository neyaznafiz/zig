const std = @import("std");
const Allocator = std.mem.Allocator;
const print = std.debug.print;

pub fn run() !void {
    var gpa_mem = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(gpa_mem.deinit() == .ok);
    const heap = gpa_mem.allocator();

    const input = "My name is {name} bro";

    // var buffer: [64]u8 = undefined;
    // const staticSlice = try staticFormate(&buffer, input, "Jon");
    // print("{s} \n", .{staticSlice});

    const allocateSlice = try allocatorFormate(heap, input, "Jon");
    defer heap.free(allocateSlice);
    print("{s} \n", .{allocateSlice});
}

fn staticFormate(out_buff: []u8, input: []const u8, replace: []const u8) ![]u8 {
    const begin_offset = try getIndex(input, '{');
    const end_offset = try getIndex(input, '}') + 1;

    const limit = begin_offset + replace.len + input.len - end_offset;
    if(limit > out_buff.len) return error.LimitExceed;

    var offset: usize = 0;
    copy(out_buff, &offset, input[0..begin_offset]);
    copy(out_buff, &offset, replace);
    copy(out_buff, &offset, input[end_offset..]);

    return out_buff[0..limit];
}

fn allocatorFormate(heap: Allocator, input: []const u8, replace: []const u8) ![]u8 {
    const begin_offset = try getIndex(input, '{');
    const end_offset = try getIndex(input, '}') + 1;

    const limit = begin_offset + replace.len + input.len - end_offset;

    const buff = try heap.alloc(u8, limit);

    var offset: usize = 0;
    copy(buff, &offset, input[0..begin_offset]);
    copy(buff, &offset, replace);
    copy(buff, &offset, input[end_offset..]);

    return buff;
}

fn copy(out: []u8, of: *usize, input: []const u8) void {
    for(input) |c| {
        out[of.*] = c;
        of.* += 1;
    }
}

fn getIndex(input: []const u8, char: u8) !usize {
    for(input, 0..) |c, i| {
        if (c == char) return i;
    }

    return error.MissingDelemeter;
}