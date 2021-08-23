object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #24494#20449#29256#26412#20462#25913#24037#20855'2.6.8.65'
  ClientHeight = 360
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Button1: TButton
    Left = 24
    Top = 216
    Width = 153
    Height = 65
    Caption = #20462#25913'2.6.8.65'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object MaskEdit1: TMaskEdit
    Left = 184
    Top = 24
    Width = 217
    Height = 76
    EditMask = '0\.0\.0.00;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -56
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    TabOrder = 1
    Text = ' . . .  '
  end
end
