clear, clc, close all; % все закрываем, очищаем консоль
fs = 15000; % частота дискретизации 15 кГЦ
ts = 0:1/fs : 0.1-1/fs; % массив временных остчетов
N = length(ts); % переменная равная количеству отсчетов
fc = 1500; % несущая частота
M = 32; % индекс модуляции
Ndata = 50;% количество бит данных
NF_bit = N/Ndata; % размер бита, сколько бит на отсчет
data = randi([1 M], Ndata, 1);  % создадим случайный набор данных, 
% создаст вектор случайный данных от 0 до M-1
send = zeros(1,Ndata);                
% зададим значения массива
send_set = [       -3+5j,-1+5j,1+5j 3+5j  ...
             -5+3j,-3+3j,-1+3j,1+3j,3+3j, 5+3j ...
             -5+1j,-3+1j,-1+1j,1+1j,3+1j, 5+1j ...
             -5-1j,-3-1j,-1-1j,1-1j,3-1j, 5-1j ...                   
             -5-3j,-3-3j,-1-3j,1-3j,3-3j, 5-3j ...
                   -3-5j,-1-5j,1-5j,3-5j];     
% в зависимости от значения на конкретном отсчете данные будут принимать
% значения комплексных чисел
for q=1:Ndata
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
    elseif data(q) == 8
        send(q) = send_set(8);         
    elseif data(q) == 9
        send(q) = send_set(9);          
    elseif data(q) == 10
        send(q) = send_set(10);        
    elseif data(q) == 11
        send(q) = send_set(11);         
    elseif data(q) == 12
        send(q) = send_set(12);         
    elseif data(q) == 13
        send(q) = send_set(13);         
    elseif data(q) == 14
        send(q) = send_set(14);         
    elseif data(q) == 15
        send(q) = send_set(15);         
    elseif data(q) == 16
        send(q) = send_set(16);       
    elseif data(q) == 17
        send(q) = send_set(17);        
    elseif data(q) == 18
        send(q) = send_set(18);         
    elseif data(q) == 19
        send(q) = send_set(19);       
    elseif data(q) == 20
        send(q) = send_set(20);         
    elseif data(q) == 21
        send(q) = send_set(21);          
    elseif data(q) == 22
        send(q) = send_set(22);         
    elseif data(q) == 23
        send(q) = send_set(23);         
    elseif data(q) == 24
        send(q) = send_set(24);         
    elseif data(q) == 25
        send(q) = send_set(25);         
    elseif data(q) == 26
        send(q) = send_set(26);         
    elseif data(q) == 27
        send(q) = send_set(27);          
    elseif data(q) == 28
        send(q) = send_set(28);        
    elseif data(q) == 29
        send(q) = send_set(29);         
    elseif data(q) == 30
        send(q) = send_set(30);         
    elseif data(q) == 31
        send(q) = send_set(31); 
    else
        send(q) = send_set(32);        
    end
end
scatterplot(send), grid on;
% функция матлаба, но мы делаем вручную
% qdata = qammod(send, M);
% теперь делаем преобразование
% сейчас Ndata содержит 50 элементов, теперь нам нужно растянуть ее на весь
% сигнал
qmod = repelem(send, NF_bit);
% выделим действительную и мнимую часть и произведем поэлементное умножение
% на косинусную и синусную составляющую
i = real(qmod).*cos(2*pi*fc*ts);
q = imag(qmod).*sin(2*pi*fc*ts);
% чтобы получить модулированный сигнал, нужно сложить две этих составляющие
y = i+q;
rng shuffle;% сделаем рандомайзер еще более рандомным
y = y+(rand(1,N)*0.18-0.12); % зададим параметры шума
figure; % покажем на графике 
subplot(3,1,1) % изобразим на графиках синфазную и квадратурную составляющую сигнала
plot(i), grid on;
subplot(3,1,2)
plot(q), grid on;
subplot(3,1,3) 
plot(y), grid on;
% нижний график это квадратурный модулированный синусоидальный сигнал
idem = 2*y.*cos(2*pi*fc*ts);
qdem = 2*y.*sin(2*pi*fc*ts); % на 2 умножаем потому что получается умножаем синусоидальный и косинусодальный сигнал на синус и на косинус
% если провести тригонометрические преобразования и фильтрация то поулчим сигнал по амплитуде в 2 раза меньше
figure
subplot(2,1,1)
plot(idem), grid on
subplot(2,1,2)
plot(qdem), grid on
% теперь убираем отсюда удвоенную несущую частоту, делаем опять фнч
filt = qam_filter;
%Fs = 15000;  % Sampling Frequency
%Fpass = 1100;             % Passband Frequency
%Fstop = 1400;             % Stopband Frequency
%Dpass = 0.057501127785;  % Passband Ripple
%Dstop = 0.0001;          % Stopband Attenuation
%dens  = 20;              % Density Factor
idemf=round(conv(filt.Numerator, idem));
qdemf=round(conv(filt.Numerator, qdem));
% покажем демодулированную синфазную и квадратурную составляющую сигнала 
% после фильтрации
figure
subplot(2,1,1)
plot(idemf), grid on
subplot(2,1,2)
plot(qdemf), grid on
% теперь с середины битов считаем состояние сигнала
demod = complex(idemf, qdemf);
% считаем из массива нужные значения
% так как мы применили фнч, у нас в начале появилась задержка (0 в начале)
% нам надо учесть задежрку и считать данные
fir_delay = round(length(filt.Numerator)/2);
demod_data = demod(fir_delay+round(NF_bit/2): NF_bit:length(demod)-fir_delay);
send_set1 = [       1,2,3,4,  ...
                  5,6,7,8,9,10 ...
                11,12,13,14,15,16 ...
                17,18,19,20,21,22 ...                   
                23,24,25,26,27,28 ...
                   29,30,31,32];     
