%Clean setup
clear;
clc;
close all;

%creates aruino object
a =arduino();

%creates array to store voltage data
voltages = [];

%Time based variables
LengthOfTime =60;
waitTime = .25;

%Knock Thresholds
knockThreshold = 1.1;
knockThresholdOfVoltagesOverTime = 3;
knockThresholdOfVoltagesOverTimeSquared = 8;

%Gathers Data ever waitTime secs
disp("Dectecting now.");
for i=0:LengthOfTime*4
    
    voltages = [voltages, readVoltage(a,"A5")];
    pause(waitTime);
    
end

%Fake Test Data
%voltages = [1.0,.69,.5,4,3.2,3,.05,4,3];

%Time array
time = 0:waitTime:LengthOfTime;

subplot(1,3,1)
%plot volatage vs. time
plot(time,voltages);

%hold on for graphs
hold on

%Arrays to store the data above the threshold
voltagesAboveThreshold =[];
timeThreshold =[];

%fills voltagesAboveThreshold with all voltages above the threshold
%fills timeThreshold with the corresponding times
for i = 1:(LengthOfTime*4)
    if(voltages(i)> knockThreshold)
        voltagesAboveThreshold = [voltagesAboveThreshold voltages(i)];
        timeThreshold =  [timeThreshold (i-1)*waitTime];
    end
    
end

%plots data of Voltage Vs. Time
plot(timeThreshold,voltagesAboveThreshold,"o","Color","r");

%Labeling and Limits of Data
xlabel("Time");
ylabel("Voltage");
title("Voltage Vs. Time");
xlim([0,LengthOfTime]);
ylim([0,5]);

%Line so you can see the knockThreshold
yline(knockThreshold,"--");

%displays number of knocks with threshold method
fprintf("The number of knocks recorded is %d.\n",length(voltagesAboveThreshold));

%counter of Voltages Above Halved
counterVoltagesAboveHalvedThreshold = 0;

%counts voltages above the halved threshold
for i=1:(LengthOfTime*4)
    
    if(voltages(i)>knockThreshold/2)
        counterVoltagesAboveHalvedThreshold = counterVoltagesAboveHalvedThreshold + 1;
    end
end

%Prints out how many knocks it dectects with the threshold halved
fprintf("The number of knocks recorded is %d when the threshold is halved.\n",counterVoltagesAboveHalvedThreshold);

%Array of the derivative of voltages
derivativeOfVoltages = [];

%Calculates Aproximations of the derivative of voltages
for i = 1:(length(voltages)-1)
    derivativeOfVoltages = [derivativeOfVoltages,(voltages(i+1)-voltages(i))/waitTime];
    
end


%Creates second subplot
subplot(1,3,2)

%Creates new time array without the last time
timeButNoEndPoint = 0:waitTime:(LengthOfTime-waitTime);

%graphs Voltage/Time Vs. Time
plot(timeButNoEndPoint,derivativeOfVoltages);

%enables grid
grid on

%labels and limits graph
title("Voltage/Time Vs. Time");
xlabel("Time");
ylabel("Voltage/Time");
xlim([0,LengthOfTime]);

%counts knocks with the derivative
derivativeCounter = 0;

for i = 1:length(derivativeOfVoltages)
    
    if derivativeOfVoltages(i)> knockThresholdOfVoltagesOverTime;
        derivativeCounter = derivativeCounter +1;
    end
end

%prints out knocks via the derivative
fprintf("Derivative method %d.\n",derivativeCounter);


%Second derivative only really done because I was bored

%Calculates Second derivatives
secondDerivativeOfVoltages = [];
for i = 1:(length(derivativeOfVoltages)-1)
    secondDerivativeOfVoltages = [secondDerivativeOfVoltages,(derivativeOfVoltages(i+1)-derivativeOfVoltages(i))/waitTime];
    
end


%graphs third subplot
subplot(1,3,3)

%creates time array for 2nd derivative
timeButNo2EndPoint = 0:waitTime:(LengthOfTime-waitTime-waitTime);

%Graphs Voltage/Time^2 Vs. Time
plot(timeButNo2EndPoint,secondDerivativeOfVoltages);

%enables grid
grid on

%lables and limits the data
title("Voltage/Time^2 Vs. Time");
xlabel("Time");
ylabel("Voltage/Time^2");
xlim([0,LengthOfTime]);

%Counter of knocks with the second derivative method
secondDerivativeCounter = 0;

for i = 1:length(secondDerivativeOfVoltages)
    
    if secondDerivativeOfVoltages(i)> knockThresholdOfVoltagesOverTimeSquared;
        secondDerivativeCounter = secondDerivativeCounter +1;
    end
end
%prints out the number of knocks detected with the second derivative method
fprintf("Second Derivative method %d.\n",secondDerivativeCounter);



