object FInvActualiza: TFInvActualiza
  Left = 404
  Top = 206
  BorderStyle = bsSingle
  Caption = 'Actualiza Inventario'
  ClientHeight = 322
  ClientWidth = 709
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 3
    Top = 2
    Width = 698
    Height = 46
    Color = 14869218
    Enabled = False
    TabOrder = 0
    object Label6: TLabel
      Left = 261
      Top = 1
      Width = 34
      Height = 16
      Caption = 'Codigo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 347
      Top = 1
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
    object Label8: TLabel
      Left = 19
      Top = 1
      Width = 61
      Height = 16
      Caption = 'Tipo A.Fijo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 250
      Top = 17
      Width = 63
      Height = 23
      DataField = 'ACFID'
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
    object wwDBEdit2: TwwDBEdit
      Left = 315
      Top = 17
      Width = 302
      Height = 23
      DataField = 'ACFDES'
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
    object dbeTAcF: TwwDBEdit
      Left = 18
      Top = 17
      Width = 60
      Height = 23
      DataField = 'TACFID'
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
      OnExit = dbeTAcFExit
    end
    object dbeTACFDes: TwwDBEdit
      Left = 80
      Top = 17
      Width = 150
      Height = 23
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
  end
  object Panel2: TPanel
    Left = 3
    Top = 99
    Width = 698
    Height = 177
    Color = 14869218
    TabOrder = 1
    object gbCambio: TGroupBox
      Left = 355
      Top = 3
      Width = 335
      Height = 168
      Caption = 'Cambio de Datos '
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 13
        Top = 15
        Width = 41
        Height = 16
        Caption = 'C.Costo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 13
        Top = 55
        Width = 48
        Height = 16
        Caption = 'Localidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 11
        Top = 95
        Width = 51
        Height = 16
        Caption = 'Ubicaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblcdCCosNew: TwwDBLookupComboDlg
        Left = 8
        Top = 31
        Width = 90
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'CCOSID'#9'12'#9'Id.'#9'F'
          'CCOSDES'#9'30'#9'CCOSDES'#9'F')
        DataField = 'NEWCCOS'
        LookupField = 'CCOSID'
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcdCCosNewExit
      end
      object dbeCCosNDes: TDBEdit
        Left = 99
        Top = 31
        Width = 150
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object dblcLocNew: TwwDBLookupCombo
        Left = 8
        Top = 70
        Width = 60
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'LOCID'#9'2'#9'C'#243'digo'#9'F'
          'LOCABR'#9'10'#9'Localidad'#9'F')
        DataField = 'NEWLOC'
        LookupField = 'LOCID'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcLocNewExit
      end
      object dbeLocNDes: TDBEdit
        Left = 69
        Top = 70
        Width = 160
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object dbeUbicNDes: TDBEdit
        Left = 89
        Top = 111
        Width = 240
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object Z2bbtnCambioOk: TBitBtn
        Left = 92
        Top = 138
        Width = 65
        Height = 25
        Caption = 'Confirma'
        TabOrder = 3
        OnClick = Z2bbtnCambioOkClick
      end
      object Z2bbtnCambioCa: TBitBtn
        Left = 185
        Top = 138
        Width = 65
        Height = 25
        Caption = 'Cancela'
        TabOrder = 4
        OnClick = Z2bbtnCambioCaClick
      end
      object dblcUbicNew: TwwDBLookupComboDlg
        Left = 8
        Top = 111
        Width = 80
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'UBICID'#9'8'#9'C'#243'digo'#9'F'
          'UBICDES'#9'70'#9'Ubicaci'#243'n'#9'F')
        DataField = 'NEWUBIC'
        LookupField = 'UBICID'
        ParentFont = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcUbicNewExit
      end
    end
    object gbDatos: TGroupBox
      Left = 9
      Top = 3
      Width = 340
      Height = 168
      Caption = 'Datos Actual'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label2: TLabel
        Left = 13
        Top = 15
        Width = 41
        Height = 16
        Caption = 'C.Costo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 13
        Top = 55
        Width = 48
        Height = 16
        Caption = 'Localidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 11
        Top = 95
        Width = 51
        Height = 16
        Caption = 'Ubicaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeCCosto: TwwDBEdit
        Left = 8
        Top = 31
        Width = 75
        Height = 23
        DataField = 'CCOSID'
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
      object dbeCCosDes: TDBEdit
        Left = 85
        Top = 31
        Width = 150
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object dbeLoc: TwwDBEdit
        Left = 8
        Top = 70
        Width = 50
        Height = 23
        DataField = 'LOCID'
        Enabled = False
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
      object dbeLocDes: TDBEdit
        Left = 61
        Top = 70
        Width = 160
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object dbeUbic: TwwDBEdit
        Left = 8
        Top = 111
        Width = 63
        Height = 23
        DataField = 'UBICID'
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
      object dbeUbicDes: TDBEdit
        Left = 73
        Top = 111
        Width = 260
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object Z2bbtnOk: TBitBtn
        Left = 36
        Top = 138
        Width = 65
        Height = 25
        Caption = 'Confirma'
        TabOrder = 6
        OnClick = Z2bbtnOkClick
      end
      object Z2bbtnCambio: TBitBtn
        Left = 125
        Top = 138
        Width = 65
        Height = 25
        Caption = 'Cambio'
        TabOrder = 7
        OnClick = Z2bbtnCambioClick
      end
      object Z2bbtnNoOk: TBitBtn
        Left = 215
        Top = 138
        Width = 65
        Height = 25
        Caption = 'No Existe'
        TabOrder = 8
        OnClick = Z2bbtnNoOkClick
      end
    end
  end
  object Panel3: TPanel
    Left = 3
    Top = 278
    Width = 698
    Height = 35
    Color = 14869218
    TabOrder = 2
    object Label1: TLabel
      Left = 256
      Top = 8
      Width = 40
      Height = 16
      Caption = 'Estado:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Z2bbtnSigue: TBitBtn
      Left = 440
      Top = 5
      Width = 60
      Height = 25
      Caption = 'Siguiente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Z2bbtnSigueClick
    end
    object dbeEstado: TwwDBEdit
      Left = 303
      Top = 6
      Width = 105
      Height = 21
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Z2bbtnAnte: TBitBtn
      Left = 173
      Top = 5
      Width = 60
      Height = 25
      Caption = 'Anterior'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Z2bbtnAnteClick
    end
  end
  object Panel4: TPanel
    Left = 3
    Top = 50
    Width = 698
    Height = 47
    Color = 14869218
    TabOrder = 3
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
    object wwDBEdit4: TwwDBEdit
      Left = 18
      Top = 18
      Width = 180
      Height = 23
      DataField = 'ACFMARCA'
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
    object wwDBEdit5: TwwDBEdit
      Left = 221
      Top = 18
      Width = 180
      Height = 23
      DataField = 'ACFMODELO'
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
    object wwDBEdit6: TwwDBEdit
      Left = 424
      Top = 18
      Width = 160
      Height = 23
      DataField = 'ACFSERIE'
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
  end
end
