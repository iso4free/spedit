object frmImportSheet: TfrmImportSheet
  Left = 299
  Height = 365
  Top = 199
  Width = 881
  AllowDropFiles = True
  Caption = 'Import sprites'
  ClientHeight = 365
  ClientWidth = 881
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDropFiles = FormDropFiles
  Position = poScreenCenter
  LCLVersion = '8.1'
  WindowState = wsMaximized
  object pnlTop: TPanel
    Left = 0
    Height = 40
    Top = 0
    Width = 881
    Align = alTop
    AutoSize = True
    ClientHeight = 40
    ClientWidth = 881
    TabOrder = 0
    object bbSpritesheetOpen: TBitBtn
      Left = 1
      Height = 38
      Hint = 'Import spritesheet from image file'
      Top = 1
      Width = 145
      Align = alLeft
      AutoSize = True
      Caption = 'Open spritesheet'
      Images = frmMain.ButtonsImageList
      ImageIndex = 4
      OnClick = bbSpritesheetOpenClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object lblNameTemplate: TLabel
      AnchorSideLeft.Control = bbSpritesheetOpen
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = pnlTop
      AnchorSideTop.Side = asrCenter
      Left = 166
      Height = 16
      Top = 12
      Width = 92
      BorderSpacing.Left = 20
      Caption = 'Name template'
      ParentColor = False
    end
    object edNameTemplate: TEdit
      AnchorSideLeft.Control = lblNameTemplate
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = pnlTop
      AnchorSideTop.Side = asrCenter
      Left = 268
      Height = 28
      Top = 6
      Width = 80
      BorderSpacing.Left = 10
      TabOrder = 1
    end
    object cbSizes: TComboBox
      AnchorSideLeft.Control = edNameTemplate
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = pnlTop
      AnchorSideTop.Side = asrCenter
      Left = 353
      Height = 26
      Top = 7
      Width = 100
      BorderSpacing.Left = 5
      ItemHeight = 0
      Items.Strings = (
        'Normal'
        'x2'
        'x4'
      )
      OnChange = cbSizesChange
      Style = csDropDownList
      TabOrder = 2
    end
    object cbGrig: TCheckBox
      AnchorSideTop.Control = pnlTop
      AnchorSideTop.Side = asrCenter
      AnchorSideRight.Control = pnlTop
      AnchorSideRight.Side = asrBottom
      Left = 770
      Height = 23
      Top = 9
      Width = 110
      Anchors = [akTop, akRight]
      Caption = 'Import as grid'
      OnChange = cbGrigChange
      TabOrder = 3
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Height = 36
    Top = 329
    Width = 881
    Align = alBottom
    AutoSize = True
    ClientHeight = 36
    ClientWidth = 881
    TabOrder = 1
    object bbImport: TBitBtn
      AnchorSideLeft.Control = pnlBottom
      AnchorSideTop.Control = pnlBottom
      AnchorSideTop.Side = asrCenter
      Left = 3
      Height = 30
      Top = 3
      Width = 119
      AutoSize = True
      BorderSpacing.Around = 2
      Caption = 'Impotr frames'
      Default = True
      Kind = bkOK
      ModalResult = 1
      TabOrder = 0
    end
    object bbCancel: TBitBtn
      AnchorSideLeft.Control = bbImport
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = pnlBottom
      AnchorSideTop.Side = asrCenter
      Left = 124
      Height = 30
      Top = 3
      Width = 74
      AutoSize = True
      Cancel = True
      Caption = 'Cancel'
      Kind = bkCancel
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Height = 289
    Top = 40
    Width = 170
    Align = alLeft
    ClientHeight = 289
    ClientWidth = 170
    TabOrder = 2
    object chgrpSelections: TGroupBox
      Left = 1
      Height = 247
      Top = 1
      Width = 168
      Align = alClient
      Caption = 'Selections'
      ChildSizing.LeftRightSpacing = 6
      ChildSizing.TopBottomSpacing = 6
      ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
      ChildSizing.EnlargeVertical = crsHomogenousChildResize
      ChildSizing.ShrinkHorizontal = crsScaleChilds
      ChildSizing.ShrinkVertical = crsScaleChilds
      ChildSizing.Layout = cclLeftToRightThenTopToBottom
      ChildSizing.ControlsPerLine = 1
      ClientHeight = 230
      ClientWidth = 166
      TabOrder = 0
      object dgImportedFrames: TDrawGrid
        Left = 6
        Height = 218
        Top = 6
        Width = 154
        ColCount = 3
        ExtendedSelect = False
        FixedCols = 0
        RowCount = 1
        TabOrder = 0
        OnDrawCell = dgImportedFramesDrawCell
      end
    end
    object pnlSelections: TPanel
      Left = 1
      Height = 40
      Top = 248
      Width = 168
      Align = alBottom
      AutoSize = True
      ClientHeight = 40
      ClientWidth = 168
      TabOrder = 1
      object bbAdd: TBitBtn
        Left = 1
        Height = 38
        Hint = 'Add current selection as frame to selections'
        Top = 1
        Width = 38
        Align = alLeft
        AutoSize = True
        Images = frmMain.ButtonsImageList
        ImageIndex = 22
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object bbDelete: TBitBtn
        Left = 53
        Height = 38
        Top = 1
        Width = 38
        Align = alLeft
        AutoSize = True
        Images = frmMain.ButtonsImageList
        ImageIndex = 7
        TabOrder = 1
      end
      object bbClear: TBitBtn
        Left = 39
        Height = 38
        Top = 1
        Width = 14
        Align = alLeft
        AutoSize = True
        Images = frmMain.ButtonsImageList
        TabOrder = 2
      end
    end
  end
  object pnlSheet: TPanel
    Left = 170
    Height = 289
    Top = 40
    Width = 711
    Align = alClient
    ClientHeight = 289
    ClientWidth = 711
    TabOrder = 3
    object ScrollBox1: TScrollBox
      Left = 8
      Height = 287
      Top = 1
      Width = 702
      HorzScrollBar.Page = 669
      VertScrollBar.Page = 254
      Align = alClient
      ClientHeight = 285
      ClientWidth = 700
      TabOrder = 0
      object imgImported: TImage
        AnchorSideLeft.Control = ScrollBox1
        AnchorSideTop.Control = ScrollBox1
        Left = 0
        Height = 248
        Top = 0
        Width = 312
        AutoSize = True
        OnMouseDown = imgImportedMouseDown
        OnMouseUp = imgImportedMouseUp
        OnPaint = imgImportedPaint
      end
      object pnlGridOptions: TJvMovablePanel
        Left = 440
        Height = 238
        Top = 16
        Width = 229
        AutoSize = True
        ClientHeight = 238
        ClientWidth = 229
        TabOrder = 0
        Visible = False
        object sbCloseOptions: TSpeedButton
          AnchorSideTop.Control = pnlGridOptions
          AnchorSideRight.Control = pnlGridOptions
          AnchorSideRight.Side = asrBottom
          Left = 208
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
          OnClick = cbGrigChange
        end
        object gbGridSize: TGroupBox
          AnchorSideTop.Control = sbCloseOptions
          AnchorSideTop.Side = asrBottom
          Left = 1
          Height = 45
          Top = 21
          Width = 227
          Align = alCustom
          AutoSize = True
          Caption = 'Grid size'
          ClientHeight = 28
          ClientWidth = 225
          TabOrder = 0
          object lblCols: TLabel
            AnchorSideLeft.Control = gbGridSize
            AnchorSideTop.Control = gbGridSize
            AnchorSideTop.Side = asrCenter
            Left = 5
            Height = 16
            Top = 6
            Width = 53
            BorderSpacing.Around = 5
            Caption = 'Columns'
            ParentColor = False
          end
          object lblRows: TLabel
            Tag = 5
            AnchorSideLeft.Control = spCols
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = gbGridSize
            AnchorSideTop.Side = asrCenter
            Left = 128
            Height = 16
            Top = 6
            Width = 32
            BorderSpacing.Around = 5
            Caption = 'Rows'
            ParentColor = False
          end
          object spCols: TSpinEdit
            Tag = 5
            AnchorSideLeft.Control = lblCols
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = gbGridSize
            AnchorSideTop.Side = asrCenter
            Left = 63
            Height = 28
            Top = 0
            Width = 60
            OnChange = spWidthChange
            TabOrder = 0
          end
          object spRows: TSpinEdit
            Tag = 6
            AnchorSideLeft.Control = lblRows
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = gbGridSize
            AnchorSideTop.Side = asrCenter
            Left = 165
            Height = 28
            Top = 0
            Width = 60
            OnChange = spWidthChange
            TabOrder = 1
          end
        end
        object gbCell: TGroupBox
          AnchorSideLeft.Control = gbGridSize
          AnchorSideTop.Control = gbGridSize
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = gbGridSize
          AnchorSideRight.Side = asrBottom
          Left = 1
          Height = 45
          Top = 66
          Width = 227
          Align = alCustom
          Anchors = [akTop, akLeft, akRight]
          AutoSize = True
          Caption = 'or Cell size'
          ClientHeight = 28
          ClientWidth = 225
          TabOrder = 1
          object lblWidth: TLabel
            AnchorSideLeft.Control = gbCell
            AnchorSideTop.Control = gbCell
            AnchorSideTop.Side = asrCenter
            Left = 5
            Height = 16
            Top = 6
            Width = 36
            BorderSpacing.Around = 5
            Caption = 'Width'
            ParentColor = False
          end
          object lblHeight: TLabel
            AnchorSideLeft.Control = spWidth
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = gbCell
            AnchorSideTop.Side = asrCenter
            Left = 111
            Height = 16
            Top = 6
            Width = 40
            BorderSpacing.Around = 5
            Caption = 'Height'
            ParentColor = False
          end
          object spWidth: TSpinEdit
            Tag = 1
            AnchorSideLeft.Control = lblWidth
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = gbCell
            AnchorSideTop.Side = asrCenter
            Left = 46
            Height = 28
            Top = 0
            Width = 60
            OnChange = spWidthChange
            TabOrder = 0
            Value = 32
          end
          object spHeight: TSpinEdit
            Tag = 2
            AnchorSideLeft.Control = lblHeight
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = gbCell
            AnchorSideTop.Side = asrCenter
            Left = 156
            Height = 28
            Top = 0
            Width = 60
            OnChange = spWidthChange
            TabOrder = 1
            Value = 32
          end
        end
        object gbCrop: TGroupBox
          AnchorSideLeft.Control = gbGridSize
          AnchorSideTop.Control = gbCell
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = gbGridSize
          AnchorSideRight.Side = asrBottom
          Left = 1
          Height = 81
          Top = 111
          Width = 227
          Align = alCustom
          Anchors = [akTop, akLeft, akRight]
          AutoSize = True
          Caption = 'Crop'
          ClientHeight = 64
          ClientWidth = 225
          TabOrder = 2
          object lblLeft: TLabel
            AnchorSideLeft.Control = gbCrop
            AnchorSideTop.Control = spLeft
            AnchorSideTop.Side = asrCenter
            Left = 5
            Height = 16
            Top = 11
            Width = 24
            BorderSpacing.Around = 5
            Caption = 'Left'
            ParentColor = False
          end
          object lblRight: TLabel
            AnchorSideLeft.Control = lblLeft
            AnchorSideTop.Control = spRight
            AnchorSideTop.Side = asrCenter
            Left = 5
            Height = 16
            Top = 42
            Width = 32
            Caption = 'Right'
            ParentColor = False
          end
          object lblTop: TLabel
            AnchorSideLeft.Control = spLeft
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = lblLeft
            AnchorSideTop.Side = asrCenter
            Left = 119
            Height = 16
            Top = 11
            Width = 23
            BorderSpacing.Left = 10
            Caption = 'Top'
            ParentColor = False
          end
          object lblBottom: TLabel
            AnchorSideLeft.Control = lblTop
            AnchorSideTop.Control = lblRight
            AnchorSideTop.Side = asrCenter
            Left = 119
            Height = 16
            Top = 42
            Width = 46
            Caption = 'Bottom'
            ParentColor = False
          end
          object spLeft: TSpinEdit
            AnchorSideLeft.Control = lblLeft
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = gbCrop
            Left = 49
            Height = 28
            Top = 5
            Width = 60
            BorderSpacing.Left = 20
            BorderSpacing.Top = 5
            TabOrder = 0
          end
          object spRight: TSpinEdit
            AnchorSideLeft.Control = spLeft
            AnchorSideTop.Control = spLeft
            AnchorSideTop.Side = asrBottom
            Left = 49
            Height = 28
            Top = 36
            Width = 60
            BorderSpacing.Top = 3
            TabOrder = 1
          end
          object spTop: TSpinEdit
            AnchorSideLeft.Control = lblTop
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = lblLeft
            AnchorSideTop.Side = asrCenter
            Left = 172
            Height = 28
            Top = 5
            Width = 60
            BorderSpacing.Left = 30
            TabOrder = 2
          end
          object spBottom: TSpinEdit
            AnchorSideLeft.Control = spTop
            AnchorSideTop.Control = lblRight
            AnchorSideTop.Side = asrCenter
            Left = 172
            Height = 28
            Top = 36
            Width = 60
            TabOrder = 3
          end
        end
        object gbOffset: TGroupBox
          AnchorSideLeft.Control = gbGridSize
          AnchorSideTop.Control = gbCrop
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = gbGridSize
          AnchorSideRight.Side = asrBottom
          Left = 1
          Height = 45
          Top = 192
          Width = 227
          Align = alCustom
          Anchors = [akTop, akLeft, akRight]
          AutoSize = True
          Caption = 'Offset'
          ClientHeight = 28
          ClientWidth = 225
          TabOrder = 3
          object lblX: TLabel
            AnchorSideLeft.Control = gbOffset
            AnchorSideTop.Control = gbOffset
            AnchorSideTop.Side = asrCenter
            Left = 5
            Height = 16
            Top = 6
            Width = 8
            BorderSpacing.Around = 5
            Caption = 'X'
            ParentColor = False
          end
          object lblY: TLabel
            AnchorSideLeft.Control = spX
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = gbOffset
            AnchorSideTop.Side = asrCenter
            Left = 113
            Height = 16
            Top = 6
            Width = 8
            BorderSpacing.Left = 30
            BorderSpacing.Around = 5
            Caption = 'Y'
            ParentColor = False
          end
          object spX: TSpinEdit
            Tag = 3
            AnchorSideLeft.Control = lblX
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = gbOffset
            AnchorSideTop.Side = asrCenter
            Left = 18
            Height = 28
            Top = 0
            Width = 60
            TabOrder = 0
          end
          object spY: TSpinEdit
            Tag = 4
            AnchorSideLeft.Control = lblY
            AnchorSideLeft.Side = asrBottom
            AnchorSideTop.Control = gbOffset
            AnchorSideTop.Side = asrCenter
            Left = 126
            Height = 28
            Top = 0
            Width = 60
            TabOrder = 1
          end
        end
      end
    end
    object Splitter1: TSplitter
      Left = 1
      Height = 287
      Top = 1
      Width = 7
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Графічний (*.png;*.xpm;*.bmp;*.cur;*.ico;*.icns;*.jpeg;*.jpg;*.jpe;*.jfif;*.tif;*.tiff;*.gif;*.pbm;*.pgm;*.ppm;*.gif)|*.png;*.xpm;*.bmp;*.cur;*.ico;*.icns;*.jpeg;*.jpg;*.jpe;*.jfif;*.tif;*.tiff;*.gif;*.pbm;*.pgm;*.ppm;*.gif|PNG Files (*.png)|*.png|Pixmap Files (*.xpm)|*.xpm|Bitmap Files (*.bmp)|*.bmp|Cursor Files (*.cur)|*.cur|Icon Files (*.ico)|*.ico|macOS Icon Files (*.icns)|*.icns|JPEG Files (*.jpeg;*.jpg;*.jpe;*.jfif)|*.jpeg;*.jpg;*.jpe;*.jfif|Tagged Image File Format Files (*.tif;*.tiff)|*.tif;*.tiff|Graphics Interchange Format Files (*.gif)|*.gif|Portable Pixmap Files (*.pbm;*.pgm;*.ppm)|*.pbm;*.pgm;*.ppm|Animated GIF (*.gif)|*.gif|Всі файли (*)|*'
    Left = 544
    Top = 118
  end
end
