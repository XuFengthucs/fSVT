load ml.mat;

%for CASE 2
%A = sample(A, 0.25);

%for CASE 3
%A = sample(A, 0.1);

niter = 1;
k = 100;
p = 0; % This can be modified for different power iteration
Anorm = norm(A, 'fro');

time = 0;
for i = 1:niter
t = cputime;
[U0, S0, V0] = basicrSVD(A, k, p);
time = time + cputime - t;
end
time_0 = time/niter;
%err_0 = norm(A-U0*S0*V0', 'fro')/Anorm;

time = 0;
for i = 1:niter
t = cputime;
[U1, S1, V1] = cSVD(A, k, p);
time = time + cputime - t;
end
time_1 = time/niter;
%err_1 = norm(A-U1*S1*V1', 'fro')/Anorm;

time = 0;
for i = 1:niter
t = cputime;
[U2, S2, V2] = rSVDpack(A, k, p);
time = time + cputime - t;
end
time_2 = time/niter;
%err_2 = norm(A-U2*S2*V2', 'fro')/Anorm;

time = 0;
for i = 1:niter
t = cputime;
[U3, S3, V3] = pcafast(A, k, p);
time = time + cputime - t;
end
time_3 = time/niter;
%err_3= norm(A-U3*S3*V3', 'fro')/Anorm;

time = 0;
for i = 1:niter
t = cputime;
[U4, S4, V4] = rSVDPI(A, k, p);
time = time + cputime - t;
end
time_4 = time/niter;
%err_4 = norm(A-U4*S4*V4', 'fro')/Anorm;