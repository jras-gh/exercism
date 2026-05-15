const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var buf = try allocator.alloc(u8, dna.len);
    for (dna, 0..) |d, i| {
        switch (d) {
            'A' => buf[i] = 'U',
            'C' => buf[i] = 'G',
            'G' => buf[i] = 'C',
            'T' => buf[i] = 'A',
            else => unreachable,
        }
    }
    return buf;
}
