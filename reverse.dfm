object ReverseForm: TReverseForm
  Left = 240
  Top = 151
  ActiveControl = Button4
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1073#1088#1072#1090#1085#1099#1081' '#1093#1086#1076
  ClientHeight = 340
  ClientWidth = 620
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
  object Label2: TLabel
    Left = 373
    Top = 99
    Width = 87
    Height = 13
    Caption = #1057#1087#1080#1089#1086#1082' '#1074#1077#1082#1090#1086#1088#1086#1074
  end
  object LabeledEdit1: TLabeledEdit
    Left = 570
    Top = 212
    Width = 41
    Height = 21
    EditLabel.Width = 6
    EditLabel.Height = 13
    EditLabel.Caption = 'n'
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 0
    Text = '1'
    OnExit = LabeledEdit12Exit
  end
  object TextListBox1: TTextListBox
    Left = 373
    Top = 117
    Width = 238
    Height = 84
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Fixedsys'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnClick = TextListBox1Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 359
    Height = 230
    Caption = ' '#1043#1088#1072#1092#1080#1082' '#1092#1091#1085#1082#1094#1080#1080' '#1074#1077#1088#1086#1103#1090#1085#1086#1089#1090#1080' '
    TabOrder = 2
    object Chart1: TChart
      Left = 11
      Top = 19
      Width = 337
      Height = 161
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.EndColor = -1
      Title.AdjustFrame = False
      Title.Text.Strings = (
        '')
      Title.Visible = False
      BottomAxis.GridCentered = True
      BottomAxis.Title.Caption = 'p'
      LeftAxis.GridCentered = True
      LeftAxis.Title.Caption = 'f(p)'
      Legend.Visible = False
      View3D = False
      BevelOuter = bvNone
      Color = clWhite
      Enabled = False
      TabOrder = 0
      object Series1: TLineSeries
        Marks.ArrowLength = 8
        Marks.Visible = False
        SeriesColor = clBlue
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1
        YValues.Order = loNone
      end
      object Series2: TLineSeries
        Marks.ArrowLength = 8
        Marks.Visible = False
        SeriesColor = clRed
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1
        YValues.Order = loNone
      end
    end
    object LabeledEdit9: TLabeledEdit
      Left = 147
      Top = 192
      Width = 33
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#1075#1088
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 1
      Text = '100'
      OnChange = LabeledEdit8Change
      OnExit = LabeledEdit12Exit
    end
    object Button4: TButton
      Left = 192
      Top = 192
      Width = 76
      Height = 25
      Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100
      TabOrder = 2
      OnClick = Button4Click
    end
    object LabeledEdit8: TLabeledEdit
      Left = 74
      Top = 192
      Width = 41
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = #1059#1074#1077#1083#1080#1095#1077#1085#1080#1077
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 3
      Text = '10'
      OnChange = LabeledEdit8Change
      OnExit = LabeledEdit8Exit
    end
    object Button6: TButton
      Left = 275
      Top = 192
      Width = 73
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 4
      OnClick = Button6Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 373
    Top = 8
    Width = 238
    Height = 84
    Caption = ' '#1042#1077#1088#1086#1103#1090#1085#1086#1089#1090#1100' Pi,i '
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 87
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1079#1085#1072#1095#1077#1085#1080#1081
    end
    object ComboBox1: TComboBox
      Left = 99
      Top = 16
      Width = 129
      Height = 24
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Fixedsys'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object Button3: TButton
      Left = 153
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 240
    Width = 313
    Height = 89
    Caption = ' '#1052#1077#1090#1086#1076' '#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' '
    TabOrder = 4
    object GroupBox5: TGroupBox
      Left = 11
      Top = 16
      Width = 145
      Height = 59
      Caption = ' '#1054#1090#1088#1077#1079#1086#1082' '#1083#1086#1082#1072#1083#1080#1079#1072#1094#1080#1080' '
      TabOrder = 0
      object LabeledEdit10: TLabeledEdit
        Left = 24
        Top = 23
        Width = 41
        Height = 21
        EditLabel.Width = 6
        EditLabel.Height = 13
        EditLabel.Caption = 'a'
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 0
        Text = '0'
        OnExit = LabeledEdit10Exit
      end
      object LabeledEdit11: TLabeledEdit
        Left = 86
        Top = 23
        Width = 41
        Height = 21
        EditLabel.Width = 6
        EditLabel.Height = 13
        EditLabel.Caption = 'b'
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 1
        Text = '1'
        OnExit = LabeledEdit10Exit
      end
    end
    object LabeledEdit12: TLabeledEdit
      Left = 179
      Top = 21
      Width = 30
      Height = 21
      EditLabel.Width = 8
      EditLabel.Height = 13
      EditLabel.Caption = 'N'
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 1
      Text = '1000'
      OnExit = LabeledEdit12Exit
    end
    object LabeledEdit13: TLabeledEdit
      Left = 272
      Top = 21
      Width = 28
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = #1058#1086#1095#1085#1086#1089#1090#1100
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 2
      Text = '0.001'
      OnExit = LabeledEdit13Exit
    end
    object Button5: TButton
      Left = 168
      Top = 50
      Width = 133
      Height = 25
      Caption = #1056#1077#1096#1080#1090#1100
      TabOrder = 3
      OnClick = Button5Click
    end
  end
  object GroupBox6: TGroupBox
    Left = 328
    Top = 240
    Width = 284
    Height = 89
    Caption = ' '#1052#1077#1090#1086#1076' '#1053#1100#1102#1090#1086#1085#1072' '
    TabOrder = 5
    object LabeledEdit18: TLabeledEdit
      Left = 138
      Top = 53
      Width = 33
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = #1058#1086#1095#1085#1086#1089#1090#1100
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 0
      Text = '0.0001'
      OnExit = LabeledEdit13Exit
    end
    object LabeledEdit19: TLabeledEdit
      Left = 138
      Top = 20
      Width = 33
      Height = 21
      EditLabel.Width = 126
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1072#1095#1072#1083#1100#1085#1086#1077' '#1087#1088#1080#1073#1083#1080#1078#1077#1085#1080#1077
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 1
      Text = '0'
      OnExit = LabeledEdit19Exit
    end
    object Button7: TButton
      Left = 177
      Top = 20
      Width = 97
      Height = 54
      Caption = #1056#1077#1096#1080#1090#1100
      TabOrder = 2
      OnClick = Button7Click
    end
  end
  object Button1: TButton
    Left = 373
    Top = 210
    Width = 52
    Height = 25
    Caption = 'Start !!!'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 432
    Top = 210
    Width = 57
    Height = 25
    Caption = 'Add all'
    TabOrder = 7
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 472
    Top = 97
    Width = 121
    Height = 17
    Caption = 'Use MATLAB Server'
    TabOrder = 8
  end
  object Button8: TButton
    Left = 496
    Top = 210
    Width = 57
    Height = 25
    Caption = 'Clear'
    TabOrder = 9
    OnClick = Button8Click
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.bmp'
    FileName = 'graphic.bmp'
    Filter = 'bmp-'#1092#1072#1081#1083'|*.bmp'
    Title = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1075#1088#1072#1092#1080#1082#1072
    Left = 384
    Top = 56
  end
end
