clear, clc, close all
 
[x, fs] = audioread('sample-6s.wav'); % ������ �����������
 
N = length(x); % �������� ����� ������� � ����������
 
ts = 0: 1/fs : N*1/fs-1/fs; % ������� �������
flange_freq = 0.5; % �������
flange_magnitude = 200; % ���������
 
d = abs(round(flange_magnitude*sin(2*pi*flange_freq*ts))); % ������� �������������
 
subplot(3, 1, 1); % �������� ������ �������������
plot(d), grid on
 
y = x;
 
subplot(3, 1, 2); % ������ ������� �� �������
plot(y(:,1)), grid on
 
for i = 1 : N
    flange_time_delay = i - d(i); 
    if flange_time_delay > 0
        y(i,1) = x(i,1) + x(flange_time_delay);
        y(i,2) = x(i,2) + x(flange_time_delay);
    else
        y(i,1) = x(i,1);
        y(i,2) = x(i,2);
    end
end
 
subplot(3, 1, 3);
plot(y(:,1)), grid on % ������ ������� � �������� �������
audiowrite('sample.wav', x, fs) % ������ ��������� ����� � ���������������
sound(y, fs)
