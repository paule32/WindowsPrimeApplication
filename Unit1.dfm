object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Primesuche (c) 2024 Jens Kallup'
  ClientHeight = 389
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  TextHeight = 16
  object Label1: TLabel
    Left = 104
    Top = 194
    Width = 227
    Height = 16
    Caption = 'Press Escape-Key to stop calculation  '
  end
  object Label2: TLabel
    Left = 8
    Top = 85
    Width = 87
    Height = 16
    Caption = 'Running Time :'
  end
  object Label3: TLabel
    Left = 8
    Top = 144
    Width = 66
    Height = 16
    Caption = 'Gap Count:'
  end
  object PaintBox1: TPaintBox
    Left = 8
    Top = 216
    Width = 313
    Height = 165
    OnPaint = PaintBox1Paint
  end
  object Label4: TLabel
    Left = 8
    Top = 194
    Width = 75
    Height = 16
    Caption = 'Gap Graph:  '
  end
  object Label5: TLabel
    Left = 104
    Top = 8
    Width = 72
    Height = 16
    Caption = 'Speed /Sec.'
  end
  object Label6: TLabel
    Left = 200
    Top = 8
    Width = 102
    Height = 16
    Caption = 'Prime to Check:  '
  end
  object Label7: TLabel
    Left = 344
    Top = 216
    Width = 65
    Height = 16
    Caption = 'Max. Gap: '
  end
  object Label8: TLabel
    Left = 104
    Top = 85
    Width = 85
    Height = 16
    Caption = 'Found Primes:'
  end
  object Label9: TLabel
    Left = 344
    Top = 245
    Width = 82
    Height = 16
    Caption = 'Prime Twins : '
  end
  object RichEdit1: TRichEdit
    Left = 104
    Top = 107
    Width = 497
    Height = 78
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    PlainText = True
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 10
    Width = 75
    Height = 46
    Caption = 'Testen'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 200
    Top = 30
    Width = 400
    Height = 24
    TabOrder = 2
    Text = '2'
  end
  object CheckBox1: TCheckBox
    Left = 104
    Top = 64
    Width = 129
    Height = 17
    Caption = ' auto increment'
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 8
    Top = 107
    Width = 90
    Height = 19
    Alignment = taLeftJustify
    Caption = ' 00 - 00 - 00'
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 8
    Top = 166
    Width = 90
    Height = 19
    Alignment = taLeftJustify
    Caption = ' 0'
    TabOrder = 5
  end
  object Edit2: TEdit
    Left = 104
    Top = 30
    Width = 72
    Height = 24
    TabOrder = 6
    Text = '120'
  end
  object Edit3: TEdit
    Left = 415
    Top = 213
    Width = 185
    Height = 24
    TabOrder = 7
    Text = '0'
  end
  object RichEdit2: TRichEdit
    Left = 344
    Top = 264
    Width = 256
    Height = 117
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    PlainText = True
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Timer1Timer
    Left = 152
    Top = 120
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 208
    Top = 120
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 120
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About ...'
        OnClick = About1Click
      end
    end
  end
end
