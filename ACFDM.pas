Unit ACFDM;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad	
// HPC_201801_ACF 07/08/2018 Se adicionó un nuevo ClientDataset

Interface

Uses

   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBClient, MConnect, DBTables, Wwdatsrc, wwclient, IniFiles, Wwquery,
   Dbiprocs, Buttons, RecError, Dbierrs, Dbitypes, Wwtable,
   SConnect, winsock,
   ExtCtrls, ComCtrls, wwdblook, stdctrls, variants, Mant;

Type
   TDMAF = Class(TDataModule)
      cdsTipAct: TwwClientDataSet;
      dsTipAct: TwwDataSource;
      cdsActFij2: TwwClientDataSet;
      dsActFij2: TwwDataSource;
      cdsQry: TwwClientDataSet;
      DCOM1: TSocketConnection;
      cdsCia: TwwClientDataSet;
      cdsCuenta: TwwClientDataSet;
      cdsMoneda: TwwClientDataSet;
      cdsProvee: TwwClientDataSet;
      cdsCCosto: TwwClientDataSet;
      dsCia: TwwDataSource;
      dsCuenta: TwwDataSource;
      dsMoneda: TwwDataSource;
      dsProvee: TwwDataSource;
      dsCCosto: TwwDataSource;
      cdsTCambio: TwwClientDataSet;
      dsTCambio: TwwDataSource;
      cdsTipDoc: TwwClientDataSet;
      dsTipDoc: TwwDataSource;
      cdsUbica: TwwClientDataSet;
      dsUbica: TwwDataSource;
      cdsAdqui: TwwClientDataSet;
      dsAdqui: TwwDataSource;
      cdsLocalidad: TwwClientDataSet;
      cdsMaterial: TwwClientDataSet;
      dsMaterial: TwwDataSource;
      dsLocalidad: TwwDataSource;
      cdsRefor: TwwClientDataSet;
      cdsTraslado: TwwClientDataSet;
      dsRefor: TwwDataSource;
      dsTraslado: TwwDataSource;
      cdsActFij3: TwwClientDataSet;
      dsActFij3: TwwDataSource;
      dsFactor: TwwDataSource;
      dsDepre: TwwDataSource;
      cdsUDep: TwwClientDataSet;
      dsUDep: TwwDataSource;
      cdsDesac: TwwClientDataSet;
      dsDesac: TwwDataSource;
      cdsAFCC: TwwClientDataSet;
      dsAFCC: TwwDataSource;
      dsDepre2: TwwDataSource;
      cdsActFij4: TwwClientDataSet;
      dsActFij4: TwwDataSource;
      dsWork1: TwwDataSource;
      cdsDepre: TwwClientDataSet;
      cdsFactor: TwwClientDataSet;
      cdsDepre2: TwwClientDataSet;
      cdsWork1: TwwClientDataSet;
      cdsWork2: TwwClientDataSet;
      dsWork2: TwwDataSource;
      cdsUsuarios: TwwClientDataSet;
      cdsMGrupo: TwwClientDataSet;
      cdsGrupos: TwwClientDataSet;
      cdsAcceso: TwwClientDataSet;
      dsUsuarios: TwwDataSource;
      dsMGrupo: TwwDataSource;
      dsGrupos: TwwDataSource;
      dsAcceso: TwwDataSource;
      cdsNivel: TwwClientDataSet;
      dsNivel: TwwDataSource;
      cdsCompras: TwwClientDataSet;
      dsCompras: TwwDataSource;
      cdsInvC: TwwClientDataSet;
      cdsInvD: TwwClientDataSet;
      dsInvC: TwwDataSource;
      dsInvD: TwwDataSource;
      cdsTrab: TwwClientDataSet;
      dsTrab: TwwDataSource;
      cdsMotivo: TwwClientDataSet;
      dsMotivo: TwwDataSource;
      cdsTrasPen: TwwClientDataSet;
      cdsTrasSel: TwwClientDataSet;
      dsTrasPen: TwwDataSource;
      dsTrasSel: TwwDataSource;
      dsQry: TwwDataSource;
      cdsReva: TwwClientDataSet;
      cdsRevaDet: TwwClientDataSet;
      dsReva: TwwDataSource;
      dsRevaDet: TwwDataSource;
      cdsTDiario: TwwClientDataSet;
      cdsCta: TwwClientDataSet;
      cdsACFCont: TwwClientDataSet;
      dsACFCon: TwwDataSource;
      cdsMovCNT: TwwClientDataSet;
      cdsQry2: TwwClientDataSet;
      cdsEstado: TwwClientDataSet;
      dsEstado: TwwDataSource;
      cdsActFij: TwwClientDataSet;
      dsActFij: TwwDataSource;
      dsQry2: TwwDataSource;
      cdsCNT311: TwwClientDataSet;
      dsCNT311: TwwDataSource;
      cdsResultSet: TwwClientDataSet;
      cdsLimReCab: TwwClientDataSet;
      dsLimReCab: TwwDataSource;
      dsLimReDet: TwwDataSource;
      cdsLimReDet: TwwClientDataSet;
      cdsQry3: TwwClientDataSet;
      cdsTem1: TwwClientDataSet;
      dsTem1: TwwDataSource;
      dsUser: TwwDataSource;
      cdsUser: TwwClientDataSet;
      cdsPiso: TwwClientDataSet;
      dsPiso: TwwDataSource;
      cdsArea: TwwClientDataSet;
      dsArea: TwwDataSource;
      cdsAmbiente: TwwClientDataSet;
      dsAmbiente: TwwDataSource;
      cdsResponsable: TwwClientDataSet;
      dsResponsable: TwwDataSource;
      cdsLocal: TwwClientDataSet;
      dsLocal: TwwDataSource;
      cdsCabTraslado: TwwClientDataSet;
      dsCabTraslado: TwwDataSource;
      cdsResponsab: TwwClientDataSet;
      dsResponsab: TwwDataSource;
      cdsInventario: TwwClientDataSet;
      dsInventario: TwwDataSource;
      cdsUbicAnterior: TwwClientDataSet;
      dsUbicAnterior: TwwDataSource;
      cdsInvTras: TwwClientDataSet;
      dsInvTras: TwwDataSource;
      cdsInvtAct: TwwClientDataSet;
      dsInvtAct: TwwDataSource;
      cdsBusca: TwwClientDataSet;
      dsBusca: TwwDataSource;
      cdsMotivos: TwwClientDataSet;
      dsMotivos: TwwDataSource;
      cdsDocs: TwwClientDataSet;
      dsDocs: TwwDataSource;
      cdsUsuario: TwwClientDataSet;
      dsUsuario: TwwDataSource;
      cdsVistas: TwwClientDataSet;
      dsVistas: TwwDataSource;
      cdsQry10: TwwClientDataSet;
      cdsQry8: TwwClientDataSet;
      cdsQry9: TwwClientDataSet;
      cdsQry7: TwwClientDataSet;
      cdsQry6: TwwClientDataSet;
      cdsCia1: TwwClientDataSet;
      dsQry9: TwwDataSource;
      dsQry10: TwwDataSource;
      cdsCuentaDep: TwwClientDataSet;
      dsCuentadep: TwwDataSource;  
// Inicio HPC_201801_ACF 
// Se adicionó un nuevo ClientDataset 
    cdsQry11: TwwClientDataSet;
    dsQry11: TwwDataSource;
// Fin HPC_201801_ACF
      Function StrZero(wNumero, wLargo: integer): String;
      Procedure AplicaDatos(wCDS: TwwClientDataSet; wNomArch: String);
      Procedure ControlTran;
      Procedure cdsActFijAfterApplyUpdates(Sender: TObject;
         Var OwnerData: OleVariant);

      Procedure DataModuleCreate(Sender: TObject);
      Procedure cdsMonedaAfterOpen(DataSet: TDataSet);
      Procedure cdsInvCReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);

   Private
    { Private declarations }
   Public
    { Public declarations }
      cIP, wOfiId, widepc, ideconex, fechorcon: String;
      xResp: String;
      wNombreUsuario: String;

      wRepFuncDate,
         wFormatFecha,
         wReplacCeros, wRepHorServi,
         wRepFecServi: String;
      wveperbol: String;

      wTIPOREG1: String;
      wTIPOREG2: String;
      wJK: String; // '1' habilita, '0' deshabilita - el onEdit y onInsert del MantControlOpe.
      wModo, wAdmin, wboton, wtitulo, wCierraCds, wDescripcion: String;
      wTMonExt: String; // Tipo de Moneda extranjera oficial
      wTMonLoc: String;

    // Accesos al Sistema
      wUsuario: String;
      wObjetoDescr: String;
      wObjetoForma: String;
      wObjetoNombr: String;
      wObjetoDesPr: String;
      wModulo: String;
      wGrupo: String;
      wGrupoTmp: String;
      wComponente: TControl;

      wVRN_TipoCambio: String;
      wVRN_TCambioFijo: String;
      sClose, wSRV: String;

      wTipoAdicion: String; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa

    // Fin Accesos al Sistema
      Procedure GeneraContabilidad(xxCia, xxTDiario, xxAnoMM, xxNoComp: String;
         xForma: TForm; Sender: TObject);
      Procedure Tranferencia_CXP_a_CNT(xCia, xTDia, xAAMM, xNoComp: String);
      Function Contabiliza(xCia, xTDiario, xAnoMM, xNoComp: String; Sender: TObject): Boolean;
      Procedure GeneraEnLinea401(xxxCia, xxxDiario, xxxAnoMM, xxxNoComp: String);
      Function CuentaExiste(xxxxCia, xxxxAno, xxxxCuenta, xxxxAux,
         xxxxCCos: String): Boolean;
      Procedure ActualizaMov(cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto, cDH, cMov,
         cCtaDes, cAuxDes, cCCoDes, cNivel: String;
         nImpMN, nImpME: Single);
      Procedure InsertaMov(cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto, cDH, cMov,
         cCtaDes, cAuxDes, cCCoDes, cNivel: String;
         nImpMN, nImpME: Single);
      Procedure AbrirCDS(xxCds: TwwClientDataSet);
      Procedure FiltraTabla(xxCds: TwwClientDataSet; xxArchivo, xxCampo: String);

      Procedure CreaPanel(xForma: TForm; xMensaje: String);
      Procedure PanelMsg(xMensaje: String; xProc: Integer);
      Function DesEncripta(wPalabra: String): String;
      Function Encripta(wPalabra: String): String;
      Function FindCiaId(wxLocal, wxPiso, wxArea, wxAmbiente: String): String;

    // Para Accesos
      Procedure AccesosUsuarios(xxModulo, xxUsuario, xxTipo, xxForma: String);
      Procedure AccesosUsuariosR(xxModulo, xxUsuario, xxTipo: String; xxForma: TForm);
      Function BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
      Procedure AntesDeGrabar(xxCds: TwwClientDataSet);
      Function OperClientDataSet(ClientDataSet: TwwClientDataSet;
         Expression, Condicion: String): Double;
      Function DisplayDescrip(wPrv, wTabla, wCampos, wCondicion, wResult: String): String;
      Procedure DisminuyeForma(Sender: TObject);
      Procedure ActualizaFiltro(wwFiltro: TMant; wwCdsLee: TwwClientDataSet; wwAccion: String);
      Procedure AbreCDS(xxCds: TwwClientDataSet; xxSQL, xxIndices, xxFiltro: String);
      Function DisplayReal(wPrv, wTabla, wCampos, wWhere, wResult: String): DOUBLE;
    // End Accesos

      Function ObtenerIpdeNetbios(Host: String): String;
      Function ComputerName: String;
      Function AccesosModulo: Boolean;
      Function fg_VerificaVersion(wgVersion: String): Boolean;
      Function wf_AccesoOpcion(wOpcion: String): Boolean;

//    ErrorCount : Integer;
   End;

Var
   SRV_E: String;
   SRV_D: String;
   SRV_V: String;
   wRptCia, wRutaRpt, wUrqCia: String;
   xSql, xWhere1, xWhere2, xCtas1, xctas2, xCta: String;
   DMAF: TDMAF;
   pnlConta: TPanel;
   pbConta: TProgressBar;
   xIndice: String;
   xFiltro: String;
   wRepHorServi,
      wRepFuncDate,
      wFormatFecha,
      wReplacCeros, wRepFecServi: String;

Procedure cdsPost(xxCds: TwwClientDataSet);
Procedure Filtracds(xxCds: TwwClientDataSet; xxSQL: String);
Function BuscaUltNumero(ssCia: String): String;
Function FRound(xReal: Real; xEnteros, xDecimal: Integer): Real;
Function BuscaDescripcion(wCDS: TwwClientDataSet; wCondicion, wResult: String
   ): String;

Implementation

{$R *.DFM}

Uses ACF020;

Procedure cdsPost(xxCds: TwwClientDataSet);
Var
   i: integer;
