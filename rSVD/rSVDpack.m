function [U, S, V] = rSVDpack(A, k, p)
% The method in [Voronin and Martinsson, 2015] paper 
s = 5;
[m, n] = size(A);
B = randn(n, k+s);
Q = A*B;
for j = 1:p
    if mod((2*j-2), 2) == 0
        [Q, ~] = qr(Q, 0);
    end
    Q = A'*Q;
    if mod((2*j-1), 2) == 0
        [Q, ~] = qr(Q, 0);
    end
    Q = A*Q;
end
[Q, ~] = qr(Q, 0);
kn = k+s;
T = A'*Q;
[V, S, U] = eigSVD(T);
x = kn-k+1:kn;
S = S(x, x);
U = Q*U;
U = U(:,x);
V = V(:,x);
end