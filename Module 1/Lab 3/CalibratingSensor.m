%NTU Standards
NTU = [1000 100 0];

%Measured Voltages
V = [3.4378 4.1508 4.1248];

%Graph for calibrating
plot(V,NTU)

%Best fit line Coefficient
p = polyfit(V,NTU,1);

%Equation Variable
Equation = [];

%Calculates Equation of Best Fit line
for i=1:length(p)
    
    %Calculates Number to add to the end of the string
   if(length(p)-i>0)
    Number = sprintf("%dx^%d + ",p(i),length(p)-i);
   else
      Number = p(i); 
   end
    
   %Adds number to the equation
    Equation = sprintf("%s%s",Equation,Number);
end

%Displays equation of best fit line
disp(Equation);

%NTU of 10 = 4.329 V and Calulcated to be -207.8139

