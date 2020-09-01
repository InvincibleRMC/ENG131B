clear;
all off;
clc;

%Creates arduino object
a = arduino();

%reads volatge from arduino pin A0
readVoltage(a,"A0");
