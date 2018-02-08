pic = imread('new4.jpg');
pic = double(pic)/255;
load pic_Omega
Omega = full([Ome;Ome;Ome]);
M = sparse([pic(:,:,1);pic(:,:,2);pic(:,:,3)].*Omega);
parfor i = 1
end
t = cputime;
%[X, iters, k] = SVT(M, 0.1, [0 1]);
[X, iters, k] = fastSVT_Q(M, 0.1, [0 1], 50, 10);
t_SVT = cputime - t
err = sum(sum(abs([pic(:,:,1);pic(:,:,2);pic(:,:,3)]-X)))/2048/2048/3*255