Begin
   For i := 0 To xxCds.Fields.Count - 1 Do
   Begin

      If xxCds.Fields[i].ClassType = TStringField Then
      Begin
         If xxCds.Fields[i].AsString = '' Then
            xxCds.Fields[i].Clear;
      End;

      If xxCds.Fields[i].ClassType = TMemoField Then
      Begin
         If xxCds.Fields[i].AsString = '' Then
            xxCds.Fields[i].AsString := '.';

         If trim(xxCds.Fields[i].AsString) = '' Then
            xxCds.Fields[i].AsString := '.';
      End;
   End;
End;

Procedure Filtracds(xxCds: TwwClientDataSet; xxSQL: String);
Begin
   If Length(xxSQL) > 0 Then
   Begin
      xxSQL := UpperCase(xxSQL);
      xxCds.Close;
      xxCds.DataRequest(xxSQL);
   End;

   xxCds.Open;
End;

Procedure TDMAF.AccesosUsuarios(xxModulo, xxUsuario, xxTipo, xxForma: String);
Begin
   If Trim(cdsUsuarios.FieldByName('GRUPOID').AsString) = '' Then
   Begin
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByName('USERID').AsString := xxUsuario;
      If Not cdsUsuarios.GotoKey Then Exit;
   End;

   cdsGrupos.Filter := '';
   If xxTipo = '1' Then
   Begin
      cdsGrupos.Filter := 'GrupoID=' + '''' + cdsUsuarios.FieldByName('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;

   If xxTipo = '2' Then
   Begin
      cdsGrupos.Filter := 'GrupoID=' + '''' + cdsUsuarios.FieldByName('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Forma=' + '''' + xxForma + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         If (wComponente.Name = 'Z2bbtnModifica') Or
            (wComponente.Name = 'Z2bbtnConsulta') Then
            wComponente.Enabled := False
         Else
         Begin
            wComponente.Visible := False;
         End;
         cdsGrupos.Next;
      End;
   End;

End;

Procedure TDMAF.AccesosUsuariosR(xxModulo, xxUsuario, xxTipo: String; xxForma: TForm);
Begin
   If Trim(cdsUsuarios.FieldByName('GRUPOID').AsString) = '' Then
   Begin
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByName('USERID').AsString := xxUsuario;
      If Not cdsUsuarios.GotoKey Then Exit;
   End;

   cdsGrupos.Filter := '';
   If xxTipo = '1' Then
   Begin
      cdsGrupos.Filter := 'GrupoID=' + '''' + cdsUsuarios.FieldByName('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;

      If DMAF.wAdmin = 'G' Then Exit;

      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;

   If xxTipo = '2' Then
   Begin
      cdsGrupos.Filter := 'GrupoID=' + '''' + cdsUsuarios.FieldByName('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Forma=' + '''' + xxForma.Name + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;

      If DMAF.wAdmin = 'G' Then Exit;

      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma);
         If (wComponente.Name = 'Z2bbtnModifica') Or
            (wComponente.Name = 'Z2bbtnConsulta') Then
            wComponente.Enabled := False
         Else
         Begin
            wComponente.Visible := False;
         End;
         cdsGrupos.Next;
      End;
   End;

End;

Function TDMAF.BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
Var
   ic: Integer;
Begin
   ic := xForm.ComponentCount - 1;
   While (xForm.Components[ic].Name <> xNombre) And (ic > -1) Do
   Begin
      Dec(ic);
   End;
   If xForm.Components[ic].Name = xNombre Then
      Result := TControl(xForm.Components[ic]);
End;

Function BuscaDescripcion(wCDS: TwwClientDataSet; wCondicion, wResult: String
   ): String;
Var
   xSQL: String;
   wTemCds: TwwClientDataSet;
Begin
   wTemCds := TwwClientDataSet.Create(Nil);
   wTemCds.CloneCursor(wCDS, True);
   wTemCds.Filtered := False;
   wTemCds.Filter := '';
   wTemCds.Filter := wCondicion;
   wTemCds.Filtered := True;
   If wTemCds.RecordCount > 0 Then
      result := wTemCds.FieldByName(wResult).AsString
   Else
      result := '';

   wTemCds.Free;
End;

Function FRound(xReal: Real; xEnteros, xDecimal: Integer): Real;
Var
   xNum: String;
   code: Integer;
   xNReal: Real;
Begin
   xNum := Floattostrf(xReal, ffFixed, xEnteros, xDecimal);
   Val(xNum, xNReal, code);
   Result := xNReal;
End;

Function BuscaUltNumero(ssCia: String): String;
Var
   xSQL, xWhere: String;
   nLen, xRes: Integer;
