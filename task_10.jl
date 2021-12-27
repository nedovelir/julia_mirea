function find_temp(::Robot)
    a = []
    sum = 0 
    side = Ost 
    while !isborder(r, Nord)
        movess!(r, side, a)
        if side == Ost
            side = West
        else
            side = Ost
        end
    end
    movess!(r, side, a)
    k = length(a)
    while length(a) > 0 
        sum += pop!(a)
    end
    println(sum/k)
  
  end
  
  
function movess!(::Robot, side, a)
    while !isborder(r, side)
        if ismarker(r)
            push!(a, temperature(r))
        end
        move!(r,side)
    end
    if !isborder(r, Nord)
        move!(r, Nord)
    end
end