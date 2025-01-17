const std = @import("std");
const print = std.debug.print;

const Strc = struct {
    a: []const u8 = "Apple",
    b: []const u8 = "Ball",
    c: ?[]const u8 = null,

    pub fn init(a: []const u8, b: []const u8, c: ?[]const u8) Strc {
      return Strc {
        .a = a,
        .b = b,
        .c = c,
      };
    }
};


pub fn structStruucture() void {
  const x: Strc = .{
    .a = "Air",
  };
  print("a: {s} \n", .{x.a});
  print("b: {s} \n", .{x.b});
  print("c: {?s} \n \n", .{x.c});


  const y: Strc = .{
    .a = "Air",
    .c = "Coin",
  };
  print("a: {s} \n", .{y.a});
  print("b: {s} \n", .{y.b});
  print("c: {?s} \n \n", .{y.c});


  const z = Strc.init("Air", "Bottle", null);
  print("a: {s} \n", .{z.a});
  print("b: {s} \n", .{z.b});
  print("c: {?s} \n", .{z.c});

}