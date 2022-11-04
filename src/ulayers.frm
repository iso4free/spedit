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
  OnCreate = FormCreate
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
      ColCount = 4
      Columns = <      
        item
          Title.ImageIndex = 0
          Title.Caption = 'Visible'
          Width = 24
        end      
        item
          Title.ImageIndex = 3
          Title.Caption = 'Locked'
          Width = 24
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
      RowCount = 2
      TabOrder = 0
      TitleImageList = BGRAImageList24x24
      TitleImageListWidth = 24
      UseXORFeatures = True
      OnDrawCell = drwgrdLayersDrawCell
      ColWidths = (
        24
        24
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
      OnClick = bbtnAddLayerClick
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
  object BGRAImageList24x24: TBGRAImageList
    Left = 212
    Top = 121
    Bitmap = {
      4C7A040000001000000010000000510100000000000078DAED56C10DC3200CCC
      27AFBCF2CA2779E5950122B1088378110661110661108A2353B9C8A581487D71
      D22912F8B0413DBBC3F0C61AA9236DA48F0C4AA9805F22AE03C5ACC32770DDD0
      9E423D6ABDF70100921E684F532C30AD626785943BD307D22628D2DAAC16C3CF
      605A27D46D295EBA8F239D1772A4F732EC0BC2BECEEE96BFD79ADDC7B2779468
      28463A33CF2B711D3A3A048CE3B8CEF3ACF77DB7DFB82C0B600CC6722DAE6FDB
      6670AF94639A268531188B9AA4C5F5DA7A51835AACABF5CEA475E4AB1A28D238
      F255B8E14BDE737CD68F80F7DD02DD8F3CAAE0FDEEFF8E7F20CD31CEBBFE56B1
      B798BCBF7C9997525E40ADA0E7F3BAA4BF53A779E8239DFD8F698115DEC756D0
      0BE7854A16F5B1B75E8C3DBA497F1C4738CFB3591FE7CCA56FAD3FCE97ABFE56
      7DE5FB757CFAC308BFD93BF30B0A71FA87FFE1A1FFED03FFDB87FEB7DDFFDDFF
      2D78013F4D24E3
    }
  end
end
