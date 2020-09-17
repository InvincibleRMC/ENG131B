%Cleans figures away
close all;

%Data taken from problem
ElementNames = ["Lithium", "Sodium", "Potassium", "Rubidium","Cesium"];
AtomicNum = [3, 11, 19, 37,55,];
MeltingPoint = [181, 98, 63, 34, 28.4];
AtomicRad = [0.1520, 0.1860, 0.2270, 0.2480, 0.2650];

%Data cell with the data from the problem
dataTable = {ElementNames; AtomicNum; MeltingPoint; AtomicRad};

%Creates figure named Atomic Comparisons
figure("name","Atomic Comparisons");

%creates first subplot
subplot(1,2,1);
plot(dataTable{3},dataTable{2},"*","color","red","LineStyle","--");

%enables grid
grid on

%Graph Labeling 
title("Atomic Number Vs. Melting Point");
xlabel("Melting Point");
ylabel("Atomic Number");

%creates second subplot
subplot(1,2,2);
plot(dataTable{4},dataTable{2},"o","color","blue","LineStyle","-");

%enables grid
grid on

%Graph Labeling 
title("Atomic Number Vs. Atomic Radius");
xlabel("Atomic Radius");
ylabel("Atomic Number");