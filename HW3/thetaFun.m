function theta_func = thetaFun(theta_vec, init_posn)

h = 1;

x = init_posn(1); y = init_posn(2);

theta = theta_vec(1); theta_final = theta_vec(2);

theta_func(1) = (x/h) - 0.5*((sec(theta_final))*(tan(theta_final) - tan(theta)) - (tan(theta))*(sec(theta_final) - sec(theta)) + log(sec(theta_final) + tan(theta_final)) - log(sec(theta) + tan(theta)));

theta_func(2) = (y/h) - (sec(theta_final) - sec(theta));

