%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          ELEC 4700 - Assignment 1          %
% Monte-Carlo Modeling of Electron Transport %
%            By David Bascelli               %
%            Febuary 3rd, 2019               %
% collisions.m:                              %
% Calculates the collisions at each step and %
% updates velocity and position accordingly  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [V_x, V_y, P_x, P_y] = collisions(V_x, V_y, P_x, P_y, size_x, size_y)
    % Reflect off top and bottom
    V_y(P_y > size_y | P_y < 0) = -V_y(P_y > size_y | P_y < 0);

    % Wrap around left and right sides 
    P_x(P_x > size_x) = 0;
    P_x(P_x < 0) = size_x;
end


