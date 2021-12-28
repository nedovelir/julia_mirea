using HorizonSideRobots

function find_way(r)
    n=0 
    side=Ost
    while isborder(r, Nord) == true
        n+=1
        moveNum!(r,side,n)
        side=inverse(side)
    end
end

function moveNum!(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r, side)
    end
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))