clear; clc; close all; % очищаем консоль все закрываем

b = imread('b.jpg'); % найдем букву Ѕ
bGray = rgb2gray(b); % производим преобразование в оттенки серого цвета

figure(1); % покажем то, что мы ищем на рисунке 1
imshow(bGray);
pikcha2 = imread('pikcha2.jpg'); % это обща€ картина множества букв
pikcha2Gray = rgb2gray(pikcha2);

figure(2); % покажем на рисунке 2 общую картину
imshow(pikcha2);
% зададим коррел€ционную функцию 
% при расчЄте взаимной коррел€ции двумерных сигналов используетс€ функци€ матлаба normcorr2 
Corr = normxcorr2(bGray,pikcha2Gray);
% произведем поиск максимума коррел€ционной функции
[maxV,maxInd] = max(abs(Corr(:)));
[maxY,maxX] = ind2sub(size(Corr),maxInd);
% покажем амплитуду коррел€ционной функции

figure(3); % получаем трехмерный график
x = surf(Corr);
set(x, 'LineStyle', 'none'); 
% –исуем пр€моугольник вокруг максимума корр. функции
figure(2);
% ширина пр€моугольника, жирность линии 5, цвет зеленый
rectangle('Position',[(maxX-80) (maxY-80) 80 80],'LineWidth',5,'EdgeColor','g');
