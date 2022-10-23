unit udrawtools;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons, uglobals, udraw;

type

  { TfrmDrawTools }

  TfrmDrawTools = class(TForm)
    DrawToolsFlowPanel: TFlowPanel;
    FlowPanel1: TFlowPanel;
    sbEracer: TSpeedButton;
    sbPen: TSpeedButton;
    sbPipette: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDrawTool: PSPDrawTool;
    procedure SetDrawTool(AValue: PSPDrawTool);
  public
    property DrawTool : PSPDrawTool read FDrawTool write SetDrawTool ;
  end;

var
  frmDrawTools: TfrmDrawTools;

implementation
 uses umain;
 {$R *.frm}

 { TfrmDrawTools }

 procedure TfrmDrawTools.FormCreate(Sender: TObject);
 begin
   //cTODO: reate draw tools

 end;

procedure TfrmDrawTools.FormDestroy(Sender: TObject);
begin
  //todo: free memory
end;

procedure TfrmDrawTools.SetDrawTool(AValue: PSPDrawTool);
begin
  if FDrawTool=AValue then Exit;
  FDrawTool:=AValue;
end;

end.

