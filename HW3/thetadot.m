function dthetadt = thetadot(t,theta)

V = 1; h = 1;

dthetadt = -(V/h)*(cos(theta))^2;