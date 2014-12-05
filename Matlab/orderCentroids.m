function orderedC = orderCentroids(c, p)

%Point a distances
A(1) = sqrt((c(1) - p(1))^2 + (c(5) - p(5))^2);
A(2) = sqrt((c(1) - p(2))^2 + (c(5) - p(6))^2); 
A(3) = sqrt((c(1) - p(3))^2 + (c(5) - p(7))^2);
A(4) = sqrt((c(1) - p(4))^2 + (c(5) - p(8))^2);

w = 1;
for i = 2 : 4
    if A(i) < A(w)
        w = i;
    end
end

if w == 1
    topleft = c([1 5]);
end
if w == 2
    topleft = c([2 6]);
end
if w == 3
    topleft = c([3 7]);
end
if w == 4
    topleft = c([4 8]);
end
%Point b distances
B(1) = sqrt((c(2) - p(1))^2 + (c(6) - p(5))^2);
B(2) = sqrt((c(2) - p(2))^2 + (c(6) - p(6))^2);
B(3) = sqrt((c(2) - p(3))^2 + (c(6) - p(7))^2);
B(4) = sqrt((c(2) - p(4))^2 + (c(6) - p(8))^2);

w = 1;
for i = 2 : 4
    if B(i) < B(w)
        w = i;
    end
end
if w == 1
    topright = c([1 5]);
end
if w == 2
    topright = c([2 6]);
end
if w == 3
    topright = c([3 7]);
end
if w == 4
    topright = c([4 8]);
end
%Point c distances
C(1) = sqrt((c(3) - p(1))^2 + (c(7) - p(5))^2);
C(2) = sqrt((c(3) - p(2))^2 + (c(7) - p(6))^2);
C(3) = sqrt((c(3) - p(3))^2 + (c(7) - p(7))^2);
C(4) = sqrt((c(3) - p(4))^2 + (c(7) - p(8))^2);

w = 1;
for i = 2 : 4
    if C(i) < C(w)
        w = i;
    end
end

if w == 1
    bottomleft = c([1 5]);
end
if w == 2
    bottomleft = c([2 6]);
end
if w == 3
    bottomleft = c([3 7]);
end
if w == 4
    bottomleft = c([4 8]);
end
%Point d distances
D(1) = sqrt((c(4) - p(1))^2 + (c(8) - p(5))^2);
D(2) = sqrt((c(4) - p(2))^2 + (c(8) - p(6))^2);
D(3) = sqrt((c(4) - p(3))^2 + (c(8) - p(7))^2);
D(4) = sqrt((c(4) - p(4))^2 + (c(8) - p(8))^2);

w = 1;
for i = 2 : 4
    if D(i) < D(w)
        w = i;
    end
end
if w == 1
    bottomright = c([1 5]);
end
if w == 2
    bottomright = c([2 6]);
end
if w == 3
    bottomright = c([3 7]);
end
if w == 4
    bottomright = c([4 8]);
end

orderedC = ([topleft; topright; bottomleft; bottomright]);

end