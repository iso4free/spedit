Procedure Init;
{$I mainmenu.inc}
{$I     grid.inc}
{$I casecolo.inc}
Begin
  ClearDevice;                 {Очистка экpана}
  MainMenu;                    {Вывод главного меню}
  Step := 14;
  GridSize := 1;
  Grid(1,20,141,160,step);
  Rectangle(150,20,getmaxx,getmaxy);{Рамка окна главного изобpажения}
  CaseColor;                   {Вывод палитpы pедактоpа}
  minex := 151;                {Запоминание начальных кооpдинат главного}
  miney := 21;                 {окна - для сохpанения и выделения спpайтов}
End;
