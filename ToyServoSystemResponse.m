% matlab routine to generate noisy Toy Servo System Step Response for 2014 ENB301 prac lab
%
% author Jason Ford, 3/12/13

clc;
close all;
clear all;

% build system model
t = linspace(0, 10, 100);  % build time vector
alpha = 1;
i = 0;
j = 10;
cont = 'N';

load('PracData');
t = t(3:end);
Vp = Vp(3:end);

while cont == 'N'
    close all;
    figure;
    hold on;
    plot(t,Vp,'b');
    for Km = i:((j-0)/10):j
        % Build samples.
        Go = tf([Km],[1 alpha 0]);

        % Simulate Step Response
        [y, t] = step(Go, t);
        plot(t,y,'color',rand(1,3));
    end
    hold off;
    
    prompt = 'Value in suitable range? ';
    cont = input(prompt,'s');
    if cont == 'N'
        val = i:((j-0)/5):j
        prompt = 'Pick min Km value: ';
        i = input(prompt);
        prompt = 'Pick max fit Km value: ';
        j = input(prompt);
    end
end

prompt = 'Pick best fit Km value: ';
Km = input(prompt);

i = 0;
j = 10;
cont = 'N';

while cont == 'N'
    close all;
    figure;
    hold on;
    plot(t,Vp,'b');
    for alpha = i:((j-0)/10):j
        % Build samples.
        Go = tf([Km],[1 alpha 0]);

        % Simulate Step Response
        [y, t] = step(Go, t);
        plot(t,y,'color',rand(1,3));
    end
    hold off;
    
    prompt = 'Value in suitable range? ';
    cont = input(prompt,'s');
    if cont == 'N'
        val = i:((j-0)/5):j
        prompt = 'Pick min alpha value: ';
        i = input(prompt);
        prompt = 'Pick max fit alpha value: ';
        j = input(prompt);
    end
end

prompt = 'Pick best fit alpha value: ';
alpha = input(prompt);

% Build final transfer function
num = [Km];
den = [1 alpha 0];
G = tf(num, den);

%Simulate (noisefree) step response.  
% (more general response could be generated using lsim)
[y, t] = step(G, t);

% Generate noise
sigma = 0.2; %noise standard deviation of noise
noise = sigma*randn(size(y)); %noise vector

% Create noisy signal
yn=y+noise;

close all;
figure;
hold on;
plot(t,Vp,'g');
plot(t,y,'r');
plot(t,yn,'b');