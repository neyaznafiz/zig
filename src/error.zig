const std = @import("std");
const print = std.debug.print;

// Error
// const FileOpenError = error {
//   AccessDenied,
//   OutOfMemory,
//   FileNotFound,
// };

// const AllocationError = error{OutOfMemory};
// pub fn fileOpenError() void {
//   const err: FileOpenError = AllocationError.OutOfMemory;
//   print("{any} \n", .{err});
// }

// pub fn catchError() void {
//   const maybe_error: AllocationError!u16 = 10;
//   const no_error = maybe_error catch 0;

//   print("{any} \n", .{no_error});
// }
// -----------------------------

pub fn handleNum() void {
  const result = inputNum(11) catch |err| {
    switch (err) {
      error.NumberIsEven => {
        print("{s} \n", .{"Number is even!"});
      },
      error.MayItIsNotPrime => {
        print("{s}\n", .{"May it's not a prime number!"});
      }
    }
    return;
  };

  print("{d}\n", .{result});
}

fn inputNum(num: u32) !u32 {
  if (num % 2 == 0) {
    return error.NumberIsEven;
  }
  else {
    return try primeCheck(num);
  }
}

fn primeCheck(num: u32) !u32 {
  var i: u32 = 2;
  while (i < num) : (i += 1) {
    if(num % i == 0) {
      return error.MayItIsNotPrime;
    }
  }

  return num;
}