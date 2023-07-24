clear, clc, close all; % все закрываем, очищаем консоль
fs = 15000; % частота дискретизации, возьмем 15 кГц
ts = 0: 1/fs: 0.1-1/fs; % массив временных отсчетов
N = length (ts); % переменная, равная количеству отсчетов
fc = 1500; % несущую частоту возьмем 1500 Гц
M = 8; % 8-PSK-модуляция, поэтому коэф модуляции возьмем 8
data_N = 50; % размер данных
NF_bit = N/data_N; % количество отсчётов на бит
data = randi ([1 M] ,data_N ,1); % создадим случайный набор данных, 
% создаст вектор случайный данных от 0 до M-1
% создадим массив комплексных чисел
send = zeros(1,data_N);
send_set = [   cos(5*pi/4)+1j*sin(5*pi/4),cos(pi)+1j*(sin(pi)),  ...
               cos(pi/2)+1j*sin(pi/2),cos(3*pi/4)+1j*sin(3*pi/4),... 
               cos(3*pi/2)+1j*sin(3*pi/2),cos(7*pi/4)+1j*sin(7*pi/4),...                   
                         cos(pi/4)+1j*sin(pi/4),1];
                      
% в зависимости от значения на конкретном отсчете данные будут принимать
% значения комплексных чисел
for q=1:data_N
    if data(q) == 1
        send(q) = send_set(1);         
    elseif data(q) == 2
        send(q) = send_set(2);         
    elseif data(q) == 3
        send(q) = send_set(3);         
    elseif data(q) == 4
        send(q) = send_set(4);         
    elseif data(q) == 5
        send(q) = send_set(5);         
    elseif data(q) == 6
        send(q) = send_set(6);        
    elseif data(q) == 7
        send(q) = send_set(7);        
    else
        send(q) = send_set(8);        
    end
end
%complex_ar = pskmod(data, M); % использование манипулирования сдвига фазы с модуляцией
%send = send + (rand(1,N)*0.17-0.08);
%send = awgn(send, 30); % добавляет белый гауссов шум к сигналу complex_mas
% сигнальное созвездие
scatterplot(send), grid on; % покажем сигнальное созвездие, видим разброс из-за шумов
% но сигнал вполне различим
rep = repelem(send, NF_bit); 
% выделим действительную и мнимую часть и произведем поэлементное умножение
% на косинусную и синусную составляющую
re = real(rep).*cos(2*pi*fc*ts); 
im = imag(rep).*sin(2*pi*fc*ts);
% чтобы получить модулированный сигнал, нужно сложить две этих составляющие
y_mod = re+im;
% изобразим на графике модулированный сигнал
rng shuffle; % сделаем рандоммайзер еще более рандомным
y_mod = y_mod+(rand(1,N)*0.18-0.12); % зададим параметры шума
figure;
plot(y_mod);
title('Модулированный сигнал')
% нижний график это модулированный сигнал
% приступаем к демодуляции
re_dem = 2*y_mod.*cos(2*pi*fc*ts);
im_dem = 2*y_mod.*sin(2*pi*fc*ts); % на 2 умножаем потому что получается умножаем 
% синусоидальный и косинусодальный сигнал на синус и на косинус
% если провести тригонометрические преобразования и фильтрация то получим сигнал 
% по амплитуде в 2 раза меньше
figure
subplot(2,1,1)
plot(re_dem), grid on
subplot(2,1,2)
plot(im_dem), grid on
% теперь убираем отсюда удвоенную несущую частоту, делаем опять фнч
fil = psk8_filter;
re_demf=round(conv(fil.Numerator, re_dem));
im_demf=round(conv(fil.Numerator, im_dem));

re_demod = zeros(size(re_demf)); % задаем массив нулей для новых переменных

 % демодулируем действительную и мнимую часть сигнала
for jj=1:length(re_demf)
    if re_demf(jj) >= cos(pi/4)
        re_demod(jj) = cos(0);
    elseif re_demf(jj) >= cos(pi/2)
        re_demod(jj) = cos(pi/4);
    elseif re_demf(jj) >= -cos(pi/2)
        re_demod(jj) = cos(pi/2);
    elseif re_demf(jj) >= -cos(pi/4)
        re_demod(jj) = -cos(pi/4);
    else
        re_demod(jj) = cos(pi);
    end
end

im_demod = zeros(size(im_demf));

for jj=1:length(im_demf)
  if im_demf(jj) >= sin(pi/4) 
        im_demod(jj) = sin(pi/2);
    elseif im_demf(jj) >= sin(pi)
        im_demod(jj) = sin(pi/4);
    elseif im_demf(jj) >= -sin(pi)
        im_demod(jj) = sin(0);
    elseif im_demf(jj) >= -sin(pi/4)
        im_demod(jj) = -sin(pi/4);
    else
        im_demod(jj) = -sin(pi/2);
  end
end
% построим получившиеся графики
figure
subplot(2,1,1);
plot(re_demod), grid on
xlim([0 1600]);
subplot(2,1,2);
plot(im_demod), grid on
xlim([0 1600]);
dem = complex(re_demod, im_demod);
% считаем из массива нужные значения
% так как мы применили фнч, у нас в начале появилась задержка (0 в начале)
% нам надо учесть задержку и считать данные
delay = round(length(fil.Numerator)/2);
demod_data = dem(delay+round(NF_bit/2):NF_bit:length(dem)-delay);
convers = angle(demod_data);
y_dem = zeros(1,data_N);
for jj = 1:data_N
    switch convers(jj)
        case -3*pi/4
            y_dem(jj) = 1;
        case pi
            y_dem(jj) = 2;
        case pi/2
            y_dem(jj) = 3;
        case 3*pi/4
            y_dem(jj) = 4;
        case -pi/2
            y_dem(jj) = 5;
        case -pi/4
            y_dem(jj) = 6;
        case pi/4
            y_dem(jj) = 7;
        case 0
            y_dem(jj) = 8;
     end
end

figure
plot(data, '-r'), grid on, hold on;
plot(y_dem, '*b', 'LineWidth',3);
% вершины красного графика это данные сгенерированные при модуляции сигнала
% синие кружки это результат демодуляции, то, что они в вершинах
% значит мы получили сигнал без шумов и задержек

