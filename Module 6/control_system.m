function [new_time, new_RPM] = control_system(varargin)
%CONTROL_SYSTEM simulates either manual or PID control of a DC Motor
%
% Syntax:
%   [new_time, new_RPM] = control_system('P', Kp)
%   [new_time, new_RPM] = control_system('P', Kp, 'D', Kd)
%   [new_time, new_RPM] = control_system('P', Kp, 'I', Ki, 'D', Kd)
%
% Inputs:
%    'P' - Callout the fact that the next input is proportional gain value
%    Kp - The value of proportional gain
%    'I' - Callout the fact that the next input is integral gain value
%    Ki - The value of integral gain
%    'D' - Callout the fact that the next input is derivative gain value
%    Kd - The value of derivative gain
%
% Outputs:
%    new_time - The resulting x-axis of time values in a vector from simulation
%    new_RPM - The resulting y-axis values of simulated RPM control in a vector from simulation
%
% Example:
%   Simulate the Proportional Gain at 50
%   [t, y] = control_system('P', 50)
%   Simulate a PD Control with values of 20 and 5
%   [t, y] = control_system('P', 20, 'D', 5)

% April 2020; Last revision: 10-November-2020
%
%------------- BEGIN CODE --------------

Kp = 0;
Ki = 0;
Kd = 0;

switch nargin
    case 2
        switch varargin{1}
            case 'P'
                Kp = varargin{2};
            case 'I'
                Ki = varargin{2};
            case 'D'
                Kd = varargin{2};
            otherwise
                warning("This is not a valid character!")
        end
    case 4
        switch varargin{1}
            case 'P'
                Kp = varargin{2};
            case 'I'
                Ki = varargin{2};
            case 'D'
                Kd = varargin{2};
            otherwise
                warning("This is not a valid character!")
        end
        
        switch varargin{3}
            case 'P'
                Kp = varargin{4};
            case 'I'
                Ki = varargin{4};
            case 'D'
                Kd = varargin{4};
            otherwise
                warning("This is not a valid character!")
        end
        
        case 6
        switch varargin{1}
            case 'P'
                Kp = varargin{2};
            case 'I'
                Ki = varargin{2};
            case 'D'
                Kd = varargin{2};
            otherwise
                warning("This is not a valid character!")
        end
        
        switch varargin{3}
            case 'P'
                Kp = varargin{4};
            case 'I'
                Ki = varargin{4};
            case 'D'
                Kd = varargin{4};
            otherwise
                warning("This is not a valid character!")
        end
        
        switch varargin{5}
            case 'P'
                Kp = varargin{6};
            case 'I'
                Ki = varargin{6};
            case 'D'
                Kd = varargin{6};
            otherwise
                warning("This is not a valid character!")
        end
        
    otherwise
        warning("Invalid amounts of arguments! Check format of function.")
end

if Kp <= 100 && Kd <= 20 && Ki <= 20
    
    s = tf('s');
    P = 1/(1*s^2 + 1.125*s + 1);
    C = pid(Kp, Ki, Kd);
    T = feedback(P*C,1);
    
    [y, t] = step(T,20);
    new_time = t;
    new_RPM = y*1000;
else
    new_time = -1;
    new_RPM = -1;
    warning("The controller cannot use one of your values! It is too high!")
end

end