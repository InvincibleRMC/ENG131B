function [x, y, log] = shipFlyer(varargin)
%SHIPFLYER simulates either manual or PID control of a distressed starship
%
% Syntax:
%   [x, y, log] = shipFlyer() 
%   [x, y, log] = shipFlyer('P', Kp, 'I', Ki, 'D', Kd) 
%   [x, y, log] = shipFlyer('P', Kp, 'I', Ki, 'D', Kd, -1)
%
% Inputs:
%    No Inputs - Initiates Manual Control of the Ship Simulaton
%    'P' - Callout the fact that the next input is proportional gain value
%    Kp - The value of proportional gain
%    'I' - Callout the fact that the next input is integral gain value
%    Ki - The value of integral gain
%    'D' - Callout the fact that the next input is derivative gain value
%    Kd - The value of derivative gain
%    -1 - Do not animate the PID system control
%
% Outputs:
%    x - The resulting x-axis values in a vector from simulation
%    y - The resulting y-axis values in a vector from simulation
%    log - A string that describes important aspects of the simulation

% April 2020; Last revision: 14-April-2020
%
%------------- BEGIN CODE --------------
Kp = 0;
Ki = 0;
Kd = 0;
YFINAL = 5;
global ay_user
global sensitivity

ay_user = 0;


switch nargin
    case 0
        
        sensitivity = input('Please input the initial magnitude of your force (Recommended around 2 N): ');
        f = initScreen();
        % Building a bounce and testing changing force
        ax = 0;
        x0=0;
        y0=0;
        vx0=1;
        vy0=10;
        Tf=10;
        Nt = 1000;
        
        t = linspace(0, Tf, Nt);
        deltat = t(2) - t(1);
        x = zeros(1, Nt);
        y = zeros(1, Nt);
        vx = zeros(1, Nt);
        vy = zeros(1, Nt);
        x(1) = x0;
        y(1) = y0;
        vx(1) = vx0;
        vy(1) = vy0;
        
        for it=1:Nt-1
            vx(it+1)=vx(it)+ax*deltat;
            vy(it+1)=vy(it)+ay_user*deltat;
            x(it+1)=x(it)+0.5*(vx(it+1)+vx(it))*deltat;
            y(it+1)=y(it)+0.5*(vy(it+1)+vy(it))*deltat;
            if (y(it+1)<0) % bounce condition
                vy(it+1)=abs(vy(it+1))*0.8;
            elseif (y(it+1)>9.9)
                vy(it+1)=abs(vy(it+1))*-0.8;
            end
            
            plot(x(it), y(it), 'ro',...
                x(1:it), y(1:it), 'r');
            text(4.5, 9.0, sprintf('Step of Change: %.2f N', sensitivity))
            text(4.5, 8.5, sprintf('Force Vector in y: %.2f N', ay_user))
            text(4.5, 8.0, sprintf('Current y-position: %.2f m', y(it)))
            axis([-.1, 10.1, -.1, 10.01]);
            xlabel('x(m)');
            ylabel('y(m)');
            drawnow
        end
        
        hold on
        plot([0, 10], [5, 5], 'k--')
        
        S_man = stepinfo(y, x, YFINAL);
        log = logger(S_man);
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
        
        s = tf('s');
        P = 1/(1*s^2 + 1.125*s + 3);
        C = pid(Kp, Ki, Kd);
        T = feedback(P*C,1);
        
        [y, t] = step(T,10);
        x = t;
        y = y*YFINAL;
        
        f = initScreen();
        for j = 1:4:length(t)
            plot(t(j), y(j), 'ro',...
                t(1:j), y(1:j), 'r');
            text(4.5, 8.0, sprintf('Current y-position: %.2f m', y(j)))
            axis([-.1, 10.1, -.1, 10.01]);
            xlabel('x(m)');
            ylabel('y(m)');
            drawnow
        end
        
        S_device = stepinfo(y, t, YFINAL);
        log = logger(S_device);
    case 7
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
        
        s = tf('s');
        P = 1/(1*s^2 + 1.125*s + 3);
        C = pid(Kp, Ki, Kd);
        T = feedback(P*C,1);
        
        [y, t] = step(T,10);
        x = t;
        y = y*YFINAL;
        
        S_device = stepinfo(y, t, YFINAL);
        log = logger(S_device);
    otherwise
        warning("Invalid amounts of arguments! Check format of function.")       
        
end


% Useful Functions
    function f = initScreen()
        SCREENTRIM = [-100 -100 200 200];
        f = figure('Name', 'Starship Simulator',...
            'Position', get(0,'ScreenSize') - SCREENTRIM,...
            'keypressfcn', @controlA);
    end

    function controlA(src, evnt)
        switch evnt.Key
            case 'uparrow'
                ay_user = ay_user+sensitivity;
            case 'downarrow'
                ay_user = ay_user-sensitivity;
            case 'rightarrow'
                sensitivity = sensitivity + 0.1;
            case 'leftarrow'
                sensitivity = sensitivity - 0.1;
        end
    end


    function log = logger(S)
        headers = {'Position to Rise', 'Position to Settle', 'Overshoot Pct', 'Peak'};
        values = [S.RiseTime, S.SettlingTime, S.Overshoot, S.Peak];
        log = "START\t";
        for i = 1:length(headers)
            log = log+string(headers{i})+","+num2str(values(i))+"\t";
        end
        log = log+"Final Position"+","+num2str(y(end))+"\t";
        log = log+"END\n";
    end

end