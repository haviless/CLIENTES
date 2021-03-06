object FManteReval: TFManteReval
  Left = 219
  Top = 264
  Width = 496
  Height = 257
  Caption = 'Mantenimiento de Revaluaci'#243'n'
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
  object pnlCab1: TPanel
    Left = 12
    Top = 5
    Width = 461
    Height = 57
    Color = 10207162
    TabOrder = 0
    object Label1: TLabel
      Left = 29
      Top = 8
      Width = 49
      Height = 16
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 245
      Top = 8
      Width = 106
      Height = 16
      Caption = 'N'#250'mero Revaluaci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblcCia: TwwDBLookupCombo
      Left = 25
      Top = 24
      Width = 57
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Id.'#9'F'
        'CIADES'#9'30'#9'Compa'#241#237'a'#9'F')
      DataField = 'CIAID'
      DataSource = DMAF.dsReva
      LookupTable = DMAF.cdsCia
      LookupField = 'CIAID'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object dbeNumero: TwwDBEdit
      Left = 246
      Top = 24
      Width = 97
      Height = 21
      DataField = 'REVALNUM'
      DataSource = DMAF.dsReva
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeNumeroExit
    end
    object dbeCiaDes: TwwDBEdit
      Left = 83
      Top = 24
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object pnlCab3: TPanel
    Left = 12
    Top = 67
    Width = 461
    Height = 118
    Color = 10207162
    TabOrder = 1
    object Label6: TLabel
      Left = 169
      Top = 4
      Width = 63
      Height = 16
      Caption = 'Responsable'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 37
      Top = 51
      Width = 75
      Height = 16
      Caption = 'Observaciones'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 49
      Top = 4
      Width = 31
      Height = 16
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeRespo: TwwDBEdit
      Left = 156
      Top = 22
      Width = 121
      Height = 21
      DataField = 'REVALRESP'
      DataSource = DMAF.dsReva
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbmObser: TDBMemo
      Left = 23
      Top = 68
      Width = 418
      Height = 39
      DataField = 'REVALOBSE'
      DataSource = DMAF.dsReva
      TabOrder = 1
    end
    object dtpFecha: TwwDBDateTimePicker
      Left = 25
      Top = 22
      Width = 100
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'REVALFEC'
      DataSource = DMAF.dsReva
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
    end
  end
  object Z2bbtnGraba: TBitBtn
    Left = 362
    Top = 194
    Width = 30
    Height = 30
    Hint = 'Grabar Registro'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
  object bbtnClose: TBitBtn
    Left = 402
    Top = 194
    Width = 30
    Height = 30
    Hint = 'Cancela Actualizaciones del Detalle'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = bbtnCloseClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      04000000000068010000CE0E0000D80E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033911833333333333333333F333333333333
      0000339111833333911333333388F333333F3333000033911118333911118333
      38F38F333F88F33300003339111183911111833338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003339
      1118333911183333338F33838F338F33000033911183333391118333338FF833
      38F338F300003391183333333911133333388333338FFF830000333913333333
      3391833333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
end
