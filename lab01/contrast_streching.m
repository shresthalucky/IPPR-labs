% Title: Contrast Streching

close all;
clear variables;
clc;

img = imread('../images/leena.jpg');
img = im2double(img);
img = rgb2gray(img);

s = img;
[height, width] = size(img);

r1 = [10 20];
r2 = [150 200];

x1 = r1(1);
y1 = r1(2);
x2 = r2(1);
y2 = r2(2);

m = y1 / x1;
m1 = (y2 - y1) / (x2 - x1);
m2 = (255 - y2) / (255 - x2);

c1 = y1 - m1*x1;
c2 = y2 - m2*x2;

for i=1:height
    for j=1:width
        if (img(i, j) < x1)
            s(i,j) = img(i,j)*m;
        else
            if (img(i,j) < x2)
                s(i,j) = img(i,j)*m1 + c1;
            else
                s(i,j) = img(i,j)*m2 + c2;
            end
        end
    end
end

figure;
subplot(1,2,1),imshow(img),title('Original Image');
subplot(1,2,2),imshow(s),title('Contrast Streched Image');