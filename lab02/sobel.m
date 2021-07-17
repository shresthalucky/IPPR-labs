close all;
clear variables;
clc;

img = imread('../images/leena.jpg');
img = rgb2gray(img);

figure;
subplot(1,3,1),imshow(img),title('Image');

sobel_x_filter = [-1 0 1; -2 0 2; -1 0 1];
sobel_y_filter = sobel_x_filter';

kernel_size = 3;

out_x = apply_filter(img, sobel_x_filter);
out_y = apply_filter(img, sobel_y_filter);

subplot(1,3,2),imshow(out_x),title('Sobel X');
subplot(1,3,3),imshow(out_y),title('Sobel Y');