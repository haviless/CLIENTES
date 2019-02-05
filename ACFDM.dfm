object DMAF: TDMAF
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 231
  Top = 8
  Height = 667
  Width = 763
  object cdsTipAct: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TACFDES'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TACFABR'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CUENTAID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TACFID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TACFVIDA'
        DataType = ftFloat
      end
      item
        Name = 'TACFDEPREC'
        DataType = ftFloat
      end
      item
        Name = 'CIAID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTADEP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CTADEPACU'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TACFDEP'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
        Fields = 'CiaId;Tacfid'
        Options = [ixPrimary]
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    ProviderName = 'dspQry1'
    RemoteServer = DCOM1
    StoreDefs = True
    ValidateWithMask = True
    Left = 57
    Top = 5
  end
  object dsTipAct: TwwDataSource
    DataSet = cdsTipAct
    Left = 65
    Top = 40
  end
  object cdsActFij2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry3'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'ACFID;CustomEdit;dblcdCodigo')
    ValidateWithMask = True
    Left = 175
    Top = 4
  end
  object dsActFij2: TwwDataSource
    DataSet = cdsActFij2
    Left = 175
    Top = 24
  end
  object cdsQry: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 464
    Top = 145
  end
  object DCOM1: TSocketConnection
    ServerGUID = '{2E0A1783-04F4-41A0-B6FA-0C12EF4FE7C2}'
    ServerName = 'DMAFSrv.srvDMAF'
    Address = '192.168.20.39'
    Left = 8
    Top = 16
  end
  object cdsCia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry18'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 16
    Top = 208
  end
  object cdsCuenta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry20'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 448
  end
  object cdsMoneda: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry19'
    RemoteServer = DCOM1
    AfterOpen = cdsMonedaAfterOpen
    ValidateWithMask = True
    Left = 134
    Top = 208
  end
  object cdsProvee: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry20'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 200
    Top = 208
  end
  object cdsCCosto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 261
    Top = 208
  end
  object dsCia: TwwDataSource
    DataSet = cdsCia
    Left = 16
    Top = 227
  end
  object dsCuenta: TwwDataSource
    DataSet = cdsCuenta
    Left = 70
    Top = 451
  end
  object dsMoneda: TwwDataSource
    DataSet = cdsMoneda
    Left = 135
    Top = 227
  end
  object dsProvee: TwwDataSource
    DataSet = cdsProvee
    Left = 200
    Top = 227
  end
  object dsCCosto: TwwDataSource
    DataSet = cdsCCosto
    Left = 262
    Top = 227
  end
  object cdsTCambio: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry8'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 16
    Top = 272
  end
  object dsTCambio: TwwDataSource
    DataSet = cdsTCambio
    Left = 16
    Top = 292
  end
  object cdsTipDoc: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry3'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 380
    Top = 208
  end
  object dsTipDoc: TwwDataSource
    DataSet = cdsTipDoc
    Left = 381
    Top = 226
  end
  object cdsUbica: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry4'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 442
    Top = 208
  end
  object dsUbica: TwwDataSource
    DataSet = cdsUbica
    Left = 443
    Top = 227
  end
  object cdsAdqui: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 319
    Top = 208
  end
  object dsAdqui: TwwDataSource
    DataSet = cdsAdqui
    Left = 320
    Top = 227
  end
  object cdsLocalidad: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry8'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 88
    Top = 272
  end
  object cdsMaterial: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry9'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 160
    Top = 272
  end
  object dsMaterial: TwwDataSource
    DataSet = cdsMaterial
    Left = 160
    Top = 290
  end
  object dsLocalidad: TwwDataSource
    DataSet = cdsLocalidad
    Left = 84
    Top = 292
  end
  object cdsRefor: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry11'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 296
    Top = 272
  end
  object cdsTraslado: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry10'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 232
    Top = 272
  end
  object dsRefor: TwwDataSource
    DataSet = cdsRefor
    Left = 296
    Top = 292
  end
  object dsTraslado: TwwDataSource
    DataSet = cdsTraslado
    Left = 232
    Top = 292
  end
  object cdsActFij3: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry4'
    RemoteServer = DCOM1
    AfterApplyUpdates = cdsActFijAfterApplyUpdates
    ValidateWithMask = True
    Left = 238
    Top = 4
  end
  object dsActFij3: TwwDataSource
    DataSet = cdsActFij3
    Left = 237
    Top = 24
  end
  object dsFactor: TwwDataSource
    DataSet = cdsFactor
    Left = 359
    Top = 292
  end
  object dsDepre: TwwDataSource
    DataSet = cdsDepre
    Left = 426
    Top = 293
  end
  object cdsUDep: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry13'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 488
    Top = 272
  end
  object dsUDep: TwwDataSource
    DataSet = cdsUDep
    Left = 487
    Top = 291
  end
  object cdsDesac: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry14'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 552
    Top = 280
  end
  object dsDesac: TwwDataSource
    DataSet = cdsDesac
    Left = 551
    Top = 291
  end
  object cdsAFCC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry6'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 561
    Top = 208
  end
  object dsAFCC: TwwDataSource
    DataSet = cdsAFCC
    Left = 561
    Top = 227
  end
  object dsDepre2: TwwDataSource
    DataSet = cdsDepre2
    Left = 561
    Top = 24
  end
  object cdsActFij4: TwwClientDataSet
    Aggregates = <>
    Filter = 'acfid='
    Params = <>
    ProviderName = 'dspQry5'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 299
    Top = 4
  end
  object dsActFij4: TwwDataSource
    DataSet = cdsActFij4
    Left = 299
    Top = 24
  end
  object dsWork1: TwwDataSource
    DataSet = cdsWork1
    Left = 79
    Top = 163
  end
  object cdsDepre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry12'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 424
    Top = 272
  end
  object cdsFactor: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry12'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 360
    Top = 272
  end
  object cdsDepre2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry9'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 559
    Top = 4
  end
  object cdsWork1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvBusca'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 78
    Top = 145
  end
  object cdsWork2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 139
    Top = 146
  end
  object dsWork2: TwwDataSource
    DataSet = cdsWork2
    Left = 139
    Top = 163
  end
  object cdsUsuarios: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 80
  end
  object cdsMGrupo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMGrupo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 87
    Top = 80
  end
  object cdsGrupos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 149
    Top = 80
  end
  object cdsAcceso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcceso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 208
    Top = 80
  end
  object dsUsuarios: TwwDataSource
    DataSet = cdsUsuarios
    Left = 22
    Top = 99
  end
  object dsMGrupo: TwwDataSource
    DataSet = cdsMGrupo
    Left = 87
    Top = 99
  end
  object dsGrupos: TwwDataSource
    DataSet = cdsGrupos
    Left = 149
    Top = 99
  end
  object dsAcceso: TwwDataSource
    DataSet = cdsAcceso
    Left = 208
    Top = 99
  end
  object cdsNivel: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NIVEL'
    Params = <>
    ProviderName = 'dspQry5'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 503
    Top = 209
  end
  object dsNivel: TwwDataSource
    DataSet = cdsNivel
    Left = 504
    Top = 227
  end
  object cdsCompras: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry10'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 303
    Top = 81
  end
  object dsCompras: TwwDataSource
    DataSet = cdsCompras
    Left = 303
    Top = 100
  end
  object cdsInvC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry13'
    RemoteServer = DCOM1
    OnReconcileError = cdsInvCReconcileError
    ValidateWithMask = True
    Left = 496
    Top = 82
  end
  object cdsInvD: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry13'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 554
    Top = 81
  end
  object dsInvC: TwwDataSource
    DataSet = cdsInvC
    Left = 496
    Top = 101
  end
  object dsInvD: TwwDataSource
    DataSet = cdsInvD
    Left = 554
    Top = 100
  end
  object cdsTrab: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry14'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 20
    Top = 145
  end
  object dsTrab: TwwDataSource
    DataSet = cdsTrab
    Left = 20
    Top = 164
  end
  object cdsMotivo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry6'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 361
    Top = 4
  end
  object dsMotivo: TwwDataSource
    DataSet = cdsMotivo
    Left = 361
    Top = 24
  end
  object cdsTrasPen: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry7'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 427
    Top = 4
  end
  object cdsTrasSel: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry8'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 495
    Top = 4
  end
  object dsTrasPen: TwwDataSource
    DataSet = cdsTrasPen
    Left = 427
    Top = 24
  end
  object dsTrasSel: TwwDataSource
    DataSet = cdsTrasSel
    Left = 495
    Top = 24
  end
  object dsQry: TwwDataSource
    DataSet = cdsQry
    Left = 464
    Top = 164
  end
  object cdsReva: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry11'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 368
    Top = 82
  end
  object cdsRevaDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry12'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 432
    Top = 82
  end
  object dsReva: TwwDataSource
    DataSet = cdsReva
    Left = 368
    Top = 101
  end
  object dsRevaDet: TwwDataSource
    DataSet = cdsRevaDet
    Left = 432
    Top = 101
  end
  object cdsTDiario: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 560
    Top = 145
  end
  object cdsCta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 512
    Top = 145
  end
  object cdsACFCont: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry16'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 208
    Top = 146
  end
  object dsACFCon: TwwDataSource
    DataSet = cdsACFCont
    Left = 208
    Top = 164
  end
  object cdsMovCNT: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry16'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 284
    Top = 147
  end
  object cdsQry2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 416
    Top = 145
  end
  object cdsEstado: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry17'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 352
    Top = 147
  end
  object dsEstado: TwwDataSource
    DataSet = cdsEstado
    Left = 352
    Top = 160
  end
  object cdsActFij: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry2'
    RemoteServer = DCOM1
    OnReconcileError = cdsInvCReconcileError
    PictureMasks.Strings = (
      'ARTCODBAR'#9'[#][#][#][#][#][#]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 120
    Top = 8
  end
  object dsActFij: TwwDataSource
    DataSet = cdsActFij
    Left = 120
    Top = 32
  end
  object dsQry2: TwwDataSource
    DataSet = cdsQry2
    Left = 416
    Top = 176
  end
  object cdsCNT311: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry15'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 24
    Top = 344
  end
  object dsCNT311: TwwDataSource
    DataSet = cdsCNT311
    Left = 24
    Top = 387
  end
  object cdsResultSet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 88
    Top = 344
  end
  object cdsLimReCab: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry15'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 168
    Top = 344
  end
  object dsLimReCab: TwwDataSource
    DataSet = cdsLimReCab
    Left = 168
    Top = 368
  end
  object dsLimReDet: TwwDataSource
    DataSet = cdsLimReDet
    Left = 248
    Top = 367
  end
  object cdsLimReDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry16'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 248
    Top = 346
  end
  object cdsQry3: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTGE'
    RemoteServer = DCOM1
    OnReconcileError = cdsInvCReconcileError
    ValidateWithMask = True
    Left = 368
    Top = 352
  end
  object cdsTem1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTem1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 432
    Top = 352
  end
  object dsTem1: TwwDataSource
    DataSet = cdsTem1
    Left = 432
    Top = 392
  end
  object dsUser: TwwDataSource
    DataSet = cdsUser
    Left = 617
    Top = 19
  end
  object cdsUser: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 617
    Top = 8
  end
  object cdsPiso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 488
    Top = 352
  end
  object dsPiso: TwwDataSource
    DataSet = cdsPiso
    Left = 488
    Top = 400
  end
  object cdsArea: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry17'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 536
    Top = 352
  end
  object dsArea: TwwDataSource
    DataSet = cdsArea
    Left = 536
    Top = 400
  end
  object cdsAmbiente: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry18'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 600
    Top = 352
  end
  object dsAmbiente: TwwDataSource
    DataSet = cdsAmbiente
    Left = 600
    Top = 400
  end
  object cdsResponsable: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry7'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 656
    Top = 184
  end
  object dsResponsable: TwwDataSource
    DataSet = cdsResponsable
    Left = 656
    Top = 232
  end
  object cdsLocal: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry19'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 672
    Top = 352
  end
  object dsLocal: TwwDataSource
    DataSet = cdsLocal
    Left = 672
    Top = 400
  end
  object cdsCabTraslado: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry20'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 122
    Top = 414
  end
  object dsCabTraslado: TwwDataSource
    DataSet = cdsCabTraslado
    Left = 122
    Top = 462
  end
  object cdsResponsab: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 211
    Top = 414
  end
  object dsResponsab: TwwDataSource
    DataSet = cdsResponsab
    Left = 211
    Top = 462
  end
  object cdsInventario: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 283
    Top = 414
  end
  object dsInventario: TwwDataSource
    DataSet = cdsInventario
    Left = 291
    Top = 462
  end
  object cdsUbicAnterior: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry3'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 363
    Top = 414
  end
  object dsUbicAnterior: TwwDataSource
    DataSet = cdsUbicAnterior
    Left = 371
    Top = 462
  end
  object cdsInvTras: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry6'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 122
    Top = 518
  end
  object dsInvTras: TwwDataSource
    DataSet = cdsInvTras
    Left = 122
    Top = 566
  end
  object cdsInvtAct: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry6'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 192
    Top = 520
  end
  object dsInvtAct: TwwDataSource
    DataSet = cdsInvtAct
    Left = 192
    Top = 568
  end
  object cdsBusca: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry7'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 291
    Top = 510
  end
  object dsBusca: TwwDataSource
    DataSet = cdsBusca
    Left = 291
    Top = 558
  end
  object cdsMotivos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry4'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 456
    Top = 464
  end
  object dsMotivos: TwwDataSource
    DataSet = cdsMotivos
    Left = 456
    Top = 512
  end
  object cdsDocs: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry5'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 544
    Top = 464
  end
  object dsDocs: TwwDataSource
    DataSet = cdsDocs
    Left = 544
    Top = 512
  end
  object cdsUsuario: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry9'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 632
    Top = 576
  end
  object dsUsuario: TwwDataSource
    DataSet = cdsUsuario
    Left = 624
    Top = 504
  end
  object cdsVistas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry8'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 368
    Top = 512
  end
  object dsVistas: TwwDataSource
    DataSet = cdsVistas
    Left = 371
    Top = 558
  end
  object cdsQry10: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTem1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 601
    Top = 80
  end
  object cdsQry8: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry17'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 609
    Top = 128
  end
  object cdsQry9: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTem5'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 657
    Top = 80
  end
  object cdsQry7: TwwClientDataSet
    Aggregates = <>
    MasterFields = 'object cdsQry9: TwwClientDataSet'
    Params = <>
    ProviderName = 'dspQry18'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 657
    Top = 128
  end
  object cdsQry6: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTem6'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 697
    Top = 128
  end
  object cdsCia1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTem4'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 681
    Top = 16
  end
  object dsQry9: TwwDataSource
    DataSet = cdsQry9
    Left = 696
    Top = 80
  end
  object dsQry10: TwwDataSource
    DataSet = cdsQry10
    Left = 616
    Top = 76
  end
  object cdsCuentaDep: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry20'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 30
    Top = 552
  end
  object dsCuentadep: TwwDataSource
    DataSet = cdsCuentaDep
    Left = 30
    Top = 515
  end
  object cdsQry11: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTem1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 633
    Top = 304
  end
  object dsQry11: TwwDataSource
    DataSet = cdsQry11
    Left = 688
    Top = 284
  end
end
