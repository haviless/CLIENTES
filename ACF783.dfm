object FToolsDepreciacion: TFToolsDepreciacion
  Left = 128
  Top = 241
  Width = 888
  Height = 90
  Caption = 'Depreciaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 160
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object pnlDepreciacion: TPanel
    Left = 0
    Top = 0
    Width = 872
    Height = 52
    Align = alClient
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 0
    object Label1: TLabel
      Left = 188
      Top = 17
      Width = 56
      Height = 16
      Caption = 'Periodo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pcDepreciacion: TPageControl
      Left = 13
      Top = 14
      Width = 137
      Height = 27
      ActivePage = ts2
      MultiLine = True
      Style = tsButtons
      TabOrder = 0
      OnChange = pcDepreciacionChange
      object ts1: TTabSheet
        Caption = 'Definitiva'
      end
      object ts2: TTabSheet
        Caption = 'Preliminar'
        ImageIndex = 1
      end
    end
    object cbConsultas: TComboBox
      Left = 348
      Top = 13
      Width = 209
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnChange = cbConsultasChange
      Items.Strings = (
        'Depreciaci'#243'n Resumen x Tipo de Activo'
        'Depreciacion Resumen x Compa'#241'ia / Tipo de Activo'
        'Cuadre del Activo y Depreciaci'#243'n'
        'Detalle de la Depreciaci'#243'n'
        'Padr'#243'n Legalizado x Compa'#241'ia'
        'Padr'#243'n Legalizado General')
    end
    object dblcPeriodoD: TwwDBLookupCombo
      Left = 247
      Top = 13
      Width = 92
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      LookupTable = DMAF.cdsFactor
      LookupField = 'FAFECDEPRE'
      Options = [loColLines, loRowLines, loTitles]
      Color = clWhite
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object gbFecRep: TGroupBox
      Left = 640
      Top = 2
      Width = 121
      Height = 47
      Enabled = False
      TabOrder = 4
      object dtpFecRep: TwwDBDateTimePicker
        Left = 19
        Top = 19
        Width = 90
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
      end
    end
    object cbFecRep: TCheckBox
      Left = 640
      Top = 2
      Width = 109
      Height = 17
      Caption = 'Fecha de Reporte'
      TabOrder = 3
      OnClick = cbFecRepClick
    end
    object rgHoja: TRadioGroup
      Left = 565
      Top = 2
      Width = 67
      Height = 47
      Caption = 'Hoja'
      ItemIndex = 0
      Items.Strings = (
        'A4'
        '14 7/8')
      TabOrder = 5
    end
  end
  object ppDBQry: TppDBPipeline
    UserName = 'DBQry'
    Left = 840
    Top = 16
  end
  object pprQry: TppReport
    AutoStop = False
    DataPipeline = ppDBQry
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMS\ACF\Dema\DepreResumenCiaTacf.rtm'
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 808
    Top = 16
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBQry'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        UserName = 'Label1'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 12965
        mmTop = 794
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label2'
        Caption = 'Resumen del Activo y la Depreciacion'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4163
        mmLeft = 68513
        mmTop = 529
        mmWidth = 59831
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 177007
        mmTop = 4498
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 193940
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label20'
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 177007
        mmTop = 0
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label21'
        Caption = 'Tipo de Activo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 21167
        mmTop = 19050
        mmWidth = 17463
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 11113
        mmTop = 15346
        mmWidth = 186267
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label3'
        Caption = 'ACTIVO FIJO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 15346
        mmTop = 5821
        mmWidth = 17198
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 177007
        mmTop = 9790
        mmWidth = 17198
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 11113
        mmTop = 28310
        mmWidth = 186267
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label4'
        Caption = 'Por Cia. / Tipo de Activo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 79375
        mmTop = 5292
        mmWidth = 38365
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label5'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 107686
        mmTop = 16404
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label6'
        Caption = 'Historico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 105834
        mmTop = 20373
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label7'
        Caption = 'Acumulado '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 126736
        mmTop = 16404
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label8'
        Caption = 'Anterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3246
        mmLeft = 130440
        mmTop = 20373
        mmWidth = 9666
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label10'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3246
        mmLeft = 155575
        mmTop = 20373
        mmWidth = 9596
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label11'
        Caption = 'Valor Neto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3246
        mmLeft = 183357
        mmTop = 16404
        mmWidth = 13194
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label101'
        Caption = 'Historico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3246
        mmLeft = 185473
        mmTop = 20108
        mmWidth = 10724
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label13'
        Caption = 'Del'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 16404
        mmWidth = 4233
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'DEPFECHA'
        DataPipeline = ppDBQry
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 129911
        mmTop = 5292
        mmWidth = 17526
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label9'
        Caption = 'Al'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 124090
        mmTop = 5292
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label12'
        Caption = 'SOLES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 93133
        mmTop = 10319
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label15'
        Caption = 'Sin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 80698
        mmTop = 16404
        mmWidth = 4106
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label16'
        Caption = 'Depreciar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 76729
        mmTop = 20638
        mmWidth = 12234
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label22'
        Caption = '( + )'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 80963
        mmTop = 24606
        mmWidth = 4403
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label23'
        Caption = '( + )'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 109009
        mmTop = 24606
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label24'
        Caption = '( - )'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 133350
        mmTop = 24606
        mmWidth = 3768
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label25'
        Caption = '( - )'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 158486
        mmTop = 24606
        mmWidth = 3768
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label26'
        Caption = '( = )'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 188384
        mmTop = 24606
        mmWidth = 4403
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText11: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'CUENTAID'
        DataPipeline = ppDBQry
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 16933
        mmTop = 265
        mmWidth = 9737
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'TACFDES'
        DataPipeline = ppDBQry
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 27781
        mmTop = 265
        mmWidth = 29760
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'VH'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 96563
        mmTop = 0
        mmWidth = 20447
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'ANTHIST'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 122661
        mmTop = 265
        mmWidth = 20447
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'DELMES'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 152696
        mmTop = 265
        mmWidth = 15579
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'TOTALNETO'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 175610
        mmTop = 265
        mmWidth = 20447
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'TACFID'
        DataPipeline = ppDBQry
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 11642
        mmTop = 265
        mmWidth = 3895
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'SINDEPRE'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 75639
        mmTop = 0
        mmWidth = 15579
        BandType = 4
      end
    end
    object ppFooterB2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object plblFiltro1: TppLabel
        UserName = 'Label14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        mmHeight = 3725
        mmLeft = 13228
        mmTop = 0
        mmWidth = 10414
        BandType = 8
      end
      object TppLabel
        UserName = 'Label17'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        mmHeight = 3725
        mmLeft = 13228
        mmTop = 0
        mmWidth = 10414
        BandType = 8
      end
      object TppLabel
        UserName = 'Label19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        mmHeight = 3725
        mmLeft = 521
        mmTop = 0
        mmWidth = 10414
        BandType = 8
      end
      object TppLabel
        UserName = 'Label27'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        mmHeight = 3725
        mmLeft = 521
        mmTop = 0
        mmWidth = 10414
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape1'
        mmHeight = 7144
        mmLeft = 32015
        mmTop = 1588
        mmWidth = 165365
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc5'
        AutoSize = True
        DataField = 'VH'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 100542
        mmTop = 3175
        mmWidth = 16468
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc6'
        AutoSize = True
        DataField = 'ANTHIST'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 116417
        mmTop = 3175
        mmWidth = 26712
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc7'
        AutoSize = True
        DataField = 'DELMES'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 142283
        mmTop = 3175
        mmWidth = 25993
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc8'
        AutoSize = True
        DataField = 'TOTALNETO'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 163206
        mmTop = 3175
        mmWidth = 32851
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        AutoSize = True
        DataField = 'SINDEPRE'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4022
        mmLeft = 61648
        mmTop = 3175
        mmWidth = 29506
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label18'
        Caption = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 37571
        mmTop = 3175
        mmWidth = 11377
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'UBICID'
      DataPipeline = ppDBQry
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBQry'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppShape7: TppShape
          UserName = 'Shape2'
          mmHeight = 5027
          mmLeft = 11113
          mmTop = 2646
          mmWidth = 77788
          BandType = 3
          GroupNo = 0
        end
        object ppDBText55: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = 'UBICID'
          DataPipeline = ppDBQry
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 4022
          mmLeft = 11642
          mmTop = 3175
          mmWidth = 3895
          BandType = 3
          GroupNo = 0
        end
        object ppDBText56: TppDBText
          UserName = 'DBText10'
          AutoSize = True
          DataField = 'CIADES'
          DataPipeline = ppDBQry
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 4022
          mmLeft = 16669
          mmTop = 3175
          mmWidth = 70993
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLine6: TppLine
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 59796
          mmTop = 0
          mmWidth = 137584
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc31: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'VH'
          DataPipeline = ppDBQry
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 4022
          mmLeft = 100542
          mmTop = 529
          mmWidth = 16468
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc32: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'ANTHIST'
          DataPipeline = ppDBQry
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 4022
          mmLeft = 116417
          mmTop = 529
          mmWidth = 26712
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc33: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = 'DELMES'
          DataPipeline = ppDBQry
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 4022
          mmLeft = 142283
          mmTop = 529
          mmWidth = 25993
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc34: TppDBCalc
          UserName = 'DBCalc4'
          AutoSize = True
          DataField = 'TOTALNETO'
          DataPipeline = ppDBQry
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 4022
          mmLeft = 163206
          mmTop = 529
          mmWidth = 32851
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc35: TppDBCalc
          UserName = 'DBCalc9'
          AutoSize = True
          DataField = 'SINDEPRE'
          DataPipeline = ppDBQry
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 4022
          mmLeft = 61383
          mmTop = 794
          mmWidth = 29506
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppdsgQry: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprQry
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 784
    Top = 16
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBQry
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 15000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 378000
    PrinterSetup.PaperSize = 125
    Template.FileName = 'C:\DemaExes\RTMS\ACF\Dema\Legal 1.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 712
    Top = 16
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBQry'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 314326
        mmTop = 0
        mmWidth = 14817
        BandType = 0
      end
      object pplFec: TppLabel
        UserName = 'lFec'
        Caption = '20/11/2011'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 315003
        mmTop = 0
        mmWidth = 14139
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label1'
        Caption = 'REGISTRO DE CONTROL DEL ACTIVO FIJO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 143934
        mmTop = 0
        mmWidth = 51858
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label2'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 0
        mmWidth = 28152
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label3'
        Caption = 'Tipo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 12965
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label4'
        Caption = 'Activo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 17198
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label5'
        Caption = 'Codigo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 15081
        mmTop = 12965
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label6'
        Caption = 'Activo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 15081
        mmTop = 17198
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label7'
        Caption = 'Denominaci'#243'n del Bien'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 28310
        mmTop = 17198
        mmWidth = 31115
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label8'
        Caption = 'Serie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 84402
        mmTop = 17198
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label9'
        Caption = 'Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 179917
        mmTop = 17198
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label10'
        Caption = 'Depreciaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 260351
        mmTop = 12965
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label11'
        Caption = 'Depreciaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 284692
        mmTop = 12965
        mmWidth = 17780
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label12'
        Caption = 'Valor Neto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 314326
        mmTop = 12965
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label13'
        Caption = 'Acum. Anterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 257440
        mmTop = 17198
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label15'
        Caption = 'del Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 286015
        mmTop = 17198
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label17'
        Caption = 'Historico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 315913
        mmTop = 17198
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'CIADES'
        DataPipeline = ppDBQry
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 3260
        mmLeft = 3440
        mmTop = 4498
        mmWidth = 44111
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText13'
        DataField = 'MESANO'
        DataPipeline = ppDBQry
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4233
        mmLeft = 169598
        mmTop = 4498
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label19'
        Caption = 'PERIODO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 154517
        mmTop = 4498
        mmWidth = 11906
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNoDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 318030
        mmTop = 4498
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label14'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 222515
        mmTop = 17198
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label101'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 243417
        mmTop = 12965
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label18'
        Caption = 'Historico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 237596
        mmTop = 17198
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label21'
        Caption = 'F.Adquisic'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 200290
        mmTop = 17198
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 8996
        mmWidth = 325703
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-----------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 21167
        mmWidth = 325703
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label25'
        Caption = 'Caracter'#237'sticas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 110596
        mmTop = 17198
        mmWidth = 22225
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'TACFID'
        DataPipeline = ppDBQry
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 3260
        mmLeft = 5027
        mmTop = 0
        mmWidth = 3133
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'ARTCODBAR'
        DataPipeline = ppDBQry
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 3260
        mmLeft = 14817
        mmTop = 0
        mmWidth = 9398
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText3'
        DataField = 'ACFDES'
        DataPipeline = ppDBQry
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4233
        mmLeft = 28575
        mmTop = 0
        mmWidth = 51065
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText4'
        DataField = 'ACFSERIE'
        DataPipeline = ppDBQry
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4233
        mmLeft = 83344
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText6'
        DataField = 'DEPANTHIST'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4233
        mmLeft = 257705
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DEPIMPHIST'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4233
        mmLeft = 284163
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText10'
        DataField = 'DEPNETOHIS'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4233
        mmLeft = 308505
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'NCOMPROB'
        DataPipeline = ppDBQry
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 3260
        mmLeft = 181769
        mmTop = 0
        mmWidth = 15240
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'ACFFECADQ'
        DataPipeline = ppDBQry
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 3260
        mmLeft = 200290
        mmTop = 0
        mmWidth = 14139
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'TACFDEPREC'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 3260
        mmLeft = 219678
        mmTop = 0
        mmWidth = 7070
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText11'
        DataField = 'ACFDESL'
        DataPipeline = ppDBQry
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4233
        mmLeft = 110596
        mmTop = 0
        mmWidth = 67733
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText14'
        DataField = 'DEPVALHIST'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 4233
        mmLeft = 230453
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'DEPVALHIST'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 3260
        mmLeft = 221859
        mmTop = 4498
        mmWidth = 27009
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'DEPIMPHIST'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 3260
        mmLeft = 275644
        mmTop = 4498
        mmWidth = 26670
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        AutoSize = True
        DataField = 'DEPNETOHIS'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 3260
        mmLeft = 301266
        mmTop = 4498
        mmWidth = 27771
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'DEPANTHIST'
        DataPipeline = ppDBQry
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBQry'
        mmHeight = 3260
        mmLeft = 250667
        mmTop = 4498
        mmWidth = 27305
        BandType = 7
      end
      object ppLabel48: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 168805
        mmTop = 0
        mmWidth = 160338
        BandType = 7
      end
      object ppLabel49: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 
          '================================================================' +
          '================================================================' +
          '========================'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 168805
        mmTop = 8467
        mmWidth = 160338
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataPipeline = ppDBQry
        DisplayFormat = '###,###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBQry'
        mmHeight = 3175
        mmLeft = 184150
        mmTop = 4498
        mmWidth = 15610
        BandType = 7
      end
      object ppLabel50: TppLabel
        UserName = 'Label29'
        Caption = 'Registros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 169069
        mmTop = 4498
        mmWidth = 11906
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'UBICID'
      DataPipeline = ppDBQry
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBQry'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc9'
          AutoSize = True
          DataField = 'DEPVALHIST'
          DataPipeline = ppDBQry
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 3260
          mmLeft = 223817
          mmTop = 4498
          mmWidth = 27009
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc10'
          AutoSize = True
          DataField = 'DEPANTHIST'
          DataPipeline = ppDBQry
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 3260
          mmLeft = 250508
          mmTop = 4498
          mmWidth = 27305
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc11'
          AutoSize = True
          DataField = 'DEPIMPHIST'
          DataPipeline = ppDBQry
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 3260
          mmLeft = 275749
          mmTop = 4498
          mmWidth = 26670
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc12'
          AutoSize = True
          DataField = 'DEPNETOHIS'
          DataPipeline = ppDBQry
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 3260
          mmLeft = 301371
          mmTop = 4498
          mmWidth = 27771
          BandType = 5
          GroupNo = 0
        end
        object ppDBText24: TppDBText
          UserName = 'DBText15'
          AutoSize = True
          DataField = 'CIADES'
          DataPipeline = ppDBQry
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBQry'
          mmHeight = 3175
          mmLeft = 112184
          mmTop = 4498
          mmWidth = 44186
          BandType = 5
          GroupNo = 0
        end
        object ppLabel51: TppLabel
          UserName = 'Label27'
          AutoSize = False
          Caption = 
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '---------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 112184
          mmTop = 0
          mmWidth = 216959
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc13'
          DataPipeline = ppDBQry
          DisplayFormat = '###,###'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppDBQry'
          mmHeight = 3175
          mmLeft = 184150
          mmTop = 4498
          mmWidth = 15610
          BandType = 5
          GroupNo = 0
        end
        object ppLabel52: TppLabel
          UserName = 'Label26'
          Caption = 'Registros'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 169069
          mmTop = 4498
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
