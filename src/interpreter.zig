const ast = @import("ast.zig");

fn eval(expr: *ast.Expr) i64 {
    return switch (expr.*) {
        .Number => expr.Number,
        .Add => eval(expr.Add.left) + eval(expr.Add.right),
    };
}
