function find_passage(r)
    side=Ost
    while isborder(r,Nord)==true #пока сверху нет пути
        putmarker!(r) #ставим маркер
        move_by_markers!(r,side) #идем по "side"
        side=inverse(side) #изменяем направление
    end #если цикл закончился, то значит мы пришли к пункиту назначения - к такой точке, что сверху нет перегородки :)
end

move_by_markers!(r,side) = while ismarker(r) move!(r,side) end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))