function y = Band_Storage_Gaxpy(Aband,x)
% A has lower bandwidth p and upper bandwidth q
    for j =1:n 
        alpha1 = max(1,j-q);alpha2 = min(n,j+p);
        beta1 = max(1,q+2-j);beta2 = beta1+alpha2-alpha1;
        y(alpha1:alpha2) = y(alpha1:alpha2) + Aband(beta1:beta2)*x(j);
    end
end