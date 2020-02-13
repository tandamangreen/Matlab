clear; clc; clear all;
syms z zdot k b m F s;
EQ1 = (F - k*z - b*zdot)/m;
EQ2 = zdot;
A = [diff(EQ1,zdot) diff(EQ1,z);...
     diff(EQ2,zdot) diff(EQ2,z)];
B = [diff(EQ1,F);
     0];
F = k*z;
zdot = 0;
Ae = subs(A);
Be = subs(B);
I = [1 0; 0 1];
C = [0 1];
H = C*inv(s.*I - Ae)*Be;