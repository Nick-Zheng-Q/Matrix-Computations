function C = Triangular_Matrix_Mul(A,B)
for i = 1:n
    for j = i:n
        for k = i:j
            C(i,j) = C(i,j) + A(i,j) * B(k,j)
        end
    end
end
end
% 
% for i = 1:n
%     for j = i:n
%             C(i,j) = C(i,j) + A(i,i:j) * B(i:j,j)
%     end
% end