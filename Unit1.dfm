object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Text-To-Speech for writing'
  ClientHeight = 631
  ClientWidth = 870
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 48
    Top = 184
    Width = 273
    Height = 81
    Caption = 'Import .TXT file'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'OCR A Extended'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 520
    Top = 136
    Width = 241
    Height = 305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'OCR A Extended'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 1
  end
  object Button2: TButton
    Left = 64
    Top = 294
    Width = 249
    Height = 83
    Caption = 'Convert to speech'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'OCR A Extended'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 208
    Top = 448
    Width = 241
    Height = 121
    Caption = 'Speak'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -47
    Font.Name = 'OCR A Extended'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object StaticText1: TStaticText
    Left = 48
    Top = 17
    Width = 736
    Height = 27
    Caption = 'You can delete parts of the text before converting to speech.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'OCR A Extended'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 496
    Top = 502
    Width = 313
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'OCR A Extended'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'Select Speed...'
    OnKeyPress = ComboBox1KeyPress
  end
  object OpenDialog1: TOpenDialog
    Left = 88
    Top = 72
  end
end
