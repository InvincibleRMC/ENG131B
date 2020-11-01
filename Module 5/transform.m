clear;
all off;
clc;

load('mystery_signal.mat');

dt=1/1024;
t=0:dt:(1-dt);

y1=calcSinData(1,1,t);
y2=calcSinData(2,10,t);
y3=y1+y2;


figure(1);
subplot(1,3,1);
plot(t,y1);

subplot(1,3,2);
plot(t,y2);

subplot(1,3,3);
plot(t,y3);

figure(2);

Amplitudes = {1,20,5,3,17,1.5};
Frequencies = {120,300,200,50,400,50};


y4 =0;

for i =1:length(Amplitudes)
    
   y4 = y4+calcSinData(Amplitudes{i},Frequencies{i},t);
    
end

plot(t,y4);

fs =1/dt;


Hz =0:(fs/2);

figure(3);

plot(Hz,calcFourier(y2));

xlabel("Frequency (Hz)");
ylabel("Amplitude");
title("Amplitude Vs. Frequency (Hz)");

figure(4);
plot(Hz,calcFourier(y4));
xlabel("Frequency (Hz)");
ylabel("Amplitude");
title("Amplitude Vs. Frequency (Hz)");

figure(5);
plot(t,mystery);
%Label stuff later


Amplitudes = [1, 5, 10];
Frequencies = [400 ,50 ,8];

figure(6);
plot(Hz,calcFourier(mystery));

% (400,1) (50,5) (8,10);


function fourier = calcFourier(signal)

fourier = fft(signal);
fourier = fourier(1:(length(signal)/2+1));
fourier= abs(fourier/(length(signal)/2));

end

function sinData = calcSinData(A,f,t)
sinData = A*sin(f.*t*2*pi);
end