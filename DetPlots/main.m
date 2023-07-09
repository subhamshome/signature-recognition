clear all
close all


load true_scores
load impostor_scores

[EER,DCF_opt,ThresEER]=Eval_Det(true_scores,impostor_scores,'r');