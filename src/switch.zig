const std = @import("std");
const print = std.debug.print;

// Switch
pub fn switchExpression() void {
  var x: i8 = 10;

  x = switch (x) {
    -1...1 => -x,
    10, 100 => @divExact(x, 10),
    else => x,
  };

  if (x == 1 or x == 10) {
    print("{d} \n", .{x});
  }
  else {
    print("{s} \n", .{"Value of 'x' must be: 10 or 100"});
  }
}