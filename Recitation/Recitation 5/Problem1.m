
counter =5;
while(not(counter == 0))
    
    fprintf("The count is at %i.\n",counter);
    
     counter = counter -1;
  %  pause(1);
end


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
fprintf("\n");
for i=1:length(motorData);
    
    meanRPM = [meanRPM, mean(motorData{i})];
    fprintf("The mean rpm for motor %i is %.01f.\n",i,mean(motorData{i}));
  
    fprintf("The standard deviation of rpm for motor %i is %.01f.\n\n",i,std(motorData{i}));
    
end

%graphs average rpm
bar(meanRPM);

%labels plot
ylabel("Average RPM");
xlabel("Motor Number");
title("Avereage RPMs of Motors");

%creates figure named Motor Problem Dectector
figure('Name',"Motor Problem Dectector")


for i=1:length(motorData)
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

figure(3);

for i=1:length(motorData)
    avg=0;
standard=0;
    %Creates subplot
    subplot(3,2,i)
    avg=mean(motorData{i});
    standard = std(motorData{i});
    %graphs data
    
    index = abs(motorData{i}-avg) > standard;
    
    t=1:300;
   motor_out_of_std= motorData{i}(index);
   time_out_of_std =t(index);
   hold on
   plot(t,motorData{i});
    plot(time_out_of_std , motor_out_of_std,"o");
    
    %Labels plot
   xlabel("Time");
   ylabel("RPM");
   title(sprintf("RPM of Motor %d Vs. Time",i));
   
   %if the motor is the bad one paint the background red
   
    
  
end


