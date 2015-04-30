% Matlab code for ENB301 Practical
% By Samuel Janetzki, n7402643.

clc;
close all;
clear all;

% Build System Parameters
Km = 1.3; % Km constant values
alpha = 1; % Mechanical constant values

% Load Data
load('ENB301TestData_2015');
ytd = y1;


t = linspace(0, 10, 1000);
Go = tf([Km],[1 alpha 0]);

% Simulate Step Response
[y1, t] = step(Go, t);

% Display Results
figure;
hold on;
title('Step Response');
xlabel('Time (t)');
ylabel('Potentiometer Voltage (Vp)');

t = 101:200;
y1 = 1.38*y1(101:200);
ytd = ytd(1:100);
plot(t,y1,'r');
plot(t,ytd,'b');