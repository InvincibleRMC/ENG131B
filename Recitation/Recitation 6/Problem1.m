clear; close all; clc;

load('Motor_RPM');

motors ={motor1,motor2,motor3,motor4,motor5,motor6};
figure('Name',"Motor RPMs");

for i=1:6

    plotMotors(motors,i);
    
end 

function plotMotors(motors,motornum)
subplot(3,2,motornum);
t = 1:300;
plot(t,motors{motornum});

xlabel("Time");
ylabel(sprintf("Motor %.0f RPM",motornum));
title(sprintf("Motor %.0f RPM Vs. Time",motornum));
ylim([0,110]);
xlim([0,300]);
end