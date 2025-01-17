const std = @import("std");
const print = std.debug.print;

// Arrays
pub fn arrays() void {
  const size: i8 = 2;
  const array: [size]u8 = .{2, 4};
  const array_two: [2]u8 = .{5, 6};
  const array_three = [_]u8{'h', 'e'};

  print("{d} {d} {d} \n", .{array, array_two, array_three.len});
}