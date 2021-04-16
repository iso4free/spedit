object frmMain: TfrmMain
  Left = 85
  Height = 480
  Top = 85
  Width = 640
  HorzScrollBar.Page = 252
  VertScrollBar.Page = 204
  AllowDropFiles = True
  AutoScroll = True
  Caption = 'Sprite Editor'
  ClientHeight = 480
  ClientWidth = 640
  DockSite = True
  DoubleBuffered = True
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MainMenu1
  OnCreate = FormCreate
  ParentDoubleBuffered = False
  Position = poDefault
  UseDockManager = True
  LCLVersion = '7.3'
  Visible = True
  object PageControl1: TPageControl
    Left = 0
    Height = 480
    Top = 0
    Width = 640
    ActivePage = SourceTabSheet
    Align = alClient
    DockSite = True
    TabIndex = 3
    TabOrder = 0
    object ProjectTabSheet: TTabSheet
      Caption = 'Project info'
      ClientHeight = 450
      ClientWidth = 630
      object ProjectButtonsPanel: TPanel
        Left = 0
        Height = 50
        Top = 0
        Width = 630
        Align = alTop
        TabOrder = 0
      end
    end
    object ActionsTabSheet: TTabSheet
      Caption = 'Actions'
      ClientHeight = 450
      ClientWidth = 630
      object ActionsButtonsPanel: TPanel
        Left = 0
        Height = 50
        Top = 0
        Width = 630
        Align = alTop
        TabOrder = 0
      end
    end
    object FrameEditorTabSheet: TTabSheet
      Caption = 'Frame Editor'
      ClientHeight = 450
      ClientWidth = 630
      object Panel1: TPanel
        AnchorSideLeft.Control = FrameEditorTabSheet
        AnchorSideTop.Control = FramesButtonsPanel
        AnchorSideTop.Side = asrBottom
        Left = 0
        Height = 117
        Top = 50
        Width = 117
        AutoSize = True
        ClientHeight = 117
        ClientWidth = 117
        TabOrder = 0
        OnPaint = Panel1Paint
        object DrawGrid1: TDrawGrid
          AnchorSideLeft.Control = Panel1
          AnchorSideTop.Control = Panel1
          Left = 6
          Height = 105
          Top = 6
          Width = 105
          AutoAdvance = aaLeft
          AutoEdit = False
          BorderSpacing.Around = 5
          BorderStyle = bsNone
          ColCount = 10
          DefaultColWidth = 10
          DefaultDrawing = False
          DefaultRowHeight = 10
          ExtendedSelect = False
          FixedCols = 0
          FixedRows = 0
          Flat = True
          RowCount = 10
          RowSizingCursor = crNone
          ScrollBars = ssNone
          TabOrder = 0
          TitleStyle = tsNative
          OnDrawCell = DrawGrid1DrawCell
          OnKeyDown = DrawGrid1KeyDown
          OnKeyUp = DrawGrid1KeyUp
          OnMouseDown = DrawGrid1MouseDown
        end
      end
      object Image1: TImage
        AnchorSideLeft.Control = Panel1
        AnchorSideLeft.Side = asrBottom
        AnchorSideTop.Control = Panel1
        Left = 117
        Height = 48
        Top = 50
        Width = 48
        AutoSize = True
        OnClick = Image1Click
        Picture.Data = {
          1754506F727461626C654E6574776F726B47726170686963C303000089504E47
          0D0A1A0A0000000D49484452000000300000003008060000005702F987000003
          8A4944415478DAD598BF6B144114C7F3AF883F40B0321A52C452C1CA4A1404F1
          07285123123845ED8E788245622188E0A98D042229021E0A8267215191982657
          08164142442CD442449BA7DFC3EFFAEE65766EF66E67EF6EE1CBDEEECECE7E3F
          EFBD9D99BDA1A19CB6EFAB35E9E67A4FB750737D0BF1B9312B79B62BDC7C1680
          BE83585B7E900900EDFB0E80F2B55B7A3411D4AEA71030C973EF77EF94E7DB86
          05FB85E9C3CD6BFA7A5F6D3447C130013404D4B743298D5BF31A626810361AFE
          FB73C37E2000EE6F19196C000DC1D2A106C2FCFABD2959BE784A2CC4BF2C245B
          A35E95D0FE7E7CD82F859A5F9DBEDCDC5B80CAA611A957C76571BE222100B807
          E6D16FF40CE221348E3DC42C6800EC01119209F441009BC15C371A86790D604B
          09003C766502E769967DE0188A1675CA9AD7E23598A77426743FDA3C33F0F3E3
          59896ADE468BE7F43174E9C0684B59D9FB2D349E1305009DDB075BB3FA1C8CDF
          3A369664CAB663D49929FDAC68003EF334A68DBBB295663A2A8036AF23BA3255
          DA1071B6D5D7D34AA5100057BDEB923873ED8E1C3C71417489D97262C4DB19A7
          F9E800388F88433AE2162024DA3E805C20ECB0E82AADB417B953F3B96641D77F
          1A5C9AB202FC5A9A17E8F74A2D51D70018BB19551F401E192000215EDDBDD13D
          002621406084499BD834C4CB89932DC3652700309E29031849DA01B832C0F782
          CB01B4FBB4F0FF5B202B802B0B6D6F383A591142702CB7CB5B42D87B1BB5AB42
          C1B8FE1EC631CE6705F8F2F866D37CA69B00018DEF1B160E8F90FEBA0284BDEF
          EDDCA44030CB051B41988D4E01BA5A4A0304D21145662CC491B15DB267C77699
          7BFA2481D019C035B4C95A3EFCDDF5F780FEAB8459010834BA75B31000D90384
          5E362F3E3CDDBC160A41F3EBF517F92EE2F4073A336361B09480607AEDCD4C73
          AF01422000FDF5DDEB44D1BF852D0C642134402844EE1948DB504230B5F7D0B9
          243300403911806DB47C7D468F3EEA9CC32ECCB174000161D8D419401B0BE1CB
          02DE9FA81920008DBBA401086A21D2FA7F76BC2CEA5FBE781004A17C00BADCDA
          01C0F8B7DBD5F8EF00C77E0BE3CB8086F0F55D180005631AC60740F51C20AD24
          EC4BCCF37ACE70AD6A7509153684BA22EA03E0500BF5FCDF681A71459400FA9C
          9EEC7A0EA067DF5033AEE507E793C24BC82E1F42EEC1E8A44B8833B60BA2D035
          902F9A1680B335A4E78DC2015CD1644453A1CF97A474A59CA87C7DA645850364
          8926CC531AC2C264F1F007B476140440906C730000000049454E44AE426082
        }
        Proportional = True
      end
      object FramesButtonsPanel: TPanel
        Left = 0
        Height = 50
        Top = 0
        Width = 630
        Align = alTop
        TabOrder = 1
      end
    end
    object SourceTabSheet: TTabSheet
      Caption = 'Source Image'
      ClientHeight = 450
      ClientWidth = 630
      object SrcImageButtonsPanel: TPanel
        Left = 0
        Height = 22
        Top = 0
        Width = 630
        Align = alTop
        AutoSize = True
        ClientHeight = 22
        ClientWidth = 630
        TabOrder = 0
        object SpeedButtonLoadSpritesheet: TSpeedButton
          Left = 24
          Height = 20
          Top = 1
          Width = 20
          Align = alLeft
          AutoSize = True
          Images = ButtonsImageList
          ImageIndex = 2
          OnClick = FileLoadSpritesheetMenuItemClick
        end
        object SpeedButtonSaveToLib: TSpeedButton
          Left = 44
          Height = 20
          Top = 1
          Width = 20
          Align = alLeft
          AutoSize = True
          Enabled = False
          Images = ButtonsImageList
          ImageIndex = 0
          OnClick = SpeedButtonSaveToLibClick
        end
        object SpeedButtonAutoSelect: TSpeedButton
          Left = 1
          Height = 20
          Top = 1
          Width = 23
          Align = alLeft
        end
      end
      object ScrollBox2: TScrollBox
        Left = 0
        Height = 428
        Top = 22
        Width = 630
        HorzScrollBar.Page = 240
        VertScrollBar.Page = 150
        Align = alClient
        ClientHeight = 426
        ClientWidth = 628
        TabOrder = 1
        object ImportImage: TImage
          AnchorSideLeft.Control = ScrollBox3
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = ScrollBox2
          Left = 150
          Height = 90
          Top = 0
          Width = 90
          AutoSize = True
        end
        object ScrollBox3: TScrollBox
          Left = 0
          Height = 426
          Top = 0
          Width = 150
          HorzScrollBar.Page = 100
          VertScrollBar.Page = 148
          Align = alLeft
          ClientHeight = 424
          ClientWidth = 148
          TabOrder = 0
          object Label2: TLabel
            AnchorSideLeft.Control = ScrollBox3
            AnchorSideTop.Control = ScrollBox3
            Left = 5
            Height = 16
            Top = 5
            Width = 43
            BorderSpacing.Around = 5
            Caption = 'Frames'
            ParentColor = False
          end
          object ListBox1: TListBox
            AnchorSideLeft.Control = ScrollBox3
            AnchorSideTop.Control = Label2
            AnchorSideTop.Side = asrBottom
            AnchorSideRight.Control = ScrollBox3
            AnchorSideRight.Side = asrBottom
            AnchorSideBottom.Control = SrcImageFramesOptsValueListEditor
            AnchorSideBottom.Side = asrBottom
            Left = 0
            Height = 398
            Top = 26
            Width = 148
            Anchors = [akTop, akLeft, akRight, akBottom]
            ItemHeight = 0
            ScrollWidth = 146
            TabOrder = 0
            TopIndex = -1
          end
          object SrcImageFramesOptsValueListEditor: TValueListEditor
            AnchorSideRight.Side = asrBottom
            Left = 0
            Height = 148
            Top = 276
            Width = 148
            Align = alBottom
            FixedCols = 0
            RowCount = 6
            TabOrder = 1
            Strings.Strings = (
              'npp='
              'x='
              'y='
              'width='
              'height='
            )
            ColWidths = (
              64
              82
            )
          end
        end
      end
    end
    object LibraryTabSheet: TTabSheet
      Caption = 'Local Library'
      ClientHeight = 450
      ClientWidth = 630
      object LibraryButtonsPanel: TPanel
        Left = 0
        Height = 50
        Top = 0
        Width = 630
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
          ParentColor = False
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
        Width = 445
        HorzScrollBar.Page = 90
        VertScrollBar.Page = 90
        Align = alClient
        ClientHeight = 398
        ClientWidth = 443
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
  object MainMenu1: TMainMenu
    Images = ButtonsImageList
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
        OnClick = MenuItem7Click
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
      end
      object ViewZoomOutMenuItem: TMenuItem
        Caption = 'Zoom--'
      end
      object ViewZoomResetMenuItem: TMenuItem
        Caption = 'Reset zoom'
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
    Left = 496
    Top = 72
  end
  object ButtonsImageList: TImageList
    Height = 24
    Width = 24
    Left = 549
    Top = 145
    Bitmap = {
      4C7A040000001800000018000000730800000000000078DAED997B5054D71DC7
      7F8EAF28D0983893A4498C36A453828EF1D530BEA066DA4ED4543356FF5028A4
      341A2311D108024596026D15AD2BAB20B02EAC3C7C000A0AAC8AE0620544842C
      2F5110258AC6AA51040451D46FCF3DFB00DDBBCBA2CB6426E399F9CDDE3BBBFB
      F99D7BEEDDF3FBCC6F897E92E1C2228145230BE8A29945060B8F17E08E66A116
      7813274E84BBBB3BBCBCBCE0E3E3035F5F5FB8B9B961CC9831D0E5FDA88F6CE1
      F3CD0E0E0E58B3660D64321992940A1C4CDE0155AA026A553AF2F2F2A052A9B0
      61C306D8D8D8A00FD7F2AA30A7091326203C3C1C19095214250440220980EDE2
      681EC271B96225AAB2B6A1ACB800F1F1F1B0B3B36BB6F03A2423468CE0EC2331
      FE28977F8DAB7952D0A238506E23C8271DEF7D29C7DDB25D68C80CE179CAF2D2
      2197CB856B50D764C6D3F99C24CA8F979AE2372E58B000FBB7AE45F94E2F7C77
      94ADC70995967F03A084327E7C2C57899B55A9B8F9DFED288DF34255891A4E4E
      4E428ED1E7B21369CAB8DF98E22324240467629721343C8CCF9702B3B421F00F
      D6759FB33C0772F6A0E9E84654E5C460F5EAD5027F9522CCCFDCFA40B1351C67
      53BEC1BB9ED1A0DA562D572C580E97807874D425A1FA400432323204BE6492E3
      AF39A8ADAD4D949F10BD19CDA783F1917774AFF39F1F9A005CCFC0E553BB919C
      9CCCF902E4DEBD7BD4DEDE2ECA17EED58D331BA029DA82F921517059176DB4FE
      2EFE72C656A0F9622AE31FC4AD86D3904AA5067E75753575747488DE5FA55289
      337972E07B298B2DFCD5C08F2AE6C7B89A085CDB03FCB01FADE7F7A3BDAD05AE
      AEAE9C2F70EFDFBF4F9D9D9D62FC0CE137959999894B65ECDA2F6FE3317A592C
      68B31AE4AE646BBE93B153187B1F63A7A2F5D63514141460FCF8F1027F3EFB2E
      9D3D7B961E3E7C28BADF8C1D3B16F9F9F9387EFC3834C50771A362073425B1F0
      8890B3D889E68644743424E1C7DA6CCEAEADAD45404000DF2B1E3C78C0B95D5D
      5DF4E8D12353CF50466060201A1A1AF8772B2A2A50515A84C6AA5C5CAD55E372
      4D116EDFB886BB77EFE2FCF9F3484D4DE5FC61C38635EBF689D1E7CE9DA3274F
      9E98DB2334128904B76FDFC6A54B9750535383AAAA2A68341A545656E2E4C993
      7CFF11CE4F9C380165623A66CCD98241AF7F8101837EC9F30010DF905D5CF439
      A4A3468D4244440467E999595959888C8CC4BC79F3B070E142149FAEC46CFF4E
      BC3FF7126C1C8BF0CA982C0C186C6FE99E27ECD352FD5EAD8BC61EFB7FC2871F
      BB62FAAA4EFCC11FCF9B839C9D9DF97D2B2C2CE4E7AFDB0DA760B7B97C2F1F34
      620ADEFC5383518EA1EF645A9C435833E17978FCF8B1D87DD3D8388418727CE2
      FB18239DAB3172EE45D8CD38C5F86F345BC217B84208F7AD67E89F077D8EB7E7
      34E0B54FEB6137AB06AF4CD7B00F8C8625FC67B9A6720C9F548AE1CE9518E254
      86816364D0DD3B6B0C9E63D0A8480C9C700A03DE0D64CFEA2F9A9FA33EF79623
      4337E704DDF3F7538E97FE6381FF94B17A5F9DBC163529BEA848F0B6BAFFB47C
      978CB6CABDB87326092D9A3D26FDC702FE53FE73A75409DCD200EDD781AE76E0
      6E09BA2EC6B1D8858717C4FDA717BEC17F4A53FE8E55F23CB848B2BA637D3AAB
      EDB12CE2582D53E04E5DAA91FFF4C6D7FBCF674132AD2F145E138FAF76733F79
      D67F7AE3EBFDC7655D54AF7CC1AF9EF59F9696166A6D6D35E9577AFF91C46DD3
      7A899990C42719F98FC035E3574FF98FA6782BD4C7652CB6B388865A1D0B75C1
      4E164A684A5344FD87AD13D5D5D57107B2D47F70258A450CD0C4DCE7AAD2ACFF
      085C337E25EA3FB812AB63B39C57934CFA8F0010FCEAC2850BA6FCCA2AFED38B
      5F59C57F4CFA95DD3BFDEB3FB66FF397BFCC76EE1FFF61FC91AFDA52DCDABFD2
      F6954B68878F1B29FC3C2929E86BDA17E643191BFD2847BA9E8E45873D9FFFE8
      E6DF87D137FF193894E8FDD9447F56127D994FB4546DE4573D3DC85AFE63CAAF
      ACE13FBDF955CF1C2FFDE7A5FF58E43F87FAE63F53A74E7D2EFF39732CCD22FF
      99366D5ABFFA8F8E6FF09FBAFD019C595F5608EFC96FF0E8792CF4209E5C49B3
      D87FA64F9FFE94FF74D587020F9B0D4C3E6E66A35EE5A7E33377F861AFC5FE33
      63C68CA7FC078DFF663597D5F59652A0AD1AF85F9AAED60B759E79CFB5645EE3
      C5FA3FE6F87AFFC1F79B588E08D467AFD4CEF772246347A3FE7080F69C3B449A
      68FF476CCC9C3953B4FF539FE3D3BDFEAA75DDEB6FA2FFF3AFA50B69AAA3BD29
      FE0BFBCFEE906F2869FD0AF25B3C5747F636F4005ED47F3237F9539CFF72FADD
      E4B1DD131F5068E00BDED257FFD9B76F9F91FF18D843E61AF8420D11EADFF3F9
      4F9A91FFD088C544438FEAB6DFEE1AD8A31659E43F4566FD671B7BF9C0640DEC
      EFFECF44077B2ADE25A5E24429EDFF4F30CD99F971F79B61652FDCFF99F4E107
      9419F90FFACCD9C9F8CDCDD78996F85BA5FF233A161610B9AAACE23FE2956816
      D1780D917D793FF67FDE62B188C5EC97FEF333F79FEAFC63549CBA87B67DB184
      D67EFA7B1A367870BFFACFD615CBACD2FFE9E93F2BDC1651AE620B0745F9AEEE
      97FE8F32F02B0E4A0AF237DBFFD1FB4FA55A05D9B2CFB57E72BF89D7F81FCB37
      619DF37BA2FE13BDCA9583D203BE35DBFF11FCA7E4400C362E9E65E0AB2257A1
      E94430641E4EDA1A2FE23F0A5F4F0E4AF5F331DBFFD1FB4F7D410C649EB3B8FF
      A8221619FC47CB37F69FC4A0E51CB4E7DB9566FB3F3DFD47E63EC5E03F689273
      87D0F28DFD676FA85611537C5658F4FF97E03F32F7DF32FE762DB349C1DD53CB
      17E9FF6CF4E5A044EFE5FDD2FFC99606715082D752ABF77F72A3424908612896
      7B5AA5FF63CA7FE2967A58B1FF63EC3F319E6EA2709BA143ACE83FE2C3D6D696
      F222C2FBD57FA6393A505A901F658706D12149001DDA9D4C2525253479F26492
      07071AF6F217F19F5FBDF526FDD3C395FEF6C74F284626A323478ED0E1C38789
      AD13E5E4E4105B2BABF98FBDBD3D8D1B378ED8F36B084747C7FEF31F9167EEE7
      FCFFD7FF01A189A721
    }
  end
end
