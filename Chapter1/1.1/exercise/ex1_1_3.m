function C = ex1_1_3(x,y,k)
    n = length(x);
    out = 0;
    C = zeros(n);
    for i=1:n
        out = out + y(i)*x(i);
    end
    for i=1:n
        for j=1:n
            C(i,j) = x(i)*y(j);
        end
    end
    C = C * (out ^ (k-1));
end