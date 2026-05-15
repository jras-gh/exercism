/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    var count: u8 = 0;

    for (s) |chr| {
        buffer[s.len - 1 - count] = chr;
        count += 1;
    }

    return buffer[0..s.len];
}
