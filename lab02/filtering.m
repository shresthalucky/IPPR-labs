close all;
clear variables;
clc;

img = imread('../images/leena.jpg');
img = rgb2gray(img);
img = imnoise(img, 'salt & pepper', 0.05);

figure;
subplot(1,4,1),imshow(img),title('Noise Image');

[height, width] = size(img);

kernel_size = 3;
mid = ceil(kernel_size / 2);
pad_size = kernel_size - mid;

img = padarray(img, [pad_size, pad_size], 'replicate');

mean_out = zeros(height, width);
mode_out = zeros(height, width);
median_out = zeros(height, width);

for i = mid : height + pad_size
    for j = mid : width + pad_size
        roi = img(i-pad_size : i+pad_size, j-pad_size : j+pad_size);

        mean_out(i-pad_size, j-pad_size) = mean(roi(:));
        mode_out(i-pad_size, j-pad_size) = mode(roi(:));
        median_out(i-pad_size, j-pad_size) = median(roi(:));
    end
end

mean_out = uint8(mean_out);
mode_out = uint8(mode_out);
median_out = uint8(median_out);

subplot(1,4,2),imshow(mean_out),title('Average Filter');
subplot(1,4,3),imshow(mode_out),title('Mode Filter');
subplot(1,4,4),imshow(median_out),title('Median Filter');

% op1 = padarray(img, [pad_size, pad_size], 'replicate');
% 
% for i=1:height
%     for j=1:width
%         xmin = max(1, i-1);
%         xmax = min(height, i+1);
%         ymin = max(j-1, 1);
%         ymax = min(j+1, w);
%         
%         temp = img(xmin:xmax, ymin:ymax);
%         op1(i,j) = mean(temp(:));
%         op2(i,j) = median(temp(:));
%         op3(i,j) = mode(temp(:));
%     end
% end
% 
% 
