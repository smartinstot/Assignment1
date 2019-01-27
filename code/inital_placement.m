%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          ELEC 4700 - Assignment 1          %
% Monte-Carlo Modeling of Electron Transport %
%            By David Bascelli               %
%            Febuary 3rd, 2019               %
% initial_plaacement.m:                      %
% This file determines the inital placement  %
% of all particles in system                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [P_x, P_y] = inital_placement(N, size_x, size_y)
    P_x = rand(N, 1) * size_x;
    P_y = rand(N, 1) * size_y;
end

