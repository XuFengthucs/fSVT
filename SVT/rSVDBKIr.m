function [U, S, V, Q] = rSVDBKIr(A, k, i, Q)
% This is a modification of rSVD-BKI which can reuse the subspace
s = 5;
if nargin == 3
    [m,n]= size(A);
    B= randn(n, k+s);
    H = zeros(m, (k+s)*i);
    [H(:, 1:k+s), ~] = lu(A*B);
    for j = 2:i
        [H(:, (k+s)*(j-1)+1:(k+s)*j), ~] = lu(A*(A'* H(:, (k+s)*(j-2)+1:(k+s)*(j-1))));
    end
    [Q, ~] = qr(H, 0);
    kn = i*(k+s);
else
    kn = size(Q, 2); 
end
T = A'*Q;
[v, d] = eig(T'*T);
ss=sqrt(diag(d));
S= spdiags(ss, 0, kn, kn);
u=(S\(T*v)')';
V = u;
x = kn-k+1:kn;
S = ss(x);
U = Q*v(:, x);
V = V(:,x);
end