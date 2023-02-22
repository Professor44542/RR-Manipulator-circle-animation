function [theta1,theta2] = InverseKinematics(x, y);
L1=3;
L2=3;
r = sqrt(x^2 + y^2);
cos_theta2 = (r^2 - L1^2 - L2^2) / (2 * L1 * L2);
sin_theta2 = sqrt(1 - (cos_theta2)^2);
theta2 = atan2(sin_theta2, cos_theta2);
theta1 = atan2(y, x) - atan2(L2 * sin(theta2), L1 + L2 * cos(theta2));
Matrix=[cos_theta2 theta2;sin_theta2  theta1]
% Check if the joint angles are within their respective limits
d1=((theta1-cos_theta2)^2)+((theta2-sin_theta2)^2);
d2=((cos_theta2-theta1)^2)+((sin_theta2-theta2)^2);
if d1 < d2
    Final=d1
else
    Final=d2
end
end