object FDenominacion: TFDenominacion
  Left = 53
  Top = 149
  Width = 698
  Height = 413
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Registro de Denominaciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBusqueda: TPanel
    Left = 114
    Top = 233
    Width = 495
    Height = 145
    Color = clSilver
    TabOrder = 0
    Visible = False
    object lblBusca: TLabel
      Left = 24
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Busca'
    end
    object dbgBusca: TwwDBGrid
      Left = 11
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
  object pnlDenominacion: TPanel
    Left = 8
    Top = 64
    Width = 665
    Height = 185
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 43
      Width = 68
      Height = 13
      Caption = 'Denominaci'#243'n'
    end
    object Label2: TLabel
      Left = 24
      Top = 68
      Width = 71
      Height = 13
      Caption = 'Desc.Adicional'
    end
    object Label3: TLabel
      Left = 24
      Top = 93
      Width = 37
      Height = 13
      Caption = 'Material'
    end
    object Label4: TLabel
      Left = 24
      Top = 116
      Width = 60
      Height = 13
      Caption = 'Dimensiones'
    end
    object Label5: TLabel
      Left = 24
      Top = 140
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object dbeDenominaci: TwwDBEdit
      Left = 128
      Top = 38
      Width = 337
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnDenominaci: TBitBtn
      Left = 470
      Top = 36
      Width = 23
      Height = 21
      TabOrder = 1
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
    object dbeACFDESL: TwwDBEdit
      Left = 128
      Top = 63
      Width = 529
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeDimensione: TwwDBEdit
      Left = 128
      Top = 108
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Z2bbtnGraba: TBitBtn
      Left = 471
      Top = 128
      Width = 25
      Height = 25
      Hint = 'Registrar'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = Z2bbtnGrabaClick
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
    object dblcMaterial: TwwDBLookupCombo
      Left = 128
      Top = 84
      Width = 73
      Height = 21
      DropDownAlignment = taLeftJustify
      LookupTable = DMAF.cdsMaterial
      LookupField = 'MATERIALID'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object dblcEstado: TwwDBLookupCombo
      Left = 128
      Top = 133
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      LookupTable = DMAF.cdsEstado
      LookupField = 'ESTADOID'
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcEstadoExit
    end
    object edtEstado: TEdit
      Left = 179
      Top = 133
      Width = 160
      Height = 21
      Enabled = False
      TabOrder = 6
    end
  end
end
