using HorizonSideRobots
r = Robot("untitled.sit", animate = true)

function reverse!(side)
    if side==Sud
        side=Nord
    elseif side==Nord
        side=Sud
    elseif side==West
        side=Ost
    else
        side=West
    end
end

function galyavozvrat!(r,side,side2,k)
    while k>0
        move!(r,reverse!(side))
        move!(r,reverse!(side2))
        k-=1
    end
end

function krest!(r,side)
    n=0
    while !isborder(r,side) & !isborder(r,Ost)
        move!(r,side)
        move!(r,Ost)
        putmarker!(r)
        n+=1
    
    end
    galyavozvrat!(r,side,Ost,n)
    n=0
    while !isborder(r,side) & !isborder(r,West)
        move!(r,side)
        move!(r,West)
        putmarker!(r)
        n+=1
    
    end
    galyavozvrat!(r,side,West,n)



end
function main!(r)
    putmarker!(r)
    krest!(r,Sud)
    krest!(r,Nord)


end

main!(r)


sleep(5)
