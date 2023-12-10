using HorizonSideRobots
r = Robot("untitled.sit",animate = true )
function mark_all(r::Robot)
    ver, hor = move_to_angle(r)
    snake_and_mark(r,Ost)
    move_to_angle(r)
    back_to_the_origins(r,ver,hor)
end
function move_to_angle(r::Robot)
    ver = 0
    hor = 0
    while !isborder(r,Sud)
        move!(r,Sud)
        ver +=1 
    end
    while !isborder(r,West)
        move!(r,West)
        hor +=1 
    end
    return ver,hor
end
function snake_and_mark(r::Robot,side::HorizonSide)
    while 1 > 0
        along_and_mark(r,side)
        if isborder(r,Nord) == false
            move!(r,Nord)
            side = inverse(side)
        else
            break
        end
    end
end
function along_and_mark(r::Robot,side::HorizonSide)
    while !isborder(r,side)
        putmarker!(r)
        move!(r,side)
    end
    putmarker!(r)
end
function back_to_the_origins(r::Robot,ver::Int,hor::Int)
    for i in 1:ver
        move!(r,Nord)
    end
    for i in 1:hor
        move!(r,Ost)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))
mark_all(r)