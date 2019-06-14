function f = ABdynamics(t,AB,params)

a = params(1);
beta  = params(2);
c = params(3);

A = AB(1);
B = AB(2);

f(1,:) = A.^2/(4*c) + beta*A - 1;

f(2,:) = beta*B - a*A;
  