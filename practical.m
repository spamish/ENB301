% Matlab code for ENB301 Practical
% By Samuel Janetzki, n7402643.

clc;
close all;
clear all;

% Build System Parameters
t = linspace(0, 10, 100);
Km = 1.3; % Km constant values
alpha = 1; % Mechanical constant values

% Load Data
load('ENB301TestData_2015');
ytd = y1;

Go = tf([Km],[1 alpha 0]);

% Simulate Step Response
[y1, t] = step(Go, t);

% Generate Noise
sigma = 0.2; % Standard deviation of noise
noise = sigma*randn(size(t)); % Noise vector

% Create noisy signal
yn=y1+noise;

% Display Results
figure;
hold on;
title('Step Response');
xlabel('Time (t)');
ylabel('Potentiometer Voltage (Vp)');

plot(t,y1,'r');
plot(t,ytd,'b');
plot(t,yn,'g');

