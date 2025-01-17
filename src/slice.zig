const std = @import("std");
const print = std.debug.print;

pub fn sliceOperation() void {
  // var user_input = "Hello World";
  var arr: [6]u8 = .{1,2,3,4,5,6};

  var offset: usize = 4;
  offset += 1;

  const x = arr[0..offset];

  print("{d} \n", .{x});
}