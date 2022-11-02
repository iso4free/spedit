object frmLayers: TfrmLayers
  Left = 256
  Height = 240
  Top = 171
  Width = 269
  BorderIcons = [biSystemMenu]
  Caption = 'Layers'
  ClientHeight = 240
  ClientWidth = 269
  FormStyle = fsStayOnTop
  LCLVersion = '7.9'
  object LayersGroupBox: TGroupBox
    Left = 0
    Height = 205
    Top = 0
    Width = 269
    Align = alClient
    Caption = 'Layers'
    ClientHeight = 186
    ClientWidth = 265
    TabOrder = 0
    object drwgrdLayers: TDrawGrid
      Left = 0
      Height = 186
      Top = 0
      Width = 265
      Align = alClient
      AutoFillColumns = True
      ColCount = 4
      Columns = <      
        item
          Title.Caption = 'Visible'
          Width = 66
        end      
        item
          Title.Caption = 'Locked'
          Width = 66
        end      
        item
          Title.Caption = 'Name'
          Width = 66
        end      
        item
          Title.Caption = 'Image'
          Width = 65
        end>
      ExtendedSelect = False
      FixedCols = 0
      RowCount = 1
      TabOrder = 0
      OnDrawCell = drwgrdLayersDrawCell
      ColWidths = (
        66
        66
        66
        65
      )
    end
  end
  object LayersFlowPanel: TFlowPanel
    Left = 0
    Height = 35
    Top = 205
    Width = 269
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
    TabOrder = 1
    object bbtnAddLayer: TBitBtn
      Left = 1
      Height = 32
      Hint = 'Add new layer'
      Top = 1
      Width = 32
      Anchors = []
      AutoSize = True
      Images = frmMain.ButtonsImageList
      ImageIndex = 31
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object bbtnDeleteLayer: TBitBtn
      Left = 33
      Height = 32
      Hint = 'Delete selected layer'
      Top = 1
      Width = 32
      Anchors = []
      AutoSize = True
      Images = frmMain.ButtonsImageList
      ImageIndex = 33
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object bbtnCopyLayer: TBitBtn
      Left = 65
      Height = 32
      Hint = 'Copy selected layer'
      Top = 1
      Width = 32
      Anchors = []
      AutoSize = True
      Images = frmMain.ButtonsImageList
      ImageIndex = 32
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object bbtnMergeLayers: TBitBtn
      Left = 97
      Height = 32
      Hint = 'Merge with previous layer'
      Top = 1
      Width = 32
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
