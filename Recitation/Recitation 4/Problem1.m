
%figure(1);
figure('Name',"Test Name");

data = [2, 1, 2, 5,];
labels = ["Ant","Trantula","Praying Mantis","Dragonfly"];
pie3(data,labels);

figure(3)
figure("Name","Wave");

plot(t,V1);
hold on
plot(t,V2);

plot(t,V3);
plot(t,V4);
plot(t,V5);
plot(t,V6);
%%plot(t,V7);

title("Voltage vs. Time");
xlabel("Time");
ylabel("Voltage");
legend("V1","V2","V3","V4","V5","V6");

grid on

figure("name","subplotWave");

subplot(3,2,1);
plot(t,V1);
ylim([-1,1]);

subplot(3,2,2);
plot(t,V2);
ylim([-1,1]);

subplot(3,2,3);
plot(t,V3);
ylim([-1,1]);

subplot(3,2,4);
plot(t,V4);
ylim([-1,1]);

subplot(3,2,5);
plot(t,V5);
ylim([-1,1]);

subplot(3,2,6);
plot(t,V6);
ylim([-1,1]);

