object frmLayers: TfrmLayers
  Left = 256
  Height = 240
  Top = 171
  Width = 320
  BorderIcons = [biSystemMenu]
  Caption = 'Layers'
  ClientHeight = 240
  ClientWidth = 320
  FormStyle = fsStayOnTop
  LCLVersion = '7.9'
  object LayersGroupBox: TGroupBox
    Left = 0
    Height = 240
    Top = 0
    Width = 320
    Align = alClient
    Caption = 'Layers'
    ClientHeight = 223
    ClientWidth = 318
    TabOrder = 0
    object LayersFlowPanel: TFlowPanel
      Left = 0
      Height = 41
      Top = 182
      Width = 318
      Align = alBottom
      AutoSize = True
      ControlList = <      
        item
          Control = bbtnAddLayer
          WrapAfter = waAuto
          Index = 0
        end      
        item
          Control = bbtnDeleteLayer
          WrapAfter = waAuto
          Index = 1
        end      
        item
          Control = bbtnCopyLayer
          WrapAfter = waAuto
          Index = 2
        end      
        item
          Control = bbtnMergeLayers
          WrapAfter = waAuto
          Index = 3
        end>
      FlowLayout = tlTop
      FlowStyle = fsLeftRightTopBottom
      TabOrder = 0
      object bbtnAddLayer: TBitBtn
        Left = 1
        Height = 38
        Hint = 'Add new layer'
        Top = 1
        Width = 38
        Anchors = []
        AutoSize = True
        Images = frmMain.ButtonsImageList
        ImageIndex = 31
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object bbtnDeleteLayer: TBitBtn
        Left = 39
        Height = 38
        Hint = 'Delete selected layer'
        Top = 1
        Width = 38
        Anchors = []
        AutoSize = True
        Images = frmMain.ButtonsImageList
        ImageIndex = 33
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object bbtnCopyLayer: TBitBtn
        Left = 77
        Height = 38
        Hint = 'Copy selected layer'
        Top = 1
        Width = 38
        Anchors = []
        AutoSize = True
        Images = frmMain.ButtonsImageList
        ImageIndex = 32
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object bbtnMergeLayers: TBitBtn
        Left = 115
        Height = 38
        Hint = 'Merge with previous layer'
        Top = 1
        Width = 38
        Anchors = []
        AutoSize = True
        Images = frmMain.ButtonsImageList
        ImageIndex = 20
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
    end
  end
end
