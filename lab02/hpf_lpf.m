close all;
clear variables;
clc;

img = imread('../images/leena.jpg');
img = rgb2gray(img);

figure;
subplot(1,3,1),imshow(img),title('Original Image');

[height, width] = size(img);

kernel_size = 15;
mid = ceil(kernel_size / 2);
pad_size = kernel_size - mid;

img = padarray(img, [pad_size, pad_size], 'replicate');
img = double(img);

lpf =  ones(kernel_size)/(kernel_size^2);

lpf_out = zeros(height, width);

for i = mid : height + pad_size
    for j = mid : width + pad_size
        sum = 0;
        for k=1:kernel_size
            for l=1:kernel_size
                sum = sum + img(i-mid+k, j-mid+l) * lpf(k,l);
            end
        end
        lpf_out(i-pad_size, j-pad_size) = sum;
    end
end

lpf_out = uint8(lpf_out);
subplot(1,3,2),imshow(uint8(lpf_out)),title('Low Pass Filter');

hpf =  -lpf;
hpf(mid, mid) = (kernel_size^2-1)/(kernel_size^2);

hpf_out = zeros(height, width);

for i = mid : height + pad_size
    for j = mid : width + pad_size
        sum = 0;
        for k=1:kernel_size
            for l=1:kernel_size
                sum = sum + img(i-mid+k, j-mid+l) * hpf(k,l);
            end
        end
        hpf_out(i-pad_size, j-pad_size) = sum;
    end
end

hpf_out = uint8(hpf_out);
subplot(1,3,3),imshow(hpf_out),title('High Pass Filter');