Begin
   xWhere := 'CIAID=''' + ssCia + '''';
   xSQL := '';
   xSQL := 'Select max(INVNUM) as MaxNum from ACF301';
   If length(xWhere) > 0 Then xSQL := xSQL + ' Where ' + xWhere;
   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName := 'dspTGE';
   DMAF.cdsQry.DataRequest(xSQL); //esta es la llamada remota al provider del servidor
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.FieldByName('MaxNum').Value = null Then
      result := '0000000001'
   Else
   Begin
      nLen := Length(DMAF.cdsQry.FieldByName('MaxNum').AsString);
      If nLen <= 10 Then
      Begin
         xRes := strtoint(Trim(DMAF.cdsQry.FieldByName('MaxNum').AsString)) + 1;
         result := DMAF.StrZero(xRes, nLen);
      End;
   End;
End;

Procedure TDMAF.AplicaDatos(wCDS: TwwClientDataSet; wNomArch: String);
Var
   Delta, Results, OwnerData: OleVariant;
   ErrorCount: Integer;
Begin
   If (wCDS.Modified) Or (wCDS.changeCount > 0) Then
   Begin
      wCDS.CheckBrowseMode;
      Results := DCOM1.AppServer.AS_ApplyUpdates(wCDS.ProviderName, wcds.Delta, -1,
         ErrorCount, OwnerData);
      cdsResultSet.Data := Results;
      wCDS.Reconcile(Results);
      If ErrorCount > 0 Then
         showmessage('Registro NO grabado');
   End;
End;

Function TDMAF.DisplayDescrip(wPrv, wTabla, wCampos, wCondicion, wResult: String): String;
Var
   xSQL: String;
Begin
   xSQL := ''; // se inicializa variable xSQL en blanco
   xSQL := 'Select ' + wCampos + ' from ' + wTabla; // se arma sentencia Select con parámetros recibidos
   If length(wCondicion) > 0 Then xSQL := xSQL + ' where ' + wCondicion; // si hay condición se añade a SQL
   cdsQry.Close; // se desactiva o cierra el clientdataset variable
   cdsQry.ProviderName := wPrv; // se asigna propiedad provider del clientdataset con parámetro
   cdsQry.DataRequest(xSQL); // llamada remota al provider del servidor
   // en este punto se tiene las propiedades que faltaban (provider para el clientdataset
   // y sentencia SQL para el query del servidor)
   cdsQry.Open; // se activa o abre cds
   result := cdsQry.FieldByName(wResult).AsString
End;

Function TDMAF.StrZero(wNumero, wLargo: integer): String;
Var
   x: integer;
   wNumStr: String;
Begin
   wNumStr := '';
   For x := 1 To wLargo Do
   Begin
      wNumStr := wNumStr + '0';
   End;
   wNumStr := wNumStr + inttostr(wNumero); // 0000000+200014 = 0000000200014
   result := copy(wNumStr, length(wNumStr) - wLargo + 1, wLargo); //
End;

Procedure TDMAF.cdsActFijAfterApplyUpdates(Sender: TObject;
   Var OwnerData: OleVariant);
Begin
   SHOWMESSAGE('1');
End;

Procedure TDMAF.ControlTran;
Var
   wError: String;
Begin
//   wError:='0';
//   DMAF.DCOM1.AppServer.StartTran('TGE');
   If (cdsReva.ChangeCount > 0) Or (cdsReva.Modified) Then
      DMAF.AplicaDatos(DMAF.cdsReva, 'REVA');
   If (cdsRevaDet.ChangeCount > 0) Or (cdsRevaDet.Modified) Then
      DMAF.AplicaDatos(DMAF.cdsRevaDet, 'REVADET');
   If (cdsActFij.ChangeCount > 0) Or (cdsActFij.Modified) Then
      DMAF.AplicaDatos(DMAF.cdsActFij, 'ACTFIJ');
   If (cdsDepre.ChangeCount > 0) Or (cdsDepre.Modified) Then
      DMAF.AplicaDatos(DMAF.cdsDepre, 'DEPRECONT');
   If (cdsAFCC.ChangeCount > 0) Or (cdsAFCC.Modified) Then
      DMAF.AplicaDatos(DMAF.cdsAFCC, 'CCOSTO');
   If (cdsWork2.ChangeCount > 0) Or (cdsWork2.Modified) Then
      DMAF.AplicaDatos(DMAF.cdsWork2, 'DEPRECONT');
   If (cdsRefor.ChangeCount > 0) Or (cdsRefor.Modified) Then
      DMAF.AplicaDatos(DMAF.cdsRefor, 'REFORMA');
   If (cdsTipAct.ChangeCount > 0) Or (cdsTipAct.Modified) Then
      DMAF.AplicaDatos(DMAF.cdsTipAct, 'TIPACT');
   If (cdsInvC.ChangeCount > 0) Or (cdsInvC.Modified) Then
      DMAF.AplicaDatos(DMAF.cdsInvC, 'INVC');
   If (cdsInvD.ChangeCount > 0) Or (cdsInvD.Modified) Then
      DMAF.AplicaDatos(DMAF.cdsInvD, 'INVD');
   If (cdsCompras.ChangeCount > 0) Or (cdsCompras.Modified) Then
      DMAF.AplicaDatos(DMAF.cdsCompras, 'COMPRAS');

{   if wError='1' then
      DMAF.DCOM1.AppServer.RollBackTran('TGE')
   else}
//   DMAF.DCOM1.AppServer.CommitTran('TGE');
End;

Procedure TDMAF.DataModuleCreate(Sender: TObject);
Var
   ssql, xWhere, xSQL2: String;
   inifile: TIniFile;
   D, M, Y: WORD;
Begin
   Screen.Cursor := crHourGlass;
   DCOM1.Connected := False;

   If ParamStr(1) = '' Then
   Begin
      inifile := TIniFile.Create(ExtractFilePath(application.ExeName) + '\oaCfg.ini');
      DCOM1.Address := IniFile.ReadString('TCPIP', 'ADDRESS', '');
      wSRV := IniFile.ReadString('MOTOR', 'NAME', '');
   End;

   Try
      DCOM1.Connected := true;
   Except
     // por no realizar la conexion
      SHOWMESSAGE('ERROR de Conexión.');
      Exit;
   End;

   Try
      cIP := DMAF.ObtenerIpdeNetbios(DMAF.computerName);
   Except
      ShowMessage('ERROR de Conexión.');
      DCOM1.Connected := False;
      Exit;
   End;

//   DecodeDate(DateS, Y, M, D);
   DecodeDate(Date, Y, M, D);
   FCtrlAcceso := TFCtrlAcceso.Create(Application);
   wModulo := 'ACF';
   FCtrlAcceso.wDCOM1 := DCOM1;
   Screen.Cursor := crHourGlass;

   FCtrlAcceso.ShowModal;

   If FCtrlAcceso.cAccesoSistema = 'S' Then
   Begin
      wUsuario := FCtrlAcceso.dbeUsuario.Text;
      FCtrlAcceso.free;
   End
   Else
   Begin
      DCOM1.Connected := False;
      FCtrlAcceso.free;
      sClose := '1';
      Exit;
   End;

   If Not AccesosModulo Then
   Begin
      DCOM1.Connected := False;
      Screen.Cursor := CrDefault;
   End
   Else
   Begin
      wModulo := 'ACF';
      xSQL2 := 'Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, B.OBJETO, B.FORMA, C.GRUPOADM '
         + '      from TGE007 A, TGE001 B, TGE003 C '
         + '     where A.USERID=''' + wUsuario + ''' '
         + '       and A.GRUPOID=B.GRUPOID(+) and B.MODULOID=''' + wModulo + ''''
         + '       and A.GRUPOID=C.GRUPOID(+)';
      cdsUsuarios.Close;
      cdsUsuarios.DataRequest(xSQL2);
      cdsUsuarios.Open;

      wGrupo := cdsUsuarios.FieldByName('GRUPOID').AsString;

      cdsMGrupo.Open;
      cdsGrupos.Open;
      xSQL2 := 'Select * from TGE004 where USERID=''' + wUsuario + ''' order by USERID, NTABLA, CODIGO';
      cdsAcceso.Close;
      cdsAcceso.DataRequest(xSQL2);
      cdsAcceso.Open;

      wAdmin := cdsUsuarios.fieldbyname('GrupoAdm').AsString;

      DisplayDescrip('dspTGE', 'OAREGLAS', '*', '', 'VRN_TCAM');
      wVRN_TipoCambio := cdsqry.FieldByName('VRN_TCAM').AsString;
      wVRN_TCambioFijo := cdsqry.FieldByName('VRN_TCFIJO').AsString;
      DisplayDescrip('dspTGE', 'OACONFIG_ANT', '*', '', 'SRV_DB');
      SRV_E := cdsqry.fieldbyname('SRV_EQUIP').AsString;
      SRV_D := cdsqry.fieldbyname('SRV_DB').AsString;
      SRV_V := cdsqry.fieldbyname('SRV_VERS').AsString;
      wRptCia := cdsqry.fieldbyname('RPTCIA').AsString;
      wUrqCia := cdsqry.fieldbyname('URQCIA').AsString;

      wRutaRpt := 'RTMS\' + wModulo + '\' + wRptCia;
      wRutaRpt := 'RTMS\';

      wFormatFecha := 'DD/MM/YYYY';
      wReplacCeros := 'NVL';
      wRepFecServi := 'SYSDATE';
      wRepHorServi := 'SYSDATE';
      wRepFuncDate := 'TO_DATE(';

      AbrirCDS(cdsAcceso);
      FiltraTabla(cdsCia, 'TGE101', 'CIAID');
      FiltraTabla(cdsMoneda, 'TGE103', 'TMONID');
      FiltraTabla(cdsProvee, 'TGE201', 'PROV');
      FiltraTabla(cdsTipDoc, 'TGE110', 'DOCID');
      FiltraTabla(cdsUbica, 'TGE117', 'UBICID');
      FiltraTabla(cdsAdqui, 'TGE177', 'TIPADQUI');
      FiltraTabla(cdsTCambio, 'TGE107', 'TMONID');
      FiltraTabla(cdsLocalidad, 'TGE126', 'LOCID');
      FiltraTabla(cdsMaterial, 'TGE178', 'MATERIALID');
      FiltraTabla(cdsRefor, 'ACF203', 'ACFID');
      FiltraTabla(cdsFactor, 'ACF102', 'FAPERIODO');
      FiltraTabla(cdsNivel, 'ACF107', 'NIVEL');
      FiltraTabla(cdsTrab, 'ACF207', 'TRABID');
      FiltraTabla(cdsDesac, 'ACF105', 'DESACID');
      FiltraTabla(cdsEstado, 'ACF109', 'ESTADOID');
      FiltraTabla(cdsMotivo, 'ACF108', 'MOTID');
      FiltraTabla(cdsResponsable, 'ACF126', 'RECIBEID');
      cdsQry.Close;
      cdsQry.datarequest('select * from SOLCONFIG');
      cdsQry.Open;
      xCtas1 := Trim(cdsQry.FieldByName('ACFCTAS1').AsString);
      xCtas2 := Trim(cdsQry.FieldByName('ACFCTAS2').AsString);
      xWhere1 := '';
      xWhere2 := '';

      While Length(xCtas1) > 0 Do
      Begin

         If Pos('.', xCtas1) > 0 Then
         Begin
            xCta := Trim(Copy(xCtas1, 1, Pos('.', xCtas1) - 1));
            xCtas1 := Copy(xCtas1, Pos('.', xCtas1) + 1, 20);
         End
         Else
         Begin
            xCta := Trim(Copy(xCtas1, 1, Pos('.', xCtas1) - 1));
            xCtas1 := Copy(xCtas1, Pos('.', xCtas1) + 1, 20);
         End;
         If Length(xCta) > 0 Then
         Begin
            If Length(xWhere1) = 0 Then
               xWhere1 := ' ( SUBSTR( CUENTAID,1,' + IntToStr(Length(xCta)) + ')=''' + xCta + ''' '
            Else
               xWhere1 := xWhere1 + 'or SUBSTR( CUENTAID,1,' + IntToStr(Length(xCta)) + ')=''' + xCta + ''' '
         End;
      End;
      If Length(xWhere1) > 0 Then
         xWhere1 := xWhere1 + ' ) ';
     // cuentas de depreciacion
      While Length(xCtas2) > 0 Do
      Begin

         If Pos('.', xCtas2) > 0 Then
         Begin
            xCta := Trim(Copy(xCtas2, 1, Pos('.', xCtas2) - 1));
            xCtas2 := Copy(xCtas2, Pos('.', xCtas2) + 1, 20);
         End
         Else
         Begin
            xCta := Trim(Copy(xCtas2, 1, Pos('.', xCtas2) - 1));
            xCtas2 := Copy(xCtas2, Pos('.', xCtas2) + 1, 20);
         End;
         If Length(xCta) > 0 Then
         Begin
            If Length(xWhere2) = 0 Then
               xWhere2 := ' ( SUBSTR( CUENTAID,1,' + IntToStr(Length(xCta)) + ')=''' + xCta + ''' '
            Else
               xWhere2 := xWhere2 + 'or SUBSTR( CUENTAID,1,' + IntToStr(Length(xCta)) + ')=''' + xCta + ''' '
         End;
      End;
      If Length(xWhere2) > 0 Then
         xWhere2 := xWhere2 + ' ) ';

      xSQL := 'SELECT DISTINCT A.CUENTAID, B.CTADES FROM ACF110 A, TGE202 B WHERE A.CUENTAID=B.CUENTAID ';
      cdsCUENTA.Close;
      cdsCuenta.DataRequest(xSQL);
      cdsCUENTA.IndexFieldNames := 'CUENTAID';
      cdsCUENTA.Open;

      xSQL := 'SELECT * FROM TGE202 '
         + 'WHERE ' + xWhere2 + ' AND CTA_MOV = ''S'' ';
      cdsCTA.Close;
      cdsCTA.DataRequest(xSQL);
      cdsCTA.IndexFieldNames := 'CUENTAID';
      cdsCTA.Open;

      xSQL := 'SELECT * FROM TGE203 WHERE CCOSMOV = ''S'' ';
      cdsCCosto.Close;
      cdsCCosto.DataRequest(xSQL);
      cdsCCosto.Open;
   End;
End;

Procedure TDMAF.cdsMonedaAfterOpen(DataSet: TDataSet);
Var
   xWhere: String;
Begin
   // determina Tipo de Moneda Extranjera Oficial (normalmente dólares)
   xWhere := 'TMon_Loc=' + '''' + 'E' + '''';
   wTMonExt := DisplayDescrip('dspTGE', 'TGE103', '*', xWhere, 'TMonId');

   xWhere := 'TMon_Loc=' + '''' + 'L' + '''';
   wTMonLoc := DisplayDescrip('dspTGE', 'TGE103', '*', xWhere, 'TMonId');

End;

/////////////////////////////////////////////
/////////////////////////////////////////////
///                                       ///
///    PROCEDIMIENTOS PARA CONTABILIDAD   ///
///                                       ///
/////////////////////////////////////////////
/////////////////////////////////////////////

Procedure TDMAF.GeneraContabilidad(xxCia, xxTDiario, xxAnoMM, xxNoComp: String;
   xForma: TForm; Sender: TObject);
Var
   xSQL: String;
Begin
   ////  Contabilización en Linea: requiere que en el DM del módulo exista
   ////  cdsMOVCNT debe hacer referencia a la tabla CNT301

   CreaPanel(xForma, 'Contabilizando');

   Tranferencia_CXP_a_CNT(xxCia, xxTDiario, xxAnoMM, xxNoComp);

   If Contabiliza(xxCia, xxTDiario, xxAnoMM, xxNoComp, Sender) Then
      PanelMsg('Asiento Contabilizando Final', 0);

   pnlConta.Free;
End;

Procedure TDMAF.Tranferencia_CXP_a_CNT(xCia, xTDia, xAAMM, xNoComp: String);
Var
   xSQL: String;
   xContR: Integer;
   cdsDetCxP, cdsDetCxP2: TwwClientDataSet;
Begin
  // 2
   PanelMsg('Transfiriendo Asiento a Contabilidad', 0);

   cdsDetCxP := TwwClientDataSet.Create(Self);
   cdsDetCxP.RemoteServer := DCOM1;
   cdsDetCxP.ProviderName := 'dspTGE';

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL :=
         'SELECT ACF306.CIAID, ACF306.TDIARID, ACF306.CNTANOMM, ACF306.CNTCOMPROB, ACF306.CUENTAID, '
         + 'CASE WHEN B.CTA_AUX =''S'' THEN ACF306.CLAUXID  ELSE '''' END CLAUXID, '
         + 'CASE WHEN B.CTA_AUX =''S'' THEN ACF306.AUXID    ELSE '''' END AUXID, '
         + 'CASE WHEN B.CTA_AUX =''S'' THEN D.PROVABR       ELSE '''' END PROVABR, '
         + 'CASE WHEN B.CTA_CCOS=''S'' THEN ACF306.CCOSID   ELSE '''' END CCOSID, '
         + 'CASE WHEN B.CTA_CCOS=''S'' THEN F.CCOSABR       ELSE '''' END CCOSABR, '
         + 'CASE WHEN B.CTA_DOC =''S'' THEN ACF306.DOCID    ELSE '''' END DOCID, '
         + 'CASE WHEN B.CTA_DOC =''S'' THEN ACF306.CNTSERIE ELSE '''' END CNTSERIE, '
         + 'CASE WHEN B.CTA_DOC =''S'' THEN ACF306.CNTNODOC ELSE '''' END CNTNODOC, '
         + 'CASE WHEN B.CTA_DOC =''S'' THEN E.DOCABR        ELSE '''' END DOCABR, '
         + '''ACF'' MODULO, '
         + 'ACF306.CNTGLOSA, ACF306.CNTDH, ACF306.CNTTCAMBIO, '
         + 'ACF306.CNTMTOORI, '
         + 'ACF306.CNTMTOLOC, '
         + 'ACF306.CNTMTOEXT, '
         + 'ACF306.CNTFEMIS, ACF306.CNTFVCMTO, ACF306.CNTFCOMP, ACF306.CNTESTADO, '
         + 'ACF306.CNTUSER, ' + wRepFecServi + ' FECHA,' + wRepHorServi + ' HORA, ACF306.CNTMM, ACF306.CNTDD, '
         + 'ACF306.CNTTRI,  ACF306.CNTSEM, ACF306.CNTANO, ACF306.CNTSS, ACF306.CNTAATRI, ACF306.CNTAASEM, '
         + 'ACF306.CNTAASS, ACF306.TMONID, ''S'' CNTCUADRE, B.CTAABR, C.TDIARABR, ''Z'' FLAGVAR, ACF306.CNTLOTE, '
         + 'ACF306.CNTDEBEMN, ACF306.CNTDEBEME, ACF306.CNTHABEMN, ACF306.CNTHABEME '
         + 'FROM ACF306 '
         + 'LEFT JOIN TGE202 B ON ( ACF306.CIAID=B.CIAID AND ACF306.CUENTAID=B.CUENTAID ) '
         + 'LEFT JOIN TGE104 C ON ( ACF306.TDIARID =C.TDIARID ) '
         + 'LEFT JOIN TGE201 D ON ( ACF306.CLAUXID=D.CLAUXID AND ACF306.AUXID=D.PROV ) '
         + 'LEFT JOIN TGE110 E ON ( E.DOCMOD=''CXP'' AND ACF306.DOCID=E.DOCID ) '
         + 'LEFT JOIN TGE203 F ON ( ACF306.CCOSID=F.CCOSID  ) '
         + 'WHERE ACF306.CIAID=' + '''' + xCia + '''' + ' AND '
         + 'ACF306.TDIARID=' + '''' + xTDia + '''' + ' AND '
         + 'ACF306.CNTANOMM=' + '''' + xAAMM + '''' + ' AND '
         + 'ACF306.CNTCOMPROB=' + '''' + xNoComp + '''';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         xSQL :=
            'SELECT ACF306.CIAID, ACF306.TDIARID, ACF306.CNTANOMM, ACF306.CNTCOMPROB, ACF306.CUENTAID, '
            + ' DECODE( B.CTA_AUX ,''S'',ACF306.CLAUXID,'''')  CLAUXID, '
            + ' DECODE( B.CTA_AUX ,''S'',ACF306.AUXID, '''' ) AUXID, '
            + ' DECODE( B.CTA_AUX ,''S'',D.PROVABR   , '''' ) PROVABR, '
            + 'DECODE ( B.CTA_CCOS,''S'',ACF306.CCOSID, '''') CCOSID, '
            + 'DECODE ( B.CTA_CCOS,''S'',F.CCOSABR , '''' ) CCOSABR, '
            + 'DECODE ( B.CTA_DOC ,''S'',ACF306.DOCID,'''')  DOCID, '
            + 'DECODE ( B.CTA_DOC ,''S'',ACF306.CNTSERIE, '''')  CNTSERIE, '
            + 'DECODE ( B.CTA_DOC ,''S'',ACF306.CNTNODOC, '''') CNTNODOC, '
            + 'DECODE ( B.CTA_DOC ,''S'',E.DOCABR      ,'''')  DOCABR, '
            + '''ACF'' MODULO, '
            + 'ACF306.CNTGLOSA, ACF306.CNTDH, ACF306.CNTTCAMBIO, '
            + 'ACF306.CNTMTOORI, '
            + 'ACF306.CNTMTOLOC, '
            + 'ACF306.CNTMTOEXT, '
            + 'ACF306.CNTFEMIS, ACF306.CNTFVCMTO, ACF306.CNTFCOMP, ACF306.CNTESTADO, '
            + 'ACF306.CNTUSER, ' + wRepFecServi + ' FECHA,' + wRepHorServi + ' HORA, ACF306.CNTMM, ACF306.CNTDD, '
            + 'ACF306.CNTTRI,  ACF306.CNTSEM, ACF306.CNTANO, ACF306.CNTSS, ACF306.CNTAATRI, ACF306.CNTAASEM, '
            + 'ACF306.CNTAASS, ACF306.TMONID, ''S'' CNTCUADRE, B.CTAABR, C.TDIARABR, ''Z'' FLAGVAR, ACF306.CNTLOTE, '
            + 'ACF306.CNTDEBEMN, ACF306.CNTDEBEME, ACF306.CNTHABEMN, ACF306.CNTHABEME '
            + 'FROM ACF306,TGE202 B, TGE104 C, TGE201 D,TGE110 E , TGE203 F '
            + 'WHERE ACF306.CIAID=' + '''' + xCia + '''' + ' AND '
            + 'ACF306.TDIARID=' + '''' + xTDia + '''' + ' AND '
            + 'ACF306.CNTANOMM=' + '''' + xAAMM + '''' + ' AND '
            + 'ACF306.CNTCOMPROB=' + '''' + xNoComp + ''' AND ACF306.CIAID=B.CIAID AND ACF306.CUENTAID=B.CUENTAID '
            + ' AND ACF306.TDIARID =C.TDIARID AND ACF306.CLAUXID=D.CLAUXID(+) AND ACF306.AUXID=D.PROV(+) '
            + ' AND E.DOCMOD(+)=''CXP'' AND ACF306.DOCID=E.DOCID(+) AND ACF306.CCOSID=F.CCOSID(+) ';
      End;

   cdsDetCxP.DataRequest(xSQL);
   cdsDetCxP.Open;

   Filtracds(cdsMovCNT, 'Select * from CNT301 Where '
      + 'CIAID=' + '''' + xCia + '''' + ' AND '
      + 'TDIARID=' + '''' + xTDia + '''' + ' AND '
      + 'CNTANOMM=' + '''' + xAAMM + '''' + ' AND '
      + 'CNTCOMPROB=' + '''' + xNoComp + '''');

   xContR := 0;
   cdsDetCxP.First;
   While Not cdsDetCxP.EOF Do
   Begin
      cdsMovCNT.Insert;
      cdsMovCNT.FieldByName('CIAID').Value := cdsDetCxP.FieldByName('CIAID').AsString;
      cdsMovCNT.FieldByName('TDIARID').Value := cdsDetCxP.FieldByName('TDIARID').AsString;
      cdsMovCNT.FieldByName('CNTANOMM').Value := cdsDetCxP.FieldByName('CNTANOMM').AsString;
      cdsMovCNT.FieldByName('CNTCOMPROB').Value := cdsDetCxP.FieldByName('CNTCOMPROB').AsString;
      cdsMovCNT.FieldByName('CUENTAID').Value := cdsDetCxP.FieldByName('CUENTAID').AsString;

      cdsMovCNT.FieldByName('CLAUXID').Value := cdsDetCxP.FieldByName('CLAUXID').AsString;
      cdsMovCNT.FieldByName('AUXID').Value := cdsDetCxP.FieldByName('AUXID').AsString;
      cdsMovCNT.FieldByName('AUXDES').Value := cdsDetCxP.FieldByName('PROVABR').AsString;

      cdsMovCNT.FieldByName('CCOSID').Value := cdsDetCxP.FieldByName('CCOSID').AsString;
      cdsMovCNT.FieldByName('CCOSDES').Value := cdsDetCxP.FieldByName('CCOSABR').AsString;

      cdsMovCNT.FieldByName('DOCID').Value := cdsDetCxP.FieldByName('DOCID').AsString;
      cdsMovCNT.FieldByName('CNTSERIE').Value := cdsDetCxP.FieldByName('CNTSERIE').AsString;
      cdsMovCNT.FieldByName('CNTNODOC').Value := cdsDetCxP.FieldByName('CNTNODOC').AsString;
      cdsMovCNT.FieldByName('DOCDES').Value := cdsDetCxP.FieldByName('DOCABR').AsString;

      cdsMovCNT.FieldByName('CNTMODDOC').Value := cdsDetCxP.FieldByName('MODULO').AsString;
      cdsMovCNT.FieldByName('CNTGLOSA').Value := cdsDetCxP.FieldByName('CNTGLOSA').AsString;
      cdsMovCNT.FieldByName('CNTDH').Value := cdsDetCxP.FieldByName('CNTDH').AsString;

      cdsMovCNT.FieldByName('CNTTCAMBIO').Value := cdsDetCxP.FieldByName('CNTTCAMBIO').AsFloat;

      cdsMovCNT.FieldByName('CNTMTOORI').Value := cdsDetCxP.FieldByName('CNTMTOORI').AsFloat;
      cdsMovCNT.FieldByName('CNTMTOLOC').Value := cdsDetCxP.FieldByName('CNTMTOLOC').AsFloat;
      cdsMovCNT.FieldByName('CNTMTOEXT').Value := cdsDetCxP.FieldByName('CNTMTOEXT').AsFloat;

      cdsMovCNT.FieldByName('CNTFEMIS').Value := cdsDetCxP.FieldByName('CNTFCOMP').AsString;
      cdsMovCNT.FieldByName('CNTFVCMTO').Value := cdsDetCxP.FieldByName('CNTFCOMP').AsString;
      cdsMovCNT.FieldByName('CNTFCOMP').Value := cdsDetCxP.FieldByName('CNTFCOMP').AsString;
      cdsMovCNT.FieldByName('CNTESTADO').Value := cdsDetCxP.FieldByName('CNTESTADO').AsString;
      cdsMovCNT.FieldByName('CNTUSER').Value := DMAF.wUsuario;
      cdsMovCNT.FieldByName('CNTFREG').Value := cdsDetCxP.FieldByName('FECHA').AsDateTime;
      cdsMovCNT.FieldByName('CNTHREG').Value := cdsDetCxP.FieldByName('HORA').AsDateTime;
      cdsMovCNT.FieldByName('CNTMM').Value := cdsDetCxP.FieldByName('CNTMM').AsString;
      cdsMovCNT.FieldByName('CNTDD').Value := cdsDetCxP.FieldByName('CNTDD').AsString;
      cdsMovCNT.FieldByName('CNTTRI').Value := cdsDetCxP.FieldByName('CNTTRI').AsString;
      cdsMovCNT.FieldByName('CNTSEM').Value := cdsDetCxP.FieldByName('CNTSEM').AsString;
      cdsMovCNT.FieldByName('CNTANO').Value := cdsDetCxP.FieldByName('CNTANO').AsString;
      cdsMovCNT.FieldByName('CNTSS').Value := cdsDetCxP.FieldByName('CNTSS').AsString;
      cdsMovCNT.FieldByName('CNTAATRI').Value := cdsDetCxP.FieldByName('CNTAATRI').AsString;
      cdsMovCNT.FieldByName('CNTAASEM').Value := cdsDetCxP.FieldByName('CNTAASEM').AsString;
      cdsMovCNT.FieldByName('CNTAASS').Value := cdsDetCxP.FieldByName('CNTAASS').AsString;
      cdsMovCNT.FieldByName('TMONID').Value := cdsDetCxP.FieldByName('TMONID').AsString;
      cdsMovCNT.FieldByName('CNTCUADRE').Value := cdsDetCxP.FieldByName('CNTCUADRE').AsString;
      cdsMovCNT.FieldByName('CTADES').Value := cdsDetCxP.FieldByName('CTAABR').AsString;
      cdsMovCNT.FieldByName('TDIARDES').Value := cdsDetCxP.FieldByName('TDIARABR').AsString;
      cdsMovCNT.FieldByName('CNTLOTE').Value := cdsDetCxP.FieldByName('CNTLOTE').AsString;

      If cdsDetCxP.FieldByName('CNTDH').AsString = 'D' Then
      Begin
         cdsMovCNT.FieldByName('CNTDEBEMN').Value := cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat;
         cdsMovCNT.FieldByName('CNTDEBEME').Value := 0;
         cdsMovCNT.FieldByName('CNTHABEMN').Value := 0;
         cdsMovCNT.FieldByName('CNTHABEME').Value := 0;
      End;

      If cdsDetCxP.FieldByName('CNTDH').AsString = 'H' Then
      Begin
         cdsMovCNT.FieldByName('CNTHABEMN').Value := cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat;
         cdsMovCNT.FieldByName('CNTHABEME').Value := 0;
         cdsMovCNT.FieldByName('CNTDEBEMN').Value := 0;
         cdsMovCNT.FieldByName('CNTDEBEME').Value := 0;
      End;

      xContR := xContR + 1;
      cdsMovCNT.FieldByName('CNTREG').Value := xContR;

      cdsDetCxP.Next;
   End;

   AplicaDatos(cdsMovCNT, 'MOVCNT');

End;

Function TDMAF.Contabiliza(xCia, xTDiario, xAnoMM, xNoComp: String; Sender: TObject): Boolean;
Var
   xSQL, SSQL, xNREG: String;
   xNumT: Integer;
   iOrden: integer;
   cdsClone: TwwClientDataSet;
   sCIA, sCuenta, sDeHa: String;
   dDebeMN, dHabeMN, dDebeME, dHabeME: double;
Begin
   // 3
   PanelMsg('Generando Asientos Automaticos', 0);

   cdsMovCNT.Last;
   iOrden := cdsMovCNT.FieldByName('CNTREG').AsInteger + 1;

   cdsClone := TwwClientDataSet.Create(Nil);
   cdsClone.RemoteServer := DCOM1;
   cdsClone.ProviderName := 'dspTGE';
   cdsClone.Close;
   sSQL := 'SELECT * FROM CNT301 ';
   sSQL := sSQL
      + ' WHERE CIAID=' + QuotedStr(xCia)
      + ' and TDIARID=' + QuotedStr(xTDiario)
      + ' and CNTCOMPROB=' + QuotedStr(xNoComp)
      + ' and CNTANOMM=' + QuotedStr(xAnoMM);

   cdsClone.DataRequest(sSQL);
   cdsClone.Open;

   cdsMovCNT.DisableControls;
   cdsClone.First;
   While Not cdsClone.EOF Do
   Begin
      sCia := cdsClone.FieldByName('CIAID').AsString;
      sCuenta := cdsClone.FieldByName('CUENTAID').AsString;
      cdsQry2.Close;
      sSQL := ' SELECT CUENTAID,CTAAUT1,CTAAUT2 FROM TGE202 WHERE (CTAAUT1 <> '''' OR CTAAUT1 <> '''') AND CIAID=' + QuotedStr(sCia) + ' AND CUENTAID=' + QuotedStr(sCuenta);
      cdsQry2.Close;
      cdsQry2.ProviderName := 'dspTGE';
      cdsQry2.DataRequest(sSQL);
      cdsQry2.Open;

     // SI ENCUENTA QUE LA CUENTA TIENE AUTOMATICAS
      If cdsQry2.RecordCount > 0 Then
      Begin
         If Not cdsQry2.FieldByName('CTAAUT1').IsNull Then
        //SI TIENE CUENTA AUTOMATICA 1
         Begin
          //SI LA CUENTA ORIGES ESTA DESTINADA AL DEBE LA CUENTA AUTOMATICA 1 IRA AL HABER
            If cdsClone.FieldByName('CNTDH').AsString = 'D' Then
            Begin
               sDeHa := 'D';
               dHabeMN := 0;
               dHabeME := 0;
               dDebeMN := cdsClone.FieldByName('CNTMTOLOC').AsFloat;
               dDebeME := cdsClone.FieldByName('CNTMTOEXT').AsFloat;
            End
            Else
            Begin
               sDeHa := 'H';
               dDebeMN := 0;
               dDebeME := 0;
               dHabeMN := cdsMovCNT.FieldByName('CNTDEBEMN').AsFloat;
               dHabeME := cdsMovCNT.FieldByName('CNTDEBEME').AsFloat;

            End;

            cdsMovCNT.Insert;
            cdsMovCNT.FieldByName('CIAID').AsString := cdsClone.FieldByName('CIAID').AsString;
            cdsMovCNT.FieldByName('TDIARID').AsString := cdsClone.FieldByName('TDIARID').AsString;
            cdsMovCNT.FieldByName('CNTCOMPROB').AsString := cdsClone.FieldByName('CNTCOMPROB').AsString;
            cdsMovCNT.FieldByName('CNTANOMM').AsString := cdsClone.FieldByName('CNTANOMM').AsString;
            cdsMovCNT.FieldByName('CNTANO').AsString := cdsClone.FieldByName('CNTANO').AsString;
            cdsMovCNT.FieldByName('CNTLOTE').AsString := cdsClone.FieldByName('CNTLOTE').AsString;
            cdsMovCNT.FieldByName('CUENTAID').AsString := cdsQry2.FieldByName('CTAAUT1').AsString;
            cdsMovCNT.FieldByName('CLAUXID').AsString := cdsClone.FieldByName('CLAUXID').AsString;
            cdsMovCNT.FieldByName('AUXID').AsString := cdsClone.FieldByName('AUXID').AsString;
            cdsMovCNT.FieldByName('CNTMODDOC').AsString := cdsClone.FieldByName('CNTMODDOC').AsString;
            cdsMovCNT.FieldByName('DOCID').AsString := cdsClone.FieldByName('DOCID').AsString;
            cdsMovCNT.FieldByName('CNTSERIE').AsString := cdsClone.FieldByName('CNTSERIE').AsString;
            cdsMovCNT.FieldByName('CNTNODOC').AsString := cdsClone.FieldByName('CNTNODOC').AsString;
            cdsMovCNT.FieldByName('CNTGLOSA').AsString := cdsClone.FieldByName('CNTGLOSA').AsString;
            cdsMovCNT.FieldByName('CNTDH').AsString := sDeHa;
            cdsMovCNT.FieldByName('CNTTCAMBIO').AsString := cdsClone.FieldByName('CNTTCAMBIO').AsString;
            cdsMovCNT.FieldByName('CNTMTOORI').AsString := cdsClone.FieldByName('CNTMTOORI').AsString;
            cdsMovCNT.FieldByName('CNTMTOLOC').AsString := cdsClone.FieldByName('CNTMTOLOC').AsString;
            cdsMovCNT.FieldByName('CNTMTOEXT').AsString := cdsClone.FieldByName('CNTMTOEXT').AsString;
            cdsMovCNT.FieldByName('CNTFEMIS').AsDateTime := cdsClone.FieldByName('CNTFEMIS').AsDateTime;
            cdsMovCNT.FieldByName('CNTFVCMTO').AsDateTime := cdsClone.FieldByName('CNTFVCMTO').AsDateTime;
            cdsMovCNT.FieldByName('CNTFCOMP').AsDateTime := cdsClone.FieldByName('CNTFCOMP').AsDateTime;
            cdsMovCNT.FieldByName('CNTESTADO').AsString := cdsClone.FieldByName('CNTESTADO').AsString;
            cdsMovCNT.FieldByName('CNTCUADRE').AsString := 'S';
            cdsMovCNT.FieldByName('CNTFAUTOM').AsString := 'S';
            cdsMovCNT.FieldByName('CNTUSER').AsString := cdsClone.FieldByName('CNTUSER').AsString;
            cdsMovCNT.FieldByName('CNTFREG').AsDateTime := cdsClone.FieldByName('CNTFREG').AsDateTime;
            cdsMovCNT.FieldByName('CNTHREG').AsDateTime := cdsClone.FieldByName('CNTHREG').AsDateTime;
            cdsMovCNT.FieldByName('CNTMM').AsString := cdsClone.FieldByName('CNTMM').AsString;
            cdsMovCNT.FieldByName('CNTDD').AsString := cdsClone.FieldByName('CNTDD').AsString;
            cdsMovCNT.FieldByName('CNTTRI').AsString := cdsClone.FieldByName('CNTTRI').AsString;
            cdsMovCNT.FieldByName('CNTSEM').AsString := cdsClone.FieldByName('CNTSEM').AsString;
            cdsMovCNT.FieldByName('CNTSS').AsString := cdsClone.FieldByName('CNTSS').AsString;
            cdsMovCNT.FieldByName('CNTAATRI').AsString := cdsClone.FieldByName('CNTAATRI').AsString;
            cdsMovCNT.FieldByName('CNTAASEM').AsString := cdsClone.FieldByName('CNTAASEM').AsString;
            cdsMovCNT.FieldByName('CNTAASS').AsString := cdsClone.FieldByName('CNTAASS').AsString;
            cdsMovCNT.FieldByName('TMONID').AsString := cdsClone.FieldByName('TMONID').AsString;
            cdsMovCNT.FieldByName('TDIARDES').AsString := cdsClone.FieldByName('TDIARDES').AsString;
            cdsMovCNT.FieldByName('AUXDES').AsString := cdsClone.FieldByName('AUXDES').AsString;
            cdsMovCNT.FieldByName('DOCDES').AsString := cdsClone.FieldByName('DOCDES').AsString;
            cdsMovCNT.FieldByName('CNTDEBEMN').AsFloat := dDebeMN;
            cdsMovCNT.FieldByName('CNTDEBEME').AsFloat := dDebeME;
            cdsMovCNT.FieldByName('CNTHABEMN').AsFloat := dHabeMN;
            cdsMovCNT.FieldByName('CNTHABEME').AsFloat := dHabeME;
            cdsMovCNT.FieldByName('CNTREG').AsInteger := iOrden;
            iOrden := iOrden + 1;
         End;

        //SI TIENE CUENTA AUTOMATICA 2
         If Not cdsQry2.FieldByName('CTAAUT2').IsNull Then
         Begin

          //SI LA CUENTA ORIGES ESTA DESTINADA AL HABER LA CUENTA AUTOMATICA 2 IRA AL DEBE
            If cdsClone.FieldByName('CNTDH').AsString = 'D' Then
            Begin
               sDeHa := 'H';
               dDebeMN := 0;
               dDebeME := 0;
               dHabeMN := cdsClone.FieldByName('CNTMTOLOC').AsFloat;
               dHabeME := cdsClone.FieldByName('CNTMTOEXT').AsFloat;
            End
            Else
            Begin
               sDeHa := 'D';
               dDebeMN := cdsMovCNT.FieldByName('CNTDEBEMN').AsFloat;
               dDebeME := cdsMovCNT.FieldByName('CNTDEBEME').AsFloat;
               dHabeMN := 0;
               dHabeME := 0;
            End;

            cdsMovCNT.Insert;
            cdsMovCNT.FieldByName('CIAID').AsString := cdsClone.FieldByName('CIAID').AsString;
            cdsMovCNT.FieldByName('TDIARID').AsString := cdsClone.FieldByName('TDIARID').AsString;
            cdsMovCNT.FieldByName('CNTCOMPROB').AsString := cdsClone.FieldByName('CNTCOMPROB').AsString;
            cdsMovCNT.FieldByName('CNTANOMM').AsString := cdsClone.FieldByName('CNTANOMM').AsString;
            cdsMovCNT.FieldByName('CNTANO').AsString := cdsClone.FieldByName('CNTANO').AsString;
            cdsMovCNT.FieldByName('CNTLOTE').AsString := cdsClone.FieldByName('CNTLOTE').AsString;
            cdsMovCNT.FieldByName('CUENTAID').AsString := cdsQry2.FieldByName('CTAAUT2').AsString;
            cdsMovCNT.FieldByName('CLAUXID').AsString := cdsClone.FieldByName('CLAUXID').AsString;
            cdsMovCNT.FieldByName('AUXID').AsString := cdsClone.FieldByName('AUXID').AsString;
            cdsMovCNT.FieldByName('CNTMODDOC').AsString := cdsClone.FieldByName('CNTMODDOC').AsString;
            cdsMovCNT.FieldByName('DOCID').AsString := cdsClone.FieldByName('DOCID').AsString;
            cdsMovCNT.FieldByName('CNTSERIE').AsString := cdsClone.FieldByName('CNTSERIE').AsString;
            cdsMovCNT.FieldByName('CNTNODOC').AsString := cdsClone.FieldByName('CNTNODOC').AsString;
            cdsMovCNT.FieldByName('CNTGLOSA').AsString := cdsClone.FieldByName('CNTGLOSA').AsString;
            cdsMovCNT.FieldByName('CNTDH').AsString := sDeHa;
            cdsMovCNT.FieldByName('CNTTCAMBIO').AsString := cdsClone.FieldByName('CNTTCAMBIO').AsString;
            cdsMovCNT.FieldByName('CNTMTOORI').AsString := cdsClone.FieldByName('CNTMTOORI').AsString;
            cdsMovCNT.FieldByName('CNTMTOLOC').AsString := cdsClone.FieldByName('CNTMTOLOC').AsString;
            cdsMovCNT.FieldByName('CNTMTOEXT').AsString := cdsClone.FieldByName('CNTMTOEXT').AsString;
            cdsMovCNT.FieldByName('CNTFEMIS').AsDateTime := cdsClone.FieldByName('CNTFEMIS').AsDateTime;
            cdsMovCNT.FieldByName('CNTFVCMTO').AsDateTime := cdsClone.FieldByName('CNTFVCMTO').AsDateTime;
            cdsMovCNT.FieldByName('CNTFCOMP').AsDateTime := cdsClone.FieldByName('CNTFCOMP').AsDateTime;
            cdsMovCNT.FieldByName('CNTESTADO').AsString := cdsClone.FieldByName('CNTESTADO').AsString;
            cdsMovCNT.FieldByName('CNTCUADRE').AsString := 'S';
            cdsMovCNT.FieldByName('CNTFAUTOM').AsString := 'S';
            cdsMovCNT.FieldByName('CNTUSER').AsString := cdsClone.FieldByName('CNTUSER').AsString;
            cdsMovCNT.FieldByName('CNTFREG').AsDateTime := cdsClone.FieldByName('CNTFREG').AsDateTime;
            cdsMovCNT.FieldByName('CNTHREG').AsDateTime := cdsClone.FieldByName('CNTHREG').AsDateTime;
            cdsMovCNT.FieldByName('CNTMM').AsString := cdsClone.FieldByName('CNTMM').AsString;
            cdsMovCNT.FieldByName('CNTDD').AsString := cdsClone.FieldByName('CNTDD').AsString;
            cdsMovCNT.FieldByName('CNTTRI').AsString := cdsClone.FieldByName('CNTTRI').AsString;
            cdsMovCNT.FieldByName('CNTSEM').AsString := cdsClone.FieldByName('CNTSEM').AsString;
            cdsMovCNT.FieldByName('CNTSS').AsString := cdsClone.FieldByName('CNTSS').AsString;
            cdsMovCNT.FieldByName('CNTAATRI').AsString := cdsClone.FieldByName('CNTAATRI').AsString;
            cdsMovCNT.FieldByName('CNTAASEM').AsString := cdsClone.FieldByName('CNTAASEM').AsString;
            cdsMovCNT.FieldByName('CNTAASS').AsString := cdsClone.FieldByName('CNTAASS').AsString;
            cdsMovCNT.FieldByName('TMONID').AsString := cdsClone.FieldByName('TMONID').AsString;
            cdsMovCNT.FieldByName('TDIARDES').AsString := cdsClone.FieldByName('TDIARDES').AsString;
            cdsMovCNT.FieldByName('AUXDES').AsString := cdsClone.FieldByName('AUXDES').AsString;
            cdsMovCNT.FieldByName('DOCDES').AsString := cdsClone.FieldByName('DOCDES').AsString;
            cdsMovCNT.FieldByName('CNTDEBEMN').AsFloat := dDebeMN;
            cdsMovCNT.FieldByName('CNTDEBEME').AsFloat := dDebeME;
            cdsMovCNT.FieldByName('CNTHABEMN').AsFloat := dHabeMN;
            cdsMovCNT.FieldByName('CNTHABEME').AsFloat := dHabeME;
            cdsMovCNT.FieldByName('CNTREG').AsInteger := iOrden;
            iOrden := iOrden + 1;
         End
      End;
      cdsClone.Next;
   End;

   AplicaDatos(cdsMovCNT, 'MOVCNT');

   // 5
   PanelMsg('Generando Cabecera de Contabilidad', 0);

   // Genera Cabecera de Contabilidad

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'INSERT INTO CNT300 ';
      xSQL := xSQL + '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
      xSQL := xSQL + 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
      xSQL := xSQL + 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
      xSQL := xSQL + 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
      xSQL := xSQL + 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
      xSQL := xSQL + 'CNTTS,DOCMOD ) ';

      xSQL := xSQL + 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
      xSQL := xSQL + '''M:''' + '||A.CNTMODDOC||' + ''' D:''' + '||A.TDIARID||' + ''' P:''' + '||A.CNTANOMM||' + ''' C:''' + '||A.CNTCOMPROB, ';
      xSQL := xSQL + 'SUM( CASE WHEN A.FLAGVAR=''T'' THEN A.CNTTCAMBIO ELSE 0 END ), ';
      xSQL := xSQL + 'A.CNTFCOMP, ''P'', ''S'', ';
      xSQL := xSQL + '''' + DMAF.wUsuario + '''' + ', ' + DMAF.wRepFecServi + ', ' + DMAF.wRepHorServi + ', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
      xSQL := xSQL + 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, '' '', ';
      xSQL := xSQL + 'A.TDIARDES, ';
      xSQL := xSQL + 'SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME), ';
      xSQL := xSQL + '''' + Copy(wVRN_TipoCambio, 2, 2) + '''' + ',''CXP'' ';

      xSQL := xSQL + 'FROM CNT301 A ';

      xSQL := xSQL + 'WHERE A.CIAID=' + '''' + xCia + '''' + ' AND ';
      xSQL := xSQL + 'A.TDIARID=' + '''' + xTDiario + '''' + ' AND ';
      xSQL := xSQL + 'A.CNTANOMM=' + '''' + xAnoMM + '''' + ' AND ';
      xSQL := xSQL + 'A.CNTCOMPROB=' + '''' + xNoComp + '''' + ' ';
      xSQL := xSQL + 'GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
      xSQL := xSQL + 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI,  ';
      xSQL := xSQL + 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, ';
      xSQL := xSQL + 'A.TDIARDES, A.CNTMODDOC';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         xSQL := 'INSERT INTO CNT300 ';
         xSQL := xSQL + '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
         xSQL := xSQL + 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
         xSQL := xSQL + 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
         xSQL := xSQL + 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
         xSQL := xSQL + 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
         xSQL := xSQL + 'CNTTS,DOCMOD ) ';
         xSQL := xSQL + 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
         xSQL := xSQL + '''M:''' + '||A.CNTMODDOC||' + ''' D:''' + '||A.TDIARID||' + ''' P:''' + '||A.CNTANOMM||' + ''' C:''' + '||A.CNTCOMPROB, ';
         xSQL := xSQL + 'SUM( DECODE(A.FLAGVAR, ''T'', A.CNTTCAMBIO, 0)), ';
         xSQL := xSQL + 'A.CNTFCOMP, ''P'', ''S'', ';
         xSQL := xSQL + '''' + DMAF.wUsuario + '''' + ', ' + DMAF.wRepFecServi + ', ' + DMAF.wRepHorServi + ', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
         xSQL := xSQL + 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, '' '', ';
         xSQL := xSQL + 'A.TDIARDES, ';
         xSQL := xSQL + 'SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME), ';
         xSQL := xSQL + '''' + Copy(wVRN_TipoCambio, 2, 2) + '''' + ',''CXP'' ';
         xSQL := xSQL + 'FROM CNT301 A ';
         xSQL := xSQL + 'WHERE A.CIAID=' + '''' + xCia + '''' + ' AND ';
         xSQL := xSQL + 'A.TDIARID=' + '''' + xTDiario + '''' + ' AND ';
         xSQL := xSQL + 'A.CNTANOMM=' + '''' + xAnoMM + '''' + ' AND ';
         xSQL := xSQL + 'A.CNTCOMPROB=' + '''' + xNoComp + '''' + ' ';
         xSQL := xSQL + 'GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
         xSQL := xSQL + 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI,  ';
         xSQL := xSQL + 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, ';
         xSQL := xSQL + 'A.TDIARDES, A.CNTMODDOC';
      End;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Execute;
   cdsClone.Free;

   Result := True;
End;

Procedure TDMAF.GeneraEnLinea401(xxxCia, xxxDiario, xxxAnoMM, xxxNoComp: String);
Var
   xCtaPrin, xClAux, xCuenta, xAuxDes, xAno, xMes, xDH, xSQL, xww: String;
   xMov, xAux, xCCos, xCCoDes, xCtaDes, xFLAux, xFLCCo, xNivel: String;
   xDigitos, xDigAnt: Integer;
   xImpMN, xImpME: Real;
Begin
   xAno := Copy(xxxAnoMM, 1, 4);
   xMes := Copy(xxxAnoMM, 5, 2);

   // 5
   PanelMsg('Generando Resultados', 0);

   xww := '';
   cdsMovCNT.First;
   While Not cdsMovCNT.Eof Do
   Begin
      If xww = '' Then
         xww := '( SUBSTR(CUENTAID,1,1)=''' + Copy(cdsMovCNT.FieldByName('CUENTAID').AsString, 1, 1) + ''''
      Else
         If pos('''' + Copy(cdsMovCNT.FieldByName('CUENTAID').AsString, 1, 1) + '''', xww) = 0 Then
            xww := xww + ' or SUBSTR(CUENTAID,1,1)=''' + Copy(cdsMovCNT.FieldByName('CUENTAID').AsString, 1, 1) + '''';
      cdsMovCNT.Next;
   End;
   If xww <> '' Then
      xww := ' and ' + xww + ' ) ';

   xSQL := 'Select CIAID, CUENTAID, CTAABR, CTA_MOV, CTA_AUX, CTA_CCOS, CTANIV '
      + 'From TGE202 '
      + 'Where CIAID=' + quotedstr(xxxCia) + xww;
   cdsQry2.Close;
   cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
   cdsQry2.Open;

   cdsCta := TwwClientDataSet.Create(Nil);
   cdsCta.CloneCursor(cdsQry2, True);
   cdsCta.IndexFieldNames := 'CIAID;CUENTAID;CTANIV';

   PanelMsg('Generando Resultados', cdsMovCNT.RecordCount + 1);

   cdsMovCNT.First;
   While Not cdsMovCNT.Eof Do
   Begin

      PanelMsg('Generando Resultados', 0);

      xCtaPrin := cdsMovCNT.FieldByName('CUENTAID').AsString;
      xDH := cdsMovCNT.FieldByName('CNTDH').AsString;
      xImpMN := cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat;
      xImpME := cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat;
      xClAux := cdsMovCNT.FieldByName('CLAUXID').AsString;
      xAux := cdsMovCNT.FieldByName('AUXID').AsString;
      xAuxDes := cdsMovCNT.FieldByName('AUXDES').AsString;
      xCCos := cdsMovCNT.FieldByName('CCOSID').AsString;
      xCCoDes := cdsMovCNT.FieldByName('CCOSDES').AsString;
      xDigAnt := 0;
      cdsNivel.First;
      While Not DMAF.cdsNivel.EOF Do
      Begin

         xDigitos := DMAF.cdsNivel.fieldbyName('Digitos').AsInteger;
         xCuenta := Trim(Copy(xCtaPrin, 1, xDigitos));
         xNivel := DMAF.cdsNivel.fieldbyName('Nivel').AsString;

         cdsCta.Setkey;
         cdsCta.FieldByname('CIAID').Value := xxxCia;
         cdsCta.FieldByname('CUENTAID').Value := xCuenta;
         cdsCta.FieldByname('CTANIV').Value := xNivel;
         xCtaDes := '';
         xMov := '';
         If cdsCta.Gotokey Then
         Begin
            xCtaDes := cdsQry2.FieldByName('CTAABR').AsString;
            xMov := cdsQry2.FieldByName('CTA_MOV').AsString;
            xFlAux := cdsQry2.FieldByName('CTA_AUX').AsString;
            xFlCCo := cdsQry2.FieldByName('CTA_CCOS').AsString;

            If Trim(DMAF.cdsNivel.fieldbyName('Signo').AsString) = '=' Then
               If Length(xCuenta) = xDigitos Then
               Else
                  Break;
            If DMAF.cdsNivel.fieldbyName('Signo').AsString = '<=' Then
               If (Length(xCuenta) <= xDigitos) And (Length(xCuenta) > xDigAnt) Then
               Else
                  Break;
            If DMAF.cdsNivel.fieldbyName('Signo').AsString = '>=' Then
               If Length(xCuenta) >= xDigitos Then
               Else
                  Break;

            If Not CuentaExiste(xxxCia, xAno, xCuenta, '', '') Then
            Begin
               InsertaMov(xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
                  xCtaDes, '', '', xNivel, xImpMN, xImpME);
            End
            Else
            Begin
               ActualizaMov(xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
                  xCtaDes, '', '', xNivel, xImpMN, xImpME);
            End;
            xDigAnt := DMAF.cdsNivel.fieldbyName('Digitos').AsInteger;

            ///////////////////////////
            //   Si Tiene Auxiliar   //
            ///////////////////////////
            If xFlAux = 'S' Then
            Begin
               If Not CuentaExiste(xxxCia, xAno, xCuenta, xAux, '') Then
               Begin
                  InsertaMov(xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, '', xDH, xMov,
                     xCtaDes, xAuxDes, '', xNivel, xImpMN, xImpME);
               End
               Else
               Begin
                  ActualizaMov(xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, '', xDH, xMov,
                     xCtaDes, xAuxDes, '', xNivel, xImpMN, xImpME);
               End;
            End;

            ///////////////////////////
            //   Si Tiene C.Costo    //
            ///////////////////////////
            If xFlCCo = 'S' Then
            Begin
               If Not CuentaExiste(xxxCia, xAno, xCuenta, xAux, xCCos) Then
               Begin
                  InsertaMov(xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, xCCos, xDH, xMov,
                     xCtaDes, xAuxDes, xCCoDes, xNivel, xImpMN, xImpME);
               End
               Else
               Begin
                  ActualizaMov(xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, xCCos, xDH, xMov,
                     xCtaDes, xAuxDes, xCCoDes, xNivel, xImpMN, xImpME);
               End;
            End;
         End;
         cdsNivel.Next;
      End;
      cdsMovCNT.Next;
   End;
End;

Function TDMAF.CuentaExiste(xxxxCia, xxxxAno, xxxxCuenta, xxxxAux,
   xxxxCCos: String): Boolean;
Var
   xSQL: String;
   xAuxid, xCcosid: String;
Begin
   If xxxxAux = '' Then
      xAuxid := '(AUXID=' + quotedstr(xxxxAux) + ' OR AUXID IS NULL) AND '
   Else
      xAuxid := 'AUXID=' + quotedstr(xxxxAux) + ' AND ';
   If xxxxCCos = '' Then
      xCcosid := '(CCOSID=' + quotedstr(xxxxCCos) + ' OR CCOSID IS NULL)'
   Else
      xCcosid := 'CCOSID=' + quotedstr(xxxxCCos);
   xSQL := 'Select COUNT(*) TOTREG from CNT401 '
      + 'Where CIAID=' + '''' + xxxxCia + '''' + ' and '
      + 'ANO=' + '''' + xxxxAno + '''' + ' and '
      + 'CUENTAID=' + '''' + xxxxCuenta + '''' + ' and ';
   xSQL := xSQL + xAuxid + xCcosid;

   cdsQry.Close;
   cdsQry.ProviderName := 'dspTGE';
   cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   cdsQry.Open;
   If cdsQry.fieldbyName('TOTREG').asInteger > 0 Then
   //**
      Result := True
   Else
      Result := False;
End;

Procedure TDMAF.ActualizaMov(cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto, cDH, cMov,
   cCtaDes, cAuxDes, cCCoDes, cNivel: String;
   nImpMN, nImpME: Single);
Var
   cMes, cAno, cSQL, cMesT: String;
   nMes: Integer;
   xAuxid, xCcosid, xClauxid: String;
Begin

   cAno := Copy(cAnoMM, 1, 4);
   cMes := Copy(cAnoMM, 5, 2);

   cSQL := 'Update CNT401 Set CTADES =' + '''' + cCtaDes + '''' + ', '
      + 'AUXDES =' + '''' + cAuxDes + '''' + ', '
      + 'CCODES =' + '''' + cCCoDes + '''' + ', ';

   If cDH = 'D' Then
   Begin
      cSQL := cSQL + '  DEBEMN' + cMes + '=' +
         '( ' + DMAF.wReplacCeros + '(DEBEMN' + cMes + ',0)+' + FloatToStr(nImpMN) + ') ';
      cSQL := cSQL + ', DEBEME' + cMes + '=' +
         '( ' + DMAF.wReplacCeros + '(DEBEME' + cMes + ',0)+' + FloatToStr(nImpME) + ') ';
   End;
   If cDH = 'H' Then
   Begin
      cSQL := cSQL + '  HABEMN' + cMes + '=' +
         '( ' + DMAF.wReplacCeros + '(HABEMN' + cMes + ',0)+' + FloatToStr(nImpMN) + ') ';
      cSQL := cSQL + ', HABEME' + cMes + '=' +
         '( ' + DMAF.wReplacCeros + '(HABEME' + cMes + ',0)+' + FloatToStr(nImpME) + ') ';
   End;

   cSQL := cSQL + ', SALDMN' + cMes + '=';
   cSQL := cSQL + '(' + DMAF.wReplacCeros + '(SALDMN' + cMes + ',0)';
   If cDH = 'D' Then
      cSQL := cSQL + '+'
   Else
      cSQL := cSQL + '-';
   cSQL := cSQL + '(' + FloatToStr(nImpMN) + ') ) ';

   cSQL := cSQL + ', SALDME' + cMes + '=';
   cSQL := cSQL + '(' + DMAF.wReplacCeros + '(SALDME' + cMes + ',0)';
   If cDH = 'D' Then
      cSQL := cSQL + '+'
   Else
      cSQL := cSQL + '-';
   cSQL := cSQL + '(' + FloatToStr(nImpME) + ') ) ';
   //**

   For nMes := (StrToInt(cMes) + 1) To 13 Do
   Begin
      cMesT := StrZero(nMes, 2);

      cSQL := cSQL + ', SALDMN' + cMesT + '=';
      cSQL := cSQL + '( ' + DMAF.wReplacCeros + '(SALDMN' + cMesT + ',0)';
      If cDH = 'D' Then
         cSQL := cSQL + '+'
      Else
         cSQL := cSQL + '-';
      cSQL := cSQL + FloatToStr(nImpMN) + ') ';

      cSQL := cSQL + ', SALDME' + cMesT + '=';
      cSQL := cSQL + '( ' + DMAF.wReplacCeros + '(SALDME' + cMesT + ',0)';
      If cDH = 'D' Then
         cSQL := cSQL + '+'
      Else
         cSQL := cSQL + '-';
      cSQL := cSQL + FloatToStr(nImpME) + ') ';
   End;

   If cAux = '' Then
      xAuxid := '(AUXID=' + quotedstr(cAux) + ' OR AUXID IS NULL) AND '
   Else
      xAuxid := 'AUXID=' + quotedstr(cAux) + ' AND ';
   If cCCosto = '' Then
      xCcosid := '(CCOSID=' + quotedstr(cCCosto) + ' OR CCOSID IS NULL) AND '
   Else
      xCcosid := 'CCOSID=' + quotedstr(cCCosto) + ' AND ';
   If cClAux = '' Then
      xClauxid := '(CLAUXID=' + quotedstr(cClAux) + ' OR CLAUXID IS NULL)'
   Else
      xClauxid := 'CLAUXID=' + quotedstr(cClAux);

   cSQL := cSQL + 'Where CIAID=   ' + '''' + cCia + '''' + ' and '
      + 'ANO=     ' + '''' + cAno + '''' + ' and '
      + 'CUENTAID=' + '''' + cCuenta + '''' + ' and ';
   cSQL := cSQL + xAuxid + xCcosid + xClauxid;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(cSQL);
   DMAF.cdsQry.Execute;

End;

Procedure TDMAF.InsertaMov(cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto, cDH, cMov,
   cCtaDes, cAuxDes, cCCoDes, cNivel: String;
   nImpMN, nImpME: Single);
Var
   cMes, cAno, cSQL, cMesT: String;
   nMes: Integer;
   xCtaMov: String;
Begin
   cAno := Copy(cAnoMM, 1, 4);
   cMes := Copy(cAnoMM, 5, 2);

   xCtaMov := DMAF.DisplayDescrip('dspTGE', 'TGE202', 'CTA_MOV', 'CUENTAID=' + quotedstr(cCuenta), 'CTA_MOV');

   cSQL := 'Insert into CNT401( CIAID, ANO, CUENTAID, CLAUXID, AUXID, '
      + ' CCOSID, CTADES, AUXDES, CCODES, TIPO ,CTA_MOV';

   If cDH = 'D' Then cSQL := cSQL + ', DEBEMN' + cMes + ', DEBEME' + cMes;
   If cDH = 'H' Then cSQL := cSQL + ', HABEMN' + cMes + ', HABEME' + cMes;

   cSQL := cSQL + ', SALDMN' + cMes;
   cSQL := cSQL + ', SALDME' + cMes;

   For nMes := (StrToInt(cMes) + 1) To 13 Do
   Begin
      cMesT := StrZero(nMes, 2);
      cSQL := cSQL + ', SALDMN' + cMesT;
      cSQL := cSQL + ', SALDME' + cMesT;
   End;
   cSQL := cSQL + ' ) ';
   cSQL := cSQL + 'Values( ' + '''' + cCia + '''' + ', ' + '''' + cAno + '''' + ', '
      + '''' + cCuenta + '''' + ', ' + '''' + cClAux + '''' + ', '
      + '''' + cAux + '''' + ', ' + '''' + cCCosto + '''' + ', '
      + '''' + cCtaDes + '''' + ', ' + '''' + cAuxDes + '''' + ', '
      + '''' + cCCoDes + '''' + ', ' + '''' + cNivel + '''' + ', '
      + quotedstr(xCtaMov) + ','
      + FloatToStr(nImpMN) + ', '
      + FloatToStr(nImpME) + ' ';
   If cDH = 'D' Then
      cSQL := cSQL + ', +'
   Else
      cSQL := cSQL + ', -';
   cSQL := cSQL + FloatToStr(nImpMN) + ' ';
   If cDH = 'D' Then
      cSQL := cSQL + ', +'
   Else
      cSQL := cSQL + ', -';
   cSQL := cSQL + FloatToStr(nImpME) + ' ';
   //**

   For nMes := (StrToInt(cMes) + 1) To 13 Do
   Begin
      cMesT := StrZero(nMes, 2);
      If cDH = 'D' Then
         cSQL := cSQL + ', +'
      Else
         cSQL := cSQL + ', -';
      cSQL := cSQL + FloatToStr(nImpMN) + ' ';
      If cDH = 'D' Then
         cSQL := cSQL + ', +'
      Else
         cSQL := cSQL + ', -';
      cSQL := cSQL + FloatToStr(nImpME) + ' ';
   End;

   cSQL := cSQL + ' ) ';

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(cSQL);
   DMAF.cdsQry.Execute;
End;

Procedure TDMAF.CreaPanel(xForma: TForm; xMensaje: String);
Begin
   pnlConta := TPanel.Create(xForma);
   pbConta := TProgressBar.Create(Nil);
   pbConta.Width := 205;
   pbConta.Top := 72;
   pbConta.Left := 48;
   pbConta.Min := 0;
   pbConta.Max := 5;
   pbConta.Parent := pnlConta;
   pnlConta.Alignment := taCenter;
   pnlConta.BringToFront;
   pnlConta.Width := 300;
   pnlConta.Height := 100;
   pnlConta.Top := xForma.Height - 380;
   pnlConta.Left := StrToInt(FloattoStr(FRound((((xForma.Width - 100)) / 2) - 100, 3, 0)));
   pnlConta.Parent := xForma;
   pnlConta.BevelInner := bvRaised;
   pnlConta.BevelOuter := bvRaised;
   pnlConta.BevelWidth := 3;
   pnlConta.Font.Name := 'Times New Roman';
   pnlConta.Font.Style := [fsBold, fsItalic];
   pnlConta.Font.Size := 12;
   pnlConta.Caption := xMensaje;
   pbConta.Position := 1;
   pnlConta.Refresh;
End;

Procedure TDMAF.PanelMsg(xMensaje: String; xProc: Integer);
Begin
   If xProc > 0 Then
   Begin
      pbConta.Position := 0;
      pbConta.Min := 0;
      pbConta.Max := xProc;
   End;
   pnlConta.Caption := xMensaje;
   If xProc = 0 Then pbConta.Position := pbConta.Position + 1;
   pnlConta.Refresh;
End;

////////////////////////////////////////
//                                    //
//       Fin de Contabilización       //
//                                    //
////////////////////////////////////////

Function TDMAF.DesEncripta(wPalabra: String): String;
Var
   xLargoPal, i, j: integer;
   xReal, xEncriptado1, xEncriptado2, xEncriptado3, xEncriptado4,
      xEncriptado5, xNuevaPal, xEncriptado: String;
   xTiene: boolean;
Begin
   xReal := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1 := '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2 := '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3 := '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4 := 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5 := ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal := length(wPalabra);
   xNuevaPal := '';
   i := 1;
   While i <= xLargoPal Do
   Begin
      j := 1;
      xTiene := False;
      If (i = 1) Or (i = 11) Or (i = 21) Or (i = 31) Then xEncriptado := xEncriptado1;
      If (i = 2) Or (i = 12) Or (i = 22) Or (i = 32) Then xEncriptado := xEncriptado2;
      If (i = 3) Or (i = 13) Or (i = 23) Or (i = 33) Then xEncriptado := xEncriptado3;
      If (i = 4) Or (i = 14) Or (i = 24) Or (i = 34) Then xEncriptado := xEncriptado4;
      If (i = 5) Or (i = 15) Or (i = 25) Or (i = 35) Then xEncriptado := xEncriptado5;
      If (i = 6) Or (i = 16) Or (i = 26) Or (i = 36) Then xEncriptado := xEncriptado1;
      If (i = 7) Or (i = 17) Or (i = 27) Or (i = 37) Then xEncriptado := xEncriptado2;
      If (i = 8) Or (i = 18) Or (i = 28) Or (i = 38) Then xEncriptado := xEncriptado3;
      If (i = 9) Or (i = 19) Or (i = 29) Or (i = 39) Then xEncriptado := xEncriptado4;
      If (i = 10) Or (i = 20) Or (i = 30) Or (i = 40) Then xEncriptado := xEncriptado5;
      While j <= length(xReal) Do
      Begin
         If copy(wPalabra, i, 1) = copy(xEncriptado, j, 1) Then
         Begin
            xNuevaPal := xNuevaPal + copy(xReal, j, 1);
            xTiene := True;
         End;
         j := j + 1;
      End;
      If Not xTiene Then xNuevaPal := xNuevaPal + copy(wPalabra, i, 1);
      i := i + 1;
   End;
   result := xNuevaPal;
End;

Function TDMAF.Encripta(wPalabra: String): String;
Var
   xLargoPal, i, j: integer;
   xReal, xEncriptado1, xEncriptado2, xEncriptado3, xEncriptado4,
      xEncriptado5, xNuevaPal, xEncriptado: String;
   xTiene: boolean;
Begin
   xReal := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1 := '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2 := '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3 := '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4 := 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5 := ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal := length(wPalabra);
   xNuevaPal := '';
   i := 1;
   While i <= xLargoPal Do
   Begin
      j := 1;
      xTiene := False;
      If (i = 1) Or (i = 11) Or (i = 21) Or (i = 31) Then xEncriptado := xEncriptado1;
      If (i = 2) Or (i = 12) Or (i = 22) Or (i = 32) Then xEncriptado := xEncriptado2;
      If (i = 3) Or (i = 13) Or (i = 23) Or (i = 33) Then xEncriptado := xEncriptado3;
      If (i = 4) Or (i = 14) Or (i = 24) Or (i = 34) Then xEncriptado := xEncriptado4;
      If (i = 5) Or (i = 15) Or (i = 25) Or (i = 35) Then xEncriptado := xEncriptado5;
      If (i = 6) Or (i = 16) Or (i = 26) Or (i = 36) Then xEncriptado := xEncriptado1;
      If (i = 7) Or (i = 17) Or (i = 27) Or (i = 37) Then xEncriptado := xEncriptado2;
      If (i = 8) Or (i = 18) Or (i = 28) Or (i = 38) Then xEncriptado := xEncriptado3;
      If (i = 9) Or (i = 19) Or (i = 29) Or (i = 39) Then xEncriptado := xEncriptado4;
      If (i = 10) Or (i = 20) Or (i = 30) Or (i = 40) Then xEncriptado := xEncriptado5;
      While j <= length(xReal) Do
      Begin
         If copy(wPalabra, i, 1) = copy(xReal, j, 1) Then
         Begin
            xNuevaPal := xNuevaPal + copy(xEncriptado, j, 1);
            xTiene := True;
         End;
         j := j + 1;
      End;
      If Not xTiene Then xNuevaPal := xNuevaPal + copy(wPalabra, i, 1);
      i := i + 1;
   End;
   result := xNuevaPal;
End;

Procedure TDMAF.AntesDeGrabar(xxCds: TwwClientDataSet);
Var
   i: integer;
Begin
   For i := 0 To xxCds.Fields.Count - 1 Do
   Begin

      If xxCds.Fields[i].ClassType = TStringField Then
      Begin
         If xxCds.Fields[i].AsString = '' Then
            xxCds.Fields[i].Clear;
      End;

      If xxCds.Fields[i].ClassType = TMemoField Then
      Begin
         If xxCds.Fields[i].AsString = '' Then
            xxCds.Fields[i].AsString := '.';
      End;

   End;
End;

Function TDMAF.OperClientDataSet(ClientDataSet: TwwClientDataSet;
   Expression, Condicion: String): Double;
Var
   cdsClone: TwwClientDataSet;
   bmk: TBookmark;
   Agg: TAggregate;
Begin
   result := 0;

   If trim(Expression) = '' Then Exit;

   bmk := ClientDataSet.GetBookmark;
   cdsClone := TwwClientDataSet.Create(Nil);
   Try

      With cdsClone Do
      Begin
         CloneCursor(ClientDataSet, True);

         Agg := Aggregates.Add;
         Agg.AggregateName := 'OPER';
         Agg.Expression := Expression;
         Agg.Active := True;

         If Trim(Condicion) <> '' Then
         Begin
            Filtered := False;
            Filter := Condicion;
            Filtered := True;
         End;

         If Aggregates.Items[Aggregates.IndexOf('OPER')].Value <> NULL Then
            result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;

         Aggregates.Clear;

      End;

      ClientDataSet.GotoBookmark(bmk);
      ClientDataSet.FreeBookmark(bmk);

   Finally
      cdsClone.Free;
   End;
End;

Procedure TDMAF.DisminuyeForma(Sender: TObject);
Begin

   If (wBoton = '11') Or (wBoton = '12') Then // 11- Maestro de Activos Fijos
   Begin // 12- Tipos de Activo
      cdsActFij.Close;
      cdsTipAct.Close;
   End;
   If wBoton = '51' Then // Inventario Fisico
   Begin
      If wCierraCds = '1' Then
      Begin
         cdsInvC.Close;
         cdsInvD.Close;
      End;
      wCierraCds := '0';
   End;

End;

Procedure TDMAF.AbrirCDS(xxCds: TwwClientDataSet);
Begin
   xxCds.Open;
End;

Procedure TDMAF.FiltraTabla(xxCds: TwwClientDataSet; xxArchivo,
   xxCampo: String);
Var
   xFiltro, xxFiltro2: String;
   xSQL2: String;
Begin
   cdsAcceso.Filtered := False;
   cdsAcceso.Filter := '';
   cdsAcceso.Filter := 'NTabla=' + '''' + xxArchivo + '''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   While Not cdsAcceso.Eof Do
   Begin
      If Length(xFiltro) = 0 Then
         xFiltro := xxCampo + '=' + '''' + cdsAcceso.FieldByName('Codigo').AsString + ''''
      Else
         xFiltro := xFiltro + ' or ' + xxCampo + '=' + '''' + cdsAcceso.FieldByName('Codigo').AsString + '''';

      cdsAcceso.Next;
   End;

   xSQL2 := '';
   xxFiltro2 := '';
   If xxCds.Fields.FindField('MODULO') <> Nil Then
      xxFiltro2 := 'MODULO LIKE ' + '''' + '%' + wModulo + '%' + '''';
   If Length(xFiltro) = 0 Then
      xSQL2 := 'Select * from ' + xxArchivo;
   If Length(xFiltro) > 0 Then
   Begin
      xSQL2 := 'Select * from ' + xxArchivo + ' Where ' + xFiltro;
   End;

   If Length(xxFiltro2) > 0 Then
   Begin
      If pos('WHERE', xSQL2) > 0 Then
         xSQL2 := xSQL2 + ' AND (' + xxFiltro2 + ')'
      Else
         xSQL2 := 'Select * from ' + xxArchivo + ' WHERE (' + xxFiltro2 + ')'
   End;

   xxCds.Close;

   If Length(xSQL2) > 0 Then xxCds.DataRequest(xSQL2);

   xxCds.Open;

End;

Procedure TDMAF.cdsInvCReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(DataSet, UpdateKind, E);
End;

Procedure TDMAF.ActualizaFiltro(wwFiltro: TMant; wwCdsLee: TwwClientDataSet;
   wwAccion: String);
Var
   i: integer;
Begin
// wFiltro : Es el Filtro que va a actualizar
// wCDsLee : Es el cds que contiene la información a actualizar
// wAccion : 'A' = Adición/Inserción/Nuevo Item
//           'M' = Actualización del Registro
//           'E' = Eliminación del Registro

   If wwAccion = 'E' Then
   Begin
      wwFiltro.FMant.cds2.Delete;
   End;

   If wwAccion = 'A' Then
   Begin
      wwFiltro.FMant.cds2.Append;
   End;

   If wwAccion = 'M' Then
   Begin
      wwFiltro.FMant.cds2.Edit;
   End;

   If (wwAccion = 'A') Or (wwAccion = 'M') Then
   Begin
      For i := 0 To wwCdsLee.FieldCount - 1 Do
      Begin
         wwFiltro.FMant.cds2.FieldByName(wwCdsLee.Fields[i].FieldName).Value :=
            wwCdsLee.FieldByName(wwCdsLee.Fields[i].FieldName).Value;
      End;
   End;
   wwFiltro.FMant.cds2.Post;
End;

Function TDMAF.FindCiaId(wxLocal, wxPiso, wxArea,
   wxAmbiente: String): String;
Var
   xCIAID: String;
Begin
// obtiene CIAID desde el ACF123 - ambientes
{   cdsAmbiente.SetKey;
   cdsAmbiente.FieldByName('LOCID').AsString := wxLocal;
   cdsAmbiente.FieldByName('PISO').AsString := wxPiso;
   cdsAmbiente.FieldByName('AREA').AsString := wxArea;
   cdsAmbiente.FieldByName('AMBCOD').AsString := wxAmbiente;
}
   xCIAID := 'EE';
//   cdsAmbiente.GotoKey;
   cdsAmbiente.Filter := '';
   cdsAmbiente.Filtered := False;
   cdsAmbiente.Filter := 'LOCID=' + quotedstr(wxLocal)
      + ' and PISO=' + quotedstr(wxPiso)
      + ' and AREA=' + quotedstr(wxArea)
      + ' and AMBCOD=' + quotedstr(wxAmbiente);
   cdsAmbiente.Filtered := True;
   xCIAID := cdsAmbiente.FieldByName('CIAID').AsString;
   cdsAmbiente.Filter := '';
   cdsAmbiente.Filtered := False;
   result := xCIAID;
End;

Procedure TDMAF.AbreCDS(xxCds: TwwClientDataSet; xxSQL, xxIndices,
   xxFiltro: String);
Begin
   xxCds.filter := '';
   xxCds.filtered := false;
   xxCds.IndexFieldNames := '';
   xxCds.Close;
   xxCds.DataRequest(xxSQL);
   xxCds.Open;
   If length(xxFiltro) > 0 Then
   Begin
      xxCds.Filter := xxFiltro;
      xxCds.Filtered := True;
   End;
   xxCds.Indexfieldnames := xxIndices;
   xxCds.First;
End;

Function TDMAF.DisplayReal(wPrv, wTabla, wCampos, wWhere,
   wResult: String): DOUBLE;
Var
   xSQL: String;
Begin
   xSQL := '';
   xSQL := 'select ' + wCampos + ' from ' + wTabla;
   If length(wWhere) > 0 Then xSQL := xSQL + ' where ' + wWhere;
   cdsQry.Close;
   cdsQry.ProviderName := wPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   result := cdsQry.FieldByName(wResult).AsFloat;
End;

Function TDMAF.ObtenerIpdeNetbios(Host: String): String;
Var
   WSAData: TWSADATA;
   HostEnt: phostent;
Begin
   Result := '';
   If WSAStartup(MAKEWORD(1, 1), WSADATA) = 0 Then
   Begin
      HostEnt := gethostbyname(PChar(Host));
      If HostEnt <> Nil Then
         Result := String(inet_ntoa(PInAddr(HostEnt.h_addr_list^)^));
      WSACleanup;
   End;
End;

Function TDMAF.ComputerName: String;
Var
   Buffer: Array[0..100] Of Char;
   MaxSize: Cardinal;
Begin
   MaxSize := SizeOf(Buffer);
   If Not GetComputerName(@Buffer, MaxSize) Then
      Raise Exception.Create('No puedo determinar el nombre de la máquina');
   Result := StrPas(@Buffer);
End;

Function TDMAF.AccesosModulo: Boolean;
Var
   xSQL: String;
   xfecfin: TDate;
   xdiasexppass: Integer;
   xdiasfaltantes: Integer;
   xdiasduracpass: Integer;
   xpassact, xctrl_ip, xingresa: String;
Begin
// busca en tabla DE USUARIO (TGE006) para determinar que es un usuario de base de datos
   xSQL := 'select FECEXP, OFDESID, nvl(CTRL_IP,''S'') CTRL_IP, '
      + '       TO_DATE(nvl(FECINI_PWD,sysdate-30)) FECINI_PWD, '
      + '       TO_DATE(nvl(FECFIN_PWD, sysdate-1)) FECFIN_PWD, '
      + '       nvl(DIASEXP_PWD,7) DIASEXP_PWD,'
      + '       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD '
      + 'from TGE006 '
      + 'where USERID = ' + QuotedStr(wUsuario);
   cdsQry.Close;
   cdsQry.DataRequest(xSql);
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      Showmessage('Usuario no reconocido para el uso de Aplicaciones');
      Result := False;
      Exit;
   End;

// valida que contraseña en control de aplicaciones (TGE006), no haya expirado
   If (cdsQry.FieldByName('FECEXP').AsDateTime > 0) And
      (cdsQry.FieldByName('FECEXP').AsDateTime < Date) Then
   Begin
      Showmessage('Usuario ha caducado para el uso de Aplicaciones');
      Result := False;
      Exit;
   End;
   xfecfin := cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   xdiasexppass := cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass := cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;
   //xpassact        := FCtrlAcceso.dbePassword.Text;

   wOfiId := cdsQry.FieldByName('OFDESID').AsString;
   xctrl_ip := cdsQry.FieldByName('CTRL_IP').AsString;
   widepc := computerName;

// determina que el usuario tenga acceso al módulo
// busca en tabla TGE006 para determinar que es un usuario de base de datos y de la aplicación
   xSQL := 'Select USUARIOS.USERID, USUARIOS.USERNOM, USUARIOGRUPO.GRUPOID, '
      + '       GRUPOS.GRUPODES, GRUPOS.GRUPOADM, ACCESOGRUPO.MODULOID, '
      + '       ACCESOGRUPO.TIPO, ACCESOGRUPO.OBJETO, ACCESOGRUPO.FORMA '
      + 'From TGE006 USUARIOS, TGE007 USUARIOGRUPO, TGE003 GRUPOS, TGE001 ACCESOGRUPO '
      + 'where USUARIOS.USERID=' + quotedstr(wUsuario) // -- TGE006 USUARIOS
      + '  and USUARIOGRUPO.USERID=USUARIOS.USERID' // -- TGE007 USUARIOGRUPO
      + '  and GRUPOS.GRUPOID=USUARIOGRUPO.GRUPOID' // -- TGE003 GRUPOS
      + '  and ACCESOGRUPO.GRUPOID=USUARIOGRUPO.GRUPOID '
      + '  and ACCESOGRUPO.MODULOID=' + quotedstr(wModulo)
      + '  and ACCESOGRUPO.TIPO=''0'' '; // TGE001 ACCESOGRUPO
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No tiene Acceso al módulo');
      Result := False;
      Exit;
   End;

// Identifica si el usuario puede ejecutar los sistemas de cualquier maquina
// o solo de las máquina que se le han asignado
   xingresa := 'N';
   If xctrl_ip = 'S' Then
   Begin
      xSQL := 'SELECT IP_ASIGNADO FROM TGE010 WHERE USERID = ' + QuotedStr(wUsuario);
      cdsQry.Close;
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      While Not cdsQry.Eof Do
      Begin
         If cdsQry.FieldByName('IP_ASIGNADO').AsString = cIP Then xingresa := 'S';
         cdsQry.Next;
      End;
   End;
   If (xingresa = 'N') And (xctrl_ip = 'S') Then
   Begin
      Showmessage('Usuario no autorizado para ingresar de este equipo');
      Result := False;
      Exit;
   End;

// DETERMINA NRO DE IDENTIFICADOR PARA GRABAR EN ARCHIVO LOG DE ACCESOS
// SE DETERMINA EN BASE A LA FECHA+HORA DE INGRESO A LA BASE DE DATOS
   xSQL := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') IDE, SYSDATE FECHORCON FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   ideconex := cdsQry.FieldByName('IDE').AsString;
   fechorcon := cdsQry.FieldByName('FECHORCON').AsString;

// ENVIA PARAMETROS DE LA PC DEL USUARIO HACIA LA APLICACION SERVIDOR
   DCOM1.AppServer.ConexionON(wUsuario, cIP, wModulo, ideconex, fechorcon, widepc);

// controla caducidad de contraseña
   xSQL := 'SELECT TO_DATE(' + QuotedStr(DateToStr(xfecfin)) + ') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;

   xdiasfaltantes := cdsQry.FieldByName('DIASFALTANTE').AsInteger; // dias que faltan
   If xdiasfaltantes <= xdiasexppass Then
   Begin
      If xdiasfaltantes <= 0 Then
         MessageDlg('SU CONTRASEÑA HA CADUCADO, DEBE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
      Else
         If xdiasfaltantes = 1 Then
            MessageDlg('!!! FALTA 1 DíA PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡' + chr(13)
               + '            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0)
         Else
            MessageDlg('!!! FALTAN ' + IntToStr(xdiasfaltantes) + ' DÍAS PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡' + chr(13)
               + '            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0);
     { FCambioContrasena:= TFCambioContrasena.create(self);
      Try
         FCambioContrasena.ShowModal;
      Finally
         FCambioContrasena.Free;
      End;}
   End;
   If xdiasfaltantes <= 0 Then
   Begin
      Result := False;
      Exit;
   End;

   Result := True;
End;

Function TDMAF.fg_VerificaVersion(wgVersion: String): Boolean;
Var
   xsSQL: String;
Begin
   Result := False;
   xsSQL := 'Select * from TGE600 where CODIGO = ' + QuotedStr(wModulo);
   cdsQry.Close;
   cdsQry.DataRequest(xsSQL);
   cdsQry.Open;
   If Trim(wgVersion) = Trim(cdsQry.FieldByName('VERSION').AsString) Then
      Result := True
   Else
      Result := False;
End;

Function TDMAF.wf_AccesoOpcion(wOpcion: String): Boolean;
Begin
   xSQL := 'Select OBJETO '
      + '     from TGE001 '
      + '    where GRUPOID=' + quotedstr(DMAF.wGrupo)
      + '      and MODULOID=' + quotedstr(DMAF.wModulo)
      + '      and TIPO=' + quotedstr('1')
      + '      and OBJETO=' + quotedstr(wOpcion);
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No tiene Acceso a esta Opción');
      result := False;
   End
   Else
   Begin
      result := True;
   End;
End;

End.

