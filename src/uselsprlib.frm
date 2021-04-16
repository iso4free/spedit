object frmSelectSpriteLib: TfrmSelectSpriteLib
  Left = 315
  Height = 240
  Top = 170
  Width = 320
  BorderStyle = bsDialog
  Caption = 'Select library name'
  ClientHeight = 240
  ClientWidth = 320
  OnActivate = FormActivate
  Position = poScreenCenter
  LCLVersion = '7.3'
  object ListBox1: TListBox
    Left = 0
    Height = 240
    Hint = 'Double click on item to select'
    Top = 0
    Width = 320
    Align = alClient
    ItemHeight = 0
    OnDblClick = ListBox1DblClick
    ScrollWidth = 318
    TabOrder = 0
    TopIndex = -1
  end
end
