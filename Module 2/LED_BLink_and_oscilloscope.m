%set up code space
clear;
clc;
close all;

%Creates arduino object
a= arduino();

%Test Data 2.45625 volts peak to peak 990 micro seconds

while(true)
    
    % 1.032 s
    
    %Code for 1 Hz
    %writeDigitalPin(a,"D8",0);
    %pause(1/1)
    %writeDigitalPin(a,"D8",1);
    %pause(1/1);
    
    % 220ms
    
    %Code for 5 Hz
    %writeDigitalPin(a,"D8",0);
    %pause(1/5)
    %writeDigitalPin(a,"D8",1);
    %pause(1/5);
    
    %118ms
    
    %Code for 10 Hz
    writeDigitalPin(a,"D8",0);
    pause(1/10)
    writeDigitalPin(a,"D8",1);
    pause(1/10);
    
    
end
 
%Peak to Peak of crystal 6.2v Pulse width 344 microseconds
    

