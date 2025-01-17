const std = @import("std");
const print = std.debug.print;

pub fn oprionalOperator() void {
      var a: ?usize = null;
    if (a) |value| {
        print("{d} \n", .{value});
    } else {
        a = 0;
        print("{?d} \n", .{a});
    }
}