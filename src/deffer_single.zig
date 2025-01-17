const std = @import("std");
const print = std.debug.print;

// Deffer
pub fn singleDeffer() void {
  var x: i16 = 5;
  {
    defer x += 2;
    print("inside block: {d} \n", .{x});
  }

  print("outside block: {d} \n", .{x});
}