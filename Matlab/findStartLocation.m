function [start, finish] = findStartLocation(cc, smallCentroids, world)

if world == 1
    y = 240;
elseif world == 2
    y = 120;
end


locations = [1,2];

    if cc(2) < y          %If y value of robot centroid is in top half
        locations(2) = 0;   %Remove start point 2 from locations
        finish = smallCentroids([2 4]);
    else                    %Else robot is in bottom half
        locations(1) = 0;   %Remove start point 1 from locations
        finish = smallCentroids([1 3]);
    end
    
    start = max(locations)  %Start is the remaining location
end