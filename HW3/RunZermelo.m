close all; clear; clc;

%% Solve for initial and final theta

deg2rad = pi/180; rad2deg = 1/deg2rad;

x0 = 4.9; y0 = 1.66;

init_posn = [x0; y0]; 

theta_guess = deg2rad*[200; 120]; % guess for theta_0 in 3rd quadrant, guess for theta_final in 2nd quadrant

f = @(theta_vec) thetaFun(theta_vec,init_posn); % function of vector variable theta_vec

[theta_out,fval] = fsolve(f,theta_guess);

theta_sol = rad2deg*theta_out % in degrees

%% Forward integrate theta dynamics

theta0 = theta_out(1); % initial condition obtained from fsolve
thetaFinal = theta_out(2); % terminal condition obtained from fsolve

options = odeset('Events', @(t,theta) eventFun(t,theta,thetaFinal)); % define event to stop the ODE integration

[t,theta, te, ye, ie] = ode45(@thetadot,[0 10],theta0, options); % get optimal control: theta trajectory

[x, y] = theta2xy(theta, thetaFinal); % get optimal states: (x,y)

%% Plot

figure(1)

arrow_scale = 0.5;
quiver(x, y, cos(theta), sin(theta), arrow_scale, 'LineWidth', 2) % plot optimal heading angles (i.e., optimal control) in the state space
hold on
plot(x,y,'-k','LineWidth', 2) % plot optimal state trajectory
set(gca,'FontSize',14)
xlabel('x','FontSize',14)
ylabel('y','FontSize',14)

