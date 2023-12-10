using HorizonSideRobots
r = Robot("untitled.sit",animate = true)


function krest(r::Robot) 
    for side in (Nord,Sud,West,Ost)
        dvizhrobot(r,side)
        goback(r,inverse(side)) 
    end
    putmarker!(r)      
end

function goback(r::Robot,side::HorizonSide)
    while ismarker(r)
        move!(r,side)
    end
end
function dvizhrobot(r::Robot,side::HorizonSide)
    while !isborder(r,side)
        move!(r,side)
        putmarker!(r)
    end

end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))

krest(r)
sleep(2)