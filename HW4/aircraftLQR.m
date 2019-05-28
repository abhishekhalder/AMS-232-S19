close all; clear; clc;

set(0,'defaulttextinterpreter','latex')

A = [-0.313, 56.7, 0;
    -0.139, -1.426, 0.024;
   0.231, 56.7, 0.025];

B = [0.232; 0.0203; 0];

C = [1, 0, 0;
    0, 0, 1];

Q = C'*C


D = [0];

x0 = rand(3,1);

eig(A)

rank(ctrb(A,B))

t = 0:0.01:15;

% compute open-loop/uncontrolled states
for k=1:length(t)
    x_ol(:,k) = expm(A*t(k))*x0;
end

figure(1)
plot(t,x_ol(1,:),'--r',t,x_ol(2,:),'--g',t,x_ol(3,:),'--b','LineWidth', 2)
set(gca,'FontSize',14)
xlabel('$t$','FontSize',18)
legend({'\alpha_{open-loop}','q_{open-loop}','\theta_{open-loop}'},'Location','best','FontSize',18)
legend('boxoff')


R = 1;

sys = ss(A,B,C,D);

S = [0];

[K_inf, P_inf, lambda_cl] = lqr(sys,Q,R,S);
% compute closed-loop states
for k=1:length(t)
    x_cl(:,k) = expm((A-B*K_inf)*t(k))*x0;
end

figure(2)
plot(t,x_ol(1,:),'--r',t,x_ol(2,:),'--g',t,x_ol(3,:),'--b','LineWidth', 2)
hold on
plot(t,x_cl(1,:),'-r',t,x_cl(2,:),'-g',t,x_cl(3,:),'-b','LineWidth', 2)
legend({'\alpha_{open-loop}','q_{open-loop}','\theta_{open-loop}','\alpha_{closed-loop}','q_{closed-loop}','\theta_{closed-loop}'},'Location','best','FontSize',18)
legend('boxoff')
set(gca,'FontSize',14)
xlabel('$t$','FontSize',18)

figure(3)
for k=1:length(t)
    u(k) = -K_inf*x_cl(:,k);
end
plot(t,u,'-k','LineWidth', 2)
set(gca,'FontSize',14)
xlabel('$t$','FontSize',18)
ylabel('$\delta_e$','FontSize',18,'rotation',0)