{       ������p������ ��p⨭�� - ������� �㭪�� p�����p�     }
{$I fillgrid.inc}
{$I   sprite.inc}

Procedure Edit;

Var
  key             : Char;         {��� ������}
  gx1,gy1,gx2,gy2 : Integer;      {���p������ �p���� p��⪨}
  mx1,my1,mx2,my2 : Integer;      {���p������ �p���� ����}
  dx,dy           : Byte;         {�����p� ��p�p� � p��⪥}
  sx,sy           : Byte;         {�����p� ��p�p� � ����}
                                  {���p������ �窨 � ���� �}
  xVal,yVal       : Byte;         {��������� ��p�p�}
  check           : ByteBool;     {��p����祭�� ����� ����� � p��⪮�}

Begin
  SetWriteMode(XORPut);       {����� H�-���}
  gx1 := 1;                   {H�砫�� ���祭��}
  gx2 := 151;                 {�࠭�� ��⪨}
  gy1 := 20;
  gy2 := 160;
  mx1 := 151;
  my1 := 21;
  xVal := 1;                  {��������� ����� � �⪥}
  yVal := 1;                  {� �窨 � ���� ����� ࠬ��}
  Case GridSize of            {��p�������� ����⠡�}
       1:begin
         dx    := 10;
         dy    := 10;
         step := 14;                {ࠧ���� �祩�� ���⪨}
         step := 14;
         end;
       2:begin
         dx    := 20;
         dy    := 20;
         step := 7;                {ࠧ���� �祩�� ���⪨}
         step := 7;
         end;
   end;           {case}
  check := false;             { false ᮮ⢥����� ��⨢��� ���⪥}
  SetColor(Cyan);
  Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {����� � ����}
  Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
  {����� � p��⪥}
  {���� ।���஢����}
  While true do begin
        key := ReadKey;   {��।��塞 ������� �������}
        if (key=#0) and keypressed then key := ReadKey;
{1}    case check of    {�롮� ��⨢���� ���� ��� ���⪨}
             false:begin            {����⪠}
  {2}       case key of
             #9:check := not check; {<Tab> - ���室�� � ���� �ࠩ�}
             #13:begin         {<Enter>-�窠 䮭��� 梥⮬}
                   SetFillStyle(SolidFill,SecColor);
                   Bar(gx1+step*(xVal-1)+3,gy1+step*(yVal-1)+2,gx1+step*xVal-1,gy1+step*yVal-1);
                   PutPixel(mx1+xVal,my1+yVal,SecColor);
                   Saved := False;
                 end;
             #27:begin         {<Esc>-�맮� ����}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {����� � ����}
                   xVal := 0;
                   yVal := 0;
                   SetColor(White);
                   SetWriteMode(NormalPut);
                   Exit;
                 end;
             #32:begin         {<�஡��>-�窠 ������ 梥⮬}
                   SetFillStyle(SolidFill,PrimColor);
                   Bar(gx1+step*(xVal-1)+3,gy1+step*(yVal-1)+2,gx1+step*xVal-1,gy1+step*yVal-1);
                   PutPixel(mx1+xVal,my1+yVal,PrimColor);
                   Saved := false;
                 end;
             #72:begin          {<^>-��।������ ࠬ�� �����}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   if yVal = 1 then yVal := dy else dec(yVal);
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                 end;
             #80:begin          {<v>-����}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   if yVal = dy then yVal := 1 else inc(yVal);
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                 end;
             #75:begin          {< <- >�����}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   if xVal = 1 then xVal := dx else dec(xVal);
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                 end;
             #77:begin          {< -> >-��ࠢ�}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   if xVal = dx then xVal := 1 else inc(xVal);
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                 end;
 {2}         end;   {Case }
           end;
 {3}     true:begin        {���� �ࠩ�}
                case key of
             #9:begin
                check := not check; {<Tab> - ���室�� � ���� �ࠩ�/�����}
                end;
             #27:begin         {<Esc>-�맮� ����}
                   Rectangle(gx1+step*(xVal-1),gy1+step*(yVal-1),gx1+step*xVal,gy1+step*yVal);
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {����� � ����}
                   xVal := 0;
                   yVal := 0;
                   SetColor(White);
                   SetWriteMode(NormalPut);
                   Exit;
                 end;
             #72:begin          {<^>-��।������ ࠬ�� �����}
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {����� � ����}
                   if my1 > (gy1+1) then dec(my1);
                   Case GridSize of
                   1:Getsprite1(mx1+1,my1+1,tile1);
                   2:Getsprite2(mx1+1,my1+1,tile2);
                   end;
                   FillGrid;
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {����� � ����}
                 end;
             #80:begin          {<v>-����}
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {����� � ����}
                   if (my1+step) < (getmaxx-1) then inc(my1);
                   Case GridSize of
                   1:Getsprite1(mx1+1,my1+1,tile1);
                   2:Getsprite2(mx1+1,my1+1,tile2);
                   end;
                   FillGrid;
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {����� � ����}
                 end;
             #75:begin          {< <- >�����}
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {����� � ����}
                   if mx1 > 151 then dec(mx1);
                   Case GridSize of
                   1:Getsprite1(mx1+1,my1+1,tile1);
                   2:Getsprite2(mx1+1,my1+1,tile2);
                   end;
                   FillGrid;
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {����� � ����}
                 end;
             #77:begin          {< -> >-��ࠢ�}
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {����� � ����}
                   if (mx1+step) < (getmaxx-1) then inc(mx1);
                   Case GridSize of
                   1:Getsprite1(mx1+1,my1+1,tile1);
                   2:Getsprite2(mx1+1,my1+1,tile2);
                   end;
                   FillGrid;
                   Rectangle(mx1,my1,mx1+(140 div step)+1,my1+(140 div step)+1); {����� � ����}
                 end;
  {3}          end;   {Case }
             end;
{1}        end;
          end;       {While}
      ClearGrid;
End;
