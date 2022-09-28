//создание скроллеров первого урока
// ориентация (true=горизонтально), длина, X, Y, начальное значение от 0 до 10
scroll l1cam=new scroll(true,1,1,1,5);
scroll l1px=new scroll(false,1,1,1,8);
scroll l1py=new scroll(false,1,1,1,8);
scroll l1pz=new scroll(false,1,1,1,8);


//расстановка, еще надо разделять по урокам для оптимизации
void scrollSetL1()
{
  l1cam.scSet(sw*0.89,sw/2,height-sw/10);
  l1px.scSet((((sh-sw/10)/2)-sw/9)*2,sw/18 ,height-(sh-sw/10)/2-sw/10-sw/45);
  l1py.scSet((((sh-sw/10)/2)-sw/9)*2,sw/6.8,height-(sh-sw/10)/2-sw/10-sw/45);
  l1pz.scSet((((sh-sw/10)/2)-sw/9)*2,sw/4.2,height-(sh-sw/10)/2-sw/10-sw/45);
}

//рисовка скроллеров первого урока
void scrollDrawL1()
{
  l1cam.draw();
  l1px.draw();
  l1py.draw();
  l1pz.draw();
}

//вызов скроллеров
void scrollDragStartL1()
{
  l1cam.dragStart();
  l1px.dragStart();
  l1py.dragStart();
  l1pz.dragStart();
}

//остановка скроллеров при разжатии
void scrollDraggStopL1()
{
  l1cam.dragStop();
  l1px.dragStop();
  l1py.dragStop();
  l1pz.dragStop();
}
