object FMaestro: TFMaestro
  Left = 370
  Top = 77
  BorderStyle = bsDialog
  Caption = 'Maestro de Activo Fijo'
  ClientHeight = 576
  ClientWidth = 797
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcMaestro: TPageControl
    Left = 0
    Top = 0
    Width = 797
    Height = 576
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    Visible = False
    OnChanging = pcMaestroChanging
    object TabSheet1: TTabSheet
      Caption = 'Datos Generales'
      object Label18: TLabel
        Left = 328
        Top = 0
        Width = 4
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PnlActReg: TPanel
        Left = 0
        Top = 2
        Width = 793
        Height = 537
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Bevel7: TBevel
          Left = 7
          Top = 313
          Width = 778
          Height = 87
        end
        object Bevel2: TBevel
          Left = 7
          Top = 220
          Width = 778
          Height = 88
        end
        object Bevel3: TBevel
          Left = 7
          Top = 405
          Width = 778
          Height = 86
        end
        object B: TBevel
          Left = 8
          Top = 60
          Width = 785
          Height = 156
        end
        object Label37: TLabel
          Left = 223
          Top = 10
          Width = 72
          Height = 15
          Caption = 'Denominaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 329
          Top = 64
          Width = 62
          Height = 15
          Caption = 'Descripci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 327
          Top = 407
          Width = 94
          Height = 15
          Caption = 'Fecha Adquisici'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 201
          Top = 222
          Width = 21
          Height = 15
          Caption = 'Piso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 376
          Top = 265
          Width = 80
          Height = 15
          Caption = 'Centro de Costo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 286
          Top = 119
          Width = 45
          Height = 15
          Caption = 'M a r c a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label48: TLabel
          Left = 429
          Top = 119
          Width = 52
          Height = 15
          Caption = 'M o d e l o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 578
          Top = 119
          Width = 41
          Height = 15
          Caption = 'S e r i e'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label50: TLabel
          Left = 35
          Top = 315
          Width = 52
          Height = 15
          Caption = 'Proveedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 310
          Top = 315
          Width = 56
          Height = 15
          Caption = 'Documento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 490
          Top = 315
          Width = 29
          Height = 15
          Caption = 'Serie'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label53: TLabel
          Left = 549
          Top = 315
          Width = 55
          Height = 15
          Caption = 'N '#250' m e r o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 22
          Top = 357
          Width = 55
          Height = 15
          Caption = 'M o n e d a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label56: TLabel
          Left = 227
          Top = 357
          Width = 78
          Height = 15
          Caption = 'Tipo de Cambio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label62: TLabel
          Left = 360
          Top = 357
          Width = 87
          Height = 15
          Caption = 'Importe Original'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label63: TLabel
          Left = 518
          Top = 357
          Width = 69
          Height = 15
          Caption = 'Importe M.N.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label64: TLabel
          Left = 658
          Top = 357
          Width = 67
          Height = 15
          Caption = 'Importe M.E.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 22
          Top = 222
          Width = 49
          Height = 15
          Caption = 'Localidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 28
          Top = 119
          Width = 44
          Height = 15
          Caption = 'Material'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 27
          Top = 450
          Width = 82
          Height = 15
          Caption = 'Cuenta Contable'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 390
          Top = 173
          Width = 64
          Height = 15
          Caption = 'Clase Activo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 590
          Top = 407
          Width = 91
          Height = 15
          Caption = 'Fecha Instalaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 459
          Top = 407
          Width = 86
          Height = 15
          Caption = 'Fecha Recepci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 351
          Top = 450
          Width = 80
          Height = 15
          Caption = 'Vida Util Meses'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label72: TLabel
          Left = 457
          Top = 450
          Width = 137
          Height = 15
          Caption = 'Fecha Inicio Depreciaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 643
          Top = 450
          Width = 105
          Height = 15
          Caption = '# de Veces a repetir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label61: TLabel
          Left = 685
          Top = 119
          Width = 82
          Height = 15
          Caption = 'C'#243'digo de Barra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label69: TLabel
          Left = 665
          Top = 315
          Width = 88
          Height = 15
          Caption = 'Garant'#237'a (Meses)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label70: TLabel
          Left = 23
          Top = 173
          Width = 64
          Height = 15
          Caption = 'Dimensiones'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Bevel4: TBevel
          Left = 9
          Top = 7
          Width = 776
          Height = 49
        end
        object Label34: TLabel
          Left = 25
          Top = 9
          Width = 49
          Height = 15
          Caption = 'Compa'#241#237'a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 527
          Top = 9
          Width = 75
          Height = 15
          Caption = 'Tipo de Activo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 19
          Top = 65
          Width = 72
          Height = 15
          Caption = 'C'#243'digo Activo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label100: TLabel
          Left = 138
          Top = 65
          Width = 44
          Height = 15
          Caption = 'Reforma'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 225
          Top = 65
          Width = 54
          Height = 15
          Caption = 'Compuesto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 177
          Top = 87
          Width = 14
          Height = 15
          Caption = '00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label101: TLabel
          Left = 157
          Top = 87
          Width = 15
          Height = 15
          Caption = '(R)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label78: TLabel
          Left = 217
          Top = 173
          Width = 39
          Height = 15
          Caption = 'C o l o r'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label79: TLabel
          Left = 570
          Top = 173
          Width = 34
          Height = 15
          Caption = 'Estado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label82: TLabel
          Left = 21
          Top = 265
          Width = 105
          Height = 15
          Caption = 'Usuario Responsable'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label85: TLabel
          Left = 318
          Top = 222
          Width = 25
          Height = 15
          Caption = 'Area'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label86: TLabel
          Left = 496
          Top = 222
          Width = 48
          Height = 15
          Caption = 'Ambiente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label144: TLabel
          Left = 28
          Top = 410
          Width = 88
          Height = 15
          Caption = 'Orden de Compra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label145: TLabel
          Left = 184
          Top = 410
          Width = 83
          Height = 15
          Caption = 'Nota de Ingreso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object dbmDesAmp: TDBMemo
          Left = 328
          Top = 78
          Width = 425
          Height = 35
          Color = clWhite
          DataField = 'ACFDESL'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object dblcCia: TwwDBLookupCombo
          Left = 20
          Top = 26
          Width = 42
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CIAID'#9'2'#9'CIA'#9'F'
            'CIAABR'#9'15'#9'Descripci'#243'n'#9'F')
          DataField = 'CIAID'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsCia
          LookupField = 'CIAID'
          Options = [loColLines, loRowLines, loTitles]
          Color = clWhite
          MaxLength = 2
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          PreciseEditRegion = False
          AllowClearKey = False
          ShowMatchText = True
          OnExit = dblcCiaExit
        end
        object bbtnOk1: TBitBtn
          Left = 648
          Top = 497
          Width = 34
          Height = 32
          Caption = 'H'
          TabOrder = 56
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
        object bbtnCancela1: TBitBtn
          Left = 696
          Top = 497
          Width = 34
          Height = 31
          TabOrder = 57
          OnClick = bbtnCancela1Click
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
        object dbdtpFecAdqui: TwwDBDateTimePicker
          Left = 324
          Top = 424
          Width = 100
          Height = 21
          AutoFillDateAndTime = True
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clWhite
          DataField = 'ACFFECADQ'
          DataSource = DMAF.dsActFij
          Date = 36526.000000000000000000
          Epoch = 1950
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 48
          OnExit = dbdtpFecAdquiExit
        end
        object dbeFlagComp: TwwDBEdit
          Left = 244
          Top = 82
          Width = 14
          Height = 23
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'ACFFLACOMP'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeFlagCompExit
        end
        object dblcdCCosId: TwwDBLookupComboDlg
          Left = 374
          Top = 281
          Width = 95
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
            'CCOSID'#9'15'#9'Centro de Costo'#9'F'
            'CCOSABR'#9'15'#9'Descripci'#243'n'#9'F')
          DataField = 'CCOSID'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsCCosto
          LookupField = 'CCOSID'
          Color = 14869218
          Enabled = False
          MaxLength = 15
          ParentFont = False
          TabOrder = 31
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object dbeMarca: TwwDBEdit
          Left = 247
          Top = 136
          Width = 140
          Height = 23
          Color = clWhite
          DataField = 'ACFMARCA'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeModelo: TwwDBEdit
          Left = 392
          Top = 136
          Width = 140
          Height = 23
          Color = clWhite
          DataField = 'ACFMODELO'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeSerie: TwwDBEdit
          Left = 537
          Top = 136
          Width = 140
          Height = 23
          Color = clWhite
          DataField = 'ACFSERIE'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeSerieExit
        end
        object dblcdProveedor: TwwDBLookupComboDlg
          Left = 20
          Top = 332
          Width = 95
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
          DataField = 'PROV'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsProvee
          LookupField = 'PROV'
          Color = clWhite
          MaxLength = 8
          ParentFont = False
          TabOrder = 33
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnExit = dblcdProveedorExit
        end
        object dblcTipAdqui: TwwDBLookupCombo
          Left = 387
          Top = 188
          Width = 35
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TIPADQUI'#9'3'#9'Tipo'#9'F'
            'TIPADABR'#9'15'#9'Descripci'#243'n'#9'F')
          DataField = 'ACFTIPADQU'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsAdqui
          LookupField = 'TIPADQUI'
          Options = [loColLines, loRowLines, loTitles]
          Color = clWhite
          MaxLength = 1
          ParentFont = False
          TabOrder = 17
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcTipAdquiExit
        end
        object dblcTipDoc: TwwDBLookupCombo
          Left = 307
          Top = 332
          Width = 42
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DOCID'#9'2'#9'Tipo'#9'F'
            'DOCABR'#9'15'#9'Descripci'#243'n'#9'F')
          DataField = 'DOCID'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsTipDoc
          LookupField = 'DOCID'
          Options = [loColLines, loRowLines, loTitles]
          Color = clWhite
          ParentFont = False
          TabOrder = 35
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          OnExit = dblcTipDocExit
        end
        object dbeSerieDoc: TwwDBEdit
          Left = 487
          Top = 332
          Width = 45
          Height = 23
          Color = clWhite
          DataField = 'ACFSERIEDO'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 37
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeNoDoc: TwwDBEdit
          Left = 545
          Top = 332
          Width = 121
          Height = 23
          Color = clWhite
          DataField = 'ACFNODOC'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 38
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcMoneda: TwwDBLookupCombo
          Left = 20
          Top = 372
          Width = 42
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TMONID'#9'3'#9'Tipo'#9'F'
            'TMONABR'#9'8'#9'Descripci'#243'n'#9'F')
          DataField = 'TMONID'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsMoneda
          LookupField = 'TMONID'
          Options = [loColLines, loRowLines, loTitles]
          Color = clWhite
          MaxLength = 2
          ParentFont = False
          TabOrder = 40
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          OnExit = dblcMonedaExit
        end
        object dbeCambio: TwwDBEdit
          Left = 225
          Top = 372
          Width = 85
          Height = 23
          DataField = 'ACFCAMBIO'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 42
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeCambioExit
        end
        object dbdtpFecIns: TwwDBDateTimePicker
          Left = 587
          Top = 424
          Width = 100
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clWhite
          DataField = 'ACFFECINS'
          DataSource = DMAF.dsActFij
          Date = 36526.000000000000000000
          Epoch = 1950
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 50
          OnExit = dbdtpFecInsExit
        end
        object dbdtpFecRecep: TwwDBDateTimePicker
          Left = 455
          Top = 424
          Width = 100
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clWhite
          DataField = 'ACFFECRECE'
          DataSource = DMAF.dsActFij
          Date = 36526.000000000000000000
          Epoch = 1950
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 49
          OnExit = dbdtpFecRecepExit
        end
        object dbeValOMO: TwwDBEdit
          Left = 345
          Top = 372
          Width = 120
          Height = 23
          Color = clWhite
          DataField = 'ACFVALOMO'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 43
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeValOMOExit
        end
        object dbeValOMN: TwwDBEdit
          Left = 507
          Top = 372
          Width = 120
          Height = 23
          Color = clWhite
          DataField = 'ACFVALOMN'
          DataSource = DMAF.dsActFij
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 44
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeValOME: TwwDBEdit
          Left = 630
          Top = 372
          Width = 120
          Height = 23
          Color = clWhite
          DataField = 'ACFVALOME'
          DataSource = DMAF.dsActFij
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 45
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edtCiaDes: TEdit
          Left = 63
          Top = 26
          Width = 150
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 1
        end
        object edtLocalidadDes: TEdit
          Left = 63
          Top = 237
          Width = 122
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 22
        end
        object edtMaterialDes: TEdit
          Left = 86
          Top = 136
          Width = 156
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 10
        end
        object edtAdquisicionDes: TEdit
          Left = 423
          Top = 188
          Width = 120
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 18
        end
        object edtCuentaDes: TEdit
          Left = 160
          Top = 465
          Width = 184
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 52
        end
        object dblcLocalidad: TwwDBLookupCombo
          Left = 20
          Top = 237
          Width = 42
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'LOCID'#9'2'#9'LOCID'#9'F'#9
            'LOCDES'#9'30'#9'LOCDES'#9'F'#9)
          DataField = 'LOCID'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsLocalidad
          LookupField = 'LOCID'
          Options = [loColLines, loRowLines, loTitles]
          Color = clWhite
          MaxLength = 3
          ParentFont = False
          TabOrder = 21
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcLocalidadExit
        end
        object dblcMaterial: TwwDBLookupCombo
          Left = 20
          Top = 136
          Width = 66
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MATERIALID'#9'5'#9'Mat.'#9'F'
            'MATERDES'#9'30'#9'Descripci'#243'n'#9'F')
          DataField = 'MATERIALID'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsMaterial
          LookupField = 'MaterialId'
          Options = [loColLines, loRowLines, loTitles]
          Color = clWhite
          MaxLength = 3
          ParentFont = False
          TabOrder = 9
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcMaterialExit
        end
        object edtTipDocDes: TEdit
          Left = 350
          Top = 332
          Width = 120
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 36
        end
        object edtProveedorDes: TEdit
          Left = 116
          Top = 332
          Width = 180
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 34
        end
        object edtCCostoDes: TEdit
          Left = 470
          Top = 281
          Width = 205
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 32
        end
        object edtMonedaDes: TEdit
          Left = 63
          Top = 372
          Width = 120
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 41
        end
        object dblcdCuenta: TwwDBLookupComboDlg
          Left = 20
          Top = 465
          Width = 135
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
            'CUENTAID'#9'15'#9'CUENTA'#9'F'
            'CTAABR'#9'20'#9'Descripci'#243'n'#9'F'
            'CIAID'#9'2'#9'Cia'#9'F')
          DataField = 'CUENTAID'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsCuenta
          LookupField = 'CUENTAID'
          Color = 14869218
          Enabled = False
          MaxLength = 15
          ParentFont = False
          TabOrder = 51
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
          OnExit = dblcdCuentaExit
        end
        object dbeVida: TwwDBEdit
          Left = 373
          Top = 465
          Width = 33
          Height = 23
          Color = 14869218
          DataField = 'TACFVIDA'
          DataSource = DMAF.dsActFij
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 53
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbdtpFiniDep: TwwDBDateTimePicker
          Left = 457
          Top = 465
          Width = 100
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clWhite
          DataField = 'ACFFINIDEP'
          DataSource = DMAF.dsActFij
          Date = 36557.000000000000000000
          Epoch = 1950
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 54
          OnExit = dbdtpFiniDepExit
        end
        object dbeRefor: TwwDBEdit
          Left = 140
          Top = 82
          Width = 15
          Height = 23
          Color = clWhite
          DataField = 'ACFFLAGREF'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeReforExit
        end
        object dbeVeces: TwwDBEdit
          Left = 676
          Top = 465
          Width = 33
          Height = 23
          Color = 14869218
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 55
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeAcFId: TwwDBEdit
          Left = 108
          Top = 82
          Width = 21
          Height = 23
          Color = 14869218
          DataField = 'ACFID'
          DataSource = DMAF.dsActFij
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          MaxLength = 8
          ParentFont = False
          TabOrder = 5
          UnboundDataType = wwDefault
          Visible = False
          WantReturns = False
          WordWrap = False
          OnExit = dbeAcFidExit
        end
        object dbeBarra: TwwDBEdit
          Left = 19
          Top = 82
          Width = 81
          Height = 23
          Color = 14869218
          DataField = 'ARTCODBAR'
          DataSource = DMAF.dsActFij
          Enabled = False
          Font.Charset = BALTIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Picture.PictureMask = '[#][#][#][#][#][#]'
          TabOrder = 14
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeBarraExit
        end
        object dbeGarantia: TwwDBEdit
          Left = 684
          Top = 332
          Width = 45
          Height = 23
          Color = clWhite
          DataField = 'GARANTIA'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 39
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeMedidas: TwwDBEdit
          Left = 20
          Top = 188
          Width = 174
          Height = 23
          Color = clWhite
          DataField = 'ACFMEDIDA'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeColor: TwwDBEdit
          Left = 212
          Top = 188
          Width = 156
          Height = 23
          Color = clWhite
          DataField = 'ACFCOLOR'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcResponsable: TwwDBLookupComboDlg
          Left = 21
          Top = 280
          Width = 252
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
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
            'RECIBENOM'#9'50'#9'Nombre'#9'F'
            'RECIBEID'#9'5'#9'C'#243'digo'#9'F')
          DataField = 'RECIBENOM'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsResponsable
          LookupField = 'RECIBENOM'
          Color = clWhite
          ParentFont = False
          TabOrder = 29
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnExit = dblcResponsableExit
        end
        object dblcEstado: TwwDBLookupCombo
          Left = 565
          Top = 188
          Width = 49
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ESTADOID'#9'2'#9'Estado'#9'F'
            'ESTADODES'#9'15'#9'Descripci'#243'n'#9'F')
          DataField = 'ESTADOID'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsEstado
          LookupField = 'ESTADOID'
          Options = [loColLines, loRowLines, loTitles]
          Color = clWhite
          ParentFont = False
          TabOrder = 19
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcEstadoExit
        end
        object edtEstado: TEdit
          Left = 615
          Top = 188
          Width = 120
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 20
        end
        object edtResponsableId: TwwDBEdit
          Left = 283
          Top = 280
          Width = 77
          Height = 23
          Color = 14869218
          DataField = 'RECIBEID'
          DataSource = DMAF.dsActFij
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 30
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcPiso: TwwDBLookupCombo
          Left = 196
          Top = 237
          Width = 42
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PISO'#9'2'#9'PISO'#9#9
            'PISODES'#9'36'#9'PISODES'#9#9)
          DataField = 'PISO'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsPiso
          LookupField = 'PISO'
          Options = [loColLines, loRowLines, loTitles]
          Color = clWhite
          MaxLength = 3
          ParentFont = False
          TabOrder = 23
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcPisoExit
        end
        object dblcArea: TwwDBLookupComboDlg
          Left = 309
          Top = 237
          Width = 57
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
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
            'AREA'#9'2'#9'AREA'#9'F'#9
            'AREADES'#9'50'#9'AREADES'#9'F'#9)
          DataField = 'AREA'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsArea
          LookupField = 'Area'
          Color = clWhite
          ParentFont = False
          TabOrder = 25
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnExit = dblcAreaExit
        end
        object edtPisoDes: TEdit
          Left = 241
          Top = 237
          Width = 60
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 24
        end
        object edtAreaDes: TEdit
          Left = 368
          Top = 237
          Width = 119
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 26
        end
        object dblcAmbiente: TwwDBLookupComboDlg
          Left = 493
          Top = 237
          Width = 49
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
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
            'AMBCOD'#9'3'#9'AMBCOD'#9'F'#9
            'AMBDES'#9'50'#9'AMBDES'#9'F'#9)
          DataField = 'AMBCOD'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsAmbiente
          LookupField = 'AMBCOD'
          Color = clWhite
          ParentFont = False
          TabOrder = 27
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnExit = dblcAmbienteExit
        end
        object edtAmbienteDes: TEdit
          Left = 544
          Top = 237
          Width = 233
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 28
        end
        object dbeNIngreso: TwwDBEdit
          Left = 170
          Top = 426
          Width = 120
          Height = 23
          Color = clWhite
          DataField = 'NINDOC'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 47
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeOCompra: TwwDBEdit
          Left = 20
          Top = 425
          Width = 120
          Height = 23
          Color = clWhite
          DataField = 'OCNDOC'
          DataSource = DMAF.dsActFij
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 46
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeTipAct: TwwDBEdit
          Left = 521
          Top = 25
          Width = 69
          Height = 23
          Color = 14869218
          DataField = 'TACFID'
          DataSource = DMAF.dsActFij
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          MaxLength = 8
          ParentFont = False
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeTipActExit
        end
        object edtTipoActDes: TEdit
          Left = 596
          Top = 24
          Width = 181
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 4
        end
        object dblcDes: TwwDBLookupCombo
          Left = 222
          Top = 26
          Width = 291
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MATERIALID'#9'5'#9'Mat.'#9'F'
            'MATERDES'#9'30'#9'Descripci'#243'n'#9'F')
          DataField = 'ACFDES'
          DataSource = DMAF.dsActFij
          Options = [loColLines, loRowLines, loTitles]
          Color = clWhite
          MaxLength = 3
          ParentFont = False
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcDesExit
        end
        object dbeCodigoBarra: TwwDBEdit
          Left = 683
          Top = 136
          Width = 81
          Height = 23
          Color = clWhite
          DataField = 'CODIGOBARRA'
          DataSource = DMAF.dsActFij
          Enabled = False
          Font.Charset = BALTIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 58
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Depreciaci'#243'n '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      OnEnter = TabSheet2Enter
      OnExit = TabSheet2Exit
      OnShow = TabSheet2Show
      object pnlCabDepre: TPanel
        Left = 3
        Top = -4
        Width = 770
        Height = 165
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label80: TLabel
          Left = 22
          Top = 27
          Width = 49
          Height = 15
          Caption = 'Compa'#241#237'a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label81: TLabel
          Left = 192
          Top = 27
          Width = 51
          Height = 15
          Caption = 'Cod.Barra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label83: TLabel
          Left = 528
          Top = 27
          Width = 26
          Height = 15
          Caption = 'Tipo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label84: TLabel
          Left = 342
          Top = 8
          Width = 79
          Height = 19
          Caption = 'Depreciaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 610
          Top = 8
          Width = 14
          Height = 19
          Caption = 'E:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label102: TLabel
          Left = 24
          Top = 71
          Width = 49
          Height = 15
          Caption = 'Localidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label103: TLabel
          Left = 18
          Top = 112
          Width = 80
          Height = 15
          Caption = 'Centro de Costo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label104: TLabel
          Left = 204
          Top = 71
          Width = 21
          Height = 15
          Caption = 'Piso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label105: TLabel
          Left = 320
          Top = 71
          Width = 25
          Height = 15
          Caption = 'Area'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label106: TLabel
          Left = 488
          Top = 71
          Width = 48
          Height = 15
          Caption = 'Ambiente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label107: TLabel
          Left = 549
          Top = 112
          Width = 52
          Height = 15
          Caption = 'Ubicaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label142: TLabel
          Left = 235
          Top = 112
          Width = 62
          Height = 15
          Caption = 'Responsable'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object edtCia1: TEdit
          Left = 16
          Top = 46
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtCiaD1: TEdit
          Left = 51
          Top = 46
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 1
        end
        object edtAct1: TEdit
          Left = 179
          Top = 46
          Width = 73
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtTip1: TEdit
          Left = 513
          Top = 46
          Width = 57
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edtTipD1: TEdit
          Left = 572
          Top = 46
          Width = 175
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 4
        end
        object edtActD1: TEdit
          Left = 254
          Top = 46
          Width = 240
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 5
        end
        object edtLoc1: TEdit
          Left = 16
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edtCCos1: TEdit
          Left = 15
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtCCosD1: TEdit
          Left = 87
          Top = 131
          Width = 130
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object edtLocD1: TEdit
          Left = 51
          Top = 90
          Width = 140
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object edtPiso1: TEdit
          Left = 200
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object edtResponsable1: TEdit
          Left = 231
          Top = 131
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object edtArea1: TEdit
          Left = 320
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object edtPisoD1: TEdit
          Left = 238
          Top = 90
          Width = 78
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object edtResponsableD1: TEdit
          Left = 310
          Top = 131
          Width = 226
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object edtAreaD1: TEdit
          Left = 363
          Top = 90
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object edtAmbiente1: TEdit
          Left = 488
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object edtAmbienteD1: TEdit
          Left = 523
          Top = 90
          Width = 230
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object Edit13: TEdit
          Left = 619
          Top = 130
          Width = 87
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          Visible = False
        end
        object Edit14: TEdit
          Left = 547
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = False
        end
      end
      object Panel5: TPanel
        Left = 3
        Top = 174
        Width = 770
        Height = 355
        Caption = 'Panel5'
        Color = 14869218
        TabOrder = 1
        object Panel2: TPanel
          Left = 9
          Top = 4
          Width = 753
          Height = 58
          BevelInner = bvRaised
          BorderStyle = bsSingle
          Color = 14869218
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label27: TLabel
            Left = 558
            Top = 6
            Width = 137
            Height = 15
            Caption = 'Fecha Inicio Depreciaci'#243'n'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label30: TLabel
            Left = 266
            Top = 6
            Width = 94
            Height = 15
            Caption = 'Fecha Adquisici'#243'n'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label54: TLabel
            Left = 401
            Top = 6
            Width = 126
            Height = 15
            Caption = 'Valor Activo M.Nacional'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label74: TLabel
            Left = 15
            Top = 6
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
          object wwDBDateTimePicker1: TwwDBDateTimePicker
            Left = 573
            Top = 22
            Width = 90
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clWhite
            DataField = 'ACFFINIDEP'
            DataSource = DMAF.dsActFij
            Date = 36557.000000000000000000
            Epoch = 1950
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 2
          end
          object wwDBDateTimePicker2: TwwDBDateTimePicker
            Left = 268
            Top = 22
            Width = 90
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clWhite
            DataField = 'ACFFECADQ'
            DataSource = DMAF.dsActFij
            Date = 36526.000000000000000000
            Epoch = 1950
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 3
          end
          object wwDBEdit1: TwwDBEdit
            Left = 410
            Top = 22
            Width = 104
            Height = 23
            Color = clWhite
            DataField = 'ACFVALOMN'
            DataSource = DMAF.dsActFij
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeTipo: TwwDBEdit
            Left = 63
            Top = 22
            Width = 162
            Height = 21
            Color = 14869218
            Enabled = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcTipoD: TwwDBLookupCombo
            Left = 13
            Top = 22
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
            Color = clWhite
            ParentFont = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = True
            ShowMatchText = True
            OnExit = dblcTipoDExit
          end
        end
        object dbgDepre: TwwDBGrid
          Left = 10
          Top = 67
          Width = 750
          Height = 283
          DisableThemesInTitle = False
          IniAttributes.Delimiter = ';;'
          TitleColor = 7566265
          FixedCols = 0
          ShowHorzScrollBar = True
          Color = clWhite
          DataSource = DMAF.dsWork2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clNavy
          TitleFont.Height = -11
          TitleFont.Name = 'Comic Sans MS'
          TitleFont.Style = []
          TitleLines = 2
          TitleButtons = False
          OnEnter = dbgDepreEnter
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Distribuci'#243'n'
      ImageIndex = 7
      OnEnter = TabSheet8Enter
      object Label111: TLabel
        Left = 188
        Top = 44
        Width = 39
        Height = 16
        Caption = 'Codigo'
      end
      object Label112: TLabel
        Left = 293
        Top = 44
        Width = 93
        Height = 16
        Caption = 'D e s c r i p c i '#243' n'
        Color = 9408327
        ParentColor = False
      end
      object Label113: TLabel
        Left = 28
        Top = 44
        Width = 53
        Height = 16
        Caption = 'Compa'#241#237'a'
      end
      object Label97: TLabel
        Left = 196
        Top = 52
        Width = 39
        Height = 16
        Caption = 'Codigo'
      end
      object lb99: TLabel
        Left = 304
        Top = 107
        Width = 4
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel5: TBevel
        Left = 5
        Top = 175
        Width = 765
        Height = 338
      end
      object Panel3: TPanel
        Left = 3
        Top = 5
        Width = 770
        Height = 164
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label108: TLabel
          Left = 224
          Top = 8
          Width = 320
          Height = 19
          Alignment = taCenter
          Caption = 'Distribuci'#243'n de la Depreciaci'#243'n x Centro de Costo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 610
          Top = 8
          Width = 6
          Height = 19
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 22
          Top = 29
          Width = 49
          Height = 15
          Caption = 'Compa'#241#237'a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 192
          Top = 29
          Width = 51
          Height = 15
          Caption = 'Cod.Barra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 528
          Top = 29
          Width = 26
          Height = 15
          Caption = 'Tipo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label109: TLabel
          Left = 24
          Top = 71
          Width = 49
          Height = 15
          Caption = 'Localidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label110: TLabel
          Left = 18
          Top = 112
          Width = 80
          Height = 15
          Caption = 'Centro de Costo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label114: TLabel
          Left = 206
          Top = 71
          Width = 21
          Height = 15
          Caption = 'Piso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label116: TLabel
          Left = 320
          Top = 71
          Width = 25
          Height = 15
          Caption = 'Area'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label117: TLabel
          Left = 488
          Top = 71
          Width = 48
          Height = 15
          Caption = 'Ambiente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label118: TLabel
          Left = 548
          Top = 112
          Width = 52
          Height = 15
          Caption = 'Ubicaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label141: TLabel
          Left = 235
          Top = 112
          Width = 62
          Height = 15
          Caption = 'Responsable'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object edtCia2: TEdit
          Left = 16
          Top = 48
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtCiaD2: TEdit
          Left = 51
          Top = 48
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 1
        end
        object edtAct2: TEdit
          Left = 163
          Top = 48
          Width = 14
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
        object edtActD2: TEdit
          Left = 254
          Top = 48
          Width = 240
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 3
        end
        object edtTip2: TEdit
          Left = 513
          Top = 48
          Width = 57
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edtTipD2: TEdit
          Left = 572
          Top = 48
          Width = 175
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 5
        end
        object edtLoc2: TEdit
          Left = 16
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edtCCos2: TEdit
          Left = 15
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtCCosD2: TEdit
          Left = 87
          Top = 131
          Width = 130
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object edtLocD2: TEdit
          Left = 51
          Top = 90
          Width = 140
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object edtPiso2: TEdit
          Left = 200
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object edtResponsable2: TEdit
          Left = 231
          Top = 131
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object edtArea2: TEdit
          Left = 320
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object edtPisoD2: TEdit
          Left = 238
          Top = 90
          Width = 78
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object edtResponsableD2: TEdit
          Left = 310
          Top = 131
          Width = 226
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object edtAreaD2: TEdit
          Left = 363
          Top = 90
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object edtAmbiente2: TEdit
          Left = 488
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object edtAmbienteD2: TEdit
          Left = 523
          Top = 90
          Width = 230
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object Edit27: TEdit
          Left = 619
          Top = 130
          Width = 87
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          Visible = False
        end
        object Edit28: TEdit
          Left = 547
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = False
        end
        object edtCodigoBarras_1: TEdit
          Left = 179
          Top = 48
          Width = 73
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
        end
      end
      object dbgCCosto: TwwDBGrid
        Left = 255
        Top = 180
        Width = 225
        Height = 277
        DisableThemesInTitle = False
        Selected.Strings = (
          'CCOSID'#9'15'#9'Centro Costo'#9'F'
          'AFDEPREP'#9'14'#9'% de Depreciaci'#243'n'#9'F')
        MemoAttributes = [mSizeable, mWordWrap, mGridShow]
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = 14869218
        Ctl3D = True
        DataSource = DMAF.dsAFCC
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        KeyOptions = [dgEnterToTab]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgFooter3DCells]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        UseTFields = False
        OnKeyDown = dbgCCostoKeyDown
        FooterColor = 7566265
        FooterCellColor = clSilver
      end
      object pnlCCosto: TPanel
        Left = 484
        Top = 286
        Width = 269
        Height = 64
        BevelInner = bvSpace
        BorderStyle = bsSingle
        Color = 7566265
        TabOrder = 1
        object Label115: TLabel
          Left = 22
          Top = 8
          Width = 80
          Height = 15
          Caption = 'Centro de Costo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label99: TLabel
          Left = 117
          Top = 8
          Width = 96
          Height = 15
          Caption = '% de Depreciaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object dblcCCosto: TwwDBLookupCombo
          Left = 8
          Top = 28
          Width = 99
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CCOSID'#9'15'#9'Centro de Costo'#9'F'
            'CCOSABR'#9'15'#9'Descripci'#243'n'#9'F')
          LookupTable = DMAF.cdsCCosto
          LookupField = 'CCOSID'
          Options = [loColLines, loRowLines, loTitles]
          Color = clWhite
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
        end
        object dbePDepr: TwwDBEdit
          Left = 135
          Top = 27
          Width = 65
          Height = 24
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object bbtnOk6: TBitBtn
          Left = 226
          Top = 16
          Width = 31
          Height = 34
          TabOrder = 2
          OnClick = bbtnOk6Click
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
      object bbtnGraba: TBitBtn
        Left = 540
        Top = 451
        Width = 33
        Height = 34
        TabOrder = 3
        OnClick = bbtngrabaClick
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
      object bbtnCancela: TBitBtn
        Left = 583
        Top = 451
        Width = 33
        Height = 33
        TabOrder = 4
        OnClick = bbtnCancelaClick
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
      object dbeSum: TEdit
        Left = 384
        Top = 458
        Width = 81
        Height = 23
        Color = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
    object TabSheet3: TTabSheet
      BorderWidth = 1
      Caption = 'Componentes'
      ImageIndex = 4
      OnShow = TabSheet3Show
      DesignSize = (
        787
        543)
      object Bevel6: TBevel
        Left = 151
        Top = 485
        Width = 364
        Height = -118
        Anchors = [akLeft, akTop, akRight, akBottom]
        Style = bsRaised
      end
      object lblCodigo: TLabel
        Left = 188
        Top = 493
        Width = 56
        Height = 16
        Caption = 'Activo Fijo'
      end
      object dbgCompuesto: TwwDBGrid
        Left = 3
        Top = 181
        Width = 770
        Height = 287
        DisableThemesInTitle = False
        MemoAttributes = [mSizeable, mWordWrap, mGridShow, mViewOnly]
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DMAF.dsActFij3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 2
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnKeyDown = dbgCompuestoKeyDown
        FooterColor = 7566265
        object btnActComp: TwwIButton
          Left = 0
          Top = 0
          Width = 25
          Height = 29
          AllowAllUp = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = btnActCompClick
        end
      end
      object pnlCabComp: TPanel
        Left = 2
        Top = 8
        Width = 770
        Height = 167
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label77: TLabel
          Left = 318
          Top = 8
          Width = 129
          Height = 19
          Alignment = taCenter
          Caption = 'Activos  Compuestos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 610
          Top = 8
          Width = 6
          Height = 19
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 22
          Top = 27
          Width = 49
          Height = 15
          Caption = 'Compa'#241#237'a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 192
          Top = 27
          Width = 51
          Height = 15
          Caption = 'Cod.Barra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 528
          Top = 27
          Width = 26
          Height = 15
          Caption = 'Tipo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label119: TLabel
          Left = 24
          Top = 71
          Width = 49
          Height = 15
          Caption = 'Localidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label120: TLabel
          Left = 18
          Top = 112
          Width = 80
          Height = 15
          Caption = 'Centro de Costo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label121: TLabel
          Left = 205
          Top = 71
          Width = 21
          Height = 15
          Caption = 'Piso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label122: TLabel
          Left = 320
          Top = 71
          Width = 25
          Height = 15
          Caption = 'Area'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label123: TLabel
          Left = 488
          Top = 71
          Width = 48
          Height = 15
          Caption = 'Ambiente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label124: TLabel
          Left = 548
          Top = 112
          Width = 52
          Height = 15
          Caption = 'Ubicaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label140: TLabel
          Left = 235
          Top = 112
          Width = 62
          Height = 15
          Caption = 'Responsable'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object edtCia3: TEdit
          Left = 16
          Top = 46
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtCiaD3: TEdit
          Left = 51
          Top = 46
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 1
        end
        object edtAct3: TEdit
          Left = 163
          Top = 46
          Width = 14
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
        object edtActD3: TEdit
          Left = 254
          Top = 46
          Width = 240
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 3
        end
        object edtTip3: TEdit
          Left = 513
          Top = 46
          Width = 57
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edtTipD3: TEdit
          Left = 572
          Top = 46
          Width = 175
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 5
        end
        object edtLoc3: TEdit
          Left = 16
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edtCCos3: TEdit
          Left = 15
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtCCosD3: TEdit
          Left = 87
          Top = 131
          Width = 130
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object edtLocD3: TEdit
          Left = 51
          Top = 90
          Width = 140
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object edtPiso3: TEdit
          Left = 200
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object edtResponsable3: TEdit
          Left = 231
          Top = 131
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object edtArea3: TEdit
          Left = 320
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object edtPisoD3: TEdit
          Left = 238
          Top = 90
          Width = 78
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object edtResponsableD3: TEdit
          Left = 310
          Top = 130
          Width = 226
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object edtAreaD3: TEdit
          Left = 363
          Top = 90
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object edtAmbiente3: TEdit
          Left = 488
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object edtAmbienteD3: TEdit
          Left = 523
          Top = 90
          Width = 230
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object Edit41: TEdit
          Left = 619
          Top = 130
          Width = 87
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          Visible = False
        end
        object Edit42: TEdit
          Left = 547
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = False
        end
        object edtCodigoBarras_3: TEdit
          Left = 178
          Top = 46
          Width = 73
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
        end
      end
      object dblcdCodigo: TwwDBLookupComboDlg
        Left = 269
        Top = 490
        Width = 89
        Height = 24
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'ACFID'#9'8'#9'ACFID'#9'F'
          'ACFREFOR'#9'2'#9'ACFREFOR'#9'F'
          'CIAID'#9'2'#9'CIAID'#9'F'
          'TACFID'#9'5'#9'TACFID'#9'F'
          'ACFDES'#9'40'#9'ACFDES'#9'F'
          'ACFFLAGACT'#9'1'#9'ACFFLAGACT'#9'F')
        LookupTable = DMAF.cdsActFij2
        LookupField = 'ACFID'
        Color = 14869218
        Enabled = False
        TabOrder = 1
        Visible = False
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnDblClick = dblcdCodigoDblClick
        OnEnter = dblcdCodigoEnter
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Reformas'
      ImageIndex = 5
      OnEnter = TabSheet4Enter
      object pnlCabReforma: TPanel
        Left = 4
        Top = 5
        Width = 770
        Height = 164
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label16: TLabel
          Left = 318
          Top = 8
          Width = 58
          Height = 19
          Alignment = taCenter
          Caption = 'Reformas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 610
          Top = 8
          Width = 14
          Height = 19
          Caption = 'E:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 22
          Top = 27
          Width = 49
          Height = 15
          Caption = 'Compa'#241#237'a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 194
          Top = 27
          Width = 51
          Height = 15
          Caption = 'Cod.Barra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 528
          Top = 27
          Width = 26
          Height = 15
          Caption = 'Tipo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label125: TLabel
          Left = 24
          Top = 71
          Width = 49
          Height = 15
          Caption = 'Localidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label126: TLabel
          Left = 18
          Top = 112
          Width = 80
          Height = 15
          Caption = 'Centro de Costo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label127: TLabel
          Left = 205
          Top = 71
          Width = 21
          Height = 15
          Caption = 'Piso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label128: TLabel
          Left = 320
          Top = 71
          Width = 25
          Height = 15
          Caption = 'Area'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label129: TLabel
          Left = 488
          Top = 71
          Width = 48
          Height = 15
          Caption = 'Ambiente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label130: TLabel
          Left = 549
          Top = 112
          Width = 52
          Height = 15
          Caption = 'Ubicaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label139: TLabel
          Left = 235
          Top = 112
          Width = 62
          Height = 15
          Caption = 'Responsable'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object edtCia4: TEdit
          Left = 16
          Top = 46
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtCiaD4: TEdit
          Left = 51
          Top = 46
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 1
        end
        object edtAct4: TEdit
          Left = 163
          Top = 46
          Width = 14
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
        object edtTip4: TEdit
          Left = 513
          Top = 46
          Width = 57
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edtTipD4: TEdit
          Left = 572
          Top = 46
          Width = 175
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 4
        end
        object edtActD4: TEdit
          Left = 254
          Top = 46
          Width = 240
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 5
        end
        object edtLoc4: TEdit
          Left = 16
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edtCCos4: TEdit
          Left = 15
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtCCosD4: TEdit
          Left = 87
          Top = 130
          Width = 130
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object EdtLocD4: TEdit
          Left = 51
          Top = 90
          Width = 140
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object edtPiso4: TEdit
          Left = 200
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object edtResponsable4: TEdit
          Left = 231
          Top = 131
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object edtArea4: TEdit
          Left = 320
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object edtPisoD4: TEdit
          Left = 238
          Top = 90
          Width = 78
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object edtResponsableD4: TEdit
          Left = 310
          Top = 130
          Width = 226
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object edtAreaD4: TEdit
          Left = 363
          Top = 90
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object edtAmbiente4: TEdit
          Left = 488
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object edtAmbienteD4: TEdit
          Left = 523
          Top = 90
          Width = 230
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object Edit55: TEdit
          Left = 619
          Top = 130
          Width = 87
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          Visible = False
        end
        object Edit56: TEdit
          Left = 547
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = False
        end
        object edtCodigoBarras_4: TEdit
          Left = 179
          Top = 46
          Width = 73
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
        end
      end
      object DBGrid1: TwwDBGrid
        Left = 4
        Top = 199
        Width = 769
        Height = 295
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DMAF.dsWork1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Traslados'
      ImageIndex = 6
      OnEnter = TabSheet5Enter
      object pnlCabTraslado: TPanel
        Left = 3
        Top = 5
        Width = 770
        Height = 164
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label75: TLabel
          Left = 352
          Top = 8
          Width = 60
          Height = 19
          Caption = 'Traslados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 550
          Top = 112
          Width = 52
          Height = 15
          Caption = 'Ubicaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label29: TLabel
          Left = 24
          Top = 71
          Width = 49
          Height = 15
          Caption = 'Localidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 610
          Top = 8
          Width = 14
          Height = 19
          Caption = 'E:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 22
          Top = 27
          Width = 49
          Height = 15
          Caption = 'Compa'#241#237'a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label67: TLabel
          Left = 192
          Top = 27
          Width = 51
          Height = 15
          Caption = 'Cod.Barra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label68: TLabel
          Left = 528
          Top = 43
          Width = 26
          Height = 15
          Caption = 'Tipo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 18
          Top = 112
          Width = 80
          Height = 15
          Caption = 'Centro de Costo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label90: TLabel
          Left = 200
          Top = 71
          Width = 21
          Height = 15
          Caption = 'Piso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label92: TLabel
          Left = 320
          Top = 71
          Width = 25
          Height = 15
          Caption = 'Area'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label93: TLabel
          Left = 488
          Top = 71
          Width = 48
          Height = 15
          Caption = 'Ambiente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label138: TLabel
          Left = 235
          Top = 112
          Width = 62
          Height = 15
          Caption = 'Responsable'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label143: TLabel
          Left = 528
          Top = 27
          Width = 26
          Height = 15
          Caption = 'Tipo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object edtUbi5: TEdit
          Left = 547
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
        end
        object edtUbiD5: TEdit
          Left = 619
          Top = 130
          Width = 87
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
        end
        object edtLoc5: TEdit
          Left = 16
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtLocD5: TEdit
          Left = 51
          Top = 90
          Width = 140
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edtCia5: TEdit
          Left = 16
          Top = 46
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edtCiaD5: TEdit
          Left = 51
          Top = 46
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 5
        end
        object edtAct5: TEdit
          Left = 163
          Top = 46
          Width = 14
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object edtTip5: TEdit
          Left = 513
          Top = 46
          Width = 57
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtTipD5: TEdit
          Left = 572
          Top = 46
          Width = 175
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 8
        end
        object edtActD5: TEdit
          Left = 254
          Top = 46
          Width = 240
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 9
        end
        object edtCCos5: TEdit
          Left = 15
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object edtcCosD5: TEdit
          Left = 87
          Top = 131
          Width = 130
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object Z2bbtnImprimeCab: TBitBtn
          Left = 722
          Top = 120
          Width = 33
          Height = 34
          Hint = 'Activos Fijos Comprados Recientemente'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Visible = False
          OnClick = Z2bbtnImprimeCabClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
            8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
            8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
            8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
        end
        object edtPiso5: TEdit
          Left = 200
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object edtArea5: TEdit
          Left = 320
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object edtAmbiente5: TEdit
          Left = 488
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object edtPisoD5: TEdit
          Left = 238
          Top = 90
          Width = 78
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object edtAreaD5: TEdit
          Left = 363
          Top = 90
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object edtAmbienteD5: TEdit
          Left = 523
          Top = 90
          Width = 230
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
        end
        object edtResponsable5: TEdit
          Left = 231
          Top = 131
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
        end
        object edtResponsableD5: TEdit
          Left = 310
          Top = 130
          Width = 226
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
        end
        object edtCodigoBarras_5: TEdit
          Left = 179
          Top = 46
          Width = 73
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
        end
      end
      object dbgTraslado: TwwDBGrid
        Left = 3
        Top = 184
        Width = 770
        Height = 345
        DisableThemesInTitle = False
        Selected.Strings = (
          'TRADOCMTO'#9'12'#9'Documento de~Traslado'#9'F'
          'TRAFECHA'#9'10'#9'Fecha de~Traslado'#9'F'
          'LOCID'#9'8'#9'Localidad'#9'F'
          'PISO'#9'2'#9'Piso'#9'F'
          'AREA'#9'2'#9'Area'#9'F'
          'AMBCOD'#9'3'#9'Ambiente'#9'F'
          'CCOSID'#9'10'#9'C.Costo'#9'F'
          'TRAMOTIVO'#9'14'#9'Motivo'#9'F'
          'TRAAUTORI'#9'22'#9'Autoriza'#9'F'
          'TRARECIBE'#9'28'#9'Recibe'#9'F'
          'TRANCCOS'#9'10'#9'C.Costo~Anterior'#9'F'
          'TRANLOCAL'#9'10'#9'Localidad~Anterior'#9'F'
          'TRANPISO'#9'2'#9'Piso~Anterior'#9'F'
          'TRANAREA'#9'2'#9'Area~Anterior'#9'F'
          'TRANAMBCOD'#9'3'#9'Ambiente~Anterior'#9'F'
          'TRAFREG'#9'10'#9'Fecha de~Registro'#9'F'
          'TRAHREG'#9'10'#9'Hora de~Registro'#9'F'
          'TRAUSER'#9'10'#9'Usuario'#9'F')
        MemoAttributes = [mSizeable, mWordWrap, mGridShow]
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Ctl3D = True
        DataSource = DMAF.dsTraslado
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        UseTFields = False
        object btnActTraslado: TwwIButton
          Left = 0
          Top = 0
          Width = 25
          Height = 29
          AllowAllUp = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          Visible = False
          OnClick = btnActTrasladoClick
        end
      end
      object pnlActTraslado: TPanel
        Left = 34
        Top = 224
        Width = 735
        Height = 297
        BevelInner = bvRaised
        BevelWidth = 2
        BorderStyle = bsSingle
        Color = 14869218
        Enabled = False
        TabOrder = 1
        Visible = False
        object pnlTra2: TPanel
          Left = 7
          Top = 58
          Width = 714
          Height = 111
          Color = 14869218
          TabOrder = 1
          object Label24: TLabel
            Left = 11
            Top = 70
            Width = 80
            Height = 15
            Caption = 'Centro de Costo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label33: TLabel
            Left = 475
            Top = 80
            Width = 52
            Height = 15
            Caption = 'Ubicaci'#243'n'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label39: TLabel
            Left = 11
            Top = 32
            Width = 49
            Height = 15
            Caption = 'Localidad'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label87: TLabel
            Left = 211
            Top = 32
            Width = 21
            Height = 15
            Caption = 'Piso'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label88: TLabel
            Left = 307
            Top = 32
            Width = 25
            Height = 15
            Caption = 'Area'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label89: TLabel
            Left = 467
            Top = 32
            Width = 48
            Height = 15
            Caption = 'Ambiente'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label98: TLabel
            Left = 11
            Top = -3
            Width = 49
            Height = 15
            Caption = 'Compa'#241'ia'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object dblcdCCostoN: TwwDBLookupComboDlg
            Left = 9
            Top = 85
            Width = 90
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
              'CCOSID'#9'15'#9'Centro de Costo'#9'F'
              'CCOSABR'#9'15'#9'Descripci'#243'n'#9'F')
            LookupTable = DMAF.cdsCCosto
            LookupField = 'CCOSID'
            Color = clWhite
            MaxLength = 15
            ParentFont = False
            TabOrder = 10
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
          object edtCCosDes: TEdit
            Left = 108
            Top = 85
            Width = 140
            Height = 23
            Color = 14869218
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object edtUbicacionDesN: TEdit
            Left = 531
            Top = 80
            Width = 165
            Height = 23
            Color = 14869218
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object dblcLocalidadN: TwwDBLookupCombo
            Left = 10
            Top = 48
            Width = 49
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'LOCID'#9'2'#9'LOCID'#9'F'#9
              'LOCDES'#9'30'#9'LOCDES'#9'F'#9)
            LookupTable = DMAF.cdsLocalidad
            LookupField = 'LOCID'
            Options = [loColLines, loRowLines, loTitles]
            Color = clWhite
            MaxLength = 3
            ParentFont = False
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
          end
          object edtLocalidadDesN: TEdit
            Left = 60
            Top = 48
            Width = 140
            Height = 23
            Color = 14869218
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object dblcUbicacionN: TwwDBLookupComboDlg
            Left = 568
            Top = 80
            Width = 74
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
              'UBICID'#9'8'#9'C'#243'digo'#9'F'
              'UBICDES'#9'70'#9'Ubicaci'#243'n'#9'F')
            LookupField = 'UBICID'
            Color = clWhite
            ParentFont = False
            TabOrder = 13
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dblcPisoN: TwwDBLookupCombo
            Left = 204
            Top = 48
            Width = 42
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PISO'#9'2'#9'PISO'#9#9
              'PISODES'#9'36'#9'PISODES'#9#9)
            LookupTable = DMAF.cdsPiso
            LookupField = 'PISO'
            Options = [loColLines, loRowLines, loTitles]
            Color = clWhite
            MaxLength = 3
            ParentFont = False
            TabOrder = 4
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
          end
          object edtPisoDesN: TEdit
            Left = 249
            Top = 48
            Width = 48
            Height = 23
            Color = 14869218
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = [fsItalic]
            ParentFont = False
            TabOrder = 5
          end
          object dblcAreaN: TwwDBLookupComboDlg
            Left = 304
            Top = 48
            Width = 57
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
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
              'AREA'#9'2'#9'AREA'#9'F'#9
              'AREADES'#9'50'#9'AREADES'#9'F'#9)
            LookupTable = DMAF.cdsArea
            LookupField = 'Area'
            Color = clWhite
            ParentFont = False
            TabOrder = 6
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object edtAreaDesN: TEdit
            Left = 369
            Top = 48
            Width = 88
            Height = 23
            Color = 14869218
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = [fsItalic]
            ParentFont = False
            TabOrder = 7
          end
          object dblcAmbienteN: TwwDBLookupComboDlg
            Left = 464
            Top = 48
            Width = 49
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
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
              'AMBCOD'#9'3'#9'AMBCOD'#9'F'#9
              'AMBDES'#9'50'#9'AMBDES'#9'F'#9)
            LookupTable = DMAF.cdsAmbiente
            LookupField = 'AMBCOD'
            Color = clWhite
            ParentFont = False
            TabOrder = 8
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object edtAmbienteDesN: TEdit
            Left = 521
            Top = 48
            Width = 176
            Height = 23
            Color = 14869218
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = [fsItalic]
            ParentFont = False
            TabOrder = 9
          end
          object dblcCiaN: TwwDBLookupCombo
            Left = 10
            Top = 13
            Width = 42
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CIAID'#9'2'#9'CIAID'#9'F'#9
              'CIADES'#9'40'#9'CIADES'#9'F'#9)
            LookupTable = DMAF.cdsCia
            LookupField = 'CIAID'
            Options = [loColLines, loRowLines, loTitles]
            Color = clWhite
            MaxLength = 2
            ParentFont = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            PreciseEditRegion = False
            AllowClearKey = False
            ShowMatchText = True
          end
          object edtCiaDesN: TEdit
            Left = 53
            Top = 13
            Width = 150
            Height = 23
            Color = 14869218
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = [fsItalic]
            ParentFont = False
            TabOrder = 1
          end
        end
        object bbtnOk4: TBitBtn
          Left = 603
          Top = 258
          Width = 30
          Height = 30
          TabOrder = 5
          OnClick = bbtnOk4Click
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
          Left = 639
          Top = 258
          Width = 30
          Height = 30
          TabOrder = 6
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
        object Z2bbtnImprime: TBitBtn
          Left = 567
          Top = 258
          Width = 30
          Height = 30
          Hint = 'Activos Fijos Comprados Recientemente'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = Z2bbtnImprimeClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
            8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
            8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
            8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
        end
        object Z2bbtnGraba: TBitBtn
          Left = 531
          Top = 258
          Width = 30
          Height = 30
          Hint = 'Activos Fijos Comprados Recientemente'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = Z2bbtnGrabaClick
          Glyph.Data = {
            8A010000424D8A01000000000000760000002800000017000000170000000100
            04000000000014010000CE0E0000D80E00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333303000077777777777770003300000078888888888880000300000
            0780088888888800003000000780088888888800003000000780088888888800
            0030000007888888888888000030000000000000000000000030000000000000
            0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
            FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
            00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
            FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
            FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
            0030300099999999999999000330}
        end
        object pnlTra3: TPanel
          Left = 7
          Top = 176
          Width = 714
          Height = 83
          Color = 14869218
          TabOrder = 2
          object Label13: TLabel
            Left = 11
            Top = 8
            Width = 77
            Height = 15
            Caption = 'Autorizado por'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label73: TLabel
            Left = 12
            Top = 43
            Width = 58
            Height = 15
            Caption = 'Comentario'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 289
            Top = 8
            Width = 65
            Height = 15
            Caption = 'Recibido por'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object dbeAutoriza: TwwDBEdit
            Left = 10
            Top = 24
            Width = 240
            Height = 23
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeMotivoDes: TwwDBEdit
            Left = 10
            Top = 55
            Width = 255
            Height = 23
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeRecibe: TwwDBLookupComboDlg
            Left = 287
            Top = 24
            Width = 80
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
            Color = clWhite
            Enabled = False
            ParentFont = False
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dbeRecibeDes: TwwDBEdit
            Left = 369
            Top = 24
            Width = 239
            Height = 23
            Color = 14869218
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object pnlTra1: TPanel
          Left = 7
          Top = 7
          Width = 714
          Height = 48
          Color = 14869218
          TabOrder = 0
          object Label65: TLabel
            Left = 15
            Top = 2
            Width = 56
            Height = 15
            Caption = 'Documento'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label28: TLabel
            Left = 169
            Top = 2
            Width = 30
            Height = 15
            Caption = 'Fecha'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 283
            Top = 2
            Width = 98
            Height = 15
            Caption = 'Motivo de Traslado'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label71: TLabel
            Left = 590
            Top = 2
            Width = 41
            Height = 15
            Caption = 'Externo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object dbedocmtoT: TwwDBEdit
            Left = 10
            Top = 19
            Width = 100
            Height = 23
            Color = clWhite
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbdtpTraslado: TwwDBDateTimePicker
            Left = 147
            Top = 19
            Width = 100
            Height = 23
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clWhite
            Epoch = 1950
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 1
          end
          object dbeMotivo: TwwDBLookupComboDlg
            Left = 280
            Top = 19
            Width = 53
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
            GridColor = clWhite
            GridTitleAlignment = taLeftJustify
            Caption = 'BV'
            MaxWidth = 0
            MaxHeight = 209
            Selected.Strings = (
              'MOTID'#9'2'#9'Id'#9'F'
              'MOTDES'#9'30'#9'Motivo'#9'F'
              'FREPARACION'#9'1'#9'Prov'#9'F')
            LookupTable = DMAF.cdsMotivo
            LookupField = 'MOTID'
            Color = clWhite
            ParentFont = False
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnChange = dbeMotivoChange
          end
          object edtMot: TEdit
            Left = 334
            Top = 19
            Width = 206
            Height = 23
            Color = 14869218
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object dbcbExt: TDBCheckBox
            Left = 603
            Top = 23
            Width = 33
            Height = 17
            Caption = '  '
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Desactivaci'#243'n'
      ImageIndex = 6
      object Panel1: TPanel
        Left = 3
        Top = 5
        Width = 770
        Height = 164
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label17: TLabel
          Left = 304
          Top = 8
          Width = 84
          Height = 19
          Caption = 'Desactivacion'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label59: TLabel
          Left = 550
          Top = 112
          Width = 52
          Height = 15
          Caption = 'Ubicaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label60: TLabel
          Left = 24
          Top = 71
          Width = 49
          Height = 15
          Caption = 'Localidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label66: TLabel
          Left = 610
          Top = 8
          Width = 14
          Height = 19
          Caption = 'E:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label76: TLabel
          Left = 22
          Top = 27
          Width = 49
          Height = 15
          Caption = 'Compa'#241#237'a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label91: TLabel
          Left = 192
          Top = 27
          Width = 51
          Height = 15
          Caption = 'Cod.Barra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label94: TLabel
          Left = 528
          Top = 43
          Width = 26
          Height = 15
          Caption = 'Tipo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label95: TLabel
          Left = 18
          Top = 112
          Width = 80
          Height = 15
          Caption = 'Centro de Costo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label96: TLabel
          Left = 200
          Top = 71
          Width = 21
          Height = 15
          Caption = 'Piso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label131: TLabel
          Left = 320
          Top = 71
          Width = 25
          Height = 15
          Caption = 'Area'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label132: TLabel
          Left = 488
          Top = 71
          Width = 48
          Height = 15
          Caption = 'Ambiente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label133: TLabel
          Left = 235
          Top = 112
          Width = 62
          Height = 15
          Caption = 'Responsable'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label134: TLabel
          Left = 528
          Top = 27
          Width = 26
          Height = 15
          Caption = 'Tipo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Edit1: TEdit
          Left = 547
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
        end
        object Edit2: TEdit
          Left = 619
          Top = 130
          Width = 87
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
        end
        object edtLoc6: TEdit
          Left = 16
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtLocD6: TEdit
          Left = 51
          Top = 90
          Width = 140
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edtCia6: TEdit
          Left = 16
          Top = 46
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edtCiaD6: TEdit
          Left = 51
          Top = 46
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 5
        end
        object edtAct6: TEdit
          Left = 163
          Top = 46
          Width = 14
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object edtTip6: TEdit
          Left = 513
          Top = 46
          Width = 57
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtTipD6: TEdit
          Left = 572
          Top = 46
          Width = 175
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 8
        end
        object edtActD6: TEdit
          Left = 254
          Top = 46
          Width = 240
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 9
        end
        object edtCCos6: TEdit
          Left = 15
          Top = 130
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object edtCCosD6: TEdit
          Left = 87
          Top = 131
          Width = 130
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object edtPiso6: TEdit
          Left = 200
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object edtArea6: TEdit
          Left = 320
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object edtAmbiente6: TEdit
          Left = 488
          Top = 90
          Width = 33
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object edtPisoD6: TEdit
          Left = 238
          Top = 90
          Width = 78
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object edtAreaD6: TEdit
          Left = 363
          Top = 90
          Width = 110
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object edtAmbienteD6: TEdit
          Left = 523
          Top = 90
          Width = 230
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object edtResponsable6: TEdit
          Left = 231
          Top = 131
          Width = 70
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
        end
        object edtResponsableD6: TEdit
          Left = 310
          Top = 130
          Width = 226
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
        end
        object edtCodigoBarras_6: TEdit
          Left = 179
          Top = 46
          Width = 73
          Height = 23
          Color = 14869218
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
        end
      end
      object Panel4: TPanel
        Left = 104
        Top = 208
        Width = 577
        Height = 249
        BevelInner = bvRaised
        BevelWidth = 2
        BorderStyle = bsSingle
        Color = 7566265
        TabOrder = 1
        object Label135: TLabel
          Left = 76
          Top = 27
          Width = 44
          Height = 16
          Caption = 'F e c h a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label136: TLabel
          Left = 75
          Top = 73
          Width = 51
          Height = 16
          Caption = 'M o t i v o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label137: TLabel
          Left = 72
          Top = 110
          Width = 69
          Height = 16
          Caption = 'Observaci'#243'n '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label146: TLabel
          Left = 72
          Top = 151
          Width = 57
          Height = 16
          Caption = 'Autorizado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbdtpFecInac: TwwDBDateTimePicker
          Left = 179
          Top = 24
          Width = 94
          Height = 24
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          DataField = 'ACFFECINAC'
          DataSource = DMAF.dsActFij
          Epoch = 1950
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          MinDate = 18264.000000000000000000
          ParentFont = False
          ShowButton = True
          TabOrder = 0
          OnExit = dbdtpFecInacExit
        end
        object dblcMotivo: TwwDBLookupCombo
          Left = 179
          Top = 67
          Width = 61
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESACID'#9'3'#9'Codigo'#9'F'
            'DESACABR'#9'15'#9'Motivo'#9'F')
          DataField = 'DESACID'
          DataSource = DMAF.dsActFij
          LookupTable = DMAF.cdsQry9
          LookupField = 'DESACID'
          Options = [loTitles]
          MaxLength = 3
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcMotivoExit
        end
        object edtMotivo: TEdit
          Left = 242
          Top = 66
          Width = 180
          Height = 24
          Enabled = False
          TabOrder = 3
        end
        object dbeDesacmo: TwwDBEdit
          Left = 179
          Top = 107
          Width = 358
          Height = 21
          DataField = 'ACFDESACMO'
          DataSource = DMAF.dsActFij
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object bbtnOk3: TBitBtn
          Left = 427
          Top = 192
          Width = 33
          Height = 34
          TabOrder = 4
          OnClick = bbtnOk3Click
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
        object bbtnCancela3: TBitBtn
          Left = 475
          Top = 193
          Width = 33
          Height = 33
          TabOrder = 5
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
        object dbeDesAutori: TwwDBLookupComboDlg
          Left = 176
          Top = 144
          Width = 65
          Height = 24
          GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
          GridColor = clWhite
          GridTitleAlignment = taLeftJustify
          Caption = 'Lookup'
          MaxWidth = 0
          MaxHeight = 209
          TabOrder = 6
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnExit = dbeDesAutoriExit
        end
        object dbeDesAutori_des: TwwDBEdit
          Left = 248
          Top = 144
          Width = 289
          Height = 24
          DataField = 'DESAUTORI'
          DataSource = DMAF.dsActFij
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
  end
  object pprTraslados: TppReport
    OnPrintingComplete = pprTrasladosPrintingComplete
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5000
    PrinterSetup.mmMarginLeft = 1350
    PrinterSetup.mmMarginRight = 1350
    PrinterSetup.mmMarginTop = 5000
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 228600
    PrinterSetup.PaperSize = 256
    Template.FileName = 'C:\SOLExes\SOLFormatos\ACFTransladoActivo_A4.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 204
    Top = 500
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 233098
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Transferencia de Activo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 10cpi'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6350
        mmLeft = 87842
        mmTop = 20373
        mmWidth = 56356
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Movimiento N'#176
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 155311
        mmTop = 26723
        mmWidth = 21696
        BandType = 0
      end
      object pplMovimiento: TppLabel
        UserName = 'lMovimiento'
        Caption = 'lMovimiento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 187855
        mmTop = 26723
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 155311
        mmTop = 33073
        mmWidth = 8467
        BandType = 0
      end
      object pplFecha: TppLabel
        UserName = 'lMovimiento1'
        Caption = 'lMovimiento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 187855
        mmTop = 33073
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Traslado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 155311
        mmTop = 40746
        mmWidth = 12435
        BandType = 0
      end
      object ppchkInterno: TmyCheckBox
        UserName = 'ppchkInterno'
        Transparent = True
        mmHeight = 6350
        mmLeft = 186796
        mmTop = 39423
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'Interno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 195263
        mmTop = 40746
        mmWidth = 10319
        BandType = 0
      end
      object ppChkExterno: TmyCheckBox
        UserName = 'ppChkExterno'
        Transparent = True
        mmHeight = 6350
        mmLeft = 186267
        mmTop = 45773
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Externo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 194734
        mmTop = 47096
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'C'#243'digo de Activo '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19315
        mmTop = 52652
        mmWidth = 25929
        BandType = 0
      end
      object pplCodigo: TppLabel
        UserName = 'lCodigo'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 52652
        mmWidth = 145521
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'C'#243'digo de Barras'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19315
        mmTop = 60325
        mmWidth = 24342
        BandType = 0
      end
      object pplCodigoBarras: TppLabel
        UserName = 'lCodigoBarras'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 59796
        mmTop = 60325
        mmWidth = 53446
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label101'
        Caption = 'Marca:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19315
        mmTop = 67733
        mmWidth = 9790
        BandType = 0
      end
      object pplMarca: TppLabel
        UserName = 'lCodigoBarras1'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 67733
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Modelo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 81492
        mmTop = 67733
        mmWidth = 11906
        BandType = 0
      end
      object pplModelo: TppLabel
        UserName = 'lModelo'
        AutoSize = False
        Caption = 'lModelo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 101071
        mmTop = 67733
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Serie:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 147373
        mmTop = 67733
        mmWidth = 7673
        BandType = 0
      end
      object pplSerie: TppLabel
        UserName = 'lSerie'
        AutoSize = False
        Caption = 'lSerie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 162190
        mmTop = 67733
        mmWidth = 41804
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label24'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-----------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10848
        mmTop = 75142
        mmWidth = 197909
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Datos  de Origen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 28046
        mmTop = 80963
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Datos de Destino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 107686
        mmTop = 80698
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-----------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10848
        mmTop = 84138
        mmWidth = 197909
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Centro de Costo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 15081
        mmTop = 89694
        mmWidth = 23019
        BandType = 0
      end
      object pplCCostoOrigen: TppLabel
        UserName = 'lCCostoOrigen'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 52388
        mmTop = 89694
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Centro de Costo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 109273
        mmTop = 89694
        mmWidth = 23019
        BandType = 0
      end
      object pplCCostoDestino: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 146050
        mmTop = 89694
        mmWidth = 38894
        BandType = 0
      end
      object pplCCostoDesAnt: TppLabel
        UserName = 'lCCostoOrigen1'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 14817
        mmTop = 96838
        mmWidth = 88636
        BandType = 0
      end
      object pplCCostoDes: TppLabel
        UserName = 'lCCostoDes'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 109273
        mmTop = 96838
        mmWidth = 97367
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-----------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 101336
        mmWidth = 197909
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Ubicaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 19844
        mmTop = 104775
        mmWidth = 14023
        BandType = 0
      end
      object pplUbicacionOrigen: TppLabel
        UserName = 'lUbicacionOrigen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 52388
        mmTop = 104775
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Ubicaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 114036
        mmTop = 104775
        mmWidth = 14023
        BandType = 0
      end
      object pplUbicacionDestino: TppLabel
        UserName = 'lUbicacionDestino'
        Caption = 'lUbicacionDestino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 146050
        mmTop = 104775
        mmWidth = 26194
        BandType = 0
      end
      object pplUbicaDesAnt: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 14552
        mmTop = 112448
        mmWidth = 89165
        BandType = 0
      end
      object pplUbicaDes: TppLabel
        UserName = 'lUbicaDes'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 109273
        mmTop = 112448
        mmWidth = 98161
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-----------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 12171
        mmTop = 115359
        mmWidth = 197909
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Responsable'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 119592
        mmWidth = 17992
        BandType = 0
      end
      object pplEmpleadoOrigen: TppLabel
        UserName = 'lEmpleadoOrigen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 52388
        mmTop = 119592
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Responsable'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 112184
        mmTop = 119856
        mmWidth = 17992
        BandType = 0
      end
      object pplEmpleadoDestino: TppLabel
        UserName = 'lEmpleadoDestino'
        Caption = 'lEmpleadoDestino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 146050
        mmTop = 119856
        mmWidth = 25665
        BandType = 0
      end
      object pplEmpOri: TppLabel
        UserName = 'lEmpOri'
        AutoSize = False
        Caption = 'lEmpleadoDestino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 14552
        mmTop = 127265
        mmWidth = 88900
        BandType = 0
      end
      object pplEmpDes: TppLabel
        UserName = 'lEmpleadoDestino1'
        AutoSize = False
        Caption = 'lEmpleadoDestino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 109273
        mmTop = 127265
        mmWidth = 97367
        BandType = 0
      end
      object pplCargoOri: TppLabel
        UserName = 'lEmpOri1'
        AutoSize = False
        Caption = 'lEmpleadoDestino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 14817
        mmTop = 133086
        mmWidth = 88636
        BandType = 0
      end
      object pplCargoDes: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'lEmpleadoDestino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 109538
        mmTop = 133086
        mmWidth = 97367
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label25'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-----------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 138642
        mmWidth = 197909
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Motivo :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 15610
        mmTop = 148961
        mmWidth = 12171
        BandType = 0
      end
      object pplMotivo: TppLabel
        UserName = 'lMotivo'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 12965
        mmLeft = 33338
        mmTop = 148961
        mmWidth = 172509
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label23'
        Caption = 'Comentario :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 13494
        mmTop = 165365
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'lblMottras1'
        AutoSize = False
        Caption = 
          '________________________________________________________________' +
          '________________________________________________________________' +
          '________________________________________________________________' +
          '_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 34660
        mmTop = 165365
        mmWidth = 169069
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 
          '________________________________________________________________' +
          '________________________________________________________________' +
          '________________________________________________________________' +
          '_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 13494
        mmTop = 175155
        mmWidth = 190236
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = 
          '________________________________________________________________' +
          '________________________________________________________________' +
          '________________________________________________________________' +
          '_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 13494
        mmTop = 184944
        mmWidth = 190236
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 
          '________________________________________________________________' +
          '________________________________________________________________' +
          '________________________________________________________________' +
          '_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 13494
        mmTop = 195263
        mmWidth = 190236
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Informaci'#243'n  a ser ingresada por el  Area de Administraci'#243'n.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 48948
        mmTop = 202936
        mmWidth = 87048
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'lblMottras2'
        AutoSize = False
        Caption = '---------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 222515
        mmWidth = 60325
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = '---------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 79375
        mmTop = 222515
        mmWidth = 60325
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = '---------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 145786
        mmTop = 222515
        mmWidth = 60325
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Solicitado por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 25929
        mmTop = 228071
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Aprobado por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 94721
        mmTop = 228071
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Recibido Conforme por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 151607
        mmTop = 228071
        mmWidth = 34131
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
end
