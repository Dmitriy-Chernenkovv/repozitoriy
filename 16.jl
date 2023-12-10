using HorizonSideRobots
robot = Robot("untitled.sit",animate=true)
function main(robot)
    shuttle(isborder,robot,Ost)
end
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))
function shuttle(stop_condition::Function,robot,side)
    k = 1
    while stop_condition(robot,Nord)
        for i in 1:k
            if stop_condition(robot,Nord)
                move!(robot,side)
            else
                break
            end
        end
        k+=1
        side = inverse(side)
    end
end
main(robot)
sleep(10)