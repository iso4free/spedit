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
  LCLVersion = '7.1'
  object ExLayers32Panel1: TPanel
    Left = 0
    Height = 150
    Top = 0
    Width = 320
    Align = alTop
    ClientHeight = 146
    ClientWidth = 316
    TabOrder = 0
    object igLayersListBox1: TListBox
      Left = 1
      Height = 144
      Top = 1
      Width = 314
      Align = alClient
      ItemHeight = 0
      ScrollWidth = 310
      TabOrder = 0
      TopIndex = -1
    end
  end
end
