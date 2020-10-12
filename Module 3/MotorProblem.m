%Code set up
clear; close all; clc;

%load data
load('VoltageData.mat');

%Data Test
plot(Volt3(1:length(Volt3)),Volt3((length(Volt3)+1):length(Volt3)*2));

%Cell of voltages
voltages= {Volt3,Volt7,Volt10,Volt15};

%array of rpms
rpms =[];

%array of volate from power supply
voltageValues = [3,7,10,15];

%gets the rpm for all the voltages
for i =1:length(voltages);
    
rpms = [rpms, getRPM(voltages{i})];

end

%plots the data
plot(voltageValues,rpms);

%labels and constrains data
xlabel("Voltage");
ylabel("RPMS");
title("RPMS Vs. Voltage");
xlim([0,15]);
ylim([0,2000]);

%calculates best fit line
p=polyfit(voltageValues,rpms,1);

%displays slope which equals kv
disp("Kv of the motor is " + p(1) + " RPMs/V");

%Calculates rpm of each data set
function rpm = getRPM(voltageData)

%variables
signalCount =0;
rpm=0;

%decides whether the first value is up or down
if(voltageData(length(voltageData)+1)<2)
up = false;
else
    up =true;
end

%counts peaks
for i = (length(voltageData)+1):2*length(voltageData)

    if(voltageData(i)>2)
    up =true;
    end

    if(up && voltageData(i)<2)
    signalCount = signalCount + 1;
    up = false;
    end
    
end
%calculates the rpm
rpm=signalCount*60/(voltageData(length(voltageData)) - voltageData(1));

end



