function smooth_hist = smooth(hist)

filter = fspecial('gaussian', [50 1], 6);
smooth_hist = conv(filter,hist);
end