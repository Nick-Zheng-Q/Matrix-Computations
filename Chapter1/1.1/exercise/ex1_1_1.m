function result_column = ex1_1_1(A,x)
    r = length(x);
    n = length(A);
    result_column = zeros(n, 1);
    result_column(1) = 1;
    for i = 1:r
        y = A * result_column - x(i) * result_column;
        result_column = y;
    end
end    