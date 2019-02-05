object FToolsActivo: TFToolsActivo
  Left = 2
  Top = 189
  Width = 1170
  Height = 110
  Caption = 'FToolsActivo'
  Color = clBtnFace
  UseDockManager = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAct: TPanel
    Left = 0
    Top = 0
    Width = 1154
    Height = 72
    Align = alClient
    BevelInner = bvRaised
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 0
    object Label1: TLabel
      Left = 467
      Top = 8
      Width = 108
      Height = 13
      Caption = '--Activos a Depreciar---'
    end
    object dblcResumen: TwwDBLookupCombo
      Left = 291
      Top = 8
      Width = 129
      Height = 21
      DropDownAlignment = taLeftJustify
      LookupTable = DMAF.cdsVistas
      LookupField = 'DESCRIP'
      DropDownCount = 9
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcResumenChange
    end
    object Z2bbtnMantenimiento: TBitBtn
      Left = 67
      Top = 7
      Width = 110
      Height = 30
      Hint = 'Activos Fijos Comprados Recientemente'
      Caption = 'Depreciaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnMantenimientoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
        8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
        0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
        0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
        05555555575FF777755555555500055555555555557775555555}
      NumGlyphs = 2
    end
    object bbtnActualizaDepre: TBitBtn
      Left = 526
      Top = 21
      Width = 54
      Height = 30
      Hint = 'Activos Fijos Comprados Recientemente'
      Caption = 'Actualiza'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnActualizaDepreClick
      NumGlyphs = 2
    end
    object bbtnSeleDepre: TBitBtn
      Left = 454
      Top = 20
      Width = 54
      Height = 30
      Hint = 'Activos Fijos Comprados Recientemente'
      Caption = 'Seleccion'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnSeleDepreClick
      NumGlyphs = 2
    end
    object btnRptDepreciacionAcum: TBitBtn
      Left = 627
      Top = 23
      Width = 146
      Height = 30
      Caption = 'Activos - Deprec'
      TabOrder = 4
      OnClick = btnRptDepreciacionAcumClick
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
  end
  object scFile: TStrContainer
    Left = 496
    Top = 16
  end
  object ppdsgPadron: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 464
    Top = 8
  end
  object pprPadron: TppReport
    AutoStop = False
    DataPipeline = ppdbPadron
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 18430
    PrinterSetup.mmMarginLeft = 11350
    PrinterSetup.mmMarginRight = 350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\oaEjecuta\RTMs\ACF\DEMA\PADRONAFXAREATODODEF.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 488
    Top = 8
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbPadron'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 7938
        mmTop = 1323
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'INVENTARIO DE ACTIVO FIJO'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 3387
        mmLeft = 78874
        mmTop = 1323
        mmWidth = 39370
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3457
        mmLeft = 38365
        mmTop = 1852
        mmWidth = 17216
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 192352
        mmTop = 5292
        mmWidth = 1411
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'P'#225'gina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 181769
        mmTop = 5292
        mmWidth = 7691
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 181769
        mmTop = 529
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'AL 30 DE JUNIO DEL 2004'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 129117
        mmTop = 4498
        mmWidth = 33073
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'CODBARRAS'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 2469
        mmLeft = 3175
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'DENOMINACI'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 2469
        mmLeft = 10319
        mmTop = 0
        mmWidth = 21519
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'ESTADO'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 2117
        mmLeft = 104246
        mmTop = 0
        mmWidth = 1129
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'ACFDESL'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 2469
        mmLeft = 49477
        mmTop = 0
        mmWidth = 21519
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'MATERIAL'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 1623
        mmLeft = 106098
        mmTop = 0
        mmWidth = 3316
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'MARCA'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 2117
        mmLeft = 111390
        mmTop = 0
        mmWidth = 5786
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'MODELO'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 2117
        mmLeft = 131498
        mmTop = 0
        mmWidth = 6773
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'SERIE'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 2117
        mmLeft = 149225
        mmTop = 0
        mmWidth = 10795
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'DIMENSIONE'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 1623
        mmLeft = 169863
        mmTop = 0
        mmWidth = 6209
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'TASCN_SOLE'
        DataPipeline = ppdbPadron
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 2469
        mmLeft = 189565
        mmTop = 0
        mmWidth = 5856
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'RESPONSABL'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 1623
        mmLeft = 182563
        mmTop = 0
        mmWidth = 3528
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = '_______________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 8467
        mmTop = 529
        mmWidth = 24342
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'GRUPO1'
      DataPipeline = ppdbPadron
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbPadron'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 18521
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 9525
          mmWidth = 198173
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'LOCAL'
          DataPipeline = ppdbPadron
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbPadron'
          mmHeight = 2469
          mmLeft = 11906
          mmTop = 794
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'LOCDES'
          DataPipeline = ppdbPadron
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbPadron'
          mmHeight = 4163
          mmLeft = 16669
          mmTop = 794
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Local:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 6350
          mmTop = 794
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'PISO'
          DataPipeline = ppdbPadron
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbPadron'
          mmHeight = 4163
          mmLeft = 76994
          mmTop = 4763
          mmWidth = 3528
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Piso:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 69586
          mmTop = 4763
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          AutoSize = True
          DataField = 'AREADES'
          DataPipeline = ppdbPadron
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbPadron'
          mmHeight = 4163
          mmLeft = 100806
          mmTop = 4763
          mmWidth = 28646
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Area:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 86519
          mmTop = 4763
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Cod.Bar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 2646
          mmTop = 11113
          mmWidth = 7197
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Denominaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 12700
          mmTop = 11113
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Est'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2469
          mmLeft = 103981
          mmTop = 11113
          mmWidth = 2611
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Mat'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 107156
          mmTop = 11113
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Marca'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 112448
          mmTop = 11113
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Modelo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 130704
          mmTop = 11113
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Serie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 149754
          mmTop = 11113
          mmWidth = 4233
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Dimensiones'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 169334
          mmTop = 11113
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Descripcion'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 50800
          mmTop = 11113
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          AutoSize = True
          DataField = 'AREA'
          DataPipeline = ppdbPadron
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbPadron'
          mmHeight = 3387
          mmLeft = 93927
          mmTop = 4763
          mmWidth = 2822
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2469
          mmLeft = 189971
          mmTop = 10054
          mmWidth = 4727
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 794
          mmTop = 15610
          mmWidth = 198173
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label201'
          Caption = 'SETI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 182563
          mmTop = 265
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Neto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2469
          mmLeft = 190236
          mmTop = 12965
          mmWidth = 4092
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Usuar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 181769
          mmTop = 11113
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'AMBIENTE'
      DataPipeline = ppdbPadron
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbPadron'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Ambiente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3387
          mmLeft = 17727
          mmTop = 0
          mmWidth = 11783
          BandType = 3
          GroupNo = 1
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'AMBIENTE'
          DataPipeline = ppdbPadron
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbPadron'
          mmHeight = 3387
          mmLeft = 32544
          mmTop = 0
          mmWidth = 4233
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'AMBDES'
          DataPipeline = ppdbPadron
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbPadron'
          mmHeight = 3387
          mmLeft = 38100
          mmTop = 0
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppdbPadron: TppDBPipeline
    UserName = 'dbPadron'
    Left = 520
    Top = 8
  end
  object ppdbRptDepreciacionAcum: TppDBPipeline
    UserName = 'dbRptDepreciacionAcum'
    Left = 728
    Top = 8
  end
  object pprRptDepreciacionAcum: TppReport
    AutoStop = False
    DataPipeline = ppdbRptDepreciacionAcum
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMS\ACF\DEMA\ActivosDepreciacionAcum.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 760
    Top = 8
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRptDepreciacionAcum'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41540
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 7673
        mmLeft = 1058
        mmTop = 32279
        mmWidth = 195792
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Cod barra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 7408
        mmTop = 33073
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Denominaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6879
        mmLeft = 22490
        mmTop = 33073
        mmWidth = 52123
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Fecha Adquisici'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 75671
        mmTop = 33073
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Fecha Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 95515
        mmTop = 33073
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Moneda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6879
        mmLeft = 111919
        mmTop = 33073
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Costo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6879
        mmLeft = 123561
        mmTop = 33073
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Depreciaci'#243'n Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 141552
        mmTop = 33073
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Deprecici'#243'n Acumulada por Activo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5165
        mmLeft = 64877
        mmTop = 11113
        mmWidth = 70273
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6879
        mmLeft = 1323
        mmTop = 33073
        mmWidth = 5821
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 7144
        mmTop = 32279
        mmWidth = 2910
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 22754
        mmTop = 32279
        mmWidth = 2910
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 75406
        mmTop = 32279
        mmWidth = 2910
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 94986
        mmTop = 32544
        mmWidth = 2910
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 111919
        mmTop = 32544
        mmWidth = 2910
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 123296
        mmTop = 32544
        mmWidth = 2910
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 139700
        mmTop = 32544
        mmWidth = 2910
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 166159
        mmTop = 32544
        mmWidth = 2910
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'ACFDES'
        DataPipeline = ppdbRptDepreciacionAcum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRptDepreciacionAcum'
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 529
        mmWidth = 52123
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'ACFFECADQ'
        DataPipeline = ppdbRptDepreciacionAcum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRptDepreciacionAcum'
        mmHeight = 3175
        mmLeft = 75671
        mmTop = 529
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'ACFFREG'
        DataPipeline = ppdbRptDepreciacionAcum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRptDepreciacionAcum'
        mmHeight = 3175
        mmLeft = 95515
        mmTop = 529
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'TMONID'
        DataPipeline = ppdbRptDepreciacionAcum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRptDepreciacionAcum'
        mmHeight = 3175
        mmLeft = 111919
        mmTop = 529
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'ACFVALOMO'
        DataPipeline = ppdbRptDepreciacionAcum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRptDepreciacionAcum'
        mmHeight = 3175
        mmLeft = 123561
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppdbRptDepreciacionAcum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppdbRptDepreciacionAcum'
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 529
        mmWidth = 5821
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppParameterList2: TppParameterList
    end
  end
  object ppdRptDepreciacionAcum: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 792
    Top = 8
  end
end
