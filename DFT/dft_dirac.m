clear; close all;
 
fs = 10000; % ������� �������������
ts = 0 : 1/fs : 0.01-1/fs; 
 
N = length(ts); % ���������� ������ ���������� �������� ������ �������
x = zeros(N,1); % ���������� ������ ����� �� N ���������
x(1) = 1; % ������ ������� ����� �������
 
Fn = N/2; % ������� ������� ��������� 
X = zeros(N); % ���������� ������ ����� �� N ���������
 
% ��������� � ���, ��������� ���������� ������� MATLAB
X = fft(x);
plot(x), xlim([-2 N]), ylim([-0.2 1]), grid on, title('������� ������');
 
figure;
%��������� ��� ���� ����������� �����
subplot(2,2,1)
plot(real(X)), xlim([0 Fn]), grid on, title('�������������� �����')

subplot(2,2,2)
plot(imag(X)), xlim([0 Fn]), grid on, title('������ �����')

%�� � ��� ������� �� ������� ���������
 
subplot(2,2,3);
f = (0:N-1)*fs/N;

plot(f,X), 
title('��������� � ������������� �������'), 
grid on %�� ��� X ����� �������

phi = angle(X)*180/pi; % ������ ����
subplot(2,2,4);

plot(f,phi), grid on, title('����');