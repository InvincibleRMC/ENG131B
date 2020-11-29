%Code set up
clear; close all; clc;



Voltages = [2.62, 2.92 ,2.69,2.49,2.27,2.09,1.94,1.79,1.69,1.59,1.49,1.43,1.35,1.29,1.24,1.16,1.11,1.06];

centimeters =0:17;

plot(centimeters,Voltages);



newVolt =[];

for i = 3:(length(Voltages)-2)

newVolt(i-2) = Voltages(i);

end 

newcent = 2:15;
p = polyfit(newcent,newVolt,2);

specificCent = 2:0.01:15;
specificVolt = polyval(p,specificCent);

hold on

plot(specificCent,specificVolt);

