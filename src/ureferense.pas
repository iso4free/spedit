unit ureferense;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtDlgs, ExtCtrls;

type

  { TfrmReferense }

  TfrmReferense = class(TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    ReferenceImage: TImage;
    procedure FormClick(Sender: TObject);
  private

  public

  end;

var
  frmReferense: TfrmReferense;

implementation

{$R *.frm}

{ TfrmReferense }

procedure TfrmReferense.FormClick(Sender: TObject);
begin
    if OpenPictureDialog1.Execute then begin
   ReferenceImage.Picture.Clear;
   ReferenceImage.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

end.

