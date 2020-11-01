



function conversion = R9P1_toFeet(meas,unit)
% meas is expected to be in meters
if unit=="in"
    conversion = meas*39.3701;
end

if  unit== "m"
    conversion = meas;
end
if unit == "f"
    conversion = meas * 0.3048;
end
end