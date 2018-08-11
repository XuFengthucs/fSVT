function [U, S, V] = cSVD(A, k, p)
% The method in [Benjamin Erichson et al., 2017] papaer using Gaussian
% matrix
s = 5;
kn = k+s;
[m,n]= size(A);
B = randn(n, kn);
if p == 0
    Q = A*B;
    B = Q'*Q;
    B = 0.5*(B+B');
    [V, D]= eig(B);
    d= diag(D);
    e= sqrt(abs(d));
    S= spdiags(e, 0, kn, kn);   
    U= S\(Q*V)';
    Q= U';
else
    [Q, ~] = qr(A*B, 0);
    for j = 1:p
        [Q, ~] = qr((A'*Q), 0);
        if j == p
            Q = A*Q;
            B = Q'*Q;
            B = 0.5*(B+B');
            [V, D]= eig(B);
            d= diag(D);
            e= sqrt(abs(d));
            S= spdiags(e, 0, kn, kn);   
            U= S\(Q*V)';
            Q= U';
        else
            [Q, ~] = qr(A*Q, 0);
        end
    end
end
T = A'*Q;
[V, S, U] = svd(T, 'econ');
U = Q*U(:, 1:k);
S = S(1:k, 1:k);
V = V(:, 1:k);
end