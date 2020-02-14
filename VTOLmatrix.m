clear; clc; clear all;
syms hdot h zdot z thetadot theta d mr mc mu F fr fl T Jc g s;

EQ1 = (F*cos(theta) - mc*g - 2*mr*g)/(2*mr + mc);
EQ2 = hdot;
EQ3 = (-F*sin(theta) - mu*zdot)/(2*mr + mc);
EQ4 = zdot;
EQ5 = T/(2*mr*d^2 + Jc);
EQ6 = thetadot;

A = [diff(EQ1,hdot) diff(EQ1,h) diff(EQ1,zdot) diff(EQ1,z) diff(EQ1,thetadot) diff(EQ1,theta);...
     diff(EQ2,hdot) diff(EQ2,h) diff(EQ2,zdot) diff(EQ2,z) diff(EQ2,thetadot) diff(EQ2,theta);...
     diff(EQ3,hdot) diff(EQ3,h) diff(EQ3,zdot) diff(EQ3,z) diff(EQ3,thetadot) diff(EQ3,theta);...
     diff(EQ4,hdot) diff(EQ4,h) diff(EQ4,zdot) diff(EQ4,z) diff(EQ4,thetadot) diff(EQ4,theta);...
     diff(EQ5,hdot) diff(EQ5,h) diff(EQ5,zdot) diff(EQ5,z) diff(EQ5,thetadot) diff(EQ5,theta);...
     diff(EQ6,hdot) diff(EQ6,h) diff(EQ6,zdot) diff(EQ6,z) diff(EQ6,thetadot) diff(EQ6,theta)];
 
B = [diff(EQ1,F) diff(EQ1,T);...
     diff(EQ2,F) diff(EQ2,T);...
     diff(EQ3,F) diff(EQ3,T);...
     diff(EQ4,F) diff(EQ4,T);...
     diff(EQ5,F) diff(EQ5,T);...
     diff(EQ6,F) diff(EQ6,T)];
 
F = mc*g + 2*mr*g;
theta = 0;
T = 0;
hdot = 0;
zdot = 0;
thetadot = 0;

Ae = subs(A);
Be = subs(B);

I = [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1];
C = [0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1];
H = C*inv(s.*I - Ae)*Be

simplify(Ae)
simplify(Be)