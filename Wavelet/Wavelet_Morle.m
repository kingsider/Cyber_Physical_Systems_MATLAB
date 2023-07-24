clear, clc, close all % ��� ���������, ������� �������
fs = 70; % ������� ������������� 70 ��
T = 4; % ����� � ������� �������� ����� ����������� ����������
ts = -T:1/fs:T-1/fs; % ������ ��������� ��������
% ���������� 6 ���������� � ������ ��������� ������������

x1 = cos(2*pi*0.4*ts);
x2 = cos(2*pi*0.6*ts);
x3 = cos(2*pi*0.8*ts);
x4 = cos(2*pi*1*ts);
x5 = cos(2*pi*1.2*ts);
x6 = cos(2*pi*1.4*ts);

g = exp(-ts.^2/2); % ������� ������

w1 = x1.*g; % ������������ ��������� ���������� �� ������� ������
w2 = x2.*g; 
w3 = x3.*g; 
w4 = x4.*g; 
w5 = x5.*g; 
w6 = x6.*g; 
 
subplot(3,2,1)
plot(ts, x1), grid on,title('x1')
subplot(3,2,2)
plot(ts, x2), grid on,title('x2')
subplot(3,2,3)
plot(ts, x3), grid on,title('x3')
subplot(3,2,4)
plot(ts, x4), grid on,title('x4')
subplot(3,2,5)
plot(ts, x5), grid on,title('x5')
subplot(3,2,6)
plot(ts, x6), grid on,title('x6')
figure

subplot(3,2,1)
plot(ts, w1), grid on,title('������� ����� ��� x1')
xlabel('�����'),ylabel('���������')
subplot(3,2,2)
plot(ts, w2), grid on,title('������� ����� ��� x2')
xlabel('�����'),ylabel('���������')
subplot(3,2,3)
plot(ts, w3), grid on,title('������� ����� ��� x3')
xlabel('�����'),ylabel('���������')
subplot(3,2,4)
plot(ts, w4), grid on,title('������� ����� ��� x4')
xlabel('�����'),ylabel('���������')
subplot(3,2,5)
plot(ts, w5), grid on,title('������� ����� ��� x5')
xlabel('�����'),ylabel('���������')
subplot(3,2,6)
plot(ts, w6), grid on,title('������� ����� ��� x6')
xlabel('�����'),ylabel('���������')



% ��� ��������� �����

W1 = abs(fft(w1));
W2 = abs(fft(w2));
W3 = abs(fft(w3));
W4 = abs(fft(w4));
W5 = abs(fft(w5));
W6 = abs(fft(w6));

N = length(w1); 

f = 0:fs/N:fs-fs/N;
% ������� ��� ��������� ����� 

figure
plot(f(1:N/2),W1(1:N/2),f(1:N/2),W2(1:N/2),f(1:N/2),W3(1:N/2), ...
    f(1:N/2),W4(1:N/2),f(1:N/2),W5(1:N/2),f(1:N/2),W6(1:N/2)), xlim([0 10]), grid on
title('��� ��������� �����')
xlabel('�������'),ylabel('���������')
