%Code setup
clear; close all; clc;

%Create globals for mass and gravity
global m;
global g;

%defined all variables
m=1;
k=5000;
c=2;
g=-9.81;
vi=0;
h=0.0001;
yi=1;
ai=g;

%time frame for ball drop
startTime =0;
endTime =10;
%Creates time array
tdata = startTime:h:endTime;
%Values for height over time
ydata = calcHeights(yi,vi,ai,c,k,h,tdata);

%creates the first figure
figure(1)
%animate graph
p=.01;
comet(tdata,ydata,p);
%label animation
xlabel("Time (s)");
ylabel("Height (m)");
title("Height (m) Vs. Time (s)");
%display the final height
disp("Ending height = " + ydata(length(ydata)));
%creates figure 2
figure(2)
%arrays of c and k values
cArray =[2,4,10];
kArray =[8000,5000,5000];
%graphs all 3 sets of data
for j = 1:length(cArray)
    %subplot for each graph
    subplot(1,3,j)
    %calc values for all graphs
    HeightData=calcHeights(yi,vi,ai,cArray(j),kArray(j),h,tdata);
    %plots the 3 graphs
    plot(tdata,HeightData);
    
    %labels the 3 graphs
    xlabel("Time (s)");
    ylabel("Height (m)");
    title("Height (m) Vs. Time (s)");
    
end

%Calculates height
function y = calcY(yi,vi,h)
y = yi + vi*h;
end
%Calculates velocity
function v = calcV(vi,ai,h)
v=vi +ai*h;
end
%Calculates accerlation
function a = calcA(yi,vi,c,k)
%global variables
global m;
global g;
% if the ball is on the ground create the opposing  force
if (yi<0)
    a = (-k*yi-c*vi+m*g)/m + g;
%else apply only gravity
else
    a=g;
end
end
%Calculates Heights of object falling
function heightData = calcHeights(yi,vi,ai,c,k,h,tdata)
%creates array
heightData =[];

%calculates values based on all the time points
for i = tdata
    
    %Updates values based on new data
    newY=calcY(yi,vi,h);
    newV=calcV(vi,ai,h);
    newA=calcA(yi,vi,c,k);
    
    %Adds value to array if less than 0 sets to 0
    heightData = [heightData, max(newY,0)];
    
    %Updates values based on calculated data
    yi=newY;
    vi=newV;
    ai=newA;
end
end