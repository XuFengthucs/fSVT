t = cputime;
X = SVT(M, 0.6, [0 5], 5);
%X = fastSVT_Q(M, 0.6, [0 5], 50, 10, 5);
time = cputime - t;
err_test = sum(sum(abs(Test-Test_One.*X)))/(m-nnz(one));
