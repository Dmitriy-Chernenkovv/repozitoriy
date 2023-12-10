using HorizonSideRobots
r = Robot("untitled.sit",animate=true)
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))

function spiral(stop_condition::Function,r::Robot)
    k = 1
    sideX = Nord
    sideY = Ost
    while 1>0
        if move_by_marker(r,sideX,sideY,k,stop_condition)
            break
        end
        sideX = inverse(sideX)
        sideY = inverse(sideY)
        k +=1
    end
end
function move_by_marker(r::Robot,sideX::HorizonSide,sideY::HorizonSide,k::Int,stop_condition::Function)
    if stop_condition(r)
        return true
    else    
        for j in 1:k
            if !stop_condition(r)
                move!(r,sideY)
            else
                return true
            end
        end
        for j in 1:k
            if !stop_condition(r)
                move!(r,sideX)
            else
                return true
            end
        end
        return false
    end
end
spiral(ismarker,r)