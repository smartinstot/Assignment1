%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          ELEC 4700 - Assignment 1          %
% Monte-Carlo Modeling of Electron Transport %
%            By David Bascelli               %
%            Febuary 3rd, 2019               %
% Assignment1.m:                             %
% Top level file which runs simulation       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath code

% Paramaters
T = 300; % K, Temperature
m0 = 9.109383E-31; % Kg, rest mass of electron
mn = 0.26*m0; % effective mass of electron
Tmn = 0.2E-12; % s, mean time between collisions

steps = 1000; % Run simulation for 1000 steps
dt = 200E-6/1000; % s, simulation step time

% Simulation bounds
size_x = 200E-9; % m
size_y = 100E-9; % m

N = 1; % Number of particles

% Calculated values
vth = sqrt(2*physconst('Boltzmann')/mn); % mean thermal velocity
lambda = vth*Tmn; % mean free path

tmax = dt*steps; % s, simulation stop time

% Inialize State variables
[P_x, P_y] = inital_placement(N, size_x, size_y);
[V_x, V_y] = thermal_velocity(N, vth);

f_path = figure('Name','Particle Path');
hold on;

% Simulation loop
for n=0:(steps-1)
    t = n*dt;
    P_x_old = P_x;
    P_y_old = P_y;

    % Laws of motion
    P_x = P_x + V_x*dt;
    P_y = P_y + V_y*dt;

    % Plot path of particle
    figure(f_path);
    plot([P_x_old P_x], [P_y_old P_y]);
    pause(0.01);

    [V_x, V_y, P_x, P_y] = collisions(V_x, V_y, P_x, P_y, size_x, size_y);
end
