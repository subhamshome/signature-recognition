close all; 
clear; 
clc;

sign1 = load('../DB/u1001s0001_sg0001.mat');
sign2 = load('../DB/u1001s0001_sg0002.mat');
f = 200;

%%
x = sign1.x;
y = sign1.y;
p = sign1.p;

% x = sign2.x;
% y = sign2.y;
% p = sign2.p;

%%

t = size(x,2)/f;
x_axis = linspace(0,t,size(x,2));

%%
% figure;
% set(gcf,'WindowState','maximized');

% subplot(8,1,[1,5]);
figure;
plot(x,y);
title("Original Signature (y as a function of x) - Sign 2");
axis off;

% subplot(8,1,6);
figure;
plot(x_axis, x); xlim([0, t]);
xlabel("time"); ylabel("x");
title("x as a function of time");

% subplot(8,1,7);
figure;
plot(x_axis, y); xlim([0, t]);
xlabel("time"); ylabel("y");
title("y as a function of time");

% subplot(8,1,8);
figure;
plot(x_axis, p); xlim([0, t]);
xlabel("time"); ylabel("p");
title("p as a function of time");

%%

T = Ttotal(x);
Npu = Npenups(p);
Tpd = Tpendown(p);
Ppd = Ppendown(p);



