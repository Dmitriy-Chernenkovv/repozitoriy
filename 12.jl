using HorizonSideRobots
r = Robot("untitled.sit";animate=true)
function levoniz(r)
    vniz,vlevo=0,0
    while !isborder(r,West)
        vlevo+=1
        move!(r,West)
    end
    while !isborder(r,Sud)
        vniz+=1
        move!(r,Sud)
    end
    return vniz,vlevo
end
function inverse!(side)
    if side==Ost
        side=West
    else
        side=Ost
    end
end
function schet(r)
    s=0
    side=Ost
    k=0
    vniz,vlev=levoniz(r)
    while !(isborder(r,side) && isborder(r,Nord))
        while !isborder(r,side)
            if s==0 && isborder(r,Nord)
                s=1
            elseif s==1 && !isborder(r,Nord)
                s=2
            elseif s==2 && isborder(r,Nord)
                s=1
            elseif s==2 && !isborder(r,Nord)
                k+=1
                s=0
            end
            move!(r,side)
        end
        if s==1 || s==2
            s=0
            k+=1
        end
        side=inverse!(side)
        move!(r,Nord)
        if isborder(r,Nord)
            break
        end
    end
    levoniz(r)
    for i in 1:vniz
        move!(r,Nord)
    end
    for i in 1:vlev
        move!(r,Ost)
    end
    return k
end
println(schet(r))
sleep(7)