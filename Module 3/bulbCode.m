%Code setup
clear; close all; clc;

%Data
resistor = [0,.283,.487,.626,.715,.818,.926,1.022,1.1,1.19,1.26,1.35,1.44,1.51,1.59,1.66,1.73,1.8,1.87,1.94,2.01,2.07,2.13,2.20,2.26,2.32,2.37,2.43,2.49];    
bulbVoltage = [0,.196,.482,.853,1.23,1.622,2.01,2.39,2.79,3.2,3.61,4.02,4.44,4.85,5.27,5.69,6.12,6.54,6.97,7.4,7.82,8.25,8.69,9.12,9.56,10.0,10.43,10.87,11.31];
   
%Current calculation
current = resistor ./10;

%Calculates best fit lines
newX = 0:0.001:0.25;

pLow =polyfit(current(1:3),bulbVoltage(1:3),1);
pHigh =polyfit(current((length(current)-2):length(current)),bulbVoltage((length(bulbVoltage)-2):length(bulbVoltage)),1);

LowY= polyval(pLow,newX);
HighY = polyval(pHigh,newX);

%Graphs data and best fit lines
hold on
plot(current,bulbVoltage);
plot(newX,LowY);
plot(newX,HighY);

%displays resistance ratio
disp("Ratio of resistances :" + pHigh(1)/pLow(1));
