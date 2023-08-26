function M = ex1_1_1(A,x)
    r = length(x);
    n = length(A);
    ident = eye(n);
    M = eye(n);
    for i=1:r
        M = M * (A-x(i)*ident);
    end
end
    