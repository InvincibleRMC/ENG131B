%code set up
clear; all off; clc;
%tests cases
calcCakeCost("Vanilla",1)
calcCakeCost("Chocolate",1)
calcCakeCost("Strawberry",1)
calcCakeCost("Blueberry",1)

%calculates cake cost
function c = calcCakeCost(type,v)
%resets values
c=0;

%arrays of data
cakeNames = ["Vanilla", "Chocolate", "Strawberry", "Blueberry"];
cakeCosts = [0.11, 0.15, 0.18,0.14];

%checks the list for matching string
for i =1:length(cakeCosts)
    
    %if string matches mutiply the volume by the cost per volume
   if cakeNames(i)==type
      c = cakeCosts(i)*v;
      break;
   end 
end
end