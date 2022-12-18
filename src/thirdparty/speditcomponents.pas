{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit speditcomponents;

{$warn 5023 off : no warning about unused units}
interface

uses
  FamesView, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('FamesView', @FamesView.Register);
end;

initialization
  RegisterPackage('speditcomponents', @Register);
end.
