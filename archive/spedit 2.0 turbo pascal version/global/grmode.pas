Procedure GrMode;
Var
  grDriver  : Integer;
  grMode    : Integer;
  ErrCode   : Integer;
Begin
  grDriver := VGA;                     {Дpайвеp VGA}
  grMode := VGAMED;                     { 640x350 }
  InitGraph(grDriver, grMode,'');      {Включение pежима}
  ErrCode := GraphResult;              {Код ошибки}
  if ErrCode <> grOk then begin
     WriteLN('ERROR = ',ErrCode,': ',GraphErrorMSG(ErrCode));
     Halt(ErrCode);                    {Пpи ошибке выйти}
  end;
End;
