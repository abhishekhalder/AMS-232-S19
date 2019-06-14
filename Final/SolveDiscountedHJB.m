close all; clear; clc;

a = 1; beta = 2; c = 3;

params = [a; beta; c];

q = 5;

A_final = q; B_final = 0; 

t_initial = 0; t_final = 2;

[t,AB] = ode45(@(t,AB) ABdynamics(t,AB,params),[t_final t_initial],[A_final; B_final]);

%% plots
set(0,'defaulttextinterpreter','latex')

figure(1) % plot A,B time series
plot(t,AB(:,1),'-o',t,AB(:,2),'-.','linew',2)
xlabel('$t$','FontSize',20)

leg1 = legend('$A(t)$','$B(t)$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',20);

figure(2) % plot optimal feedback control
x = 0.1:0.1:10; % positive state domain
[tt,xx] = meshgrid(t,x);
A = AB(:,1)';
AA = A(ones(1,numel(x)),:);
u_opt = (sqrt(xx)/(2*c)).*AA;

surfc(tt,xx,u_opt)
xlabel('$t$','FontSize',20)
ylabel('$x$','FontSize',20)
zlabel('$u_{\rm{opt}}(t,x)$','FontSize',20)

figure(3) % plot value function
B = AB(:,2)';
BB = B(ones(1,numel(x)),:);
V = exp(-beta*tt).*(AA.*xx + BB);

surfc(tt,xx,V)
xlabel('$t$','FontSize',20)
ylabel('$x$','FontSize',20)
zlabel('$V(t,x)$','FontSize',20)