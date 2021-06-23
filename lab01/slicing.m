% Title: Slicing

close all;
clear variables;
clc;

img = imread('../images/leena.jpg');
img = rgb2gray(img);

figure;
subplot(1, 3, 1),imshow(img),title('Grayscale Image');

[height, width] = size(img);
slice_img1 = zeros(height, width);

a = 90;
b = 150;

for i=1:height
    for j=1:width
        if img(i,j) >= a && img(i,j) <= b
            slice_img1(i,j) = 255;
        else
            slice_img1(i,j) = 0;
        end
    end
end

subplot(1, 3, 2),imshow(slice_img1),title('no background preserved');


slice_img2 = img;

for i=1:height
    for j=1:width
        if img(i,j) >= a && img(i,j) <= b
            slice_img2(i,j) = 255;
        end
    end
end

subplot(1, 3, 3),imshow(slice_img2),title('background preserved');