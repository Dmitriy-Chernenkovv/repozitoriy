using HorizonSideRobots
r = Robot("untitled.sit", animate=true)
function dvaperi!(r)
    ver, gor = v_ugol_schet!(r, Sud, West)
    per!(r)
    poisk!(r)
    obv!(r)
    v_ugol_schet!(r, Sud, West)
    obr!(r, ver, Nord, gor, Ost)
end

function obv!(r)
    for i in [Ost, Nord, West, Sud, Ost]
        putmarker!(r)
        k = HorizonSide(mod(Int(i) - 1, 4))
        while isborder(r, i)
            move!(r, k)
            putmarker!(r)
        end
        move!(r, i)
    end
end 

function per!(r)
    for i in [Nord, Ost, Sud, West]
        while isborder(r, i) == false
            move!(r, i)
            putmarker!(r)
        end
    end
end

function v_ugol_schet!(r, side1, side2)
    n1 = 0
    n2 = 0
    while isborder(r, side1) == 0 || isborder(r, side2) == 0
        if isborder(r, side2) == 0
            move!(r, side2)
            n2 += 1
        end
        if isborder(r, side1) == 0
            move!(r, side1)
            n1 += 1
        end
    end
    return n1, n2
end

function poisk!(r)
    s = Nord
    while isborder(r, Ost) == 0 
        while isborder(r, s) == 0
            move!(r, s)
            if isborder(r, Ost) == 1
                break
            end
        end
        if isborder(r, Ost) == 0
            s = HorizonSide(mod(Int(s)+ 2, 4))
            move!(r, Ost)
        else
            break
        end
    end
end

function obr!(r, n1, side1, n2, side2)
    f = 0
    nmove!(r, side1, n1)
    for i in 1:n2
        if ! isborder(r, side2)
            move!(r, side2)
        else
            f = 1
            break
        end
    end
    if f == 1
        v_ugol_schet!(r, HorizonSide(mod(Int(side1)+ 2, 4)), HorizonSide(mod(Int(side2)+ 2, 4)))
        nmove!(r, side2, n2)
        nmove!(r, side1, n1)
    end
end

function nmove!(r, side, n)
    for i in 1:n
        move!(r, side)
    end
end

dvaperi!(r)