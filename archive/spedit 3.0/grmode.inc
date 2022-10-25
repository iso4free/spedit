procedure GrMode;
var gd,
    gm,
    error       : Integer;
Begin
  //Detect video mode
  DetectGraph(gd,gm);
  InitGraph(gd,gm,'');
  error := GraphResult;
  if (error <> grOK) then begin         //Check on errors
   Writeln('Can''t set video mode. Press any key...');
   GraphErrorMsg(error);
   ReadKey;
   Halt(error);
  end;
  //Debug information
{  Writeln('X=',GetMaxX+1);
  Writeln('Y=',GetMaxY+1);
  Writeln('Colors: ',GetMaxColor);
  Writeln('Mode: ',GetModeName(gm));
  Writeln('Driver: ',GetDriverName);
  Readln;}
end;
