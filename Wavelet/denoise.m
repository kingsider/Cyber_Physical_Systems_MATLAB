clear , clc , close all; % ��� ��������� ������� �������
fs = 800;% ������� ������������� 800 ��
ts = 0:1/fs:2-1/fs; % ������ ��������� ��������
x = 0.5*sin(2*pi*8*ts)+1.4*sin(2*pi*15*ts)+ 1.2*sin(2*pi*30*ts); % ������� ������ � 3 ��-�����������
x = awgn(x,7); % ������� ����� ������ ���
figure % ������� �������� ������
plot(x), grid on,
title('�������� ������');
Ynoise = wdenoise(x,10,'Wavelet', 'db2'); %���������� ������� ������ ��� �������� ����
% ������������ ������� ������
figure % ������� ��������� ������
plot(Ynoise), grid on, 
title('��������� �� ����� ������');
