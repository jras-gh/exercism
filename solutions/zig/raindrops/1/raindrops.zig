const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var remaining = buffer;
    var has_matches: bool = false;

    if (n % 3 == 0) {
        const s = "Pling";
        @memcpy(remaining[0..s.len], s);
        remaining = remaining[s.len..];
        has_matches = true;
    }
    if (n % 5 == 0) {
        const s = "Plang";
        @memcpy(remaining[0..s.len], s);
        remaining = remaining[s.len..];
        has_matches = true;
    }
    if (n % 7 == 0) {
        const s = "Plong";
        @memcpy(remaining[0..s.len], s);
        remaining = remaining[s.len..];
        has_matches = true;
    }

    if (!has_matches) {
        return std.fmt.bufPrint(buffer, "{d}", .{n}) catch unreachable;
    }

    return buffer[0 .. buffer.len - remaining.len];
}
