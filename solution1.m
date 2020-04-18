function[] = solution1(X,y)
%Solution1 : Used to create visualisation of PC vector spaces and to see
%the PC1-PC2, PC2-PC3, PC1-PC3 vector space representation of the dataset.
% PC - Principal Component
% V - Matrix of variance
% Z - ENcoded dataset
% C - Reconstructed data
% q - Amount of variation captured
[M,N] = size(X);

figure(1);                   % plot x_i vs x_j for all combinations of i,j
for i=1:M
  for j=1:i-1
     subplot(3,3,(i-1)+3*(j-1));
     scatter(X(i,:),X(j,:),7,y,'filled');
     xlabel(sprintf('x%g',i)); ylabel(sprintf('x%g',j));
  end
end
saveas(figure(1),'IrisData.jpeg');


[PC,V] = pca1(X);

mn = mean(X,2);
newX = X - repmat(mn,1,N);

%For PC 1 and PC 2
UM = PC(:,1:2);
Z = UM'*newX;
C = repmat(mn,1,N)+UM*Z;
q2 = norm(V(1:2))^2/norm(V)^2;
figure(2);
scatter(C(1,:),C(2,:),17,y,'filled')
xlabel('PC1'); ylabel('PC2')
title(sprintf('2 components, captures %.4g%% of total variation',100*q2))
saveas(figure(2),'PC1_PC2.jpeg');


%For PC 2 and PC 3
UM = PC(:,2:3);
Z = UM'*newX;
C = repmat(mn,1,N)+UM*Z;
q2 = norm(V(2:3))^2/norm(V)^2;
figure(3);
scatter(C(2,:),C(3,:),17,y,'filled')
xlabel('PC2'); ylabel('PC3')
title(sprintf('2 components, captures %.4g%% of total variation',100*q2))
saveas(figure(3),'PC2_PC3.jpeg');

%For PC 1 and PC 3
UM = PC(:,[1,3]);
Z = UM'*newX;
C = repmat(mn,1,N)+UM*Z;
q2 = norm(V([1,3]))^2/norm(V)^2;
figure(4);
scatter(C(1,:),C(3,:),17,y,'filled')
xlabel('PC1'); ylabel('PC3')
title(sprintf('2 components, captures %.4g%% of total variation',100*q2))
saveas(figure(4),'PC1_PC3.jpeg');



