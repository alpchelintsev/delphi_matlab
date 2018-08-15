object StraightForm: TStraightForm
  Left = 224
  Top = 196
  ActiveControl = Edit1
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1103#1084#1086#1081' '#1093#1086#1076
  ClientHeight = 177
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000400280100001600000028000000100000002000
    0000010004000000000080000000000000000000000000000000000000000000
    0000800000000080000080800000000080008000800000808000C0C0C0008080
    8000FF00000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF000000
    00000000000000000000000000000000000000000000078888888888880007F7
    77777777780007F777777777780007F777777777780007F788888888780007F7
    77777777780007F799999999780007F799999999780007F777777777780007FF
    FFFFFFFFF800077777777777770000000000000000000000000000000000FFFF
    0000FFFF00008001000080010000800100008001000080010000800100008001
    00008001000080010000800100008001000080010000FFFF0000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 149
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1074#1086#1073#1086#1076#1085#1099#1093' '#1103#1095#1077#1077#1082
  end
  object Label2: TLabel
    Left = 206
    Top = 11
    Width = 14
    Height = 13
    Caption = 'Pi,i'
  end
  object Button1: TButton
    Left = 8
    Top = 38
    Width = 121
    Height = 25
    Caption = 'Start !!!'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 38
    Width = 122
    Height = 25
    Caption = 'Add all'
    TabOrder = 1
    OnClick = Button2Click
  end
  object TextListBox1: TTextListBox
    Left = 8
    Top = 72
    Width = 249
    Height = 97
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 2
    OnClick = TextListBox1Click
  end
  object Edit2: TEdit
    Left = 224
    Top = 8
    Width = 33
    Height = 21
    TabOrder = 3
    Text = '0.0'
    OnExit = Edit2Exit
  end
  object Edit1: TEdit
    Left = 160
    Top = 8
    Width = 33
    Height = 21
    TabOrder = 4
    Text = '0'
    OnExit = Edit1Exit
  end
end
