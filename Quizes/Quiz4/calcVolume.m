
%Calculates volume
function v = calcVolume(l,h,shape)
%resets values
a=0;
v=0;
%formula of a circle
if shape == "circle"
    a=l^2*pi;
%formula of a square
elseif shape == "square"
    a=l^2;
%formula of a equalateral triangle
elseif shape == "triangle"
   a= sqrt(3)/4*l^2 ;
end
% prism formula
v=a*h;
end