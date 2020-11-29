%Data
lengths = [6,5,7,12,3,9,1.5,6,2.5,4];
shapes = ["triangle","circle","square","triangle","circle","square","circle","triangle","circle","circle"];
heights = [4,3,8,3,7,3,3,7,9,4];
types = ["Chocolate","Strawberry","Blueberry","Vanilla","Chocolate","Vanilla","Blueberry","Vanilla","Strawberry","Strawberry"];
datas = {lengths,heights,types,shapes};

% displays all outcomes.
for i =1:length(shapes)
    
   disp(calcBoth(datas{1}(i),datas{2}(i),datas{3}(i),datas{4}(i)));
    
end

%Calc both.
function c =calcBoth(l,h,type,shape)

c = calccakecost(type,calcVolume(l,h,shape));

end