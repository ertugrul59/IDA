% Load the raw data set
D = load('Prototask.data');
%%%%%%%%%%%%%%%%%%%%%%%%
% First focus on price:%
%%%%%%%%%%%%%%%%%%%%%%%%
% Extract matrix containing all columns except price
X = D(:,1:13);
% X = [D(:,1:4) D(:,6:14)];
N=size(X,1);
% Extract price column
P = D(:,14);
% histogram(P);
% Partition house prices
high=35;
low=15;
% high = 0.7;
% low = 0.4;
% Set labels
for i=1:1:N
    if P(i) <= low L(i)=1;
    elseif P(i) >= high L(i)=3;
    else L(i)=2;
    end
end
% Apply PCA to D1
% Calculate the mean vector
m = mean(X,1);
v = var(X,1);
% Subtract the mean vector from all rows of D1
X=(X-m)./sqrt(v);
% X=(X-m);
% Calculate the covariance matrix
C = (X'*X)/(N-1);
% Apply eigenvalue decomposition
[U,D]=eig(C);
% Biggest eiGenvalues are numbers 13 and 12
x=1:1:13;
for i=1:1:13
    y(i)=D(i,i);
end
% plot(x,y);
% xlabel('dimension');
% ylabel('eigenvalue');
e1 = U(:,13);
e2 = U(:,12);
% Project data onto eigenvectors
x1=X*e1;
x2=X*e2;
% Plot
hold on;
scatter(x1(L==2),x2(L==2),'g');
scatter(x1(L==3),x2(L==3),'b');
scatter(x1(L==1),x2(L==1),'r');
legend('low','medium','high');
hold off; 