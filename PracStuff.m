load('PracData');
figure;
hold on;

data_start = 970;
data_end = 1320;

Vm = Vm(data_start:data_end);

Vp = Vp(data_start:data_end);
t = t(data_start:data_end) + 0.165;

plot(t,Vm,'r');
plot(t,Vp,'g');