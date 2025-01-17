const std = @import("std");
const print = std.debug.print;

// For Loops
pub fn forLoop() void {
  const string = [_]u8{ 'a', 'b', 'c' };

  print("{s} \n", .{"Value And Index"});
  for (string, 0..) |character, index| {
    print("{c}, {d} \n", .{character, index});
  }

  print("{s} \n", .{"Only Value"});
  for (string) |character| {
    print("{c} \n", .{character});
  }

  print("{s} \n", .{"Only Index"});
  for (string, 0..) |_, index| {
    print("{d} \n", .{index});
  }
}