clear, clc, close all; % ��� ��������� ������� �������
fs = 100; % ������� �������������
T = 2; % ����� � ������� �������� ����� ����������� ����������
ts = -T:1/fs:T-1/fs; % ������ ��������� ��������
N = length(ts); % ����������, ������ ���������� ��������

[wpws,x] = wpfun('db2',5); % ������� ������ (����� 6 ����)
 
for i = 1 : size(wpws, 1) 
    for jj = 387 : 400 % �������� ��������� ��������, ����� ��������� ������� ������
     wpws(i, jj) = 0; % �
    end
end


figure
subplot(3,2,1)
plot(ts, wpws(1, :)), grid on, title('������� ������ 1')
xlabel('�����'),ylabel('���������')

subplot(3,2,2)
plot(ts, wpws(2, :)), grid on,title('������� ������ 2')
xlabel('�����'),ylabel('���������')

subplot(3,2,3)
plot(ts, wpws(3, :)), grid on,title('������� ������ 3')
xlabel('�����'),ylabel('���������')

subplot(3,2,4)
plot(ts, wpws(4, :)), grid on,title('������� ������ 4')
xlabel('�����'),ylabel('���������')

subplot(3,2,5)
plot(ts, wpws(5, :)), grid on,title('������� ������ 5')
xlabel('�����'),ylabel('���������')

subplot(3,2,6)
plot(ts, wpws(6, :)), grid on,title('������� ������ 6')
xlabel('�����'),ylabel('���������')

figure
plot(ts,wpws(1, :), ts,wpws(2, :), ts,wpws(3, :), ts,wpws(4, :), ...
    ts,wpws(5, :),ts,wpws(6, :)), grid on;

w1 = abs(fft(wpws(1, :))); % ������� ���
w2 = abs(fft(wpws(2, :)));
w3 = abs(fft(wpws(3, :)));
w4 = abs(fft(wpws(4, :)));
w5 = abs(fft(wpws(5, :)));
w6 = abs(fft(wpws(6, :)));
f = 0:fs/N:fs-fs/N; 


figure
subplot(3,2,1)
plot(f(1:N/2),w1(1:N/2)), grid on,title('��� �������� ������ 1')
xlabel('�������'),ylabel('���������')
xlim([0 20]);

subplot(3,2,2)
plot(f(1:N/2),w2(1:N/2)), grid on,title('��� �������� ������ 2')
xlabel('�������'),ylabel('���������')
xlim([0 20]);

subplot(3,2,3)
plot(f(1:N/2),w3(1:N/2)), grid on,title('��� �������� ������ 3')
xlabel('�������'),ylabel('���������')
xlim([0 20]);

subplot(3,2,4)
plot(f(1:N/2),w4(1:N/2)), grid on,title('��� �������� ������ 4')
xlabel('�������'),ylabel('���������')
xlim([0 20]);

subplot(3,2,5)
plot(f(1:N/2),w5(1:N/2)), grid on,title('��� �������� ������ 5')
xlabel('�������'),ylabel('���������')
xlim([0 20]);

subplot(3,2,6)
plot(f(1:N/2),w6(1:N/2)), grid on,title('��� �������� ������ 6')
xlabel('�������'),ylabel('���������')
xlim([0 20]);
