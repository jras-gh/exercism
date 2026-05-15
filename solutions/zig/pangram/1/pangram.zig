const std = @import("std");
const ascii = std.ascii;

pub fn isPangram(str: []const u8) bool {
    var bitset: u32 = 0;

    for (str) |c| {
        if (ascii.isAscii(c) and ascii.isAlphabetic(c)) {
            bitset |= @as(u32, 1) << @truncate(ascii.toLower(c) - 'a');
        }
    }

    return bitset == 0x3FFFFFF;
}
