load ml.mat;

niter = 1;
k = 100;
p = 0;
Anorm = norm(A, 'fro');

time = 0;
for i = 1:niter
t = cputime;
[U0, S0, V0] = svds(A, k);
time = time + cputime - t;
end
time_0 = time/niter;
%err_0 = norm(A-U0*S0*V0', 'fro')/Anorm;

time = 0;
for i = 1:niter
t = cputime;
[U1, S1, V1] = rSVDPI(A, k, 2);
time = time + cputime - t;
end
time_1 = time/niter;
%err_1 = norm(A-U1*diag(S1)*V1', 'fro')/Anorm;

time = 0;
for i = 1:niter
t = cputime;
[U2, S2, V2] = rSVDPI(A, k, 15);
time = time + cputime - t;
end
time_2 = time/niter;
%err_2 = norm(A-U2*diag(S2)*V2', 'fro')/Anorm;

time = 0;
for i = 1:niter
t = cputime;
[U3, S3, V3] = rSVDBKI(A, k, 4);
time = time + cputime - t;
end
time_3 = time/niter;
%err_3 = norm(A-U3*diag(S3)*V3', 'fro')/Anorm;