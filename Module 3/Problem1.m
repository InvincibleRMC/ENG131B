clear; close all; clc;

%Green 
xVoltages = 1.5:.05:2.25;
resitance =330;

%Green Data
Resitor_Voltage = [0, 0, 0.0001, 0.0008, 0.0033, 0.0106, 0.0273,0.0536, 0.0857, 0.119, 0.157, 0.197, 0.238, 0.28, 0.322, 0.366, 0.409];
LED_Voltage = [1.49, 1.54, 1.592, 1.641, 1.689, 1.73, 1.764, 1.788, 1.805, 1.818, 1.83, 1.84, 1.849, 1.857, 1.864, 1.871, 1.877,];
Current = Resitor_Voltage./(resitance);

%Team 4 Yellow
resistor_voltage_yellow = [0 , 0 , 0 , 0 ,0 , .227 , 1.149 , 2.08 , 3.04 ];
voltage_yellow = [0 , .247 , .496 , .746 , .995 , 1.751 , 1.836 , 1.87 , 1.910  ];
current_yellow = resistor_voltage_yellow ./ 330;

hold on
plot(Current,LED_Voltage,'go-');
xlabel("Current");
ylabel("LED Voltage");
title("LED Voltage Vs. Current");

plot(current_yellow,voltage_yellow,'yo-');
set(gca,'Color','black')
