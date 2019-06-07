# Programs of fast SVT algorithm
---

##1.Main algorithms

rSVD/eigSVD.m ---- computes the singular value decomposition with eigendecomposition in [1]

rSVD/rSVDPI.m ---- fast randomized SVD with power iteration in [1]

rSVD/SVDBKI.m ---- fast randomized SVD with block Krylov-subspace iteration in [1]

SVT/fastSVT_Q.m ---- fast SVT with subspace Q reuse in [1]

SVT/fastSVT_U.m ---- fast SVT with subspace U reuse in [1]

##2.Other algorithms for comparson

rSVD/basicrSVD.m ---- Basic randomized SVD in [2]

rSVD/pcafast.m ---- randomized SVD in [3]

rSVD/rSVDpack.m ---- randomized SVD in [4]

rSVD/cSVD.m ---- Compressed SVD using Gaussian projection matrix in [5]

SVT/SVT.m ---- Singular value thresholding algorithm with 'svds' in Matlab in [6]

SVT/SVTlansvd.m ---- Singular value thresholding algorithm with 'lansvd' in PROPACK[7]

##3.Experiments of the testing

(1) Comparision of randomized SVD algorithms

rSVD/test.m is used for the experiment in comparing the cputime and relative error of basic rSVD, rsvdpack, pcafast, rsvdcs and rSVD-PI. The sequences of calculating the ralative error are commented because of the huge memory it needs. There are 3 nonzeros can be used in the test.

rSVD/test2.m is used for the experiment in comparing the rSVD-PI with rSVD-BKI with the svds a basic line.

rSVD/ml.mat is the matrix cut from 10M movielens dataset[7]. rSVD/sample.m is used to sample some point from the initial sparse matrix.

(2) The SVT for image recovery

SVT/new4.jpg is the image used in this section. SVT/pic_Omega.mat owns Ome (20% nonzeros) and Ome10 (10% nonzeros). 

SVT/testSVT_pic.m is used to test the SVT in image recovery. The comment can be changed to see the differences between SVT algorithm and fastSVT algorithm.

(3) The SVT for rating matrix completion

Firstly you should get the Movielens datasets [8] from there website https://grouplens.org/datasets/movielens/, then read the load data matrix with CSR format with variable 'Origin'(3 columns with CSR format), and the run the SVT/data_init.m to divide the dataset into 80% and 20% or 90% and 10%(controlled by the variable 'percent'). Then run the SVT/testSVT_ml.m. The delta of 20M movielen dataset is 4 compared with 5 of 10M dataset.

(4) The output in SVT/SVT.m and SVT/SVTlansvd.m every iteration is [#iters rank relative_error], and the output in SVT/fastSVT_Q.m and SVT/fastSVT_U.m every iteration is [#iters rank relative_error power_iteration_parameter].


##Reference

[1] Xu Feng, Wenjian Yu, and Yaohang Li, "Faster matrix completion using randomized SVD," in Proc. the 30th IEEE International Conference on Tools with Artificial Intelligence (ICTAI) , Volos, Greece, Nov. 2018.

[2] N Halko, P. G Martinsson, and J. A Tropp. Finding structure with randomness: Probabilistic algorithms for constructing approximate matrix decompositions. Siam Review, 53(2):217-288, 2011.

[3] H. Li, G. C. Linderman, A. Szlam, K. P. Stanton, Y. Kluger, and M. Tygert. Algorithm 971: An implementation of a randomized algorithm for principal component analysis. Acm Transactions on Mathematical Software, 43(3):1-14, 2017.

[4] Sergey Voronin and PerGunnar Martinsson. Rsvdpack: An implementation of randomized algorithms for computing the singular value, interpolative, and cur decompositions of matrices on multi-core and gpu architectures. arXiv preprint arXiv:1502.05366, 2015.

[5] N. Benjamin Erichson, Steven L. Brunton, and J. Nathan Kutz. Compressed singular value decomposition for image and video processing. In Proc. IEEE International Conference on Computer Vision (ICCV), Oct 2017.

[6] Jian Feng Cai, Emmanuel J Cand`es, and Zuowei Shen. A singular value thresholding algorithm for matrix completion. SIAM Journal on Optimization, 20(4):1956-1982, 2010.

[7] Rasmus Munk Larsen. PROPACK-software for large and sparse svd calculations. Available online. URL http://sun.stanford.edu/rmunk/PROPACK, 2004.

[8] F. Maxwell Harper and Joseph A. Konstan. The movielens datasets: History and context. ACM Transactions on Interactive Intelligent Systems (TiiS), 5(4):19, 2016.

