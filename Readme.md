# Programs of fast SVT algorithm
---
##1.Main algorithms
rSVD/eigSVD.m ---- computes the singular value decomposition with eigendecomposition
rSVD/rsvdPI.m ---- fast randomized SVD with power iteration
rSVD/rsvdBKI.m ---- fast randomized SVD with block Krylov-subspace iteration
SVT/fSVT_Q.m ---- fast SVT with subspace Q reuse
SVT/fSVT_U.m ---- fast SVT with subspace U reuse
##2.Other algorithms for comparson
rSVD/brsvd.m ---- Basic randomized SVD in [1]
rSVD/pcafast.m ---- randomized SVD in [2]
rSVD/rsvdpack.m ---- randomized SVD in [3]
rSVD/rsvdcs.m ---- Compressed SVD using Gaussian projection matrix in [4]
SVT/SVT.m ---- Singular value thresholding algorithm with 'svds' in Matlab in [5]


##Reference
[1] N Halko, P. G Martinsson, and J. A Tropp. Finding structure with randomness: Probabilistic algorithms for constructing approximate matrix decompositions. Siam Review, 53(2):217–288, 2011.
[2] H. Li, G. C. Linderman, A. Szlam, K. P. Stanton, Y. Kluger, and M. Tygert. Algorithm 971: An implementation of a randomized algorithm for principal component analysis. Acm Transactions on Mathematical Software, 43(3):1–14, 2017.
[3] Sergey Voronin and PerGunnar Martinsson. Rsvdpack: An implementation of randomized algorithms for computing the singular value, interpolative, and cur decompositions of matrices on multi-core and gpu architectures. arXiv preprint arXiv:1502.05366, 2015.
[4] N. Benjamin Erichson, Steven L. Brunton, and J. Nathan Kutz. Compressed singular value decomposition for image and video processing. In Proc. IEEE International Conference on Computer Vision (ICCV), Oct 2017.
[5] Jian Feng Cai, Emmanuel J Cand`es, and Zuowei Shen. A singular value thresholding algorithm for matrix completion. SIAM Journal on Optimization, 20(4):1956–1982, 2010.

