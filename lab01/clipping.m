% Title: Clipping and Thresholding

close all;
clear variables;
clc;

img = imread('../images/leena.jpg');
img = rgb2gray(img);

fig2 = figure;
subplot(2, 1, 1),imshow(img),title('Grayscale Image');

theta = 120; % threshold value
[height, width] = size(img);
threshold_img = zeros(height, width);

for i=1:height
    for j=1:width
        if(img(i,j) < theta)
            threshold_img(i,j) = 0;
        else
            threshold_img(i,j) = 1;
        end
    end
end

subplot(2, 1, 2),imshow(threshold_img),title('Clipped Image');