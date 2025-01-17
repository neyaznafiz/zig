const std = @import("std");
const print = std.debug.print;

pub fn multiDeffer() void {
  var x: f16 = 5;
  {
    defer x += 2;
    defer x /= 2; 
  }

  print("outside block: {d} \n", .{x}); // output: 4.5
}