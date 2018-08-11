function [U, S, V] = pcafast(A, k, p)
% The method in [Li et al., 2017] paper
s = 5;
[m, n] = size(A);
B = randn(n, k+s);
if p == 0
    [Q, ~] = qr(A*B, 0);
else
    [Q, ~] = lu(A*B);
end
for j = 1:p
    [Q, ~] = lu((A'*Q));
    if j == p
        [Q, ~] = qr((A*Q), 0);
    else
        [Q, ~] = lu(A*Q);
    end
end
B = Q'*A;
[U, S, V] = svd(B, 'econ');
U = Q*U;
U = U(:, 1:k);
S = S(1:k, 1:k);
V = V(:, 1:k);
end