function [x,y] = circulartrajectory(t,t_f)%function linked with lab#05
t_i=0;
theeta_t0=0;
theeta_tf=2*pi;
a_0=0;
a_1=0;
a_2=(3*(theeta_tf-theeta_t0))/t_f^2;
a_3=-(2*(theeta_tf-theeta_t0))/t_f^3;
a=2
b=2
r=1;
th_traj=a_0+a_1*t+a_2*t^2+a_3*t^3
x=r*sin(th_traj)+a
y=r*cos(th_traj)+b
end