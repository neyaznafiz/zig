const std = @import("std");
const print = std.debug.print;

// If Statement
pub fn ifStatement() void {
  const a: bool = true;
  var x: u16 = undefined;

  // Style 1
  if (a) {
    x = 1;
  }
  else {
    x = 0;
  }
  print("{d} \n", .{x});

  // Style 2
  if (!a) x = 1
  else x = 0;
  print("{d} \n", .{x});

  // Style 3
  x = if (a) 1 else 0;

  print("{d} \n", .{x});
}