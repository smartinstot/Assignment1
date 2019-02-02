%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          ELEC 4700 - Assignment 1          %
% Monte-Carlo Modeling of Electron Transport %
%            By David Bascelli               %
%            Febuary 3rd, 2019               %
% collisions.m:                              %
% Calculates the collisions at each step and %
% updates velocity and position accordingly  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [V_x, V_y, P_x, P_y] = collisions(V_x, V_y, P_x, P_y, size_x, size_y, rec)
    % Reflect off top and bottom
    V_y(P_y > size_y | P_y < 0) = -V_y(P_y > size_y | P_y < 0);
    P_y(P_y < 0) = 0;
    P_y(P_y > size_y) = size_y;

    % Wrap around left and right sides 
    P_x(P_x > size_x) = 0;
    P_x(P_x < 0) = size_x;
    
    % Check for collisions on rectangles
    collided = rec_collisions(P_x, P_y, rec);
    V_x(collided == 1) = - V_x(collided == 1);
    V_y(collided == 2) = - V_y(collided == 2);
end


