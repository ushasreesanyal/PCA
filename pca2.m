function [PC,V] = pca2(data)

% PCA2: Perform PCA using SVD.
% data - MxN matrix of input data
% (M dimensions, N trials)
% PC - each column is a PC
% V - Kx1 matrix of variances (K= min{M,N})

[M,N] = size(data);

% subtract off the mean for each dimension
mn = mean(data,2);
data = data - repmat(mn,1,N);

% construct the matrix Y
Y = data' ./ sqrt(N-1);

% SVD does it all
[u,S,PC] = svd(Y);


S = diag(S);
V = S .* S;




