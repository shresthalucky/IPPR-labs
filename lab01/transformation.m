% Title: Power and Log Transformation

close all;
clear variables;
clc;

img = imread('../images/leena.jpg');
img = im2double(img);
img = rgb2gray(img);

log_img = img;
power_img = img;

factor = 220;
[height, width] = size(img);

for i=1:height
    for j=1:width
        log_img(i,j) = factor*log(1+img(i,j));
        power_img(i,j) = factor*img(i,j)^(5);
    end
end

figure;
subplot(1,3,1),imshow(img),title('Original Image');
subplot(1,3,2),imshow(uint8(log_img)),title('Log Transformation');
subplot(1,3,3),imshow(uint8(power_img)),title('Power Transformation');