% Finding the result using train data and evaualuating the test data
% Xhat - Reconstructed train data
% Y - Test dataset   
% Yhat - Reconstructed test data
% lowDimTest - Low dimensional representation of data
function[lowDim] = solution2(train,test)

X = cell2mat(cellfun(@(x)[x(:);zeros(4-numel(x),1)],train,'un',0)); 
[m,n] = size(X);

[PC,V]=pca2(X);
k=findbestM(V);

mn=mean(X,2);

Xhat = reconstructData(X,k,PC,mn);
%Displaying 10th image: train data
figure(1);
subplot(1,2,1),display_digit(reshape(X(1:m,10), [], int16(sqrt(m)))),title('Original');
subplot(1,2,2),display_digit(reshape(Xhat(1:m,10), [], int16(sqrt(m)))),title('Compressed');
saveas(figure(1),'TrainData_10.jpeg')

Y = cell2mat(cellfun(@(x)[x(:);zeros(4-numel(x),1)],test,'un',0)); 
[r,c] = size(Y);

lowDim = encode(Y,k,PC,mn); %To find encoded low dimensional representation
Yhat = reconstructData(Y,k,PC,mn); %Decode / Reconstruct the image


% Display test data : original and reconstructed
figure(2);
for i=1:c
subplot(2,c,i), display_digit(reshape(Y(1:r,i), [], int16(sqrt(r)))), title(['Original:',num2str(i)]);
subplot(2,c,i+c), display_digit(reshape(Yhat(1:r,i), [], int16(sqrt(r)))),title(['Reconstructed:',num2str(i)]);
saveas(figure(2),'TestData.jpeg');
end

errorArr = vecnorm(Y-Yhat);
errorArr = errorArr.^2;
MSErr  = mean(errorArr);
disp(['Reconstruction Error:', num2str(MSErr)]);

