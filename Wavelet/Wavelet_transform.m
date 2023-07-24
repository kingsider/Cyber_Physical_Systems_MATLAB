clear, clc, close all; % ��� ��������� ������� �������
fs = 150; % ������� ������������� 150 ��
f1 = 10; % ������� ��������� ��������� ������������
f2 = 15; % �� 15 ��
f3 = 25; % �� 25 ��
f4 = 30; % �� 30 ��
f5 = 50; % �� 50 ��
% � ����� ������ � ����� ������ ������� ���������
t1= 0 : 1/fs : 1-1/fs; % ������ ��������� �������� ��� ������� �������
lt1 = length(t1); % ����������, ������ ���������� ��������
x(1: lt1)=sin(2*pi*f1*t1); % ������� � 1-� ��������� ������������ 

t2= 1:1/fs:2-1/fs;
lt2 = length(t2);
x(lt1+1 :lt1+lt2) = sin(2*pi*f2*t2);

t3= 2:1/fs:3-1/fs;
lt3 = length(t3);
x(lt1+lt2+1:lt1+lt2+lt3) = 0.5*sin(2*pi*f3*t3)+0.5*sin(2*pi*f1*t3);

t4= 3:1/fs:4-1/fs;
lt4 = length(t4);
x(lt1 +lt2 +lt3 +1:lt1 +lt2 +lt3+lt4) = sin(2*pi*f4*t4);

t5 = 4 : 1/fs : 5-1/fs;
lt5 = length(t5);
x(lt1 +lt2 +lt3+lt4 +1:lt1+lt2+lt3+lt4+lt5) = sin(2*pi*f5*t5);

t = [t1 t2 t3 t4 t5]; % ������������ ������� ������ ���������� �������� 
% - ����� ���������� �������� ��� ������� �������
N = length(t); % ����������, ������ ������ ���������� ��������
subplot(2,1,1) % �������� ������������ ������ � ������� ���
plot(t,x), grid on, title('������ � ����� ������ ������� ���������')
xlabel('�����'), ylabel('���������')
X = 2*abs(fft(x))/N; % ��������� ��������� ���
f = 0: fs/N : fs-fs/N; 
subplot(2,1,2)
stem(f,X), grid on, title('������ ��������� �������')
xlabel('�������'), ylabel('���������')
figure
cwt(x,'amor',fs) % ������� ������� ��������������
% �� �����, ��� ���� ������� ��������� � ��������� 5 - 50 ��, �������
% ���������� ���� �������� ��� ������� ���������������
fb = cwtfilterbank('SignalLength',numel(x),'SamplingFrequency',fs,...
    'FrequencyLimits',[5 50]);
figure
freqz(fb) % ������ ��������� �������������� ��������
% � ��������� �������������� ����� ��������
figure
cwt(x,'FilterBank',fb);