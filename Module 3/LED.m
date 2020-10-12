%Setup
clear; close all; clc;

%load red color data
load('team_john&paris_red.mat');

%Green 
xVoltages = 1.5:.05:2.25;
resitance =330;

%Green Data
Resitor_Voltage_Green = [0, 0, 0.0001, 0.0008, 0.0033, 0.0106, 0.0273,0.0536, 0.0857, 0.119, 0.157, 0.197, 0.238, 0.28, 0.322, 0.366, 0.409];
LED_Voltage_Green = [1.49, 1.54, 1.592, 1.641, 1.689, 1.73, 1.764, 1.788, 1.805, 1.818, 1.83, 1.84, 1.849, 1.857, 1.864, 1.871, 1.877,];
Current_Green = Resitor_Voltage_Green./(resitance);

%Team 4 Yellow
resistor_voltage_yellow = [0 , 0 , 0 , 0 ,0 , .227 , 1.149 , 2.08 , 3.04 ];
voltage_yellow = [0 , .247 , .496 , .746 , .995 , 1.751 , 1.836 , 1.87 , 1.910  ];
current_yellow = resistor_voltage_yellow ./ 330;

%Team Blue
vledblue = [0 0.093 0.184 0.297 0.390 0.494 0.588 0.687 0.786 0.886 0.992 1.084 1.183 1.282 1.381 1.490 1.579 1.679 1.777 1.876 1.983 2.06 2.16 2.26 2.27 2.28 2.29 2.29 2.30 2.31 2.32 2.33 2.34 2.41 2.49 2.54 2.58 2.61 2.64 2.67 2.69 2.71 2.74];
vr = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.003 0.007 0.11 0.12 0.061 0.469 0.920 1.36 1.78 2.29 2.77 3.24 3.71 4.19];
cblue = vr ./330;


%Team Red
cred = voltR ./330;

%holds on plotting of lines
hold on

% Labels Graph
xlabel("Current");
ylabel("LED Voltage");
title("LED Voltage Vs. Current");

%Plots colored data
plot(Current_Green,LED_Voltage_Green,'go-','LineWidth',2);
plot(current_yellow,voltage_yellow,'yo-', 'LineWidth',2);
plot(cblue,vledblue,'bo-','LineWidth',2);
plot(cred,voltL,'ro-','LineWidth',2);

%Sets the color black so it is more visible
set(gca,'Color','black')
