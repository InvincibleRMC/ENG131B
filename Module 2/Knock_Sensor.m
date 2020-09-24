clear;
clc;
close all;

a =arduino();
counter =0;
voltages = [];

waitTime =2;
while(counter<=waitTime)
    
    voltages = [voltages, readVoltage(a,"A5")];
    pause(.25);
    counter = counter + .25;
end
% voltages = [1.0,.69,.5,4,3.2,3,.05,4,3];
time = 0:.25:waitTime;

plot(time,voltages);

knockThreshold = 1.1;

hold on

timeThreshold = [];
voltagesAboveThreshold =[];

for i=1:(waitTime*4)
    if(voltages(i)>knockThreshold)
    voltagesAboveThreshold =[voltagesAboveThreshold voltages(i)]; 
    timeThreshold = [timeThreshold i*.25];
    end

end

plot(timeThreshold,voltagesAboveThreshold,"o");
yline(knockThreshold,"--");

countString = sprintf("The number of knocks recorded is %d.",length(voltagesAboveThreshold));
disp(countString);

counterVoltagesAboveHalvedThreshold = 0;

for i=1:(waitTime*4)
    if(voltages(i)>knockThreshold/2)
     
    counterVoltagesAboveHalvedThreshold = counterVoltagesAboveHalvedThreshold + 1;
    end

end

countStringHalved = sprintf("The number of knocks recorded is %d when the threshold is halved.",counterVoltagesAboveHalvedThreshold);
disp(countStringHalved);


