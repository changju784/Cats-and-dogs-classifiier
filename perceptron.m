%Perceptron training error rate is [0%]
%Perceptron test error rate is [19%]

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to the decision rule corresponding
%to a very simple one-layer neural network: the perceptron. 
%It also takes in a data matrix Xrun and produces a vector of label
%guesses yguess, corresponding to the sign of the linear prediction.
function yguess = perceptron(Xtrain,ytrain,Xrun)
[n,p] = size(Xrun);
%[Nt,Pt] = size(Xtrain);
Xtrans = Xtrain.';
yguess = zeros(n,1);

percp = (Xrun*(pinv(Xtrans*Xtrain)) * (Xtrans* ytrain));
for i = 1:n
    if(percp(i) >= 0)
        yguess(i) = 1;
    else 
        yguess(i) = -1;
    end
end
end
