%Question 1
x=[];
i=0;
for i=i:100
    
    if(not(mod(i,5)==0))
    x = [x i]; 
    end
end

disp(x);