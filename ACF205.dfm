object FTomaInvAF: TFTomaInvAF
  Left = 338
  Top = 134
  Width = 779
  Height = 553
  Caption = 'Traslados de Activos Fijos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 64
    Top = 2
    Width = 102
    Height = 29
    Caption = 'Traslados '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label17: TLabel
    Left = 208
    Top = 279
    Width = 71
    Height = 13
    Caption = 'Fecha de Incio'
    Enabled = False
  end
  object Label19: TLabel
    Left = 352
    Top = 279
    Width = 55
    Height = 13
    Caption = 'Fecha Final'
    Enabled = False
  end
  object PageControl1: TPageControl
    Left = 5
    Top = 32
    Width = 746
    Height = 473
    ActivePage = tsTraslados
    TabOrder = 0
    object tsTraslados: TTabSheet
      ImageIndex = 5
      object Bevel4: TBevel
        Left = 8
        Top = 217
        Width = 721
        Height = 3
      end
      object Bevel5: TBevel
        Left = 8
        Top = 109
        Width = 721
        Height = 3
      end
      object lblDestinatario: TLabel
        Left = 8
        Top = 112
        Width = 113
        Height = 27
        Caption = 'Destinatario'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDocRefSal: TLabel
        Left = 8
        Top = 33
        Width = 75
        Height = 13
        Caption = 'Doc.Referencia'
        Enabled = False
      end
      object lblNumDocSal: TLabel
        Left = 230
        Top = 33
        Width = 78
        Height = 13
        Caption = 'N'#250'mero de Doc.'
        Enabled = False
      end
      object lblFechaTras: TLabel
        Left = 399
        Top = 34
        Width = 89
        Height = 13
        Caption = 'Fecha de Traslado'
        Enabled = False
      end
      object lblMotivoSal: TLabel
        Left = 8
        Top = 61
        Width = 93
        Height = 13
        Caption = 'Motivo del Traslado'
        Enabled = False
      end
      object lblUserDest: TLabel
        Left = 285
        Top = 62
        Width = 123
        Height = 13
        Caption = 'Responsable del Traslado'
        Enabled = False
      end
      object lblDestLocal: TLabel
        Left = 16
        Top = 142
        Width = 26
        Height = 13
        Caption = 'Local'
        Enabled = False
      end
      object lblDestPiso: TLabel
        Left = 289
        Top = 142
        Width = 20
        Height = 13
        Caption = 'Piso'
        Enabled = False
      end
      object lblDestArea: TLabel
        Left = 496
        Top = 143
        Width = 22
        Height = 13
        Caption = 'Area'
        Enabled = False
      end
      object lblDestAmbiente: TLabel
        Left = 15
        Top = 169
        Width = 44
        Height = 13
        Caption = 'Ambiente'
        Enabled = False
      end
      object lblDestUsuario: TLabel
        Left = 291
        Top = 170
        Width = 77
        Height = 13
        Caption = 'Usuario del Bien'
        Enabled = False
      end
      object lblUsuAutorDest: TLabel
        Left = 16
        Top = 194
        Width = 147
        Height = 13
        Caption = 'Usuario Autorizado que Recibe'
        Enabled = False
      end
      object lblObservac: TLabel
        Left = 8
        Top = 85
        Width = 71
        Height = 13
        Caption = 'Observaciones'
        Enabled = False
      end
      object lblAceptado: TLabel
        Left = 355
        Top = 408
        Width = 134
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblOrigen: TLabel
        Left = 10
        Top = 224
        Width = 60
        Height = 27
        Caption = 'Origen'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUsuAutorOrig: TLabel
        Left = 119
        Top = 234
        Width = 150
        Height = 13
        Caption = 'Usuario Autorizado que Entrega'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 474
        Top = 196
        Width = 35
        Height = 13
        Caption = 'C.COS.'
        Enabled = False
      end
      object bbtnComienzadenuevo: TBitBtn
        Left = 701
        Top = 412
        Width = 25
        Height = 25
        Hint = 'Comienza nuevamente'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        OnClick = bbtnComienzadenuevoClick
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
      object dbgActivosxTras: TwwDBGrid
        Left = 9
        Top = 266
        Width = 721
        Height = 135
        DisableThemesInTitle = False
        Selected.Strings = (
          'LOCAL'#9'3'#9'LOCAL'
          'LOCDES'#9'20'#9'LOCDES'
          'BLOQUE'#9'3'#9'BLOQUE'
          'PISO'#9'3'#9'PISO'
          'AREA'#9'3'#9'AREA'
          'AREADES'#9'31'#9'AREADES'
          'AMBIENTE'#9'3'#9'AMBIENTE'
          'AMBDES'#9'38'#9'AMBDES'
          'CODBARRAS'#9'7'#9'CODBARRAS'
          'DENOMINACI'#9'43'#9'DENOMINACI'
          'ACFDESL'#9'55'#9'ACFDESL'
          'ESTADO'#9'8'#9'ESTADO'
          'MATERIAL'#9'10'#9'MATERIAL'
          'MARCA'#9'25'#9'MARCA'
          'MODELO'#9'23'#9'MODELO'
          'SERIE'#9'23'#9'SERIE'
          'DIMENSIONE'#9'23'#9'DIMENSIONE'
          'FLAG'#9'2'#9'FLAG'
          'VERI'#9'1'#9'VERI'
          'RESPONSABL'#9'6'#9'RESPONSABL'
          'NOMBRE'#9'38'#9'NOMBRE'
          'FECHA'#9'7'#9'FECHA'
          'CANTIDAD'#9'2'#9'CANTIDAD'
          'VSNUS'#9'10'#9'VSNUS'
          'GRADOOP'#9'10'#9'GRADOOP'
          'VALTASUS'#9'10'#9'VALTASUS'
          'CONTRL'#9'10'#9'CONTRL'
          'TASCN_SOLE'#9'10'#9'TASCN_SOLE'
          'DENOMTASA'#9'7'#9'DENOMTASA'
          'TASADO'#9'1'#9'TASADO'
          'DENOMI02'#9'43'#9'DENOMI02'
          'TIPMOT'#9'10'#9'TIPMOT'
          'MOTIVO'#9'15'#9'MOTIVO'
          'OCOMPRA'#9'15'#9'OCOMPRA'
          'FECING'#9'10'#9'FECING'
          'DOCREF'#9'15'#9'DOCREF'
          'NUMDOC'#9'15'#9'NUMDOC'
          'MONEDA'#9'3'#9'MONEDA'
          'VALORING'#9'10'#9'VALORING'
          'USUARIO'#9'15'#9'USUARIO')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DMAF.dsInvTras
        Enabled = False
        KeyOptions = [dgAllowDelete]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 20
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        OnKeyDown = dbgActivosxTrasKeyDown
        object btnInsertaTraslado: TwwIButton
          Left = 0
          Top = 0
          Width = 23
          Height = 22
          AllowAllUp = True
          Enabled = False
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
          OnClick = btnInsertaTrasladoClick
        end
      end
      object bbtnIniciaTraslado: TBitBtn
        Left = 8
        Top = 1
        Width = 107
        Height = 20
        Caption = 'Iniciar Traslado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnClick = bbtnIniciaTrasladoClick
      end
      object dblcDocRefSal: TwwDBLookupCombo
        Left = 88
        Top = 27
        Width = 137
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = DMAF.cdsDocs
        LookupField = 'DOCABR'
        Enabled = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
      end
      object dbeNumDocSal: TwwDBEdit
        Left = 312
        Top = 27
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeNumDocSalExit
      end
      object dbdtpFecTras: TwwDBDateTimePicker
        Left = 506
        Top = 29
        Width = 81
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Enabled = False
        ShowButton = True
        TabOrder = 3
        OnExit = dbdtpFecTrasExit
      end
      object dblcMotivoSal: TwwDBLookupCombo
        Left = 105
        Top = 55
        Width = 131
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = DMAF.cdsMotivos
        LookupField = 'MOTDES'
        Enabled = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblcMotivoSalExit
      end
      object dblcResponsabTras: TwwDBLookupCombo
        Left = 417
        Top = 57
        Width = 80
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = DMAF.cdsUsuario
        LookupField = 'USUARIO'
        Enabled = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblcResponsabTrasCloseUp
        OnExit = dblcResponsabTrasExit
      end
      object edtResponsabTras: TEdit
        Left = 506
        Top = 56
        Width = 214
        Height = 21
        Enabled = False
        TabOrder = 6
      end
      object dblcDestLocal: TwwDBLookupCombo
        Left = 46
        Top = 137
        Width = 50
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'LOCID'#9'2'#9'Id'#9'F'
          'LOCDES'#9'30'#9'Local'#9'F')
        LookupTable = DMAF.cdsLocal
        LookupField = 'LOCID'
        Enabled = False
        TabOrder = 8
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcDestLocalExit
      end
      object edtDestLocal: TEdit
        Left = 97
        Top = 137
        Width = 160
        Height = 21
        Enabled = False
        TabOrder = 9
      end
      object dblcDestPiso: TwwDBLookupCombo
        Left = 312
        Top = 137
        Width = 50
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PISO'#9'2'#9'Id'#9'F'
          'PISODES'#9'36'#9'Piso'#9'F')
        LookupTable = DMAF.cdsPiso
        LookupField = 'PISO'
        Enabled = False
        TabOrder = 10
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcDestPisoExit
      end
      object edtDestPiso: TEdit
        Left = 363
        Top = 137
        Width = 102
        Height = 21
        Enabled = False
        TabOrder = 11
      end
      object dblcDestArea: TwwDBLookupCombo
        Left = 521
        Top = 138
        Width = 50
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'AREA'#9'2'#9'Id'#9'F'
          'AREADES'#9'50'#9#193'rea'#9'F')
        LookupTable = DMAF.cdsArea
        LookupField = 'AREA'
        Enabled = False
        TabOrder = 12
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcDestAreaExit
      end
      object edtDestArea: TEdit
        Left = 572
        Top = 138
        Width = 160
        Height = 21
        Enabled = False
        TabOrder = 13
      end
      object dblcDestAmbiente: TwwDBLookupCombo
        Left = 73
        Top = 164
        Width = 50
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'AMBCOD'#9'3'#9'Id'#9'F'
          'AMBDES'#9'50'#9'Ambiente'#9'F')
        LookupTable = DMAF.cdsAmbiente
        LookupField = 'AMBCOD'
        Enabled = False
        TabOrder = 14
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcDestAmbienteExit
      end
      object edtDestAmbiente: TEdit
        Left = 124
        Top = 164
        Width = 160
        Height = 21
        Enabled = False
        TabOrder = 15
      end
      object dbeUsuBienTras: TwwDBEdit
        Left = 371
        Top = 165
        Width = 79
        Height = 21
        Enabled = False
        TabOrder = 16
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeUsuBienTrasExit
      end
      object bbtnBuscaUsuBienTras: TBitBtn
        Left = 451
        Top = 165
        Width = 23
        Height = 21
        Enabled = False
        TabOrder = 21
        OnClick = bbtnBuscaRespClick
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
      object edtUsuBienTras: TEdit
        Left = 484
        Top = 165
        Width = 241
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 30
        TabOrder = 17
        OnExit = edtUsuBienTrasExit
      end
      object bbtnGrabaSal: TBitBtn
        Left = 640
        Top = 412
        Width = 25
        Height = 25
        Hint = 'Aceptar Traslado'
        Cancel = True
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 24
        OnClick = bbtnGrabaSalClick
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
      object bbtnRepTraslado: TBitBtn
        Left = 671
        Top = 412
        Width = 25
        Height = 25
        TabOrder = 25
        OnClick = bbtnRepTrasladoClick
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
      object bbtnTrasladoAnt: TBitBtn
        Left = 136
        Top = 1
        Width = 95
        Height = 20
        Caption = 'Traslado Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 26
        Visible = False
        OnClick = bbtnTrasladoAntClick
      end
      object dbeUsuAutoTras: TwwDBEdit
        Left = 166
        Top = 191
        Width = 76
        Height = 21
        Enabled = False
        TabOrder = 18
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeUsuAutoTrasExit
      end
      object bbtnBuscaUsuAutoTras: TBitBtn
        Left = 243
        Top = 191
        Width = 23
        Height = 21
        Enabled = False
        TabOrder = 22
        OnClick = bbtnBuscaUsuAutoTrasClick
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
      object edtUsuAutoTras: TEdit
        Left = 268
        Top = 191
        Width = 202
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 30
        TabOrder = 19
        OnExit = edtUsuAutoTrasExit
      end
      object dbeObservac: TwwDBEdit
        Left = 88
        Top = 84
        Width = 633
        Height = 21
        MaxLength = 100
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = True
        OnExit = dbeObservacExit
      end
      object bbtnElimTras: TBitBtn
        Left = 384
        Top = 1
        Width = 95
        Height = 20
        Caption = 'Elimina Traslado'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 27
        Visible = False
        OnClick = bbtnElimTrasClick
      end
      object RadioGroup_OrigenActivo: TRadioGroup
        Left = 598
        Top = -2
        Width = 122
        Height = 56
        Caption = 'Origen de Activos'
        TabOrder = 29
      end
      object RadioButton_unico: TRadioButton
        Left = 624
        Top = 14
        Width = 81
        Height = 17
        Caption = 'Unico'
        Checked = True
        TabOrder = 30
        TabStop = True
        OnClick = RadioButton_unicoClick
      end
      object RadioButton_multiple: TRadioButton
        Left = 624
        Top = 32
        Width = 73
        Height = 17
        Caption = 'M'#250'ltiple'
        TabOrder = 31
      end
      object dbeUsuOrigTras: TwwDBEdit
        Left = 274
        Top = 229
        Width = 79
        Height = 21
        Enabled = False
        TabOrder = 32
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeUsuOrigTrasExit
      end
      object bbtnBuscaUsuOrigTras: TBitBtn
        Left = 356
        Top = 228
        Width = 23
        Height = 23
        Enabled = False
        TabOrder = 33
        OnClick = bbtnBuscaUsuOrigTrasClick
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
      object edtUsuOrigTras: TEdit
        Left = 385
        Top = 228
        Width = 218
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 34
        OnExit = edtUsuOrigTrasExit
      end
      object BtnCabecera: TBitBtn
        Left = 588
        Top = 411
        Width = 25
        Height = 25
        Hint = 'Aceptar Traslado'
        Cancel = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 35
        OnClick = BtnCabeceraClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          333333777777777F33333330B00000003333337F7777777F3333333000000000
          333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
          333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
          03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
          03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
          3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
          333333333377F7F33333333333330F03333333333337F7F33333333333330B03
          3333333333373733333333333333303333333333333373333333}
        NumGlyphs = 2
      end
      object Btndetalle: TBitBtn
        Left = 616
        Top = 227
        Width = 25
        Height = 25
        Hint = 'Aceptar Traslado'
        Cancel = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 36
        OnClick = BtndetalleClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
          33333333373F33333333333330B03333333333337F7F33333333333330F03333
          333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
          333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
          333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
          3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
          33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
          33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
          03333337777777F7F33333330000000003333337777777773333}
        NumGlyphs = 2
      end
      object dblcdCCosto: TwwDBLookupComboDlg
        Left = 510
        Top = 190
        Width = 90
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Centro de Costo'
        MaxWidth = 0
        MaxHeight = 209
        SearchDelay = 2
        Selected.Strings = (
          'CCOSID'#9'15'#9'Id'#9'F'
          'CCOSDES'#9'30'#9'Centro de Costo'#9'F')
        LookupField = 'CCOSID'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 12
        ParentFont = False
        TabOrder = 37
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        UseTFields = False
        ShowMatchText = True
        OnExit = dblcdCCostoExit
      end
      object edtCCosto: TEdit
        Left = 600
        Top = 189
        Width = 132
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 38
      end
      object pnlDatosOrigen: TPanel
        Left = 79
        Top = 65
        Width = 558
        Height = 321
        TabOrder = 23
        Visible = False
        object Shape1: TShape
          Left = 1
          Top = 1
          Width = 556
          Height = 23
          Align = alTop
          Brush.Color = clMenuHighlight
          Pen.Style = psClear
        end
        object Label1: TLabel
          Left = 14
          Top = 5
          Width = 90
          Height = 13
          Caption = 'Detalle - Origen'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object bbtnCancelSal: TBitBtn
          Left = 519
          Top = 286
          Width = 30
          Height = 28
          Hint = 'Regresa al Grid'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = bbtnCancelSalClick
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
        object bbtnAdicDetalleTras: TBitBtn
          Left = 484
          Top = 286
          Width = 30
          Height = 28
          Hint = 'Confirma Ingreso de Articulo'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbtnAdicDetalleTrasClick
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
        object GroupBox1: TGroupBox
          Left = 6
          Top = 24
          Width = 546
          Height = 37
          TabOrder = 2
          object lblReuCodBarras: TLabel
            Left = 6
            Top = 13
            Width = 81
            Height = 13
            Caption = 'C'#243'digo de Barras'
          end
          object dbeCodigoBarra: TwwDBEdit
            Left = 93
            Top = 10
            Width = 88
            Height = 21
            MaxLength = 6
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = dbeCodigoBarraExit
          end
          object dbeReuCodBarras: TwwDBEdit
            Left = 189
            Top = 10
            Width = 68
            Height = 21
            Enabled = False
            TabOrder = 1
            UnboundDataType = wwDefault
            Visible = False
            WantReturns = False
            WordWrap = False
            OnExit = dbeReuCodBarrasExit
          end
        end
        object GroupBox2: TGroupBox
          Left = 6
          Top = 67
          Width = 545
          Height = 214
          Caption = 'Detalle de Origen'
          TabOrder = 3
          object lblOrigLocal: TLabel
            Left = 6
            Top = 25
            Width = 26
            Height = 13
            Caption = 'Local'
            Enabled = False
          end
          object lblOrigPiso: TLabel
            Left = 281
            Top = 25
            Width = 20
            Height = 13
            Caption = 'Piso'
            Enabled = False
          end
          object lblOrigArea: TLabel
            Left = 7
            Top = 55
            Width = 22
            Height = 13
            Caption = 'Area'
            Enabled = False
          end
          object lblOrigAmbiente: TLabel
            Left = 259
            Top = 54
            Width = 44
            Height = 13
            Caption = 'Ambiente'
            Enabled = False
          end
          object lblOrigUsuario: TLabel
            Left = 6
            Top = 82
            Width = 36
            Height = 13
            Caption = 'Usuario'
            Enabled = False
          end
          object lblOrigEstado: TLabel
            Left = 371
            Top = 82
            Width = 33
            Height = 13
            Caption = 'Estado'
            Enabled = False
          end
          object lblOrigDenomina: TLabel
            Left = 6
            Top = 108
            Width = 68
            Height = 13
            Caption = 'Denominaci'#243'n'
            Enabled = False
          end
          object lblOrigMeterial: TLabel
            Left = 8
            Top = 136
            Width = 37
            Height = 13
            Caption = 'Material'
            Enabled = False
          end
          object lblOrigMarca: TLabel
            Left = 176
            Top = 136
            Width = 30
            Height = 13
            Caption = 'Marca'
            Enabled = False
          end
          object lblOrigModelo: TLabel
            Left = 8
            Top = 161
            Width = 35
            Height = 13
            Caption = 'Modelo'
            Enabled = False
          end
          object lblOrigSerie: TLabel
            Left = 273
            Top = 161
            Width = 24
            Height = 13
            Caption = 'Serie'
            Enabled = False
          end
          object lblOrigDimension: TLabel
            Left = 8
            Top = 188
            Width = 60
            Height = 13
            Caption = 'Dimensiones'
            Enabled = False
          end
          object dblcOrigLocal: TwwDBLookupCombo
            Left = 39
            Top = 20
            Width = 50
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'LOCID'#9'2'#9'Id'#9'F'
              'LOCDES'#9'30'#9'Local'#9'F')
            LookupField = 'LOCID'
            Enabled = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
          end
          object edtOrigLocal: TEdit
            Left = 90
            Top = 20
            Width = 151
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object dblcOrigPiso: TwwDBLookupCombo
            Left = 308
            Top = 20
            Width = 50
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PISO'#9'2'#9'Id'#9'F'
              'PISODES'#9'36'#9'Piso'#9'F')
            LookupField = 'PISO'
            Enabled = False
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
          end
          object edtOrigPiso: TEdit
            Left = 359
            Top = 20
            Width = 120
            Height = 21
            Enabled = False
            TabOrder = 3
          end
          object dblcOrigArea: TwwDBLookupCombo
            Left = 39
            Top = 50
            Width = 50
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'AREA'#9'2'#9'Id'#9'F'
              'AREADES'#9'50'#9#193'rea'#9'F')
            LookupField = 'AREA'
            Enabled = False
            TabOrder = 4
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
          end
          object edtOrigArea: TEdit
            Left = 90
            Top = 50
            Width = 160
            Height = 21
            Enabled = False
            TabOrder = 5
          end
          object dblcOrigAmbiente: TwwDBLookupCombo
            Left = 309
            Top = 49
            Width = 50
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'AMBCOD'#9'3'#9'Id'#9'F'
              'AMBDES'#9'50'#9'Ambiente'#9'F')
            LookupField = 'AMBCOD'
            Enabled = False
            TabOrder = 6
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
          end
          object edtOrigAmbiente: TEdit
            Left = 360
            Top = 49
            Width = 160
            Height = 21
            Enabled = False
            TabOrder = 7
          end
          object dbeOrigUsuario: TwwDBEdit
            Left = 49
            Top = 77
            Width = 66
            Height = 21
            Enabled = False
            TabOrder = 8
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object edtOrigUsuario: TEdit
            Left = 121
            Top = 77
            Width = 241
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            MaxLength = 30
            TabOrder = 9
          end
          object dbeOrigEstado: TwwDBEdit
            Left = 408
            Top = 77
            Width = 41
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            TabOrder = 10
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object edtOrigDenominaci: TEdit
            Left = 79
            Top = 105
            Width = 241
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            MaxLength = 30
            TabOrder = 11
          end
          object edtOrigAcfDesl: TEdit
            Left = 324
            Top = 105
            Width = 214
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            MaxLength = 30
            TabOrder = 12
          end
          object dbeOrigMaterial: TwwDBEdit
            Left = 50
            Top = 131
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            TabOrder = 13
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeOrigMarca: TwwDBEdit
            Left = 216
            Top = 131
            Width = 249
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            TabOrder = 14
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeOrigModelo: TwwDBEdit
            Left = 50
            Top = 156
            Width = 217
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            TabOrder = 15
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeOrigSerie: TwwDBEdit
            Left = 305
            Top = 156
            Width = 233
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            TabOrder = 16
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeOrigDimensio: TwwDBEdit
            Left = 74
            Top = 183
            Width = 217
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            TabOrder = 17
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
    end
  end
  object pnlBusqueda: TPanel
    Left = 434
    Top = 57
    Width = 493
    Height = 145
    Color = clSilver
    TabOrder = 1
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
  object pnlBuscaxDato: TPanel
    Left = 522
    Top = 27
    Width = 493
    Height = 145
    Color = clSilver
    TabOrder = 2
    Visible = False
    object Label21: TLabel
      Left = 24
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Busca'
    end
    object dbgBuscaxDato: TwwDBGrid
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
    object bbtnOkBuscaxDato: TBitBtn
      Left = 417
      Top = 7
      Width = 30
      Height = 28
      Hint = 'Confirma Ingreso de Articulo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnOkBuscaxDatoClick
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
    object bbtnCancBuscaxDato: TBitBtn
      Left = 451
      Top = 7
      Width = 30
      Height = 28
      Hint = 'Cancela Ingreso de Articulo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnCancBuscaxDatoClick
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
    object dbeBuscaxDato: TwwDBEdit
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
  object ppdbPadron: TppDBPipeline
    UserName = 'dbPadron'
    Left = 416
  end
  object pprPadron: TppReport
    AutoStop = False
    DataPipeline = ppdbPadron
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15430
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DemaExes\RTMS\ACF\Dema\TrasladosACF201.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 384
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbPadron'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 77523
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'ORDEN DE TRASLADO DE ACTIVOS FIJOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 46515
        mmTop = 5556
        mmWidth = 50377
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 176213
        mmTop = 265
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 189442
        mmTop = 5027
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 178330
        mmTop = 5027
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'LOCAL_D'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 3969
        mmLeft = 14552
        mmTop = 37835
        mmWidth = 7408
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'LOCDES_D'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4057
        mmLeft = 26458
        mmTop = 37835
        mmWidth = 33867
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'PISO_D'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 3969
        mmLeft = 93134
        mmTop = 37835
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'AREA_D'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 3969
        mmLeft = 14288
        mmTop = 42863
        mmWidth = 7938
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = 'AREADES_D'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 3969
        mmLeft = 26458
        mmTop = 42863
        mmWidth = 33867
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'AMB_D'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 42863
        mmWidth = 7938
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        AutoSize = True
        DataField = 'AMBDES_D'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 3969
        mmLeft = 111919
        mmTop = 43127
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Destinatario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 32015
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Local'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 37835
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Piso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 37835
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = #193'rea'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 42863
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Ambiente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 85196
        mmTop = 42863
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'SETI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 185209
        mmTop = 10054
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Cod.Bar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 72761
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Denominaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 14817
        mmTop = 72761
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Estado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 142346
        mmTop = 72761
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'NUMDOC'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 14288
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Motivo de Traslado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 19579
        mmWidth = 26723
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'MOTIVO'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 33602
        mmTop = 19579
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'FechaTraslado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 62442
        mmTop = 14288
        mmWidth = 19315
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'FECTRAS'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 86519
        mmTop = 14288
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'N'#250'mero de Orden'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 14288
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Origen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 59531
        mmWidth = 11113
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'LOCID'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 33602
        mmTop = 64294
        mmWidth = 5292
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'LOCDES'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 64558
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'PISO'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 76200
        mmTop = 64294
        mmWidth = 2963
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'AREA'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 91281
        mmTop = 64558
        mmWidth = 2963
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'AREADES'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 97896
        mmTop = 64294
        mmWidth = 28152
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Mat'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 157692
        mmTop = 72761
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Dimensiones'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 171980
        mmTop = 72761
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Local'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 33602
        mmTop = 59796
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Piso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 76200
        mmTop = 59796
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = #193'rea'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 91281
        mmTop = 59796
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Responsable del Traslado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 129117
        mmTop = 19579
        mmWidth = 35454
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'USUARIO'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 172509
        mmTop = 19579
        mmWidth = 17198
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 794
        mmTop = 28575
        mmWidth = 191030
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 794
        mmTop = 52123
        mmWidth = 191030
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 265
        mmTop = 72231
        mmWidth = 191030
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 77258
        mmWidth = 191030
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'ESTADOTRAS'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4057
        mmLeft = 171768
        mmTop = 14817
        mmWidth = 19262
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'ARTCODBAR'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ACFDES'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 15346
        mmTop = 0
        mmWidth = 59796
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'ESTADOID'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 146050
        mmTop = 265
        mmWidth = 5292
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ACFDESL'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 3969
        mmLeft = 76200
        mmTop = 0
        mmWidth = 64823
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'MATERIALID'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 156898
        mmTop = 0
        mmWidth = 6615
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'ACFMARCA'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 4498
        mmWidth = 11853
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'ACFMODELO'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 73819
        mmTop = 4498
        mmWidth = 13335
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'ACFSERIE'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 118269
        mmTop = 4498
        mmWidth = 11853
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'ACFMEDIDA'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 171980
        mmTop = 0
        mmWidth = 13335
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Modelo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 62706
        mmTop = 4498
        mmWidth = 8996
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Serie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 109273
        mmTop = 4498
        mmWidth = 7408
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Marca'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 15346
        mmTop = 4498
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'AMBDES'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 158486
        mmTop = 4498
        mmWidth = 22225
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
      mmHeight = 60854
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = '________________________________________________'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13229
        mmTop = 10319
        mmWidth = 71173
        BandType = 7
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Usuario Autorizado que Env'#237'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13229
        mmTop = 19844
        mmWidth = 41540
        BandType = 7
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'NOMAUT_O'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 13229
        mmTop = 15081
        mmWidth = 44450
        BandType = 7
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Usuario Autorizado que Recibe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 116946
        mmTop = 40481
        mmWidth = 42863
        BandType = 7
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'NOMAUT_D'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 116946
        mmTop = 35719
        mmWidth = 38629
        BandType = 7
      end
      object ppLabel34: TppLabel
        UserName = 'Label101'
        Caption = '________________________________________________'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 116946
        mmTop = 30956
        mmWidth = 71173
        BandType = 7
      end
      object ppLabel35: TppLabel
        UserName = 'Label34'
        Caption = 'ORIGEN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13229
        mmTop = 24871
        mmWidth = 8996
        BandType = 7
      end
      object ppLabel36: TppLabel
        UserName = 'Label35'
        Caption = 'DESTINO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 116946
        mmTop = 24871
        mmWidth = 10319
        BandType = 7
      end
      object ppLabel37: TppLabel
        UserName = 'Label102'
        Caption = '________________________________________________'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 116946
        mmTop = 10319
        mmWidth = 71173
        BandType = 7
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        AutoSize = True
        DataField = 'NOMUSU_D'
        DataPipeline = ppdbPadron
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4233
        mmLeft = 116946
        mmTop = 15081
        mmWidth = 38629
        BandType = 7
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Usuario del Bien'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 116946
        mmTop = 19844
        mmWidth = 23813
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 529
        mmTop = 265
        mmWidth = 191030
        BandType = 7
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        AutoSize = True
        DataField = 'OBSERVAC'
        DataPipeline = ppdbPadron
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbPadron'
        mmHeight = 4057
        mmLeft = 49213
        mmTop = 50536
        mmWidth = 50377
        BandType = 7
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Observaciones'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 11642
        mmTop = 50536
        mmWidth = 23072
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
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
    Left = 352
  end
end
