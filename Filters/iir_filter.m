% ��� ������ ø�����
clear, clc, close all; % ������� �������, ��������� ��� ��������
fs = 15000; % ������� ������������� 15���
ts = 0: 1/fs: 0.001-1/fs; % ������ ������ ��������� ��������
N=length(ts); % ������ ���������� ������ ���������� ��������
x = sin(2*pi*1000*ts) + 0.6*sin(2*pi*5000*ts+2*pi/3); % ������ ��� ������
X = 2*abs(fft(x))/N; % ������ ���
f = 0: fs/N : fs-fs/N; % �������� ��������� ���
stem(f,X), grid on % �������� ������, ����� ��������
% 1 ����� - ���������� 1 ������ ���
fg = 5000; % �� ����� ������ ��������� ��������� ������������ 5 ���
m = fg/fs*N+1; % ������������ ����� �������, ������� ������������� ��� �������, ������ ���
Xf = 0;
% �������� ����� ��, ��� �� 2 ��������, �������������� "� ���"
for n = 1:N
    Xf = Xf+x(n)*(cos(2*pi*(n-1)*(m-1)/N)-1i*sin(2*pi*(n-1)*(m-1)/N));
end
% ����������� ����� ��������������� � ���������
Xm = 2*abs(Xf)/N;
% ��������� ����������
disp('������ ����� 1 ��� ���')
disp(Xm);
% ��������� �������� ø�����
u1 = 0; % �������� ��������������� ���������� 
u2 = 0;
w = 2*pi*(m-1)/N;
for n=1:N
    u0 = 2*cos(w)*u1-u2+x(n);
    u2=u1;
    u1=u0;
end
y = u0 - exp(-1i*w)*u2;
Y = 2*abs(y)/N; % ��������� ���������
disp('������ ����� �������� ø�����')
disp(Y);
% ���������� ���������� ������� ������� � ��������� ���������
H = goertzel(x,m);
Hm = 2*abs(H)/N; % ��������� ���������
disp('������ ����� �������� ø����� �������� ������ �������')
disp(Hm);