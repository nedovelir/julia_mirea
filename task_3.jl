function mark_everything!(r::Robot)

    first = go_to_point!(r,West) #Робот двигается до западной границы
    second = go_to_point!(r,Sud) #Робот двигается южной границы
    
    side = Nord  #Установка направления движения
    mark_line!(r,side)
    while isborder(r,Ost) == false
        move!(r,Ost)
        side = inverse(side)
        mark_line!(r,side)
    end
   
    back_to_point!(r)

    go_to_point!(r,Nord,second) 
    go_to_point!(r,Ost,first) #Возвращение в исходную точку

end

     
function go_to_point!(r::Robot,side::HorizonSide) #Запоминает кол-во шагов
    steps=0
    while isborder(r,side) == false
         move!(r,side)
         steps=steps+1
    end
    return steps #Возвращает кол-во шагов
end



function back_to_point!(r::Robot) #Возвращение в левый нижний угол
    while isborder(r,West)==false
        move!(r,West) 
    end
    while isborder(r,Sud)==false
        move!(r,Sud)
    end        
end



function go_to_point!(r::Robot,side::HorizonSide,steps::Int) #Возвращается кол-во шагов
    for a in (1:steps)
        move!(r,side) 
     end
end

function putmarkers!(r::Robot,side::HorizonSide)  #робот ставит маркеры, пока не будет стены
    while isborder(r,side)==false 
        move!(r,side)
        putmarker!(r)
    end
end   

function mark_line!(r::Robot,side::HorizonSide) #проставляет маркеры по линии 
    putmarker!(r)
    putmarkers!(r,side)
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))  #Изменение направления (на протовоположное)