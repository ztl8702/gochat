object EditName: TEditName
  Left = 574
  Top = 310
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #32534#36753#20010#20154#20449#24687
  ClientHeight = 137
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 42
    Height = 12
    Caption = #22836#20687'ID:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object LabeledEdit2: TLabeledEdit
    Left = 16
    Top = 104
    Width = 121
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 12
    EditLabel.Caption = #26165#31216':'
    EditLabel.Font.Charset = GB2312_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = #23435#20307
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
  end
  object Button1: TButton
    Left = 176
    Top = 56
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 88
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button2Click
  end
  object labelededit1: TTeSpinEdit
    Left = 16
    Top = 56
    Width = 121
    Height = 23
    Cursor = crIBeam
    BevelWidth = 1
    BorderWidth = 3
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 3
    Text = '0'
    ParentColor = False
    ButtonAlign = baRight
    ButtonTransparent = False
    ButtonShowHint = False
    ButtonWidth = 15
    DownGlyph.Data = {
      0E010000424D0E01000000000000360000002800000009000000060000000100
      200000000000D800000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000080800000808000008080000080
      8000008080000080800000808000000000000000000000000000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000008080000080800000808000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000808000008080000080
      800000808000008080000080800000808000}
    EnabledSlider = False
    UpGlyph.Data = {
      0E010000424D0E01000000000000360000002800000009000000060000000100
      200000000000D800000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000080
      8000008080000080800000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000808000}
    ButtonData = (
      False
      0
      ''
      ''
      False
      False
      15)
  end
end
