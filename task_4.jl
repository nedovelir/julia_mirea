function pyramide(r::Robot)
    move_angle_left!(r)
    x = moves!(r, Ost)
    y = moves!(r,Nord)
    move_angle_left!(r)
    j=x
        for i in 0:y
            while j-i != 0
                putmarker!(r)
                move!(r,Ost)
                j-=1
            end
            putmarker!(r)
            j=x
            back(r)
            if(isborder(r,Nord)==false)
            move!(r,Nord)
            end
        end
end

function move_angle_left!(r::Robot) #перемещает в левый нижний угол
    for side in (Sud, West)
        while isborder(r, side) == false
            move!(r, side)
        end
    end
end

function moves!(r::Robot,side::HorizonSide) #определяет (возвращает) кол-во шагов в определённом направлении
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end

function back(r::Robot) #Возвращает робота в левую часть чтобы начать закрашивать следующую строку
    while isborder(r,West) == false
        move!(r,West)
    end
end