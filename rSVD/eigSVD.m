function [U, S, V]= eigSVD(A)
% function [U, S, V]= eigSVD(A)
% Computer economic SVD of matrix A (m>=n) using eig.
[~, n] = size(A);
B= A'*A;
[V, D]= eig(B);
d= diag(D);
e= sqrt(abs(d));
S= spdiags(e, 0, n, n);   
U= S\(A*V)';
U= U';
end
    

