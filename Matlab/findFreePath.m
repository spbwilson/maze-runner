function freepath = findFreePath(cc, world)

if world == 1
    a = 273;
    b = 153;
    c = 416;
    d = 296;
    e = 558;
    f = 428;

elseif world == 2
    a = 136;
    b = 76;
    c = 208;
    d = 143;
    e = 279;
    f = 214;
end

routes = [1,2,3];                       %Route 1 is closest to start points

    if (cc(1) < a) && (cc(1) > b)   %If block 1 is in route 1..
        routes(1) = 0;                  %Remove this route
    end
    
    if (cc(2) < a) && (cc(2) > b)   %If block 2 is in route 1..
        routes(1) = 0;                  %Remove this route
    end
    
    if (cc(1) < c) && (cc(1) > d)   %If block 1 is in route 2..
        routes(2) = 0;                  %remove this route
    end
    
    if (cc(2) < c) && (cc(2) > d)   %If block 2 is in route 2..
        routes(2) = 0;                  %Remove this route
    end
    
    if (cc(1) < e) && (cc(1) > f)   %If block 1 is in route 3..
        routes(3) = 0;                  %Remove this route
    end
    
    if (cc(2) < e) && (cc(2) > f)   %If block 2 is in route 3..
        routes(3) = 0;                  %Remove this route
    end
    
    freepath = max(routes)             %Free path is remaining route
    
end
    