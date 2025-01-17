const std = @import("std");
const print = std.debug.print;
// Assignment
pub fn assignment() void {
  const con: i32 = 5;
  var vari: u32 = 251;
  vari = vari + con;
  print("{d} {d} \n", .{con, vari});
}