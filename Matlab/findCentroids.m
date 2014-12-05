function [centroids, size] = findCentroids(image, lower, upper, num, show)

[cc,size,points] = mybwlabel(image, lower, upper, num);

% Find centroids of the large circles
s = regionprops(cc, 'centroid');
centroids = cat(1, s.Centroid);

% Show centroids of objects within lower and upper bounds
if show > 0
    figure(show)
    imshow(cc)
    hold on
    plot(centroids(:,1), centroids(:,2), 'r*') %(in red)
    hold off
end
end