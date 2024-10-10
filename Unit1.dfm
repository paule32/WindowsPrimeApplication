object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Primesuche (c) 2024 Jens Kallup'
  ClientHeight = 471
  ClientWidth = 780
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
  object Splitter1: TSplitter
    Left = 0
    Top = 191
    Width = 780
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 0
    ExplicitWidth = 296
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 194
    Width = 780
    Height = 258
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 280
    object Label4: TLabel
      Left = 0
      Top = 150
      Width = 759
      Height = 16
      Align = alTop
      Caption = 'Chart Gap:'
      ExplicitWidth = 63
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 759
      Height = 150
      Align = alTop
      Caption = 'Panel3'
      TabOrder = 0
      object Splitter2: TSplitter
        Left = 425
        Top = 1
        Height = 148
        ExplicitLeft = 9
        ExplicitTop = 2
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 424
        Height = 148
        Align = alLeft
        Caption = 'Panel4'
        TabOrder = 0
        object Label9: TLabel
          Left = 1
          Top = 1
          Width = 422
          Height = 16
          Align = alTop
          Caption = 'Prime Twins : '
          ExplicitWidth = 82
        end
        object RichEdit2: TRichEdit
          Left = 1
          Top = 17
          Width = 422
          Height = 130
          Align = alClient
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
          ExplicitLeft = -6
          ExplicitWidth = 430
        end
      end
      object Panel6: TPanel
        Left = 428
        Top = 1
        Width = 330
        Height = 148
        Align = alClient
        Caption = 'Panel4'
        TabOrder = 1
        ExplicitLeft = 464
        ExplicitTop = 17
        ExplicitWidth = 434
        ExplicitHeight = 161
        object Label7: TLabel
          Left = 1
          Top = 1
          Width = 328
          Height = 16
          Align = alTop
          Caption = 'Factoring:'
          ExplicitWidth = 58
        end
        object RichEdit3: TRichEdit
          Left = 1
          Top = 17
          Width = 328
          Height = 130
          Align = alClient
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
          ExplicitLeft = 2
          ExplicitTop = 18
          ExplicitWidth = 565
        end
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 426
      Width = 759
      Height = 251
      Align = alTop
      Caption = 'Panel4'
      TabOrder = 1
      object Chart2: TChart
        Left = 1
        Top = 1
        Width = 757
        Height = 249
        Title.Text.Strings = (
          'TChart')
        Align = alClient
        Color = 15138815
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitHeight = 38
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 166
      Width = 759
      Height = 260
      Align = alTop
      Caption = 'Panel4'
      TabOrder = 2
      object Chart1: TChart
        Left = 1
        Top = 1
        Width = 757
        Height = 258
        Title.Text.Strings = (
          'TChart')
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 112
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 452
    Width = 780
    Height = 19
    Panels = <>
    ExplicitLeft = 120
    ExplicitTop = 296
    ExplicitWidth = 0
  end
  object Panel8: TPanel
    Left = 0
    Top = 0
    Width = 113
    Height = 191
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 277
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 72
      Height = 16
      Caption = 'Speed /Sec.'
    end
    object Label2: TLabel
      Left = 11
      Top = 85
      Width = 87
      Height = 16
      Caption = 'Running Time :'
    end
    object Label3: TLabel
      Left = 11
      Top = 144
      Width = 66
      Height = 16
      Caption = 'Gap Count:'
    end
    object Edit2: TEdit
      Left = 8
      Top = 30
      Width = 72
      Height = 24
      TabOrder = 0
      Text = '120'
    end
    object Panel1: TPanel
      Left = 8
      Top = 107
      Width = 93
      Height = 19
      Alignment = taLeftJustify
      Caption = ' 00 - 00 - 00'
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 11
      Top = 166
      Width = 90
      Height = 19
      Alignment = taLeftJustify
      Caption = '53'
      TabOrder = 2
    end
  end
  object Panel9: TPanel
    Left = 113
    Top = 0
    Width = 667
    Height = 191
    Align = alClient
    TabOrder = 3
    ExplicitLeft = 143
    ExplicitTop = 107
    ExplicitWidth = 759
    ExplicitHeight = 187
    object Label6: TLabel
      Left = 6
      Top = 8
      Width = 102
      Height = 16
      Caption = 'Prime to Check:  '
    end
    object Label8: TLabel
      Left = 6
      Top = 85
      Width = 85
      Height = 16
      Caption = 'Found Primes:'
    end
    object Panel10: TPanel
      Left = 1
      Top = 107
      Width = 665
      Height = 83
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Panel4'
      TabOrder = 0
      object RichEdit1: TRichEdit
        Left = 1
        Top = 1
        Width = 663
        Height = 81
        Align = alClient
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
        ExplicitHeight = 167
      end
    end
    object CheckBox1: TCheckBox
      Left = 6
      Top = 60
      Width = 129
      Height = 17
      Caption = ' auto increment'
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 6
      Top = 30
      Width = 400
      Height = 24
      TabOrder = 2
      Text = '2'
    end
    object Button1: TButton
      Left = 432
      Top = 19
      Width = 93
      Height = 46
      Caption = 'Start'
      TabOrder = 3
      OnClick = Button1Click
    end
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
