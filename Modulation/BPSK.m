clear, clc, close all; % ��� ���������, ������� �������
fs = 10000; % ������� ������������� 10���
ts = 0: 1/fs: 0.1-1/fs; % ������ ��������� ��������
N = length(ts); % ���������� ��������
fc = cos(2*pi*500*ts); % ������� �������
code = [1 1 -1 1 1 1 -1 -1 -1 1]; % ������� ����� ���������� ��������� ������ 1, � 0 ��� -1
% �������� ���� �� 180 ���� ��� �������� �� -1
NF_bit = 100; % ������� �������� ��������� ��� �������� ������ ����
% ����� ������ ���������� code �� ��� �������, ����� 1 ������ 100 ������,
% -1 - 100 ������ � ��� �����
pm = repelem(code, NF_bit); 
% ������ ������ ������ ������������� �� ��� �������
subplot(2,1,1) 
plot(ts, fc), grid on;
subplot(2,1,2);
plot(pm), grid on
x = fc.*pm; % ��������� ������������ ������� ������� �� ������ ������� ���������, % ������ � - ��� ��������������� �������� ������
% ������� ���, ����� ������������ ������������ �������
rng shuffle; % ������� ����������� ��� ����� ��������� 
x = x + (rand(1,N)*0.3-0.12);
figure
plot(ts, x), grid on, hold on; % ������-�������������� ������
plot(ts, pm, 'LineWidth', 2); % �������� ������ 
h = hilbert(x); % �������� �������������� ������
scatterplot(h, NF_bit, round(NF_bit/2)), grid on;
% ����� �� ���������� ��������� ��� �� ���� 1 ��� ������ ��� ��������, ������� ��-�� �����
y = x.*fc; % ������� �������� ������ �� ������� �������
figure
plot(ts, y), grid on;
% �������� ������, � ������� ��� ����� ��������� ���������� 0 � ����������
% 1, ��� ����������� ���������� ���
d_fir = bpsk_filter_lowpass;
% �������� ������ � ������ ������� 
y_dem = filter(d_fir.Numerator, 1, y);
figure
plot(ts, y_dem), grid on;
figure
subplot(2,1,1);
plot(ts, y_dem), grid on;
d = y_dem>0.1; %���� ������ 0.1 ������ ���������� 1, ������ - 0
subplot(2,1,2);
plot(ts, d); grid on;
