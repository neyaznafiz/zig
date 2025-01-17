const std = @import("std");
const print = std.debug.print;

pub fn singlePointer() void {
  var x: i32 = 1234;
  const x_ptr = &x;
  x_ptr.* += 1;
  print("Address X:{d}, Value X:{d} \n", .{x_ptr, x_ptr.*});

  const y: i32 = 4678;
  var y_ptr = &y;
  print("Address Y:{d}, Value Y:{d} \n", .{y_ptr, y_ptr.*});

  y_ptr = &x;
  print("Address X in Y:{d}, Value X in Y:{d} \n", .{y_ptr, y_ptr.*});
}