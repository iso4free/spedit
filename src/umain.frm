object frmMain: TfrmMain
  Left = 0
  Height = 480
  Top = 85
  Width = 639
  HorzScrollBar.Page = 85
  VertScrollBar.Page = 211
  AllowDropFiles = True
  AutoScroll = True
  Caption = 'Sprite Editor'
  ClientHeight = 480
  ClientWidth = 639
  DockSite = True
  DoubleBuffered = True
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MainMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  ParentDoubleBuffered = False
  Position = poDefault
  UseDockManager = True
  LCLVersion = '6.9'
  Visible = True
  object BCPaperPanel1: TBCPaperPanel
    Left = 0
    Height = 50
    Top = 0
    Width = 639
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvSpace
    BorderStyle = bsSingle
    Caption = 'BCPaperPanel1'
    Color = clWhite
    ParentColor = False
    TabOrder = 0
  end
  object PageControl1: TcyPageControl
    Left = 0
    Height = 430
    Top = 50
    Width = 639
    ActivePage = LibrarySheet
    Align = alClient
    DockSite = True
    TabIndex = 3
    TabOrder = 1
    ActiveTabColors.FromColor = clWhite
    ActiveTabColors.SpeedPercent = 100
    ActiveTabColors.ToColor = clBtnFace
    InactiveTabColors.FromColor = clWhite
    InactiveTabColors.SpeedPercent = 100
    InactiveTabColors.ToColor = clBtnFace
    object SourceImageTabSheet: TTabSheet
      Caption = 'Source image'
      ClientHeight = 399
      ClientWidth = 629
      object ScrollBox1: TScrollBox
        Left = 0
        Height = 399
        Top = 0
        Width = 629
        HorzScrollBar.Page = 90
        VertScrollBar.Page = 90
        Align = alClient
        ClientHeight = 397
        ClientWidth = 627
        TabOrder = 0
        object SrcImage: TImage
          Left = 0
          Height = 397
          Top = 0
          Width = 627
          Align = alClient
          Center = True
        end
      end
    end
    object Editor: TTabSheet
      Caption = 'Editor'
    end
    object ResultSheet: TTabSheet
      Caption = 'Result SpriteSheet'
    end
    object LibrarySheet: TTabSheet
      Caption = 'Library'
      ClientHeight = 399
      ClientWidth = 629
      object SpriteLibraryGallery: TplGallery
        Left = 0
        Height = 130
        Top = 0
        Width = 629
        Items = <>
        Interval = 100
        OnHover = SpriteLibraryGalleryHover
        OnClick = SpriteLibraryGalleryClick
        TabOrder = 0
        Align = alTop
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 176
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
      object FileLoadSpriteMenuItem: TMenuItem
        Caption = 'Import Spritesheet'
        Hint = 'You can import image or spritesheet file'#10'and add it to the library'
        OnClick = FileLoadSpriteMenuItemClick
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
    object MenuItem1: TMenuItem
      Caption = 'Sprite'
    end
    object MenuItem2: TMenuItem
      Caption = 'Layers'
    end
    object MenuItem3: TMenuItem
      Caption = 'Palette'
    end
    object ViewMenuItem: TMenuItem
      Caption = 'View'
      object MenuItem4: TMenuItem
        Caption = 'Tool panels'
        object PaintToolPanelVisibleMenuItem: TMenuItem
          Caption = 'Paint tools'
          Checked = True
          OnClick = PaintToolPanelVisibleMenuItemClick
        end
        object LayersToolVisibleMenuItem: TMenuItem
          Caption = 'LayersToolVisibleMenuItem'
          Checked = True
          OnClick = LayersToolVisibleMenuItemClick
        end
        object TimeLineToolVisibleMenuItem: TMenuItem
          Caption = 'Timeline'
          OnClick = TimeLineToolVisibleMenuItemClick
        end
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ViewZoomInMenuItem: TMenuItem
        Caption = 'Zoom++'
        Bitmap.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000064000000640000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000F000000AF000000BF0000009F0000001F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000F0000
          00CF041D91FF0330C7FF011C7AFF01040EEF0000002F00000000000000000000
          000000000000000000000000000000000000000000003F3F3F00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000F000000CF0B28
          80FF0A32CAFF0A3ED1FF0637CCFF032092FF000000BF00000000000000000000
          000000000000000000000000000000000000000000003F3F3F00FEFEFE00FEFE
          FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000F000000CF0B2880FF174D
          DCFF1A4ADCFF1148DAFF0D41D4FF083BCFFF00001FFF00000000000000000000
          000000000000000000000000000000000000000000003F3F3F00FCFCFC00FDFD
          FD00FEFEFE00000000000000000000000000000000CF0B2880FF174DDCFF3B6F
          F8FF4275FDFF133ED3FF134BDDFF0D3CC7FF000016EF00000000000000000000
          000000000000000000000000000000000000000000003E3E3E00FAFAFA00C4C4
          C40000000000120D0A007E5C4B000000002F041034FF174DDCFF3B6FF8FF4578
          FFFF224BDEFF0B2AC5FF071BB0FF010523FF0000005F00000000000000000000
          00000000000000000000000000000000001F0000008F000000BF000000FF0000
          00FF000000DF000000AF0000005F0000009F29365BFF3B6FF8FF4578FFFF224B
          DEFF0B2AC5FF0820B3FF010523FF0000005F0000000000000000000000000000
          00003F3F3F000000000F0000008F1D1D1DFF8A8A8AFFB6B6B6FFC3C3C3FFB6B6
          B6FFB3B3B3FF919191FF4E4E4EFF545454FFC6C9D1FF4978F8FF224BDEFF0B2A
          C5FF0820B3FF010523FF0000005F000000000000000000000000000000000000
          00000000000F000000CF7F7F7FFFEDEDEDFFDEDEDEFFD4D4D4FFD2D2D2FFCFCF
          CFFFD1D1D1FFC3C3C3FFB6B6B6FFCFCFCFFFC1C1C1FFA0A2ACFF3C4A8EFF0412
          60FF010419EF0000005FFFFFFF00000000000000000000000000000000000000
          0000000000AF7A7A7AFFDCDCDCFFD6D6D6FFD0D0D0FFD0CAC5FFDFD2BAFFE4D6
          BFFFE1D4C5FFEDE9E5FFF0F0F0FFD8D8D8FFAAAAAAFF797979FF090909EF0000
          005F0000001FD7D7D700FEFEFE00000000000000000000000000000000000000
          003F2B2B2BFFBDBDBDFFBEBEBEFFCFC6B1FFE9D097FFCFC899FF5F8A9BFF5F8A
          9CFFEFDCA2FFF6DCA3FFECD6B4FFF2EBE5FFD6D6D6FF797979FF000000DFF9F9
          F900FAFAFA00FBFBFB00FCFCFC00000000000000000000000000000000000000
          00AF727272FFB0B0B0FFDECC9FFFFFE193FFFFE193FF1F6699FF008CBFFF005E
          A0FF3F799CFFFFE5A5FFFFE6A9FFF2D8AAFFF2EBE5FFC0C0C0FF2E2E2EFF0000
          004FB0B0B000D5D5D500FAFAFA00000000000000000000000000000000000000
          00DFA0A0A0FFCBBC9BFFFFE08FFFFFE08EFFFFE08FFF00559AFF00E9FFFF0095
          C6FF00559AFFFFE4A2FFFFE5A7FFFFE6ADFFF2D8ADFFF5F3F1FF5B5B5BFF0000
          007FF6F6F600F7F7F700F8F8F800000000000000000000000000000000000000
          00FF9B9B9BFFE9CB88FFCFC58EFF4F8095FF3F7796FF00559AFF00E9FFFF009F
          CCFF00559AFF3F789BFF4F829DFFEFDDAAFFFFE7B1FFEBDCC9FF8F8F8FFF0000
          007F00000000D3D3D300F6F6F600000000000000000000000000000000000000
          00FF9F968CFFEFC97EFF2F6E96FF0070ACFF007AB3FF007AB3FF00E9FFFF00B1
          D9FF007AB3FF007AB3FF00559AFF4F829FFFFFE7AFFFE1C7A6FFA4A4A4FF0000
          007F00000000F4F4F400F5F5F500000000000000000000000000000000000000
          00FF9D9084FFD5A56CFF1C6296FF00D6F2FF00E9FFFF00E9FFFF00E9FFFF00E9
          FFFF00E9FFFF00E9FFFF007AB3FF3F799EFFF6D9A3FFD3AE8AFFAFAFAFFF0000
          007F322A250000000000F3F3F300000000000000000000000000000000000000
          00FF808080FFCB9966FF828483FF0070ACFF007AB3FF007AB3FF00E9FFFF00B1
          D9FF007AB3FF007AB3FF00559AFFAEB5A7FFE3B989FFD2B598FF717171FF0000
          006F9D8376000000000000000000000000000000000000000000000000000000
          00DF525252FFAD9074FFCD9C6BFFCEB99DFFBFC1B6FF00559AFF00E9FFFF009F
          CCFF00559AFFBBBAA0FFEAD2AAFFEAC294FFCA9A6BFFD2C8BFFF373737FF0000
          001FD7B4A200342C270000000000000000000000000000000000000000000000
          007F101010FF848484FFB89878FFCD9B69FFE4BC8FFF00559AFF00BADFFF0070
          ACFF1E649BFFF0CCA1FFDCB080FFCD9D6DFFCCBCACFF9B9B9BFF000000BFD4B0
          9E00D8B5A300BD9E8F0000000000000000000000000000000000000000000000
          000F000000DF303030FF848484FFAF9F8FFFC59F79FF7F7F79FF0C5996FF0C59
          96FF7F7F79FFCD9D6DFFD2B393FFCCC6C0FF9E9E9EFF0D0D0DEF0000002F0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000002F000000EF282828FF727272FF929292FFA3A09DFFB1A497FFB6AA
          9DFFBFB6ACFFBCBCBCFFB6B6B6FF888888FF0B0B0BFF0000005F000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000001F000000BF000000FF313131FF5E5E5EFF6B6B6BFF7070
          70FF757575FF5C5C5CFF202020FF000000DF0000002F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000003F0000009F000000DF000000FF0000
          00FF000000EF000000AF0000005F000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000
        }
      end
      object ViewZoomOutMenuItem: TMenuItem
        Caption = 'Zoom--'
        Bitmap.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000064000000640000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000F000000AF000000BF0000009F0000001F0000000000000000000000000000
          000000000000000000000000000000000000000000003F3F3F00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000F0000
          00CF041D91FF0330C7FF011C7AFF01040EEF0000002F00000000000000000000
          000000000000000000000000000000000000000000003F3F3F00FEFEFE00FEFE
          FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000F000000CF0B28
          80FF0A32CAFF0A3ED1FF0637CCFF032092FF000000BF00000000000000000000
          000000030700002249000053A0000064BD000065BF003F3F3F00FCFCFC00FDFD
          FD00FEFEFE00FEFEFE00FFFFFF00FFFFFF000000000F000000CF0B2880FF174D
          DCFF1A4ADCFF1148DAFF0D41D4FF083BCFFF00001FFF00000000000000000000
          0000000C1A000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000CF0B2880FF174DDCFF3B6F
          F8FF4275FDFF133ED3FF134BDDFF0D3CC7FF000016EF00000000000000000000
          0000000C1A00130F0C009A746100946D5A0097705C009D766200A37C6900A983
          7000AF897600B58F7D00BB9683000000002F041034FF174DDCFF3B6FF8FF4578
          FFFF224BDEFF0B2AC5FF071BB0FF010523FF0000005F00000000000000000000
          0000000C1A00000000005D493E000000001F0000008F000000BF000000FF0000
          00FF000000DF000000AF0000005F0000009F29365BFF3B6FF8FF4578FFFF224B
          DEFF0B2AC5FF0820B3FF010523FF0000005F0000000000000000000000000000
          0000000D1B000000000F0000008F1D1D1DFF8A8A8AFFB6B6B6FFC3C3C3FFB6B6
          B6FFB3B3B3FF919191FF4E4E4EFF545454FFC6C9D1FF4978F8FF224BDEFF0B2A
          C5FF0820B3FF010523FF0000005F000000000000000000000000000000000000
          00000000000F000000CF7F7F7FFFEDEDEDFFDEDEDEFFD4D4D4FFD2D2D2FFCFCF
          CFFFD1D1D1FFC3C3C3FFB6B6B6FFCFCFCFFFC1C1C1FFA0A2ACFF3C4A8EFF0412
          60FF010419EF0000005FFEFEFE00000000000000000000000000000000000000
          0000000000AF7A7A7AFFDCDCDCFFD6D6D6FFD0D0D0FFD0CAC5FFDFD2BAFFE4D6
          BFFFE1D4C5FFEDE9E5FFF0F0F0FFD8D8D8FFAAAAAAFF797979FF090909EF0000
          005F0000001FFBFBFB00FCFCFC00000000000000000000000000000000000000
          003F2B2B2BFFBDBDBDFFBEBEBEFFCFC6B1FFE9D097FFFFE299FFFFE39CFFFFE4
          9FFFFFE4A3FFF6DCA3FFECD6B4FFF2EBE5FFD6D6D6FF797979FF000000DF0000
          0000B0B0B000DBDBDB00FAFAFA00000000000000000000000000000000000000
          00AF727272FFB0B0B0FFDECC9FFFFFE193FFFFE193FFFFE295FFFFE298FFFFE3
          9CFFFFE4A0FFFFE5A5FFFFE6A9FFF2D8AAFFF2EBE5FFC0C0C0FF2E2E2EFF0000
          004FF7F7F700F7F7F700F8F8F800000000000000000000000000000000000000
          00DFA0A0A0FFCBBC9BFFFFE08FFFCFC690FFBFBE92FFBFBE94FFBFBE96FFBFBF
          99FFBFC09CFFBFC0A0FFCFCAA5FFFFE6ADFFF2D8ADFFF5F3F1FF5B5B5BFF0000
          007FAFAFAF00D9D9D900F7F7F700000000000000000000000000000000000000
          00FF9B9B9BFFE9CB88FF7F9A93FF00559AFF00559AFF00559AFF00559AFF0055
          9AFF00559AFF00559AFF00559AFF7F9EA3FFFFE7B1FFEBDCC9FF8F8F8FFF0000
          007FF3F3F300F4F4F400F5F5F500000000000000000000000000000000000000
          00FF9F968CFFEFC97EFF3F7795FF009FCCFF00C4E5FF00C4E5FF00C4E5FF00C4
          E5FF00C4E5FF00C4E5FF0067A6FF3F799EFFFFE7AFFFE1C7A6FFA4A4A4FF0000
          007FF1F1F100F2F2F200F3F3F300000000000000000000000000000000000000
          00FF9D9084FFD5A56CFF4C7C92FF009FCCFF00C4E5FF00C4E5FF00C4E5FF00C4
          E5FF00C4E5FF00C4E5FF0067A6FF4F829FFFF6D9A3FFD3AE8AFFAFAFAFFF0000
          007F000000000000000000000000000000000000000000000000000000000000
          00FF808080FFCB9966FFCAA57BFF6F9BBCFF3F7FB3FF3F7FB3FF3F7FB3FF3F7D
          ACFF3F7899FF3F789AFF5F8A9DFFEED9AAFFE3B989FFD2B598FF717171FF0000
          006F000000000000000000000000000000000000000000000000000000000000
          00DF525252FFAD9074FFCD9C6BFFEECAA0FFFFEBCFFFFFF5E7FFFFFBF5FFFFF0
          C8FFFBDD9AFFFBDDA1FFFADBAAFFEAC294FFCA9A6BFFD2C8BFFF373737FF0000
          001F000000000000000000000000000000000000000000000000000000000000
          007F101010FF848484FFB89878FFCD9B69FFE4BC8FFFF1CEA4FFF3D1A8FFEECB
          A3FFF1CFA7FFF0CCA1FFDCB080FFCD9D6DFFCCBCACFF9B9B9BFF000000BF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000F000000DF303030FF848484FFAF9F8FFFC59F79FFCC9966FFD3A474FFD4A5
          75FFD09F6EFFCD9D6DFFD2B393FFCCC6C0FF9E9E9EFF0D0D0DEF0000002F0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000002F000000EF282828FF727272FF929292FFA3A09DFFB1A497FFB6AA
          9DFFBFB6ACFFBCBCBCFFB6B6B6FF888888FF0B0B0BFF0000005F000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000001F000000BF000000FF313131FF5E5E5EFF6B6B6BFF7070
          70FF757575FF5C5C5CFF202020FF000000DF0000002F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000003F0000009F000000DF000000FF0000
          00FF000000EF000000AF0000005F000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000
        }
      end
      object ViewZoomResetMenuItem: TMenuItem
        Caption = 'Reset zoom'
        Bitmap.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000064000000640000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000F000000AF000000BF0000009F0000001F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000F0000
          00CF041D91FF0330C7FF011C7AFF01040EEF0000002F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000F000000CF0B28
          80FF0A32CAFF0A3ED1FF0637CCFF032092FF000000BF00000000000000000000
          0000000000000000000000000000000000000000000000000000232323002C2C
          2C002B2B2B002B2B2B002B2B2B002A2A2A000000000F000000CF0B2880FF174D
          DCFF1A4ADCFF1148DAFF0D41D4FF083BCFFF00001FFF00000000000000000000
          000000000000000000000000000021181700855F5B006346420098929200B8B8
          B800B7B7B700B6B6B600B5B5B500B3B3B300000000CF0B2880FF174DDCFF3B6F
          F8FF4275FDFF133ED3FF134BDDFF0D3CC7FF000016EF00000000000000000000
          000000000000000000003A2A2800AB7C7600B4827C00B27F7900B2A6A400C8C8
          C800333333009B7E7A00000000000000002F041034FF174DDCFF3B6FF8FF4578
          FFFF224BDEFF0B2AC5FF071BB0FF010523FF0000005F00000000000000000000
          0000000000000C0C0C00BC8A84000000001F0000008F000000BF000000FF0000
          00FF000000DF000000AF0000005F0000009F29365BFF3B6FF8FF4578FFFF224B
          DEFF0B2AC5FF0820B3FF010523FF0000005F0000000000000000000000000000
          00000B0706000000000F0000008F1D1D1DFF8A8A8AFFB6B6B6FFC3C3C3FFB6B6
          B6FFB3B3B3FF919191FF4E4E4EFF545454FFC5C9D1FF4978F8FF224BDEFF0B2A
          C5FF0820B3FF010523FF0000005F000000000000000000000000000000000000
          00000000000F000000CF7F7F7FFFEDEDEDFFDEDEDEFFD4D4D4FFD2D2D2FFCFCF
          CFFFD1D1D1FFC3C3C3FFB6B6B6FFCFCFCFFFC1C1C1FFA0A2ABFF3C4A8EFF0412
          60FF010419EF0000005F98625C00000000000000000000000000000000000000
          0000000000AF7A7A7AFFDCDCDCFFD6D6D6FFD0D0D0FFD0CAC5FFDFD2BAFFE4D6
          BFFFE1D4C5FFEDE9E5FFF0F0F0FFD8D8D8FFA9A9A9FF797979FF090909EF0000
          005F0000001F000000009A655F00000000000000000000000000000000000000
          003F2B2B2BFFBDBDBDFFBEBEBEFFCFC6B1FFE9D097FFFFE299FFFFE39CFFFFE4
          9FFFFFE4A3FFF6DCA3FFECD6B4FFF2EBE5FFD6D6D6FF797979FF000000DFBA95
          8200BA958200000000009D686200000000000000000000000000000000000000
          00AF727272FFB0B0B0FFDECC9FFFFFE193FFFFE193FFFFE295FFFFE298FFFFE3
          9CFFFFE4A0FFFFE5A5FFFFE6A9FFF2D8AAFFF2EBE5FFC0C0C0FF2E2E2EFF0000
          004FB48F7C00000000009F6B6500000000000000000000000000000000000000
          00DFA0A0A0FFCBBC9BFFFFE08FFFFFE08EFFDAB570FF925E35FFFFE194FF6E33
          16FFFFE39DFFFFE4A2FF6E3316FFFFE6ADFFF2D8ADFFF5F3F1FF5B5B5BFF0000
          007FAF89750000000000A26E6800000000000000000000000000000000000000
          00FF9B9B9BFFE9CB88FFFFE08BFFFFDF8AFFDAB46DFF925E34FFFFE191FFFFE2
          96FFFFE39BFFFFE4A0FF6E3316FFFFE6ABFFFFE7B1FFEBDCC9FF8F8F8FFF0000
          007FA8826F0000000000A5706A00000000000000000000000000000000000000
          00FF9F968CFFEFC97EFFFFDF87FFFFE395FFDAC098FF926241FFFFE8ABFFB68A
          55FFFFE298FFFFE39EFF6E3316FFFFE6A9FFFFE7AFFFE1C7A6FFA4A4A4FF0000
          007FA27C680000000000A7736D00000000000000000000000000000000000000
          00FF9D9084FFD5A56CFFFBDA82FFC8AE98FF895941FF926650FFFFFFFFFFB691
          6FFFE3C17EFF925F37FF6E3316FFFFE6A8FFF6D9A3FFD3AE8AFFAFAFAFFF0000
          007F9D75620000000000AA767000000000000000000000000000000000000000
          00FF808080FFCB9966FFD9AD79FFFFFBF5FFD1BFB6FF926650FFFFFFFFFFFFF7
          E3FFFFE296FFECCD8BFF773E1EFFFEE2ABFFE3B989FFD2B598FF717171FF0000
          006F966F5B0000000000AC797300000000000000000000000000000000000000
          00DF525252FFAD9074FFCD9C6BFFEECAA0FFFFEBCFFFFFF5E7FFFFFBF5FFFFF0
          C8FFFBDD9AFFFBDDA1FFFADBAAFFEAC294FFCA9A6BFFD2C8BFFF373737FF0000
          001FA07A670000000000A37C7800000000000000000000000000000000000000
          007F101010FF848484FFB89878FFCD9B69FFE4BC8FFFF1CEA4FFF3D1A8FFEECB
          A3FFF1CFA7FFF0CCA1FFDCB080FFCD9D6DFFCBBBABFF9B9B9BFF000000BF6A5C
          5500BA9D8E000000000095757100000000000000000000000000000000000000
          000F000000DF303030FF848484FFAF9F8FFFC59F79FFCC9966FFD3A474FFD4A5
          75FFD09F6EFFCD9D6DFFD2B293FFCCC6C0FF9E9E9EFF0D0D0DEF0000002F0000
          00000000000000000000906A6600000000000000000000000000000000000000
          00000000002F000000EF282828FF727272FF929292FFA3A09DFFB1A497FFB6AA
          9DFFBFB6ACFFBCBCBCFFB6B6B6FF888888FF0B0B0BFF0000005FD3BDBB00C6AA
          A70093605A007448440009050500000000000000000000000000000000000000
          0000000000000000001F000000BF000000FF313131FF5E5E5EFF6B6B6BFF7070
          70FF757575FF5C5C5CFF202020FF000000DF0000002F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000003F0000009F000000DF000000FF0000
          00FF000000EF000000AF0000005F000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000
        }
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
    Left = 32
    Top = 85
  end
end
