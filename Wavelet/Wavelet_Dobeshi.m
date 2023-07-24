clear, clc, close all; % все закрыааем очищаем консоль
fs = 100; % частота дискретизации
T = 2; % время в течение которого будут происходить построения
ts = -T:1/fs:T-1/fs; % массив временных отсчетов
N = length(ts); % переменная, равная количеству отсчетов

[wpws,x] = wpfun('db2',5); % Вейвлет Добеши (будет 6 штук)
 
for i = 1 : size(wpws, 1) 
    for jj = 387 : 400 % зануляем некоторые элементы, чтобы совпадали размеры матриц
     wpws(i, jj) = 0; % З
    end
end


figure
subplot(3,2,1)
plot(ts, wpws(1, :)), grid on, title('Вейвлет Добеши 1')
xlabel('Время'),ylabel('Амплитуда')

subplot(3,2,2)
plot(ts, wpws(2, :)), grid on,title('Вейвлет Добеши 2')
xlabel('Время'),ylabel('Амплитуда')

subplot(3,2,3)
plot(ts, wpws(3, :)), grid on,title('Вейвлет Добеши 3')
xlabel('Время'),ylabel('Амплитуда')

subplot(3,2,4)
plot(ts, wpws(4, :)), grid on,title('Вейвлет Добеши 4')
xlabel('Время'),ylabel('Амплитуда')

subplot(3,2,5)
plot(ts, wpws(5, :)), grid on,title('Вейвлет Добеши 5')
xlabel('Время'),ylabel('Амплитуда')

subplot(3,2,6)
plot(ts, wpws(6, :)), grid on,title('Вейвлет Добеши 6')
xlabel('Время'),ylabel('Амплитуда')

figure
plot(ts,wpws(1, :), ts,wpws(2, :), ts,wpws(3, :), ts,wpws(4, :), ...
    ts,wpws(5, :),ts,wpws(6, :)), grid on;

w1 = abs(fft(wpws(1, :))); % сделаем ДПФ
w2 = abs(fft(wpws(2, :)));
w3 = abs(fft(wpws(3, :)));
w4 = abs(fft(wpws(4, :)));
w5 = abs(fft(wpws(5, :)));
w6 = abs(fft(wpws(6, :)));
f = 0:fs/N:fs-fs/N; 


figure
subplot(3,2,1)
plot(f(1:N/2),w1(1:N/2)), grid on,title('ДПФ вейвлета Добеши 1')
xlabel('Частота'),ylabel('Амплитуда')
xlim([0 20]);

subplot(3,2,2)
plot(f(1:N/2),w2(1:N/2)), grid on,title('ДПФ вейвлета Добеши 2')
xlabel('Частота'),ylabel('Амплитуда')
xlim([0 20]);

subplot(3,2,3)
plot(f(1:N/2),w3(1:N/2)), grid on,title('ДПФ вейвлета Добеши 3')
xlabel('Частота'),ylabel('Амплитуда')
xlim([0 20]);

subplot(3,2,4)
plot(f(1:N/2),w4(1:N/2)), grid on,title('ДПФ вейвлета Добеши 4')
xlabel('Частота'),ylabel('Амплитуда')
xlim([0 20]);

subplot(3,2,5)
plot(f(1:N/2),w5(1:N/2)), grid on,title('ДПФ вейвлета Добеши 5')
xlabel('Частота'),ylabel('Амплитуда')
xlim([0 20]);

subplot(3,2,6)
plot(f(1:N/2),w6(1:N/2)), grid on,title('ДПФ вейвлета Добеши 6')
xlabel('Частота'),ylabel('Амплитуда')
xlim([0 20]);
