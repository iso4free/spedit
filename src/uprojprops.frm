object frmProjectProps: TfrmProjectProps
  Left = 356
  Height = 470
  Top = 214
  Width = 722
  Caption = 'Project properties'
  ClientHeight = 470
  ClientWidth = 722
  LCLVersion = '8.1'
  object pnlBottom: TPanel
    Left = 0
    Height = 32
    Top = 420
    Width = 722
    Align = alBottom
    AutoSize = True
    ClientHeight = 32
    ClientWidth = 722
    TabOrder = 0
    object bbtnOk: TBitBtn
      AnchorSideLeft.Control = pnlBottom
      AnchorSideLeft.Side = asrCenter
      AnchorSideTop.Control = pnlBottom
      AnchorSideTop.Side = asrCenter
      Left = 335
      Height = 30
      Top = 1
      Width = 52
      Align = alCustom
      AutoSize = True
      BorderSpacing.Left = 10
      Caption = 'ОК'
      Default = True
      Kind = bkOK
      ModalResult = 1
      OnClick = bbtnOkClick
      TabOrder = 0
    end
  end
  object pnlTop: TPanel
    Left = 0
    Height = 40
    Top = 0
    Width = 722
    Align = alTop
    AutoSize = True
    ClientHeight = 40
    ClientWidth = 722
    TabOrder = 1
    object bbtnSave: TBitBtn
      Left = 1
      Height = 38
      Hint = 'Save options'
      Top = 1
      Width = 38
      AutoSize = True
      Images = frmMain.ButtonsImageList
      ImageIndex = 39
      OnClick = bbtnSaveClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object pnl: TPanel
    Left = 0
    Height = 380
    Top = 40
    Width = 722
    Align = alClient
    ClientHeight = 380
    ClientWidth = 722
    TabOrder = 2
    object pcProject: TPageControl
      Left = 1
      Height = 378
      Top = 1
      Width = 720
      ActivePage = tsEntities
      Align = alClient
      TabIndex = 1
      TabOrder = 0
      object tsGeneral: TTabSheet
        Caption = 'General'
        ClientHeight = 348
        ClientWidth = 710
        object lblTitle: TLabel
          AnchorSideLeft.Control = tsGeneral
          AnchorSideTop.Control = edTitle
          AnchorSideTop.Side = asrCenter
          Left = 12
          Height = 16
          Top = 12
          Width = 27
          BorderSpacing.Left = 6
          BorderSpacing.Around = 6
          Caption = 'Title'
          ParentColor = False
        end
        object edTitle: TEdit
          AnchorSideLeft.Control = tsGeneral
          AnchorSideTop.Control = tsGeneral
          AnchorSideRight.Control = tsGeneral
          AnchorSideRight.Side = asrBottom
          Left = 106
          Height = 28
          Top = 6
          Width = 598
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 100
          BorderSpacing.Around = 6
          OnChange = edTitleChange
          TabOrder = 0
        end
        object lblAuthor: TLabel
          AnchorSideLeft.Control = lblTitle
          AnchorSideTop.Control = edAuthor
          AnchorSideTop.Side = asrCenter
          Left = 12
          Height = 16
          Top = 46
          Width = 43
          Caption = 'Author'
          ParentColor = False
        end
        object edAuthor: TEdit
          AnchorSideLeft.Control = edTitle
          AnchorSideTop.Control = edTitle
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edTitle
          AnchorSideRight.Side = asrBottom
          Left = 106
          Height = 28
          Top = 40
          Width = 598
          Anchors = [akTop, akLeft, akRight]
          OnChange = edTitleChange
          TabOrder = 1
        end
        object gbDescript: TGroupBox
          AnchorSideLeft.Control = tsGeneral
          AnchorSideTop.Control = lblAuthor
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = tsGeneral
          AnchorSideRight.Side = asrBottom
          Left = 6
          Height = 105
          Top = 68
          Width = 698
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Around = 6
          Caption = 'Description'
          ClientHeight = 88
          ClientWidth = 696
          TabOrder = 2
          object mDescription: TMemo
            Left = 0
            Height = 88
            Top = 0
            Width = 696
            Align = alClient
            OnChange = edTitleChange
            ScrollBars = ssAutoVertical
            TabOrder = 0
          end
        end
        object lblLicense: TLabel
          AnchorSideLeft.Control = lblTitle
          AnchorSideTop.Control = edLicense
          AnchorSideTop.Side = asrCenter
          Left = 12
          Height = 16
          Top = 185
          Width = 44
          Caption = 'License'
          ParentColor = False
        end
        object edLicense: TEdit
          AnchorSideLeft.Control = edTitle
          AnchorSideTop.Control = gbDescript
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edTitle
          AnchorSideRight.Side = asrBottom
          Left = 106
          Height = 28
          Top = 179
          Width = 598
          Anchors = [akTop, akLeft, akRight]
          OnChange = edTitleChange
          TabOrder = 3
          Text = 'For non-commercial use only'
        end
        object lblCredits: TLabel
          AnchorSideLeft.Control = lblTitle
          AnchorSideTop.Control = edCredits
          AnchorSideTop.Side = asrCenter
          Left = 12
          Height = 16
          Top = 219
          Width = 42
          Caption = 'Credits'
          ParentColor = False
        end
        object edCredits: TEdit
          AnchorSideLeft.Control = edTitle
          AnchorSideTop.Control = edLicense
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edTitle
          AnchorSideRight.Side = asrBottom
          Left = 106
          Height = 28
          Top = 213
          Width = 598
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 6
          OnChange = edTitleChange
          TabOrder = 4
        end
      end
      object tsEntities: TTabSheet
        Caption = 'Entities'
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Height = 18
    Top = 452
    Width = 722
    Panels = <    
      item
        Width = 50
      end    
      item
        Width = 50
      end>
    SimplePanel = False
  end
end
