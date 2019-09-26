object frmLayers: TfrmLayers
  Left = 307
  Height = 240
  Top = 146
  Width = 320
  BorderIcons = []
  BorderStyle = bsSizeToolWin
  Caption = 'Layers'
  ClientHeight = 240
  ClientWidth = 320
  FormStyle = fsMDIChild
  OnClose = FormClose
  LCLVersion = '6.9'
  object ExLayers32Panel1: TExLayers32Panel
    Left = 0
    Height = 150
    Top = 0
    Width = 320
    HorzScrollBar.Page = 8
    VertScrollBar.Increment = 5
    VertScrollBar.Page = 50
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alTop
    ClientHeight = 148
    ClientWidth = 318
    TabOrder = 0
    object igLayersListBox1: TigLayersListBox
      Left = 0
      Height = 148
      Top = 0
      Width = 318
      Align = alClient
    end
  end
end
