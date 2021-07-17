function out_img = apply_filter(img, filter)
%     img = rgb2gray(img);
    [height, width] = size(img);
    img = double(img);
    
    [kernel_size, ~] = size(filter);
    mid = ceil(kernel_size / 2);
    pad_size = kernel_size - mid;
    
    out_img = zeros(height-pad_size, width-pad_size);
    
    for i = mid : height - pad_size
        for j = mid : width - pad_size
            
%             for k=1:kernel_size
%                 for l=1:kernel_size
%                     sum = sum + img(i-mid+k, j-mid+l) * filter(k,l);
%                 end
%             end
            
            k = i-mid+1;
            l = j-mid+1;
            v = img(k:i+pad_size, l:j+pad_size) .* filter;
            v = sum(v(:));
            out_img(i-mid+1, j-mid+1) = v;
        end
    end
    
    out_img = uint8(out_img);
end
