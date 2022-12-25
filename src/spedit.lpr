program spedit;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  {$IFDEF DEBUG}
  LazLogger,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, umain, udraw, uglobals, uabout, ureferense,
  uframedlg
  { you can add units after this },
  sysutils, usettings, uresizedlg;

{$R *.res}

begin
  {$IFDEF DEBUG}
  if FileExists(ChangeFileExt(Application.ExeName,'.log')) then DeleteFile(ChangeFileExt(Application.ExeName,'.log'));
  DebugLogger.ParamForLogFileName:='--debug-log';
  {$ENDIF}
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.DoubleBuffered:=adbTrue;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmReferense, frmReferense);
  Application.CreateForm(TfrmFrameDlg, frmFrameDlg);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TfrmResize, frmResize);
  Application.Run;
end.

