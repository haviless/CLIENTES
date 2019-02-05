object FLimiteReexp: TFLimiteReexp
  Left = 123
  Top = 158
  Width = 524
  Height = 336
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'L'#237'mite de Reexpresi'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 21
    Width = 55
    Height = 13
    Caption = 'Compa'#241#237'a :'
  end
  object Label2: TLabel
    Left = 24
    Top = 53
    Width = 60
    Height = 13
    Caption = 'Tipo Activo :'
  end
  object Label3: TLabel
    Left = 24
    Top = 88
    Width = 36
    Height = 13
    Caption = 'Activo :'
  end
  object dbeCia: TwwDBEdit
    Left = 173
    Top = 18
    Width = 121
    Height = 21
    TabOrder = 0
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcdTipAct: TwwDBLookupComboDlg
    Left = 99
    Top = 53
    Width = 121
    Height = 21
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taLeftJustify
    Caption = 'Lookup'
    MaxWidth = 0
    MaxHeight = 209
    Selected.Strings = (
      'TACFID'#9'10'#9'C'#243'digo'#9'F'
      'TACFDES'#9'40'#9'Descripci'#243'n'#9'F')
    LookupTable = DMAF.cdsTipAct
    LookupField = 'TACFID'
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcdTipActExit
  end
  object dblcdActivo: TwwDBLookupComboDlg
    Left = 99
    Top = 88
    Width = 121
    Height = 21
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taLeftJustify
    Caption = 'Lookup'
    MaxWidth = 0
    MaxHeight = 209
    Selected.Strings = (
      'ACFID'#9'8'#9'C'#243'digo'#9'F'
      'ACFDES'#9'50'#9'Descripci'#243'n'#9'F')
    LookupTable = DMAF.cdsActFij
    LookupField = 'ACFID'
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcdActivoExit
  end
  object BitBtOk: TBitBtn
    Left = 376
    Top = 272
    Width = 35
    Height = 30
    Default = True
    TabOrder = 3
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
  object BitBtnCancel: TBitBtn
    Left = 425
    Top = 272
    Width = 35
    Height = 30
    Cancel = True
    TabOrder = 4
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
  object dbeTipact: TwwDBEdit
    Left = 232
    Top = 53
    Width = 225
    Height = 21
    TabOrder = 5
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeActivo: TwwDBEdit
    Left = 232
    Top = 88
    Width = 225
    Height = 21
    TabOrder = 6
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcdcia: TwwDBLookupCombo
    Left = 97
    Top = 18
    Width = 63
    Height = 21
    DropDownAlignment = taLeftJustify
    LookupTable = DMAF.cdsCia
    LookupField = 'CIAID'
    TabOrder = 7
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcdciaExit
  end
  object wwDBGrid1: TwwDBGrid
    Left = 24
    Top = 120
    Width = 433
    Height = 120
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    TabOrder = 8
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object BitBtn1: TBitBtn
    Left = 472
    Top = 16
    Width = 35
    Height = 30
    Default = True
    TabOrder = 9
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
end
