clear, clc, close all;
[x, fs] = audioread('sample-6s.wav'); % чтение сигнала
 
N = length(x); % длина нашего сигнала
ts = 0: 1/fs : N*1/fs-1/fs; % задаем отсчеты
d = abs(sin(2*pi*0.3*ts)); % создание полсинусоидального сигнала
 
subplot(3, 1, 1); % построение этого сигнала
plot(d), grid on
y = x;
 
subplot(3, 1, 2); % строим наш сигнал до модуляции
plot(y(:,1)), grid on
 
for i = 1 : N 
    y(i,1) = x(i,1) * d(i);
    y(i,2) = x(i,2) * d(i);
end
 
subplot(3, 1, 3); % строим график сигнала после модуляции
plot(y(:,1)), grid on
audiowrite('sample.wav', y, fs)
sound(y,fs)
