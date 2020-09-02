%%Question 2
y=[1 2 3 4 5 2 3 4 5 6 3 4 5 6 7];

k=1;
counter=0;
for k=k:length(y)
   
    if(y(k)== 3)
       counter = counter + 1; 
    end
    
end

disp(counter);

