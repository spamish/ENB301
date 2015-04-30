clc
clear

load('PracData');

data_start = 970;
data_end = 1320;

Vp = smooth(Vp(data_start:data_end));
t = t(data_start:data_end) - t(data_start);

km = 15.624;
a = 20;

gain = 3.3;

g = tf(km, [1 a 0]);
y = step(g * gain, t);

%stepinfo(y, t)
error = (Vp - y)/sqrt(2);

figure(1);
xlabel('t');
ylabel('y(t)');

hold on;
plot(t, y);
plot(t, Vp, 'red');
hold off

figure(2);
hold on;
plot(t, error);
hold off;