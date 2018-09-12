const std = @import("std");
const mem = std.mem;
const assert=std.debug.assert;
const Buffer = std.Buffer;
const builtin= @import("builtid");

const Writer =struct{
    buf : Buffer,
    pub fn init(allocator : *mem.Allocator) !Writer{
        var buf= try Buffer.init(allocator,"");
        return Writer{.buf=buf};
    }

    pub fn deinit(w: *Writer) void{
        w.buf.deinit();
    }

    pub fn appendByte(w: *Writer, byte: u8) !void{
        w.buf.appendByte(byte);
    }

    pub fn append(w :*Writer, m: []const u8) !void{
        w.buf.append(m);
    }

    pub fn writeString(w : *Writer, m: []const u8) !void{
       try w.buf.append(m);
       try w.buf.append("\x00");
    }
    
    pub fn writeInt16(w: *Writer, v: i16) !void{
        var buf: [2]const u8 = undefined;
        mem.writeInt(buf[0..],v,builtin.Endian.Big);
        try w.append(buf);
    }

    pub fn writeInt32(w: *Writer, v: i32) !void{
        var buf: [4]const u8 = undefined;
        mem.writeInt(buf[0..],v,builtin.Endian.Big);
        try w.append(buf);
    }
};


test "Writer" {
    var w=try Writer.init(std.debug.global_allocator);
    try w.writeString("hello");
    w.deinit();
}

const Reader =struct{
    buf: []const u8,
    offset: usize,
    pub const EOF =error.EOR;

    pub fn init(buffer: []const u8) Reader{
        return Reader{
            .buf=buffer,
            .offset=0,
        };
    }

    pub fn empty(r : *Reader)bool{
        return r.buf.len<=r.offset;
    }

    pub fn readByte(r: *Reader)!u8{
        if (r.empty()){
            return Reader.EOF;
        }
        const byte =r.buf[r.offset];
        r.offset=r.offset+1;
        return byte;
    }
};

test "Reader" {
    var r =Reader.init("");
    assert(r.empty()==true);

    r =Reader.init("abcd");
    assert(r.empty()==false);
    const a =try r.readByte();
    assert(a=='a');
}