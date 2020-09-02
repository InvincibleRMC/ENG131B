%%Question 3

datax = [0 1 2 3 4 5 6 7 8];
datay = [100 90 75 68 50 42 36 24 10];

titlex='Time(s)';
titley="Undissolved Material(g)";
plot(datax,datay,'color','red');


title(titley + " vs. " + titlex);
xlabel(titlex);
ylabel(titley);
