% Title: Digital Negative Operation

close all;
clear variables;
clc;

rgb_img = imread('../images/leena.jpg');

figure;
subplot(2, 2, 1),imshow(rgb_img),title('Original Image');

% Grayscale Image

gray_img = rgb2gray(rgb_img);
subplot(2, 2, 2),imshow(gray_img),title('Grayscale Image');

% Digital Negative Operation

% S = L-1-r
negative_rgb_img = 255 - 1 - rgb_img;
subplot(2, 2, 3),imshow(negative_rgb_img),title('Negative RGB Image');

negative_gray_img = 255 - 1 - gray_img;
subplot(2, 2, 4),imshow(negative_gray_img),title('Negative Grayscale Image');
