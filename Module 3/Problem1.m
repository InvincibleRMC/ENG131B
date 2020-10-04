clear; close all; clc;

%RED
voltagesX = 0:12;
resitance =330;

R_Voltage = [0,0.313, 1.21, 2.13, 3.07,4.02, 4.97, 5.92, 6.87, 7.82, 8.77, 9.72];
LED_Voltage = [0.98,1.67, 1.769, 1.81, 1.87, 1.92, 1.96, 2.01, 2.05, 2.1, 2.14, 2.18];

Current = R_Voltage./(resitance)

plot(Current,LED_Voltage);
xlabel("Current");
ylabel("Red LED Voltage");
title("Red LED Voltage Vs. Current");