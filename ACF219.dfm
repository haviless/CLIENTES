object FIniciaDepre: TFIniciaDepre
  Left = 674
  Top = 187
  AutoScroll = False
  Caption = 'Inicializa Depreciaci'#243'n'
  ClientHeight = 270
  ClientWidth = 405
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 29
  object Label2: TLabel
    Left = 64
    Top = 11
    Width = 225
    Height = 29
    Caption = 'Inicia Depreciaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaption
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object wMensaje1: TLabel
    Left = 32
    Top = 170
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
    Top = 169
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
    Left = 143
    Top = 42
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoBk
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 74
    Top = 135
    Width = 45
    Height = 15
    Caption = 'Periodo :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object wMensaje4: TLabel
    Left = 200
    Top = 76
    Width = 6
    Height = 29
  end
  object Label74: TLabel
    Left = 18
    Top = 102
    Width = 101
    Height = 15
    Caption = 'Tipo Depreciaci'#243'n :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 63
    Top = 70
    Width = 55
    Height = 15
    Caption = 'Compa'#241#237'a :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object bbtnOk1: TBitBtn
    Left = 271
    Top = 221
    Width = 33
    Height = 35
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
    Left = 313
    Top = 221
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
    Left = 128
    Top = 129
    Width = 81
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcdPeriodoExit
  end
  object dblcTipoD: TwwDBLookupCombo
    Left = 128
    Top = 97
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
    Left = 179
    Top = 97
    Width = 150
    Height = 23
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object pbDep: TProgressBar
    Left = 16
    Top = 195
    Width = 345
    Height = 16
    TabOrder = 5
  end
  object edtCiades: TEdit
    Left = 179
    Top = 65
    Width = 169
    Height = 23
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object dblcCia: TwwDBLookupCombo
    Left = 128
    Top = 65
    Width = 49
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'C'#243'digo'#9'F'
      'CIADES'#9'40'#9'Descripci'#243'n'#9'F')
    LookupTable = DMAF.cdsCia
    LookupField = 'CIAID'
    Options = [loColLines, loRowLines, loTitles]
    ParentFont = False
    TabOrder = 7
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcCiaExit
  end
end
