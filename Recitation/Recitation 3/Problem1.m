


p = polyfit(current,voltage,1);

disp(p);


y = polyval(p,current);
plot(current,voltage,"*");

xlabel("Current");
ylabel("Voltage");
title("Voltage Vs. Current");

newX=0:0.005:1;
%refline(p(1),p(2));
newY =polyval(p,newX);
%%figure(2);
hold on

plot(newX,newY,"*");

%plot(current,y,"*");

