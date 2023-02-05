{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit spedit;

{$warn 5023 off : no warning about unused units}
interface

uses
  JvMovableBevel, ColorPalette, HexaColorPicker, lazspedit, mbColorPalette, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('lazspedit', @lazspedit.Register);
end;

initialization
  RegisterPackage('spedit', @Register);
end.
