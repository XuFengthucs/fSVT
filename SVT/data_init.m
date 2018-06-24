percent = 0.8;
ind = unique(Origin(:, 2)); 
inv_ind =  zeros(max(Origin(:, 2)), 1); 
[k,~] = size(ind); 
for i = 1:k
     inv_ind(ind(i)) = i;
end
[k, ~, ~] = size(Origin); 
for i = 1:k
    Origin(i, 2) = inv_ind(Origin(i, 2));
end
o = sparse(Origin(:,1), Origin(:,2), Origin(:,3));
a = o';
[i, j, s] = find(a);
A = [i,j,s];
[m, n] = size(A);
one = rand(m, 1);
one(one > (1-percent)) = 1;
one(one < 1) = 0;
A_new = A;
A_new(:, 3) = A_new(:, 3).*one;
M = sparse(A_new(:, 1), A_new(:,2), A_new(:,3), max(A(:,1)), max(A(:, 2)));
All  = sparse(A(:,1), A(:,2), ones(m, 1), max(A(:,1)), max(A(:, 2)));
Train = sparse(A(:,1), A(:,2), one, max(A(:,1)), max(A(:, 2)));
Test_One = sparse(A(:,1), A(:,2), 1-one, max(A(:,1)), max(A(:, 2)));
Test = sparse(A(:,1), A(:,2), (1-one).*A(:,3), max(A(:,1)), max(A(:, 2)));