inherited FReclasifica: TFReclasifica
  Left = 145
  Top = 119
  Height = 564
  Caption = 'Reclasificaci'#243'n Contable'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCab: TPanel
    inherited Label2: TLabel
      Left = 338
      Visible = False
    end
    object Label1: TLabel [2]
      Left = 550
      Top = 7
      Width = 81
      Height = 16
      Caption = 'Cuenta Actual'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 443
      Top = 7
      Width = 34
      Height = 16
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel [4]
      Left = 338
      Top = 7
      Width = 44
      Height = 16
      Caption = 'N'#250'mero'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited dblcdPeriodo: TwwDBLookupComboDlg
      Left = 339
      Top = 23
      Height = 23
      Visible = False
    end
    inherited bbtnOk: TBitBtn
      Left = 703
      Height = 33
    end
    inherited dblcCia: TwwDBLookupCombo
      DataField = 'CIAID'
    end
    object dblcdCtaAct: TwwDBLookupComboDlg
      Left = 534
      Top = 24
      Width = 121
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DMAF.cdsCta
      LookupField = 'CUENTAID'
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dtpFecha: TwwDBDateTimePicker
      Left = 426
      Top = 24
      Width = 105
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'FECHA'
      DataSource = DMAF.dsReva
      Epoch = 1950
      ShowButton = True
      TabOrder = 5
    end
    object dbeNumero: TwwDBEdit
      Left = 340
      Top = 24
      Width = 80
      Height = 21
      DataField = 'NUMERO'
      DataSource = DMAF.dsReva
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Panel2: TPanel
    Top = 372
    Height = 158
    inherited lblCNT: TLabel
      Top = 122
    end
    object Label3: TLabel [1]
      Left = 319
      Top = 15
      Width = 80
      Height = 16
      Caption = 'Cuenta Nueva'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel [2]
      Left = 20
      Top = 15
      Width = 151
      Height = 16
      Caption = 'Ultimo Periodo Depreciado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited Z2bbtnContab: TBitBtn
      Top = 118
    end
    inherited bbtnBorra: TBitBtn
      Top = 118
    end
    inherited pnlDatos: TPanel
      Top = 49
      inherited Label56: TLabel
        Visible = False
      end
      inherited dbeCambio: TwwDBEdit
        Visible = False
      end
    end
    inherited Z2bbtnPreview: TBitBtn
      Left = 539
      Top = 118
      Width = 32
    end
    object dblcdCtaNew: TwwDBLookupComboDlg
      Left = 406
      Top = 12
      Width = 121
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DMAF.cdsCta
      LookupField = 'CUENTAID'
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object BitBtn1: TBitBtn
      Left = 534
      Top = 10
      Width = 90
      Height = 25
      Caption = 'Cambiar Cuenta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object Z2bbtnGraba: TBitBtn
      Left = 579
      Top = 118
      Width = 32
      Height = 35
      Hint = 'Activos Fijos Comprados Recientemente'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
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
    object dbePeriodo: TwwDBEdit
      Left = 180
      Top = 14
      Width = 81
      Height = 21
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object BitBtn2: TBitBtn
      Left = 643
      Top = 10
      Width = 90
      Height = 25
      Caption = 'Borra Cuenta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = BitBtn2Click
    end
    object Z2bbtnCambia: TBitBtn
      Left = 618
      Top = 118
      Width = 32
      Height = 35
      Hint = 'Cambiar Cuenta Contable'
      TabOrder = 9
      OnClick = Z2bbtnCambiaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333FFFFFFFFF333333300000000
        0333333777777777F33333330888888803333337FFFFFFF7F333333307777777
        0333333777777777F33333330FFFFFFF03333337F3F3FFF7F33333330F9F000F
        03333337F7377737F33333330FFFFFFF03333337F3333337F33333330FFFFFFF
        03333337F3FFFFF7F33333330F40004F03333337F77777F7F33333330F00000F
        03333337F7F337F7F33333330F00000F03333337F7FFF7F7F33333330F40004F
        03333337F7777737F33333330FFFFFFF03333337FFFFFFF7F333333300000000
        0333333777777777333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  inherited dbgConta: TwwDBGrid
    Height = 315
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect, dgShowFooter]
  end
end
