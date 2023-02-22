clc;
clear all;
clearvars;
close all;
%Task:1
L_1=3;
L_2=3;
t_f=2;
dt=0.01;
t=0:dt:t_f;
circulartrajectory(t(1,4),t_f)
%Task:2
circle_center = [2; 2];
circle_radius =1;
% Define the number of time steps for the simulation
num_steps = 100;
% Define the joint angles for the starting configuration of the manipulator
theta1_0 = 0;
theta2_0 = 0;
% Initialize the figure
figure();
axis equal;
for i = 1:num_steps
    % Calculate the desired end effector position at the current time step
    theta = i * (2 * pi / num_steps);
    end_effector_pos = circle_center + circle_radius * [cos(theta); sin(theta)];
    [theta1,theta2]=InverseKinematics(end_effector_pos(1),end_effector_pos(2));
    % Update the joint angles for the next time step
    theta1_0 = theta1;
    theta2_0 = theta2;
    % Calculate the positions of the joints and end effector
    joint1_pos = [0; 0];
    joint2_pos =DH2HT(L_1,L_2,theta1,theta2)
%     joint2_pos = joint1_pos + [L_1 * cos(theta1);L_1 * sin(theta1)];
%     end_effector_pos = joint2_pos + [L_2 * cos(theta1 + theta2); L_2 * sin(theta1 + theta2)];
    % Plot the manipulator in the current configuration
    plot([joint1_pos(1), joint2_pos(1), end_effector_pos(1)], ...
    [joint1_pos(2), joint2_pos(2), end_effector_pos(2)], '-o');
    axis([-5 5 -5 5]);
    title(sprintf('Time step: %d', i));
    xlabel('x');
    ylabel('y');
    drawnow;
   
    % Pause to slow down the animation
  pause(dt);
end