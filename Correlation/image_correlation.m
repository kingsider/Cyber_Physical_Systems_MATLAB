clear; clc; close all; % ������� ������� ��� ���������

b = imread('b.jpg'); % ������ ����� �
bGray = rgb2gray(b); % ���������� �������������� � ������� ������ �����

figure(1); % ������� ��, ��� �� ���� �� ������� 1
imshow(bGray);
pikcha2 = imread('pikcha2.jpg'); % ��� ����� ������� ��������� ����
pikcha2Gray = rgb2gray(pikcha2);

figure(2); % ������� �� ������� 2 ����� �������
imshow(pikcha2);
% ������� �������������� ������� 
% ��� ������� �������� ���������� ��������� �������� ������������ ������� ������� normcorr2 
Corr = normxcorr2(bGray,pikcha2Gray);
% ���������� ����� ��������� �������������� �������
[maxV,maxInd] = max(abs(Corr(:)));
[maxY,maxX] = ind2sub(size(Corr),maxInd);
% ������� ��������� �������������� �������

figure(3); % �������� ���������� ������
x = surf(Corr);
set(x, 'LineStyle', 'none'); 
% ������ ������������� ������ ��������� ����. �������
figure(2);
% ������ ��������������, �������� ����� 5, ���� �������
rectangle('Position',[(maxX-80) (maxY-80) 80 80],'LineWidth',5,'EdgeColor','g');
