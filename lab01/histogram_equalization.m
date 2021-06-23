% Title: Histogram Equalization

close all;
clear variables;
clc;

img = imread('../images/leena.jpg');
img = rgb2gray(img);

% img = img + 100;
% % img = img - 100;
% 
% out = histeq(img);
% 
% figure;
% subplot(2,2,1),imshow(img);
% subplot(2,2,2),imhist(img);
% subplot(2,2,3),imshow(out);
% subplot(2,2,4),imhist(out);

[height, width] = size(img);
img = double(img);

hist1 = zeros(1,256);

for i=1:height
    for j=1:width
        hist1(img(i,j)+1) = hist1(img(i,j)+1) + 1;
%         for k=0:255
%             if img(i,j) == k
%                 hist1(k+1) = hist1(k+1) + 1;
%             end
%         end
    end
end

figure;
subplot(2,2,1),imshow(uint8(img));
subplot(2,2,2),plot(hist1);


pdf = hist1*(1/(height*width));

cdf = zeros(1, 256);

cdf(1) = pdf(1);

for i=2:256
    cdf(i) = cdf(i-1) + pdf(i);
end

cdf = round(cdf*255);
equalized_image = zeros(height, width);

for i=1:height
    for j=1:width
        t = img(i,j) + 1;
        equalized_image(i,j) = cdf(t);
    end
end

hist2 = zeros(1,256);

for i=1:height
    for j=1:width
        hist2(equalized_image(i,j)+1) = hist2(equalized_image(i,j)+1) + 1;
%         for k=0:255
%             if equal(i,j) == k
%                 hist2(k+1) = hist2(k+1) + 1;
%             end
%         end
    end
end

subplot(2,2,3),imshow(equalized_image/255);
subplot(2,2,4),plot(hist2);