object FAFControlOpe: TFAFControlOpe
  Left = 298
  Top = 229
  BorderStyle = bsSingle
  Caption = 'Mantenimiento del Activo Fijo'
  ClientHeight = 420
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 8
    Top = 10
    Width = 81
    Height = 13
    Caption = 'C'#243'digo de Barras'
  end
  object Label1: TLabel
    Left = 8
    Top = 39
    Width = 26
    Height = 13
    Caption = 'Local'
  end
  object Label2: TLabel
    Left = 350
    Top = 39
    Width = 20
    Height = 13
    Caption = 'Piso'
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 22
    Height = 13
    Caption = 'Area'
  end
  object Label4: TLabel
    Left = 350
    Top = 64
    Width = 44
    Height = 13
    Caption = 'Ambiente'
  end
  object Label5: TLabel
    Left = 8
    Top = 89
    Width = 77
    Height = 13
    Caption = 'Usuario del Bien'
  end
  object lblFecha: TLabel
    Left = 592
    Top = 88
    Width = 40
    Height = 13
    Caption = 'lblFecha'
    Visible = False
  end
  object Bevel3: TBevel
    Left = -33
    Top = 110
    Width = 721
    Height = 3
  end
  object Label7: TLabel
    Left = 8
    Top = 122
    Width = 74
    Height = 13
    Caption = 'Estado del Bien'
  end
  object Label8: TLabel
    Left = 8
    Top = 147
    Width = 68
    Height = 13
    Caption = 'Denominaci'#243'n'
  end
  object Label9: TLabel
    Left = 8
    Top = 172
    Width = 71
    Height = 13
    Caption = 'Desc.Adicional'
  end
  object Label10: TLabel
    Left = 8
    Top = 197
    Width = 37
    Height = 13
    Caption = 'Material'
  end
  object Label11: TLabel
    Left = 8
    Top = 222
    Width = 30
    Height = 13
    Caption = 'Marca'
  end
  object Label12: TLabel
    Left = 8
    Top = 247
    Width = 35
    Height = 13
    Caption = 'Modelo'
  end
  object Label13: TLabel
    Left = 8
    Top = 272
    Width = 24
    Height = 13
    Caption = 'Serie'
  end
  object Label14: TLabel
    Left = 8
    Top = 297
    Width = 60
    Height = 13
    Caption = 'Dimensiones'
  end
  object lblMotivoIng: TLabel
    Left = 24
    Top = 365
    Width = 87
    Height = 13
    Caption = 'Motivo del Ingreso'
    Visible = False
  end
  object lblOCompra: TLabel
    Left = 312
    Top = 222
    Width = 83
    Height = 13
    Caption = 'Orden de Compra'
  end
  object lblFecIng: TLabel
    Left = 312
    Top = 247
    Width = 84
    Height = 13
    Caption = 'Fecha de Compra'
  end
  object lblDocRefIng: TLabel
    Left = 312
    Top = 272
    Width = 75
    Height = 13
    Caption = 'Doc.Referencia'
  end
  object lblNumDocIng: TLabel
    Left = 464
    Top = 297
    Width = 78
    Height = 13
    Caption = 'N'#250'mero de Doc.'
  end
  object lblValorIng: TLabel
    Left = 312
    Top = 322
    Width = 74
    Height = 13
    Caption = 'Valor del Activo'
  end
  object Label15: TLabel
    Left = 312
    Top = 198
    Width = 49
    Height = 13
    Caption = 'Proveedor'
  end
  object Label16: TLabel
    Left = 312
    Top = 296
    Width = 24
    Height = 13
    Caption = 'Serie'
  end
  object Label17: TLabel
    Left = 376
    Top = 383
    Width = 34
    Height = 13
    Caption = 'Repetir'
    Visible = False
  end
  object Label18: TLabel
    Left = 456
    Top = 383
    Width = 29
    Height = 13
    Caption = 'veces'
    Visible = False
  end
  object Label19: TLabel
    Left = 312
    Top = 346
    Width = 47
    Height = 13
    Caption = 'Verificado'
  end
  object lblArticulo: TLabel
    Left = 296
    Top = 9
    Width = 35
    Height = 13
    Caption = 'Articulo'
  end
  object dbeCodBarrasIng: TwwDBEdit
    Left = 224
    Top = 5
    Width = 41
    Height = 21
    TabOrder = 0
    UnboundDataType = wwDefault
    Visible = False
    WantReturns = False
    WordWrap = False
    OnExit = dbeCodBarrasIngExit
  end
  object dblcLocalIng: TwwDBLookupCombo
    Left = 53
    Top = 34
    Width = 50
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'LOCID'#9'2'#9'Id'#9'F'
      'LOCDES'#9'30'#9'Local'#9'F')
    LookupTable = DMAF.cdsLocal
    LookupField = 'LOCID'
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcLocalIngExit
  end
  object edtlocalIng: TEdit
    Left = 104
    Top = 34
    Width = 160
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object dblcPisoIng: TwwDBLookupCombo
    Left = 408
    Top = 34
    Width = 50
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'PISO'#9'2'#9'Id'#9'F'
      'PISODES'#9'36'#9'Piso'#9'F')
    LookupTable = DMAF.cdsPiso
    LookupField = 'PISO'
    TabOrder = 3
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcPisoIngExit
  end
  object edtPisoIng: TEdit
    Left = 459
    Top = 34
    Width = 160
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object dblcAreaIng: TwwDBLookupCombo
    Left = 53
    Top = 59
    Width = 50
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'AREA'#9'2'#9'Id'#9'F'
      'AREADES'#9'50'#9#193'rea'#9'F')
    LookupTable = DMAF.cdsArea
    LookupField = 'AREA'
    TabOrder = 5
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcAreaIngExit
  end
  object edtAreaIng: TEdit
    Left = 104
    Top = 59
    Width = 160
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object dblcAmbIng: TwwDBLookupCombo
    Left = 408
    Top = 59
    Width = 50
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'AMBCOD'#9'3'#9'Id'#9'F'
      'AMBDES'#9'50'#9'Ambiente'#9'F')
    LookupTable = DMAF.cdsAmbiente
    LookupField = 'AMBCOD'
    TabOrder = 7
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcAmbIngExit
  end
  object edtAmbIng: TEdit
    Left = 459
    Top = 59
    Width = 160
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object dbeRespIng: TwwDBEdit
    Left = 96
    Top = 84
    Width = 79
    Height = 21
    TabOrder = 9
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
    OnExit = dbeRespIngExit
  end
  object bbtnRespIng: TBitBtn
    Left = 174
    Top = 84
    Width = 23
    Height = 21
    TabOrder = 10
    OnClick = bbtnRespIngClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
      3333333333333FF3333333330000333333364463333333333333388F33333333
      00003333333E66433333333333338F38F3333333000033333333E66333333333
      33338FF8F3333333000033333333333333333333333338833333333300003333
      3333446333333333333333FF3333333300003333333666433333333333333888
      F333333300003333333E66433333333333338F38F333333300003333333E6664
      3333333333338F38F3333333000033333333E6664333333333338F338F333333
      0000333333333E6664333333333338F338F3333300003333344333E666433333
      333F338F338F3333000033336664333E664333333388F338F338F33300003333
      E66644466643333338F38FFF8338F333000033333E6666666663333338F33888
      3338F3330000333333EE666666333333338FF33333383333000033333333EEEE
      E333333333388FFFFF8333330000333333333333333333333333388888333333
      0000}
    NumGlyphs = 2
  end
  object edtRespIng: TEdit
    Left = 201
    Top = 84
    Width = 241
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    MaxLength = 30
    TabOrder = 11
  end
  object dblcEstadoIng: TwwDBLookupCombo
    Left = 112
    Top = 117
    Width = 50
    Height = 21
    CharCase = ecUpperCase
    DropDownAlignment = taLeftJustify
    LookupTable = DMAF.cdsEstado
    LookupField = 'ESTADOID'
    TabOrder = 12
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcEstadoIngExit
  end
  object edtEstadoIng: TEdit
    Left = 163
    Top = 117
    Width = 160
    Height = 21
    Enabled = False
    TabOrder = 13
  end
  object dbeDenominaciIng: TwwDBEdit
    Left = 112
    Top = 142
    Width = 337
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 14
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeACFDESLIng: TwwDBEdit
    Left = 112
    Top = 167
    Width = 529
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 16
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeMarcaIng: TwwDBEdit
    Left = 112
    Top = 217
    Width = 145
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 18
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeModeloIng: TwwDBEdit
    Left = 112
    Top = 242
    Width = 145
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 19
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeSerieIng: TwwDBEdit
    Left = 112
    Top = 267
    Width = 145
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 20
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeDimensioIng: TwwDBEdit
    Left = 112
    Top = 292
    Width = 145
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 21
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcMotivoIng: TwwDBLookupCombo
    Left = 128
    Top = 360
    Width = 137
    Height = 21
    DropDownAlignment = taLeftJustify
    LookupTable = DMAF.cdsMotivos
    LookupField = 'MOTDES'
    TabOrder = 22
    Visible = False
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object dbeOCompra: TwwDBEdit
    Left = 416
    Top = 217
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 24
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbdtpFecIng: TwwDBDateTimePicker
    Left = 416
    Top = 242
    Width = 81
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 26
    DisplayFormat = 'dd/mm/yyyy'
    OnExit = dbdtpFecIngExit
  end
  object dblcMonedaIng: TwwDBLookupCombo
    Left = 416
    Top = 317
    Width = 65
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'AMBCOD'#9'3'#9'Id'#9'F'
      'AMBDES'#9'50'#9'Ambiente'#9'F')
    LookupTable = DMAF.cdsMoneda
    LookupField = 'TMONABR'
    TabOrder = 30
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object dbeValorIng: TwwDBEdit
    Left = 488
    Top = 317
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 31
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object bbtnGrabaIng: TBitBtn
    Left = 578
    Top = 383
    Width = 23
    Height = 25
    Hint = 'Registrar'
    Cancel = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 34
    OnClick = bbtnGrabaIngClick
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
  object bbtnNuevoIng: TBitBtn
    Left = 640
    Top = 383
    Width = 75
    Height = 25
    Caption = 'Nuevo'
    Enabled = False
    TabOrder = 35
    Visible = False
    OnClick = bbtnNuevoIngClick
  end
  object pnlBusqueda: TPanel
    Left = 674
    Top = 156
    Width = 493
    Height = 145
    Color = clSilver
    TabOrder = 36
    Visible = False
    object lblBusca: TLabel
      Left = 24
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Busca'
    end
    object dbgBusca: TwwDBGrid
      Left = 8
      Top = 40
      Width = 473
      Height = 98
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clGray
      FixedCols = 0
      ShowHorzScrollBar = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
    object bbtnOkBusca: TBitBtn
      Left = 417
      Top = 7
      Width = 30
      Height = 28
      Hint = 'Confirma Ingreso de Articulo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnOkBuscaClick
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
    object bbtnCancBusca: TBitBtn
      Left = 451
      Top = 7
      Width = 30
      Height = 28
      Hint = 'Cancela Ingreso de Articulo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnCancBuscaClick
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
    object dbeBusca: TwwDBEdit
      Left = 61
      Top = 12
      Width = 220
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeBuscaExit
    end
  end
  object bbtnDenominaci: TBitBtn
    Left = 454
    Top = 140
    Width = 23
    Height = 21
    TabOrder = 15
    OnClick = bbtnDenominaciClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
      3333333333333FF3333333330000333333364463333333333333388F33333333
      00003333333E66433333333333338F38F3333333000033333333E66333333333
      33338FF8F3333333000033333333333333333333333338833333333300003333
      3333446333333333333333FF3333333300003333333666433333333333333888
      F333333300003333333E66433333333333338F38F333333300003333333E6664
      3333333333338F38F3333333000033333333E6664333333333338F338F333333
      0000333333333E6664333333333338F338F3333300003333344333E666433333
      333F338F338F3333000033336664333E664333333388F338F338F33300003333
      E66644466643333338F38FFF8338F333000033333E6666666663333338F33888
      3338F3330000333333EE666666333333338FF33333383333000033333333EEEE
      E333333333388FFFFF8333330000333333333333333333333333388888333333
      0000}
    NumGlyphs = 2
  end
  object dblcMaterialIng: TwwDBLookupCombo
    Left = 112
    Top = 192
    Width = 73
    Height = 21
    DropDownAlignment = taLeftJustify
    LookupTable = DMAF.cdsMaterial
    LookupField = 'MATERIALID'
    TabOrder = 17
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object dblcDocRefIng: TwwDBLookupCombo
    Left = 416
    Top = 266
    Width = 81
    Height = 21
    DropDownAlignment = taLeftJustify
    LookupTable = DMAF.cdsDocs
    LookupField = 'DOCABR'
    TabOrder = 27
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object dblcdProveedor: TwwDBLookupComboDlg
    Left = 416
    Top = 192
    Width = 81
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
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
      'PROV'#9'12'#9'PROV'#9'F'
      'PROVDES'#9'30'#9'Descripci'#243'n'#9'F'
      'PROVRUC'#9'12'#9'RUC'#9'F')
    LookupTable = DMAF.cdsProvee
    LookupField = 'PROV'
    Color = clWhite
    MaxLength = 8
    ParentFont = False
    TabOrder = 23
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcdProveedorExit
  end
  object edtProveedorDes: TEdit
    Left = 505
    Top = 191
    Width = 160
    Height = 21
    Enabled = False
    TabOrder = 25
  end
  object dbeSerieDoc: TwwDBEdit
    Left = 415
    Top = 292
    Width = 45
    Height = 23
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 28
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeNoDoc: TwwDBEdit
    Left = 553
    Top = 292
    Width = 72
    Height = 23
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 29
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object edRepetir: TEdit
    Left = 424
    Top = 378
    Width = 25
    Height = 21
    MaxLength = 4
    TabOrder = 33
    Text = '0'
    Visible = False
  end
  object dbeVeri: TwwDBEdit
    Left = 415
    Top = 344
    Width = 34
    Height = 23
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 32
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeArticulo: TwwDBEdit
    Left = 344
    Top = 5
    Width = 81
    Height = 21
    Enabled = False
    TabOrder = 37
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
    OnExit = dbeCodBarrasIngExit
  end
  object dbeCodigoBarra: TwwDBEdit
    Left = 104
    Top = 5
    Width = 105
    Height = 21
    Enabled = False
    TabOrder = 38
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
    OnExit = dbeCodBarrasIngExit
  end
end
