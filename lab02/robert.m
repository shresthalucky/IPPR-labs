close all;
clear variables;
clc;

img = imread('../images/leena.jpg');
img = rgb2gray(img);

figure;
subplot(1,3,1),imshow(img),title('Image');

robert_x_filter = [1 0; 0 -1];
robert_y_filter = [0 1; -1 0];

out_x = apply_filter(img, robert_x_filter);
out_y = apply_filter(img, robert_y_filter);

subplot(1,3,2),imshow(out_x),title('Robert X');
subplot(1,3,3),imshow(out_y),title('Robert Y');