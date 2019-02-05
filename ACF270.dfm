object FRevaluacion: TFRevaluacion
  Left = 24
  Top = 149
  Width = 752
  Height = 402
  Caption = 'Actualiza Revalucaci'#243'n'
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 3
    Top = 2
    Width = 734
    Height = 111
    Color = 10207162
    TabOrder = 0
    object Bevel1: TBevel
      Left = 9
      Top = 7
      Width = 712
      Height = 96
    end
    object Label8: TLabel
      Left = 24
      Top = 53
      Width = 86
      Height = 16
      Caption = 'Tipo Activo Fijo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 318
      Top = 53
      Width = 34
      Height = 16
      Caption = 'C'#243'digo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 440
      Top = 53
      Width = 58
      Height = 16
      Caption = 'Activo Fijo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label34: TLabel
      Left = 24
      Top = 11
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
    object Label2: TLabel
      Left = 300
      Top = 10
      Width = 90
      Height = 16
      Caption = 'C'#243'digo de Barras'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeActivoDes: TwwDBEdit
      Left = 407
      Top = 71
      Width = 302
      Height = 23
      Color = 14873331
      DataField = 'ACFDES'
      DataSource = DMAF.dsInvD
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
    object dbeTACFDes: TwwDBEdit
      Left = 110
      Top = 71
      Width = 162
      Height = 23
      Color = 14873331
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcCia: TwwDBLookupCombo
      Left = 21
      Top = 27
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
      LookupTable = DMAF.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCiaDes: TEdit
      Left = 64
      Top = 27
      Width = 150
      Height = 23
      Color = 14873331
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 3
    end
    object dblcdTActivo: TwwDBLookupComboDlg
      Left = 21
      Top = 71
      Width = 88
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdTActivoExit
    end
    object dblcdActivo: TwwDBLookupComboDlg
      Left = 285
      Top = 71
      Width = 121
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbeBarras: TwwDBEdit
      Left = 286
      Top = 28
      Width = 124
      Height = 21
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnBusca: TBitBtn
      Left = 640
      Top = 27
      Width = 65
      Height = 25
      Caption = 'Buscar'
      TabOrder = 7
      OnClick = bbtnBuscaClick
    end
  end
  object Panel2: TPanel
    Left = 3
    Top = 222
    Width = 734
    Height = 147
    Color = 10207162
    TabOrder = 1
    object gbDatos: TGroupBox
      Left = 7
      Top = 8
      Width = 712
      Height = 129
      Caption = 'Datos Actual'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 442
        Top = 23
        Width = 90
        Height = 16
        Caption = 'Valor Neto (S/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 442
        Top = 71
        Width = 96
        Height = 16
        Caption = 'Nuevo Valor (S/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 94
        Top = 23
        Width = 111
        Height = 16
        Caption = 'Valor Historico (S/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 246
        Top = 23
        Width = 160
        Height = 16
        Caption = 'Depreciaci'#243'n Acumulada (S/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeVNeto: TwwDBEdit
        Left = 429
        Top = 40
        Width = 120
        Height = 23
        Color = 14873331
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
      object Z2bbtnOk: TBitBtn
        Left = 633
        Top = 96
        Width = 65
        Height = 25
        Caption = 'Confirma'
        TabOrder = 1
        OnClick = Z2bbtnOkClick
      end
      object dbeImporte: TwwDBEdit
        Left = 429
        Top = 88
        Width = 120
        Height = 23
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
      object dbeValHis: TwwDBEdit
        Left = 88
        Top = 40
        Width = 120
        Height = 23
        Color = 14873331
        Enabled = False
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
      object dbeDepAcu: TwwDBEdit
        Left = 257
        Top = 40
        Width = 120
        Height = 23
        Color = 14873331
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
    end
  end
  object Panel4: TPanel
    Left = 3
    Top = 117
    Width = 734
    Height = 101
    Color = 10207162
    Enabled = False
    TabOrder = 2
    object Label9: TLabel
      Left = 29
      Top = 2
      Width = 34
      Height = 16
      Caption = 'Marca'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 233
      Top = 2
      Width = 38
      Height = 16
      Caption = 'Modelo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 436
      Top = 2
      Width = 28
      Height = 16
      Caption = 'Serie'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label55: TLabel
      Left = 20
      Top = 47
      Width = 66
      Height = 16
      Caption = 'M o n e d a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label62: TLabel
      Left = 215
      Top = 47
      Width = 89
      Height = 16
      Caption = 'Importe Original'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label63: TLabel
      Left = 360
      Top = 47
      Width = 78
      Height = 16
      Caption = 'Importe M.N.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label64: TLabel
      Left = 509
      Top = 47
      Width = 76
      Height = 16
      Caption = 'Importe M.E.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label40: TLabel
      Left = 617
      Top = 2
      Width = 70
      Height = 16
      Caption = 'F.Adquisici'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeMarca: TwwDBEdit
      Left = 18
      Top = 18
      Width = 180
      Height = 23
      Color = 14873331
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
    object dbeModelo: TwwDBEdit
      Left = 221
      Top = 18
      Width = 180
      Height = 23
      Color = 14873331
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeSerie: TwwDBEdit
      Left = 424
      Top = 18
      Width = 160
      Height = 23
      Color = 14873331
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
    object dblcMoneda: TwwDBLookupCombo
      Left = 18
      Top = 64
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'Tipo'#9'F'
        'TMONABR'#9'8'#9'Descripci'#243'n'#9'F')
      LookupTable = DMAF.cdsMoneda
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines, loTitles]
      Color = 14873331
      MaxLength = 2
      ParentFont = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      OnExit = dblcMonedaExit
    end
    object edtMonedaDes: TEdit
      Left = 61
      Top = 64
      Width = 120
      Height = 23
      Color = 14413808
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 4
    end
    object dbeValOMO: TwwDBEdit
      Left = 200
      Top = 64
      Width = 120
      Height = 23
      Color = 14873331
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeValOMN: TwwDBEdit
      Left = 341
      Top = 64
      Width = 120
      Height = 23
      Color = 14873331
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
    end
    object dbeValOME: TwwDBEdit
      Left = 481
      Top = 64
      Width = 120
      Height = 23
      Color = 14873331
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
    end
    object dtpFecAdq: TwwDBDateTimePicker
      Left = 607
      Top = 18
      Width = 104
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = 14873331
      Date = 36526.000000000000000000
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 8
    end
  end
end
