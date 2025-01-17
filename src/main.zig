const std = @import("std");
const print = std.debug.print;

const sum = @import("./sum.zig");
const assignment = @import("./assignment.zig");
const arr = @import("./arrays.zig");
const slice = @import("./slice.zig");
const ifStatement = @import("./if_statement.zig");
const forLoop = @import("./for_loop.zig");
const fibonacci = @import("./functions.zig");
const singleDeffer = @import("./deffer_single.zig");
const multiDeffer = @import("./deffer_multi.zig");
const switchExpression = @import("./switch.zig");
const err = @import("./error.zig");
const pointer = @import("./pointer.zig");
// const struct = @import("./struct.zig");
const shape = @import("./shape.zig");
const allocator = @import("./allocator.zig");
const optional = @import("./optional.zig");
const structExpression = @import("./struct.zig");

pub fn main () !void {
    // const result = sum.add_of_two(12, 5);
    // print("{d} \n", .{result});

    // assignment();
    
    // arr.arrays();
    // slice.sliceOperation();

    // ifStatement();

    // forLoop();

    // const result = fibonacci(10);
    // print("{d} \n", .{result});

    // singleDeffer();
    // multiDeffer();

    // err.fileOpenError();
    // err.catchError();
    // err.handleNum();

    // switchExpression.switchExpression();

    // pointer.singlePointer();

    // try shape.initialize();
    // try allocator.run();

    // optional.oprionalOperator();

    structExpression.structStruucture();
}

