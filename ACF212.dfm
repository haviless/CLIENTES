object FGuiaR: TFGuiaR
  Left = 209
  Top = 109
  Width = 772
  Height = 594
  Caption = 'GUIA DE REMISION'
  Color = 14869218
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBarra: TPanel
    Left = 8
    Top = 1
    Width = 745
    Height = 37
    Color = 14869218
    TabOrder = 0
    object Z2bbtnInsert: TBitBtn
      Left = 24
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 0
      OnClick = Z2bbtnInsertClick
    end
    object Z2bbtnEdita: TBitBtn
      Left = 128
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Modificar'
      TabOrder = 1
      OnClick = Z2bbtnEditaClick
    end
    object dblcdBGuia: TwwDBLookupComboDlg
      Left = 224
      Top = 8
      Width = 121
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DMAF.cdsTrasSel
      Color = clWhite
      Enabled = False
      TabOrder = 2
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdBGuiaExit
    end
  end
  object pnlBotones: TPanel
    Left = 8
    Top = 524
    Width = 745
    Height = 41
    Color = 14869218
    Enabled = False
    TabOrder = 1
    object Z2bbtnGraba: TBitBtn
      Left = 560
      Top = 4
      Width = 33
      Height = 34
      Hint = 'Activos Fijos Comprados Recientemente'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
    object Z2bbtnImprime: TBitBtn
      Left = 636
      Top = 4
      Width = 33
      Height = 34
      Hint = 'Activos Fijos Comprados Recientemente'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object Z2bbtnAcepta: TBitBtn
      Left = 598
      Top = 4
      Width = 33
      Height = 34
      TabOrder = 2
      OnClick = Z2bbtnAceptaClick
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
    object Z2bbtnCancela: TBitBtn
      Left = 674
      Top = 4
      Width = 33
      Height = 34
      TabOrder = 3
      OnClick = Z2bbtnCancelaClick
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
    object pnlEstado: TPanel
      Left = 316
      Top = 4
      Width = 207
      Height = 32
      Color = 14869218
      TabOrder = 4
      object lblGraba: TLabel
        Left = 102
        Top = 7
        Width = 46
        Height = 19
        Caption = 'Graba'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblAcepta: TLabel
        Left = 75
        Top = 7
        Width = 90
        Height = 19
        Caption = 'ACEPTADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label8: TLabel
        Left = 12
        Top = 7
        Width = 48
        Height = 19
        Caption = 'Estado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object pnlCab: TPanel
    Left = 8
    Top = 41
    Width = 745
    Height = 105
    Color = 14869218
    Enabled = False
    TabOrder = 2
    object Bevel1: TBevel
      Left = 10
      Top = 7
      Width = 276
      Height = 47
    end
    object Label1: TLabel
      Left = 24
      Top = 10
      Width = 83
      Height = 13
      Caption = 'Guia de Remisi'#243'n'
    end
    object Label2: TLabel
      Left = 184
      Top = 10
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label9: TLabel
      Left = 40
      Top = 60
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Bevel2: TBevel
      Left = 293
      Top = 7
      Width = 444
      Height = 46
    end
    object Label5: TLabel
      Left = 312
      Top = 10
      Width = 61
      Height = 13
      Caption = 'Transportista'
    end
    object Label4: TLabel
      Left = 532
      Top = 10
      Width = 32
      Height = 13
      Caption = 'R.U.C.'
    end
    object Label3: TLabel
      Left = 647
      Top = 10
      Width = 73
      Height = 13
      Caption = 'Placa Veh'#237'culo'
    end
    object dbeNumGuia: TwwDBEdit
      Left = 18
      Top = 24
      Width = 121
      Height = 21
      Color = clWhite
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dtpFecha: TwwDBDateTimePicker
      Left = 152
      Top = 24
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = clWhite
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
    end
    object dbeRuc: TwwDBEdit
      Left = 514
      Top = 24
      Width = 121
      Height = 21
      Color = clWhite
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTransp: TwwDBEdit
      Left = 301
      Top = 24
      Width = 207
      Height = 21
      Color = clWhite
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbePlaca: TwwDBEdit
      Left = 641
      Top = 24
      Width = 87
      Height = 21
      Color = clWhite
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeObser: TwwDBEdit
      Left = 18
      Top = 75
      Width = 713
      Height = 21
      Color = clWhite
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object pnlDetalle: TPanel
    Left = 8
    Top = 149
    Width = 745
    Height = 371
    Color = 14869218
    Enabled = False
    TabOrder = 3
    object Panel1: TPanel
      Left = 9
      Top = 10
      Width = 730
      Height = 164
      BorderWidth = 1
      BorderStyle = bsSingle
      TabOrder = 0
      object Label6: TLabel
        Left = 2
        Top = 2
        Width = 722
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'Activo Fijo por Trasladar'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object dbgPend: TwwDBGrid
        Left = 2
        Top = 19
        Width = 722
        Height = 139
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DMAF.dsTrasPen
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnDragOver = dbgPendDragOver
        OnEndDrag = dbgPendEndDrag
        OnMouseDown = dbgPendMouseDown
        FooterColor = 7566265
      end
    end
    object Panel2: TPanel
      Left = 8
      Top = 182
      Width = 730
      Height = 179
      BorderWidth = 1
      BorderStyle = bsSingle
      Caption = 'Panel2'
      TabOrder = 1
      object Label7: TLabel
        Left = 2
        Top = 2
        Width = 722
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'Detalle de Gu'#237'a de Remisi'#243'n'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object dbgSele: TwwDBGrid
        Left = 2
        Top = 19
        Width = 722
        Height = 154
        DisableThemesInTitle = False
        Selected.Strings = (
          'CIAID'#9'4'#9'CIAID'
          'TACFID'#9'10'#9'TACFID'
          'ACFID'#9'8'#9'ACFID'
          'TRAFECHA'#9'10'#9'TRAFECHA'
          'TRANLOCAL'#9'10'#9'TRANLOCAL'
          'TRANUBICA'#9'10'#9'TRANUBICA'
          'TRARECIBE'#9'50'#9'TRARECIBE'
          'TRAHREG'#9'10'#9'TRAHREG'
          'TRAFREG'#9'10'#9'TRAFREG'
          'TRAUSER'#9'10'#9'TRAUSER'
          'TRADOCMTO'#9'11'#9'TRADOCMTO'
          'LOCID'#9'5'#9'LOCID'
          'UBICID'#9'6'#9'UBICID'
          'CCOSID'#9'15'#9'CCOSID'
          'TRANCCOS'#9'15'#9'TRANCCOS'
          'MOTID'#9'5'#9'MOTID'
          'CLAUXID'#9'7'#9'CLAUXID'
          'RECIBEID'#9'15'#9'RECIBEID'
          'FPROVE'#9'7'#9'FPROVE'
          'TRAORDEN'#9'10'#9'TRAORDEN'
          'TRAAUTORI'#9'50'#9'TRAAUTORI'
          'F_ULTIMO'#9'8'#9'F_ULTIMO'
          'TRAGUIA_R'#9'10'#9'TRAGUIA_R'
          'TRAESTADO'#9'11'#9'TRAESTADO'
          'TRANUMIMP'#9'11'#9'TRANUMIMP'
          'EXTERNO'#9'1'#9'EXTERNO'
          'TRAMOTIVO'#9'100'#9'TRAMOTIVO')
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DMAF.dsTraslado
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnDragOver = dbgSeleDragOver
        OnEndDrag = dbgSeleEndDrag
        OnMouseDown = dbgSeleMouseDown
        FooterColor = 7566265
      end
    end
  end
  object ppdbGuia: TppDBPipeline
    DataSource = DMAF.dsTraslado
    UserName = 'dbGuia'
    Left = 192
    Top = 528
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'ACFID'
      FieldName = 'ACFID'
      FieldLength = 8
      DisplayWidth = 8
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'TACFID'
      FieldName = 'TACFID'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 3
      DisplayWidth = 5
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'UBICID'
      FieldName = 'UBICID'
      FieldLength = 3
      DisplayWidth = 6
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'CCOSID'
      FieldName = 'CCOSID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'TRAFECHA'
      FieldName = 'TRAFECHA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'TRANLOCAL'
      FieldName = 'TRANLOCAL'
      FieldLength = 3
      DisplayWidth = 10
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'TRANUBICA'
      FieldName = 'TRANUBICA'
      FieldLength = 3
      DisplayWidth = 10
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'TRANCCOS'
      FieldName = 'TRANCCOS'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'TRAMOTIVO'
      FieldName = 'TRAMOTIVO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'TRAAUTORI'
      FieldName = 'TRAAUTORI'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'TRARECIBE'
      FieldName = 'TRARECIBE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'TRAHREG'
      FieldName = 'TRAHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 13
    end
    object ppField15: TppField
      FieldAlias = 'TRAFREG'
      FieldName = 'TRAFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      FieldAlias = 'TRAUSER'
      FieldName = 'TRAUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      FieldAlias = 'TRADOCMTO'
      FieldName = 'TRADOCMTO'
      FieldLength = 8
      DisplayWidth = 11
      Position = 16
    end
    object ppField18: TppField
      FieldAlias = 'MOTID'
      FieldName = 'MOTID'
      FieldLength = 2
      DisplayWidth = 5
      Position = 17
    end
    object ppField19: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 7
      Position = 18
    end
    object ppField20: TppField
      FieldAlias = 'RECIBEID'
      FieldName = 'RECIBEID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'FPROVE'
      FieldName = 'FPROVE'
      FieldLength = 1
      DisplayWidth = 7
      Position = 20
    end
    object ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TRAORDEN'
      FieldName = 'TRAORDEN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppField23: TppField
      FieldAlias = 'F_ULTIMO'
      FieldName = 'F_ULTIMO'
      FieldLength = 1
      DisplayWidth = 8
      Position = 22
    end
    object ppField24: TppField
      FieldAlias = 'TRAGUIA_R'
      FieldName = 'TRAGUIA_R'
      FieldLength = 10
      DisplayWidth = 10
      Position = 23
    end
    object ppField25: TppField
      FieldAlias = 'TRAESTADO'
      FieldName = 'TRAESTADO'
      FieldLength = 1
      DisplayWidth = 11
      Position = 24
    end
    object ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'TRANUMIMP'
      FieldName = 'TRANUMIMP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 11
      Position = 25
    end
    object ppField27: TppField
      FieldAlias = 'TRAGUIAFL'
      FieldName = 'TRAGUIAFL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'GUIAFEC'
      FieldName = 'GUIAFEC'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'GUIATRANSP'
      FieldName = 'GUIATRANSP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 28
    end
    object ppField30: TppField
      FieldAlias = 'GUIARUC'
      FieldName = 'GUIARUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'GUIAPLACA'
      FieldName = 'GUIAPLACA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 30
    end
    object ppField32: TppField
      FieldAlias = 'EXTERNO'
      FieldName = 'EXTERNO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 31
    end
    object ppField33: TppField
      FieldAlias = 'TRAOBSER'
      FieldName = 'TRAOBSER'
      FieldLength = 100
      DisplayWidth = 100
      Position = 32
    end
  end
  object pprGuia: TppReport
    AutoStop = False
    DataPipeline = ppdbGuia
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 228600
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SOLExes\SOLFormatos\ACFGuiaRemision_A4.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 232
    Top = 528
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbGuia'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 94456
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'TRASLADO EXTERNO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6350
        mmLeft = 63236
        mmTop = 14023
        mmWidth = 58738
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'R.U.C.  20382036655'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 142082
        mmTop = 21960
        mmWidth = 37571
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'GUIA DE REMISION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 146579
        mmTop = 26988
        mmWidth = 40481
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 144727
        mmTop = 32015
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 5556
        mmTop = 29104
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'DESTINATARIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 23548
        mmTop = 44450
        mmWidth = 32015
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'TRASPORTISTA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 131234
        mmTop = 44450
        mmWidth = 32015
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Sr.(es)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 53181
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Direcc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 64823
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'R.U.C.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 75936
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Sr.(es)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 128852
        mmTop = 53181
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'R.U.C.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 128059
        mmTop = 64823
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Placa Vehicular No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 130704
        mmTop = 75936
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Cant.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 83344
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'SERIE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 180446
        mmTop = 83344
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'MEDIDA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 12435
        mmTop = 87842
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 80169
        mmTop = 83344
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label301'
        Caption = 'UNIDAD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 12435
        mmTop = 83344
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'TIPO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 29104
        mmTop = 83344
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'ACTIVO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 26723
        mmTop = 87842
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 43392
        mmTop = 83344
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'ACTIVO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 43921
        mmTop = 87842
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'GUIATRANSP'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3969
        mmLeft = 141552
        mmTop = 53181
        mmWidth = 59002
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'GUIARUC'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3969
        mmLeft = 141552
        mmTop = 64823
        mmWidth = 40217
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'GUIAPLACA'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3969
        mmLeft = 165629
        mmTop = 75936
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'GUIAFEC'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 4763
        mmLeft = 22490
        mmTop = 29104
        mmWidth = 27781
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'TRARECIBE'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3969
        mmLeft = 16669
        mmTop = 53181
        mmWidth = 105834
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DIREC'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3969
        mmLeft = 16669
        mmTop = 64823
        mmWidth = 106098
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'PROVRUC'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3969
        mmLeft = 16669
        mmTop = 75936
        mmWidth = 39423
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'TRAGUIA_R'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 4763
        mmLeft = 158750
        mmTop = 32279
        mmWidth = 30692
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'MODELO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 149754
        mmTop = 83609
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CARGO'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3969
        mmLeft = 16669
        mmTop = 58208
        mmWidth = 71967
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Telefono:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 60590
        mmTop = 75936
        mmWidth = 13494
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'TELEFONO'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3969
        mmLeft = 77258
        mmTop = 75936
        mmWidth = 44186
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'AGENCIA'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3969
        mmLeft = 16669
        mmTop = 69586
        mmWidth = 106098
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 
          '----------------------------------------------------------------' +
          '---------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 37306
        mmWidth = 201613
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 
          '----------------------------------------------------------------' +
          '---------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 529
        mmTop = 47625
        mmWidth = 201613
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 
          '----------------------------------------------------------------' +
          '---------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 79375
        mmWidth = 201613
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 
          '----------------------------------------------------------------' +
          '---------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 89429
        mmWidth = 201613
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabel41: TppLabel
        UserName = 'Label40'
        Caption = '1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3969
        mmTop = 1323
        mmWidth = 1588
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'TACFID'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 1323
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ACFID'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 1323
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ACFDES'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3704
        mmLeft = 61913
        mmTop = 1323
        mmWidth = 80169
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ACFSERIE'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 1323
        mmWidth = 29369
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'UND.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 13758
        mmTop = 1323
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'ACFMODELO'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 3704
        mmLeft = 145521
        mmTop = 1323
        mmWidth = 23019
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppLabel34: TppLabel
        UserName = 'Label33'
        Caption = 'Dpto.Administraci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 35190
        mmTop = 25665
        mmWidth = 32015
        BandType = 8
      end
      object ppLabel36: TppLabel
        UserName = 'Label34'
        Caption = 'Origen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 43921
        mmTop = 30427
        mmWidth = 10583
        BandType = 8
      end
      object ppLabel38: TppLabel
        UserName = 'Label37'
        Caption = 'Recibido Conforme'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 146844
        mmTop = 26194
        mmWidth = 26988
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = '----------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 20108
        mmTop = 18785
        mmWidth = 63500
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = '--------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 119063
        mmTop = 18521
        mmWidth = 79375
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Total Activos :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 4233
        mmWidth = 21696
        BandType = 7
      end
      object pplReg: TppLabel
        UserName = 'lReg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 24606
        mmTop = 4233
        mmWidth = 11377
        BandType = 7
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TRAOBSER'
        DataPipeline = ppdbGuia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbGuia'
        mmHeight = 10848
        mmLeft = 2646
        mmTop = 19579
        mmWidth = 197380
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Observaciones:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 12700
        mmWidth = 25929
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 
          '----------------------------------------------------------------' +
          '---------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 7673
        mmWidth = 201613
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'Label201'
        Caption = 
          '----------------------------------------------------------------' +
          '---------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 0
        mmWidth = 201613
        BandType = 7
      end
    end
  end
end
