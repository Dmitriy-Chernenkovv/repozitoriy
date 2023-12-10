using HorizonSideRobots
r = Robot("untitled.sit", animate=true) 
function shagay(r,side)
    if isborder(r,side)
        return 0
    else
        move!(r,side)
        return shagay(r,side)+1
    end 
end
function trymove(r,side,maximnum)
    if maximnum >0
        if isborder(r,side)
            return maximnum
        end
        move!(r,side)
        return trymove(r,side,maximnum-1)
    end
end
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))
function dvoynoe(r,side)
    odno = shagay(r,side)
    dva = trymove(r,inverse(side),2*odno)
    if dva ==0
        return true
    else
        trymove(r,side,odno-dva)
        return false
    end
end
dvoynoe(r,Nord)

