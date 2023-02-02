object frmFrameDlg: TfrmFrameDlg
  Left = 391
  Height = 198
  Top = 242
  Width = 286
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'New frame'
  ClientHeight = 198
  ClientWidth = 286
  OnClose = FormClose
  OnShow = FormShow
  ShowInTaskBar = stNever
  LCLVersion = '2.2.4.0'
  object Panel1: TPanel
    Left = 0
    Height = 44
    Top = 154
    Width = 286
    Align = alBottom
    AutoSize = True
    ClientHeight = 44
    ClientWidth = 286
    TabOrder = 0
    object BitBtnOk: TBitBtn
      AnchorSideLeft.Control = Panel1
      AnchorSideTop.Control = Panel1
      AnchorSideTop.Side = asrCenter
      Left = 6
      Height = 32
      Top = 6
      Width = 55
      AutoSize = True
      BorderSpacing.Around = 5
      Default = True
      DefaultCaption = True
      Kind = bkOK
      ModalResult = 1
      OnClick = BitBtnOkClick
      TabOrder = 0
    end
    object BitBtnCancel: TBitBtn
      AnchorSideLeft.Control = BitBtnOk
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = Panel1
      AnchorSideTop.Side = asrCenter
      Left = 66
      Height = 30
      Top = 7
      Width = 107
      AutoSize = True
      Cancel = True
      DefaultCaption = True
      Kind = bkCancel
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    AnchorSideTop.Side = asrBottom
    Left = 0
    Height = 154
    Top = 0
    Width = 286
    Align = alClient
    AutoSize = True
    ClientHeight = 154
    ClientWidth = 286
    TabOrder = 1
    object lblFrameName: TLabel
      AnchorSideLeft.Control = Panel2
      AnchorSideTop.Control = edtFrameName
      AnchorSideTop.Side = asrCenter
      Left = 6
      Height = 17
      Top = 10
      Width = 82
      BorderSpacing.Around = 5
      Caption = 'Frame name'
      ParentColor = False
    end
    object edtFrameName: TEdit
      AnchorSideLeft.Control = CheckBox1
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = Panel2
      Left = 127
      Height = 25
      Top = 6
      Width = 165
      BorderSpacing.Top = 5
      TabOrder = 0
      Text = 'Frame'
    end
    object frmFrameWidth: TLabel
      AnchorSideLeft.Control = lblFrameName
      AnchorSideTop.Control = spnedtWidth
      AnchorSideTop.Side = asrCenter
      Left = 6
      Height = 17
      Top = 37
      Width = 81
      Anchors = [akLeft]
      Caption = 'Frame width'
      ParentColor = False
    end
    object spnedtWidth: TSpinEdit
      AnchorSideLeft.Control = edtFrameName
      AnchorSideTop.Control = edtFrameName
      AnchorSideTop.Side = asrBottom
      Left = 127
      Height = 27
      Top = 36
      Width = 93
      BorderSpacing.Top = 5
      MaxValue = 1024
      MinValue = 1
      TabOrder = 1
      Value = 32
    end
    object lblFrameHeight: TLabel
      AnchorSideLeft.Control = lblFrameName
      AnchorSideTop.Control = spnedtHeight
      AnchorSideTop.Side = asrCenter
      Left = 6
      Height = 17
      Top = 72
      Width = 86
      Caption = 'Frame height'
      ParentColor = False
    end
    object spnedtHeight: TSpinEdit
      AnchorSideLeft.Control = edtFrameName
      AnchorSideTop.Control = frmFrameWidth
      AnchorSideTop.Side = asrBottom
      Left = 127
      Height = 27
      Top = 67
      Width = 93
      BorderSpacing.Top = 13
      MaxValue = 1024
      MinValue = 1
      TabOrder = 2
      Value = 32
    end
    object CheckBox1: TCheckBox
      AnchorSideLeft.Control = lblFrameName
      AnchorSideTop.Control = spnedtCellSize
      AnchorSideTop.Side = asrBottom
      Left = 6
      Height = 22
      Top = 131
      Width = 121
      BorderSpacing.Top = 5
      Caption = 'Copy all layers'
      TabOrder = 3
    end
    object Label1: TLabel
      AnchorSideLeft.Control = lblFrameName
      AnchorSideTop.Control = spnedtCellSize
      AnchorSideTop.Side = asrCenter
      Left = 6
      Height = 17
      Top = 104
      Width = 85
      Caption = 'Min. cell size'
      ParentColor = False
    end
    object spnedtCellSize: TSpinEdit
      AnchorSideLeft.Control = edtFrameName
      AnchorSideTop.Control = spnedtHeight
      AnchorSideTop.Side = asrBottom
      Left = 127
      Height = 27
      Top = 99
      Width = 50
      BorderSpacing.Top = 5
      MaxValue = 20
      MinValue = 1
      TabOrder = 4
      Value = 1
    end
  end
end
