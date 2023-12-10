using HorizonSideRobots
r = Robot("untitled.sit", animate = true)
function vse(r)
    ver,hor = poehali!(r)
    poehali!(r)
    risuy(r)
    back_to_the_origins(r,ver,hor)
end

function poehali!(r::Robot)
    niz = 0
    levo = 0
    while !isborder(r,Sud)
        move!(r,Sud)
        niz +=  1
    end
    while !isborder(r,West)
        move!(r,West)
        levo += 1
    end
    return niz,levo
end


function risuy(r::Robot)
    for side in (Nord, Ost, Sud, West)
        while !isborder(r,side)
            move!(r,side)
            putmarker!(r)
        end
    end
end
function back_to_the_origins(r::Robot,ver::Int,hor::Int)
    for i in 1:ver
        move!(r,Nord)
    end
    for i in 1:hor
        move!(r,Ost)
    end
end
vse(r)
sleep(10)l