clear; clc; clear all;
syms zdot z thetadot theta F len g m1 m2 s;
EQ1 = z*thetadot^2 - g*sin(theta);
EQ2 = zdot;
EQ3 = (F*len*cos(theta) - 2*m1*z*zdot*thetadot - m1*g*z*cos(theta) - m2*g*len*cos(theta)/2)/...
    (m1*z^2 + m2*len^2/3);
EQ4 = thetadot;
A = [0              diff(EQ1,z) diff(EQ1,thetadot) diff(EQ1,theta);...
     1              0           0                  0;...
     diff(EQ3,zdot) diff(EQ3,z) diff(EQ3,thetadot) diff(EQ3,theta);...
     0              0           1                  0];
B = [0;...
     0;...
     diff(EQ3,F);...
     0];
I = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
C = [0 1 0 0; 0 0 0 1];
theta = 0;
thetadot = 0;
zdot = 0;
%he
F = (z*m1*g/len + m2*g/2);
Ae = subs(A)
Be = subs(B)
H = C*inv(s.*I - Ae)*Be
