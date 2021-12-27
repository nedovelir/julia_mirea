function perimetr!(r::Robot) #Проставление маркеров по периметру

    to_West = to_side!(r,West) 
    to_Sud = to_side!(r,Sud) 
        
        for side in (Nord,Ost,Sud,West)
            putmarkers!(r,side)
        end
        
    to_side!(r,Nord,to_Sud)
    to_side!(r,Ost,to_West) 
        
    end
           
    function to_side!(r::Robot,side::HorizonSide) 
        num_steps=0
        while isborder(r,side) == false
            move!(r,side)
            num_steps+=1
        end
        return num_steps #Возвращение кол-ва шагов необходимое до границы 
    end
    
    function to_side!(r::Robot,side::HorizonSide,num_steps::Int) #возвращаемся в исходную позицию
        for _ in (1:num_steps)
            move!(r,side)
        end
    end
    
    function putmarkers!(r::Robot, side::HorizonSide) #Проставление маркеров по ходу движения
        while isborder(r,side)==false
            move!(r,side)
            putmarker!(r)
        end
    end