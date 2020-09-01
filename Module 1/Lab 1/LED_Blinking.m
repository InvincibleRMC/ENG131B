clear;
close all;
clc;

%Creates arduino object
a = arduino();

%blinks arduino 10 times 
for i=i:10
   
   
    writeDigitalPin(a,"D8",0);
    writeDigitalPin(a,"D8",1);
    pause(.5);
end