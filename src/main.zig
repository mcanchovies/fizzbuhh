// FIZZBUZZ

const std = @import("std");
const print = std.debug.print;
pub fn main() void {
    print("\n\tWHILE LOOP", .{});
    wil_fb();
    print("\n\tFOR LOOP", .{});
    for_fb();
    print("\n\tRECURSIVE FUNCTION", .{});
    const n_start: u8 = 1;
    recurse_fb(n_start);
    print("\n\tSWITCH STATEMENT", .{});
    sw(n_start);
}

pub fn f_or_b_or_fb(x: u8) void {
    if (x % 15 == 0) {
        print("\nfizzbuzz", .{});
    } else if (x % 3 == 0) {
        print("\nfizz", .{});
    } else if (x % 5 == 0) {
        print("\nbuzz", .{});
    } else {
        print("\n{}", .{x});
    }
}

pub fn wil_fb() void {
    var n_i: u8 = 1;
    while (n_i < 101) : (n_i += 1) {
        f_or_b_or_fb(n_i);
    }
}

pub fn for_fb() void {
    for (0..100) |n_i| {
        f_or_b_or_fb(@intCast(n_i));
        // you can also do `@as(u8, @intCast(n_i))` here, the goal is
        // just to make this a u8 not a usize, @intCast will look at
        // the function param declaration in f_or_b_or_fb() and see u8
        // and cast it as u8 bc of the context anyway

        // the book didn't specify you can use a range by itself
        // (the example given is a range in conjunction with an array) but
        // ranges are how 90% of 8 kata python loops work so i figured
        // i'd probably be able to use ranges here too
    }
}

pub fn recurse_fb(n_i: u8) void {
    var i: u8 = n_i;
    f_or_b_or_fb(i);
    i += 1;
    if (i < 101) {
        recurse_fb(i);
    }
}

pub fn sw(n_start: u8) void {
    var n_i = n_start;
    loop: switch (n_i) {
        0...100 => |i| { // why the for loop ranges are two dots when these use 3 dots is beyond me
            f_or_b_or_fb(i);
            if (i < 101) {
                n_i = i + 1;
                continue :loop n_i;
            }
        },
        else => {
            print("\n\nthat's all folks", .{});
        },
    }
}
