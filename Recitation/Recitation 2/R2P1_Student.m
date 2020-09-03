%% Recitation 2
% Problem 1: Where did I go Wrong?

% Clear my workspace
clear; clc; close all

% Here, I initialize two arrays as
%   independent variables
x = [7, 6, 4, 8, 9];
y = [1, 3, 4, 8, 9, 16];

% I have two dependent variables that
%   follow these equations:
% Eq. 1) z(x) = x + 7
% Eq. 2) z(y) = 6 * (1 + y)^2
z1 = x + 7;
z2 = 6 * (1 + y).^2;

% And now, I want to plot both dependent
%   variables on different graphs versus
%   either x or y, respectively
figure(1)
plot(x, z1)
figure(2)
plot(y, z2)