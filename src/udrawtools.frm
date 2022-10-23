object frmDrawTools: TfrmDrawTools
  Left = 256
  Height = 240
  Top = 171
  Width = 320
  Align = alClient
  AutoSize = True
  BorderStyle = bsToolWindow
  Caption = 'Tools'
  ClientHeight = 240
  ClientWidth = 320
  FormStyle = fsMDIChild
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  Position = poDefault
  ShowInTaskBar = stNever
  LCLVersion = '7.9'
  object DrawToolsFlowPanel: TFlowPanel
    Left = 0
    Height = 190
    Top = 0
    Width = 320
    Align = alClient
    AutoSize = True
    ControlList = <    
      item
        Control = sbPen
        WrapAfter = waAuto
        Index = 0
      end    
      item
        Control = sbEracer
        WrapAfter = waAuto
        Index = 1
      end    
      item
        Control = sbPipette
        WrapAfter = waAuto
        Index = 2
      end>
    FlowLayout = tlTop
    FlowStyle = fsLeftRightTopBottom
    TabOrder = 0
    object sbEracer: TSpeedButton
      AnchorSideTop.Side = asrBottom
      Left = 29
      Height = 28
      Top = 1
      Width = 28
      Anchors = []
      AutoSize = True
      GroupIndex = 1
      Images = frmMain.ButtonsImageList
      ImageIndex = 24
    end
    object sbPen: TSpeedButton
      Left = 1
      Height = 28
      Top = 1
      Width = 28
      Anchors = []
      AutoSize = True
      Down = True
      GroupIndex = 1
      Images = frmMain.ButtonsImageList
      ImageIndex = 28
    end
    object sbPipette: TSpeedButton
      AnchorSideTop.Side = asrBottom
      Left = 57
      Height = 28
      Top = 1
      Width = 28
      Anchors = []
      AutoSize = True
      GroupIndex = 1
      Images = frmMain.ButtonsImageList
      ImageIndex = 29
    end
  end
  object FlowPanel1: TFlowPanel
    Left = 0
    Height = 50
    Top = 190
    Width = 320
    Align = alBottom
    Caption = 'FlowPanel1'
    ControlList = <>
    FlowLayout = tlTop
    FlowStyle = fsLeftRightTopBottom
    TabOrder = 1
  end
end
