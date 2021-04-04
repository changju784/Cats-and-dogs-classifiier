%For PCA-reduced data with dimension k = 50, linear discriminant analysis training error rate is [34%].
%For PCA-reduced data with dimension k = 50, linear discriminant test error rate is [30%].
%For PCA-reduced data with dimension k = 50, perceptron training error rate is [7.6%].
%For PCA-reduced data with dimension k = 50, perceptron test error rate is [11%].
%For PCA-reduced data with dimension k = 100, linear discriminant analysis training error rate is [34%].
%For PCA-reduced data with dimension k = 100, linear discriminant test error rate is [30%].
%For PCA-reduced data with dimension k = 100, perceptron training error rate is [6.3%].
%For PCA-reduced data with dimension k = 100, perceptron test error rate is [7.8%].
%For PCA-reduced data with dimension k = 200, linear discriminant analysis training error rate is [33%].
%For PCA-reduced data with dimension k = 200, linear discriminant test error rate is [30%].
%For PCA-reduced data with dimension k = 200, perceptron training error rate is [4.9%].
%For PCA-reduced data with dimension k = 200, perceptron test error rate is [6.5%].
%For PCA-reduced data with dimension k = 400, linear discriminant analysis training error rate is [33%].
%For PCA-reduced data with dimension k = 400, linear discriminant test error rate is [31%].
%For PCA-reduced data with dimension k = 400, perceptron training error rate is [3.4%].
%For PCA-reduced data with dimension k = 400, perceptron test error rate is [7.8%].

%This function takes in a training data matrix Xtrain and uses
%it to compute the PCA basis and a sample mean vector. 
%It also takes in a test data matrix Xtest and a dimension k. 
%It first centers the data matrices Xtrain and Xtest by subtracting the
%Xtrain sample mean vector from each of their rows. It then uses the 
%top-k vectors in the PCA basis to project the centered Xtrain and Xtest
%data matrices into a k-dimensional space, and outputs
%the resulting data matrices as Xtrain_reduced and Xtest_reduced.
function [Xtrain_reduced, Xtest_reduced] = reduce_data(Xtrain,Xtest,k)
    [n,p] = size(Xtrain);
    meantrain = zeros(p,1);
    for j = 1:p
       for i = 1:n
        meantrain(j,1) = meantrain(j,1) + Xtrain(i,j);
       end
    end
    meantrain = meantrain / p;
    meantrain = (meantrain.');
        
    V = pca(Xtrain);
    Vk = V(:,1:k);
    
    Xcentrain = Xtrain - (ones*meantrain);
    Xtrain_reduced = Xcentrain * Vk;
    
    Xcentest = Xtest - (ones*meantrain);
    Xtest_reduced = Xcentest * Vk;
    
end

