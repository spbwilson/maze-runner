function route = findRoute(freePath, startPoint)

a = [142 120];  % Start point 1
b = [213 113];  % } Top servo points
c = [356 113];  %
d = [498 113];  %

e = [213 240];  %
f = [356 240];  % } Middle servo points
g = [498 240];  %

h = [142 360];  % Start point 2
i = [213 367];  % } Bottom servo points
j = [356 367];  %
k = [498 367];  %


    if freePath == 1
        if startPoint == 1
            route = ([b; e; i; h]);           %Robot takes route 1
        else
            route = ([i; e; b; a]);           %Robot takes reverse route 1
        end
        
    elseif freePath == 2
        if startPoint == 1
            route = ([b; c; f; j; i; h]);     %Robot takes route 2
        else
            route = ([i; j; f; c; b; a]);     %Robot takes reverse route 2
        end
        
    elseif freePath == 3
        if startPoint == 1
            route = ([a; b; c; d; g; k; j; i; h]);   %Robot takes route 3
        else
            route = ([h; i; j; k; g; d; c; b; a]);   %Robot takes reverse route 3
        end
    end
end