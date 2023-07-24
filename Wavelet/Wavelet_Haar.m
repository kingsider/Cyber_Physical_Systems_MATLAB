clear, clc, close all; % âñå çàêğûààåì î÷èùàåì êîíñîëü
fs = 70; % ÷àñòîòà äèñêğåòèçàöèè
T = 16; % âğåìÿ â òå÷åíèå êîòîğîãî áóäóò ïğîèñõîäèòü ïîñòğîåíèÿ
ts = -T:1/fs:T-1/fs; % ìàññèâ âğåìåííûõ îòñ÷åòîâ
N = length(ts); % ïåğåìåííàÿ, ğàâíàÿ êîëè÷åñòâó îòñ÷åòîâ
x1 = zeros(1,N);% ôîğìèğîâàíèå ìàññèâ íóëåé
x2 = zeros(1,N);
x3 = zeros(1,N);
x4 = zeros(1,N);
x5 = zeros(1,N);
x6 = zeros(1,N);
x7 = zeros(1,N);
x8 = zeros(1,N);

% çàäàåì ïàğàìåòğû êàæäîãî âåéâëåòà Õààğà
x1((ts >= 0) & (ts < 0.5)) = 1;
x1((ts >= 0.5) & (ts < 1)) = -1;

x2((ts >= 0) & (ts < 1)) = 2;
x2((ts >= 1) & (ts < 2)) = -2; 

x3((ts >= 0) & (ts < 2)) = 3;
x3((ts >= 2) & (ts < 4)) = -3; 

x4((ts >= 0) & (ts < 3)) = 4;
x4((ts >= 3) & (ts < 6)) = -4; 

x5((ts >= 0) & (ts < 4)) = 5;
x5((ts >= 4) & (ts < 8)) = -5; 

x6((ts >= 0) & (ts < 5)) = 6;
x6((ts >= 5) & (ts < 10)) = -6;

x7((ts >= 0) & (ts < 6)) = 7;
x7((ts >= 6) & (ts < 12)) = -7;

x8((ts >= 0) & (ts < 7)) = 8;
x8((ts >= 7) & (ts < 14)) = -8;

figure
plot(ts, x1, '-r', ts, x2, '-b',ts, x3, '-g', ts, x4, '-r', ts, x5,'-b', ts, x6,'-g', ...
    ts, x7,'-r', ts, x8, '-b'),
xlim([-2 16]);
grid on,title('Âåéâëåòû Õààğà');

w1 = abs(fft(x1)); % ñäåëàåì ÄÏÔ
w2 = abs(fft(x2));
w3 = abs(fft(x3));
w4 = abs(fft(x4));
w5 = abs(fft(x5));
w6 = abs(fft(x6));
w7 = abs(fft(x7));
w8 = abs(fft(x8));
f = 0:fs/N:fs-fs/N; 

figure
subplot(4,2,1)
plot(f(1:N/2),w1(1:N/2)), grid on,title('ÄÏÔ âåéâëåòà Õààğà x1')
xlabel('×àñòîòà'),ylabel('Àìïëèòóäà')
xlim([0 10])

subplot(4,2,2)
plot(f(1:N/2),w2(1:N/2)), grid on,title('x2')
xlabel('×àñòîòà'),ylabel('Àìïëèòóäà')
xlim([0 10])

subplot(4,2,3)
plot(f(1:N/2),w3(1:N/2)), grid on,title('x3')
xlabel('×àñòîòà'),ylabel('Àìïëèòóäà')
xlim([0 2])

subplot(4,2,4)
plot(f(1:N/2),w4(1:N/2)), grid on,title('x4')
xlabel('×àñòîòà'),ylabel('Àìïëèòóäà')
xlim([0 2])

subplot(4,2,5)
plot(f(1:N/2),w5(1:N/2)), grid on,title('x5')
xlabel('×àñòîòà'),ylabel('Àìïëèòóäà')
xlim([0 2])

subplot(4,2,6)
plot(f(1:N/2),w6(1:N/2)), grid on,title('x6')
xlabel('×àñòîòà'),ylabel('Àìïëèòóäà')
xlim([0 2])

subplot(4,2,7)
plot(f(1:N/2),w7(1:N/2)), grid on,title('x7')
xlabel('×àñòîòà'),ylabel('Àìïëèòóäà')
xlim([0 2])

subplot(4,2,8)
plot(f(1:N/2),w8(1:N/2)), grid on,title('x8')
xlabel('×àñòîòà'),ylabel('Àìïëèòóäà')
xlim([0 2])
