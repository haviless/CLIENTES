object FDeprecia: TFDeprecia
  Left = 281
  Top = 248
  Width = 367
  Height = 282
  Caption = 'Depreciaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clGray
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 19
    Width = 178
    Height = 16
    Caption = 'Proceso de Depreciaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoBk
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object wMensaje1: TLabel
    Left = 32
    Top = 168
    Width = 163
    Height = 16
    Caption = 'Proceso Terminado al :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoBk
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object wMensaje2: TLabel
    Left = 206
    Top = 168
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoBk
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object wMensaje3: TLabel
    Left = 117
    Top = 40
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoBk
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 90
    Top = 123
    Width = 42
    Height = 15
    Caption = 'Periodo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object wMensaje4: TLabel
    Left = 200
    Top = 75
    Width = 3
    Height = 13
  end
  object Label74: TLabel
    Left = 21
    Top = 75
    Width = 110
    Height = 15
    Caption = 'Tipo de Depreciaci'#243'n'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object bbtnOk1: TBitBtn
    Left = 207
    Top = 199
    Width = 33
    Height = 34
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = bbtnOk1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object bbtnCancela4: TBitBtn
    Left = 249
    Top = 198
    Width = 33
    Height = 35
    TabOrder = 3
    OnClick = bbtnCancela4Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object dblcdPeriodo: TwwDBLookupComboDlg
    Left = 138
    Top = 120
    Width = 81
    Height = 21
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taLeftJustify
    Caption = 'Lookup'
    MaxWidth = 0
    MaxHeight = 209
    Selected.Strings = (
      'FAPERIODO'#9'6'#9'PERIODO'#9'F'
      'FADESCRIP'#9'10'#9'DESCRIP'#9'F')
    LookupTable = DMAF.cdsFactor
    LookupField = 'FAPERIODO'
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcdPeriodoExit
  end
  object dblcTipoD: TwwDBLookupCombo
    Left = 138
    Top = 72
    Width = 49
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    DropDownAlignment = taLeftJustify
    LookupTable = DMAF.cdsUDep
    LookupField = 'DEPCOD'
    Options = [loColLines, loRowLines, loTitles]
    ParentFont = False
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcTipoDExit
  end
  object dbeTipo: TwwDBEdit
    Left = 188
    Top = 72
    Width = 150
    Height = 21
    Enabled = False
    TabOrder = 4
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
end