% производим демодуляцию 
dem_d = zeros(1,Ndata); 
for q = 1:Ndata
    if demod_data(q) == -3+5j
        dem_d(q) = send_set1(1);         
    elseif demod_data(q) == -1+5j
        dem_d(q) = send_set1(2);         
    elseif demod_data(q) == 1+5j
        dem_d(q) = send_set1(3);        
    elseif demod_data(q) == 3+5j
        dem_d(q) = send_set1(4);        
    elseif demod_data(q) == -5+3j
        dem_d(q) = send_set1(5);          
    elseif demod_data(q) == -3+3j
        dem_d(q) = send_set1(6);         
    elseif demod_data(q) == -1+3j
        dem_d(q) = send_set1(7);          
    elseif demod_data(q) == 1+3j
        dem_d(q) = send_set1(8);         
    elseif demod_data(q) == 3+3j
        dem_d(q) = send_set1(9);        
    elseif demod_data(q) == 5+3j
        dem_d(q) = send_set1(10);        
    elseif demod_data(q) == -5+1j
        dem_d(q) = send_set1(11);        
    elseif demod_data(q) == -3+1j
        dem_d(q) = send_set1(12);         
    elseif demod_data(q) == -1+1j
        dem_d(q) = send_set1(13);         
    elseif demod_data(q) == 1+1j
        dem_d(q) = send_set1(14);        
    elseif demod_data(q) == 3+1j
        dem_d(q) = send_set1(15);        
    elseif demod_data(q) == 5+1j
        dem_d(q) = send_set1(16);       
    elseif demod_data(q) == -5-1j
       dem_d(q) = send_set1(17);          
    elseif demod_data(q) == -3-1j
        dem_d(q) = send_set1(18);          
    elseif demod_data(q) == -1-1j
        dem_d(q) = send_set1(19);         
    elseif demod_data(q) == 1-1j
        dem_d(q) = send_set1(20);          
    elseif demod_data(q) == 3-1j
        dem_d(q) = send_set1(21);          
    elseif demod_data(q) == 5-1j
        dem_d(q) = send_set1(22);          
    elseif demod_data(q) == -5-3j
       dem_d(q) = send_set1(23);         
    elseif demod_data(q) == -3-3j
        dem_d(q) = send_set1(24);          
    elseif demod_data(q) == -1-3j
        dem_d(q) = send_set1(25);         
    elseif demod_data(q) == 1-3j
        dem_d(q) = send_set1(26);          
    elseif demod_data(q) == 3-3j
        dem_d(q) = send_set1(27);         
    elseif demod_data(q) == 5-3j
       dem_d(q) = send_set1(28);         
    elseif demod_data(q) == -3-5j
        dem_d(q) = send_set1(29);        
    elseif demod_data(q) == -1-5j
        dem_d(q) = send_set1(30);         
    elseif demod_data(q) == 1-5j
        dem_d(q) = send_set1(31); 
    else 
        dem_d(q) = send_set1(32);
    end
end
% начертим полученный график модулированного и демодулированного сигнала
figure
plot(data, 'b', 'LineWidth', 2), grid on, hold on
plot(dem_d, 'xr', 'LineWidth', 4);
title('Демодулированный сигнал')
% вершины синего графика это данные сгенерированные при модуляции сигнала
% красные ромбики, это результат демодуляции, то, что они в вершинах
% значит мы получили сигнал без шумов и задержек
