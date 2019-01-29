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
dt = 200E-9/1E6; % s, simulation step time

N = 100; % Number of particles
N_plot = 5; % Number of particles to show in motion plot

% Simulation bounds
size_x = 200E-9; % m
size_y = 100E-9; % m


% Calculated values
vth = sqrt(2*physconst('Boltzmann')*T/mn); % mean thermal velocity
lambda = vth*Tmn; % mean free path

% randomly select the indexes which we are going to plot
index_plot = randperm(N, N_plot);

tmax = dt*steps; % s, simulation stop time

% Inialize State variables
[P_x, P_y] = inital_placement(N, size_x, size_y);
[V_x, V_y] = thermal_velocity(N, T, mn);

f_path = figure('Name', 'Particle Path');
hold on;
xlim([0 size_x]);
ylim([0 size_y]);

f_plot = figure('Name', 'Simulation Data');

% Plot of average thermal velocity
subplot(3,1,1);
hold on;
title('Average Thermal Velocity');
xlabel('Time (s)');
ylabel('Velocity (m/s)');

% Plot of total energy
subplot(3,1,2);
ylim([0 1E-18]);
hold on;
title('Total Energy');
xlabel('Time (s)');
ylabel('Energy (J)');

% Plot of average temperature
subplot(3,1,3);
hold on;
title('Average Temperature');
xlabel('Time (s)');
ylabel('Temperature (C)');

f_hist = figure('Name', 'Velocity');
hold on;
xlabel('Velocity (m/s)');
ylabel('Number of Particles');

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
    motion_plot(P_x_old(index_plot), P_x(index_plot), P_y_old(index_plot), P_y(index_plot));

    figure(f_plot);

    subplot(3,1,1);
    plot(t, mean(sqrt(V_x.^2 + V_y.^2)), 'xb');

    subplot(3,1,2);
    plot(t, sum(0.5*(V_x.^2 + V_y.^2)*mn), 'xg');

    subplot(3,1,3);
    plot(t, mean((V_x.^2 + V_y.^2)*mn/2/physconst('Boltzmann')), 'xr');

    figure(f_hist);
    histogram(sqrt(V_x.^2 + V_y.^2), N/10, 'FaceColor', 'b');
    

    pause(0.01);

    [V_x, V_y, P_x, P_y] = collisions(V_x, V_y, P_x, P_y, size_x, size_y);
end
