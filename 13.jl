using HorizonSideRobots
r = Robot("untitled.sit", animate=true) 

function chess!(r)
    v, g = levoniz(r, Sud, West)
    if mod(v, 2) == mod(g, 2)
        putmarker!(r)
    end
    zmeya(() -> isborder(r, Nord),r, Ost, Nord)
    levoniz(r, Sud, West)
    nmove!(r, Nord, v)
    nmove!(r, Ost, g)
end

function zmeya(st_cond, r, tec, osn)
    while !st_cond()
        stroka!(() -> isborder(r, tec), r, tec)
        if ismarker(r)
            move!(r, osn)
        else
            move!(r, osn)
            putmarker!(r)
        end
        tec = inverse(tec)
    end
    stroka!(() -> isborder(r, tec), r, tec)
end

function stroka!(st_cond, r, s)
    if !ismarker(r)
        move!(r, s)
        putmarker!(r)
    else
        f = 1
    end
    f = 0
    while !st_cond()
        move!(r, s)
        f = daornet(r, f)
    end
end

function daornet(r, f)
    if f == 1
        putmarker!(r)
        f = 0
    else
        f = 1
    end
    return f
end

function levoniz(r, side1, side2)
    n1 = numsteps_along!(() -> isborder(r, side1), r, side1)
    n2 = numsteps_along!(() -> isborder(r, side2), r, side2)
    return n1, n2
end

function numsteps_along!(st_cond, r, side)
    n = 0
    while !st_cond()
        move!(r, side)
        n += 1
    end
    return n
end

function inverse(s)
    return HorizonSide(mod(Int(s) + 2,4))
end

function nmove!(r, side, n)
    for i in 1:n
        move!(r, side)
    end
end

chess!(r)