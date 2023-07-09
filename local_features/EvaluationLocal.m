close all
clear all
clc


%load de signature parameters
mat = load('BiosecurIDparametersLocal.mat');
BiosecurIDparameters = mat.BiosecurIDparametersLocal;

%obtain size of users and signatures/user
usuarios = size(BiosecurIDparameters,1);
firmas = size(BiosecurIDparameters,2);
params = size(BiosecurIDparameters,3);

%% GENUINE SCORES
i=1; n=1;

GenuineScores=cell(1,3);
for N=[1 4 12]
    
    for us=1:usuarios
        %Extract the user model
        modelo=BiosecurIDparameters(us,1:N,:);
        modelo=reshape(modelo,N,params);

        for n_test=N+1:firmas
            %Test signatures: remaining signatures of the user
            test=BiosecurIDparameters(us,n_test,:);
            test=reshape(test,1,params);
            Score = MatcherLocal(test, modelo);
            GenuineScores{n}(us,i)= Score;
            i=i+1;

        end
        i=1;
    end
    n=n+1;
end

GenuineScores_1=GenuineScores{1};
GenuineScores_4=GenuineScores{2};
GenuineScores_12=GenuineScores{3};

%% IMPOSTOR SCORES

i=1; n=1;

ImpostorScores=cell(1,3);
for N=[1 4 12]
    
    for us=1:usuarios
        %Extract the user model
        modelo=BiosecurIDparameters(us,1:N,:);
        modelo=reshape(modelo,N,params);

        for n_test=1:usuarios
            if (n_test~=us) %the score is only computed using the other users
                %First signature of the other user
                test=BiosecurIDparameters(n_test,1,:); %Always the first signature
                test=reshape(test,1,params);
                Score = MatcherLocal(test, modelo);
                ImpostorScores{n}(us,i)= Score; %50x49 for any N
                i=i+1;
            end
        end
        i=1;
    end
    n=n+1;
end

ImpostorScores_1=ImpostorScores{1};
ImpostorScores_4=ImpostorScores{2};
ImpostorScores_12=ImpostorScores{3};



%So far, you have obtained the similarity distance between signatures (values close to
%0 for genuine comparisons and higher for impostor comparisons). However,
%we want to obtain the SCORE (higher for genuine comparisons than for
%impostor comparisons).

%%
GenuineScores_N = [GenuineScores_1, GenuineScores_4, GenuineScores_12];
ImpostorScores_N = [ImpostorScores_1, ImpostorScores_4, ImpostorScores_12];
save("GenuineScores_N", "GenuineScores_N");
save("ImpostorScores_N", "ImpostorScores_N");

%%
addpath('..\DetPlots\');

figure;
[EER1,DCF_opt1,ThresEER1]=Eval_Det(GenuineScores_1(:)',ImpostorScores_1(:)','b');
title(sprintf('1 Signature, EER: %0.2f', round(EER1,2)));

figure;
[EER4,DCF_opt4,ThresEER4]=Eval_Det(GenuineScores_4(:)',ImpostorScores_4(:)','b');
title(sprintf('4 Signatures, EER: %0.2f', round(EER4,2)));

figure;
[EER12,DCF_opt12,ThresEER12]=Eval_Det(GenuineScores_12(:)',ImpostorScores_12(:)','b');
title(sprintf('12 Signatures, EER: %0.2f', round(EER12,2)));


