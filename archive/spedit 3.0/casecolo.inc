{       �뢮��� �����p� ��� �롮p� 梥�        }
Procedure CaseColor;
Var
  i : Integer;
Begin
  SetLineStyle(0,0,3);
  For i := 0 to GetMaxColor do begin   {16 ����p���� 横��}
      SetColor(i);      {ᯫ�譠� ������� i-�� 梥⮬}
      Line(3,165+i*2,138,165+i*2);{���p�襭� �pאַ㣮�쭨�}
  end;
  SetLineStyle(0,0,1);
End;
