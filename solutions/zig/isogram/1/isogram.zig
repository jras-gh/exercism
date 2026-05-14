const std = @import("std");
const ascii = std.ascii;

pub fn isIsogram(str: []const u8) bool {
    var alphabet: u32 = 0;

    for (str) |c| {
        if (ascii.isAscii(c) and ascii.isAlphabetic(c)) {
            const mask: u32 = @as(u32, 1) << @truncate(ascii.toLower(c) - 'a');

            if (alphabet & mask == mask) {
                return false;
            }

            alphabet ^= mask;
        }
    }

    return true;
}
