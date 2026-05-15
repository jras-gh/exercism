pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

const std = @import("std");
const ascii = std.ascii;

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var counts: Counts = Counts{ .a = 0, .c = 0, .g = 0, .t = 0 };
    const fields = @typeInfo(Counts).@"struct".fields;

    l: for (s) |c| {
        if (!ascii.isAscii(c) or !ascii.isUpper(c)) {
            return NucleotideError.Invalid;
        }

        inline for (fields) |v| {
            if (v.name[0] == ascii.toLower(c)) {
                @field(counts, v.name) += 1;
                continue :l;
            }
        }

        return NucleotideError.Invalid;
    }

    return counts;
}
