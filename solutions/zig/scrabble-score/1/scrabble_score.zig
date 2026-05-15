const ascii = @import("std").ascii;

pub fn score(s: []const u8) u32 {
    var sum: u32 = 0;
    for (s) |c| {
        switch (ascii.toUpper(c)) {
            'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' => sum += 1,
            'D', 'G' => sum += 2,
            'B', 'C', 'M', 'P' => sum += 3,
            'F', 'H', 'V', 'W', 'Y' => sum += 4,
            'K' => sum += 5,
            'J', 'X' => sum += 8,
            'Q', 'Z' => sum += 10,
            else => unreachable,
        }
    }
    return sum;
}
