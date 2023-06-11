object frmMain: TfrmMain
  Left = 86
  Height = 676
  Top = 86
  Width = 752
  AllowDropFiles = True
  ClientHeight = 676
  ClientWidth = 752
  DoubleBuffered = True
  KeyPreview = True
  Menu = MainMenu1
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDropFiles = FormDropFiles
  OnKeyUp = FormKeyUp
  ParentDoubleBuffered = False
  SessionProperties = 'actLayersToggle.Checked;actToggleFullScreen.Checked;FormStyle;pnlFrames.Visible;pnlLayers.Visible;pnlPreview.Left;pnlPreview.Top;pnlPreview.Visible;pnlTools.Visible;Position;WindowState;pnlOnionMode.Top;pnlOnionMode.Left'
  LCLVersion = '8.1'
  WindowState = wsMaximized
  object StatusBar1: TStatusBar
    Left = 0
    Height = 18
    Top = 658
    Width = 752
    Panels = <    
      item
        Width = 200
      end    
      item
        Width = 300
      end    
      item
        Width = 250
      end    
      item
        Width = 100
      end    
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object pnlLayers: TPanel
    Left = 0
    Height = 618
    Top = 40
    Width = 147
    Align = alLeft
    ClientHeight = 618
    ClientWidth = 147
    TabOrder = 1
    object LayersGroupBox: TGroupBox
      Left = 1
      Height = 348
      Top = 1
      Width = 145
      Align = alClient
      Caption = 'Layers'
      ClientHeight = 331
      ClientWidth = 143
      TabOrder = 0
      object drwgrdLayers: TDrawGrid
        Left = 0
        Height = 290
        Top = 41
        Width = 143
        Align = alClient
        ColCount = 4
        Columns = <        
          item
            Title.ImageIndex = 0
            Title.Caption = 'Visible'
            Width = 18
          end        
          item
            Title.ImageIndex = 3
            Title.Caption = 'Locked'
            Width = 18
          end        
          item
            Title.Caption = 'Name'
            Width = 50
          end        
          item
            Title.Caption = 'Image'
            Width = 50
          end>
        DoubleBuffered = True
        ExtendedSelect = False
        FixedCols = 0
        ParentDoubleBuffered = False
        PopupMenu = pmLayers
        RowCount = 2
        TabOrder = 0
        TabStop = False
        TitleImageList = BGRAImageList24x24
        TitleImageListWidth = 24
        OnDrawCell = drwgrdLayersDrawCell
        OnMouseUp = drwgrdLayersMouseUp
        ColWidths = (
          18
          18
          50
          50
        )
      end
      object LayersFlowPanel: TFlowPanel
        Left = 0
        Height = 41
        Top = 0
        Width = 143
        Align = alTop
        AutoSize = True
        AutoWrap = False
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
          Height = 38
          Top = 1
          Width = 38
          Anchors = []
          AutoSize = True
          Images = ButtonsImageList
          ImageIndex = 22
          OnClick = bbtnAddLayerClick
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object bbtnDeleteLayer: TBitBtn
          Left = 39
          Height = 38
          Top = 1
          Width = 38
          Anchors = []
          AutoSize = True
          Images = ButtonsImageList
          ImageIndex = 7
          OnClick = bbtnDeleteLayerClick
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object bbtnCopyLayer: TBitBtn
          Left = 77
          Height = 38
          Top = 1
          Width = 38
          Anchors = []
          AutoSize = True
          Images = ButtonsImageList
          ImageIndex = 23
          OnClick = bbtnCopyLayerClick
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object bbtnMergeLayers: TBitBtn
          Left = 115
          Height = 38
          Top = 1
          Width = 38
          Anchors = []
          AutoSize = True
          Images = ButtonsImageList
          ImageIndex = 5
          OnClick = bbtnMergeLayersClick
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
      end
    end
    object drwgrdFrames: TDrawGrid
      Left = 1
      Height = 268
      Top = 349
      Width = 145
      Align = alBottom
      AutoEdit = False
      ColCount = 2
      DefaultRowHeight = 64
      ExtendedSelect = False
      FixedCols = 0
      FixedRows = 0
      PopupMenu = pmFrames
      RowCount = 0
      TabOrder = 1
      UseXORFeatures = True
      OnDrawCell = drwgrdFramesDrawCell
      OnSelectCell = drwgrdFramesSelectCell
    end
  end
  object pnlEditor: TPanel
    Left = 0
    Height = 40
    Top = 0
    Width = 752
    Align = alTop
    AutoSize = True
    ClientHeight = 40
    ClientWidth = 752
    Constraints.MaxHeight = 40
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    object bbtnNewFrame: TBitBtn
      Left = 1
      Height = 38
      Hint = 'Create new frame'
      Top = 1
      Width = 38
      Align = alLeft
      Images = ButtonsImageList
      ImageIndex = 8
      OnClick = bbtnNewFrameClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object FgColor: TBGRAGraphicControl
      Tag = 2
      Left = 649
      Height = 38
      Hint = 'Left click to select color'#10'Right click to set transparent color'
      Top = 1
      Width = 32
      Align = alRight
      BorderWidth = 1
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = clWhite
      ColorOpacity = 128
      Alignment = taCenter
      OnMouseUp = FgColorMouseUp
      OnPaint = FgColorPaint
      Caption = 'FG'
    end
    object bbtnSwapColors: TBitBtn
      Left = 681
      Height = 38
      Hint = 'Swap colors [X]'
      Top = 1
      Width = 38
      Align = alRight
      AutoSize = True
      Images = ButtonsImageList
      ImageIndex = 27
      OnClick = bbtnSwapColorsClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object BgColor: TBGRAGraphicControl
      Tag = 1
      Left = 719
      Height = 38
      Hint = 'Left click to select color'#10'Right click to set transparent color'
      Top = 1
      Width = 32
      Align = alRight
      BorderWidth = 1
      BevelInner = bvLowered
      Color = clWhite
      ColorOpacity = 128
      Alignment = taCenter
      OnMouseUp = FgColorMouseUp
      OnPaint = FgColorPaint
      Caption = 'BG'
    end
    object bbtnImportFrame: TBitBtn
      Left = 39
      Height = 38
      Hint = 'Import frame'
      Top = 1
      Width = 38
      Align = alLeft
      AutoSize = True
      Images = ButtonsImageList
      ImageIndex = 31
      OnClick = bbtnImportFrameClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object bbtnShowLayers: TBitBtn
      Left = 115
      Height = 38
      Hint = 'Show/hide layers'
      Top = 1
      Width = 38
      Align = alLeft
      AutoSize = True
      Images = ButtonsImageList
      ImageIndex = 21
      OnClick = bbtnShowLayersClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object bbtnShowPalette: TBitBtn
      Left = 153
      Height = 38
      Hint = 'Show/hide palette'
      Top = 1
      Width = 38
      Align = alLeft
      AutoSize = True
      Images = ButtonsImageList
      ImageIndex = 10
      OnClick = bbtnShowPaletteClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object bbtnTogglePreview: TBitBtn
      Left = 191
      Height = 38
      Hint = 'Show/hide referense window'
      Top = 1
      Width = 38
      Align = alLeft
      AutoSize = True
      Images = ButtonsImageList
      ImageIndex = 20
      OnClick = bbtnTogglePreviewClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object trkbrPenSize: TSpinEdit
      Left = 549
      Height = 38
      Top = 1
      Width = 100
      Align = alRight
      MaxValue = 1
      MinValue = 1
      OnChange = trkbrPenSizeChange
      TabOrder = 6
    end
    object lblPenSize: TLabel
      AnchorSideTop.Control = trkbrPenSize
      AnchorSideTop.Side = asrCenter
      AnchorSideRight.Control = trkbrPenSize
      Left = 496
      Height = 16
      Top = 12
      Width = 48
      Anchors = [akTop, akRight]
      BorderSpacing.Left = 5
      BorderSpacing.Right = 5
      Caption = 'Pen size'
      ParentColor = False
    end
    object bbtnResize: TBitBtn
      Left = 77
      Height = 38
      Hint = 'Resize frame'
      Top = 1
      Width = 38
      Align = alLeft
      AutoSize = True
      Images = ButtonsImageList
      ImageIndex = 30
      OnClick = bbtnResizeClick
      TabOrder = 7
    end
    object bbtnGridToggle: TBitBtn
      Left = 229
      Height = 38
      Hint = 'Show/hide grid'
      Top = 1
      Width = 38
      Align = alLeft
      AutoSize = True
      Images = ButtonsImageList
      ImageIndex = 32
      OnClick = bbtnGridToggleClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object bbtnOnionMode: TBitBtn
      AnchorSideLeft.Control = bbtnGridToggle
      AnchorSideLeft.Side = asrBottom
      Left = 267
      Height = 38
      Hint = '''Onion skin'' mode'
      Top = 1
      Width = 38
      AutoSize = True
      Images = ButtonsImageList
      ImageIndex = 40
      OnClick = bbtnOnionModeClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
  end
  object pnlTools: TFlowPanel
    Left = 729
    Height = 618
    Top = 40
    Width = 23
    Align = alRight
    AutoSize = True
    ControlList = <    
      item
        Control = sbPen
        WrapAfter = waAuto
        Index = 0
      end    
      item
        Control = sbLine
        WrapAfter = waAuto
        Index = 1
      end    
      item
        Control = sbRect
        WrapAfter = waAuto
        Index = 2
      end    
      item
        Control = sbFilledRect
        WrapAfter = waAuto
        Index = 3
      end    
      item
        Control = sbCircle
        WrapAfter = waAuto
        Index = 4
      end    
      item
        Control = sbFloodFill
        WrapAfter = waAuto
        Index = 5
      end    
      item
        Control = sbEracer
        WrapAfter = waAuto
        Index = 6
      end    
      item
        Control = sbPipette
        WrapAfter = waAuto
        Index = 7
      end    
      item
        Control = sbRectSelection
        WrapAfter = waAuto
        Index = 8
      end    
      item
        Control = sbMove
        WrapAfter = waAuto
        Index = 9
      end>
    FlowLayout = tlTop
    FlowStyle = fsLeftRightTopBottom
    TabOrder = 3
    object sbPen: TSpeedButton
      Tag = 1
      Left = 1
      Height = 20
      Hint = 'Pen tool - hotkey ''P'''
      Top = 1
      Width = 20
      Anchors = []
      AutoSize = True
      Down = True
      GroupIndex = 1
      Images = BGRAImageList24x24
      ImageIndex = 4
      OnClick = sbPenClick
      ShowHint = True
      ParentShowHint = False
    end
    object sbPipette: TSpeedButton
      Tag = 4
      AnchorSideTop.Side = asrBottom
      Left = 1
      Height = 20
      Hint = 'Pipette tool - hotkey ''O'''
      Top = 141
      Width = 20
      Anchors = []
      AutoSize = True
      GroupIndex = 1
      Images = BGRAImageList24x24
      ImageIndex = 13
      OnClick = sbPenClick
      ShowHint = True
      ParentShowHint = False
    end
    object sbLine: TSpeedButton
      Tag = 2
      Left = 1
      Height = 20
      Hint = 'Line tool - hotkey ''L'''
      Top = 21
      Width = 20
      Anchors = []
      AutoSize = True
      GroupIndex = 1
      Images = BGRAImageList24x24
      ImageIndex = 12
      OnClick = sbPenClick
      ShowHint = True
      ParentShowHint = False
    end
    object sbRect: TSpeedButton
      Tag = 5
      Left = 1
      Height = 20
      Hint = 'Rectangle tool - hotkey ''R'''
      Top = 41
      Width = 20
      Anchors = []
      AutoSize = True
      GroupIndex = 1
      Images = BGRAImageList24x24
      ImageIndex = 14
      OnClick = sbPenClick
      ShowHint = True
      ParentShowHint = False
    end
    object sbFilledRect: TSpeedButton
      Tag = 6
      Left = 1
      Height = 20
      Hint = 'Filled rectangle tool - hotkey ''Shift+R'''
      Top = 61
      Width = 20
      Anchors = []
      AutoSize = True
      GroupIndex = 1
      Images = BGRAImageList24x24
      ImageIndex = 10
      OnClick = sbPenClick
      ShowHint = True
      ParentShowHint = False
    end
    object sbCircle: TSpeedButton
      Tag = 7
      Left = 1
      Height = 20
      Hint = 'Circle tool - hotkey ''C'''
      Top = 81
      Width = 20
      Anchors = []
      AutoSize = True
      GroupIndex = 1
      Images = BGRAImageList24x24
      ImageIndex = 7
      OnClick = sbPenClick
      ShowHint = True
      ParentShowHint = False
    end
    object sbEracer: TSpeedButton
      Tag = 3
      AnchorSideTop.Side = asrBottom
      Left = 1
      Height = 20
      Hint = 'Eraser tool - hotkey ''E'''
      Top = 121
      Width = 20
      Anchors = []
      AutoSize = True
      GroupIndex = 1
      Images = BGRAImageList24x24
      ImageIndex = 9
      OnClick = sbPenClick
      ShowHint = True
      ParentShowHint = False
    end
    object sbFloodFill: TSpeedButton
      Tag = 8
      Left = 1
      Height = 20
      Hint = 'Flood fill tool - hotkey ''F'''
      Top = 101
      Width = 20
      Anchors = []
      AutoSize = True
      GroupIndex = 1
      Images = BGRAImageList24x24
      ImageIndex = 11
      OnClick = sbPenClick
      ShowHint = True
      ParentShowHint = False
    end
    object sbRectSelection: TSpeedButton
      Tag = 9
      Left = 1
      Height = 22
      Hint = 'Rectangular selection tool - hotkey ''S'''
      Top = 161
      Width = 23
      Anchors = []
      GroupIndex = 1
      Images = BGRAImageList24x24
      ImageIndex = 15
      OnClick = sbPenClick
      ShowHint = True
      ParentShowHint = False
    end
    object sbMove: TSpeedButton
      Tag = 10
      Left = 1
      Height = 22
      Hint = 'Move tool - hotkey ''M'''
      Top = 183
      Width = 23
      Anchors = []
      GroupIndex = 1
      Images = BGRAImageList24x24
      ImageIndex = 16
      OnClick = sbPenClick
      ShowHint = True
      ParentShowHint = False
    end
  end
  object Splitter1: TSplitter
    Left = 147
    Height = 618
    Top = 40
    Width = 5
  end
  object Splitter2: TSplitter
    Left = 620
    Height = 618
    Top = 40
    Width = 5
    Align = alRight
    Anchors = [akRight]
    ResizeAnchor = akRight
  end
  object pnlPalette: TPanel
    Left = 625
    Height = 618
    Top = 40
    Width = 104
    Align = alRight
    AutoSize = True
    ClientHeight = 618
    ClientWidth = 104
    ParentBidiMode = False
    TabOrder = 6
    object pnlColors: TPanel
      Left = 1
      Height = 152
      Top = 465
      Width = 102
      Align = alBottom
      AutoSize = True
      ClientHeight = 152
      ClientWidth = 102
      TabOrder = 0
      object HexaColorPicker1: THexaColorPicker
        Left = 1
        Height = 150
        Top = 1
        Width = 100
        Align = alClient
        HintFormat = 'RGB(%r, %g, %b)'#13'Hex: #%hex'
        IntensityText = 'Intensity'
        ParentColor = False
        TabOrder = 0
        Color = clBlack
        Constraints.MinHeight = 150
        Constraints.MinWidth = 93
        OnMouseUp = HexaColorPicker1MouseUp
      end
    end
    object cbPalettePresets: TComboBox
      Left = 1
      Height = 37
      Top = 17
      Width = 102
      Align = alTop
      ItemHeight = 27
      OnChange = cbPalettePresetsChange
      OnDrawItem = cbPalettePresetsDrawItem
      Sorted = True
      Style = csOwnerDrawVariable
      TabOrder = 1
    end
    object lbpPalettePresrts: TLabel
      Left = 1
      Height = 16
      Top = 1
      Width = 102
      Align = alTop
      Caption = 'Standard presets'
      ParentColor = False
    end
    object mbPaletteGrid: TmbColorPalette
      Left = 1
      Height = 1
      Top = 55
      Width = 102
      Align = alTop
      HintFormat = 'RGB(%r, %g, %b)'#13'Hex: #%hex'
      AutoHeight = True
      CellSize = 10
      CellStyle = csCorel
      TabOrder = 2
      OnCellClick = mbColorPalettePresetCellClick
    end
    object mbColorPalettePreset: TmbColorPalette
      Left = 1
      Height = 1
      Top = 54
      Width = 102
      Align = alTop
      HintFormat = 'RGB(%r, %g, %b)'#13'Hex: #%hex'
      AutoHeight = True
      CellSize = 10
      CellStyle = csCorel
      TabOrder = 3
      OnCellClick = mbColorPalettePresetCellClick
    end
  end
  object pbFrameDraw: TPaintBox
    Left = 152
    Height = 618
    Top = 40
    Width = 468
    Align = alClient
    OnMouseDown = pbFrameDrawMouseDown
    OnMouseMove = pbFrameDrawMouseMove
    OnMouseUp = pbFrameDrawMouseUp
    OnMouseWheelDown = pbFrameDrawMouseWheelDown
    OnMouseWheelUp = pbFrameDrawMouseWheelUp
    OnPaint = pbFrameDrawPaint
  end
  object pnlPreview: TJvMovablePanel
    Left = 320
    Height = 114
    Top = 360
    Width = 94
    AutoSize = True
    ClientHeight = 114
    ClientWidth = 94
    Constraints.MaxHeight = 500
    Constraints.MaxWidth = 500
    Constraints.MinHeight = 64
    Constraints.MinWidth = 64
    TabOrder = 7
    object ScrollBox1: TScrollBox
      AnchorSideLeft.Control = pnlPreview
      AnchorSideTop.Control = SpeedButton1
      AnchorSideTop.Side = asrBottom
      AnchorSideRight.Control = pnlPreview
      AnchorSideRight.Side = asrBottom
      AnchorSideBottom.Control = pnlPreview
      AnchorSideBottom.Side = asrBottom
      Left = 1
      Height = 92
      Top = 21
      Width = 92
      HorzScrollBar.Page = 90
      VertScrollBar.Page = 90
      Align = alCustom
      Anchors = [akTop, akLeft, akRight, akBottom]
      ClientHeight = 90
      ClientWidth = 90
      TabOrder = 0
      object FramePreview: TImage
        AnchorSideLeft.Control = ScrollBox1
        AnchorSideTop.Control = ScrollBox1
        Left = 0
        Height = 90
        Top = 0
        Width = 90
        AutoSize = True
        Center = True
        OnClick = FramePreviewClick
      end
    end
    object SpeedButton1: TSpeedButton
      AnchorSideTop.Control = pnlPreview
      AnchorSideRight.Control = pnlPreview
      AnchorSideRight.Side = asrBottom
      Left = 73
      Height = 20
      Top = 1
      Width = 20
      Anchors = [akTop, akRight]
      AutoSize = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000064000000640000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000006F0000002F000000000000
        00000000000F0000007F0000000F000000000000000000000000000000000000
        00000000000000000000000000000000003F000000FF000000EF0000002F0000
        000F000000CF000000FF0000007F000000000000000000000000000000000000
        0000000000000000000000000000000000000000009F000000FF000000EF0000
        00CF000000FF000000CF0000000F000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000009F000000FF0000
        00FF000000CF0000000F00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000F000000CF000000FF0000
        00FF000000EF0000002F00000000000000000000000000000000000000000000
        00000000000000000000000000000000000F000000CF000000FF000000CF0000
        009F000000FF000000EF0000002F000000000000000000000000000000000000
        00000000000000000000000000000000002F000000FF000000CF0000000F0000
        00000000009F000000FF0000006F000000000000000000000000000000000000
        0000000000000000000000000000000000000000002F0000000F000000000000
        0000000000000000003F00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000
      }
      OnClick = SpeedButton1Click
    end
  end
  object pnlOnionMode: TJvMovablePanel
    Left = 336
    Height = 200
    Top = 104
    Width = 223
    ClientHeight = 200
    ClientWidth = 223
    Constraints.MaxHeight = 500
    Constraints.MaxWidth = 500
    Constraints.MinHeight = 100
    Constraints.MinWidth = 100
    TabOrder = 8
    Visible = False
    object SpeedButton2: TSpeedButton
      AnchorSideTop.Control = pnlOnionMode
      AnchorSideRight.Control = pnlOnionMode
      AnchorSideRight.Side = asrBottom
      Left = 202
      Height = 20
      Top = 1
      Width = 20
      Anchors = [akTop, akRight]
      AutoSize = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000064000000640000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000006F0000002F000000000000
        00000000000F0000007F0000000F000000000000000000000000000000000000
        00000000000000000000000000000000003F000000FF000000EF0000002F0000
        000F000000CF000000FF0000007F000000000000000000000000000000000000
        0000000000000000000000000000000000000000009F000000FF000000EF0000
        00CF000000FF000000CF0000000F000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000009F000000FF0000
        00FF000000CF0000000F00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000F000000CF000000FF0000
        00FF000000EF0000002F00000000000000000000000000000000000000000000
        00000000000000000000000000000000000F000000CF000000FF000000CF0000
        009F000000FF000000EF0000002F000000000000000000000000000000000000
        00000000000000000000000000000000002F000000FF000000CF0000000F0000
        00000000009F000000FF0000006F000000000000000000000000000000000000
        0000000000000000000000000000000000000000002F0000000F000000000000
        0000000000000000003F00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000
      }
      OnClick = SpeedButton2Click
    end
    object pnlOnion: TPanel
      AnchorSideLeft.Control = pnlOnionMode
      AnchorSideTop.Control = SpeedButton2
      AnchorSideTop.Side = asrBottom
      AnchorSideRight.Control = pnlOnionMode
      AnchorSideRight.Side = asrBottom
      AnchorSideBottom.Control = pnlOnionMode
      AnchorSideBottom.Side = asrBottom
      Left = 1
      Height = 178
      Top = 21
      Width = 221
      Align = alCustom
      Anchors = [akTop, akLeft, akRight, akBottom]
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    Images = ButtonsImageList
    Left = 440
    Top = 224
    object miFileMenu: TMenuItem
      Caption = 'File'
      object miFileNewPoject: TMenuItem
        Action = actNewProj
      end
      object miFileSaveProject: TMenuItem
        Action = actSaveProj
      end
      object miSaveProjectAs: TMenuItem
        Caption = 'Save Sprite Project As...'
        OnClick = miSaveProjectAsClick
      end
      object Separator12: TMenuItem
        Caption = '-'
      end
      object miOpenProj: TMenuItem
        Action = actOpenProj
      end
      object Separator13: TMenuItem
        Caption = '-'
      end
      object miProjProps: TMenuItem
        Action = actProjProps
      end
      object Separator11: TMenuItem
        Caption = '-'
      end
      object miExport: TMenuItem
        Caption = 'Export'
        object miExportFramePNG: TMenuItem
          Action = actFrameExportPNG
        end
      end
      object Separator5: TMenuItem
        Caption = '-'
      end
      object miNewLibrary: TMenuItem
        Caption = 'New Sprite Library'
      end
      object miImport: TMenuItem
        Caption = 'Import...'
        object miImportSpritesheet: TMenuItem
          Action = actImportSprites
        end
        object miPiskelImport: TMenuItem
          Action = actImportPiskel
        end
      end
      object miSelectLibrary: TMenuItem
        Caption = 'Select Sprite Library'
      end
      object miSaveLibrary: TMenuItem
        Caption = 'Save Sprite Library'
      end
      object Separator6: TMenuItem
        Caption = '-'
      end
      object miFileExit: TMenuItem
        Action = actExit
      end
    end
    object miEdit: TMenuItem
      Caption = 'Edit'
      object miUndo: TMenuItem
        Caption = 'Undo'
        ShortCut = 16474
        OnClick = miUndoClick
      end
      object miRedo: TMenuItem
        Caption = 'Redo'
        ShortCut = 24666
        OnClick = miRedoClick
      end
      object Separator3: TMenuItem
        Caption = '-'
      end
      object miSelectAll: TMenuItem
        Action = actSelectAll
      end
      object miCopy: TMenuItem
        Action = actCopy
      end
      object miCut: TMenuItem
        Action = actCut
      end
      object miPaste: TMenuItem
        Action = actPaste
      end
      object Separator9: TMenuItem
        Caption = '-'
      end
      object miSettings: TMenuItem
        Action = actSettings
      end
    end
    object miView: TMenuItem
      Caption = 'View'
      object miTioolPanels: TMenuItem
        Caption = 'Tool panels'
        object miDrawingTools: TMenuItem
          Caption = 'Drawing tools'
          Checked = True
          ShortCut = 8276
        end
        object miLayersPanel: TMenuItem
          Action = actLayersToggle
          Caption = 'Layers'
          ShortCut = 8268
        end
        object miFrames: TMenuItem
          Caption = 'Frames'
          Checked = True
          ImageIndex = 21
          ShortCut = 9
        end
        object miPreview: TMenuItem
          Caption = 'Preview'
          Checked = True
          ShortCut = 118
        end
        object miReferense: TMenuItem
          Action = actReferenceToggle
        end
      end
      object Separator7: TMenuItem
        Caption = '-'
      end
      object miZoomIn: TMenuItem
        Action = actZoomIn
      end
      object miZoomOut: TMenuItem
        Action = actZoomOut
      end
      object miZoomReset: TMenuItem
        Action = actZoomReset
      end
      object Separator10: TMenuItem
        Caption = '-'
      end
      object MenuItem1: TMenuItem
        Action = actGridToggle
      end
      object Separator14: TMenuItem
        Caption = '-'
      end
      object miTogglePreview: TMenuItem
        Action = actPreviewToggle
      end
      object Separator4: TMenuItem
        Caption = '-'
      end
      object miFullScreen: TMenuItem
        Action = actToggleFullScreen
      end
      object Separator2: TMenuItem
        Caption = '-'
      end
      object miLanguage: TMenuItem
        Action = actLanguageSelect
      end
    end
    object miSprite: TMenuItem
      Caption = 'Sprite'
    end
    object miFrame: TMenuItem
      Caption = 'Frame'
      object miFrameResize: TMenuItem
        Action = actFrameResize
      end
      object miFrameDither: TMenuItem
        Action = actDither
      end
      object Separator15: TMenuItem
        Caption = '-'
      end
      object miOnionMode: TMenuItem
        Action = actOnionSkin
      end
    end
    object miLayers: TMenuItem
      Caption = 'Layers'
      object miAddLayer: TMenuItem
        Action = actAddLayer
      end
      object miDeleteLayer: TMenuItem
        Action = actDeleteLayer
      end
      object miCopyLayer: TMenuItem
        Action = actCopyLayer
      end
      object miMergeLayers: TMenuItem
        Action = actMergeLayers
      end
      object miMoveUp: TMenuItem
        Action = actMoveUp
      end
      object miMoveDown: TMenuItem
        Action = actMoveDown
      end
      object miFlipRotate: TMenuItem
        Caption = 'Flip/Rotate'
        object miFlipH: TMenuItem
          Action = actFlipH
        end
        object miFlipVertical: TMenuItem
          Action = actFlipV
        end
        object miRotateCW: TMenuItem
          Action = actRotateCW
        end
        object miRotateCCW: TMenuItem
          Action = actRotateCCW
        end
      end
    end
    object miPalette: TMenuItem
      Caption = 'Palette'
      object miPaletteLoad: TMenuItem
        Action = actPaletteLoad
      end
      object miPaletteSaveToFile: TMenuItem
        Action = actPaletteSave
      end
      object miPaletteClear: TMenuItem
        Action = actPaletteReset
      end
      object Separator1: TMenuItem
        Caption = '-'
      end
      object miPaletteImportFromFile: TMenuItem
        Action = actPaletteImport
      end
      object Separator8: TMenuItem
        Caption = '-'
      end
      object miLoadPresets: TMenuItem
        Action = actLoadPresets
      end
    end
    object miHelp: TMenuItem
      Caption = 'Help'
      object miAbout: TMenuItem
        Caption = 'About'
        OnClick = miAboutClick
      end
    end
  end
  object ButtonsImageList: TBGRAImageList
    Height = 24
    Width = 24
    Left = 440
    Top = 112
    Bitmap = {
      4C7A290000001800000018000000946200000000000078DAECBD075C8E5FF83F
      7E4A9291153EC85ED9294DA5A2D25456F6C8CECCCC56B68428AB4848569250B6
      B2450AD92BA36C323292BCFFE73A3D4F9ED27890DFEFF7FF7E9DD7EBFD7AEEFB
      3CE77E9F73AE73CE75AEFBAC9BB1FF2BCE94239023910312A4708471F4FB03DE
      9A1C51C4A7A5A585BE7DFB62C488111833660C264E9C88DEBD7BA356AD5A90C4
      ABF98BDC143EA561C38618376E1C7C7C7C10B42100E19B5723724700A22277E2
      C89123888C8CC4C2850B51B26449FC425ECA509A5AB46881B973E7222CD01BA7
      03A7C0DD7D0A4AF5582540D7170346E1CA5E5FC49E89C6FAF5EBA1AAAA9A2267
      3EDCCB962D2BB80FAC998C8B6B8721E9883798933FD8A144B0313B5163D05ABC
      8DDD88BBBB3D443CB1477662EDDAB59487A8ABBBD7B39B1141ECE87AEFBCF813
      3B75EA84D065137071DD08C41DE4F2381E99C9FF1C6081B1E2FAF0A10D787165
      075E9C5881F3FE2370E55C14F4F5F5298E9A37F66D623A4D35F2E2878787072E
      F80DC1ECB973447AD9D4BD9920FEF05B3FEE793CBB22B6E2F1414F5C895883B1
      63C712BF6BC01CB7FCE483806573712D7824AA0D580576FD7D266F6EE071984E
      598F4FB78290B06B11C2C2C288DF5DBB717D41F4E1C3875CF903572D464ACC4C
      688E5E5560FA1D6707024FC3F0F0EC166CDEBC59F013496A6A2AFBF8F163AEFC
      5456CF2F2C44FCE9A570F45809D349AB7E92BFE9E4B59C3B0029F77670FE70BC
      BC1B036F6FEF2CFE848404F6E9D3A75CCB77C3860DB870642DF0C09B63A9F8CD
      E25F79465C23691390BC1578128AF73743F1F1C33BF4EAD54BF013EFE7CF9FD9
      972F5F72E30FA336B57BF76EDC8FE5797FE82B5073881FD8E228B0BE1BB8CCD7
      71EE60CEBD9D73EFC0FB97C9888E8E46F3E6CD89DF913FCBAE5DBBC6BE7EFD9A
      ABBE69D2A4098E1E3D8A63C78E21FE4C389E5F5A8DF8737EE8B7682DC73AA4DC
      DD844F7783F0EAFA3EC17DFDFA754C993245E88AB4B434C19B9E9ECEBE7DFB96
      571D0A9B3A752AEEDEBD2B9EBD74E9122E9D3F8DC42B8790743D0A0FAF9EC6EB
      E7C978FBF62D6EDEBC891D3B7608FEE2C58BA748F444CD1B376EB0EFDFBFE7A7
      23E2DDDDDDF1FAF56BDCBF7F1F57AF5EC5952B57101F1F8FCB972FE3E4C99342
      FFD0FDF1E3C7B161D34E18DB2E8552796728285511F100C85D219B9A4AE3F0AE
      5EBD3A162D5A24B8A49C7BF7EEC5F2E5CBE1E0E0802E5DBAE04CCC65D84CFE82
      3A76F751B2F169A8D4DA0B85A275E5D579A4A7BDA5BA5A824419FD1FD848AF17
      8C5CBFC072327E370E66626222CAEDD4A953E2BEBC6A0936B3B79DD0E54A6575
      F05FFBBB3FC5514C7DB7DC7190CCA83E646464E4566EF1251B7A64C5D1766206
      D44C12A066770FAAC667397FA51479F8899740E5260B697D90C651D5F62ECA59
      DF866A9BAB50318AE7016A421EFE9CBC79C55142FB3C4A985C86B27E2C8AD4F2
      81A4EC0AC3893894AA2F47911667A1506D2AAFABA5537EA37F2E288E30499A03
      25F5EFFFA6FB67FFC861FFC4F2FE3E61F3045C0D9E884B81A30BDDFE7917B719
      1F2E6FC39B0B417817BF354FFB470EFE6CF6CF9BF31B8097F1C0C7A740FA47E0
      ED39A4DFF3E7D888AF7772B77F0AE0CFB27FCE074F83EBDA233075DFFB033376
      F2BEDD8FC39FF7650178736BC74FF64F41FC52FBC77EBA4FA6BD702A39770CDD
      22EC939CF64F41FC52FBC774D2CA02F9C9BECA69FFBC7BF78EBD7FFF3E4FFB4A
      6AFFB8FBFB66DA25F9C07D7DD04FF60FF1E6635F65B37FE2CF2C43D4311F8E15
      1CAB1015E587A8E8751C1B107F3E3857FB87CB89DDBA754BD840F2DA3F78B492
      630DF098DB3E491BF2B57F88371FFB2A57FB078FFC24DC3CCEA4A03CED1F2220
      FBEACE9D3B79D9578562FF14605F158AFD93A77DA5AAFE77ED9F5255C54F1F1B
      93BF63FF707EB532A598FF84FE6CC5A89E6CF598DE2CC06D000B9A3E8C6D9F33
      868579BAB108EF19ECF0AA39BF67FF48D2FF0BEED7EC9F22C518AB63C358E70D
      8C0D3ACAD8E0A89FEC2B593BA8B0EC9FBCECABC2B07F0AB2AF64E3F867FFFCB3
      7FE4B27FF6FC9AFD636868F85BF6CF85C32172D93FAD5AB5FAABF68F843FCBFE
      B9153A4570DE8E3D85D12D2B09C85ED318C4F7472172DB3F464646D9EC9FF4DB
      B381AF29599CC2BDD887DB916E127E6E3B3CD926B7FD636C6C9CCDFE41E202DE
      E7F27EFDDD79E04302F02C44D2D7533FCFED9EE4CDA28FCF6DFC273F7EA9FD83
      075E3C8E45B8BD6F54667A1F2EE7DCAB707BFF94CC7B614384E43AFE939B6BDD
      BA75AEE33FB723C6FC907FE4A41FF2CF63FC67FEE02ECCB071DDBCF8FFD8FED9
      E2319205CD18CEDC7AD8499847678D01FCA9FDB3DB6B32F39FECC2CC5A36F991
      70855359FC64B7FCAAFDB37DFBF69FEC9F2C6E65BB2C7EEA43A8FFFB3DFB27E4
      27FB8795EDC158B18312F5FBA30F94E98BE4B27F4EE76BFFF8F29F7A79F6817F
      7BFC47AB615D7666A3373BB3C99B852E99C96C5BEBFDF8734EEC1F8FFF6837AA
      C7762F9FC5EC4DF47FFE73F153C67A4E2E94F19F5C5D9768C67A45168AFD937B
      4FD486B1E6F18CD5BDF817C77F2A733871D8FCB37FFE87DB3F09470FB3333BB6
      325FE79E6C82B5052B5EB4E85FB57F960D1F5228E33FB2F6CFF0DE4EEC50C052
      41B472E2D8BF32FEB361EA504114347D72BEE33F52FBE77254247C8674C8B44F
      3E3F167DFCAB8B5E9864522357FB67956B2F41B473CAF87CC77FC8FE39B76B0D
      3C7BB4C9E28F5CEE8AC7C767C2A79F7E661F9F8BFD1330718020DAE13626DFF1
      1FA9FD733B7A0D7C06B411F64FE422A72CFB2793FF67FB67D3741741B475FCA8
      7CC77F64ED1F9FBE3A59F60F1EAF15364426FFCFF6CFB6D9992662F098E172CD
      7F91FDE3D35797F3AFC8E47C1C206CCF4CFE5CC67F3C270AA24DA35DFECAF8CF
      3EEFE9822870C4E0421FFF39B4723623900B70195028E33F79D93FFE83FB15E2
      F8CFCFF6CF9A01BD73252F594CB910ED9FDC5DA952A5D8914573FFAAFDD3AA71
      431632DD8DED9B3D9DED719FC2F66CD9CCCE9D3BC75AB66CC9D6CE9C9AA5CBFF
      C4FEA95DF93F36AF5F2F36B05D5BB6C6C7871D387080EDDFBF9F7139B1888808
      C6655568F64FDDBA7559D3A64D19AFBF5968DCB8F1DFB37F72A973FF93E7BFF2
      9A0F2E2CF73F899FC6529E3C79C29E3E7DCA9E3D7BC69E3F7FCE5EBC78C15EBE
      7C29F0EAD52BC675137BF3E60D4B494911E0FA8E49E72E0879F0E32F204ACA6F
      64D0022FEFECC79B8727F1FA811427F0222640FC6621F178A61FFF95E25562B4
      F07BF3E8345EDD8F96202A1BBF496B63C1C9DF2391F1ED2B32D233F1666D1FEE
      97816FE96959107E19DCEFEB972CBCF1EF2DF1FB8C6F6999C8C66F6C24D2479C
      9FDFBDE278894F6F5FE0F59A1E82F363CA337C7CF394E3095EADEE2E38535F25
      E1C3CBC71C8FB85F37C1F9FEF9038E44BC7B763F1B7F6BE35622AFC4F529E579
      16DF0FAEE42C3EC1C5D3F9FEC5C32CBE57ABBA223DED13DE3DBDC771176F9FDC
      C9CE6FD44AC8F1DBD734A4BE7EC291C997C9F545A4F183842F93EBB348A394EF
      E52A27A47FF984B7C9B791927C0B294937B3976FFD8ABC8CD6093912E7AB55DD
      04CF8B593AC2EF25BFCE84D30FBF954E1274E17E2D33FD5674C9822CBF712B03
      51E654469436CA2B21B3DCBE89B4A57FF928F0C3EF23BE7E49C5D7CFA9DCAF17
      32B81F5D7FFDFC41203BBF3E5EDD3B9625C3B74F326548E9239E94A4CC3CA73C
      BE21D22B381F5EC3EB875779BD48C08B159D05E7ABC4CB3C9D97F092231BBFA1
      3E5E12BF5486123EC145697E749D23932F932B15AF1E5CC9E27BE1DB095F3F7D
      E01C717871F7A24036F91BEA715BF26866FE791AA57C2F5664A695D228E513FC
      822B5EF0BDBC1B27F8D33EBDC78B3B17F0FCF6790159FE5654BEE7D609396696
      4F67C193596EBD32AF398700F9F9F5FA71EFDB51F8BDE67ECF7D3A4AD021877E
      D0E1711F9694D1872C104FC637EEC7D346A034BE167EE948FBF82E0BD9FDDE22
      2DF56D767EFD4CFEEC328C1569234E91E75B3199E069239E6737CEE0E98DD378
      7AFD349E2F77C417CEF9E4DA093CB97A02C909C7B3CB47BF255EDC3E24E1BAF0
      838FE75570DD3C2BE13B93C92FB84E66F165F2A720F94A149208978F65E7D7D3
      E69C07255CE7B2F832D3FA96A7F19484EFE40FAE84E82CBE67CB1CF0E5C31B24
      5D3A82C7970EE371FCE16CFC7F5BFFFFEBDFFF77B93265CAA4705B0552B46AD5
      EA27181919FD046363E32C48ECC5BCE694C06D20016E0781DB41E0769000B783
      C0ED20F18EC6ED20016E0789F73E6E0709703B285FFB99D2F7BBBC1F3E7C1028
      885FCAF92BBCA9A9A9021F3F7ECCC6CFDFAD5018A0F77F4AD7A74F9FB2F10FEA
      DB09E98FF722E34904BE3F8B14C0F3FDBF04E227DECF9F3FE3CB972FD9F807F4
      EA80773742907A27149FEF8721EDE11EA427ED43C6D3889FE24AB9BD0751BBB6
      08E4E4275E425A5A5A36FE7EDD1DF02C36082FE383F1FACA56BCBDB61DEF6F85
      E0E3DD5DF89CB81B5F1FEDC1B7E47D78736B0FCA78C5809DE2F23DF801A653F6
      64E30F0F0F17E5F3F5EBD76CFC7D9CEC9118ED8F872703907426104F6236E2F9
      451EDFA52D7893B00DEFAEEFC087DB3BB168ED4EB02D6FC0D6BE045BF60C6CC6
      7DC41FDD91C54FBCE9E9E9F8C6FB3C59FE5E9D6C716D9F0F6EEE5F813B8756E3
      DE513F3C38BE168F4E0520F9EC063C3DBF092FE23663EED260CEF9186CDC4330
      176E63F6B886F3FBB70859123FF11232B81D25CBDFC3D11AB1DB16213E64312E
      EF5A8AAB7B96E37A842F6E1D58896D3E53703FCA0F0F4FACC3B5036B51DA3C12
      CCF63A98E95518D96FCE9225F1EFD9B347D457B2C365F9BBDAB7C3C975B37126
      702ECE6D9A8F0BC10B11EE3B0DA3FB3B89E7E64D18881B912B70FBE02AC4ED5E
      8935B39760DB729F6CB2A470C42B75B2FC5D6C2C7068D9141CF19D8EA8553331
      AC670768596942778416CC971BC1749811AC6D4C31676C7FC46C5F94AB2C895F
      D6E56C5F6DB98DBE77C1780CEA620F0D8706A837A3165A2C680CA3653AB0F46B
      8DF6FEE6B01C6F06FD367A98E5DA0FA7372FC08E659311BD699E90A5543E8989
      893FF13768DD00AC2F13501AA084B2234BA39A5B6568B8D781D6C2263C8E9630
      5F6D04BB8036E8B0A91DDA8E682DF84CFAB4829E992EBCDC06E79B7E597E82CA
      A062501B5D16D52755117168CE6F04FD252D60E2A327E269E7DF1A964B5AC37A
      AD292C7C8C61D047378B9FEAE8A953A7F2E557E0283E5805E5479585FAC4CAA8
      3BBD269ACCAE0F2D2E2F5DAFE63058AA8556DEDA30E430E0F1EA2C6A2EF86FDF
      BE8DFDFBF763F1E2C57F45BF1D3A74488CFBD1185A7EE34BA6A6A6F81547FA3B
      222242700F1C3890B8E30B5897233737F571B4566DC99225A2DF9470972968ED
      D36FDA6BFDFE592F7F75CECDBD90E600A9FC1DA57CEAEAEAE8D8B12366CE9C89
      808000B8B9B9FDCEF8A0744C38BE5AB56A707272C2D2A54B71F0E0419C3F7F5E
      8CF52F5BB60C83060D42B366CD7E999F6CC22D5BB688F16C1A9B3F71E28418CF
      1E3C78B0B011555555A1A8A828A0A0A0209D8F947B0C92386263633179F264B4
      6BD70E3486AEA6A6962B4A972E8D62C58A41494949EE38F4F4F470EEDC39D8D9
      D981E620F3438D1A35443C6DDBB685B2B2728A3C65ADA3A3837DFBF689395313
      13937C41732E55AB561573AB3D7AF4904B2790FE231D4573B134EF4173087981
      F4539D3A75E0E9E92920B1C7E325F536D7BA4BFC070E1CC0B469D310181828E2
      18366C58AE68D3A68D900FCDB7162F5E1C24DBD1A34783E6B8A8FC72D62D5D8D
      CA59FC73E6CCC19D3B77441C0B162C00CDC74C9A3409969696A85FBF3E2A56AC
      28CA9FE61D898FEA04D535AAC734FF74E6CC999FF84758D6CAC6FFF0E1433147
      4471AC58B102F5EAD51371D0FCF28D1B37447B20BEA8A8289C3E7D5ACC6951D9
      49E78372F28F6993997EEADB66CF9E2DE68E689E8AC2531C5477A94D105F5C5C
      9C482FA585DA8B9F9F9FB01BE83721214184CBC9AF5FADB8D0F9D43E67CD9A25
      FA514A3FCD8391ACE8D9C3870F0BBFC78F1F8B7B924B727272563F437E348745
      F1E7D1B63569BE9BD24F32B876ED5A567A281ECA37F93F7AF44870C93AB2C9C9
      8FE6C52E5EBC982B7FE9CC69794DDE3653424242445AA4E129AD24678AE7C183
      07828BEC28F2DBB973A7B85FB76E9D483B852D4037897C6CDDBA55849582B828
      4F5436C4270BD2A95416D2B072E83E1107959B2C3F95F7BD7BF7841D427593B0
      71E3461107E543863F5E9EFEA4418306A2CE48F9A93CA8BCA96ED2BC35C54FFF
      5FB8704184A178860C1992B5A65E0ED74F1A07F1539950DDA272A6BC905C5C5C
      5C846D25337FE82EE9EBD8AFC441F59DCA64E4C891D0D5D595F2054AE766ABD5
      3CC6FE53DFCFCA57DCC28A2AEBFE6A7FD94F62E384FDB4D6EDFF7DD7291F9BAD
      FB1FF0528B5B467D3DD90B4F9E3C11F587FA67D223363636D2388E71349593D3
      926383347DADADACB1E5C02124729DF096BF173E79FE026FDEBF47F28B978888
      3E0EDBAEDDD0AE6327D9FCACA6AE24AF956714C67BCB366C3C7C1441C7A2B168
      63107A8F1C8571D3A7C3C6DE1EA6BC0F68656E81A1AEAE3878FA0CD64644A20F
      FF7F6DF85E2CDDB21553BD9749E3B1CC6DA8CF77FB0E445C88C5A1B84B389E70
      0D41A1BBB0C87705DA5A58A276DDBAD0D2D145DD868D5095F7EFED3A7586EFCE
      5078F2F7D4B0E327B02A2C1C3E3B7662868FAF348E6C4E454505C72F5D16FCA7
      AE5DC7E5FB8988BE18872DBCDD2FE2E99A3463269C7AF786493B2B741D341883
      DD26C175A607B61E3D06FFBD11222FF4BB307063AEFCE4177BF316DE7FFC84CB
      B7EF20EED66DDC4A4AC6C9F84B88E1E57A24E63CB644EEC7C6C8033CADBB054F
      C0818308D87F10EBB8DFF613A7B03A340C6E9E5E79F2AFE1F2D9131989CF6969
      F8C2DF03DFA6A6E2F6C3473CAE5B88E77192CC8E5D4E105C543E3B4F9DC6499E
      D7A8D88B083D7418C3A64E87F318B11EE87E4E726E0FC4CD5EC375EDAE301CE3
      75F02ED7C3CF9E3FC7571A0FC9C81063165FD3BF89B853781D7ACCEB12E5333C
      2A1A7357ACC4904993D167D468B4CF5CEF723197F4FB38F6EE23CAC7775310B6
      EC3F804B376EE22AD797E7AFF07ACF6DBBA3BCCE841E398A6DBCCE7AAD0FC4E4
      C54B31C96BB1F8759932157D468C84657BF1EE3825B765992423B2F9C6731B68
      15EFD7CF5EBE822B77EEE2182FF313BCEC234F9E12F5448A396BFC31CADD0323
      A6CF40DF61C361626626957D5E6D00CDF4F5C16D69E8E81B6022B7957CB9CC66
      7A2EC2E63D7BB19EBF27529B183F7F01A62CF18653FF01E8C8EDB9E65A5A82B7
      6E932652FEBC6C45F4E176935DB76E68C5F3518BEBE5DAB56B83DE2FE83FB283
      72EA20B54A9550A7716368705B4E87DB8D79D49D2CFEC153A7A2232F23B779F3
      3082EB9DA56BD660C4C4895C0F74C4046ECB751F3E1CBA5C0E1D070C80254F7B
      4B6EEFB6E3EF224DB87D6CCEC314C43F9AF376E9D307B3F9BBC5646EAB047199
      8CE5715AF2777E8F458B308AEB0A7D9EB74ECECEB0EDD913DADCB66DC3FF6BCA
      FB1C8A2F0F7E458E22527E4AFF3ADE6EA7F1EBBDDCAEF20F0A821D7F7691AF2F
      E6F178A5FC5D79DFA8C76D5DCA93BEB9B9F8CD855F41A28B5564F97D79FF4DFC
      91C78F63537838FA715B9F7EBD789F4BE91C33772EFAF2B292F2E6E05796A457
      9AF6121C1564F95704070BFEFDDCD6FC0DFE4AB46449462E74DF44969F78FE20
      FD5A1CB4E14B89A3182DC3912CD6C560DEB67E573E8EFDFA49F9AD391A4BB84B
      48FA37EA4BD185DB47527EAA3FF2F21BF3FED29AB71B097F07197E2A8BEA1CE6
      1CE3E87F5B1E6ED48C1918C6EBFFB6BD7BB182DB80FD478D4230BF96E5EFC6DF
      957479FDB1EADA15061616526E77095775897C142465514DA2836821E72569FB
      ECC8DF0F6DBA778719AFE343274C40E7FEFD457DA7F41AFFE8E309B4E07F026D
      29E0A0C3448AE7A8A3CA12BD5145623F515EF6719CC8C73E39281953E82C9131
      C9445D52D715C49AB4E2A5D0B2414B017AA68A5A95ACFB5F053D4B1CD27B2977
      AC5FAC00FDEF37DE2FEBFE5741CF1287F45E360E29723ED3D3BCE72FC521CB95
      33FD39F987DA0F85FF787FE834D0F9257ED96BCACF10FB210239F9899BE2F0E8
      E7F14BFC523EE26E50AD81901B41967FCBF42D22DDA58B9716BF52C8C32FE523
      EEFCF829DDBF229BDCF80B928FBA9AFA1FC9A7A0F29DD075023C9C3DE48E2327
      5F7EF5535A7FA4E55CD8F59378F7CEDF2B40D77F9A7EBA76EFE7FEDBED979ECD
      C9271B5F61E99F9CB2FABFA97FA4A0FA436DA230CB37A79E90B7FDCAAB7FA4A0
      FA43FCF2D45179F58F2C28DDD48E1B566B58A0BE9657FFE4E497B6B5FCCAE857
      F58F14F41FC5D1DEB07D817AE257F48F6CF93A183A88F414A6FE91ADD7249F82
      645350FDCCAB7D51FD21FF82645350FBFA1BF6C9FF890124783048F164C28FF7
      0FBA9607F2F097FDF40E524E597EA97F5EBFF2F24B9FC9C99F1F77CEF0BF239F
      C2487F5EAEB0E4FFBFC5C996933CF81DFE82EA93F43737FE82D220DB4E0AFACD
      8B3FBF308591FEFCC2FC9F48FF9F946F41E92F8CFA57501EFF94FFFFCFE9FFA7
      BBFEB97FEEEFB87A952AB2E5BD9CD8BCAE1D9873F76E2C26620F4B387638771C
      CD0E39F6BF0BFEA136ED58D8E205D2B54A81D2756445EA69CBAE11A38DCA6592
      9393595252127BFCF8317BF8F021DBE5EDC5160D1DC82A942BC7544A37608A4A
      AAD9F8EB56AAC0246B6DA298BE0D142706A0D8CA0B28E17705C537DE42B19D8F
      A0B4210E0ACE53C14A974BCC6D8EB64EE5FF58CD66E359AB212F58C376471953
      901DA2648EAC7653282C3D0A15FFAB28B3F02454BD6304B772F8131439FC168A
      273F41E1DC57B0C133C538AA9F9F1F9385ABAB2B2B557131E73ECDAA36DBCEF9
      FFFBB1DEAA649914B6F51E4A2D3B2FB84B7B9D41F1C01B50DEFD04C6173E40F5
      DC17B0F3DFC082E3C0AA88BD9F9AB4178FF6E4D1B975EA3CEDE1E1E14C5BDB93
      CB66326BD66CAE6CDA5D8BF67243B92DF732B9394AAEBE2464A260688376BDFA
      A0C3D524148D4F97A63D51520ED9D62E9D397386EDDAB58BE763B1F45C1BA90B
      EBB03E124DD7C567F22FE669DF741B45235E80952A9B22C694758DC0AEBD86F2
      D9AF50D9CECB63B8278A1ADA41B1520DD9B53F8EB4B73638389855AA5449963F
      6AC59E2330DB7459F097F2B98062DB1F40E9D01B284CF3973E9F58E6683C2A9E
      FB04D5231F51EEC07B94DF9F89B2218F506AC616285BF494E62DE7FA81B0C823
      C73074DF2DC15F72553C94431FA3C8D17750E0E9657EC75076D26218DDFC8892
      519F50F6E0872C6E82DEC6D368EB1729AECB6CB80AC5BA62FD9AACECFA8D18ED
      8A907B6F047F85D5B1E8B4E5043AEE3A870A27DE80C57E87C2F90C143B958652
      473F65A59D386F74D5475287C6B86D5D01873BD641E36D575172F1FE9CFB17CA
      A8962D9BE2F7F0199A6E88C7F8B5A1622D19ADF3A135194DF71F814AF459289F
      FE8A92C778FA25FCA12EDDF07DF060DCB5AD8284B64570D55C195EAEFDA07A38
      150A956BE4EC5BDD9B0C1A0EA34BCFE0B13E54AC55A2F5259EFE8B60BEC70863
      CFF484F6661354D8BD0425D7F032304E879546184EDA0CC363470DDCB65243A2
      7D4D840CED8C523C0D8A2D4CB2F1FF5746B4E7F8929BC2D1F2E045B1BE84F6A5
      3B6F1C800931BD31687F47E82DD586E68A66A8E6784DECE9AE589FF659DFC752
      AD2978D3BD0DBE0DEC07FF51BDA07282B795CAD9F7474BF6BFD764A5793B0B8D
      42E3B08BE8B0F1085A6EF58243685B98FB19419FF3B77477400373A0F5F08F28
      53F510E7D80A058544588DDF89D1B366A0D6DEDB50DA7537D73534B4FF5D943B
      8F43615714FE8B4E46B1B05BA815648F8EDB2CD06B971D1C02FBE33FCD77D072
      4A4669CEAF56271A8DACEF42B5F977289D4D87624C0698A9639EEB8769FF3BC5
      A1C0E368BE6435FADD7E8B6A07EF413D743C6C224CD124BC1BD89A0C94D2FC02
      75CD1768E6F049E447A90B443D631E8105AE2FA2FDEF92B998B086C626D878E8
      08021F7D86E69977508CE675E3F4974C3D17C4F5D16A9EDECD1999BA69DC5279
      D70FE75CB71AD55C5313D33C97C039EC2CAA47715D4AFAF4D80728ECB80185A9
      6BA5E5E9FD8BDC39D79FBA4ADA4D7C8E75C9DE85B966A762C58AFF0C8A7F4E5E
      E72DA98F51ECC77949F1927A6A5A8871C8AE0D08643FCE642A8C7AEF9E83DF54
      E6DEF42FF07BCBC8E9779C746DBBBB24FFEEB9CC2D27FE66DACB48E42AE571CD
      25FD9A32F7EE7F200BC8E423E7DA8F2819FD564652E62932754DBA4F20A74B91
      59CB28FDCD8D3F45464ED26B47191924E6D287F5934993A3CCF339F571BC4CF9
      E625A740F6F3DAFA4499B0AE3275DC341794C9112667BFA29947DA73435E4E5A
      068172946B620E79CBCABC6601FC05D5A17E79E4B3A0369A177F995CCA222A97
      70D27AA659405D8ECAD14FC7FF05DD9728892745A69E1696AB2953AFFEB9FFBD
      4E93BF0314E6D9493FD9CA8D1A354293CC75969A7F839FF616D19A7B3975D6EF
      D8C662AF61E5CA95F107B67C9E8EF6FDCC9F3F5FEC57637F67BF613CED0BA27D
      3C2C9F3304FEC085D1FE5442CD9A3521D34F1786ACC4595CB4AF6BD5AA55B0B7
      B74791AE63A1D077724E1D9FB5F74F0605D9A3825BC1CC49ECEF0A0D0D157BAD
      141D8740618467563FAFF05F0D310E5372DC6A945E712A6B0CA5A457248A18B7
      97CA34B7BC06B24173C5F858F9F2E5C57E41DA3B55A2B1164A5CE4EF89FE4750
      E4DC37313E534EC2D9D36B0DE21C6B8B718D4DCE66D0DC1E03C51901B9B7CF4A
      D5A1BCE9AE189F2952A785D8E34265D0B87163B00EDD5132261155E2D25022EA
      B3E0A7719837DDCD90DCA12912DA16C53D5B755CEBAACBDFC5695FBCEBCF75AF
      A951167F318BFE98376F1EFCFDFD33F70A57AE01B5C98B50FD72BA18BB287D28
      55C4B1D66E000E58CDC076A3DE78E96488C78E0DD1704F3C58F8BDDC6CDFC45A
      BBEEA2DAF218941CE223D689D37EBC51A346658E799E4B17EFFF34C650E6C009
      940E7D862ACD80AACD1339D7098E9B2866CDDFE983BF678E79FD6CD7B86A98DB
      63FDADB730088843994A55C51813EDE1ACDB5C1BE337EF864EE878B89CEA8216
      2B9BA3F1EAC668E89884D6C35351BAF201A8D58E82C9A8CF5032CC80E2F154A9
      2DF253195BB57744ECF53B30B2B213671C523DA2364D634DBD03FA62D4996E70
      DC6C9E39163468216AB67ECBB95F42ADCE2B946DCBB9033EA3C8A23DF9E92FC7
      B2E5CB276A34D7143A82CA99F6094E9830419CBFA0B36D0C7482B460BBDD1403
      A33AA0FAAE3E6031DFA070264D8C7D14D91007F65F0D79F67506AA699BA19BF3
      5034B21F0B56AF318AF886A24ACC6BE8C42543FF5434DA9D3B815ED75EA1FBD5
      CF500F3809E63014621C583E3BC25D71F44AA8387A4159772ECAD75D27CE042C
      DEA829D40D5BA399B1095AF3766864620A1A1B643FF626C9AB475C4BD94F429D
      CE1750A2DC3E94AA188932EA872063CFFDA9BD23F445B91A4E28A9D61F458BD3
      D8918D748CA750FB34E25450A8F4D7FAB47FEEFF0927DDFFDEAF9039A3AA5752
      43E7D6DA1866A5FB2B7B1BE5718951ABE7E0D5A18D781EB503CF387A3958A390
      DE4F1CBB991BE25DFC317C8A3B840F87D7E3FD9EE598D2C3FA77C61C727D37DC
      B3DC031FCFEF13BC5244CC1B5918FC350D9BD6C7FB2B27B271CBF0FFA97D1DB8
      68A81352B95C88F3F9F685885B3A2A2B8E3FE42F53A57C693C3C109425F3C8E9
      7D71D5678C2C3F72199716EFDACA359451A482527EEFE4EE83CCB5F1FA747816
      5F27ADDAB8B5725CD67DB3DAEA527EF78AD52BA0D30C470CDAEB8C3EC7FBF03E
      6D301C9775CC2F8F8947E7BAE0E3E99D82EB8EFF644CD6AD809859BDB3F88D9B
      8A7D5A89A6CEC6D8FE7C134EA51C43F8E3CDD8767F2536DCF112C8A37FEF67D9
      481D8F0F6FCDE2DA35D20EBB879AE3768EF45BBA9B6343E23AEC791C84855746
      63D6A5C1591813D93DAFF447ADEC6522EA7BCE7A23C5C2411D51A35D0DACBDE5
      2FD229E5EC71C01693CEF515D7DDBD2D73ABC39A8D2B95C4B56D3EB9F25E5EE9
      267ECB572A85AE7BBA21F89E6F16770B87FA68E0AF81E9B1FDC5BD998B766E6D
      3C709C813A5E9F0CCDE25CEDDA532A6B4CB1688C2D5307A29C69796CB8E597C5
      4D5C2A9AC5D1647D932CBF5A3A5572BE1F96A950BC084E7B4FC4FBC8D5823B61
      ED4CD973F2BDDD6D5B08DDA03D4E4794A3944B45551965079587D94EC36C7E39
      EB64CF46E5F0685F4056DA257A46FA5D1A53BD06D5D1B3AD1E46AC1B95C5D3DD
      DF12455B29A3D2D22AE87DD43ECB3F17DB366AFD004BA4460767F1D7A8543EE7
      FBA3183F1FBF644C164F9BD52D517C5C0934F26B80B1277B08BFC927FBE65677
      5C270DEE2D740BA55BD27E72B3154CADBBB6CDE29F12D317030F38886BF3F57A
      E2D7799D5D6EFCD2F1D03096CBBC7ACEF647F55BB6BE53FD6936A83E0C7A3545
      658DF27F6A23391287F37247584F3490D69540497D772CA4F74CD31CE3EBFFDC
      FFFB4E5982BFE2AFA8A06248F85BFE2A45AA4C54562CD7B1207F4556B462E5A2
      26FBA4FE558B5AC4CAC35342A949701185AA13B3FB2A9497F84FE1D7A5C94749
      A14CABF2CA765F4B28358F28AAA8B1A752B10E5FF97FA5F20A2F7545949B452B
      2A575F966D2C4B49372CD3BFCE4E35252D699B2FAAAAA41BADA46C905A4CC530
      5545B1FEAA02C20B574AA5794C0995BA7EB2E5A45EAC7B7AA9E25AD7548B6B27
      542E667759FA4731C5DA33CA9768878A25EDA0C8CAB62F28BC8A62450B35254B
      5456B6FEAAC894251F525428AB5EBC3B4A16698D72CAE6A858CCFA4196D45809
      23552553942EDAFA1BBF2B5350F88ACABA9E6ACA1D50AD64179453AAD7431AAD
      92429D58D522D628AF6C054585FF36CBE44DA9A462DB2FA58BEAC9F6237986AF
      50CC20544DC5FC5969E55677D5945B78CA3E53B6984E4409A5BA4B72D68772C5
      74F79554AA3B376775CB2D7C05E556E14558B5B94514D44656286A189CADDC85
      7F79E79CFCBFE25F5EB9856FC58A55ED08E58A6AFA661F6FCDF4FF791C567E7F
      8AAF448912A5088A0AE5B2C52DF5FFA9BDFC82BFA2A2723D99D8D4FFA9E27FEE
      9FFBE77ED3E6FC77FEE1BFF30F7F72FFCE3FFC77FEE1BFF30FFF9D7FF8EFFCC3
      7FE71FFE0F742525FD6C83DF78B6B8A46FCB0F66FAFAFACFA90F69D4A8516CD1
      A245E9ACACA2F290737D338DEBDF4042AB56ADB26064649405030383D0AE5DBB
      BEA4B61B131343EB526E48E228D0696B6BC74BDB1F81F419E929D29BD49E0874
      3D63C60CD1AFD0772FA89FE23656AC3CFC3CADF1F4CD0AD28BD4A7501A4987D1
      B73BE8DB1AA48F09D4B6E81B9DF40D0AEA03BCBCC41C486F79F8E97C776AF3A4
      8F09945EE2A0B3D9490F90DEA13C922D47E7E353DC74CF756038CB3C032C4FC7
      E51B4FDF94203ED2BFD447D1F73FE89E90949424FA29FA3E08E92ECA0B85273D
      C4CB2C815368E4C7CF6D9778FA2603C986FA46B26548C7D0DA199209D9A3D4AF
      900CA90F59B3668DF8BE08C5336FDEBC9482E66B899FBE4D42FC2B57AE14FDF9
      AD5BB7C4F771C996A06FF11248BF912DE1E8E828F8E9FB2AC1C1C119A54A959A
      C332CF90239DD44D129FA1546EAD5BB78EA7F0943ED2EBF40D5D8A8FCE83243F
      AA33414141E2FBC26447346DDA54E487E445DF33A952A50A9D41D68B556E19CF
      F4E6BD640D57A430659B5B8C29D1586149E2A76F9250BD21DB88EC2FD2EB1407
      7D2B837E29AD54A7A87C48465487E93B2C1131375175E04630DD8160DEF7C0C6
      1D4E67ED82BF32F503600AC3D31853E9C9EDD578FA1E09A595CA93EA0EE581BE
      A74BFBA7A4DF7EA1FF486ED436A86FA77ABAFB641C2A4C8B029B9304B63A269D
      D568B09729149DC14A8F002BB281D7DF1A7EC44FDF0CA17E8FDA12D921D4CEA8
      6FA5F2A6EFBF525953DE288CD44E2199DA3B7478AD5457EF0E1B160D3661EF57
      56A4A8A7A84F456CC1147772FE7A81DC168E2759CB7E7B23A7DBB46993F8B633
      D99F1A46562F6AF89E87D6F27D60455582187D685BDDEA11B38F016B320FAC64
      5730A550CE3D89CB47751CF1E7F7FD03921DD997B41E8EEBB66BAC54C540D66B
      3DD8AC0760F55C5258912A5C264ACF99DAB00FAC022F0B95ED12EE7AF411D09A
      66666679F293DC4866B41E514B4BEB217F1F9ACC34CC9398DB05B0F18FC08CF9
      AFEA02FA56E86B5E965D18ABEECB581DDE27AB0E93D4573AFFD083655F87971B
      66B0CC330C17338FE360F3C2D259D57A975829ED3BAC2C4FAF829833372A847E
      662B5BC8E562E742EDD69C29947165456773EE6985B5D67231EB7A14CC61633A
      2B59E52C2BD2E20E2BB285738BF45B14027F5D56DAF821D30801AB758C976524
      E7F5E265C90D9F427345AC9862FD10A6D08EEB80B61719ABE85D900EFD4547E7
      1AD206B3A692FE5E35BFC0FC1DF00AAD01A4F7D25FC1D4A953D3860E1DBAB76E
      DDBA831415152BE4C54FDCD4F64937939EA3BE85FAAD9CD7D4A7BCE0FD16E93A
      D27FA4FF498F7A7B7BBFA85CB9B21BCB3CB3F127476921BB9ADE69A93D1117E9
      4CE9357DBB8AFA44D267A9DC9F7413AD8FA67E87FA368A77C99225AF2B55AA34
      82E7A3746EFCC4437CD26FADD09AC3E1C347C0C2C20256D6D6E21D98DEEF48A7
      919EA2B8E89AFA65FAA5F759AE6FDFD6A851637CCEF2207E9203C541DC642304
      AC0FC4B3172FF1F6FD07816B376EC277C54ADE5F6D116711539AA94FA5FE85FA
      3BFA163DAD99E6E9B940AFA312BD90C54F32269950BA89FBE5EB3759DC84148E
      E4A7CF309DDB40A49F1FF1BE80D242F2A7EF3E937CA9CFE0FDDB5396790E7651
      597ECA23E599C6169E3C7B8E376FDFE58A4749C9A2EE509950782A1729C866E9
      D1A3C7334ED943767E90C2535AE819732EEFBCB8A5A0B107EAEBA4E52E0571F4
      EFDFFF277E575757D1F7D1FFEDACACF02AE52D5E739EDC40FFD9D8DA0A5B8FC2
      7FA173A82578C9EF070C18902B3FA5854063339713AE0A193D4E7E82A4274FB3
      70F7FE03ECE3FD31BDCF9D3D7B568C41503F4F201BE339CF535EFC24BB57BC0F
      DFBB6F1F962D5F8E98D88BDC3EA3B187EBB87BE71A4702F64784A25B271BF8CC
      76C1F269DD307FA425FCA77786DF1407F4EC6425CEBACE533EBC2D8AEFD1F134
      ACE7F56DC0C081DCEF36DEBC4EC6E35BA771FA5818268F1B864361FEF8783F12
      71DBC7E14EF8183C3F380E4FC387A0A7BD219EF03A98173FD997D41EE98C7602
      D9C663C70C475BA316686BA08119436D70FF6A14D25E5FC7AB7B51D8ECE6845D
      031B2169FF44BC383A199DAD7405475EFCDBB66D13E3769486FBDCB621BBE443
      CA43C4EF9E8D98A029B8E0D717CFAE9FC0A39B6770E17828B41BD581A75D1DEC
      9DD05AC4D1BF9B151E735D911B3FBDF310E7719EFE675C3E494F9EC09DDB569F
      DE3CC0ED234B7163DF5C5CDD39152F6F1C46CAD31B48494AC03E1F37EC76D1C6
      B8B675F068CF788C75E98187BC0E3AE7C23F8AF3934C5EF077092926BAB9E1E9
      C520C4ADEB8998B5BD70CADB1137F778E0F3F3ABF8FAF60197FD221C1DA50D4F
      ABDAB8B17E205C8774C703AE839C9D9DA99F1C948D9FEBE7D75CFF3CE1E52BC5
      B8F1E371FDA017221638E2ECB62938B6BC3B2E6E1C8AEB3BA6E2D1F175B8BC76
      104EB99BE3C8B85638C17F87F6B0C13D6E9FE6C5FF92EC4B5E3E524CE0B672E2
      C965B81432058FCEADC605FFAE3831C71007C634C5C1315A081FD408BB9CEB61
      77FF7AD8D9A71EFAD9B5C66D6EDFF77376FEC62907E6E4279990FCA418CDCB7C
      F7E26E081CA98BC011FA081A6B848D635B21608C01364D34C1962956D838C11C
      DB673860DB545BF474688B9BFC7D86F3FF24FF61C387E329974922979F141B36
      6E848FAF6F36782E5A040F5EAFE6CE9B97752DFD6F31D7CDD7F97B559F3E7D7E
      E2EFC9EDE30BBC4FA2F7DA737F80FDFCFD86BFDBFCC44FC3AB1C5B38B6E7C099
      5CB03B9770B298C732CFC656CA313E406732D3F9CFD5FF00D5243CAA121B26DB
      14702142A13007566A945662C6D58AFD95419BC946AA1A9B1DCA8F7B34AC4AF7
      C2E26CA15E9C1D1852A3FA8E6E15D63E58649D90726CD59384B19A8FCB2ACB37
      5E93356E53AA94E2F2E913F59F9E3B7623E9E8DEC5DEE347189C9CA95F3579BE
      5668A25F9F77EFCE0525BD0F1D732069B4EAD68BFDCA5D9ED15265EAAFF02F9D
      3E492B31E6E4F9CFEF799FF02409C9972EBCBD11B272DFBD55DD3EA59C5A73FA
      B1B7C9D68753D4B73F1E5D22246170F91301A625CE542FA9A0260FF7DC89634B
      DF3A75EC3A717FE176D127DEAF7FFEF405A92F92C1F933DE46CC4A495A667BE7
      D1B43A7B1F0C57DE76A17F99A8BDED4B5EEE545DD1295F99A8AAB2251E331A5D
      3F159D20BE17F1F90B3E71DD9D723B16C90796E3D6121B7CBC1C868CF8407C8B
      9A8F0FEBFBE0B1BBEEDB7303D5AF8738A826386B56B95FAF5EBDC179F12F9933
      ABDE9D8BE74F7E4AFD806FE95FF1E1DE39BC38BC042F0E2C40CAB9007C7D7012
      6917D6E1F3514F7CD93F03E9E1E3F0D2BF170E8D36C248E32ACF5A5B757C5BB5
      89E11EE5220A4A39B9E74C9FA69070FEECE58F5C1E5F5392F17237EF178ECCC3
      C77B27F0F5C5457C7D7C1C695743F0E5EC6ACEBF106911D3F06EC340EC76B3C7
      180B8D34E39E235ED59975E653B969E71F1553601365C6F798D7C205B5AE5C88
      894FFF9A860FB11BF16AF7087C4B7D89EFDFB89DFEF11ED29F9D43DABD03484B
      D88EB4332BF1F5C87C3C0F1A850D63EC30BC731BD876EEFCBEA1DFBDB7B516C4
      BEAF3BFB421A1B75E8082B51DE8574CF92258B6B5D4FB812FDFEDD5B619FA726
      EC42EA95106E877FC3B72FCF91FEE116D29F9E41DADD487CBDB2155F4E2DC7CD
      0D63B17E6C478C1CD6174E6BC2613B7ACAF79683E7A6D6F14E785BC7E3F4E7E2
      8B92139856D78D9C7F08B7DD0FD398A0D47DFBF21E2F760EE0FCE9FCFA29D2DF
      5F477AF269A4DF8DC0F784CD88DF3805F3073B62D2124F0CDA7B063DF65E86E3
      F638B4B16FFFBDD998359F1A06BEF9D2B0A565122B5D7925BD2387EFDEDD2362
      4FF8C5E4478F3F7C4CFD888C8CEF488D0BC687ABE1C8487F89F477D790917C12
      A93776E1D0DAE998E33604F3766DC3D091CE70093F867E9117D125340E764117
      61E7321D6DAD1D3144ABDA2BED524CBA0E8AD5AF574F7DF2D01E432FEEF2B97B
      37EE2C5E735BEFF90E177CFFCACB20F53A5E5E8F44C8CA1958B66621169F3D8A
      79F7EE61CAD12318E8D2072E4713D0EFE27B745B1D09BB2E7D3167E20444F9CC
      FF3EB136F32A5524738CCCB95DD552E7E7355FF5EAB4FFF3FBE72371F57824AE
      058EC5C73BD148BE7F1E5B57CDC152DF0598BD640E7CDF24C1F37602E63E788A
      D1617B30C06723BA7A78A3B75357F871BB2F3E2A1AC7B76EC156EBBAF7354A66
      CE0D73FEB249AB0D36A53F8BA302465A32E78DF6C5A1A543B062F922CCDB7700
      B31EBF87FB8E60CC0FF687DFD70C2C4D05DCAF729B67B23B260C73C185E8E3B8
      121D85FD8BE761A76DBD94F9F5D9A6EA2A3FE69EFB1A57507BB6CE22F4EBDDBD
      F8F4FC028E85ADC4B2992330376807C65D4D81FBED3758FCFE1B66EE08C1626E
      5F2FBE740923C78EC7724F4F5C8AB988B381AB10D9DF1C2B344B1CB0AFC84673
      D9D4A06575D926418CCA553ABFC46AC3C1CD5EDF7DB6ECC4A09DF198E2B50C33
      AE7E80FBE3EFF07C05783F798641D367081B7B4F58386E71FBFFC4E41E086B53
      E9519F2ACC95A7594FC2FB531B5EB9C65F63DCF8896BFBCD587ED336F4C3F77E
      47DEA3DF9EDB70F35E83E9D75F63DEC3D7F058E927E6FDEFC59FC5ADF50BBF6E
      D02B7973722DD1AFD3815A6AB2EF8E395DCF9E3DD5A64E72EB6437D66793E6DA
      E4A42E3B93BEF509BF8FD1FBAE61A2FF06B8797963D7F6ADB8B06E01CE0E69FD
      A6774536B7510966C632BFFD516027A9A2A2C26AD5AAC97A3A7568A83F71EDD9
      169B9E3CEC1CFEEC9BCB025F4C9BE785F0C09538E7A2F3CD47BFDC0EFDD2AC13
      EFC82B4B787FB94FEFD4D9A943A3C981E1AD7B0E3A35D7BEC1A7DDFD5B3CDB64
      A61263A4C674257688CA9FF4B33ADA2D9A18B536D9A9A9A5DDBF7D03D5D14EF5
      94FBA81615764E99FC642CAF2B5BB64C25FE3EDEAE52A54AE5A4EB2FE59D7391
      75D164B0976FC854EA7510F74E3A235988CB4D56728D0A2BDEA1182F934C53D2
      5912562C9E94092FBD0E28798E8DAE7D8499E98771EC62F56AF614CF3AB35AAC
      53710B338BF22E1E66CCCC634455378F553A3B3D2CED2D3C9C1AD6351BA45484
      91FF188E0D1C74DDB678170F0A4FFC758AEB8867BD8B6EF6985476BD87B3FA1A
      8ED51EDA657A982929D15240FE0473F6F0601EC809E28B1603A43FFF4760994F
      E7FAAC19EBEE41A6AE8A1858CC0CC39815AF69BC3A2B1AB29CFCD26B594ED96B
      95063B59BDE6BB847C04BF52670FA6D280752A3A880D531C27C2D4529FCACB95
      9B18453533D3AC3AD2C343BD9BB81EA7D8C68364C5B83CCD5807097F657E6D9F
      C9EFB288556A3B96D59384EF50BA8747AD6A2D45B990EC449CBC5C6AD51CCE28
      5EBA27594AD363A164EE9159D63FE449F9273908FE1017A6E2A423E4219EADEC
      EC61D6C28C91BF85D3845C6548E54471E6257FFA8FC2E457764A3CCE7A2D1DB2
      EA8FB46ED0FFCB54EDCC483E743D4EE26FC616730C116189BF43A34D66221D83
      781DD3CEAC6384DDAC96597EF5395A52DFA37F6A236B38EC85CA31D30F15759D
      A010C3DBC820F6D3734C4185CBD022D73C9A3B99792887E45D3FE9F90D79D4CF
      2CF9946FCADA16EFEA21F59382EEC73636F318E894C9BF8C39474BFFA3EB9CFC
      399F95F2539E49AED2F052E455FF6539735EE7F6AC3C61FE84DF99F56463D8A8
      7CF3F827F2612C8297EFDADFD23FF2942FBB7489311797CCFE91B7B541BC3D90
      FF65951016A3E4F4537D93ADABB27E742F85ACBF33E7EEA0D3C58CDA0BB5E371
      8D7B8A3C6E575AE53157D1CECC5992465948DB5AB41830A865467E742F05DDCF
      E67A9BD2915F1E294E6A47BF231F8A479A97C2AA3FCEC29CD0623FD296299F31
      3A1372E52739501EE5E72FC5735B5984A7FECE5952BE662EDB72E597E6515EFE
      FE591382B2F57334AF9F930ABD7E66C987E9F3E78D441D585DD9CCC3B714B59F
      CCBA34C06030D7CF5DB3D51FEA5BDA161F5460FDF1E0FECE39EA75680BC6B656
      CEFCC027B5857A63BD840ECEA66F796E95CA5BCB5DFF4D8DF531A8475BB4D2D7
      465787D6B036D717D7348F9FF39AC24941FE9D7AF411FE160EDDD0CDC118C6E6
      36E8DBC32E2B4C26B739D262C723D8B313EE45BAE0F8863EE2DA73BCD54FD714
      4E0A2BE3F998EC7E077346CE84B1E3631C5B3B094D0DCF206EEFAAAC30C43DA8
      A705D2E2A6E48AF73736E245E2F95CFF8B6BE9C0D11E7787F4441433C34BBFA1
      99BFFE23B2C210F7A09EED9076D943E0CBE5F97871E788989B7B7E2558AC15A1
      F52737E2A3F13E6E6156387941DC837A59F1F7FEF902F72FED11EB1368CE83E6
      0C690E84E6DE69EDC6C9835B9072715156D89C7878653EFCCECDC2AA73D3B12A
      6E92F8B5EF6689C1BD6CF0F59A176E9DDB26B8689E8ED6E1D2DC19AD73A4B901
      5A3F40EB457606AF166173C3B9580FE8EFB687C6B6A668B4AA3A9A2EAE032D6B
      4D0CEE6D87AF377C1017B51147F605E160F806ECDF1580BD21FE08DFBEE62750
      D8DC70E392371C370C44B3D9FAA8EFA681BA136A43D3BC39E7B7C7D75B6BFE18
      693757F377652FE80F58899ADDBDF09FA3079A1872F9F4698FAF77020A05819B
      FDD182F3FFD7611ECA584D47237D0BCEEF88F4FB9B0B05EBBD17A245C7B95077
      988BFF6C67F0F6D00E83FB7640FA831D8582355E8BD0C27A1AEAD979A0AAE514
      3431E0F2E9DB09E98FC20A01BBB17AA9378CEDA643A3DD3468188E86964E1B0C
      EED705E949913F21F1F9C95CFD09EBC287A1D6CEEA6838BD0EAA07AA21FAA1A7
      F05FBDDA1FB63D3DD1CC7C12AA998C476392BFB313D29F1CC9869329D7607FF7
      2D6212A27FFA8F703126000E93A6A1C5F0F918E935038FAE6F11FEAB7D57C3B8
      FB4234B09A84BA1693D1AC9535E7EF86F46727B221F1751C1CF75CC5A3FBA77E
      FA4F8AEBF1FB71FE6C249EDE8DCEF25BB536087A7D97A29EFD4C6870F96B1A71
      FEFEDDF180EB855391EB70E5E4567C7B19F3DB58B33200FAFD96A34EFB596860
      3105CD0DAD387F4F78CD190F9BDEAE98BD3C00DF78DA9FDDBF80ABB147703336
      42DCCB8B35FEC1D0715E81DAF6B3A0613D039A249F01BDF0E0EA516C3EF71C2F
      9EDFC3B794AB3872708F58C71519B651DCC7A5EC84C3451DD85FD641D73D3A08
      4C992BFC73624DD06EB4E8BF0A35ED66A1118FA305C967401FAC9F7C11F1AC05
      5C8DCFE0DBBB3B9C7F9F58FBB663B39FB8BF71E300ACC70F458D8E3360307426
      761FF515FE39E1E7B7152D7A2C8546FBD968C2DB588BD6B6183CB02FBE4F1903
      F472028C0D90F1E101366F0A1073FD5B37AD11F784B884CBF00F8B4278D4992C
      BF9CD814180ADD6E5E686CEB8EC6BC8DB530B685DE601DB44DA886CEA18D6176
      BE34CC5F1A4027A40EEAC6D546B3178D10F7F930323E3E910B21614760D87B29
      1A594D417DDBE9A2FE685A3787FAA6BA2875B62ECA87D544B5153551697B1DD4
      F2AB03DBD9CD71E35E3432BEBC960BFEEBC3A1DBC30B75CD5C51C37E2A9A1B59
      A1B98915AAF59C8FFF3ACEC17F5D3DA0DE6B16AA39CD418B4E7311B02912195F
      DFCB890FBC7C0FC2A8F712D430198EAAB663B97E6BCB7584011A1BB443233D0B
      AEAFDBA1692B2BA197B4F8B57DFB4E183C78A0DCB0EFD0157A26B668AEDB06CD
      0CCDA1A5AB5FE0F7514A952AA558A74EA5FAEDDBB71C606365116763DDF6AA83
      83C1F03A752A37A0FF7E77FCAA787165857AF5D46BB736D61965636D72CECE62
      689A63DB0038B65D0F3B8B916936D666678D8D75C6D6AB57AD818A4AB15F8A47
      43A3562923A3666ED6D68631B696BDDF3B9A84A1A7C5650C717828D0D33C018E
      267B60673930D5C6C6308E87F568DCB856BEFB7754554B28D7AA5545DBD6D670
      968D9555B29DF9986F0EAD0F7DEF60F8183DDB266370FB24F4324F16E8679D8C
      CEC64FD0D5EC113A98447DB7B798F8CDC6CAE6057FD6B356ADCA7A9CAB988C1C
      8AF23CEA9899697B70DE1B76E693BEB537DDF1DDD1F0013A183EC942C7564FB2
      DD137A5924A313F777347C040793B00CBBB65333783CF7CCCC5ACCE39CADB8DC
      948D8D9BF970F9DEB0321DF9A59D5E18DA1B5CFF89475EB437B88176BABBC1B9
      D26CAC4CEEB46AD5CC8720F8CD467EB1D0D98976DA6761A77B178E064972F352
      587AA69D760C2C7442C1B978F99BDC26EE1FF269E16EDDCEF28595A92B2CF5D7
      C35AFB12EC74EEE51B8FA34132EC75EFF3B097F93381B0321907EB76562F38D7
      6C924FF1E2C5942BF3F7093BBB8A352D2C74E65BDBB74E6DEBDCFF9B65C7EE94
      069ED7ED68A7758973247219E79085DE43FEDF6511C6CA6C04E81973E7FE19C4
      415CC449DC3636062BACED4DDEB619EA96A1B3EE1E9A1CCA40E383EF61307F3D
      DA3A3BA39DF50058EA05A25DCB934206F67AF760D5F254A61FFF8FC250587AA6
      C9C10CE8ACBD07CEF59D3805B7B581B795A3E55DB351B3BFE9FBC4A1C58ECF68
      1AC9E3389A8E66610FA1B7781BDAF61F0E2B7317B4335C2640D7E447FF519846
      3C6CD3FD19E259FDE571E05C19C4C9B997962B57BA54E3C60D5AF2B6E46ED9B5
      D35BB361D3A1EF73119A61DFD1E4408678B6F9AE07D0F50947DB3E4361DE7300
      F4968670BF44343A962ED24C61F55626C06CE46C583A75FA6067D7CAB3458B06
      3AC4ADA6A65A5253B31E6F5706B3ECBAEBBCB71CA9F7DD72B001DA8C9808C3C5
      27A01DF45CC4D3F8288F2BEA5B26F835F16A05BFE2614EA2CDF089B01CA80F7A
      D6AE57CBF79C6B36E7D4E5FCAAB6B67A4BEC3AEADEE932A1D1B7EE1B6BA2CD85
      263038D912A6CB756131D21C6D5DC6C2D0F310B4B6BD163220D0B5A1E7619E86
      C9301FD50EA6CB746118A52D9EED115C039C2B83733EB0B2325C4E65606BAFFF
      B6E3E8A619FD77FC875E272AA3DDC506D0BBAA0D83132DD17A9D0E2C0758C37C
      C028B45A102940D716DC8FFEA33014D622BE217AF2678983B88893B84947A8AB
      57AC6E69D972AE4D7BFD8F1D4736FDDED7BF1A7A1CAC0A2B1E8FD1D5E6D0BBAC
      0DE3609E1F57FE2E3A4A1FADD7EB423F5E1B46D79AA35D9C06BA1F5247BFB5EA
      E834A6C9775BCE6169A9B3D8C848B75ED9B265698C9EB72F75DD366D343DBA3B
      B57931D3AD0F468E76A43CA2D7EA9AE876589D733480E1354DE8C76A0B185C6F
      01CB780D743D520D3D79180A4BCFD0B3DDBBB679415CC449DCD4861D1D8C6ECE
      9ED8F1CBF9B0C9488ADB84BB319BB171F564380FB6400797E6E8B9BE3ABA1D57
      8739970181AE7B06D610FF51180A4BCFD0B3C4C1B9D23A704EA9FEE1FCB7E6B8
      754A3B1F3A0E4F4E2FC4879B9BF1E9FE1EBCBC1E86BDC1F330C2A503BABBE8A1
      F7B29A02744D7EF41F85F9747FAF78E6C9E905B8C03988AB83A3D12DE2261DCA
      7585BE9999D6DC1E4E66B73DA73A7D3FB471245EC52EE3CF0489671FC66D45E8
      C65998E6D65B80AEC9EF53E25EA472DE571797E3307FC6736A97EF3DBA9ADD26
      2EE224EE1FF3E4258AF1FEA5A59D9DE12C1ECFD359133A7E3FBD631C8F670952
      6F6D47EAFD08245DDA2140D71FEF84E04DEC525CD83511732775FADEDDC9ECA5
      9D9DC122DEBFE8105741FD23EF17DC787F7461C420EBD4431B46E05ED43CBCBB
      1E8CF73783F1E0C4421C0D1A89F1C36C3FD9D91AC6F3B0B30AEA1FF3ECDF5BEB
      8CE26515336954FBAF3B560E4608C7B4310E5F3B75303AC7FFFBADFE3D37FBC4
      C14167A0532793CB4E9D5A5F2F0CFB44D6D5AF5F9F8D1C3992CD5EEDCF941706
      3136761973ECD58F152BF6E7EB7E74757599BBBB3B6B68D781D5DA7692B1935F
      189BBD9FB176CE8C55A9FDC7DCF4ADA4850B173295C113193BF29AB1DD298CED
      78C6D8FC68C6BA4EE3022C2B379FA2A222AB56AD1AEBDEBDBBE0A46F31EDDEBD
      9B6DDDBA9575E8D08115AD5687F327F1F41F636C4A046393F630D6CB9D576EB9
      96E5B0EAD5ABB3F9F3E70BDE83070FB243870EB188880876EEDC39367DFA74A6
      AAD184B10D17199B7990B1C97B199B758831F748C61C47CAC5DFA3470FB665CB
      16C6DF8DD8CE9D3B05EFE5CB97858C286E56A408637DC733B69C97C37C9E8759
      0718F33CCEAF797C7AD605F20F1C3890F6230939A9ABABB3A0A02076F7EE5DE6
      E1E151B6669D9A739AEB358B6D61A819AF69D03CBE8976E378355D736DB694C7
      E57B96B179FB186BA8972F3F7D37A608A59126EB2B5562010101E2FB671D3B76
      ACA963DA32CA6DED3878844CC38C6D93E0E235006AADACFAB155318CAD8BE5FC
      3C2F1AF2EFDBECDFBF3FBB76ED9A907FB972E56AEA9BEB4511B7D79139587070
      265CD7B840CD88F3075F676C254F7F7D1D2E3FF9A69FCB9429C3A64D9BC6ED2E
      3B3AEF85292B2BD7D46BAB13356DCB04CCDD3F1DEEFBDC306C457FA835D5EEC7
      9C463156F9D7DB41D9F265FBABD7AEEA41A85EAF9AB74907A3C449C1633073CF
      444C0973C560DFDEA8A55123AC52F50A1E15ABA979A855293743B58CAA2997AF
      5C6B09B48D5AC44EDE301E13035C31D67F38C6058EC0B45D6331297414C6ED18
      8AE11BFBA2DB7C7B749A630507F736301BA6FBBD6683EAAB795E4BC975DE415B
      9D78CFC3B330EF0097C75E374CDB3D0613778E80EBD681181ED4078302BBA28F
      BF23BAAFB446A7E56668EBD6123535AA07727EB9F4B44E1BEDF839915331732F
      97C72E574C081986D19CDB65532F0C08E8823E7E0EE8BAC2121DBC4D60BB481F
      46639BA046836A79F2932E6CDCB8B14093264D584B33ADF8197BC663F2AED118
      B77D0846053B63E8C69E705ED789DB15F670F2B540FB25C6B05AA88B36739A41
      67441D546F50354F7EE27DFAF4297BF6EC197BFEFC3973707018C1E14D68D3A6
      4D4093560D1F3B795AA3DB4A2B745C6606732E0F0D0D8D835C2F79132C2D2D17
      F37ADC262F79509A8997F0E2C50BF6F2E54BF1ED3CFA86DE8103076A3632AC1F
      E530CF0C8E5C1E361279585858F4A3F69D9A9A2ABE7D57A3460D961FBF2CAF94
      FBCD9B37B486B9A6867EDD282B77032E0F1D98913C46D6A5FD6CFD3A75EA24B8
      CF9E3D5B20BF949390929222BE8F387CF8707AAE663DED5A51AD463685E1040D
      B474AD85C6BDABC2BC8D69BF0D6B5733333353A14BF2E36FDAB4A9482B81B8DF
      BE7D2BF4A6BEBE3E1B3EB057B96AB5D4C7D7D1AA11585BBB5A602DADAA81359A
      5609B431D3D5BDBCC7878505AF137A91DA7D7EFC525EC293274FD8B061C3D880
      BEBDD8219F116C7FE0DCE267A222CA705994397334B8CC99F069652EED5FA8F8
      34CA9BC5872C60E3C78FCFB7BE376BD68CBD7BF78ED17723E3E2E2845EB3B1B1
      610BDC06B1C4C8192CFD4D0203C091C1F02E96E1F13A86E48D0C49DBD983C8D9
      6C6B506081FCEFDFBF1779A03A44FD4AB76EDDD8E2A92E2CEDC67C8667DB18DE
      C773EE1886279B39BF3FE7DFC4AF77B0F709EB59E8B6A002F93F7CF820EADAC7
      8F1F453E78BD610BDD27B38CFB5E0C0F381EF970ACE05825493F8FE769084BBD
      13CAB66FDBFA3F7D8FFB0096797ECEAF6031471B39B86B72FD134FFBA8C43E98
      E7CFC51E23DADF2DDD3F4B7BB2681F17EDCB22D07E2B9AC3E26D4A9E6F33D4E4
      ED375E969738A5BCB4FE9420E525D0FE5FDA27F4ABFCB4DF94E6C1A4A0B32568
      5F2EC543FB8CE84C7D02CDF1D1793BF2F2F3F62BF691933CA4792079C9EE21E7
      6D1A521912689F3DB7BBE8BCBB1A39CE1350CC8D9FE44B7B93698E90644BE7CF
      D0B9FCB4679ACEBB9162EAD4A9023446DDA851A33B1407E5430A261672FDCC4F
      F2A5F453DA689F20D79DE21C0F4A27412A2F3A8B896444F393B46F8970EAD429
      714687E47C9BC539F979FB8DA73D60B44F9DB8E9BC1ADABB42D7241359D95039
      51D95399CBD6037A9EF6DAB19FCF7715FCB4A78E9EA13CD03E6EDA934EBFD27D
      DD04D9F303A4FBF869CF1FCDE34AF762E6C54F711317E577C78E1DE2FC23E2A3
      3453F94ACB98EE899BEA29A59DEA03A589EE693F756EFCCD9B3717FBD4A57B27
      698F389525A58DD248E71910680F3CD52DF2979EE520CD17C54FFB34F3E3A7BA
      48DC7496D0B871E344BE29ADB272A7F8A57559B66D936C684F7E6EFC9A9A9AF1
      F41FA59FCA897829FD945E8A4FDAAE48C694769221953DEDB1A46BAA379436DA
      3F9A17BFECDE716A0774660571935CA9EE52BC744D699005A59BCE00A2F491CB
      855F9DB7938BC42905A589EA0FCDF153BA281F945602C9597A461381EA0481CA
      390FFEA22A2A2A63791E02A5E0F185D8DADA3EA5B2255D46F295EA39691D90EA
      3A29280F79F0E7AA934C4C4CA248B7511CD2B309A4A0BDB9D2F37AA4B2A13849
      E7FD0A3F9DDB202DF3DC40FF113FA581644A7B85F9B363E5E13735358DA2731F
      0A72D4E6688D04CD296A6969BD96ECA72A70EB12B7DD8E529A64CB3D27A88ED2
      D90723478E4CE57AF4347FCE52CEFE5895DB7B23781C748643AEE0F20BE4E90D
      AC5CB9B21F7FEF1A2639A3E057D6721793E36C9A3239D7E1FF2F7424D77EC58B
      175FCBED9828429D3A75E85C88B51C9D25E703FDCA79404D2A56AC38B0418306
      548677DCC68F45E03A3F44ECD98D153ECB11111A8C47D7CEE36AEC192C5FEA85
      D6AD8DEF282A2A1AC8B13E9DBFA2959BC4DF796EACF2F146C4CE209CDC1F82C5
      73A66270DF6E18D0A73BEAD6AD8BCE3626085BED81D321BE48381682D34722E8
      4CA07BBC0E75CE2F8E12254A741E3BC6F5DDB1BDDBB17DD53C8CE8DB09AD5A36
      C5709721E20C17DAE74EDF4FAB5DB3064C8D0C3072687F2C983E96879D8B837B
      777DA738783E6CF3E2E7325DC7DFA7E0D4BE1D4C5A1B8B3978D29BA42FC99EA2
      FE9EF6EB533F44FA9EF626D37EF5568606701DD803C19BD683BF932471AAAAB9
      F157AA5469D632EFA5183A74287C7D7DB3F42E81FAC2D6AD5B0BBD2C75D49750
      BF46BA81CE29ECD4C1110BE6CF83A4CC7FDE7F514CD96E70AF4E883A1429F8C9
      DE219B8640E7B9D0798A620F14D795A4D3A8CF919E2B437D911BEF2F66CF9E95
      DF591C5A5D2C741E6F5C301AE74E458B74911D41E70091AD357DFA74915ED23B
      D4AF519EA8CFA4707B768762FFEEEDD06FA99996CFDE8CFA86DA4D2FAC9FE382
      D05533713462170E1F3A28CE3D203B91F423EDB3253BE2D4C913D81BB61361DB
      362064BD0F82BCA761F1F85EA85945ED5A3EF553AD59D3A65BB76DF4C3CEA5AE
      38E037153B57CFC1D6005F04FAF96273A01F82D6ADC29A25B3B1CC7D34964F1D
      8C656E7DB07A4A1FAC7777C6D83ED6502BABBA2DBF2156AE336785878767C41C
      3F843D6B66E2E0AA09D8B9681802F9F3CB267483F7F86E583CA62BBCC67687E7
      F8BE9837BE3F96CE9A88CDEBFD3065F224942D5B765C41C394BC9EBF7B407674
      EC591CDDB305DB562FC09A79E3B178CA10784E190EAF99E3B074FE4CACF4598A
      E0CD4162BD1CD94B74FE93B2B2B25D01FC9663C78E7D44F59040F62EC93A2C34
      04EBD7F92370FD3A046DDA44672F0950F9D339447436A3A3A3239D2FD1B200FE
      DA6DDAB4B924CB4F654ACFD35A3E29AF1474AE9FB49EE9E8E81C171B280AE853
      B86E3B2A2F3FD52D3A4F90CEEDE0EF16F4125F4E0E1DBA86EC9182F8E9CCC35D
      BB76097E3A1381DB50F3E4DC3BD483CE3594879FD64152D98E1F3F9EEC865E72
      F6018DB88E7E4DB6417EFCD4AEE90C444A3FB7F51ED27E4779A71A785E870C18
      3040C4915FFAA97CE97C2F3535B568C9FE35B9A73368BB938585453CD76DDFE8
      CC19D279DEDEDEE23C265E873F595A5A26F2328DE1FD8AA79CE59AD3D160BD56
      F9F2E51768686884F0BEE528EF33432A54A8E0CBFB11FACE87E92FA6392F47F3
      881525EFD115257DF43FF7779CBC36675E28929FCDAC5CB4E808B532AA81E555
      4B06962F5D3250AD74A9C00AFCBE62D9D28115CB950EAC54BE4CE07FE5CB0656
      562B1758A542F9C02A15CB0756ADA816A85EA9426085B265028B282A76CC87BF
      7CF52AFF057B4E188EF92E3D30A34F7B783877C0FC21BC3F19D10BDE639CB1D2
      6D08FCA68DC47A8FB1089A3F09DBBCA663E7B259D8ED3B0F63FA7441C9E22A93
      0B908FA34B2FA7A7E7B6FB61FBDC71089C3C089B670CC78E396310B6C80D91CB
      66E2C8EAB9381EB008E7362F47DC8E3548D8BD1EA736FBC2DC409BCE5D2DE82C
      AC3215CB97DB7E72FB3A1CF25B884DD38771FE61D83EC715619E6E8858360387
      57CDC1F1759E381BB41C17B7AFC695B0002C9E38EC836A89E293E4D9874AD33B
      039D1C407908F39A82CD338763FB6C57EC5A381111DED3057FF45AE25F26F8E3
      43FCA051AB3AA55DEE734DAB56AAB0DE7FCEE48C939B7CB1CB739248FFAE8513
      B06FE9341C5A319BF32FC4994DDE5C463E9832B03B9D7BD2FB97148FA2A26147
      0B933BFBFD1621C2671676CC1B8BD005E3B197F31F5C310B51FE0B7072FD626C
      9E37110D6A548DF98DBDA325CAAA96F25E3A71D837E2DFC965B373FE04EC5D32
      05077C3D70CC6F3E0EF07806B46F9B56ACA8529FDF6C6B9A3A8DEB5FDE3E7FA2
      A84BDB668FC1EE4593B0DFC79DE76136168FEC9B5145AD6CB0647FF16F39A522
      4526B9F56A8F0D538622C06D10B67A8C42B8D764EC983B16367ACDC81EF9D36F
      ED956B56A7DAEBA5C3BAC1776477AC9BD81F41BCCE7A0EE98212C59477FCE2BB
      57AE4E4559A99F9389F6676F972E220EEF615DA1A751EB83E4BDAF305CCD7A55
      2B46B9F7B6C3F2E15D31D2D10CE5554B14E6B7328B2815511CD6B3ADEEDB0503
      3AC0A051ED3B8A0A0A8685ACB74B962856746F6F73BD2FCA4A4566FC467D97C7
      B5512D5ECC8B15EE797E396D9652AC90CFB0F9E7FEB9C268C3D427FC256E056E
      835B952B539ABE5DF4DF5FE0AFDC54A35ED84CD7A1DFF9F5A4C2262F515CC579
      D6B8E1690F4E1F44175BCB44F667DF45FE49AFE96936BD16B33B180F4E1FC056
      9F05E915CA95F52E8C7E45E2FA794D1D8BFB27F6E1CEB1DD880DDB849E0ED6C9
      FCFDA530CE8B6DA4DBBCC9D5DB47C370EDC0769CDFE18F131BBCB169E134D4AE
      56651FFBB373328AA9962CE1EE3B73E2E78488AD38BB75350E72BBED80EF2C1C
      F5F7446F7B0B1A47FA933C68B4D16F197F64E30A9EEEB5FF5F7B570215C5B1B5
      9B55105416518928B8E10231E853DC9238A222E0861BB802D1A8246EB8B38983
      0B2A0A832B2A2AE36E1445D1B82B232ED19897791A9FE68FF985242E89624834
      6A6234F7D59DA986A6E99E8D697DF171CFF9CE4C57577D5575EBD6AD5BDD33DD
      703C3305F2D2E235B1C92912FBEC53CC05C7EAF6FB4D1D077712D367CA67C0F9
      EDABE1F0CA7924B69D0D79242E39BA92F0AF4D01D58654183728F82159373F30
      414F4D82DFEBF0F8C48665DAD890C43A7B53A643DEB2384D6C789AC486E7B297
      C1274BE2C0A749C31306DE4F28BDD743F63059CA0524D65F355F1BB7254FD2C6
      9E443F6CEC797E733A81022684F57956CDD6C6E067035B5858F41FD4BDCBDDDC
      65F1B09DC46A18FFEF9A3759139B636C7B7CF53C4D6C8EDC5FEC5A0347D6A440
      7B1FEF9B06EEDF5DEBBBB96C4D9D14F9727342346C9A3D06B6904FEDDE622689
      CD13CBF6162436D7EC2DF66D80358953C010BF6165651932A0ABFFAF1B63C7C1
      FA699124DE1C4D62C168CDDE68BF66EF92A8D91B1590BD11EE2DBEDC9D09D7C8
      DEE86AEE2668D5C4F3B2BE78CECDA9C6F1E87EDD207E7808248EEC43F6760360
      E1D830489D3052B3B75B35732CD9DB4D207BBB18D842E2FE5DA9646FA74886DC
      950B604E74C40B5B1BEB39BA620B626B5334FBD21AB82F65F7A68E657B53E7B2
      BD69BDDACEA57B53B2D7C9767371CA227B92FE7AF6BFB695D857D7D0C35D2555
      2295C844E067248F9C9663E8756AB9167D40189D8ACAF2E81512134CC732187F
      E4338C875A7B8C5827820C28CBA3798E7C940EFE7C6D994882445A3E855B5600
      6C1B32A0ACAC7D8C08BF8A613693F31B695EECBFB74A4FDFA90E514F919C3A04
      FB41DA5340CE1D21D8001C5D1932867EDA76B375849508D441F89791734B0866
      19CBCF4A94963B8E9475569263A7F2E74A6D41CEB3256384E83495F06BDE712E
      9360AE90FE36E6B7DF8B71AFA9D640FFFD195344CE8CEF0C1A18365704F4AE53
      B7DAF6A78502D3C9CBF8310D6B53C2CCEA0E4C52901611FE42ED54308981C0AC
      0B07A6BB373B365E06F3CF25BC39A381391CADAD43480FAED595CCF46EDA3AFA
      F800E3ED66D8FCEAE455C44492366F1CA6AD438C1FC71BEB60FB9142E630D627
      E61F3C9CD49AF31903B4F9B10EEC07EA4A77BB14A565D9FE080179D93C6C9DA8
      2B846E5F57DE3FA3AE84807AA9E89FA30CE0966A7DA9129E8455DF5B85D78861
      6E5BBDA2FCE7CB23DA25CB47B6992B1FFECE1CF950DF047958AB78F9909671F2
      41CD63E5039ACD9287369929EFDF7886BC5FA3E9F2BE5ED3E57D3CA7C97B379C
      2A0F6910A341B0C79432D49F220FAA3F593EB0E646AF915E6B651F06C429877B
      66CAA24246AB877AAC960DEB36521DDE75B87AB0DF0465688F00185C7785AC5F
      CBF1CA50CF8498FE0DE3637A7B7FA81C505B21EBD6B63D04351EAD0C6811A2EE
      D622581DEA9A2EEBD63C48DDDF255DD6D33352899FBAF80799817FBCEF0E59D6
      AA7458B76219AC51A4C2EAB425F051E470183F321C14290B207DE17C58367F1E
      2C4D4E862572392C9E9B048B939260D19C39909298080B13126160CF5E30A047
      202C884F80057109303F2E5E830F9A296509012765C53FDD032EE6C7CF84E4D8
      E9C04F17C3D4E86898327E7C8574E44EEA795AF6ECC923E0222529161624CE06
      7EBA18664C9A08D3264CA8908EDC55FC6F36BFD4F629F5FC12F30F6106F98776
      C43F7CA00C7525DF45FCC308C23F2620D644FFA6E5D7E57F74FAE716B195F6CF
      556BE0EB45955489F4E2EA695CBA71D2A2E9BA9B76D5924FE2DF58B4298EB5AD
      AD120EF836DFF7DC7456FC1FB2A5E637021DDA6CF85760D7A360699975DDD666
      E0244BCBF4331DDB1E84C0F78F3F29CB6F6FD46F502C2C7C87324CC7319AEBEA
      D6F55BBE556FF975078773606373151C1D2E829BABF281BD9D37FD0D44E3F72D
      2C02E618785BAA7BB56A11997676EBAE5B5BF78A2DAB2FE3BA73DD34B2CFBD08
      CE75D6838545E6036D1FF1B90EBE83ECECB616393A7CBC9961DEE9C7F69B2FF6
      76617302DFBB08437A5F02EFC6F96067B7A6A88CFF2858BD3593F0E783E55B49
      843F179F4FDE14CFD9D9C59D6CD6E8348474FB0C42022E8373ADA99B2BDC34B2
      EE1C3128F8E2F3E89157A0F33F2EC1B8E16AF0F13E4DF4313187613CDEB1B0C8
      7A50CFFD24E1BC04F5DC4F11FEDD44F75E9DACAC3EC8F4F438A6C9DFA9ED25C0
      F21183BE047BBB81732ADE87ADE3D9A1CDF4CC80CE5F68F275697719427B9D85
      3AB573C1CA4A49CAEC27BC47A05AB583A4DE4D50B3C65E08EE764E930FF377EF
      7219BA765C98E354B3D13BBAC7C0B9B695A56D75E75A4111FE7E312BDEF397EF
      ACED72F889B5F571A8E1780CACAD8F92CFD3CFBB765C70A0439B692BDC5C43A3
      6D6D1C6B6339D36CB501B1FB13441F57A00C6788EDB70F36CFFCAD49DAB5F53A
      DA0EEA9F613E23D87F87611AB634978768DB5E7EBD6EBD4384D7ADA9B3CB86A2
      D67EE977ECECED6B9B8BFFEDB66D227C5BFB47E0F7FA1E4DDFF77FB74B74353B
      BBDA55BEB94AA41662D4C085B979F4F1F2CBE96B83103FF7B3B2BAE073897D37
      955B1F8F2975185BC698FCA6F6995F4E686C2B3B66E6D2A3B13CE6CC6FAC8D19
      CA6FAAFEFF5BF8CDA91F73E8F375DAE7AB9E5F52FA0773FB37A9FDF3AB585FA4
      5E1FA55CDF25960446FB4A0DBC9F88BFE9D7F57F07BC47BA8800FFBB86FF8D30
      E4F793D9DAAE9542D77D5B152F6FA481FCD8963D04317AF8B1FD67098E103C36
      825FCEF98E657B0BDC8B0D27B84939F1F7BD8546F0AB681D6A5EFF85904BCB94
      18C1CF2DCFEA2A9B075627A6E89FFEA648D3FFF17AF47F83F6F39989FAD7673F
      A6E83F97E63D6B80FD64D139F0C004FDEBFBED37F2FF40CBCC65B4FF97F51480
      8388FDE4EB6913E6639F7D95AF03B34DD43FAB9F677A6C389FC7AFA69F6769FB
      3D45F099803D1BC20FBC3110EB778981FC2A91F6DF34A0AC29ED67759E45E74F
      65DB9F2F623F47F4F87F9589FA31D4FEFDA81F35A6FD381733E99C38A2C73EB3
      0CE06681363C9FD1FECE4746CB776074FF26AE2E6D833EEE123A074DF92F4B73
      03EAC0FFF1D7624C97BAD4073C16583BC2CD187BCCA5BA60B971EE9BF365EA0E
      B48EC7B4DDD2BCA8DD0019E1DD288A9FF6AE7B1D594347072F6E1A1E633A3FAF
      583A2B87FB04E4F3D3E2DAFACAF965F018D385DA2294CEB6FD87C88125580717
      D786F62D3C3FB0979A9B86C798CECFCB4FE7EB83A4A9A46ABFD4FA919A1FCF11
      DD15E1792E5067995D3B28B969788CE9FCBCFC746EBBD0B6707C308D0B2CF3B1
      AF770C370D8F319D9F979FCEB7EB57A0FFBFADFD48AD7FA9EDE7EF3EBFA4B69F
      57E43FABE6D76B9C5FFCF95259E85AEB5F93607F9D24E456D1EB505288DA82C4
      9816DA385361666E058F5FDFFFA44C1119875F0AA9E22F1BCBCAF04731C2FFC9
      F0A2D708D48CF0FF386238FC321D50D23C7EFCB9C3963707085F11679FEBC4D6
      6B467EA1FF792978FB7A53F4CF5E43D5353E95E19731A6FD3FAD6A7EBD3E7E05
      CFF60CF96F97B1A2E4F04749D00727BA36C63055F2C68AA5B54514422A7E6B7B
      AB7CC47F2BBF9D83AD57A3D6F5E40863F5C396430E31FE969D1B663BD5759421
      9AB5AB5F61ADB7B2B55420F8E9983760941F20DAF76EAE166A377273D31C9DED
      FDB03DD636564E62FAC173A49C92E5E6D6C1ED07F2609B85FACC4D27DC2A44A9
      D320E7F8DC2CB83A3694DFC292F14318C38F79C4C613A54D60D37C317E316E16
      EC58EAE15789E9C74CFCF962E36B6E7EBE7D9A5B3F7C31841F6D18F9D1DEF9E5
      EB3571894288B5DFA3855B8C1837CE0B76EE1861FFE5F46FA8FD0BE988F545DC
      79C8B71F3C87FAE373771AD0AA88DF5ED40FD7E7A0BFE0FB2ABEFDB375A03FE0
      F20BE99AAD03ED856B33FAF8B9768610E336D0FF97D3CFDF6DFD12F3FFFFEB82
      F390F5255C543AA8A5F34E1F74ADE962C2AEBF5887984DB3FDE0AFDD86700BC5
      0FBA4468BE9BE293F5E9D240FE7C29F98DEDAF29FAE4C68ADC3546282634A6DD
      FC3AB0DFC8CFFA472E58FBE1C6786FAAA05F64FD2FBB8EB0C7ACCFD497076377
      F6981FC74BCDFF260A6B9F62715465EC532CB6118BD58CE5E7C734FA608C7FC0
      B9690CB7504CA8CF3F4BC98FFED0586EFE9ED1903A489C5A68287765D677A13D
      2EAB0F53D7F757119F8888D4CF5CE25E7B379794FE46D0A2EC77787E95D4798C
      735D479CFB6A763D7C3FFCED121B1B2B4C33D96668DFD12E8AF8B681EBB050BA
      3163E7DEC4A590B455E71ECA944663FF898F92E2DA323B8F8A24BAB6AC899370
      2CA5DA3B107E650D677BB519E79F8C8CBF8C9DF784DF9CCF2A8CB277B045DFA4
      62D75733F333A86BDEF5B12A7E117E09ECB3C2F51133F3ABF8FB377A7D18EDBF
      B2D716A2D0C788F928F46B8C69CFB7D4F85D1C475DEB26CE63A2279509754411
      1D28D939A5CF57D07E288CD109EAD7983501F3E398D37197F181FE8ADA61A129
      FB65EEFE14F52A00A5D8754D53D6073E24DA934A19FBC868EC2355CC56C8F97D
      0E0BB308C63A18F360EC8331101B0FB13686B15265F779D48E8AB8D73AB8E98C
      E9CFFBD51BFBD0EBCA80B193C436A099CBA6CC3763EA407D49B83F28B77EE13C
      C4588531E3F35AD137A1FFA0DC68032A8C59CC181F965B0B24880FABF88D5C8B
      E99CC837B77D72AF6930E5FFB765567E7A8DD71CFB2385D85A6F8658544E630F
      5D7E186318A509FD401B51E1BCD5E7EBB17F46EA4A81ED667D82A1FB558C6D70
      ACE8DEAC420CC4C647347635F9FA0F8D758462A0D77EFD07006E827452C6ADDE
      0D909F5E1E859F694E7DB73F551028DF5F390BE7B72C2A87AF8E6D2F5F0B72A7
      B40248F2280FAC834841949B2050902FB567AD72581EDAB07C1DC8C3E7AE043F
      02D3ABF80DE4473BE1DB4E25EC0781E9AF4AE6FD320FAC8BAC2B00D351ACF658
      090225F94C3258CEB3AC004CAFE2FFDFE0975A549FBF04F9AAE71580E928F28C
      424168CA9EFF01E44B2F5400A6B3825C4CCB271580E9288C57BE203465091753
      775905607A15BF61FCCADC17E0E4FFD46CFC4ECD568272D7B57236847598CB7E
      78DC92C627CC9B23A1048719DDCF35D185638CF6990742EF0974AF53C3F18BF4
      E18361E680BE303766329C3F7400AE9F3FAB1BE70A34B8989B038AD1A360D47B
      9DC1DDC519DFB5CD8F773DDF72AAA55E38220CB2E266C296C50BE1E2F9F350F2
      B0B81C7E2E7E000F1FDC87E29F7E82FBF7EEC14F77EFC2BD3BB7E1EEEDDBB07D
      FE5CC8F8782C248E08C7FDCB1221FEA461432075EA64D8BF7E2DBC7CF9B29C21
      FCF5D75FF0E79F7FC21F7FFC01CF9E3D83DF7EFB0D1E3D7A04BFFCF20BFCFCF3
      CF90979C088BC68D81ACF85942D7663DDD6BD554270D0F83CDA4EDAADD3BCB71
      635DC8FDFBEFBFC3D3A74F2B7017171713FE04D898100B5B92E708F2D723FC73
      097FC1DA95F0EDA7072AB45B17F7FDFBF7212F2916721367C1DEB8E982FC756B
      D650270E1D0CF9AB33E09B83FB34BC86B41BB97F22E3C172EF9E1523C85F87F0
      C7860D84532BD3E1C6FE1C78F1E2053C7FFE5CC3FDE4C91378FCF831FCFAEBAF
      505252020F1F3E2CE5FEF1C71FE11E19EB1CE49E3905764E9F24C8EF56C3513D
      7370281CCF580AFFDEF789861BC711DBCDE77EF0E04139EEBBC48E58EEED311F
      0BF33B3AAAA70DE80747D397C0D53D3B34DC42ED466ED407971BC1726F991C2D
      C85FDBD1413DA57F6F38BC34052E2BD743F1ED1FA0F8EE1DB84F3E7FFCFE3BB8
      5B5408776EDD82EFBFBD09DF7DF30D14FEDFD750F8F5D770EBC675B846E6DA36
      E49E341EB2278C15E47725FC13FB06C3A125F3E1DCCA34B894BD1E2EEFD80C17
      B765C305E50638B7691D14646542FEBA55706ACD0A38B14A014797A7C1A7A4BF
      BBE36694726F8C1E2DC8EFE2505DFD71EF20C84B49863319A9703A6D119C5CBA
      103E899D065348BD1F05074274504F188FE8D503C6057687E8C00098D12B00E2
      0814238668B8D78F8D14E26FE054DDFECB71C13D2177419286FB44EA0238B628
      193E3FB04FA3FF33A74EC195CF2F95DA148E4F464606448404C1E221A1101B28
      835591C32073F448217E075B2BABBD615DDF85BDF31235ED46EE23A4AEEFAE7D
      05376EDC80F8891360575AAA665C713C6F139F73ECD8311837341C9610BF9810
      D41D968F0A87D5A40E917B37BE3E5E9EB7B7115DB2DC9FCE4B80AF2E9C830B17
      2E40EC848F60E7B22570FD3A19CF6BD7E0EAD5AB90939303D12386C18A0F2321
      31A40728483D2B47858BDE1BB2B4B008EED8B2F98D3513C7BF3844FC09CEF982
      C387E0C891233067DA54D89E910605050570E6CC1950A954B069D326C23F1C36
      4D9D0873FBF482B4A103613919071DF79EF0FDA25D5B35F4B834B16F088C0AE8
      0A9BB3D6C3A1438740999D0DBBB66FD37C3F78F020E4E5E5C1A2458BA07B972E
      10D15D06FD5AFB40B87F5B18DEB1BD907FE60ABE7FB5B9BDADED44D29F318D1A
      35CAF0F5F5CD66E1E3E3538A060D1A6457B3B54D2363378D608A9D8DCD147B02
      BCBDC55489B9A415C10146FBBFD27F53A8695A65F58CCF27DACD689FC1D886D6
      D58A7E4F24D8C554EE9DEAF8FCFDAB78F955E836023DD7D4045E7C8E527B6AC7
      FFCFBDF4CB8B9FF0DC52027FBCB469207763DAF77F113CA2BA61B95329D83AE2
      699E2BF4FE573346C7FB8B699B3146DC41F00901BE00C59DCEEBB1F4FAB78A7E
      B7A2E730CF4E82ED04F82EEC2E227EE17D827F12E033E67D68FBFDE9F9D6B46C
      577A6DF5044D43E940ED096D69142DD7032F6B72F8FD69BB0630DA77242FA17A
      60DF773C8B600347FFF87D26A76D38068B096C28C77902FA6E09C695E6479D5B
      521D7E413F597F54403090D39E41046738C7DEB44C53CA815C789DDB8DD68773
      857D8738EA368753B623E577E2D95101D50D2BFB08C6D0EF1E0479B44D99346E
      B7A236A6A0FA60258E205D60CC3298F2CF399C4DF3D9512E3C5E4B708A2084E6
      A94BED2690530EE7E83001FE61D46E58E945F3D6A1C7BD29378EF73F681ABEDF
      1B9F45D98E1EE333DCF09987BE42EB293D57931EB7A3659B708E715EE07BC3DB
      D2B416D49E59DBAB4F6DD65580DF959EABCFB1E1BD9483A19C97A92DF7E2F0E7
      70F89B511F632BC06FCBF33FAD69D9E6F4388872A7D0B96D43C71DF374E3F10B
      F937477A8EB5632CB387F607EB9E47B090CEC74F09DE26B0275846CFB1E38D7D
      6C24E2A72E3365CFF09B4FE7A41DEDCB613ADFD1CFA6116CA5733A889673A7C7
      C7097A0AF0F7A37B52CCF3169D5F81F4781B6D27DB6F178275341DED6206A37D
      46208E07BE03662553FEDDE85634FF2CEA778E124CA33AD841EDDE45C01ED2A8
      AE12E99CCEA33EF89F9C3147C1F7A37C49CFE5D1BC89B46C9A88BDB16B5230F5
      1DB7089E12FC483FF7D0B5D1877EE79EBB45CB04510E43D79971045B082E1214
      3365CF392CA6699B699EC6955CE7D15F9E23F896E21C4D3397A07EA3A98E13E9
      F7038614FC0FE3F9B3F2
    }
  end
  object ActionList1: TActionList
    Images = ButtonsImageList
    Left = 320
    Top = 224
    object actNewFrame: TAction
      Category = 'Frames'
      Caption = 'New frame'
      ImageIndex = 22
      OnExecute = actNewFrameExecute
    end
    object acImportFrame: TAction
      Category = 'Frames'
      Caption = 'Import frame'
      ImageIndex = 31
      OnExecute = actImportFrameExecute
    end
    object actLayersToggle: TAction
      Category = 'View'
      Caption = 'Show layers'
      Checked = True
      ImageIndex = 21
      OnExecute = actLayersToggleExecute
    end
    object actUndo: TEditUndo
      Category = 'Edit'
      Caption = 'Undo'
      OnExecute = actUndoExecute
      ShortCut = 16474
    end
    object actRedo: TAction
      Category = 'Edit'
      Caption = 'Redo'
      OnExecute = actRedoExecute
      ShortCut = 24666
    end
    object actExit: TFileExit
      Category = 'File'
      Caption = '&Exit'
    end
    object actAddLayer: TAction
      Category = 'Layers'
      Caption = 'Add layer'
      ImageIndex = 22
      OnExecute = actAddLayerExecute
    end
    object actDeleteLayer: TAction
      Category = 'Layers'
      Caption = 'Delete layer'
      ImageIndex = 7
      OnExecute = actDeleteLayerExecute
    end
    object actCopyLayer: TAction
      Category = 'Layers'
      Caption = 'Copy layer'
      ImageIndex = 23
      OnExecute = actCopyLayerExecute
    end
    object actMergeLayers: TAction
      Category = 'Layers'
      Caption = 'Merge layers'
      ImageIndex = 5
      OnExecute = actMergeLayersExecute
    end
    object actPaletteReset: TAction
      Category = 'Palette'
      Caption = 'Reset palette'
      ImageIndex = 10
      OnExecute = actPaletteResetExecute
    end
    object actPaletteLoad: TAction
      Category = 'Palette'
      Caption = 'Load palette from file'
      ImageIndex = 12
      OnExecute = actPaletteLoadExecute
    end
    object actPaletteSave: TAction
      Category = 'Palette'
      Caption = 'Save palette to file'
      OnExecute = actPaletteSaveExecute
    end
    object actPaletteImport: TAction
      Category = 'Palette'
      Caption = 'Import from image file'
      OnExecute = actPaletteImportExecute
    end
    object actPaletteToggle: TAction
      Category = 'View'
      Caption = 'Toggle palette'
      ImageIndex = 10
      OnExecute = actPaletteToggleExecute
    end
    object actZoomIn: TAction
      Category = 'View'
      Caption = 'Zoom ++'
      ImageIndex = 0
      OnExecute = actZoomInExecute
      ShortCut = 16491
    end
    object actZoomOut: TAction
      Category = 'View'
      Caption = 'Zoom --'
      ImageIndex = 1
      OnExecute = actZoomOutExecute
      ShortCut = 16493
    end
    object actZoomReset: TAction
      Category = 'View'
      Caption = 'Reset zoom'
      ImageIndex = 3
      OnExecute = actZoomResetExecute
      ShortCut = 16490
    end
    object actToggleFullScreen: TAction
      Category = 'View'
      Caption = 'Full Screen (ZEN mode)'
      OnExecute = actToggleFullScreenExecute
      ShortCut = 122
    end
    object actLanguageSelect: TAction
      Category = 'View'
      Caption = 'Language'
      OnExecute = actLanguageSelectExecute
    end
    object actReferenceToggle: TAction
      Category = 'View'
      Caption = 'Reference'
      ImageIndex = 20
      OnExecute = actReferenceToggleExecute
    end
    object actFrameExportPNG: TAction
      Category = 'File'
      Caption = 'Export frame as PNG'
      OnExecute = actFrameExportPNGExecute
    end
    object actLoadPresets: TAction
      Category = 'Palette'
      Caption = 'Load presets'
      OnExecute = actLoadPresetsExecute
    end
    object actSettings: TAction
      Category = 'View'
      Caption = 'Settings'
      OnExecute = actSettingsExecute
    end
    object actFrameResize: TAction
      Category = 'Frames'
      Caption = 'Resize frame'
      OnExecute = actFrameResizeExecute
    end
    object actNotImplemented: TAction
      Caption = 'Not implemented yet'
      OnExecute = actNotImplementedExecute
    end
    object actDither: TAction
      Category = 'Frames'
      Caption = 'Dither frame'
      Hint = 'Reduse colors to preset palette'
      OnExecute = actDitherExecute
    end
    object actSelectAll: TAction
      Category = 'Edit'
      Caption = 'Select all'
      OnExecute = actSelectAllExecute
      ShortCut = 16449
    end
    object actCopy: TAction
      Category = 'Edit'
      Caption = 'Copy'
      OnExecute = actCopyExecute
      ShortCut = 16451
    end
    object actCut: TAction
      Category = 'Edit'
      Caption = 'Cut'
      OnExecute = actCutExecute
      ShortCut = 16472
    end
    object actPaste: TAction
      Category = 'Edit'
      Caption = 'Paste'
      OnExecute = actPasteExecute
      ShortCut = 16470
    end
    object actGridToggle: TAction
      Category = 'View'
      Caption = 'Toggle grid visibility'
      Checked = True
      Hint = 'Show/hide grid'
      ImageIndex = 32
      OnExecute = actGridToggleExecute
    end
    object actMoveUp: TAction
      Category = 'Layers'
      Caption = 'Move Up'
      ImageIndex = 26
      OnExecute = actMoveUpExecute
    end
    object actMoveDown: TAction
      Category = 'Layers'
      Caption = 'Move Down'
      ImageIndex = 25
      OnExecute = actMoveDownExecute
    end
    object actFlipH: TAction
      Category = 'Layers'
      Caption = 'Flip horizontal'
      ImageIndex = 34
      OnExecute = actFlipHExecute
    end
    object actFlipV: TAction
      Category = 'Layers'
      Caption = 'Flip vertical'
      ImageIndex = 35
      OnExecute = actFlipVExecute
    end
    object actRotateCW: TAction
      Category = 'Layers'
      Caption = 'Rotate CW 90'
      ImageIndex = 36
      OnExecute = actRotateCWExecute
    end
    object actRotateCCW: TAction
      Category = 'Layers'
      Caption = 'Rotate CCW 90'
      ImageIndex = 37
      OnExecute = actRotateCCWExecute
    end
    object actImportPiskel: TAction
      Category = 'File'
      Caption = 'Import Piskel file'
      OnExecute = actImportPiskelExecute
    end
    object actProjProps: TAction
      Category = 'File'
      Caption = 'Project properties'
      OnExecute = actProjPropsExecute
    end
    object actNewProj: TAction
      Category = 'File'
      Caption = 'New Sprite project'
      ImageIndex = 9
      OnExecute = actNewProjExecute
      ShortCut = 16462
    end
    object actSaveProj: TAction
      Category = 'File'
      Caption = 'Save project'
      ImageIndex = 39
      OnExecute = actSaveProjExecute
      ShortCut = 16467
    end
    object actOpenProj: TAction
      Category = 'File'
      Caption = 'Open project'
      OnExecute = actOpenProjExecute
      ShortCut = 16463
    end
    object actPreviewToggle: TAction
      Category = 'View'
      Caption = 'Toggle preview'
      Checked = True
      OnExecute = actPreviewToggleExecute
      ShortCut = 118
    end
    object actImportSprites: TAction
      Category = 'File'
      Caption = 'Import spritesheet'
      OnExecute = actImportSpritesExecute
    end
    object actOnionSkin: TAction
      Category = 'Frames'
      Caption = '''Onion skin'' mode'
      OnExecute = actOnionSkinExecute
    end
  end
  object BGRAImageList24x24: TBGRAImageList
    Left = 440
    Top = 56
    Bitmap = {
      4C7A110000001000000010000000ED0B00000000000078DAED9B0B5C54551EC7
      8F016A3CE4650A04323C660642422068785F5434C707A68EA8AB0B29A88B9FCC
      2916ACAD1C1F9B5BD6B8BB5ABA85AB82608C289A62665AA396682AA5E5A316CD
      1CD01415106C31D17FE7CCDC4B77863B33F70E566E3BE7C3EF73C773CEF77FFE
      E77FCF73FC0C42F644277F2C0596064B870532990CC89316C957D275FC4D5892
      AFA6CB648427AC4EA703A552C9F04ABA4C41D755B25819CB16306D9BF040B34C
      92D1ACC6C41735DB068BADE1F05B43D7E7EA4F0DCDE938DA60E2A5663D9566E2
      29E360951CEDCA58FE28CC484DD791F1788F5CF2B70F737BE24A4E4E4EFE9E9E
      9E8A9090108D39F5EFDF5F49EA90BA6C96E4070404A84999A5365C5C5C64A40E
      A94B188625F942FD250C61895FB6F699666BE8792524C968A6869E57C0635EB2
      D71C9DC97AA464AFBB165463A51D9985B96F9FFFBF4E62D671B6F88E6F199E5B
      6AD3F96566BFE06A5749580E9EBD5F59E2F9F8A9EEE6385298ECE3B6240D477C
      3402A4E3B007026591C76B8B5E788DB2890F0F0F87B8B8389B79BCCEEA795BFD
      C7EBABDE7F5B7981F1B327E3F9A1E618B37CD66FA5857A0A2BF35FD9CDF9AFE9
      C6FCD77473FE6BECF3DF3EFF6D49002048359F684306F47339221689AF294651
      7F14C88686F8FBEB14F93A98FA670062832FFBCA129558ECE3581F1BE20219E3
      3600B141FCE0C30E1B4A4982C2450D91624F9896FE10101BC40FD2175E6C4448
      43F25A2D481E974164A827887D1DEB495F84B0D2C41418FC9A1682C52261ECBA
      7D3FB3D2101BD97DC2D881A1F7926D10C2A6579F85C4251B3B0C6C2861C5D6D8
      4F3FD53AF87BF5389DB8AA1AA4492930BCF82C048785361CE4C1124D18953E23
      26560AA2605F485B5CAD67B13FBC58DC46AF08A9DF85B5C7EA2026460AC40FD2
      17BEE37AC2686ADE80BE0F00B141FC207D1132A7707B87880DE287D0B9ACE7F1
      5E86372305913F8F73AD697DF2C48B1998F27841D43092B1F655538611DE54D5
      7CDB2775D93E3052F3B8C732ED3032574E5F08648CEF7CEDB3EBB1794BFDD370
      ECFF6C3FB9DA6533ECCF4C9B0CC7D861FB72AF7919C7B9C99AFF3233672D5BE2
      D79DF7D7DDF1D3DDF1DBDDF9D3DDF9CBE407F9FA544F1992061ECE0FFE0DFFD3
      5DE83962CAB0211D5FAC59017347A4B53ED8D331572291204652A9D448616161
      C8CFCFCF88A76206E90EAF7A03AA9ECD8684205FDDCE9D3BFB343636A2AB57AF
      A2EBD7AFA3A6A626D4DCDC8C5A5A5AD08D1B3750494989111FECE7BB52B3A010
      7615CD80F9831F85CCCCCCA9D7AE5DD3B36CAEB5B515B5B5B5A1D2D2523DD7EF
      A1BE282F7B3CCA94A725E70CA32E11BE74521288DC9C0EE03C9FA279D9283539
      BE677070B0DF1F26CA7BE4E6E6A20B172EA0B2B23243DC06F8A14FB62D477507
      8B9D87A744976F7E66AA9ECF0A76B9991C17F6A462744A74584840B193A36395
      E69D17C4050505A8BDBD1D959797EBF9C0005FB4AB6409BA7CB4148D191A1F39
      2325BA7DFDC404787E9007248B03AECC1A92006F67A5C2307F6772665C9C9797
      871A1A1AD0C68D1BF5FC80877D50D55B2FA2BA3DAB51E58A22073F7797DA65E3
      52A162662694E48E85B593D360DEF83110346C062007A73D858585A8A3A30355
      5454E8F900BFFE687E9EC2D3DDC5E5E9B87069EDDFE7E4C2C74B9F877FBFF80C
      28972C8187DF3800A8F212A0155F014A997A05BFBF21478F1E75D6680CD3DFDF
      A71F51E09369C91D07562D07EDEAE550585601926D27A097F60AA0AD97016DF9
      1E6F942D804A4F0192E75F920D1F552E93C99231EEE0EEE58E22D3C351685050
      75F6FACDE0711AD7FBE616A03DD7001D6806548D6DBC7F15D026ECC396064065
      C7014D5B7413B3BBB146BAF67545AEE35D11F2F02E402B7600DA7DD5D01679EE
      BD0E68177E565C04B4ED02A0459B0185461F443D9D676665657963BE471FEF3E
      C8F7095FE492EA331EBDB8F12E2AD101DA8CDBDA76D9A0A55B3BD0530BAFA3C4
      09A7D0030E3B33323202F7ECD983F0F862BE3746F8AE41BE8F4D4793175D456F
      9E03F4CE7940AF6A018DFE13A0A0C8334AA572128E57141EB3EECB962D7378FD
      F5D7F58C49C2818CDC8B5EFA0C50E65F3A506FD737719E04CB19F30E64BC2D58
      B0008D1C3912B9BABA724DC11EA887C31414927809F5765B40B8DFF05AA1C27F
      602C92673551A46ECEDCF358392A639D67EC50E6D8418F6FD573E68C93325287
      DB86CA22CBB641FB61041BFCE397E8BAACB6286DCEDC755AFE3CA94B6985FA6E
      BE0FBF35DFDDF819DEFDA0C70751D65852877B0CF07B075D636F6A83BB1F3F8F
      614ACB67EE18E6C0CF12308758768C745F25C90037346F92546C0B1B15EAEE78
      6ECBA8B54D1F8E3B24947D2CCCD359B775E48EC6F7C7C0959D63BEEF3C3F4C97
      483CA2BC2CAE99B2084FAFFA6D230E7EBF430E97B6CBA16C615CA19E9D2D0D92
      9F9DD0283F3BFE28D6E721F95219071BA0ABCA3855BF7518101D7E27ED5FEC72
      8FC7BC1F727BC4BD57D0D3922CAC39ECB2979F0A7DE47CE5601D16101D5F9FB6
      332CD0D59194798F9A27E99B59108715D3D357D223E2EDE83911C5319DEFFB8D
      3992C4BA7753AE6301D1C9D2E4DAA8D03E9D1B887443EB352C20F2189E1F1956
      1CB520667FD24A52F68FB912F9D765893F6001D1C99284EF62247D7CD9BE0516
      3736610191DBD099512E03DD7ABBC5B8F7292A2A4A3FF7F1C2FF7C5D96A0674F
      9526343F374914611A179F95BA635897B12E3AA7E6889292927CF099EF037C5E
      8396E66638B7FF955B98FD71E96CF1606BEF76E0C0818EF8CC7802F3809F7A5D
      6CD07D3822A15F3F3E6363D3A64D2F5FBC781188F0194BAF356BD6BC648D8B8F
      8FF73C72E4881A9F0B81ADBABABA2BB1B1B156DBC6674BA7B163C7064E9B362D
      76F6ECD9E9F9F9F923F073885C2EF7BE4FA6AB57CFDEBEFB3CFBCB5BF1E75942
      D95ECE81B591C97B2169EC2D10452CBD8BF3F285B0E1B22AE8FBF0443D9F320E
      F8DA306213337FD0B38C681BB32CB1D183BF00695C791796111D8F2E2C420FD4
      C60C39018FA6EEE7E488E2867F0B24A6A66C808F57AD66F91C08158F80C431AD
      6659E29FA12D63F678D562683AF4161C7EF7654E1B7C5846A636CCB17EFD3CBA
      B0A636483C3858E4EDEDB52F4F91C6C93222F12031356549923F31B4F5E9FCE9
      B009D7E162895FA46F5C2C9D66FD75F10B7767E74DEB628307CBA47C531B0258
      231BA42F790A0A484C05B04C9A89E3D186634ACE0AEF61AD63692D7D9F20FB4E
      38D66B04484EA5A8F92FA954424538C293CFF84C035DCFFB9644818163789207
      02A4B2F376FE77C363810DFAA5CEF42A0B77EC5F85CFC941201221AD2D760847
      781C1DB0C10E85EBEB59B62815C5C38E4A455114E055D198D5AA0CBEACA3CCD8
      21EBA8614C907AA4FD4EFF3143C4B6A3FF4CB1FFFF988C03E8D22E9B61B3741B
      5A635EAB35E599B6D93E303135F65F3FFE5574EC3A636FAE6DEEBBA8D158A670
      48F4764C59E37EF37A974663C1C67149D1F1BAEFEED0BF71B2391EAEAE11DA98
      984AB0C506C392A79DB5B3FFEB2CC3DBCAFE3F24AD563BF5F6ED3B1F0140A94A
      A50A17C8E66E2C3E0C93633F85ECF4DD70A2F6FC0D6C23D2EAE2A65225E1F6FE
      F9F967675BB3E3CFC0EA3C80D726024C8E3F003FDEEAD8668D6FBCDC72666CD1
      76989C5A0D05E9006F4E07989F0190197C1A70D9292B3E279D3959DF963E7D03
      4416D640565823644702648534C1D2E7F6012E5F68818DC53EDFAC28FD08BE39
      730E462DDE0B8F3E7B0C4607EF87F7DE3D7107F7498DCF290EE6F8E6A69BC78A
      57EEE8FCFEEBE4C9D39031B712328AAA310A1A2B310BDC5E7908CE9D3DAF67EB
      EBEBA162C36E3875E242FBC9E3DFB563DFA698DD6429CAE94EC71DCDBAD51FE8
      BF3BFBEACBD3F0967A0B7CF9F9B72D984BB016EF3B77EE16AF526F07EDDECF60
      FDDBBBA0BAEA08DC6C6BDF877D7A84CF38C1EFE4AB5717964365D97ED2CF9598
      EB2F709C3D71FBC78E8FF073AE7DC6DAF09D7E941CC4E202DE32FDDD0BC92B28
      6887CACADB56959C7C93932765D6FC54E03469D27FEDFCEF945758496A9CCCF1
      645C91326B1289DABAF0967E7766EEB768F7D30E6DB8C73277393E9FB55AE33B
      B0E0EBC73DBC8FD9628BA2ECFEDBFDBF37FE93B9C0D820F97C3E6B7FF1FB828F
      C8DBE6EFF146E42468B1C0161B84217C3425814194C4A6F74438C2DBEABF50DE
      B49F9678D3BA74ACB48461C4EEBFA99E528DEE8C2B1D2B20754DE52BF2E6CC27
      22F6D9FE98C6D992FF6CF67E89FFBDE4493C488C4DE364CB18BEDFCFDD3F016C
      249B8B
    }
  end
  object JSONPropStorage1: TJSONPropStorage
    StoredValues = <>
    Formatted = False
    Left = 440
    Top = 168
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 200
    Top = 56
  end
  object ColorDialog1: TColorDialog
    Color = clBlack
    CustomColors.Strings = (
      'ColorA=000000'
      'ColorB=000080'
      'ColorC=008000'
      'ColorD=008080'
      'ColorE=800000'
      'ColorF=800080'
      'ColorG=808000'
      'ColorH=808080'
      'ColorI=C0C0C0'
      'ColorJ=0000FF'
      'ColorK=00FF00'
      'ColorL=00FFFF'
      'ColorM=FF0000'
      'ColorN=FF00FF'
      'ColorO=FFFF00'
      'ColorP=FFFFFF'
      'ColorQ=C0DCC0'
      'ColorR=F0CAA6'
      'ColorS=F0FBFF'
      'ColorT=A4A0A0'
    )
    Left = 320
    Top = 112
  end
  object opndlgLocalization: TOpenDialog
    DefaultExt = '.po'
    Filter = 'Interface translations|*.po; *.PO|All files|*.*'
    Options = [ofFileMustExist, ofEnableSizing, ofViewDetail]
    Left = 200
    Top = 112
  end
  object OpenPaletteDialog: TOpenDialog
    Left = 200
    Top = 168
  end
  object SavePaletteDialog: TSaveDialog
    DefaultExt = '.hex'
    FileName = 'default'
    Left = 320
    Top = 56
  end
  object sdExportFrameSaveDialog: TSaveDialog
    DefaultExt = '.png'
    Filter = 'PNG files|*.png; *.PNG|all files|*.*'
    Left = 320
    Top = 168
  end
  object SelectDirectoryDialog1: TSelectDirectoryDialog
    Left = 200
    Top = 224
  end
  object pmLayers: TPopupMenu
    Images = ButtonsImageList
    Left = 57
    Top = 356
    object pmiAddLayer: TMenuItem
      Action = actAddLayer
    end
    object pmiDeleteLayer: TMenuItem
      Action = actDeleteLayer
    end
    object pmiCopyLayer: TMenuItem
      Action = actCopyLayer
    end
    object pmiMergeLayers: TMenuItem
      Action = actMergeLayers
    end
    object pmiMoveUp: TMenuItem
      Action = actMoveUp
    end
    object pmiMoveDown: TMenuItem
      Action = actMoveDown
    end
    object pmiLayerFlipRotate: TMenuItem
      Caption = 'Flip/rotate layer'
      object pmiFlipH: TMenuItem
        Action = actFlipH
      end
      object pmiFlipV: TMenuItem
        Action = actFlipV
      end
      object pmiRotateCW: TMenuItem
        Action = actRotateCW
      end
      object pmiRotateCCW: TMenuItem
        Action = actRotateCCW
      end
    end
  end
  object dlgOpenProj: TOpenDialog
    DefaultExt = '.json'
    Filter = 'JSON files|*.json; *.JSON|All files|*.*'
    Left = 200
    Top = 280
  end
  object pmFrames: TPopupMenu
    Left = 71
    Top = 483
    object pmiAddFrame: TMenuItem
      Action = actNewFrame
    end
    object pmiDeleteFrame: TMenuItem
      Caption = 'pmiDeleteFrame'
    end
  end
end
