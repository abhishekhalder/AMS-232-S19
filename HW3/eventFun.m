function [val, isterminal, direction] = eventFun(t,theta,thetaFinal)

val = theta - thetaFinal; % event that halts integration is when theta crosses known thetaFinal
isterminal = 1; % halt integration
direction = 0; % val can approached from any direction