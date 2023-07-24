clear, clc, close all % ��� ���������, ������� �������
fs = 70; % ������� ������������� 70 ��
T = 4; % ����� � ������� �������� ����� ����������� ����������
ts = -T:1/fs:T-1/fs; % ������ ��������� ��������
g1 = exp(-ts.^2/2); % ������� ������ � ������� �����������
g2 = exp(-ts.^2);
g3 = exp(-ts.^2*2);
g4 = exp(-ts.^2*4);
g5 = exp(-ts.^2*8);
g6 = exp(-ts.^2*16);

% ����� ������ ����������� �� ������� ������, ������� ������� ������������
% �����

d1 =-diff(g1,2);
d2 =-diff(g2,2);
d3 =-diff(g3,2);
d4 =-diff(g4,2);
d5 =-diff(g5,2);
d6 =-diff(g6,2);
% ������� �� ������� ��������� ��������� ������������ �����

plot(ts(1:length(ts)-2), d1, ts(1:length(ts)-2), d2, ts(1:length(ts)-2), d3, ...
    ts(1:length(ts)-2), d4, ts(1:length(ts)-2), d5, ts(1:length(ts)-2), d6), grid on, hold on;
title ('������������ �����') % ��������� ��������
xlabel ('�����, �'), ylabel('���������'), xlim([-2 2]), ylim([-3e-3 6.8e-3]);

W1 = abs(fft(d1));
W2 = abs(fft(d2));
W3 = abs(fft(d3));
W4 = abs(fft(d4));
W5 = abs(fft(d5));
W6 = abs(fft(d6));

N = length(d1); 

f = 0:fs/N:fs-fs/N;
% ������� ��� ��������� ������������ �����

figure
plot(f(1:N/2),W1(1:N/2),f(1:N/2),W2(1:N/2),f(1:N/2),W3(1:N/2), ...
    f(1:N/2),W4(1:N/2),f(1:N/2),W5(1:N/2),f(1:N/2),W6(1:N/2)), xlim([0 10]), grid on
title('��� ��������� ������������ �����');
xlabel('�������'),ylabel('���������');