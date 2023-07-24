clear, clc, close all
 
[x, fs] = audioread('iphone-1.wav');
 
N = length(x);

y = x;
 
subplot(2, 1, 1);


plot(y(:,1)), grid on
 
d1 = 100; %задержка для первой копии

d2 = 200; %задержка для второй копии

d3 = 300; %задержка для третьей копии
 
for i = 1:N
    if (i - d1) > 0
        y(i) = y(i) + x(i-d1);
    end
    if (i - d2) > 0
        y(i) = y(i) + x(i-d2);
    end
    if (i - d3) > 0
        y(i) = y(i) + x(i-d3);
    end
end
  
subplot(2, 1, 2);

plot(y(:,1)), grid on
 
audiowrite('sample.wav', y, fs);

sound (x, fs)
