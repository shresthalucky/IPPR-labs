% Title: Histogram Specification

close all;
clear variables;
clc;

% Histogram Equalization of source image

s_img = imread('../images/leena2.jpg');
s_img = rgb2gray(s_img);
s_img = double(s_img);

[s_height, s_width] = size(s_img);

s_hist = zeros(1,256);

for i=1:s_height
    for j=1:s_width
        s_hist(s_img(i,j)+1) = s_hist(s_img(i,j)+1) + 1;
    end
end

s_pdf = s_hist*(1/(s_height*s_width));
s_cdf = zeros(1, 256);
s_cdf(1) = s_pdf(1);

for i=2:256
    s_cdf(i) = s_cdf(i-1) + s_pdf(i);
end

s_cdf = round(s_cdf*255);


% Histogram Equalization of target image

t_img = imread('../images/leena.jpg');
t_img = rgb2gray(t_img);
t_img = double(t_img);

[t_height, t_width] = size(t_img);

t_hist = zeros(1,256);

for i=1:t_height
    for j=1:t_width
        t_hist(t_img(i,j)+1) = t_hist(t_img(i,j)+1) + 1;
    end
end

t_pdf = t_hist*(1/(t_height*t_width));
t_cdf = zeros(1, 256);
t_cdf(1) = t_pdf(1);

for i=2:256
    t_cdf(i) = t_cdf(i-1) + t_pdf(i);
end

t_cdf = round(t_cdf*255);


% Mapping cdf for final image

f_cdf = zeros(1, 256);

for s=1:256
    for t=1:256
        if (s_cdf(s) <= t_cdf(t))
            f_cdf(s) = t - 1;
            break;
        end
    end
end

% Building final image

f_img = zeros(s_height, s_width);

for i=1:s_height
    for j=1:s_width
        t = s_img(i,j) + 1;
        f_img(i,j) = f_cdf(t);
    end
end

s_img = uint8(s_img);
t_img = uint8(t_img);
f_img = uint8(f_img);

figure;
subplot(3,2,1),imshow(s_img),title('Source Image');
subplot(3,2,2),imhist(s_img);
subplot(3,2,3),imshow(t_img),title('Target Image');
subplot(3,2,4),imhist(t_img);
subplot(3,2,5),imshow(f_img),title('Final Image');
subplot(3,2,6),imhist(f_img);