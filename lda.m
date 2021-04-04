%Linear discriminant analysis training error rate is [49%].
%Linear discriminant analysis test error rate is [52%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the cat
%and dog sample mean vectors as well as the sample covariance matrix 
%(which is assumed to be equal for cats and dogs). 
%It also takes in a data matrix Xrun and produces a vector of
%label guesses yguess, corresponding to the ML rule for
%jointly Gaussian vectors with different means and the same 
%covariance matrix.
function yguess = lda(Xtrain,ytrain,Xrun)
[Ntrain,Ptrain] = size(Xtrain);
[n,p] = size(Xrun);


ncat = 0;
ndog = 0;
yguess = zeros(n,1);
for i = 1:Ntrain
    if (ytrain(i) == -1)
        ncat = ncat +1; 
    else
        ndog = ndog +1;
    end
end
[avgcat, avgdog] = average_pet(Xtrain,ytrain);
CAT = zeros(ncat, Ptrain);
DOG = zeros(ndog, Ptrain);
for i = 1:Ntrain
    for j = 1:ncat
        if (ytrain(i) == -1)
            CAT(j,:) = Xtrain(i,:);
        end
    end
end

for k = 1:Ntrain
    for l = 1:ndog
        if (ytrain(k) == 1)
            DOG(l,:) = Xtrain(k,:);
        end
    end
end
     
Catcov = cov(CAT);
Dogcov = cov(DOG);

avgcat_t = (avgcat.');
avgdog_t = (avgdog.');

covx = (1/(Ntrain-2)).*((ncat - 1).*Catcov + (ndog - 1).*Dogcov);

left = (2).*(Xrun)*pinv(covx)*(avgdog_t - avgcat_t);
right = ((avgdog_t.')*pinv(covx)*avgdog_t)-((avgcat_t.')*pinv(covx)*avgcat_t);


for i = 1 : n
    if (left(i) >= right)
        yguess(i) = 1;
    else 
        yguess(i) = -1;
    end
end
end


