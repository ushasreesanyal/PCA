function [Z] = encode(data,k,PC,mn)
[M,N] = size(data);

UM = PC(:,1:k); %PRINCIPAL COMPONENT

% subtract off the mean for each dimension
data = data - repmat(mn,1,N);

Z = UM'*data;