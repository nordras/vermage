const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable("vermage", "src/main.zig");
    exe.setTarget(b.standardTargetOptions(.{}));
    exe.setBuildMode(b.standardReleaseOptions());
    exe.install();
}
