close all;
clear;
clc;

%BiosecurIDparameters matrix with: 50 (users) x 16 (signatures/user) x 4 (params)
BiosecurIDparameters=ones(50,16,4);
correct_signs=[1,2,6,7];

%%
for i = 1:50
    bio_params_matrix = [];  
    for j = 1:numel(correct_signs)
        feature_matrix = [];
        for k = 1:4
            if i<10
                BiosecurID = load(['../DB/u100', num2str(i),'s000', num2str(j), '_sg000', num2str(correct_signs(k)), '.mat']);
            else
                BiosecurID = load(['../DB/u10', num2str(i),'s000', num2str(j), '_sg000', num2str(correct_signs(k)), '.mat']);
            end
            x = BiosecurID.x;
            y = BiosecurID.y;
            p = BiosecurID.p;
            feature_vector = featureExtractor(x,y,p);
            feature_matrix = [feature_matrix; feature_vector];
        end
        bio_params_matrix = [bio_params_matrix; feature_matrix];
    end
    BiosecurIDparameters(i,:,:) = bio_params_matrix;  
end 

%%
save('BiosecurIDparameters','BiosecurIDparameters');

%%

figure;
histogram(BiosecurIDparameters(:,:,1), 'Normalization', 'probability');
title('Total Duration');

figure;
histogram(BiosecurIDparameters(:,:,2), 'Normalization', 'probability');
title('N Penups');

figure;
histogram(BiosecurIDparameters(:,:,3),'Normalization', 'probability');
title('T Pendowns');

figure;
histogram(BiosecurIDparameters(:,:,4),'Normalization', 'probability');
title('Average P in Pendown');
