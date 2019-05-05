function [x, y] = theta2xy(theta, thetaFinal)

h = 1;

x= h*0.5*((sec(thetaFinal)).*(tan(thetaFinal) - tan(theta)) - (tan(theta)).*(sec(thetaFinal) - sec(theta)) + log(sec(thetaFinal) + tan(thetaFinal)) - log(sec(theta) + tan(theta)));

y = h*(sec(thetaFinal) - sec(theta));
