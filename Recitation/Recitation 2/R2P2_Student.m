%% Recitation 2
% Problem 2: For 3's a Jolly Good Fellow

clear; clc; close all

given_array = [7, 5, 1, 6, 7, 7, 7,...
    8, 10, 14, 98, 14, 3, 2, 3, 5, 7,...
    7, 8, 9, 10, 7, 8, 9, 3, 17, 7,...
    8, 64, 2, 7, -1, 0, 8, 3, 3, 9,...
    7, 20, 24, 26, 7, 8, 47, 3, 42];


%for i=1:length(given_array)
%    
%   if(given_array(i)==7)
%      given_array(i)=3; 
%  end
%    
%end

given_array(given_array == 7) =3;

disp(given_array)