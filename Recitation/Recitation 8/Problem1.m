
clear;
close all;

A1=8;
f1=49;
dt1 = 0.001;
t1=0:dt1:(1-dt1);

A2=4;
f2=52;
y1=calcSinData(A1,f1,t1)
y2=calcSinData(A2,f2,t1)

plot(t1,y1);
hold on
plot(t1,y2);

plot(t1,(y2+y1));

function sinData = calcSinData(A,f,t)
sinData = A*sin(f.*t*2*pi);
end