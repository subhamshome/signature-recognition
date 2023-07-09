function Score = MatcherLocal(test,Model)

    score=0;
    totalDescriptors = size(Model,1)*size(Model,2);
    
    for i = 1:size(Model,1)
        modelDesc = Model(i,:);
        for j = 1:length(modelDesc)
            [D, ix, ~] = dtw(test{j}, modelDesc{j});
            k = length(ix);
            score = score + exp(-1*(D/k));
        end
    end

    Score = score/totalDescriptors;

end