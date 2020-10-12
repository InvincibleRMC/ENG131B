clear;

voltages = [0.6,0.8,0.9,-1.2,1.3,1.7,-1.9];
time =0:6;


voltages = abs(voltages);

plot(time,voltages,"o");

title("Voltage vs. Time");
xlabel("Time (s)");
ylabel("Voltage (v)")


disp(calculation(310));

disp(circlearea(5));

function energy = calculation(t)

energy = 5.67*10^-8 *t^4;

end


function area = circlearea(r)

area = pi *r*r;

end
