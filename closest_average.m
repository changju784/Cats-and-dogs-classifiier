%Closest average training error rate is [19%].
%Closest average test error rate is [22%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess, corresponding to whether
%each row of Xtest is closer to the average cat or average dog.
function yguess = closest_average(Xtrain,ytrain,Xrun)
[meancat, meandog] = average_pet(Xtrain, ytrain);
[n,p] = size(Xrun); 
yguess = zeros(n,1);
catvector = zeros(n,1);
dogvector = zeros(n,1);

for j = 1:n
    catvector(j) = sqrt(sum((Xrun(j,:)-meancat).^2));
end
for k = 1:n
    dogvector(k) = sqrt(sum((Xrun(k,:)-meandog).^2));
end
for i = 1:n
   if (catvector(i) <= dogvector(i))
      yguess(i) = -1;
   else
      yguess(i) = 1;
    end
end
end