clear; clc; clear all
k = 1000;
M = 1000000;
freq1 = 100*k;
freq2 = 500*k;
freq3 = 1*M:0.5*M:20*M;

freq = horzcat(freq1, freq2, freq3);
cableLen = 7.6962;

for i = 1:length(freq)
    lengthRad(i) = (cableLen*freq(i))*2*pi/(2*10^8);
    lengthDeg(i) = lengthRad(i)*180/pi;
    
end
lengthRad'
lengthDeg'
freq'



