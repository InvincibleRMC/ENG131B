%code setup
clear;
close all;
clc;

%load heartbeat data
load('Michael_Heartbeat.mat');

%rename data
scope = scope3;


%find dt
dt=scope(2)-scope(1);
%find fs
fs=1/dt;

%create the figure
figure(1);
%title the figure
sgtitle("The Heartbeat");

%plot the data
subplot(1,2,1);

plot(scope(:,1),scope(:,2))

%label data
title("Time Domain");
xlabel("Time (s)");
ylabel("Voltage (V)");                  

%use the fourier transform
[f,y] = ENGR131B_Fourier(scope(:,1),scope(:,2));

%rename variables
Hz=f;
fourierSignal=y;

%find the constant for the sin wave
Constant = max(fourierSignal);

%find the second ampltiude
localmaxes = islocalmax(fourierSignal);
frequencyPoint =0;
for i = 1:length(localmaxes)
 
    %check local max to see that it is not the global max
if localmaxes(i) ==1
AmplitudePoint = fourierSignal(i);

index=find(fourierSignal==AmplitudePoint);
frequencyPoint = Hz(index);
   
end
%ends after frequency of 2 and a local max is found
if frequencyPoint >= 2
    break;
end 

end



%hold on
hold on

%time
t= scope(1):dt:scope(length(scope));

%graph my own wave from the fft
plot(t,calcSinData(AmplitudePoint,frequencyPoint,t,Constant));

subplot(1,2,2);

%graph the fourier data and the point
plot(Hz,fourierSignal,frequencyPoint,AmplitudePoint,'bo');

%label data
title("Frequency Domain");
xlabel("Frequency (Hz)");
ylabel("Magnitude");
xlim([0,5])    

%prints out the bpm
disp(frequencyPoint*60 + " Beats Per Minute");

%calcs sin wave
function sinData = calcSinData(A,f,t,c)
sinData = A*sin(f.*t*2*pi)+c;
end