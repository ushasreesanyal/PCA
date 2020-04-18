function [k] = findbestM(V)

pov = zeros(size(V,1),1);
total_sum = sum(V,'all');
for i= 1:size(V,1)
pov(i)=sum(V(1:i))/total_sum;
if pov(i)>0.9, break,end
end
k=i;

for i= 1:size(V,1)
pov(i)=sum(V(1:i))/sum(V,'all');
end
figure(1);
plot(1:size(V,1),pov);
xlabel('Eigenvector'); ylabel('PoV')
grid on
saveas(figure(1),'EigenvecVPoV.jpeg');
