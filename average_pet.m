%This function takes in a data matrix X and a label
%vector y and outputs the average cat image and average dog image.
function [avgcat, avgdog] = average_pet(X,y)
    [row, col] = size(X);
    
    catavg = zeros(1,col); 
    dogavg = zeros(1,col);
    catcount = 0;
    dogcount = 0;
    
    for i = 1:col 
        for j = 1:row
        if(y(j) == -1)
            catavg(1,i) = X(j,i) + catavg(1,i);
        else
            dogavg(1,i) = X(j,i) + dogavg(1,i);
        end
        end
    end
    
    for l = 1:row 
        if(y(l) == -1)
            catcount = catcount+1;
        else 
            dogcount = dogcount+1;
        end
    end
    avgcat = catavg / catcount; 
    avgdog = dogavg / dogcount;
end