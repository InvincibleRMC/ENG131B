%code setup
clear;
all off;
clc;

%load mysetery signal
load('mystery_signal.mat');

%dt
dt=1/1024;
%time
t=0:dt:(1-dt);

%define graohs
y1=calcSinData(1,1,t);
y2=calcSinData(2,10,t);
y3=y1+y2;


figure(1);
subplot(1,3,1);
%graph y1
plot(t,y1);
%label data
xlabel("Time (s)");
ylabel("Voltage (v)");
title("Voltage (v) Vs. Time (s)");

subplot(1,3,2);
%graph y2
plot(t,y2);
%label data
xlabel("Time (s)");
ylabel("Voltage (v)");
title("Voltage (v) Vs. Time (s)");

subplot(1,3,3);
%graph y3
plot(t,y3);
%label data
xlabel("Time (s)");
ylabel("Voltage (v)");
title("Voltage (v) Vs. Time (s)");

%data for y4
Amplitudes = {1,20,5,3,17,1.5};
Frequencies = {120,300,200,50,400,50};

%values for fft
fs =1/dt;
Hz =0:(fs/2);

figure(2);
%graph of fft of y2
plot(Hz,calcFourier(y2));
%label data
xlabel("Frequency (Hz)");
ylabel("Amplitude");
title("Amplitude Vs. Frequency (Hz) of y2");

figure(3);
%alculate y4
y4 =0;
for i =1:length(Amplitudes)
    
   y4 = y4+calcSinData(Amplitudes{i},Frequencies{i},t);
    
end

subplot(1,2,1);
%graph y4
plot(t,y4);
%label y4
xlabel("Time (s)");
ylabel("Voltage (v)");
title("Voltage (v) Vs. Time (s)");

subplot(1,2,2)
%label fft of y4
plot(Hz,calcFourier(y4));
%labeldata
xlabel("Frequency (Hz)");
ylabel("Amplitude");
title("Amplitude Vs. Frequency (Hz)");

figure(4);

subplot(1,2,1);
%graph myster
plot(t,mystery);
%label mysetery
xlabel("Time (s)");
ylabel("Voltage (v)");
title("Voltage (v) Vs. Time (s)");

%stored values
Amplitudes = [1, 5, 10];
Frequencies = [400 ,50 ,8];

subplot(1,2,2);
%graph fft of mystery
plot(Hz,calcFourier(mystery));

%label data
xlabel("Frequency (Hz)");
ylabel("Amplitude");
title("Amplitude Vs. Frequency (Hz)");


%calculate fourier
function fourier = calcFourier(signal)

fourier = fft(signal);
fourier = fourier(1:(length(signal)/2+1));
fourier= abs(fourier/(length(signal)/2));

end
%calculate sindata
function sinData = calcSinData(A,f,t)
sinData = A*sin(f.*t*2*pi);
end