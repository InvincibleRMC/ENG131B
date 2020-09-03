%Arduino set up
clear;
all off;
clc;

%Creates arduino object
a = arduino();

%Read button input on channel D7
testButton = readDigitalPin(a,"D7");

%Variable initialization 
v=[];
NTU=[];
button=0;

%Data aquisition
for i=1:100
    
    %buttonPressed on channel D7
    button = readDigitalPin(a,"D7");
   
    %exits loop if button is pressed
    if(button==1)
       break; 
    end
    
    %stores voltage and NTU
    v(i)= readVoltage(a,"A0");
    NTU(i)=-260*v(i)^2+1800*v(i)-3000;
    
    %displays voltage and NTU
    disp(v(i) + " " + NTU(i));
    
    %delay of 1 second
    pause(1);
end

%Calculate averages of V and NTU
meanV = mean(v);
meanNTU = mean(NTU);

%Display averages
disp("Average voltage: "+meanV + " Average NTU: " + meanNTU);



    
    



