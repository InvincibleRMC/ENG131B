%Cleans figures away
close all;

%Loads data
load('Wafer_Thickness.mat');

%Creats histogram
histogram(wafer_thickness);

%labels plot
title("Wafer Histogram");
ylabel("Number of wafers");
xlabel("Thickness of wafers");

%creates a counter
counter =0;

%counts the number of wafers outside of the tolerances
for i=1:length(wafer_thickness)
    
   if ~((wafer_thickness(i) <80) || (wafer_thickness(i) >120))
       counter = counter +1;
   end
end

%Calculates percentage and converts it to a string
percentage = sprintf("Perentage of failed wafers %d",(counter/length(wafer_thickness)));

%Display text on the plot
text(125,150,percentage);