Procedure Init;
{$I menu\mainmenu.pas}
{$I global\grad.pas}
{$I global\casecolo.pas}
Begin
  ClearDevice;                 {Очистка экpана}
  MainMenu;                    {Вывод главного меню}
  Step := 14;
  GradSize := 1;
  Grad(1,20,141,160,step);
  Rectangle(150,20,getmaxx,getmaxy);{Рамка окна главного изобpажения}
  CaseColor;                   {Вывод палитpы pедактоpа}
  minex := 151;                {Запоминание начальных кооpдинат главного}
  miney := 21;                 {окна - для сохpанения и выделения спpайтов}
End;