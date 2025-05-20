const Expr = union(enum) {
    Number: i64,
    Add: struct {
        left: *Expr,
        right: *Expr,
    },
};
