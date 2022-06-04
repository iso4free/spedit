object frmMain: TfrmMain
  Left = 484
  Height = 454
  Top = 270
  Width = 668
  HorzScrollBar.Page = 377
  VertScrollBar.Page = 345
  AllowDropFiles = True
  AutoScroll = True
  Caption = 'Sprite Editor'
  ClientHeight = 454
  ClientWidth = 668
  DockSite = True
  DoubleBuffered = True
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MainMenu1
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ParentDoubleBuffered = False
  Position = poDefault
  LCLVersion = '7.8'
  Visible = True
  WindowState = wsMaximized
  object MainPageControl: TPageControl
    Left = 0
    Height = 437
    Top = 0
    Width = 668
    ActivePage = FrameEditorTabSheet
    Align = alClient
    DockSite = True
    TabIndex = 0
    TabOrder = 0
    object FrameEditorTabSheet: TTabSheet
      Caption = 'Frame Editor'
      ClientHeight = 407
      ClientWidth = 658
      object FrameFlowPanel: TFlowPanel
        Left = 0
        Height = 41
        Top = 0
        Width = 658
        Align = alTop
        AutoSize = True
        ControlList = <        
          item
            Control = BitBtnNewFrame
            WrapAfter = waAuto
            Index = 0
          end        
          item
            Control = BitBtnLayers
            WrapAfter = waAuto
            Index = 1
          end>
        FlowLayout = tlTop
        FlowStyle = fsLeftRightTopBottom
        TabOrder = 0
        object BitBtnNewFrame: TBitBtn
          Left = 1
          Height = 38
          Top = 1
          Width = 38
          Anchors = []
          AutoSize = True
          Images = ButtonsImageList
          ImageIndex = 8
          OnClick = BitBtnNewFrameClick
          TabOrder = 0
        end
        object BitBtnLayers: TBitBtn
          Left = 39
          Height = 38
          Top = 1
          Width = 38
          Anchors = []
          AutoSize = True
          Images = ButtonsImageList
          ImageIndex = 30
          TabOrder = 1
        end
      end
      object DrawToolsGroupBox: TGroupBox
        Left = 0
        Height = 316
        Top = 41
        Width = 80
        Align = alLeft
        Caption = 'Tools'
        ClientHeight = 299
        ClientWidth = 78
        TabOrder = 1
        object GroupBox2: TGroupBox
          AnchorSideLeft.Control = DrawToolsGroupBox
          AnchorSideRight.Control = DrawToolsGroupBox
          AnchorSideRight.Side = asrBottom
          AnchorSideBottom.Control = ColorsPanel
          Left = 0
          Height = 129
          Top = 109
          Width = 78
          Anchors = [akLeft, akBottom]
          Caption = 'Palette'
          ClientHeight = 112
          ClientWidth = 76
          TabOrder = 0
          object ScrollBox5: TScrollBox
            Left = 0
            Height = 112
            Top = 0
            Width = 76
            HorzScrollBar.Page = 61
            VertScrollBar.Page = 97
            Align = alClient
            ClientHeight = 97
            ClientWidth = 61
            TabOrder = 0
            object PaletteGrid: TBCGameGrid
              AnchorSideLeft.Control = ScrollBox5
              AnchorSideTop.Control = ScrollBox5
              Left = 0
              Height = 400
              Top = 0
              Width = 62
              GridWidth = 6
              GridHeight = 40
              BlockWidth = 10
              BlockHeight = 10
              OnRenderControl = PaletteGridRenderControl
              OnMouseUp = PaletteGridMouseUp
            end
          end
        end
        object ColorsPanel: TPanel
          AnchorSideLeft.Control = DrawToolsGroupBox
          AnchorSideRight.Control = DrawToolsGroupBox
          AnchorSideRight.Side = asrBottom
          AnchorSideBottom.Control = DrawToolsGroupBox
          AnchorSideBottom.Side = asrBottom
          Left = 0
          Height = 61
          Top = 238
          Width = 78
          Anchors = [akLeft, akRight, akBottom]
          ClientHeight = 61
          ClientWidth = 78
          TabOrder = 1
          object SwapBgFg: TBGRAGraphicControl
            Left = 1
            Height = 59
            Hint = 'Swap colors'
            Top = 1
            Width = 76
            Align = alClient
            Color = clWhite
            ColorOpacity = 128
            Alignment = taCenter
            OnClick = SwapColors
          end
          object BgColor: TBGRAGraphicControl
            Tag = 1
            AnchorSideTop.Side = asrCenter
            AnchorSideRight.Control = ColorsPanel
            AnchorSideRight.Side = asrBottom
            AnchorSideBottom.Control = ColorsPanel
            AnchorSideBottom.Side = asrBottom
            Left = 45
            Height = 32
            Hint = 'Left click to select color'#10'Right click to set transparent color'
            Top = 28
            Width = 32
            Anchors = [akRight, akBottom]
            BorderWidth = 1
            BevelInner = bvLowered
            Color = clWhite
            ColorOpacity = 128
            Alignment = taCenter
            OnMouseDown = BgColorMouseUp
            OnPaint = BgColorPaint
            Caption = 'BG'
          end
          object FgColor: TBGRAGraphicControl
            Tag = 2
            AnchorSideLeft.Control = ColorsPanel
            AnchorSideLeft.Side = asrCenter
            AnchorSideTop.Control = ColorsPanel
            AnchorSideTop.Side = asrCenter
            Left = 23
            Height = 32
            Hint = 'Left click to select color'#10'Right click to set transparent color'
            Top = 14
            Width = 32
            BorderWidth = 1
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Color = clWhite
            ColorOpacity = 128
            Alignment = taCenter
            OnMouseDown = BgColorMouseUp
            OnPaint = BgColorPaint
            Caption = 'FG'
          end
        end
        object sbEracer: TSpeedButton
          AnchorSideLeft.Control = sbPen
          AnchorSideTop.Control = sbPen
          AnchorSideTop.Side = asrBottom
          Left = 2
          Height = 28
          Top = 32
          Width = 28
          AutoSize = True
          GroupIndex = 1
          Images = ButtonsImageList
          ImageIndex = 24
        end
        object sbPen: TSpeedButton
          AnchorSideLeft.Control = DrawToolsGroupBox
          AnchorSideTop.Control = DrawToolsGroupBox
          Left = 2
          Height = 28
          Top = 2
          Width = 28
          AutoSize = True
          BorderSpacing.Around = 2
          GroupIndex = 1
          Images = ButtonsImageList
          ImageIndex = 28
        end
        object sbPipette: TSpeedButton
          AnchorSideLeft.Control = sbPen
          AnchorSideTop.Control = sbEracer
          AnchorSideTop.Side = asrBottom
          Left = 2
          Height = 28
          Top = 62
          Width = 28
          AutoSize = True
          BorderSpacing.Top = 2
          GroupIndex = 1
          Images = ButtonsImageList
          ImageIndex = 29
        end
      end
      object AdditionalToolsPanel: TPanel
        AnchorSideLeft.Side = asrBottom
        Left = 488
        Height = 316
        Top = 41
        Width = 170
        Align = alRight
        ClientHeight = 316
        ClientWidth = 170
        TabOrder = 2
        object ReferenceGroupBox: TGroupBox
          AnchorSideLeft.Control = AdditionalToolsPanel
          AnchorSideTop.Control = AdditionalToolsPanel
          AnchorSideRight.Control = AdditionalToolsPanel
          AnchorSideRight.Side = asrBottom
          Left = 1
          Height = 129
          Top = 1
          Width = 168
          Anchors = [akTop, akLeft, akRight]
          Caption = 'Reference Image'
          ClientHeight = 112
          ClientWidth = 166
          TabOrder = 0
          object ReferenceImage: TImage
            Left = 0
            Height = 112
            Top = 0
            Width = 166
            Align = alClient
            AutoSize = True
            Center = True
            KeepOriginXWhenClipped = True
            KeepOriginYWhenClipped = True
            OnClick = ReferenceImageClick
            Proportional = True
          end
        end
        object gbFramePreview: TGroupBox
          Left = 1
          Height = 125
          Top = 190
          Width = 168
          Align = alBottom
          Caption = 'Preview'
          ClientHeight = 108
          ClientWidth = 166
          TabOrder = 1
          object FramePreview: TBGRAGraphicControl
            AnchorSideLeft.Control = gbFramePreview
            AnchorSideTop.Control = gbFramePreview
            Left = 0
            Height = 50
            Top = 0
            Width = 75
            BevelInner = bvLowered
            BevelOuter = bvNone
            BevelWidth = 3
            Color = clWhite
            ColorOpacity = 128
            Alignment = taCenter
            OnPaint = FramePreviewPaint
          end
        end
      end
      object FrameDrawPanel: TPanel
        Left = 85
        Height = 306
        Top = 46
        Width = 398
        Align = alClient
        BorderSpacing.Around = 5
        BevelInner = bvLowered
        BevelOuter = bvNone
        ClientHeight = 306
        ClientWidth = 398
        TabOrder = 3
        object pbFrameDraw: TPaintBox
          Left = 1
          Height = 304
          Top = 1
          Width = 396
          Align = alClient
          OnMouseDown = pbFrameDrawMouseDown
          OnMouseMove = pbFrameDrawMouseMove
          OnMouseUp = pbFrameDrawMouseUp
          OnMouseWheelDown = pbFrameDrawMouseWheelDown
          OnMouseWheelUp = pbFrameDrawMouseWheelUp
          OnPaint = pbFrameDrawPaint
        end
      end
      object pnlToolsOptions: TPanel
        Left = 0
        Height = 50
        Top = 357
        Width = 658
        Align = alBottom
        TabOrder = 4
      end
    end
    object ActionsTabSheet: TTabSheet
      Caption = 'Actions'
      ClientHeight = 407
      ClientWidth = 658
      object ActionsButtonsPanel: TPanel
        Left = 0
        Height = 50
        Top = 0
        Width = 658
        Align = alTop
        TabOrder = 0
      end
    end
    object ProjectTabSheet: TTabSheet
      Caption = 'Project info'
      ClientHeight = 407
      ClientWidth = 658
      object ProjectButtonsPanel: TPanel
        Left = 0
        Height = 50
        Top = 0
        Width = 616
        Align = alTop
        ClientHeight = 50
        ClientWidth = 616
        TabOrder = 0
        object StaticText1: TStaticText
          Left = 344
          Height = 17
          Top = 8
          Width = 65
          Caption = 'StaticText1'
          TabOrder = 0
        end
      end
      object ProjectProperties: TValueListEditor
        Left = 0
        Height = 242
        Top = 50
        Width = 200
        Align = alLeft
        FixedCols = 0
        RowCount = 2
        TabOrder = 1
        ColWidths = (
          64
          132
        )
      end
      object ScrollBox4: TScrollBox
        Left = 200
        Height = 242
        Top = 50
        Width = 416
        HorzScrollBar.Page = 320
        VertScrollBar.Page = 240
        Align = alClient
        ClientHeight = 238
        ClientWidth = 412
        TabOrder = 2
        object ProjectSheet: TBGRAImageManipulation
          AnchorSideLeft.Control = ScrollBox4
          AnchorSideTop.Control = ScrollBox4
          Left = 0
          Height = 240
          Top = 0
          Width = 320
          AnchorSize = 11
          AspectRatio = '3:4'
          MinHeight = 0
          MinWidth = 0
        end
      end
    end
    object SourceTabSheet: TTabSheet
      Caption = 'Source Image'
      ClientHeight = 407
      ClientWidth = 658
      object SrcImageButtonsPanel: TPanel
        Left = 0
        Height = 30
        Top = 0
        Width = 780
        Align = alTop
        AutoSize = True
        ClientHeight = 30
        ClientWidth = 780
        TabOrder = 0
        object SpeedButtonLoadSpritesheet: TSpeedButton
          Left = 24
          Height = 28
          Hint = 'Import Spritesheet image'
          Top = 1
          Width = 28
          Align = alLeft
          AutoSize = True
          Images = ButtonsImageList
          ImageIndex = 5
          OnClick = FileLoadSpritesheetMenuItemClick
          ShowHint = True
          ParentShowHint = False
        end
        object SpeedButtonSaveToLib: TSpeedButton
          Left = 52
          Height = 28
          Hint = 'Save image to current spritelib'
          Top = 1
          Width = 28
          Align = alLeft
          AutoSize = True
          Enabled = False
          Images = ButtonsImageList
          ImageIndex = 6
          OnClick = SpeedButtonSaveToLibClick
          ShowHint = True
          ParentShowHint = False
        end
        object SpeedButtonAutoSelect: TSpeedButton
          Left = 1
          Height = 28
          Hint = 'Clear all previous frames and try autorecognize new'
          Top = 1
          Width = 23
          Align = alLeft
          Images = ButtonsImageList
          ImageIndex = 4
          ShowHint = True
          ParentShowHint = False
        end
        object SpeedButton1: TSpeedButton
          AnchorSideLeft.Control = SpeedButtonSaveToLib
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = SpeedButtonLoadSpritesheet
          Left = 80
          Height = 28
          Top = 1
          Width = 28
          AutoSize = True
          Images = ButtonsImageList
          ImageIndex = 7
          OnClick = SpeedButton1Click
        end
      end
      object ScrollBox2: TScrollBox
        Left = 0
        Height = 418
        Top = 30
        Width = 630
        HorzScrollBar.Page = 148
        VertScrollBar.Page = 416
        Align = alLeft
        ClientHeight = 414
        ClientWidth = 626
        TabOrder = 1
        object Label2: TLabel
          Left = 5
          Height = 16
          Top = 5
          Width = 43
          BorderSpacing.Around = 5
          Caption = 'Frames'
        end
        object ListBox1: TListBox
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Side = asrBottom
          AnchorSideBottom.Side = asrBottom
          Left = 0
          Height = 388
          Top = 26
          Width = 148
          Anchors = [akTop, akLeft, akRight, akBottom]
          ItemHeight = 0
          OnClick = ListBox1Click
          OnSelectionChange = ListBox1SelectionChange
          ScrollWidth = 146
          TabOrder = 0
          TopIndex = -1
        end
        object SrcImageFramesOptsValueListEditor: TValueListEditor
          AnchorSideRight.Side = asrBottom
          Left = 0
          Height = 148
          Top = 268
          Width = 148
          FixedCols = 0
          RowCount = 6
          TabOrder = 1
          OnEditingDone = SrcImageFramesOptsValueListEditorEditingDone
          Strings.Strings = (
            'npp='
            'x='
            'y='
            'width='
            'height='
          )
          OnValidate = SrcImageFramesOptsValueListEditorValidate
          ColWidths = (
            64
            80
          )
        end
      end
      object ScrollBox3: TScrollBox
        Left = 630
        Height = 418
        Top = 30
        Width = 150
        HorzScrollBar.Page = 1
        VertScrollBar.Page = 240
        Align = alClient
        ClientHeight = 414
        ClientWidth = 146
        TabOrder = 2
        object ImportImage: TBGRAImageManipulation
          AnchorSideLeft.Control = ScrollBox3
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = ScrollBox3
          Left = 148
          Height = 240
          Top = 0
          Width = 320
          AnchorSize = 11
          AspectRatio = '3:4'
          KeepAspectRatio = False
          MinHeight = 0
          MinWidth = 0
          OnCropAreaAdded = ImportImageCropAreaAdded
        end
      end
    end
    object LibraryTabSheet: TTabSheet
      Caption = 'Local Library'
      ClientHeight = 407
      ClientWidth = 658
      object LibraryButtonsPanel: TPanel
        Left = 0
        Height = 50
        Top = 0
        Width = 629
        Align = alTop
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 0
        Height = 400
        Top = 50
        Width = 185
        Align = alLeft
        Caption = 'Local libraries'
        ClientHeight = 383
        ClientWidth = 183
        TabOrder = 1
        object Label1: TLabel
          Left = 26
          Height = 16
          Top = 11
          Width = 78
          Caption = 'Select library'
        end
        object LibraryComboBox: TComboBox
          Left = 4
          Height = 29
          Top = 42
          Width = 156
          ItemHeight = 0
          OnChange = LibraryComboBoxChange
          Style = csDropDownList
          TabOrder = 0
        end
        object LibraryItemsListBox: TListBox
          Left = 0
          Height = 259
          Top = 93
          Width = 183
          ItemHeight = 0
          OnClick = LibraryItemsListBoxClick
          ScrollWidth = 181
          Sorted = True
          TabOrder = 1
          TopIndex = -1
        end
      end
      object ScrollBox1: TScrollBox
        Left = 185
        Height = 400
        Top = 50
        Width = 444
        HorzScrollBar.Page = 90
        VertScrollBar.Page = 90
        Align = alClient
        ClientHeight = 396
        ClientWidth = 440
        TabOrder = 2
        object LibImage: TImage
          AnchorSideLeft.Control = ScrollBox1
          AnchorSideTop.Control = ScrollBox1
          Left = 0
          Height = 90
          Top = 0
          Width = 90
          AutoSize = True
          OnDblClick = LibImageDblClick
        end
      end
    end
    object SettingsTabSheet: TTabSheet
      Caption = 'Settings'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Height = 17
    Top = 437
    Width = 668
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
        Width = 50
      end>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Images = ButtonsImageList
    Left = 344
    Top = 136
    object FileMenuItem: TMenuItem
      Caption = 'File'
      object FileNewSpriteMenuItem: TMenuItem
        Caption = 'New Sprite Project'
      end
      object FileSaveSpriteMenuItem: TMenuItem
        Caption = 'Save Sprite Project'
      end
      object FileSaveAsMenuItem: TMenuItem
        Caption = 'Save Sprite Project As...'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MenuItem7: TMenuItem
        Caption = 'New Sprite Library'
      end
      object FileLoadSpritesheetMenuItem: TMenuItem
        Caption = 'Import Spritesheet'
        Hint = 'You can import image or spritesheet file'#10'and add it to the library'
        OnClick = FileLoadSpritesheetMenuItemClick
      end
      object SelectSpriteLibMenuItem: TMenuItem
        Caption = 'Select Sprite Library'
        OnClick = SelectSpriteLibMenuItemClick
      end
      object SaveSpriteLibMenuItem: TMenuItem
        Caption = 'Save Sprite Library'
        OnClick = SaveSpriteLibMenuItemClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FileExitMenuItem: TMenuItem
        Caption = 'E&xit'
        ShortCut = 32856
      end
    end
    object EditMenuItem: TMenuItem
      Caption = 'Edit'
    end
    object ViewMenuItem: TMenuItem
      Caption = 'View'
      object MenuItem4: TMenuItem
        Caption = 'Tool panels'
        object PaintToolPanelVisibleMenuItem: TMenuItem
          Caption = 'Paint tools'
          Checked = True
        end
        object LayersToolVisibleMenuItem: TMenuItem
          Caption = 'LayersToolVisibleMenuItem'
          Checked = True
        end
        object TimeLineToolVisibleMenuItem: TMenuItem
          Caption = 'Timeline'
        end
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ViewZoomInMenuItem: TMenuItem
        Caption = 'Zoom++'
        ShortCut = 16491
        OnClick = ViewZoomInMenuItemClick
      end
      object ViewZoomOutMenuItem: TMenuItem
        Caption = 'Zoom--'
        ShortCut = 16493
        OnClick = ViewZoomOutMenuItemClick
      end
      object ViewZoomResetMenuItem: TMenuItem
        Caption = 'Reset zoom'
        OnClick = ViewZoomResetMenuItemClick
      end
    end
    object MenuItem1: TMenuItem
      Caption = 'Sprite'
    end
    object MenuItem2: TMenuItem
      Caption = 'Layers'
    end
    object MenuItem3: TMenuItem
      Caption = 'Palette'
      object miPaletteLoadFromFile: TMenuItem
        Caption = 'Load from file'
        OnClick = miPaletteLoadFromFileClick
      end
      object miPaletteSaveToFile: TMenuItem
        Caption = 'Save to file'
        OnClick = miPaletteSaveToFileClick
      end
      object miPaletteClear: TMenuItem
        Caption = 'Reset palette'
        OnClick = miPaletteClearClick
      end
      object Separator1: TMenuItem
        Caption = '-'
      end
      object miPaletteImportFromFile: TMenuItem
        Caption = 'Import from image file'
        OnClick = miPaletteImportFromFileClick
      end
    end
    object HelpMenuItem: TMenuItem
      Caption = 'Help'
      object AboutMenuItem: TMenuItem
        Caption = 'About'
        OnClick = AboutMenuItemClick
      end
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 344
    Top = 80
  end
  object ButtonsImageList: TBGRAImageList
    Height = 24
    Width = 24
    Left = 344
    Top = 200
    Bitmap = {
      4C7A1F0000001800000018000000215200000000000078DAEC9D095C4DCFDFC7
      4F49648BFCF821BBEC4B9692B4521445B66C59B2EFFBBE967D09114A25D9F7A4
      24BBB2A548216B96A4450B4289369F67BE7317B7DC12F23CFFE7793AAFD7E775
      CF9D7BEE7B66BE3367E67BE6CC992308FF239B119327531413C44A61F2661AFE
      07DC3A4C01C46BD3A60D860D1B8649932661FAF4E99833670E860C1982BA75EB
      421CAFE62FB2E9F894264D9A60E6CC99707272C2BEDD1EF0D9EF02FFA31E08F0
      3F8E8B172FC2DFDF1F6BD7AE45D9B265F10B7951A534B56EDD1A2B57AE84B7A7
      236E782E809DDD02941BE4CC45FB773CA6E0FEA9AD080D0AC4AE5DBB50BE7CF9
      9442E6C3AE62C58A9C7D76C77CDC719F80D88B8E10ACDD209C8F8230FD386A8F
      76C787D03D787ED29EC7137AF138DCDDDD290F010F4EEE129E9CDE275CDAE598
      1F3FAA4F9F3EF0DA3C1B77764E42D839668F2BFE227E22207886F2FD0BE77723
      E9FE51245DDD865B6E93703F38003A3A3A14479DC77E7B05AD168DF3E3C3DEDE
      1EB75DC762F9CA153CBDC2C2532211DFE7E9F7EF2C9E13A70F21E6DC3ADC3FBD
      033366CC20FE348F15730BB20F3C36AFC4C303935173A43384479F445C796271
      182DD885F4A7FB1071623DBCBDBD896FD7B659430E4A4D4D95CBF774DE809490
      A5D09CEAFCD3F45B2DF704DE7823FAE641ECDFBF9FF309929696267CFEFC592E
      9FCA2AF1F65A84DFD8042BFBED309AE7FC83FD8DE6BB33B607525E1C657C1F24
      3F0F81A3A3A3941F111121A4A7A7CB2DDFDDBB77E3F64577E09523D326FE29E5
      6F0FE2FB88DD0BC41D02E2BDF0E989173EA77E848D8D0DE713F7CB972FC2D7AF
      5FE5F1BDE99C3A79F2245E86B2BC476FE5AA33D615C2860008C376339BEF64EC
      038C7D84B18FE253721C020303D1AA552BE25BB1FF0A0F1F3E14323333E5B637
      CD9B37C7A54B9770F9F2658407F920F1AE0BC2835D317CBD3BD34EA43CDF8BF4
      E7FBF0F6911F673F7AF4080B162CE06D45464606E766656509D9D9D9F9D521EF
      850B17E2F9F3E7FCBF77EFDEC5DD5B371075FF3C621F0520FAC10DBC4B8CC387
      0F1FF0E4C9131C3D7A94F355545452C4ED449DC78F1F0BDFBE7D2BA88D08B7B3
      B3C3BB77EFF0F2E54B3C78F000F7EFDF47787838EEDDBB876BD7AEF1F687BE5F
      B97205BBF71E877EF74D5052B3858252751E0F00F90DB29191240EC75AB56A61
      FDFAF59C25619E3A750A5BB66C41CF9E3DD1AF5F3F0485DC43B7F95F51DFE225
      CA36BB81D2754F41A16483C2B679D44E3B4ADA6AB1A264DA7FCFA6ED6DA037ED
      2BBACCC7EFC621181A1AF272BB7EFD3AFFAE56BE8CB07488056FCB952A6AE1DF
      1ECF7F88A394FAC942C74136A3FA90939323AFDCC2CB36B197C6D1794E0E2A1B
      46A0B2C50B94D7BFC9F855530AC3272E89CA4D5692FA2089A346F7E7A8641E89
      F29D1EA0B45E383BA00E0AC3CFCBCD2F8E326D6FA18CE13D28EB84A2445D2788
      CBAE28361E8752AD2D28D1FA26146A2E6475B542CA6FF4CF3F8BC35B9C664F71
      FDFB9FDC8AFD9F42F83FA1ACBF8FD83F1B0F0ECCC15DCFA945EEFF7C0CDB8FD4
      7B87F1FEF63E7C0C3F94AFFF53087E2EFFE7FDADDD407238F0F90D90F519F810
      8CAC176E4C7B90F94CBEFFF313BED4FFB9756011A6B95F8491DDA9EF5A729CF5
      EDAE4C6EAC2FF3C0FBA7477FF07F7EC697F83F968B9D44FEC2F538F91A7790FB
      2779FD9F9FF125FE8FD1BCED3FE5937F95D7FFF9F8F1A3F0E9D3A77CFD2B89FF
      63E7B655E4971420BB5DFB7EF07F885B807F95CBFF090FDA8C80CB4E4CDB989C
      1110E08A80C09D4CBB117EEB805CFF87D94978FAF429F7810AEBFFE0F576A61D
      400CF37D627717E8FF10B700FF4AAEFF83D7AE62368B33765FBEFE0F01C8BF7A
      F6EC597EFE5591F83F3FF1AF8AC4FFC9D7BF2AAFFE77FD9F7235F8C7D06E867F
      C7FF61FCCAAAE504B7D923846D53060B2ED387081E73470AFB164F108EAC982E
      78AF9B2B9C765C225C705EF17BFE8F38FDBFB0FD9AFF53A29420D4EF26087D77
      0BC2E84B823026E007FF4AD60F2A2AFF273FFFAA28FC9F9FF957B27114FB3FC5
      FE4FA1FC1FDF5FF37F7475757FCBFFB97DE158A1FC9F8E1D3BFE55FF47CC97FA
      3F4FBD16706664E8754C6D57954B769FC620BEBD3E5668FF474F4F2F97FF9315
      B91CC84C9132F996E48748FFB9623EF31DE20F17DAFFD1D7D7CFE5FF206A0DEB
      7359BFFEF116901A01241C13F7F5D4CF33BF276E3FEFE3E58DFF14C497F83F78
      E5C0E2588F48BF29A2F4466F616C67449E5920FACE7D886372C77FE46D060606
      72C77F224F4FFF6E7FFF79DFED9FCFF8CFEA31FD04DD660DF2E3FFB1FF73D07E
      B2B06FC94461EE200B3179AA740CE04FFD9F930EF305B7F9E305E376CDBF275C
      E1BA944F7ECBAFFA3F478E1CF9C1FF91B2952DA47CEA43A8FFFB3DFFE7D80FFE
      8F50719020943A276E7EBFF781327D51A1FC9F1B05FA3F5BD98746BE7DE0DF1E
      FF69D3A48110B4C75108DAEB28786D5C2A743768FFFDC715A17F3CFED3B6A986
      7072CB32C1D250E7C71F37BC1184C1F38B64FC47EED62F50106CFC8BC4FF91DF
      1375128456E182D0E0CE5F1CFFA9C664CDD4ADD8FFF93FEEFF445CBA20041D3D
      246CB51D2CCC363715544A96FCABFECFE689638B64FC47D6FF9938C45A38EFB1
      8983B6CF99F157C67F762F1CC741FB16CF2F70FC47E2FFDC0BF087D3D85E22FF
      E44B0CEFE3DFDE71C03CC3DA72FD1FE769361C747CC1AC02C77FC8FF093EB103
      EB067592F2FDB74C43CC95A5701AAE23EAE3E5F83F1E734672D0D1B9D30B1CFF
      91F83F91813BE034B213F77FFCD75B4BFD1F11FF47FF67EFE2F11C7468D69402
      C77F64FD1FA7615A52FF0731EEDC8710F17FF47F0E2F17B98807A64F2CD4FD2F
      F27F9C866933FE361133C683FB9E22BE9CF19F75733868EFD4F17F65FCC7CF71
      3107794E1A53E4E33FE7B72F1748B4798C1F5924E33FF9F93F6E638617E1F8CF
      8FFECF8E9143E4C2CB96522E42FF47FE56AE5C39E1E2FA957FD5FFE9D8AC8970
      6CF15CC16FF962C1D76E81E07B70BF101C1C2CB46BD74E705FBA50DA96FF89FF
      53AFDABFC2AAE136C2A8AE9D851D4E4EC2D9B367853367CE08CC4EC2E9D3A705
      66AB22F37F1A346820B468D14260F557AA66CD9AFD3DFF474E9DFBBF7CFF2BBF
      FBC145B5FD5FE2D3584A7C7CBCF0E6CD1B21212141484C4C1492929284E4E464
      AEB76FDF0AAC6D12DEBF7F2FA4A4A470B1F64E90DCBB20E5C3C75F508084AFD7
      A135929F9DC1FBE86B78F74AA2AB480AF1E09F52455D1185B14F89DE4605F2B0
      F7AF6FE0EDCB40B10272F10D0DF439935D4722273B13395922BD771FCAC27290
      9D9521150FCB6161995FA57AEF36441CF605D91922E5E2EBEBF1F411F3CBC7B7
      4CC948FF9084773B0671E6E794047C7EFF86291E6F5D067266DADB58A426C730
      BD66610338F353E22BA6287C4C78998B6FA0DF91E79558E9298952DE77569C94
      C7592C9D9F92A2A5BCB7CEFD9195918E8F6F5E303DC787F867B9F97A1DB91DB3
      333390F62E9E49C413B1BEF234A68A7922D6179E46092FD9D91A595FD3F1212E
      1229714F9112FB2477F936ACC2CA6827B72331DF3A0FE09CA4655A3C2C99ED8B
      64FD3D6CBBB558FD58583B51D8B67E52C9F2F53B76E0654E654469A3BC9244E5
      96CDD396F5F533D7F7B0CFC8FC9A86CC2F692CCC06392C8CF633BFA472E5E6EB
      E0ED8BCB521B7E8817D990D2479C9458519E53621EF3F47266F443BC8B7EC0EA
      450492B6F5E5CCB751F7583AEF229929175F5707C9C497D850CCE32C4AF3EB47
      4C229E889586B7AFEE4B79495BFB20333D9531C290F4FC0E572EFBEBB667BEE4
      2551FE591A25BCA46DA2B4521A253CCEE7AC70CE4B7E1EC6F919E99F90F4EC36
      12236F71C9F23B52F906EFE47614954F5FCE11959B8D689F31B828CCD5E6FBF7
      ADBD79D83B1696E8D45BAC5E79DA072D16F7057119A54A459C9C6C16C6D246A2
      34BEE36159C8F8FC51AADC611F9091F621375F47C4CF6DC3509E3662F23C3F0D
      1189A58D38098F83F0E6F10DBC797403895BACF09531E31F5E45FC83AB888BB8
      92DB3E3AED9014795ECCBAFD9DC7F2CA594F6E8A7941223E675D93F244FC14C4
      DD0F402CE9DEE5DCFCF66D19F39C98152CE589D2FA81A5F1BA9877ED3B2B2250
      CA4BD8DC135F53DF23F6EE45C4DCBD8098F00BB9F87FBBFD2FEEDFFF7F6DAAAA
      AA29CC5781441D3B76FC417A7A7A3F485F5F5F2AB1BF98DF3D25301F888BF941
      607E10981FC4C5FC20303F885FA3313F888BF941FCBA8FF9415CCC0F2AD07FA6
      F4FD2E37353595EB677C09F357B86969695C9F3F7FCEC567D756280AD1F53FA5
      2B3D3D3D177FF4B03EC88A39859CF8D3F896E0CF85C433BF24E213F7CB972FF8
      FAF56B2EFE489B5EF8F8F818D29E79E1CB4B6F6444FB222BD60F396F4EFF1057
      4AA42F024E1CE4CACB272E29232323177FF8C09E4808DD87E4F0037877FF103E
      3C3C824F4F8FE1F3F313F812751299AF7D911DE787F74F7DA1EA1002E13AB3EF
      B954182DF0CDC5F7F1F1E1E5939999998B3FD4DA1251816E88BEE681D8204FC4
      87EC41E21D16DFDD83781F71181F1F1D456AE471AC773F0EE1E07B08EEC91036
      274058F212E1978E4AF9C4CDCACA4236EBF364F9367DBAE3A19F139E9CD98667
      E75DF0E2922B5E5D71C7EBEB1E88BBB91B6F6EED4552D87EACDC7480316320CC
      8C86309EF998831EE2D69983DC96C4272E2987F951B2FC4156E6083DBC1EE1C7
      36E0DE894D78E0BB058F4E6FC5D3B3DB71D869015E06B822FAEA4E3C3CEB8E0A
      26FE10BA3F8260F4007A96FBA5B624BEAFAF2FAFAFE487CBF2FB5B76C5B59DCB
      11E4B912C17B57E3F681B5F0D9BA08534758F3FFAD9A3D0A8FFDB721F29C33C2
      4E6EC78EE51B71788B532E5BD271C4956CB2FC7EDD4C717EF3025CDCBA1801CE
      4B3161702FB431D384F6A43630D9A207A3097A30EF668415334620E4C87AB9B6
      24BEEC96F7FCEACC7CF4536B6661743F4B34EED9081A4BEAA2F59A66D0DBAC85
      2EAE06E8E166822EB38CA1D3A93D964D1B8E1BFBD7E0E8E6F908DCBB8ADB5262
      9FA8A8A81FF88D0C1A41182670298D5442C5C91550736E3534B6AB8F366B9BB3
      38DAC1C4450F161E9DD06B6F57749E64C07986433BA2BDB1361CE68E2930FDB2
      7C52E9D1A550796A45D49A579DC7A1B9BA297436B686A1537B1E4F57370374D9
      6800737723983AE9A3C3506D299FEAE8F5EBD70BE42B30A98C290DB52915A13E
      A71A1A2CAE83E6CB1BA20DB397B6432B74D8D4061D1DDB4297A9038B576B7D2B
      CE8F8C8CC4993367B061C386BFD2BE9D3F7F9E8FFBD1185A41E34B464646F895
      8DDAEFD3A74F73F6A851A3881DFE9379398566531F4773D5366EDCC8FB4D315B
      F567739F7ED35F1B5EECBDFCD57B6E7645740F90CADF4AC253575747EFDEBDB1
      74E95278787860EEDCB9BF333E2819130EAF59B326ACADADB169D3269C3B770E
      B76EDDE263FD9B376FC6E8D1A3D1B265CB5FE6934F78F0E0413E9E4D63F357AF
      5EE5E3D963C68CE13E62F9F2E5A1A8A8C8A5A0A020B91F59E831486284868662
      FEFCF9E8DAB52B680CBD72E5CA7255A14205942A550A4A4A4A858EA37DFBF608
      0E0E86858505E81E6441AA5DBB368FA773E7CE5056564E294C596B6969C1CFCF
      8FDF333534342C5074CFA5468D1AFCDEEAA041830AD52650FB476D14DD8BA5FB
      1E740F213F51FB54BF7E7DAC5BB78E4BEC8F878BEBADDCBA4BFCB367CF62D1A2
      45F0F4F4E4714C983041AE3A75EAC4ED43F75B55545440B69D3A752AE81E1795
      5FDEBAA5DDB89A94BF62C50A3C7BF68CC7B166CD1AD0FD9879F3E6A14B972E68
      D8B021AA54A9C2CB9FEE3B128FEA04D535AAC774FF292828E807FEA42E7573F1
      A3A3A3F93D228A63DBB66DD0D0D0E071D0FDE5C78F1FF3F38178010101B871E3
      06BFA7456527B91F94973FBD9328FDD4B72D5FBE9CDF3BA2FB54743CC5417597
      CE09E2858585F1F4525AE87C717575E57E037D464444F0E3F2F2756AAAF0369F
      CECF65CB96F17E94D24FF7C1C856F4DF0B172EF0B0989818FE9DEC12171727ED
      67288CEE6151FCF99CDB9A74BF9BD24F3678F8F0A1343D140FE59BC25FBF7ECD
      59B21BF9E41446F7C5EEDCB923975F41745B5E939D9B29C78E1DE369911C4F69
      253B533CAF5EBDE22CF2A328ECF8F1E3FCFBCE9D3B79DAE9D89FB44D3C1F870E
      1DE2C74A442CCA13950DF164456D2A9585E4D842B47D3C0E2A37593E95F78B17
      2FB81F427593B467CF1E1E07E543861F5E98FEA451A346BCCE48F8541E54DE54
      37E9BE35C54FBFDFBE7D9B1F43F18C1D3B563AA7BE10DB70491CC4A732A1BA45
      E54C7921BB8C1F3F9EFB5632F70FEDC47D9DF02B71507DA732993C7932B4B5B5
      253C4FC9BDD99A752E0BFFAA9F11D4AA1C144A2A6BFF6A7F395CECE378FF30D7
      ED3F7FEB5380CF36F00FB874C66DA6BE9EFC85F8F8785E7FA87FA676A45BB76E
      92382E33B52824B30BD36E49FA0CCCCC71F0EC7944B136E103BB2E8C4F4CC2FB
      4F9F1097948CD38157D0BDFF0074EDDD47363F2ED495E437F38C8E713C78187B
      2E5CC2BECB8158BF671F864C9E82998B17A39BA5258C581FD0D1C414E3A64DC3
      B91B41703FED8FA1EC77779F53D874F010163A6E96C4D345DE50DFD6234771FA
      7628CE87DDC5958887D8E77502EBB76E4367D32EA8D7A001DA6869A34193A6A8
      C1FAF7AE7DFA62EB712FAC63D7A9DE57AEC2D9DB074E478F6389D356491CB9B6
      D2A54BE3CADD7B9C7FFDE123DC7B1985C03B6138C8CEFBF52C5DF3962C85F590
      2130EC6A86FEA3C760CCDC7998B6D41E872E5D86DBA9D33C2FF4B9D6738F5C3E
      85853E798A4F9FD3712FF219C29E46E2696C1CAE85DF45082BD78B21B770D0FF
      0CF6F89F65693DC9391E67CFC1E3CC39EC646147AE5E878B9737E6AE73C897BF
      83D9C7D7DF1F5F3232F0955D077E484B4364F46B16D75384B338C96697EF4570
      1695CFF1EB37708DE53520F40EBCCE5FC084858B613B9DCF077A9917CEFC81B0
      E53B585B7BC21B97591D7CCEDAE184C44464D278484E0E1FB3C8CCCAE671A7B0
      3A14C3EA12E5D32720102BB76DC7D879F33174CA54F410CD77B92327FD4E5643
      86F2F2D9BA771F0E9E398BBB8F9FE0016B2F6FDD67F59EF97697589DF1BA7809
      87599D75D8E589F91B36619EC306FE397EC1420C9D34195D7AF06BC705F2A665
      928DC8E79BC57C2067D6AFDFBC771FF79F3DC76556E65759D9FB5FBBCEEB8944
      2B76B8618A9D3D262D5E82611326C2D0D85862FBFCCE01B4D4D101F3A5A1A5D3
      017398AFB495D96CE9BAF5D8EF7B0ABBD875229D13B356AFC1828D8EB01E3112
      BD993FD7AA4D1BCE6DD0BCB9849F9FAF88A1CC6FB21830001D593EEAB276B95E
      BD7AA0EB0BFA8DFCA0BC6D50E5AA5551BF59333466BE9C16F31BF3A93B52FE98
      850BD19B95D1DC55AB3089B53B9B76ECC0A43973583BD01BB3992F3770E24468
      333BF41E39125D58DADB317FB72BBB1669CEFC631376CCCFF85319B7DFD0A158
      CEAE2DE6335F651FB3C90C16671776CD6FBF7E3DA6B0B64287E5AD8FAD2DBA0F
      1E8CB6CCB7EDC47E6BC1FA1C8A2F1FBE225309099FD2BF939DB78BD8FE29E657
      B9EDDB070BF6DFF55BB762158B57C2EFCFFAC6F6CCD7A53CE99898F04F397C05
      715B5C5A96BF95F5DFC4F7BF72057B7D7C309CF9FAF4E9C0FA5C4AE7F4952B31
      8C9595849B87AF2C4EAF24ED6598FE91E56F3B7080F3CF305FF337F85569CA92
      8C5DE87B73593E71FE20FD6D98E8812F25A652340D473C591763D8B9F5BBF6B1
      1A3E5CC237676A26669711F76FD497A21FF38F247CAA3F85E5EBB3FED29C9D37
      627E2F193E95452D2613A699F47B7776DC94254B3081D5FFC3A74E611BF30147
      4C9982036C5F963F805D2B69B3FA63D6BF3F3A989A4AD87662562DB17D14C465
      5153DC06D144CEBB92F3B337BB3EEC3670208C591D1F377B36FA8E18C1EB3BA5
      57FF7B1F4FA209FFB3E99102265A4C44254F1D5516B71BD5C5FE13E5C58FE96A
      01FEC939F198425FB18DC926EAE2BAAEC0E7A4A99443BB46EDB8E83FD52B5797
      7EFF55D17F8921F92E6187BA8672D1EFAEB35CA5DF7F55F45F6248BECBC62151
      DEFF0C3619FC4B71C8B2F2A63F2F7F9CE538B8CD72835623AD5FE2CBEE537EC6
      5A8EE5CACB2736C5613FDCFE97F8121EB11BD56CC4ED4692E51F5C7C90A7BB82
      4A05FE295161F8121EB10BE253BA7FC536F2F83FB38F7A65F53FB2CFCFCA7776
      FFD9B0B7B52F741C797905D54F49FD91947351D74FE29E5A7D8A8BF68B3AFDBF
      A382D24F6D87A5AEA5B4FC7F55F45FEE87E7894B962F5BFEBF2A491B999F7DA8
      BE92AD7FD736F45F6214B67C7FD7FE856D7FF2AA30E74061DB1F792ACAF627EF
      79406A52B389743F7073E01FB73FB2E73189DA22C97E7EF5E057DA9FDFB5CFEF
      9EBF85E92B7FA5FD298AFAF9B7DB9FFF8E0124D80B90287EF6F7EB0FDA2F8C0A
      C3AF98FE1112A62C5F129EDF6761F992FFE4E517C4CE7BFCEFD8A728D29FDF56
      54F6FFFFB2C9965361F43BFC9FD527C9A73CFECFD2207B9EFCEC333F7E41C714
      45FA0B3AE6BF23FD7F52BE3F4B7F51D4BF9FE5F14FF9FF9BD35FDC76156FFF8B
      E6E214AFFF937B3E51F1FA8705359DC5EB1F16AF7F58BCFE61F1FA87C5EB1F16
      AF7FF87BF3758BD7FF297EFF45F1FB2F7EE2FF14BFFFA2F8FD17C5EFBF287EFF
      8550FCFE8B3FF67F7EA1EF2BF67F8AFD9FE2F59FF3E717AFFFFC137EF1FACFC5
      EB3F17AFFF2CDA8AD77F2E5EFFB9D8FF295EFFF94FEE7F15AFFF5CBCFE7341E3
      3FC5EB3FFFD9F84FF1FACFC5EB3F17A6D3295EFFF9FFA4FFF3BF6ED3A85A45D8
      62632DACEADF4BB01D38400839ED2B445CBE205F9772AB10FE0FE78FEBD655F0
      DEB046D63FE4EB4895D0682BBB46147554AA717171426C6CAC10131323444747
      0B271C1D84F5E34609FF54AA2494AED04850542A9FFB3CAAFA8FC4870B1074BA
      41718E074A6DBF8D32AEF7A1B2E7294A1D7F0DA5DD6150B05D08A142A5287975
      A43E3BEFEBB49C25741C9B2434E97A895DA3CA3EA2285809F55A4061D3259476
      7B00D5B5D750DE3184B3957DE251E2C207285E4B8742702684314B799FE8EAEA
      2AC86ADAB46942B92A1B18FB8650A3E511C6FFF77BFD2DAB9A221C7A81729B6F
      7176058720A8783E86F2C978E8DF4E45F9E0AF106E6543381006A13A3FF73569
      2D6E5A939BE66DA8B3B4FBF8F8086DDBAE63B6992FB46CB95236EDD34ADACC45
      A5832F446CA6B22E77B94D1474BBA1ABCD50F47A108B92E15992B44789CB21D7
      391A1414249C387182E56383645C43DA37F6DAE58F163BC345FC0D2CED7B2351
      F2741284721553F8F88BB61E8487EFA07C3313A58FB0F298B80E25752DA058B5
      B6ECDA3F56D4B61E387040A85AB5AA2C3F609BEF4518EFBDC7F9E59C6EA3D491
      57503AFF1E0A8BDC24FF8F52BD148E2AC1E9287FF1332A9DFD04B53322553CF6
      1AE5961C84B2E96049DEF2AE1FE2ED7FF132C6F93DE5FCB2CEE150F68A41894B
      1FA1C0D22BB85E46C5791BA0F7E433CA06A4A3E2B954299BD47ECF0D7476F5E7
      FBAABB1F40B1015FBF4AD676C3274D9D86632FDE73FE3F2EA1E873F02A7A9F08
      C63F57DF4308FD06855B3928753D03E52EA54BD34ECCC7FD7510DBAB1922CDFF
      C185DEF5D1ECF00394DD7026EFFAA5AAE52B564C718D4E408BDDE198E5EEC5D7
      92A2757E684D9616672EA274E04D28DFC844D9CB2CFD62BED7F801F836660C9E
      77AF8E88CE25F0C044190ED386A3FC85342854AB9DB77FB16B3E7A22F4EE26C0
      7E9717BF16229F719DDB7A98F8EA6146D060B4DD6F887F4E6E44D91DAC0CF4B3
      60D6D81BD7BA4D408C5563449A554694651D1C1BD717E5581A145B1BE6E2FFAB
      5A5ED4A7EEF541BB7377B85F4C7E89ED9E91981D3204A3CFF446FB4D6DA1B9AD
      256A5A3DE47D7A9586D4CFBEC4A6360BF07E6027648F1A0EB72936287D959D2B
      D572F78F62FFA78E50819D675E0168E67D07BDF65C44BB430EE8E9D51926AE7A
      D061FC76763DD1C8043098F819AA35CE33C621282844C16CD6714C5DB604754F
      4542E9C473B96BE890FFC3CB9DC5A1702200FF06C6A194F753D4DD6789DE874D
      6173C2023D3D47E05FCD8F68631D870A8C5FB97E209A9A3F47F956DFA074330B
      8A2139108CACF2F54FC8FFA13814581CAD36BA6078E407D43CF702EA5EB3D0ED
      B4119AFB0C80B02307E534BF425D33092D7BA6F3FC28F503AF6782BDE74FFB76
      F27F247D6A137D43EC397F119EAFBF4033E823140359DDB8F155D4CEED63ED91
      0B4BEFFE1C51DB34735361D70FCC3B5610D04A53138BD66D84ADF74DD40A606D
      29B5A79753A170F4311416BA4BCAD3F117D979C70EA689CF1BD9F50B03C4DC22
      F319AA54A952EC50146F85DD1CC5F5314066BC2C5C5C4F8D8A300ED9B5413C65
      C6E48AA2DEDBE5E11BC97C37FA0B7C47193BFDCE2659DBD24E9C7F59BEECF5EA
      EFA45D556C5709679A9CF46BCA7CB7FB035B40261F79D77E099069DF54C5659E
      2253D702A43749726F92B47BCB7CCAE3A7C8D849B26F253BDE29A70F1B2E9326
      2B99FFE76D8FC365CA373F3B79CAB9868C9239769A4C1D379223D53CC7A8CA19
      0F96977679CA6F9394816721CA352A8FBD656D5EE727FC9FD5A1E1F9E4F367E7
      687E7C5539651120E738493DD3FC495D0EC8D34F87FF85B62F4A1C4F8A4C3D2D
      AAAD8E4CBD2ADEFEFF6E9AEC1AA028C7CE7EF0959B366D8AE6A275D634FF069F
      D616A635370BD966FD8E6FCCD71AAF56AD1AFEC097CF77A3757F57AF5ECDD7AB
      16FECE7AE3E1B42E30ADE32B14F00E913FD8BC697D7A529D3A7520D34F1785AD
      F8582CDD3375767686A5A5254AF49F018561F3F3B6F1D2B5BF65F4337F94B315
      8CADF9FACE5E5E5E7CAD6545ABB15098B44EDACF2BFC5B9B8FC3949DE9820ADB
      AE4BC750CA3AF8A3847E0F894DE5E5D55318BD928F8FA9A9A9F17B43B4767299
      666D50E60EBB4E74BB8812C1D97C7CA6929839D86107C2ACEAF1718DBDB6C6D0
      3C1202C5251EF2CFCFAAB5A0BCF7391F9F2951BF355FE396CAA059B366107A0D
      44D99028540FCB4099802F9C4FE330EF071A23AE570B44742E8917DDD5F1B0BF
      36BB16A7F7624CFBB1EEB5D093F24B998EC0AA55ABE0E6E6267A5740B5DAA83C
      7F3D6ADDCBE2631715CEA7F138DC2D46E2ACD9121CD11B82646B5DC458354113
      DF70083E2FE4F9BE51754F3C47CD2D21283BD689AF1349EB714F99324534E619
      9CC5AFFF698C41F5EC5554F04A40F596408D56518C7595E9094A99B36BFA03DF
      44635E3FFA35D31A9B5862D7D30FE8E01106D5AA35F81813ADE1DEA0555BCCDA
      7F125A5EB330FE7A3FB4DEDE0ACD5C9AA189552C0C26A6A142B5B3A85C2F0086
      53BE404937078A57D224BEC80F656CD6C30AA18F9E41CFCC82DFE3A27A44E734
      8D350DF1188629410360B5DF443416347A2DEA187C60EC6454AEFF16153B33B6
      C7179458EF5B50FB6555514D2DAA712B4DDE465039D37DF9D9B367F3F7AF681D
      9E0EAD7D6DD0FD88114605F442AD1343218464432128838F7D94D81D06E1DFDA
      85B97FE159B9AD3106D88E4353CB1910349AA1C4562F540F7907ADB038E85C0F
      44D7E0ABB079F816031F7C81BAC735083DC7818F0317CE8FB0539CBA1DA5AD1C
      A0ACBD126A0D76F27B422A4D5B405DD7002DF50D61C0CE433D4323D0D8A0CCBD
      B7C2B623D3CA59CE43FDBEB751A6921FCA55F187AAFA79C8F8737FEAEFF0F6A2
      526D6B94AD3C02255568ECA89B648CA748FB34622A2854FD6B7D5AF1F61FB149
      DE7F31BC889901B5AA56465F83B69860A6FD2B6B9B17668B0A705981B7E7F720
      31E02812986C7A9AA388AE4FAC0698E8E263F865A4879D47EA855DF8E4BB050B
      0699FFCE9883DC6B43DF2DF6F87CCB8F73253ABD6A7251F0EBE8B668884FF7AF
      E662CBF0FFD4BFF65C3FCE1A69CC2EC44C3CB216619BA648E3F843BE6A75B50A
      883EBB4F6A73FFC5C3F0C069BA2C1F72C6A5F9B5B6726D6594F847A9A06B72BB
      D1266DF1EE868F94D7A74D3D3CDD3E53FABD653D7509DFAE4AAD7FD067891546
      9FB2C5D02B43599F3606569B7B1794C7A84B2BC7E3F38DE39CF5CC6D3EE66BFF
      83906543A47CFD167C9DE628235B7D1C49DC8BEB2997E113B31F875F6EC7EE67
      0E5CF9F4EFC3BB345547CC854352D689C9163839CE049179D2DFC5CE04BBA376
      C237661FD6DE9F8A6577C74835DD7F607EE90FD86E63C8EB7BDE7A23D1DAD1BD
      51BB6B6DB83F75E3E99430079DED8E79C1C3F8FE40C72EF2EAB066B3AA65F1F0
      B0935CEEBDED73F9A75AD572E8EF3B00075E6C95B25BF76C88466E8DB1387404
      FF6E3CBEADBC73DC73660775BCBBE62565BA4C1B2CB135169836C3C185A350C9
      480DBB9FBA4AD9C42AADA982E6BB9A4BC3EA6A55CF7B7DA8FA8F4A09DC709C83
      4FFE2E9C1DE1BE54769EA4A35DF7D6BC6D683B538B97A38455BABC322A8E5683
      F171DD5C6179EBE4E0A695F0DACF439A76713B23792EC1A87DA35A18DCB93D26
      ED9C22E50C74EB82921D95517553750CB964290D97E3DB06EC1AD905698107A4
      FCDA55D5F25E3FF2F1F3591BA74B399D5CDA4165661934756D8419D706F1B0F9
      D786C9AB3BD3E68D19C2DB164AB7F8FC91E72B1899F7EF2CE52F08198651677B
      F27D935DEDF9A7ED4E0B797CC978A8B720E7BE7ADEF38FEAB76C7DA7FAD37274
      4374B069816A8DD5FED447B22286ED162B98CFE920A92B9EE2FA6E5544D79946
      79C6D7FF53B6E14DEAD4468DCA6A7FC3CFE463E24F8EEC45A88B03CCDB342FF2
      3828ED12FE25BB2968A1CE7D5A237A8628AFE8B99FBCA2676924FA59FA89BFC2
      CA80D765C97BE025EF82977D0FBCE45DF092F7C04BD671C9AFDFDD366B9A947F
      629C159A54A9C0F350582E3D7F9DCF33D8BCDEF532D4CFC59F67D0988F291486
      4BCF5FCB7B069BE6164A44E7A7EF8AF952FEAE5E6DA05EAE241FA3973D4E9EE8
      1966B261DE67B0470FEB2364C59C1272E24FF33A6AD1BE4D2EBE4D436E234F24
      9E112492F11B54E93BF1F37B067BA44D2FE1E3E36342DA332FE1CB4B3E6415B5
      7FEA3029DFB1831A2A9694BEB781B89EEA55FE41F93265A4F1129FB8247A5E3A
      D74935B0A79010BA4F480E3F20BCBB7F88070DD16F978BAF5799BF732D9CEAB0
      DDD0FE3836BA3B8634AE28BDBF417C9ABF44E593F719EFA1D6964254A09B107D
      CD43880DE2CDB26AF9D2A5A25C069948F9330C9A61E79CA9F09B39043BCC1AC1
      C9B00656B6AD20E13B123FBF67BC6DFA74171EFA39094FCE6C139E9D77115E5C
      72E575B58E5A79C61B8A4BF6537176DE281C1ADA197BFAE9606D9F4EE83E6221
      5416DF8250B106B711F1892B795E58761B64652E841E5E2FE907E8FA24AAB791
      01FCD72DC3B5B50BE03F7B384E4EEA8BED136D6060B707C2864808FEC910D63C
      8160BB5B3AA7C2D7D797D7D7BCCF22F7B7ECCADBF50A65CBA44CB6EE83F39BD7
      21D4D901D7D72FC2E565D3B17EFD1A98EC3E0DE16A0A847D31105CA22004D2BC
      A35408E7DF42E8BF46E20B0C97798649BAF5EB66CAEB9BA4FD89D8B303775C36
      62FB5E4FB4BEFC48C40D60BC9B1F215C7807C12F09C2A13808F73E43389100E1
      32FB6DCD7508C6FD25F1D8C9F63364BBCEFAFC3948EFBD760BB1EA4C001A3D60
      FF7B9D0D213243648B20C6BEF601C259B67F98B16FB0EFAE2C1FB7591E76458B
      E2A6DFC6ED907DDE84F7B38D0C1A09C230F1B8665B7D0877D24469BB9F0EE1D1
      17910DAEA4886C42693DFE0682378BDF3751948F532C9ED5DE103A0C959445AE
      7E52865F47D0D413717CD87F0FC68AD247E93ACBE2B8F44EC4F762FCFD31229B
      B90442B05E22E1F2F119C9F3EC3FF049CD7545ECDDAF219C14A791EC43E9A5CF
      63CF4569DDC1EAA69D3F04950A927BB3469191917C1EF3860D1B0A6ADF5284BD
      2C6DDB5E40381A0F610F8BE7C41B91CDC92E2B4FC8DE4BF316DB82DA0CD5F3E7
      CF0B478E1C117AF6EC59E0F8B630DF0F82E33351F939BF84B0E53E84AEA32094
      A920924C3D2451BF40F3AE893D6AD4A89FF6F1821EF3F156B37367FD530883D7
      41505397F8A275C4E5A62A61BF79F346387AF4A8B071E346C9B3B83F1FB72ACD
      6CBA201842F705BFFC1EC9C2FA68C2F7E7A55485E2EDBF635316EBAF842B2A94
      D625FDADF0D225AACF5156ACD4FB67E18A42C92AD54A1AFA49C26B94340D2D0C
      A78C52F30325146ACCC91DAAA0260E5FC0F62B508892826A4735658BCC324AAD
      4E97546CEC5BB5542FD6992B94CBEF78C95642B965A0A272ADCDB9EEE529697B
      8BC2EB1FAFACD446E24B972CAFA41DA8A4DC21AD5469DDB4D28A0D9D7F723CDF
      CA956E1552A6740357D972522F3530AB9C4A9B87E555DA46542B65714FF24329
      C57A4BD4CA744595B21650142AF6F8D9F1A515AB985656EA826ACAE6998A82B2
      782135858AEA2A0351B684012A299BA04A29F35752AB0965F4CA2B19A1424903
      E68828A8FEECF82ACADAEB2A2BF742CDB2FD5049496390245A2585FAA1E54B98
      434DD90C8A0AFFEE97C99B5259C5CE5F2B946C2F7B1D9DEFF1FF94EAE055B9B4
      494205E58ECF2B2BB75E27FB9F8AA5B44E97516AB0316F7DA8544ADBAFAC5283
      9579AB9BBCE3FF51EEE85342A8B9B28442E5C9FF94D43D90ABDC79B89A6D5EFE
      AF84AB29B7DE5AA54A0D0B52A5929A5B73DF6F1685FF781FBAF0E1145F993265
      CA9114152AE58A5B12FEC3F9F20BE18A8ACA1A32B1A91737C5C55BF1F69FBF05
      0404FC557E6060A0DCF0D2A54BAF6ED6AC5900A979F3E63FA8458B1672D5B265
      4B2E0D0D8D8BCACACAC359FA15E5F189CBFC62242424203131114949495CC9C9
      C960BE387F3E95C4AED5919292C2C5AE4BB93E7DFAC4DFE55BBB766D4FC697EB
      BBB234061257C2CE8F4BCFD292245C526A6A2A7FC736F1997DF2E307C87225EC
      FCB8C424A5A5A5E1F3E7CFB879F3A634FDE5CA95ABAEAFA7EBDEAF9779F8206B
      0B26CBF0C1D696A98BE74DC50F9A3FED072D59409ACE9FB7A5E779295E9A3721
      C3AF336C50CF80DBE7B621267C3F62EF1E40DCFD8388E73A5468D17C24CA637A
      7A3A424242A4F621FE489BDE0191D777E2F3F313F812751299AF7D911DE7876F
      6F4E0309FE40E219A9D2A34FE3E1B5E37872C32B5738BDA79DDEB39D9191C1DF
      4F5EA74E1D69FA6D07F60CB877761B9258FADFDD3B84948787F1E9C9317C7EE6
      852F2FBD9141F1C5FAE1ED333F681F7F00E102BB56F77E876987AF22F595287E
      7AFF39BDF799CA80DE252DCB1FDADF3220E4C446445FF3406C9027E243F620F1
      CE7EBC65B67A1F71181F1F1F456AE4711C38769C5D57B36B6A37761DBC39010D
      D63FC1CD2BBE9C4F6B2390ED29FDF4CE6FE24BEC63D3A77BC0D5FDABF1F4EC76
      3CBBE08297975D117D7527626EEC427CF06E24DEDE8BE4F003D8B9EB208425EC
      9A7E5634840951A83FE92EAE9C3D812C9637070707646767F3F7C8D27BC265D3
      3FD0CA3CE0DC8EA5083BBA01F7BC3621E2E4663CF273C283534EB879CC012F58
      7CAFAEB823F2923BB487FBA372AFDBA8DA2D0413661D47D25D912D692E15BD1B
      FBCB972FFCF96F597EFF1E5D037C36CD4390E74A04EF5D8D5B07D6E282FB3238
      2E1C8F11B63D7174CB02DCF7DD82A7E79C71F3F80E6C5BEF09F74D9E88BAE281
      3764CBD07D7CCE1CD99ED22FE14BECD3AFBB69C0D195337069DB6204B82CC5FE
      55D3D1736027184FD781F1725D584D31C1F4B1FDE1BD6D211EF850DEB6725B3E
      17DB92F24673A9245BDEF4B7EFD02EA06F3F436C5B6A8B49A32DD1AA6F53682C
      A903CDD54DD1D1B12DBAB8EAA3BB5327749E6280D1E3ADB07BDD0C5CDBB30A67
      DCEC70E3E01A3C3CB585DB87DE2F4DE7775E7E63FDC60115ACCBA3CEA87F5075
      4825549AA08A9A73ABA1915D3DB459D30C7A9BB560E2D211DD3D3AC1624B67F4
      98D2199326F441FF29669838A52FF6AC9DC9ED436D45666626E7CB9E5F8D0C1A
      05280F5486304C80C27005941AA38CCAD32AA1D6BCEA68B4B41E5AB3387436B6
      86A1537B98ECD04397ADFA3059AD87AE5B0DD0797547988F3794DA87EC4FEF29
      AF52A58A2B4B7F3949FACBF62B0B8A836B903254879747D571FFA0F61475349A
      550FCDE737469B25CDA16DAF099DE56DD061455B2EDAD7B26B8565CB96F177B7
      5FB87081DEC79DC57CD079D47F317E654D6DCD792C0E4F960FAEA69D9ABE99ED
      300B7337CEC57CC77958C8EACF62A78558B27531966E5B02BBEDA4A5E2CF253C
      8CD699A0B954B4EE818E8E0E7F7682FAAF12254A28B038CAB2FCA85A5858A8F6
      EFDF5FD5D4D4F49AA4CD2D8C626262F83A1C070E1CE0EF972F59B2245D7794A2
      F433BE50AB562D81B1051B1B1B61C48811B4265300955161447D898B8B0BAD1F
      93D9BE7DFB676A6A6A0B59FF2AEDDF2B54A82074E9D245E8D7AF9F94CFCA7E12
      D5AFC2A87AF5EA9E952B57F66CD4A8D19C060D1AE8181A1A96A4E7FD15151579
      FF5EBE7C79C1C4C424179FED97ECD1A3876ADB76DAAA559B59A9AAB49AA35AA6
      ED7CD50A462B54554DD748554E6731FFAD5CCB29AA6D753A09C6C6C642D7AE5D
      F938162BDFBFEE9FFC87CEFF298A350054059939B0F47E6A9A2BB874E9527878
      78F0F7D9FFC61C11C99A18E1356BD684B5B5359F3B49E70CF5A7349F75F3E6CD
      183D7A34988FF6CB7C5555D59483070FF2F53C686D127AF697D6F31833660C74
      7575692D21B03AC7A5A0A0F0CBE396C4A07E99DA5956C7406B88D0BC4C7962E7
      0C4A952A052525A542C7C1CE3DEE17B1F318B4065341A239EA140FCD71657E6C
      A19E61D3D2D2829F9F1F5F338A9D83058AD69CA951A3065F5B6AD0A041857AA6
      B55DBB767CBE2DAD4545EBBED01A2AF989E647D7AF5F9FFB54247D7D7DD967E0
      E5D65DE29F3D7B168B162D82A7A7278F63C2840972D5A953276E1F9AD7AAA2A2
      02B2EDD4A953F91C5A2ABFBC754BBB7135299FFC48EA27280E9AE74EEBD1906F
      C6DA40346CD890FA255EFEB4EE12F1A84E505DA37A4CEBEF507B9A973FA94BDD
      5CFCE8E868BE460EC54173B8E9BDEF14073D534E3E209D0FC463ED17BF96A035
      7DA8EC24EBE1E4E54FEF244AFF993367B07CF972BE760EADD343C7531C5477E9
      9C201EF966945E4A0B9D2FF47CBCAFAF2FFF24FF818ECBCBD7A9C9D78108A7F3
      93FA51F2C328FDB40E10D98AFE4BFD2A85515F45DFC92E717171529F87C2680D
      1F8A3F9F735B93D6FBA2F4930D1E3E7C284D0FC543F9A6F0D7AF5F7396EC467E
      3985517F46BEAD3C7E05D1B21C9AECDC4C3976EC184F8BE4784A2BD999E279F5
      EA1567454545F1B0E3C78FF3EF3B77EEE469A7637FD236F17C900F43C74A442C
      CA13950DF164456D2A9585E4D842B47D3C0E2A37593E95F78B172F70FEFC795E
      37497BF6ECE171503E64F885796ED488F5D9BCCE48F8541E54DE5437697D028A
      9F7EBF7DFB363F86E221FF4428FC1CD1E19238884F6542758BCA99F24276A167
      71A86ECBCC1FB2137E6DDE358F83EA3B95C9E4C993A1AD2D9DC7EA29BEE758A7
      669DCBC2BFEA6704B52A078592CADABF3CAF46F8FEECE2F0FFA4393FF9AD875E
      CCFF914F6B29C7C7C7F37BA20909098264DE0FCDCDC93B3F87E6D0C8CEA3A139
      34F2E6FD88F9F80B0A90F0F53AB446F2B333781F7D0DEF5E49741549211EFC53
      AAA82BA230F629D1DBA8401EF6FEF50DBC7D192856402EBEA1813E677EFBF60D
      39D999C8C912E9BDFB50169683ECAC0CA97818BB86CBCEFC2AD57BB721E2B02F
      C8CE1029175F5F8FA78F985F3EBE654A46FA8724BCDB3188333FA724E0F3FB37
      4CF178EB329033D3DEC622353986E9350B1BC0999F125F3145E163C2CB5C7C03
      FD8E3CAFC44A4F4994F2BEB3E2A43CCE62E9FC94142DE5BD75EE8FAC8C747C7C
      F382E9393EC43FCBCDD7EBC8ED989D9981B477F14C229E88F595A73155CC13B1
      BEF0344A78C9CED6C8FA9A8E0F719148897B8A94D827B9CBB7611556463BB91D
      89F9D67900E7242DD3E261C96C5F24EBEF61DBADC5EAC7C2DA89C2B6F5934A96
      AFDFB1032F732A234A1BE595242AB76C9EB6ACAF9FB9BE877D46E6D734647E49
      636136ECBA3D9BEF677E49E5CACDD7C1DB1797A536FC102FB221A58F3829B1A2
      3CA7C43CE6E9E5CCE8877817FD80D58B08246DEBCB996FA3EEB174DE45F2CBBB
      B9F9BA3A4826BEC486621E67519A5F3F6212F144AC34BC7D755FCA4BDADA0799
      E9A98C1186A4E777B872D95FB73D929F5F12E59FA551C24BDA264A2BA551C2E3
      7CCE0AE7BCE4E7619C9F91FE0949CF6E2331F216972CBF23956FF04E6E4751F9
      F4E51C51B9D988F619838BC25C6DBE7FDFDA9B87BD6361894EBDC5EA95A77DD0
      62715F109751AA54C4C9C966612C6D244AE33B1E96858CCF1FA5CA1DF6011969
      1F72F37544FCDC360CE5692326CFF3D3109158DA8893F038086F1EDFC09B4737
      90B8C50A5F1933FEE155C43FB88AB8882BB9EDA3D30E4991E7C5ACDBDF792CAF
      9CF5E4A6981724E273D635294FC44F41DCFD00C492EE5DCECD6FDF9631CF8959
      C1529E28AD1F581AAF8B79D7BEB32202A5BC84CD3DF135F53D62EF5E44CCDD0B
      8809BF908BFFB7DBFFE2FE3DFF8D5D03DEA76740E9BAF457B470E1C28C71E3C6
      9D6AD0A0C1684545C57FF2E3139BAEF9B66FDFCEC7A669FC95EE1DE5DDA77B2F
      498989FC9E12F9B5741D43D71B8E8E8E49D5AA55A397379596C7A7B4905F4DD7
      B45959599C456382927DC9982CDDF74863E1E487D3F3F1340E121B1BCBE3DDB8
      71E3BBAA55AB4E62F9A8208F4F1CE2D146F78AE899D3891327C1D4D41466E6E6
      FC1A98AEEFE8DE10F9001417EDD3F5007DD2F5ACBDBDFD87DAB56BD3E2C3E5F3
      F2C90E1407B1691D5F8F5D9E48484AC6874FA95C0F1F3FC1D66DDB71E0C04164
      B33E88D24CF7A668BD5CBA7EA5B5A8E99979969EDB7439CAA7F1C8F0C9C66413
      4A37B193DFBD97B249294C716F12B078C9127E1DF99A5DA3525AC8FEB4EE2BD9
      97EE8F30FFEF0D4DF7A43936B27CCA23E599C616E21312F1FEC347B97A1D1BC7
      EB0E95091D4FE52211DDEB1B346850024D87959D1F45C7535AE83F26CCDEF9B1
      25A2B107BAB727297789883162C4881FF8D3A64DE3D7E4F47B573333BC4DF980
      778C234FF45BB7EEDDF935301DFF352343AA64F67DE4C89172F9927B93343673
      2FE201B7514C5C3C62E3DF48F5FCE52BF8F9FBF3EB39BABF48631074ED4DA2F1
      8E4496A7FCF864BBB7EFDEE1949F1F366FD98290D03BEC3A91C61E1EE1F9B387
      4C113873DA0B03FA7483D3F2F1D8B26800564FEE02B7C57DE1BAA02706F73143
      0263E46B1F762EF27BBD2C0DBB587D1B396A140B8BC47BE6C7C53CBD811B97BD
      317FE6049CF776C3E797FE083B3213CF7CA623F1DC4CBCF1198BC196BA886775
      303F3E8D83D0F9F881D56912DD2B9B317D223AEBB546E70E8DB1645C37BC7C10
      808C778F989F1480FD73AD71625453C49E9983A44BF3D1D74C9B33F2E31F3E7C
      988FDB511A5E4645F1319AD49468849F5C8E907D0B70DB7518121E5DC5EB2741
      B87DC50B6D9BD6C73A8BFA3835DB80C73162801962585B218F4FE366C4BCC2D2
      9FC0EC131B1F0F3B7B7BA4BF7F85C88B9BF0D86F251E1C5F88E4C71790F2E631
      F3BB22E0E7341727C7B7C5CCCEF5F1DA7716668C1F846856076DE5F0A7303ED9
      24293959AA3973E7E2CD9D7D08DB391821EE36B8EE688527BEF6F892F800991F
      5E31DBAFC7A5296DB1CEAC1E1EEF1A85696307E2156B836C6D6DA933199D8BCF
      DAE777ACFD8967E52BD1CC59B3F0E89C034EAFB1C2CDC30B7079CB40DCD9330E
      8F8E2EC4EB2B3B71CF7D34AEDB99E0E2CC8EB8CA3EC70DEA86172F5FE6CB4F66
      753386958F44B3E7CC41D4B5CDB87B6C015E07BBE0B65B7F5C5DA18BB3D35BE0
      DCF436F019DD14276C35707284068E0FD5C0700B03443E7F8EE1B6B634317F54
      5E3ED984EC27D15456E627370C80E7646D784ED2C1BE197AD833A3233CA677C0
      DE398638B8C00C7B669BE0C8929E38BCB03B06F7EC8C279191C4FFC1FE13264E
      C41B669328663F8976EFD903A7AD5B7369DDFAF5B067F56AE5AA55D27DC96F1B
      58DBFCE8C9130C1D3AF407FE601B1BDC667D12DD930FFE039D397B165656563F
      F0697895E920D3913C0A92A393728E93D52AA636347F50864F839FD5996A32D5
      FA03D51473CAF3299079A6B516A1148AC8752AAFA0A8BCB674D90649A5CAD48D
      1344B3EFCB14115B8D6979955A36399AC637D1CAF00ACA55D2A6B29D58047190
      7D9757ACDAF563EB4EB7A1691404FD5E59ECF386248E317F669352CE556B0FCD
      69657815AA553AA3611B77CE37E803B4337D888A55BBE488E328F33B362176D3
      0EDE50AB6E058DD6CEE86895CED912511CBF612BA94D28DDC4AEDB621DF47A7D
      CDC59648C656430B6F9361395A5D9FF3346BB471CD972D1195B9B85E15C226C3
      72DA9A4630EE0E6E6BFDDE5905B2791E58BDA2BAFB339B2828287D6C6D7C8BA5
      3713EDBA3CFE2997A4D3FD0DA8EED2F9911FBB94B292F3C06E3A392BA6F641CD
      5A7A686D1CCCD29D5D28369513A52DAF2F2D6B9381DD7572EE79AF404AB03356
      4FEF0F8D86DD781C05B1B5CDA240B614B3D5F2B349679DA61F9F9C5ECBD9A4B8
      C0CD3C0ECA477BF3987CD34D6CAA0BF9A45B6413966E59B6ACDC968D906BABDF
      B1497ECA6BABC2DA44BF6DC38FF9A55B56B2B6A27AF5139B084A4A4A6B555454
      7276AD1CF553B6ACA85E51DD2DC0267CAB5BB776D2C0FEBD61D3531FB1971D0B
      C5261B52DD2DC02632FC5A71470EBA63C4B001986263FAD338C886544E54170A
      4AB7CC36545BAB4D42E0A593183EB43FC6F4EF8CC7A7D6E4CBA6BAFB339BE49D
      924E6D29C571DEFF28C68F19CAE3C89B0F6E93EE85B3493E718C313531CAA138
      281FB2B6FA0D9BE4B78D91D88ACA83CA9CEA15D5DD5FB4C94F6D45654EF5AA8C
      8A0AF9C47B99DA5275C823BA0F56893FB620F28128FE52625F48A5803886B27A
      15CFEA2ECDA120FE0BA6BB7244F73197D12D7C261A1BA097EFF462BAC6D4B328
      1C95DA159404FD9AA5FECAD8D47CBDF28DF7F7549BF97A42F5814536DEA5AE22
      9C1D5BBBD6D101FFB8BF5A6F1E9172D9393E6286664C4565A1E4AF702A942BA7
      B865F11C9D37C1971FC75E3AB5C171D6A40ED796EAD4885BDDC62BCA75E8C78F
      C1FB623F794D3F1B3BB5FCA13BC32BDD5BD2AEF4C25FE16F5A3CAF4D54C8B55B
      5F3EB16BE2F858C4DDBDFDE1F1B1ED7E2F9C07A4A75CDF7123C6D1F050F402F5
      233153CB1C8B18A376D5C3A84C50ADB20A950BC35E39674685A7D72F3F22F6D7
      D454A4A77CC097F4AF484B8A03E3E77C38BD2C257673F767AF17D53FF56AA2F2
      E1DB2354034EF5287BAF4F2D45EB026D52BEBCB0D17E49D347D70323689E62E6
      97AF4867D7AE2991A1883BBB054F3776C3E77BDEC809F74476C06AA4EE1A8A18
      3BED0FC1A3D41F1DEB593EC256B3FA4B0D0D8D7CFDCF8D2B96693CBB73EB5A7A
      5A2AB2B33291FA221849173622E92CB5771EC87C750D19B777E2CBA575F87A66
      09B27C6622D9CD06E7A7EA61B27EF50403B3DE1F6A34D7F5552EA1A09497BD62
      F12285885B37EF7D66F6C84C8943F249765D7C71153EBFB88ACCA43BC88CB982
      8C07C7F0F5A60BE3AF45C6E945F8B87B144ECEB5C474D3C619FA8327BDADBF2C
      28BDD2A25BAF4B2908D2E7E0687EA0C3DA3575EFDF0E09CFCACC406AE81EBC3D
      3909D969C9F8969D8AACCF2F9095108C8C1767911171041941DB9179713512F7
      4DC1EEE91698D8B713BAF7EDFBA989EB8B0F75D7847E6AB0FC768630E5FC45A1
      8C1A9DCB2A1B376EA8FB28E27EE0A78F1FF8F8645AC409A4DD3F866FDFB291FD
      351159A94F91F5260819CFFD9179FF10BE5EDF8227BB6760D78CDE983C6118AC
      77F8A0FBD405DFDA8D599956DF31E2437DFB1B5F54D6C745086DFAEF61FCB1D1
      D1D117685EB464CBFEFA0949C747327E16DB7F83AC4F8F9015770359CF4FE35B
      C47E84EF5980D563AC306FE33A8C3E158441A7EEC1EA48183A59F6F8D672FA8E
      F4269EEFBF3669D72556A8506D3BE39BF89C3C39E8B4AFCF9DB8D731A99FD33E
      2327E71BD2C20E20F5810F72B29291F5F12172E2AE21EDF1099C775F8C1573C7
      62D589C31837D916E37D2E63B8FF1DF4F30A83C5BE3BB018BF189DCDAD30B64D
      CDB76DCB0992E7E084861A1AEAF3C70D1A77E784D3F3E76137F18E9E2D383A1E
      DF325919A43D42F2237F1CDBBE049B77ACC5869B97B0EAC50B2CB87411A3C60F
      C5F84B11187EE71306B8F8C3A2DF30AC98331B014EABBFCDA92738942BC1DB6A
      C1B66B8D72B756B5727E7BC32DF1E52D7F3CB8E28F879E33F0F95920E25EDEC2
      21E715D8B4750D966F5C81ADEF63B12E32022B5FBDC1546F5F8C74DA83FEF68E
      1862DD1FAE0E0E080F08C495430771C8BCC1CBC6654573E318BF62AC4B87BD59
      096154C0C88863DCC0AD38BF692CB66D598F557E67B12CE613EC8E1EC0EA036E
      70CDCCC1A634C0EE41346CE7DB61F684F1B81D7805F703037066C32A1CEFAE91
      B2BAA1B0B756E9EF73EF86E9FF533961A7A957E6F353484FBC8DCBDEDBB179E9
      24ACDC7714331FA4C02EF23D367CCAC6D2A3C7B021F40E36DCBD8BC9336661CB
      BA75B81B7207373D9DE13FC204DB34CB9CB5AC224C65B6A9CDB0B99E631BAE57
      A9EAAD8D66BBCFED77F8E674F038461F0FC70287CD58F220157631DFB0EE2DE0
      189F80D18B97F031465F6F1F3CBD730757E70F8277A7AAAF875617A6B134B717
      737F3887B7EF706B3C73D61CF7E14BB63CE9EE95FA6DF8C54F18EE1B89B98E3B
      B0F8D13BAC8A7E07FBEDAE7CDEE38BF09B78BA6B6DE6EEF6659FCCAFCBC735E8
      85329565C7CEF36E83070FAEBC70DEDC3E16339CF66ABAC7C5F63B1E9B3DD4E7
      25A6FA3DC41CB7DD98EBE08813470EE1F6CE35B839D6E0FD902AC2CAA6650463
      F6D77FC4FD7A811BCD2BAE5BB78E30D8BA57139D39EE375BEF8D8FEEEB93903D
      7ECD562C5AE5001FCFED081EAF95EDA453E9A84E05A18F82E845A2A57E674CA3
      4F5FEB5E4DE77BFA180C1E7D7DA565A3F493235A27EC352E1DA25799FB0AD5F3
      BBDF52D84DAB6DEBE67A0686C735DBB41DD1A351F9A9D61ACA43CB97E43E8E6A
      41362EEC56B1A26A555D5DDDAE55AB56AD240E5296BD2F51E867A868C052AD89
      505AA317FF6EAD35593836FE895076476941A557295626A2A1345BF1B1FC9A44
      E678C9BE47D960616ABD8B82B18E37D30941A3CE60FE5F5BE6E6F55131353655
      1B6F6F2C18DB4FAA31D7DE59EBB87D174B537BEB260D8C472B9510287C3AD36E
      26DAEFACD2CF9E8E277E7D152DFE5FC792FBEDE755DC656FABBE83C9C5BEADEA
      206325257A1494FD43B0B5B717EC9157C4A334CBFB8D2488FE2DF7BFC6C2407B
      1AEAA34A602A3E4610CC584D63D5595157C8CB97ECCB3265F74B373A2E68B43A
      C1EDC3F94A7DED85D28D843E25470B131467F263EAAA2F64E5CA5C8C929AA234
      979F6C6FAF3E80EFCF54EC644FB622B7D958E825E65763FB9622FEF8F542D5CE
      33040DF1F1BD2A0CB2AF5BB31D2F17B21D8F93954BDD3A13058A97BE932D25E9
      315532B11795F5777B52FEC90E9C7F6CBC50DA5A8BDB83FFB79AADBD716B6381
      C24DAD67CBB5219513C5999FFDE9373AA6A0B25362716AB4EB29AD3F92BA41BF
      6F2E6F614CF6A1FD99E270636103D3587E2CF17B35DD6BCCD3319AD5B1B6A23A
      463A29D4352EA83E078AEB7BE00FE7C80E264BDEE418EB78F1BA4E520861E7C8
      68E187FF090AA5990D4DE5E6D1C4DAD85EF958FEF593FEBF3B9FFA29B58F5A0B
      A1B34A7F7B499844F47D463363FB51D622FE66C13650F21BEDE7E5E7FDAF844F
      7926BB4A8E9728BFFA2FCBCCBB2FEFBF8539E64FF8B6C26061BA30A5C03CFE89
      7D04E1342B5FF7DF6A7F0A53BEC25D76193B5EF4CE583AD746B3F381C2EF953E
      26842859FF50DF64EBAA6C187D974836DC96B17B69F533A6F385CEE399CD06F3
      3C1E5172B65FA968616C2B4EA3AC24E75A20BF6152D798C2E8BB44F47D396BB7
      291D05E591E2A4F3E877EC43F148F25254F5C796BB136D84EF6913D967BAD66C
      B97CB203E5B1F0FC722CB7D5F8F1D4DFD98ACBD778FC61B97C491E0BCB1F2176
      2C72D7CFA9AC7ECE2BF2FA29B58FA0C3FEAFC7EB804B3563FBADE5E8FC11D5A5
      911DC6B0F6B97FAEFA437D4B6795D13FAD3FF62CDC364FBDF66A2D0887AA519A
      44E782C60C07DE06E76A6F596E95D4CC0B5DFF8DF475307A506774D4698BFE3D
      0D606EA2C3F75BB468F1C33E1D271185F7193494879BF61C80013DF5A16FD20D
      C30659488F11B14D90113A0B07D6F5C10BFFF1B8B27B28DF5F37CBEC877D3A4E
      2233FDD5986FF70C2B262F85BE550C2EBBCF430BDD20849D72961E43ECD1834D
      9111B640AE3E3DDE83A4A85B727F0B6BD793A9079E8F1D8C00C118C9AEE3449F
      6E93A4C7107BF4E0AEC8B867CFF5F5DE6A243DBBC8E72625DE3FC09FE7A079F8
      8FC303F1296CADF4B8C28AD8A36DCCD875FF6AAE97777DF9F31C34E783E64CD1
      1C107AB685E6E65F3B77102977D64B8FCDABE8FBABE11ABC0CCEC18BE11C368F
      7F5A0EE8823136DD90F9D0014F830F7316CD53A2E79068EE103DE7417323F6EE
      DDCBDF277FFC800B3F569E8243EDA173D2128D0FB74053E75A68B1A13EDA986B
      62CC100B643E764258C01E5CF4DB87733EBB71E684074E1D7383CF911D3F888E
      95A7C7771D61B57B145A2ED741C3B98DD160763D689AB4627C4B643EDDF1C7CA
      78E2C2AE951DA033723BEA0C74C0BF56F668AECBEC33B407329F7914893CF7BB
      A135E3FFDB6B1554CD16A3A98E29E35B21EBE5FE22D12EC7B568DD7B25D47BAE
      C4BFDD97B0F3A12BC60CEB85AC57478B443B1CD6A3B5F9226858D8A346970568
      DE81D967581F64BDF62E029D84CB2647E85B2C46E3AE8BD058772ADA6875C298
      E1FD9015EBFF83A212AFC90D27EDF49980BAC76BA1C9E2FAA8E5591981D1EB78
      B88B8B1BBA0F5E879626F350D370169A91FD6DAD91157F3197AEA53C84E5F30F
      088908FCE137D29D100FF49CB708AD27AEC664872578FDE8200F77D9EA02FD81
      6BD1C86C1E1A98CE47CB8EE68C3F005909577329EA5D18AC7C1FE0F5CBEB3FFC
      26D1A3F033B875D31F6F9E074AC39CDDF7A1FDB04DD0B05C8AC6CCFE9A7A8C3F
      62205EB176E1BAFF4EDCBF7608D9C921BFAD1DDB3DA0337C0BEAF7588646A60B
      D04AD78CF107C361C52C741B320DCBB778209BA53DE1E56D3C08BD8827A1A7F9
      F7C26A87DB0168D96E433DCB65686CBE049A649F913678F5E012F607272229F1
      05B2531EE0E2395FFEBC98BFF71EFE3D2CE5387ADED182E53D2DF4F7D58267CA
      4A1E9E573BF69D44EB11CEA863B10C4D591CADC93E238762D7FC3B08175A639A
      7E10B23F3E637C3FFE1CE1D1FDAEFCFBE3C767613E6B1C6AF75E820EE396E2E4
      A5AD3C3CAF5C5D0FA1F5A04D68DC63399AB373ACB541778C19350CDF164C076C
      AC01FD0EC8497D85FD7B3DF85CC7437B77F0EFA4B0887B70F30E804F4090342C
      AFF67A7A417B80039A75B74333768EB5D6EF8EF663B4D039A226FA7A3583F1AD
      0A3049EE00AD63F5D120AC1E5A263545D8970BC8F91C5F281DF3BE08DD219BD0
      D46C011A765FCCEB8FA6792BA8EF6D8072371B40CDBB0E6A6EAB83AA47EAA3AE
      6B7D745FDE0A8F5F0422E7EBBB42C96D970FB40739A081F134D4B65C88567A66
      686568869A8357E3DFDE2BF06F7F7BA8DB2C434DEB1568DD67253CF6FA2327F3
      532195CACAF71CF4866C446DC389A8D17D066BDF3AB336A2039A75E88AA6ED4D
      597BDD152D3A9AF176A90DDBB7ECD10763C68C2AB42C7BF5477BC3EE68A5DD09
      2D754DD0465B07B2EB48FE893E7EFC507AC624DB7EB5AAA804D757AF9E524B4D
      69CF4E97CD8D8B8A3F73D288710DEB68C4E87759FECDCCDA1B9AAD7B64531C45
      C1B65B38A377BDEA55923AF774C3E0995F31640E4071503EFE847BE54AA0CA8C
      49232636F8B744B2665D15B46D6B853E6323791C940FB2D5EFB277EFDE2D542A
      AB30A966658538A316E530C8F01F68372CC7E3A07C90ADA83C7E975DA74625EB
      3A0DAABD6D6C6C8466F52B703E89F241B6A2F2A032FF55F6962D9B5528DD751B
      D678DBD1D90FDACB5DD1A0553334AB570146CDCB816C45E5F12736A9D7BC419C
      8EC37EB45FB5138D3B1AA0E30C5734D135424D358558561EE3FFC426946E62EB
      6E3E0E8DD6ADD071D64E182DF743DDBAD59289CD6CA2F247367139CDD34D6CC3
      25C7A13F7F3FEAD5AB513436D970E0BB4D58BA895DBF7183D81913474CF8339B
      A8BF25B6EE66AFEF3659719AA79BD87F6613F5B77A3BFC656CE205FD050750AF
      3EB3C982197DFFC8262D34E23A6C3898DB268C5D5436E9B0F12074B7C8DAC49F
      A55B9D6C32F18F6CD248FDADFEAECB30BD94FCAD659FE1629B1CE4ECDFB509A9
      52596108B7C9C643E8E0780CFA0E3ED9DD0E267FD35F7810F59B68C4515BF6BB
      EC458BA697AA5559F159F301C3A0E37080DBC460F131745A7799D2FD96D8BF63
      13524C74946257C336F39B35AEFEAD7EC3EAA853BB32ABDB07A0BFF010EA3550
      7FCBCAA31F95CBEFA67DE31AFBA6B5AB94BC3B77AB2B8CBB1AA14183EA686539
      8CDB84CAE34FD80F22C24B76685D6F919E91F69763511F4171503EC856541E54
      E67FD207B9EFD8AC554B4D2192F513A038281F642B2A8FA2E83BD5D504C7DA95
      15BE511C940FB2554CF42BC5A2EAF7193780E2A07C90AD8A8A2B6F1DF7E2AD68
      B6BA75EB960F0F0F37FAF60D3B7272BE79303B8F333636AEC5C2158A821D1818
      38E775545282E7B66BEC9A3D1017FCEE7ECBC9FEE6C7C23BFC691C2CDD3D5FBF
      4A4A9A35C21BA3DABFC238DD68D874BC064FE74BD9D9D939E7593EEAFE2A93FD
      478DB511E6CC0E4352DEA5C5DA4D3D83513AB170190DB88E05965A0003DA84E2
      D4B130309BCDFF55FEB79C6FCB1E3F88F91C78FE3E8EEDBD8D815AC158D9379B
      B3492B7A01039B2463E3FC5B48FF9C71FE57F99F3EA6DF5EE6761306CB0360A9
      B513435BA6614E67609B2DB086F536933A00D60DDF60D3C2107C49CF08F885B2
      5464F66E9596FA25CED1E134341706A2855D08BAB50EC5D0E699B06D090C6BFE
      0D831AA66274A7EB08BEF6E40B3B7E5C61D9AC3E18657CCD0AD9BFF33276B9F8
      63C5CA1368B22614AD66DC44F7660F31A0CE67F4AEF312932D6E22E8CAE32F39
      D9397B5859552B643D699895957D6DE7D67339278E5CC1CB17AFF0E2F92BCC73
      F04793756168B9F00ECCEAF960DDFC00BC789A440F4F2E6575A046C58A150B65
      9BECAC9C5D278FDCC4A1DD17F9B35D123D7FFE02AB379E84E68A20745C7905E7
      4EDFA56BB8A5BF529EB6B6B665E363DF7D70DF7A1A11F79EE6E2473E7D86DD6E
      A7E0C0CA638CC3555CBDF2F81BE34FFA157E404080DE930731F0647E5B6C4CAC
      944DE3C6C70E5DC021CFCB6075EAFD9BB8F75FBF7EC93C357DFA748DC2CD79A8
      A8C06C5887B529677C8E06E1BC7F307F76F1E5CB280407DDC55EF7D3D8EB7A31
      9B954B102B9F16BF5ACF195B839DE3C72F9FBD97E1EA740AF7EF3D86D7914BD8
      B6C10BEE5BFD70C627949E6FF517B733BF3C8783FDD7F1E2E9F0CC6D1B4EE2E6
      8D70383B7AE3BC5F28D8B98BE4C48F892C5FEB58FDABF3BB6D58EAC7F41BFBDC
      2FE2C4D100ECD8EC8B87F7A23FB1B2DBCBCAA3252BF33F9EA4CAD2B7ECEE9D17
      995E87AEE151C4EB14668755F6F6F6958BAADF60F5A03A4BEF4C761EEE66E537
      98D9A1F8DD0EFFC35BB972E514EBD7AFDAB0478F7623BB9999867533EFFCA067
      CF0E13EBD7AFD6887EFB5DAE8A8AB28286867A3D037DAD29DDCC0D832D4CC765
      5875F68055E75DB0309D9CD1CDDCF8A6BEBED60C0D8D9A8D4A972EF54BF1346E
      5CB79C9E5ECBB9E6E6BA21DDBB0CF96465E88DC1A6F730B66734D76093085819
      FAC2A2CBA8B46EDD74C3D8B1F6CD9A155CD7CA972FA35CB76EF5B6DDBBEB2EEB
      6666166761323DBBA7C1F96FBD746330B8731CC6F488858D491CD770F338F4D5
      8F477FE3D7E86518F0CDD2744E7637B36E49ECBFEBEAD6ADD69EB14AC9D8A124
      CBA396B1715B7BC67D6C61322FBB87D1D16F56BAAFD04B375EAADE1DE3737D27
      D998C6A10F0BB7D27D8D9E86DE39169D17E6B0785E181BB75EC5981D99DD94F5
      F55B3A31FB3E36339AFCB56B7B6FF4E8F0E8074E61D5A3C36374D53E09C6CAE8
      6666F8AC63C7964E24CE379EFCD554EB38BAB6BD090BEDE7B0EA105B682E1D4B
      FFE9DA3604A65A5E602C56FE8691C4FE6E9FD676E65DBB2499194D43179D5D30
      6F7B17165A2F0A8CC7AA431C2CB55FB263EFB1FF78C2CC7026CCBB9A2531D672
      B28F8A4A29E56AACB7B7B0A852C7D4546BB5B9A5415A67DB11D95DFEAB73B38D
      69EA8CE2F8C7996D2E3166D9B2AA7C313828E3A52FF7B676684BB92DB408B4B1
      588A6E8823D6B575CE09125DB6C170CA820CC88CC9343886CDB444C924BA51C6
      C8602453A048A60454DE12E332650B43645369FF3BE79A65C9B2C56C1F4E72F2
      9CFFFFF7DCFBDC3CCF79FAA10E373F03BDEB6958D22E136392D6F86F6B214C53
      6D58D6588D3EB0C75CBC35CA0C663193D9D9D9BA8FB372D6CD9AB6974735C7C7
      A10C4791D83107DD074DC8282E8625AB049270021675AFBC0639C238ACEAEF1E
      8D518D35AC658FB2230ACDB171102BC64C999DA5FBC89A27DD3006AA16C5C608
      5243BF21E902CDD1F5102FB54D43A83D850CFAD96E357B61D1D7CBC1398F718D
      3509A44DFA322A7BC5860888156526B1EB962D7BE6E9C4C47835EDA577A502E7
      AC71C7DB101B0791D21683F2ABA8EC4D3E3B056DE317C8D8B21D664F0984BA56
      1A9B44C2370FE56766AD70E40718FD55905CCEBB76FBDA9AD4D4780DB3972F5F
      FA544ACA6ADA57BA4ABB5B3327F9859854AA83C957067D6D0F542D3FC9F32476
      D15CDD8B8F8272E6A6056748D30BD3EB6590B68960AFBD483D47AC2A626A89BF
      D466130EDB1DDAEB1BF7242CBA9BE360EA5742D7ABC6FA062D32FD666478DF84
      BE268CB4533FCB6BC0C1B9BEA6939EA102E68005EBEBB5D077AB646F61701588
      1525E694D5AA6FE06F60CB11671D3B93A25B43CFA1A8E7795806E3215C5141D7
      A346FA710DA4922C984B02587BF0821C9C67D218D758C3DACCA117E1212F3398
      C54C66F319A1503CBB5292D4D5D91BC47B0E7F52EC954F56A0B0E30558691EC3
      956408C32ABC1CA4F77943446640447A9316E2900A86ABC9B044D6C01D56E0D5
      630A3877296336624892A6D660D0AEE6BBE89225BCBF145A9329E53DB7CB74FB
      9DF22DF0EFCCE37744D1D1386CEA5410231EFAAB2910075472E84652210DAD41
      C1D72BE0210D6BD9C35E7781E936B398C96CDEC379B986D1AA32C7EF97DA2A70
      33F2196E5C3C89E6A315282ECD44BE37199EA695D8F4AD02665A030ECE3D2756
      C935D6B0963DEC6506B1EEE713F3CFF387F863EF973BEF5F3AB31BB7FA0EE1EE
      E8492C4C9CC39D9136B4070FC0E7CD87DB2B60737D9C1C9CF318D758B330D12E
      7B6EF51D443F3198959F671863369FA174568846635A75A1CB78AD669F2B166E
      F66366A09E3C2DB2773AF239CE3457627FF9663938E7B185C976CC137766B001
      9DE4A9D9B731565860BCC62C6632FBAFFF493CF904F517B5DDAEAFA4797EACDC
      E388F58576D33C87313F761AF313E771F372480ECEEF5D6FC52F0375E83F5B86
      EABDCE98DB65BC63B7EB3EA4FEA261D6E3FA23F58572EA47FDBED7B2E6C39FFA
      30DE7D00BF8E0431371AC454CF2174B5F8F1D60EDB82DDA61F226DE5E3FAE3BF
      F6F7744D80BED5C5BD810D0F42474AD14AB17F57EE0367BEE17BAAFDAFFEFE4F
      F793DC5CCD369773DDB0CB993EF25FEE277F006A820446
    }
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
    Left = 194
    Top = 96
  end
  object OpenPaletteDialog: TOpenDialog
    Left = 139
    Top = 162
  end
  object SavePaletteDialog: TSaveDialog
    DefaultExt = '.hex'
    FileName = 'default'
    Left = 344
    Top = 276
  end
end
