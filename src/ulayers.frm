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
      4C7A0400000010000000100000004D0100000000000078DAED9541AE85200C45
      DFC49123474E74E4C8059874232CA41B61216C8485B0103E3525E92795A798BC
      114D6E4CB0072A72CBE7D383634932492E2924450088F464D13872CE52B0346E
      F91D104F6C08212262E691DF19CE45C182982BE6B50B3E329B039875452D56CE
      2158AFD4ED385FFB1ECF5C50D6C8FB65C5132FF6131416957541D4632E643907
      6EFC474D4B3FE63DB418866199A6C96CDBE6AE34CF33520EE54A96C6D775B5F4
      AEB6C6388E4039944B4C6669FC69BDC4104B75B57E33B39E7DF5248019CFBE8A
      377C297B4E28FA11CABE5B91FFB20E54BCDFFDFF9BC87D5CEAEEF986E42D5BFA
      EBE2BED0D64562155EDE5735FE4E9DF6E53932C53DDE124ED91FF74041992F3E
      54954FBDE554EA514DFCBEEFF1388E663EF5D9936FAD3FF5D7B3FE56FEE1FEF5
      F8EF0FAB9CD93BFD1B2B79E68BFFF1A5FFDD0BFFBB97FE77DDFFDDFF2DF107F5
      8F24E3
    }
  end
end