object FrmPreview: TFrmPreview
  Left = 256
  Height = 240
  Top = 156
  Width = 320
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Preview'
  ClientHeight = 240
  ClientWidth = 320
  DoubleBuffered = True
  FormStyle = fsStayOnTop
  ParentDoubleBuffered = False
  LCLVersion = '7.9'
  object Panel1: TPanel
    Left = 0
    Height = 50
    Top = 0
    Width = 320
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
  end
  object FramePreview: TPaintBox
    Left = 0
    Height = 190
    Hint = 'Click to export PNG'
    Top = 50
    Width = 320
    Align = alClient
    ParentShowHint = False
    ShowHint = True
    OnClick = FramePreviewClick
    OnPaint = FramePreviewPaint
  end
  object sdExportFrameSaveDialog: TSaveDialog
    DefaultExt = '.png'
    Filter = 'PNG files|*.png; *.PNG|all files|*.*'
    Left = 136
    Top = 120
  end
end
