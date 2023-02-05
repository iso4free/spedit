unit lazspedit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, JvMovableBevel, mbColorPalette, HexaColorPicker;

procedure Register;

implementation

 procedure Register;
begin
  RegisterComponents('SPEDit',[TJvMovableBevel,TJvMovablePanel, TmbColorPalette, THexaColorPicker]);
end;

 {$IFDEF FPC}
 initialization
   {$I lazspedit.lrs}
 {$ENDIF}

end.

