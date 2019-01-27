%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          ELEC 4700 - Assignment 1          %
% Monte-Carlo Modeling of Electron Transport %
%            By David Bascelli               %
%            Febuary 3rd, 2019               %
% thermal_velocity.m:                        %
% Calculates the inital velocity of each     %
% particle                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [V_x, V_y] = thermal_velocity(N, vth)
    
    % Based on the velcity destribution, we find
    % the total velocity of each particle
    V = repmat(vth, N, 1);
    
    % In order to set the direction, we generate
    % a random number for the x and y directions,
    % normalize, then multiply each velocity by
    % that
    temp_x = rand(N,1);
    temp_y = rand(N,1);
    temp = sqrt(temp_x.^2 + temp_y.^2);
    temp_x = temp_x./temp;
    temp_y = temp_y./temp;

    V_x = temp_x .* V;
    V_y = temp_y .* V;
end

