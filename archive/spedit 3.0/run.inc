{       �᭮���� �p�楤�p� p�����p� - �p������� �롮p       }
{       ��������  ���� � �맮� ��p����뢠�饩 �p�楤�p�       }
{$I  movebar.inc}
{$I mainmenu.inc}
{$I     edit.inc}
{$I filework.inc}
{$I setcolor.inc}
{$I     view.inc}
{$I editsize.inc}
{$I     done.inc}
Procedure Run;
Var
  mx : Word;
Begin
  MoveBarX(0,1,getmaxx,16,6,mx); {�롮p �㭪� ���� ���짮��⥫��}
  Case mx of            {�롮p ����⢨� � ����ᨬ��� �� �롮p� ���짮��⥫�}
  0:begin               {�⬥��:}
         MainMenu;      {�p�p�ᮢ�� �������� ���� � ����p�饭��}
         Edit;          {� p���� p�����p������}
    end;
  1:FileWork;           {����� � 䠩����}
  2:edit;               {������p}
  3:SetColors;          {�롮� ࠡ��� 梥⮢}
  4:view;               {�p�ᬮ�p}
  5:editsize;           {�롮p ����⠡� p�����p������}
  6:done;               {����p襭�� p����� � ��室}
  end;
End;
