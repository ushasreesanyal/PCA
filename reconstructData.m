function [Output] = reconstructData(data,k,PC,mn)

[M,N] = size(data);

UM = PC(:,1:k); %PRINCIPAL COMPONENT

% subtract off the mean for each dimension
% mn = mean(data,2);
data = data - repmat(mn,1,N);
Z = UM'*data;
Output = repmat(mn,1,N)+UM*Z;
