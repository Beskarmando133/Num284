function [dist,vel]=drop(vO,t,units)
% DROP - calculates current distance and velocity given initial velocity and time
% Last modified 8/24/2022 by Dr. Xu
% Syntax:
%    drop(v0, t) plots distance vs. time as long as t is a vector
%    [vars] = drop(v0, t) calculates the distance and velocity 
% Input:
%   v0 - initial velocity [in units/sec]
%   t - time [in seconds]
%   units - distance units (default meters 'm')
% Output:
%   dist - current distance [in units]
%   vel - current velocity [in units/sec]
% Calls: getGravity

if nargin < 2
    error("Not Enough inputs")
elseif nargin < 3
    units = "m";
end

if strcmp(units,"m")
    g = 9.81; % gravity m/s/s
else
    g = 32.2;
end

v = g*t + vO;  % calc vel. don't use return value
d = 0.5*g*t.^2 + vO*t; % calc dist. don't use return value

if nargout >=1
    vel = v;
    dist = d;
elseif length(t) >1
    plot(t,d)
    xlabel("Time [s]")
    ylabel(["Distance [" units "]")
else
    error("Plots require more than 1 t value")
end

end