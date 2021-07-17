close all;
clear variables;
clc;

img = imread('../images/leena.jpg');
img = rgb2gray(img);

figure;
subplot(1,3,1),imshow(img),title('Image');

laplace_four_point = [0 -1 0; -1 4 -1; 0 -1 0];
laplace_eight_point = [-1 -1 -1; -1 8 -1; -1 -1 -1];

out_x = apply_filter(img, laplace_four_point);
out_y = apply_filter(img, laplace_eight_point);

subplot(1,3,2),imshow(out_x),title('Four Point Laplace');
subplot(1,3,3),imshow(out_y),title('Eight Point Laplace');

% out = imfilter(img, laplace_eight_point, 'conv');
% figure;
% imshow(out);