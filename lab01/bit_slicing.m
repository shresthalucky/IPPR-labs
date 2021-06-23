% Title: Bit Slicing

close all;
clear variables;
clc;

img = imread('../images/leena.jpg');
img = rgb2gray(img);

id = double(img);
[height, width] = size(img);

c = zeros(height, width, 8);

for i=1:8
    c(:,:,i) = mod(id, 2);
    id = floor(id/2);
%     c(:,:,i) = bitget(id, i);
end

fig = figure;

for i=1:8
    subplot(3, 3, i), imshow(c(:, :, i)), title("bit " + i);
end

recon_img = zeros(height, width);

for i=8:-1:1
    recon_img = 2 * recon_img;
    recon_img = recon_img + c(:, :, i);
%     recon_img - bitset(recon, i, c(:, :, i));
end

recon_img = recon_img/255;
subplot(3, 3, 9), imshow(recon_img), title("reconstructed image");

% id = double(img);
% c0 = mod(id, 2);
% c1 = mod(floor(id/2), 2);
% c2 = mod(floor(id/4), 2);
% c3 = mod(floor(id/8), 2);
% c4 = mod(floor(id/16), 2);
% c5 = mod(floor(id/32), 2);
% c6 = mod(floor(id/64), 2);
% c7 = mod(floor(id/128), 2);
% figure;
% subplot(3, 3, 1), imshow(c0), title("Bit plane 1");
% subplot(3, 3, 2), imshow(c1), title("Bit plane 2");
% subplot(3, 3, 3), imshow(c2), title("Bit plane 3");
% subplot(3, 3, 4), imshow(c3), title("Bit plane 4");
% subplot(3, 3, 5), imshow(c4), title("Bit plane 5");
% subplot(3, 3, 6), imshow(c5), title("Bit plane 6");
% subplot(3, 3, 7), imshow(c6), title("Bit plane 7");
% subplot(3, 3, 8), imshow(c7), title("Bit plane 8");
% reconstructed_img = (2*(2*(2*(2*(2*(2*(2*(2*c7)+c6)+c5)+c4)+c3)+c2)+c1)+c0);
% subplot(3, 3, 9), imshow(reconstructed_img/255), title("Reconstructed Image");