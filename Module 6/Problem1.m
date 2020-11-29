%Code set up
clear; close all; clc;

load('MEASURED_RPM.mat');
load('fanData.mat');



figure(1)
grid on

plot(time,RPM);
hold on
yline(1000,"--");

kp=0;
ki=0;
kd=0;

table(RPM,time,kp,ki,kd);

kp=20;

[new_time,new_RPM] = control_system('P',kp);

plot(new_time,new_RPM);

table(new_RPM,new_time,kp,ki,kd);


kd=20;

[new_time,new_RPM] = control_system('P',kp,'D',kd);

plot(new_time,new_RPM);

table(new_RPM,new_time,kp,ki,kd);


ki=20;

[new_time,new_RPM] = control_system('P',kp,'D',kd,"I",ki);

plot(new_time,new_RPM);

table(new_RPM,new_time,kp,ki,kd);

figure(2);

offset = -fanData(1,1);

newT =[];
for i =1:length(fanData);
    
    newT(i) = fanData(i,1)+offset;
end

disp("MEASURE DATA");

plot(newT,fanData(:,2));
table(fanData(:,2),newT,0,0,0);



function table(RPM,time,kp,ki,kd)

disp("kp =" + kp + " ki =" + ki + " kd =" + kd);
disp("Final RPM = " +findFinalValue(RPM));
disp("Max Overshoot% =" + percentovershoot(RPM));
disp("Rise Time =" + riseTime(RPM,time));
disp("Settle Time =" +settleTime(RPM,time));
fprintf("\n");
end

function final = findFinalValue(RPM)

final = RPM(length(RPM));

end

function percent= percentovershoot(RPM)

percent = max(RPM)/findFinalValue(RPM)*100;

end

function t = riseTime(RPM,time)

tenpercentVoltage = findFinalValue(RPM) *.1;


ninetypercentVoltage = findFinalValue(RPM) *.9;

tten =0;
tninety =0;

endcounter=0;

for i =1:length(RPM)

    if((RPM(i)>tenpercentVoltage))
      
        tten = time(i);
        
        break;
    end
    
    endcounter =i;
end

for i = endcounter:length(RPM)

    if((RPM(i)>ninetypercentVoltage))
     
         tninety=time(i);
          
          break;
    end
    
end

t=tninety-tten;
end

function t = settleTime(RPM,time)



highpercent = findFinalValue(RPM)*1.05;
lowpercent = findFinalValue(RPM)*0.95;

for i =0:(length(RPM)-1)
    
    if((RPM(end-i)<=lowpercent) || (RPM(end-i)>highpercent))
        
        t=time(end -i);
        break;
    end
end
end




