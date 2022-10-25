{       Редактиpование каpтинки - главная функция pедактоpа     }
{$I fillgrid.inc}
{$I   sprite.inc}

Procedure Edit;

Var
  key             : Char;         {Код клавиши}
  gx1,gy1,gx2,gy2 : Integer;      {Кооpдинаты гpаниц pешетки}
  mx1,my1,mx2,my2 : Integer;      {Кооpдинаты гpаниц окна}
  dx,dy           : Byte;         {Размеpы куpсоpа в pешетке}
  sx,sy           : Byte;         {Размеpы куpсоpа в окне}
                                  {Кооpдинаты точки в окне и}
  xVal,yVal       : Byte;         {Положение куpсоpа}
  check           : ByteBool;     {Пеpеключение между окном и pешеткой}

Begin
  SetWriteMode(XORPut);       {Режим HЕ-ИЛИ}
  gx1 := 1;                   {Hачальные значения}
  gx2 := 151;                 {границ решетки}
  gy1 := 20;
  gy2 := 160;
  mx1 := 151;
  my1 := 21;
  xVal := 1;                  {положение курсора в сетке}
  yVal := 1;                  {и точки в окне внутри рамки}
  Case GridSize of            {Опpеделение масштаба}
       1:begin
         dx    := 10;
         dy    := 10;
         step := 14;                {размеры ячейки решётки}
         step := 14;
         end;
       2:begin
         dx    := 20;
         dy    := 20;
         step := 7;                {размеры ячейки решётки}
         step := 7;
         end;
   end;           {case}
  check := false;             { false соответствует активной решётке}
  SetColor(Cyan);
  Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {Рамка в окне}
  Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
  {Рамка в pешетке}
  {Цикл редактирования}
  While true do begin
        key := ReadKey;   {Определяем нажатую клавишу}
        if (key=#0) and keypressed then key := ReadKey;
{1}    case check of    {Выбор активного окна или решётки}
             false:begin            {Решётка}
  {2}       case key of
             #9:check := not check; {<Tab> - переходим в окно спрайта}
             #13:begin         {<Enter>-точка фоновым цветом}
                   SetFillStyle(SolidFill,SecColor);
                   Bar(gx1+step*(xVal-1)+3,gy1+step*(yVal-1)+2,gx1+step*xVal-1,gy1+step*yVal-1);
                   PutPixel(mx1+xVal,my1+yVal,SecColor);
                   Saved := False;
                 end;
             #27:begin         {<Esc>-вызов меню}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {Рамка в окне}
                   xVal := 0;
                   yVal := 0;
                   SetColor(White);
                   SetWriteMode(NormalPut);
                   Exit;
                 end;
             #32:begin         {<Пробел>-точка главным цветом}
                   SetFillStyle(SolidFill,PrimColor);
                   Bar(gx1+step*(xVal-1)+3,gy1+step*(yVal-1)+2,gx1+step*xVal-1,gy1+step*yVal-1);
                   PutPixel(mx1+xVal,my1+yVal,PrimColor);
                   Saved := false;
                 end;
             #72:begin          {<^>-передвигаем рамку вверх}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   if yVal = 1 then yVal := dy else dec(yVal);
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                 end;
             #80:begin          {<v>-вниз}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   if yVal = dy then yVal := 1 else inc(yVal);
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                 end;
             #75:begin          {< <- >влево}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   if xVal = 1 then xVal := dx else dec(xVal);
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                 end;
             #77:begin          {< -> >-вправо}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   if xVal = dx then xVal := 1 else inc(xVal);
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                 end;
 {2}         end;   {Case }
           end;
 {3}     true:begin        {Окно спрайта}
                case key of
             #9:begin
                check := not check; {<Tab> - переходим в окно спрайта/решётку}
                end;
             #27:begin         {<Esc>-вызов меню}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {Рамка в окне}
                   xVal := 0;
                   yVal := 0;
                   SetColor(White);
                   SetWriteMode(NormalPut);
                   Exit;
                 end;
             #72:begin          {<^>-передвигаем рамку вверх}
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {Рамка в окне}
                   if my1 > (gy1+1) then dec(my1);
                   Case GridSize of
                   1:Getsprite1(mx1+1,my1+1,tile1);
                   2:Getsprite2(mx1+1,my1+1,tile2);
                   end;
                   FillGrid;
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {Рамка в окне}
                 end;
             #80:begin          {<v>-вниз}
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {Рамка в окне}
                   if (my1+step) < (getmaxx-1) then inc(my1);
                   Case GridSize of
                   1:Getsprite1(mx1+1,my1+1,tile1);
                   2:Getsprite2(mx1+1,my1+1,tile2);
                   end;
                   FillGrid;
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {Рамка в окне}
                 end;
             #75:begin          {< <- >влево}
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {Рамка в окне}
                   if mx1 > 151 then dec(mx1);
                   Case GridSize of
                   1:Getsprite1(mx1+1,my1+1,tile1);
                   2:Getsprite2(mx1+1,my1+1,tile2);
                   end;
                   FillGrid;
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {Рамка в окне}
                 end;
             #77:begin          {< -> >-вправо}
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {Рамка в окне}
                   if (mx1+step) < (getmaxx-1) then inc(mx1);
                   Case GridSize of
                   1:Getsprite1(mx1+1,my1+1,tile1);
                   2:Getsprite2(mx1+1,my1+1,tile2);
                   end;
                   FillGrid;
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {Рамка в окне}
                 end;
  {3}          end;   {Case }
             end;
{1}        end;
          end;       {While}
      ClearGrid;
End;
