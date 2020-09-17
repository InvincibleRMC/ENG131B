%Cleans figures away
close all;

%Loads Motor_RPM
load('Motor_RPM');

%Cell of Motor data
motorData = {motor1; motor2; motor3; motor4; motor5; motor6};

%Creation of figure with name Mean RPMs
figure("Name","Mean RPMs");

%creates meanRPM array
meanRPM =[];

%calculates the mean rpm for each array
for i=1:6
    
    meanRPM = [meanRPM, mean(motorData{i})];
  
end

%graphs average rpm
bar(meanRPM);

%labels plot
ylabel("Average RPM");
xlabel("Motor Number");
title("Avereage RPMs of Motors");

%creates figure named Motor Problem Dectector
figure('Name',"Motor Problem Dectector")


for i=1:6
    %Creates subplot
    subplot(3,2,i)
    
    %graphs data
    bar(motorData{i},"black");
    
    %Labels plot
   xlabel("Time");
   ylabel("RPM");
   title(sprintf("RPM of Motor %d Vs. Time",i));
   
   %if the motor is the bad one paint the background red
   if i==4
       set(gca,'color','red');
       
   end 
    
end