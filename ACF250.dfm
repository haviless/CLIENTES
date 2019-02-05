object FTActivo: TFTActivo
  Left = 409
  Top = 215
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Mantenimiento de Tipos de Activo Fijo'
  ClientHeight = 325
  ClientWidth = 712
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 284
    Top = 192
    Width = 79
    Height = 13
    Caption = 'Cuenta Contable'
  end
  object pnlPrincipal: TPanel
    Left = 10
    Top = 11
    Width = 690
    Height = 302
    Color = 14869218
    TabOrder = 0
    object pnlDetalle: TPanel
      Left = 17
      Top = 13
      Width = 656
      Height = 260
      BevelInner = bvLowered
      Color = 14869218
      TabOrder = 0
      object Label2: TLabel
        Left = 309
        Top = 16
        Width = 88
        Height = 13
        Caption = 'Tipo de Activo Fijo'
      end
      object Label3: TLabel
        Left = 19
        Top = 89
        Width = 162
        Height = 13
        Caption = 'Descripci'#243'n de Tipo de Activo Fijo'
      end
      object Label4: TLabel
        Left = 333
        Top = 89
        Width = 54
        Height = 13
        Caption = 'Abreviatura'
      end
      object Label11: TLabel
        Left = 19
        Top = 171
        Width = 79
        Height = 13
        Caption = 'Cuenta Contable'
      end
      object Label5: TLabel
        Left = 470
        Top = 90
        Width = 79
        Height = 13
        Caption = 'Vida Util (Meses)'
      end
      object Label6: TLabel
        Left = 566
        Top = 90
        Width = 74
        Height = 13
        Caption = 'Depreciaci'#243'n %'
      end
      object Label1: TLabel
        Left = 22
        Top = 16
        Width = 47
        Height = 13
        Caption = 'Compa'#241'ia'
      end
      object Bevel1: TBevel
        Left = 2
        Top = 66
        Width = 652
        Height = 8
        Shape = bsTopLine
        Style = bsRaised
      end
      object Bevel2: TBevel
        Left = 2
        Top = 144
        Width = 652
        Height = 8
        Shape = bsTopLine
        Style = bsRaised
      end
      object Label7: TLabel
        Left = 19
        Top = 211
        Width = 100
        Height = 13
        Caption = 'Cuenta Depreciaci'#243'n'
      end
      object dbeDescripcion: TwwDBEdit
        Left = 19
        Top = 105
        Width = 300
        Height = 21
        Color = clWhite
        DataField = 'TACFDES'
        DataSource = DMAF.dsTipAct
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeAbrev: TwwDBEdit
        Left = 331
        Top = 105
        Width = 120
        Height = 21
        Color = clWhite
        DataField = 'TACFABR'
        DataSource = DMAF.dsTipAct
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeTActivo: TwwDBEdit
        Left = 308
        Top = 31
        Width = 92
        Height = 21
        Color = clWhite
        DataField = 'TACFID'
        DataSource = DMAF.dsTipAct
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeTActivoExit
      end
      object dbeCuenta: TwwDBEdit
        Left = 150
        Top = 187
        Width = 237
        Height = 21
        Color = 14869218
        Enabled = False
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcdCuenta: TwwDBLookupComboDlg
        Left = 18
        Top = 187
        Width = 130
        Height = 21
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'CUENTAID'#9'15'#9'Id'#9'F'
          'CTADES'#9'40'#9'Plan Ctas Consolidada'#9'F')
        DataField = 'CUENTAID'
        DataSource = DMAF.dsTipAct
        LookupTable = DMAF.cdsCuenta
        LookupField = 'CUENTAID'
        Color = clWhite
        TabOrder = 7
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcdCuentaExit
      end
      object seVida: TwwDBSpinEdit
        Left = 485
        Top = 105
        Width = 49
        Height = 21
        Increment = 1.000000000000000000
        MaxValue = 500.000000000000000000
        Value = 100.000000000000000000
        Color = clWhite
        DataField = 'TACFVIDA'
        DataSource = DMAF.dsTipAct
        TabOrder = 5
        UnboundDataType = wwDefault
      end
      object dbeDepre: TwwDBEdit
        Left = 581
        Top = 105
        Width = 42
        Height = 21
        Color = clWhite
        DataField = 'TACFDEPREC'
        DataSource = DMAF.dsTipAct
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeDepreExit
      end
      object dblcCia: TwwDBLookupCombo
        Left = 21
        Top = 31
        Width = 49
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'Cia'#9'F'
          'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
        DataField = 'CIAID'
        DataSource = DMAF.dsTipAct
        LookupTable = DMAF.cdsCia
        LookupField = 'CIAID'
        Options = [loColLines, loRowLines, loTitles]
        Color = clWhite
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        OnExit = dblcCiaExit
      end
      object dbeCia: TwwDBEdit
        Left = 71
        Top = 31
        Width = 192
        Height = 21
        Color = 14869218
        Enabled = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcdCuentaDep: TwwDBLookupComboDlg
        Left = 18
        Top = 227
        Width = 130
        Height = 21
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        DataField = 'CTADEP'
        DataSource = DMAF.dsTipAct
        LookupTable = DMAF.cdsCuenta
        LookupField = 'CUENTAID'
        Color = clWhite
        TabOrder = 9
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcdCuentaDepExit
      end
      object dbeCuentaDep: TwwDBEdit
        Left = 150
        Top = 227
        Width = 237
        Height = 21
        Color = 14869218
        Enabled = False
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object Z2bbtnRegistra: TBitBtn
      Left = 558
      Top = 275
      Width = 25
      Height = 25
      Hint = 'Registra'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnRegistraClick
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
    object Z2bbtnCanc2: TBitBtn
      Left = 597
      Top = 275
      Width = 25
      Height = 25
      Hint = 'Cancela Datos'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnCanc2Click
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
  end
end
