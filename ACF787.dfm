object FRptDesactivados: TFRptDesactivados
  Left = 415
  Top = 133
  Width = 313
  Height = 205
  Caption = 'Reporte de AF Desactivados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape
    Left = 17
    Top = 4
    Width = 270
    Height = 159
    Brush.Style = bsClear
    Pen.Color = clBtnHighlight
    Shape = stRoundRect
  end
  object Shape1: TShape
    Left = 16
    Top = 3
    Width = 270
    Height = 159
    Brush.Style = bsClear
    Pen.Color = clBtnShadow
    Shape = stRoundRect
  end
  object Label3: TLabel
    Left = 26
    Top = 65
    Width = 91
    Height = 16
    Caption = 'Motivo de Baja :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 26
    Top = 14
    Width = 144
    Height = 16
    Caption = 'Fecha de Baja del Activo :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 40
    Width = 37
    Height = 15
    Caption = 'Desde :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 153
    Top = 40
    Width = 35
    Height = 15
    Caption = 'Hasta :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object dblcMotivo: TwwDBLookupCombo
    Left = 26
    Top = 85
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcMotivoExit
  end
  object edtMotivo_des: TEdit
    Left = 79
    Top = 85
    Width = 194
    Height = 21
    CharCase = ecUpperCase
    Color = 14869218
    Enabled = False
    TabOrder = 1
  end
  object Z2bbtnImprime: TBitBtn
    Left = 243
    Top = 116
    Width = 30
    Height = 30
    Hint = 'Activos Fijos Comprados Recientemente'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
  object wwDBDateTimePicker_Desde: TwwDBDateTimePicker
    Left = 65
    Top = 35
    Width = 81
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 3
  end
  object wwDBDateTimePicker_Hasta: TwwDBDateTimePicker
    Left = 193
    Top = 35
    Width = 81
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 4
  end
  object ppDBPipeline_AFDesactivados: TppDBPipeline
    UserName = 'DBPipeline_AFDesactivados'
    Left = 43
    Top = 128
  end
  object ppReport_AFDesactivados: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline_AFDesactivados
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
    Template.FileName = 'C:\DemaExes\RTMS\ACF\DEMA\AFDesactivados.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 75
    Top = 128
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline_AFDesactivados'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 52652
      mmPrintPosition = 0
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 179388
        mmTop = 23813
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 166159
        mmTop = 23813
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 179652
        mmTop = 28046
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Hora :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 166159
        mmTop = 28046
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable7'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 192882
        mmTop = 32015
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'P'#225'gina :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 166159
        mmTop = 32015
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 186532
        mmTop = 32015
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label201'
        Caption = 'Usuario :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 166159
        mmTop = 35719
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 179652
        mmTop = 32015
        mmWidth = 5292
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'USUARIO_IMPRIME'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3175
        mmLeft = 179917
        mmTop = 35983
        mmWidth = 17198
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 9260
        mmLeft = 1323
        mmTop = 42598
        mmWidth = 192882
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label5'
        Caption = 'C'#243'digo Barra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8202
        mmLeft = 7673
        mmTop = 43127
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Descripci'#243'n Activo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 22490
        mmTop = 43127
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Autorizado por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 95250
        mmTop = 43127
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label101'
        Caption = 'Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 121392
        mmTop = 43127
        mmWidth = 8721
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label21'
        Caption = 'Observaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 145786
        mmTop = 43127
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label22'
        Caption = 'Solicit Desactiv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 182563
        mmTop = 43127
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label23'
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 2646
        mmTop = 43127
        mmWidth = 2540
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 6615
        mmTop = 42598
        mmWidth = 1588
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 16669
        mmTop = 42598
        mmWidth = 1588
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 56092
        mmTop = 42598
        mmWidth = 1588
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 120650
        mmTop = 42598
        mmWidth = 1588
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 131498
        mmTop = 42598
        mmWidth = 1588
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 180975
        mmTop = 42598
        mmWidth = 1588
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'FILTRO_FECHA'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 21696
        mmTop = 28840
        mmWidth = 45508
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label6'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 9260
        mmTop = 28840
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label9'
        Caption = 'Motivo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 9260
        mmTop = 33602
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Motivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 64823
        mmTop = 43127
        mmWidth = 7408
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 80169
        mmTop = 42598
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 82815
        mmTop = 43127
        mmWidth = 9260
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 94456
        mmTop = 42598
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label10'
        Caption = 'REPORTE DE DESACTIVACION DE ACTIVOS FIJOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 8467
        mmLeft = 51329
        mmTop = 8996
        mmWidth = 98690
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FILTRO_MOTIVO'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 21696
        mmTop = 33602
        mmWidth = 51065
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ACTIVO'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 7673
        mmTop = 529
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ACTIVO_DES'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 529
        mmWidth = 39423
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'COD_MOTIVO'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 57944
        mmTop = 529
        mmWidth = 3704
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MOTIVO_DESC'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 61913
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'FECHA'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 81227
        mmTop = 529
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'AUTORIZA'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 95779
        mmTop = 529
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'MES'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 121709
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'OBSERVACION'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 132557
        mmTop = 529
        mmWidth = 48154
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'NUM_SOLDESACTIVACION'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 181505
        mmTop = 529
        mmWidth = 12171
        BandType = 4
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3440
        mmLeft = 1852
        mmTop = 529
        mmWidth = 4763
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 1058
        mmWidth = 190765
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataPipeline = ppDBPipeline_AFDesactivados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline_AFDesactivados'
        mmHeight = 3387
        mmLeft = 3440
        mmTop = 2117
        mmWidth = 4763
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label13'
        Caption = 'Registros Recuperados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 9525
        mmTop = 2381
        mmWidth = 82021
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner_AFDesactivados: TppDesigner
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
    Left = 107
    Top = 128
  end
end
