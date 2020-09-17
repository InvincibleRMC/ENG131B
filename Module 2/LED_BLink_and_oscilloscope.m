clear;
clc;
close all;

a= arduino();

%Test Data 2.45625 volts peak to peak 990 micro seconds

while(true)
    

    % 1.032 s
    %writeDigitalPin(a,"D8",0);
    %pause(1/1)
    %writeDigitalPin(a,"D8",1);
    %pause(1/1);
    
    % 220ms
    %writeDigitalPin(a,"D8",0);
    %pause(1/5)
    %writeDigitalPin(a,"D8",1);
    %pause(1/5);
    
    %118ms
    writeDigitalPin(a,"D8",0);
    pause(1/10)
    writeDigitalPin(a,"D8",1);
    pause(1/10);
    
    
end
 
%Peak to Peak of crystal 6.2v    
    

