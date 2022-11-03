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
      RowCount = 2
      TabOrder = 0
      TitleImageList = frmMain.ButtonsImageList
      UseXORFeatures = True
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
  object BGRAImageList1: TBGRAImageList
    Left = 212
    Top = 121
    Bitmap = {
      4C7A040000001000000010000000180100000000000078DAED95B10DC3201045
      695CB972E586CE9507B0C4220C728B30088B78100621601DD1293A30E02A095F
      FA8A82780693FF83107FAF33D834320A99C8EA601F6C71FC4E719E4356E21890
      715FF079B38EC2FDE42CC7CF3D9491C48CBC73A894A2D9B398532E47807DD098
      411759E79C0780C403C9A7C1EF828C27F9B4F607EF91A5594FBDA132F4191FDD
      914C174DE67D4EE41CB3463A2F433E21739E5C5781595791FDE4FA6B2AFE67E4
      E8FFD0178BE69CBA26BF5098A76FEE79A8BCBF4DE6F9B6E1FD74279B9B6F1BED
      18DE37BAC86FDB76795DD72E7EDF777F1C4737BF2CCBC5F7EE7F9EE76BFFBD7C
      E3F9FD9214933755CB4ED3648265C57DC9AD0B9165787A5F97F827FD170FFA2F
      1EF61F46FF47FF7BF4024619125F
    }
  end
end
