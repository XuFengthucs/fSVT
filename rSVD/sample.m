function M = sample(A, percent)
% This function is used for randomly sample percent% points from matrix A
o = A;
a = o';
[i, j, s] = find(a);
A = [i,j,s];
[m, n] = size(A);
one = rand(m, 1);
one(one > (1-percent) ) = 1;
one(one < 1) = 0;
A_new = A;
A_new(:, 3) = A_new(:, 3).*one;
M = sparse(A_new(:, 1), A_new(:,2), A_new(:,3), max(A(:,1)), max(A(:, 2)));