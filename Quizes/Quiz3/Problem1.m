%Code setup 
clear; close all; clc;

%Load capacitor data
load('thicknesses.mat');

%made a global thickness array
global thicknesses;
thicknesses = thickness;

%counters
wonderfulCounter =0;
goodCounter=0;
okayCounter=0;
uselessCounter=0;

%checks if the thicknesses are within each of the tolerances
for i=1:length(thicknesses)
    
    if(inRange(thicknesses(i),2))
        wonderfulCounter = wonderfulCounter + 1;
    
    elseif(inRange(thicknesses(i),5))
        goodCounter = goodCounter + 1;
        
    elseif(inRange(thicknesses(i),8))
        okayCounter = okayCounter + 1;
        
    else
        uselessCounter = uselessCounter +1;
    end
end

%Stores the counters and their names
counters = {wonderfulCounter, "wonderful"; goodCounter, "good"; okayCounter, "okay"; uselessCounter, "useless"};
%prints out the data for all the counters
for k = 1:length(counters)
   fprintf("%.2f%% are %s capacitors.\n",findPercentage(counters{k,1}),counters{k,2});
end

%finds the percentage of each type
function percentage = findPercentage(counter)

global thicknesses
percentage = counter/length(thicknesses)*100;

end

%determines whether a thickness is within range of a toleranes
function bool = inRange(thickness,tolerance)

%bool starts false unless turn true
bool = false;
%ideal thickness
ideal = 100;

%determines if the thickness is within the tolerance
if((abs(ideal-thickness))<=tolerance)
    bool = true;
    
end
end