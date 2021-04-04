%Nearest neighbor training error rate is [0%].
%Nearest neighbor test error rate is [20%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess. Each guess is found
%by searching through Xtrain to find the closest row, and then 
%outputting its label.
function yguess = nearest_neighbor(Xtrain,ytrain,Xrun)
[n, p] = size(Xrun);
[Ntrain, Ptrain] = size(Xtrain);
dist = zeros(n,1);
yguess = zeros(n,1);
closest = 0;
cind = 0;


for i = 1:n
    for j = 1:Ntrain
    dist(i) = norm(Xrun(i,:) - Xtrain(j,:));
    end
    [closest,cind] = min(dist);
    yguess(i) = ytrain(cind);
end
end