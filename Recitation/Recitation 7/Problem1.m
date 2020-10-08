clear; close all; clc;

load('R7P2_Data.mat');

figure(1);
subplot(1,2,1);
plot(x,y);

p = polyfit(x,y,2);
title("rough data");


newX=-10:0.0001:10;

newY=polyval(p,newX);
subplot(1,2,2);
plot(newX,newY);
title("smooth data");

disp(p(1) + "*x^2 + " + p(2) + "*x + " + p(3));