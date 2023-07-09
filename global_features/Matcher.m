function Score=Matcher(test,Model)
    Score=mean(pdist2(Model,test,'euclidean'), 'all');
end