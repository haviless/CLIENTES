Unit ACF140;
//********************************************************
// CREADO POR       : Abelardo Sulca Palomino
// FECHA DE CREACION: 09/05/2011
// DESCRIPCION      : Ventana de registro de las Solicitudes de cambio
//                    de código de barras
//********************************************************

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, Buttons, StdCtrls, Mask, wwdbedit,
   wwdblook, wwdbdatetimepicker, ExtCtrls, Wwdbdlg, ppEndUsr, ppProd,
   ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCache,
   ppCtrls, ppPrnabl, ppParameter, ppVar;

Type
   TFCambioCodiboBarraAF = Class(TForm)
      dbgCodBarra: TwwDBGrid;
      btnAdiccionaArticulo: TwwIButton;
      bbtn_AceptaCabecera: TBitBtn;
      bbtnRegresa: TBitBtn;
      Z2bbtnAcepta: TBitBtn;
      Z2bbtnImprime: TBitBtn;
      Z2bbtnAnula: TBitBtn;
      pnlEstado: TPanel;
      Label14: TLabel;
      dbdtpFecCambioCodBarra: TwwDBDateTimePicker;
      Label76: TLabel;
      Label1: TLabel;
      edtMotivo_des: TEdit;
      Label2: TLabel;
      dbeObservacion: TwwDBEdit;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      dbeUsuario_des: TEdit;
      pnlCodBarra: TPanel;
      Label60: TLabel;
      Label91: TLabel;
      Label96: TLabel;
      Label131: TLabel;
      Label132: TLabel;
      Label8: TLabel;
      Label134: TLabel;
      edtCodigoBarraDes: TEdit;
      bbtnAdicionaCodBarra: TBitBtn;
      bbtnRetiraCodBarra: TBitBtn;
      dblcCompania: TwwDBLookupCombo;
      dblcMotivo: TwwDBLookupCombo;
      Label7: TLabel;
      dbeSolCambio: TwwDBEdit;
      dbeArticulo: TwwDBEdit;
      dbeTipo: TwwDBEdit;
      dbeTipoDes: TwwDBEdit;
      dbeLocalidad: TwwDBEdit;
      dbeLocalidadDes: TwwDBEdit;
      dbePiso: TwwDBEdit;
      dbePisoDes: TwwDBEdit;
      dbeArea: TwwDBEdit;
      dbeAreaDes: TwwDBEdit;
      dbeAmbiente: TwwDBEdit;
      dbeAmbienteDes: TwwDBEdit;
      dbeResponsable: TwwDBEdit;
      dbeResponsableDes: TwwDBEdit;
      dblcCompania_des: TEdit;
      dbeEstado: TwwDBEdit;
      ppDBPipeline_SolCambioCodbar: TppDBPipeline;
      ppReport_SolCambioCodbar: TppReport;
      ppDesigner_SolCambioCodbar: TppDesigner;
      ppParameterList1: TppParameterList;
      dbeUsuario: TwwDBEdit;
      dbeCodigoBarra_Nuevo: TwwDBEdit;
      Label3: TLabel;
      dbeCodigoBarra_Actual: TwwDBEdit;
      dbeCodigoActivo: TwwDBEdit;
      ppHeaderBand1: TppHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText5: TppDBText;
      ppDBText8: TppDBText;
      ppDBText10: TppDBText;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel57: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel58: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel60: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppDBText13: TppDBText;
      ppShape1: TppShape;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel56: TppLabel;
      ppLine1: TppLine;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel19: TppLabel;
      ppLabel4: TppLabel;
      ppLabel8: TppLabel;
      ppLabel10: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText9: TppDBText;
      ppDBText11: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc2: TppDBCalc;
      ppLabel9: TppLabel;
      ppLine3: TppLine;
      Procedure FormShow(Sender: TObject);
      Procedure dblcCompaniaExit(Sender: TObject);
      Procedure dblcMotivoExit(Sender: TObject);
      Procedure bbtn_AceptaCabeceraClick(Sender: TObject);
      Procedure btnAdiccionaArticuloClick(Sender: TObject);
      Procedure bbtnRetiraCodBarraClick(Sender: TObject);
      Procedure bbtnAdicionaCodBarraClick(Sender: TObject);
      Procedure dbgCodBarraKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnAnulaClick(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);

      Procedure dbeCodigoBarra_ActualExit(Sender: TObject);

   Private
    { Private declarations }
      Procedure Asignalookup;
      Procedure AsignaDataSource;
      Procedure BloqueaCabecera;
      Procedure DesbloqueaCabecera;
      Procedure CompletarDatosActivoEnPanel;
      Procedure GrabaCabecera;
      Procedure LimpiarPanel;
      Procedure RecuperarCabecera;
      Procedure RecuperarDetalle;
      Procedure BloqueaDetalle;
      Procedure DesbloqueaDetalle;
      Function ValidarEstadoActivo(ps_Ciaid, ps_NumSolicitud: String): Boolean;
   Public
    { Public declarations }
      xCia, xNumCambioCodbarra: String;
   End;

Var
   FCambioCodiboBarraAF: TFCambioCodiboBarraAF;

   xSQL: String;
Implementation

Uses ACFDM;
{$R *.dfm}

Procedure TFCambioCodiboBarraAF.Asignalookup;
Begin
// Compañia
   dblcCompania.Selected.Clear;
   dblcCompania.Selected.Add('CIAID'#9'2'#9'CIA'#9'F');
   dblcCompania.Selected.Add('CIADES'#9'25'#9'Descripci'#243'n'#9'F');
   dblcCompania.LookupField := 'CIAID';
   dblcCompania.LookupTable := DMAF.cdsCia;

// Motivo
   xSQL := 'select * from ACF112';
   DMAF.cdsQry9.Close;
   DMAF.cdsQry9.DataRequest(xSQL);
   DMAF.cdsQry9.Open;
   dblcMotivo.LookupField := 'MOTCAMID';
   dblcMotivo.LookupTable := DMAF.cdsQry9;
   dblcMotivo.Selected.Clear;
   dblcMotivo.Selected.Add('MOTCAMID'#9'2'#9'Id'#9'F');
   dblcMotivo.Selected.Add('MOTCAMDES'#9'20'#9'Motivo'#9'F');

// Detalle de la solicitud de desactivacion
   xSQL := ' Select ACF141.ARTCODBAR ARTCODBAR, ACF201.CODIGOBARRA CODIGOBARRA,'
      + '           ACF141.CODIGOBARRA CODIGOBARRA_NUE, ACF141.CODIGOBARRA_ANT CODIGOBARRA_ANT, ACF201.ACFDES '
      + '      from ACF141, ACF201 '
      + '     where ACF141.ARTCODBAR = ACF201.ARTCODBAR '
      + '       and 1 = 2  ';
   DMAF.cdsActFij2.Close;
   DMAF.cdsActFij2.DataRequest(xSQL);
   DMAF.cdsActFij2.Open;
   dbgCodBarra.Selected.Clear;

   dbgCodBarra.Selected.Add('ARTCODBAR'#9'8'#9'Cod~Activo'#9'F');
   dbgCodBarra.Selected.Add('CODIGOBARRA'#9'10'#9'Cod Barras~Actual'#9'F');
   dbgCodBarra.Selected.Add('ACFDES'#9'37'#9'Nombre'#9'F');
   dbgCodBarra.Selected.Add('CODIGOBARRA_NUE'#9'10'#9'Cod Barras~Nuevo'#9'F');
   dbgCodBarra.Selected.Add('CODIGOBARRA_ANT'#9'10'#9'Cod Barras~Anterior'#9'F');
End;

Procedure TFCambioCodiboBarraAF.AsignaDataSource;
Begin
   xSQL := 'Select * from ACF140 where 1=2';
   DMAF.cdsWork1.Close;
   DMAF.cdsWork1.DataRequest(xSQL);
   DMAF.cdsWork1.Open;
   dblcCompania.DataSource := DMAF.dsWork1;
   dblcCompania.DataField := 'CIAID';
   dbeSolCambio.DataSource := DMAF.dsWork1;
   dbeSolCambio.DataField := 'NUMSOLCAM';
   dblcMotivo.DataSource := DMAF.dsWork1;
   dblcMotivo.DataField := 'MOTCAMID';
   dbeUsuario.DataSource := DMAF.dsWork1;
   dbeUsuario.DataField := 'USUREG';
   dbdtpFecCambioCodBarra.DataSource := DMAF.dsWork1;
   dbdtpFecCambioCodBarra.DataField := 'FECHA';
   dbeObservacion.DataSource := DMAF.dsWork1;
   dbeObservacion.DataField := 'OBSERVACION';
   dbeEstado.DataSource := DMAF.dsWork1;
   dbeEstado.DataField := 'ESTADO';
   dbgCodBarra.DataSource := DMAF.dsActFij2;
End;

Procedure TFCambioCodiboBarraAF.FormShow(Sender: TObject);
Begin
   pnlCodBarra.Visible := False;
   Asignalookup;
   AsignaDataSource;
   btnAdiccionaArticulo.Enabled := False;
   If DMAF.wModo = 'A' Then
   Begin
      DesbloqueaCabecera;
      BloqueaDetalle;
      DMAF.cdsWork1.Edit;
      DMAF.cdsWork1.FieldbyName('ESTADO').AsString := 'INICIAL';
      DMAF.cdsWork1.FieldbyName('CIAID').AsString := '02';
      xSQL := 'CIAID=' + quotedstr('02');
      dblcCompania_des.text := DMAF.DisplayDescrip('dspTGE', 'TGE101', 'CIADES', xSQL, 'CIADES');
      DMAF.cdsWork1.FieldbyName('USUREG').AsString := DMAF.wUsuario;
      xSQL := 'USUARIO=' + quotedstr(DMAF.wUsuario);
      dbeUsuario_des.text := DMAF.DisplayDescrip('dspTGE', 'ACF115', 'NOMBRE', xSQL, 'NOMBRE');
      If dbeUsuario_des.text = '' Then
      Begin
         ShowMessage(DMAF.wUsuario + ' No es usuario de Servicios Generales, No puede continuar');
         FCambioCodiboBarraAF.close;
      End;
      dbdtpFecCambioCodBarra.Date := now;
   End
   Else
      If DMAF.wModo = 'M' Then
      Begin
      // recuperar solicitud de desactivacion
         dblcCompania.Enabled := False;
         DesbloqueaCabecera;
         BloqueaDetalle;
         RecuperarCabecera;
         RecuperarDetalle;
         If (dbeEstado.Text = 'ACEPTADO') Or (dbeEstado.Text = 'ANULADO') Then
         Begin
            BloqueaCabecera;
            BloqueaDetalle;
         End
         Else
            If dbeEstado.Text = 'INICIAL' Then
            Begin
               DMAF.cdsWork1.Edit;
            End;
      End;
End;

Procedure TFCambioCodiboBarraAF.GrabaCabecera;
Var
   ls_anio, ls_NumeroSolicitud: String;
Begin
   DMAF.wModo := 'M';
   DMAF.cdsWork1.Edit;

   ls_anio := Copy(datetoStr(dbdtpFecCambioCodBarra.Date), 7, 4);
// si numero no existe se genera numero
   If dbeSolCambio.Text = '' Then
   Begin
      xSQL := 'TO_CHAR(FECHA,' + QuotedStr('YYYY') + ') = ' + QuotedStr(ls_anio);
      ls_NumeroSolicitud := DMAF.DisplayDescrip('dspTGE', 'ACF140', 'LPAD( NVL(MAX(TO_NUMBER(SUBSTR(NUMSOLCAM,5,4)))+1,1),4,' + QuotedStr('0') + ') as F', xSQL, 'F');
      DMAF.cdsWork1.FieldByName('NUMSOLCAM').AsString := ls_anio + ls_NumeroSolicitud;
      DMAF.cdsWork1.FieldByName('USUREG').AsString := DMAF.wUsuario;
      DMAF.cdsWork1.FieldByName('FECREG').Value := now;
   End
   Else
   Begin
      DMAF.cdsWork1.FieldByName('USUMOD').AsString := DMAF.wUsuario;
      DMAF.cdsWork1.FieldByName('FECMOD').Value := now;
   End;

   DMAF.cdsWork1.ApplyUpdates(0);
   xCia := dblcCompania.Text;
   xNumCambioCodbarra := dbeSolCambio.Text;
End;

Procedure TFCambioCodiboBarraAF.dblcCompaniaExit(Sender: TObject);
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCompania.Text);
   If dblcCompania.Text = '' Then
   Begin
      dblcCompania_des.Text := '';
      exit;
   End;
   If dblcCompania.text <> '' Then
   Begin
      dblcCompania_des.text := DMAF.DisplayDescrip('dspTGE', 'TGE101', 'CIADES', xSQL, 'CIADES');
      If dblcCompania_des.text = '' Then
      Begin
         showmessage('Ingrese una Compañía válida');
         dblcCompania.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFCambioCodiboBarraAF.dblcMotivoExit(Sender: TObject);
Begin
   xSQL := 'MOTCAMID=' + quotedstr(dblcMotivo.Text);
   If dblcMotivo.Text = '' Then
   Begin
      edtMotivo_des.Text := '';
      exit;
   End;
   If dblcMotivo.Text <> '' Then
   Begin
      edtMotivo_des.Text := DMAF.DisplayDescrip('dspTGE', 'ACF112', 'MOTCAMDES', xSQL, 'MOTCAMDES');
      If edtMotivo_des.Text = '' Then
      Begin
         ShowMessage('Ingrese un Motivo válido de cambio de Código de Barras');
         dblcMotivo.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFCambioCodiboBarraAF.bbtn_AceptaCabeceraClick(Sender: TObject);
Begin
   If dblcCompania.Text = '' Then
   Begin
      showmessage('Debe ingresar la Compañía');
      dblcCompania.SetFocus;
      exit;
   End;
   If dblcMotivo.Text = '' Then
   Begin
      showmessage('Debe ingresar el Motivo de la Desactivación');
      dblcMotivo.SetFocus;
      exit;
   End;
   If dbeUsuario.Text = '' Then
   Begin
      showmessage('Debe ingresar el Usuario que Registra');
      dbeUsuario.SetFocus;
      exit;
   End;
   If dbdtpFecCambioCodBarra.Text = '' Then
   Begin
      showmessage('Debe ingresar la fecha de la Solicitud de Cambio de Codigo de Barras');
      dbdtpFecCambioCodBarra.SetFocus;
      exit;
   End;
   If dbeObservacion.Text = '' Then
   Begin
      showmessage('Debe ingresar un comentario en el campo Observacion');
      dbeObservacion.SetFocus;
      exit;
   End;
   BloqueaCabecera;
   DesbloqueaDetalle;
   btnAdiccionaArticulo.Enabled := True;
End;

Procedure TFCambioCodiboBarraAF.BloqueaCabecera;
Begin
   dblcCompania.Enabled := false;
   dblcMotivo.Enabled := false;
   dbeUsuario.Enabled := false;
   dbdtpFecCambioCodBarra.Enabled := false;
   dbeObservacion.Enabled := false;
   bbtn_AceptaCabecera.Enabled := false;
End;

Procedure TFCambioCodiboBarraAF.DesbloqueaCabecera;
Begin
   dblcMotivo.Enabled := True;
   dbdtpFecCambioCodBarra.Enabled := True;
   dbeObservacion.Enabled := True;
   bbtn_AceptaCabecera.Enabled := True;
End;

Procedure TFCambioCodiboBarraAF.BloqueaDetalle;
Begin
   btnAdiccionaArticulo.Enabled := false;
   dbgCodBarra.Enabled := false;
   bbtnRegresa.Enabled := false;
   Z2bbtnAcepta.Enabled := false;
   Z2bbtnAnula.Enabled := false;
End;

Procedure TFCambioCodiboBarraAF.DesbloqueaDetalle;
Begin
   btnAdiccionaArticulo.Enabled := True;
   dbgCodBarra.Enabled := True;
   bbtnRegresa.Enabled := True;
   Z2bbtnAcepta.Enabled := True;
   Z2bbtnAnula.Enabled := True;
End;

Procedure TFCambioCodiboBarraAF.CompletarDatosActivoEnPanel;
Begin
   If DMAF.cdsActFij.RecordCount > 0 Then
   Begin
      dbeArticulo.Text := DMAF.cdsActFij.FieldbyName('ARTID').AsString;
      edtCodigoBarraDes.Text := DMAF.cdsActFij.FieldbyName('ACFDES').AsString;
      dbeTipo.Text := DMAF.cdsActFij.FieldbyName('TACFID').AsString;
      xSQL := 'TACFID = ' + QuotedStr(dbeTipo.Text);
      dbeTipoDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF101', 'TACFDES', xSQL, 'TACFDES');
      dbeLocalidad.Text := DMAF.cdsActFij.FieldbyName('LOCID').AsString;
      xSQL := 'LOCID  = ' + QuotedStr(dbeLocalidad.Text);
      dbeLocalidadDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF120', 'LOCDES', xSQL, 'LOCDES');
      dbePiso.Text := DMAF.cdsActFij.FieldbyName('PISO').AsString;
      xSQL := xSQL + ' AND PISO = ' + QuotedStr(dbePiso.Text);
      dbePisoDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF121', 'PISODES', xSQL, 'PISODES');
      dbeArea.Text := DMAF.cdsActFij.FieldbyName('AREA').AsString;
      xSQL := xSQL + ' AND AREA = ' + QuotedStr(dbeArea.Text);
      dbeAreaDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF122', 'AREADES', xSQL, 'AREADES');
      dbeAmbiente.Text := DMAF.cdsActFij.FieldbyName('AMBCOD').AsString;
      xSQL := xSQL + ' AND AMBCOD = ' + QuotedStr(dbeAmbiente.Text);
      dbeAmbienteDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF123', 'AMBDES', xSQL, 'AMBDES');
      dbeResponsable.Text := DMAF.cdsActFij.FieldbyName('RECIBEID').AsString;
      dbeResponsableDes.Text := DMAF.cdsActFij.FieldbyName('RECIBENOM').AsString;
      dbeCodigoActivo.Text := DMAF.cdsActFij.FieldbyName('ARTCODBAR').AsString;
   End;
End;

Procedure TFCambioCodiboBarraAF.btnAdiccionaArticuloClick(Sender: TObject);
Begin
   pnlCodBarra.Visible := True;
End;

Procedure TFCambioCodiboBarraAF.bbtnRetiraCodBarraClick(Sender: TObject);
Begin
   pnlCodBarra.Visible := False;
   LimpiarPanel;
End;

Procedure TFCambioCodiboBarraAF.bbtnAdicionaCodBarraClick(Sender: TObject);
Begin
   CompletarDatosActivoEnPanel;
   If (dbeCodigoBarra_Actual.Text = '') Or (edtCodigoBarraDes.Text = '') Then
   Begin
      showmessage('Debe ingresar un Código de Barras válido');
      dbeCodigoBarra_Actual.SetFocus;
      exit;
   End;
   If (dbeCodigoBarra_Nuevo.Text = '') Then
   Begin
      showmessage('Debe ingresar el nuevo Código de Barras');
      dbeCodigoBarra_Nuevo.SetFocus;
      exit;
   End;

// Verificando si el activo ya fue ingresado
   xSQL := ' SELECT 1 FROM ACF141 WHERE CIAID  = ' + QuotedStr(dblcCompania.Text) +
      ' AND NUMSOLCAM = ' + QuotedStr(dbeSolCambio.Text) +
      ' AND ARTCODBAR = ' + QuotedStr(dbeCodigoActivo.Text);
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.recordcount > 0 Then
   Begin
      ShowMessage('Esta activo ya EXISTE en la Solicitud de Cambio de Código de Barras');
      Exit;
   End;

// Verificando si el código de barras a ingresar ya existe actualmente
   xSQL := ' SELECT 1 FROM ACF201 WHERE CODIGOBARRA = ' + QuotedStr(dbeCodigoBarra_Nuevo.Text);
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.recordcount > 0 Then
   Begin
      ShowMessage('Esta activo ya está siendo Utilizado en el maestro de Activos');
      Exit;
   End;

// Verificando si el código de barras a ingresar ya existe actualmente
   xSQL := ' SELECT 1 FROM ACF141 WHERE CODIGOBARRA = ' + QuotedStr(dbeCodigoBarra_Nuevo.Text);
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.recordcount > 0 Then
   Begin
      ShowMessage('Esta activo ya está siendo Utilizado en esta Solicitud de Cambio');
      Exit;
   End;

   GrabaCabecera;

   xSQL := ' Insert into ACF141 (CIAID,NUMSOLCAM,ARTCODBAR,CODIGOBARRA, '
      + '                        CODIGOBARRA_ANT,USUREG,FECREG,USUMOD,FECMOD) '
      + '    Values(' + QuotedStr(dblcCompania.Text)+ ', '
      +                 QuotedStr(dbeSolCambio.Text)+ ', '
      +                 QuotedStr(dbeCodigoActivo.Text)+', '
      +                 QuotedStr(dbeCodigoBarra_Nuevo.Text)+', '
      +                 QuotedStr(dbeCodigoBarra_Actual.Text)+', USER, SYSDATE,NULL,NULL )';
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   RecuperarDetalle;
   LimpiarPanel;
   dbeCodigoBarra_Actual.SetFocus;
End;

Procedure TFCambioCodiboBarraAF.LimpiarPanel;
Begin
   dbeArticulo.Text := '';
   dbeCodigoBarra_Actual.Text := '';
   edtCodigoBarraDes.Text := '';
   dbeTipo.Text := '';
   dbeTipoDes.Text := '';
   dbeLocalidad.Text := '';
   dbeLocalidadDes.Text := '';
   dbePiso.Text := '';
   dbePisoDes.Text := '';
   dbeArea.Text := '';
   dbeAreaDes.Text := '';
   dbeAmbiente.Text := '';
   dbeAmbienteDes.Text := '';
   dbeResponsable.Text := '';
   dbeResponsableDes.Text := '';
   dbeCodigoBarra_Nuevo.Text := '';
   dbeCodigoActivo.Text := '';
End;

Procedure TFCambioCodiboBarraAF.RecuperarCabecera;
Begin
   If dbeSolCambio.Text = '' Then
   Begin
      xCia := DMAF.cdsQry10.FieldbyName('CIAID').AsString;
      xNumCambioCodbarra := DMAF.cdsQry10.FieldbyName('NUMSOLCAM').AsString;
   End;
   xSQL := 'Select * from ACF140 '
      + '    where CIAID = ' + QuotedStr(xCia)
      + '      and NUMSOLCAM = ' + QuotedStr(xNumCambioCodbarra);
   DMAF.cdsWork1.Close;
   DMAF.cdsWork1.DataRequest(xSQL);
   DMAF.cdsWork1.Open;
   xSQL := 'CIAID=' + quotedstr(dblcCompania.Text);
   dblcCompania_des.text := DMAF.DisplayDescrip('dspTGE', 'TGE101', 'CIADES', xSQL, 'CIADES');
   xSQL := 'MOTCAMID=' + quotedstr(dblcMotivo.Text);
   edtMotivo_des.Text := DMAF.DisplayDescrip('dspTGE', 'ACF112', 'MOTCAMDES', xSQL, 'MOTCAMDES');
   xSQL := 'USUARIO=' + quotedstr(dbeUsuario.Text);
   dbeUsuario_des.text := DMAF.DisplayDescrip('dspTGE', 'ACF115', 'NOMBRE', xSQL, 'NOMBRE');

   If DMAF.cdsWork1.FieldbyName('ESTADO').AsString = 'ACEPTADO' Then
      dbeEstado.Font.Color := clGreen
   Else
   Begin
      If DMAF.cdsWork1.FieldbyName('ESTADO').AsString = 'ANULADO' Then
         dbeEstado.Font.Color := clRed
      Else
         dbeEstado.Font.Color := clBlue;
   End;
End;

Procedure TFCambioCodiboBarraAF.RecuperarDetalle;
Begin
   xSQL := ' Select ACF141.ARTCODBAR ARTCODBAR, ACF201.CODIGOBARRA CODIGOBARRA,'
      + '           ACF141.CODIGOBARRA CODIGOBARRA_NUE, ACF141.CODIGOBARRA_ANT CODIGOBARRA_ANT, ACF201.ACFDES '
      + '      from ACF141, ACF201 '
      + '     where ACF141.ARTCODBAR = ACF201.ARTCODBAR '
      + '       and ACF141.CIAID =  ' + QuotedStr(xCia)
      + '       and ACF141.NUMSOLCAM = ' + QuotedStr(xNumCambioCodbarra);
   DMAF.cdsActFij2.Close;
   DMAF.cdsActFij2.DataRequest(xSQL);
   DMAF.cdsActFij2.Open;
End;

Procedure TFCambioCodiboBarraAF.dbgCodBarraKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Var
   ls_codbar, ls_codbar_des, ls_solCambiosCodBarras, ls_ciaid: String;
   ls_codActivo: String;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      ls_codActivo := DMAF.cdsActFij2.FieldbyName('ARTCODBAR').AsString;
      ls_codbar := DMAF.cdsActFij2.FieldbyName('CODIGOBARRA').AsString;
      ls_codbar_des := DMAF.cdsActFij2.FieldbyName('ACFDES').AsString;
      ls_ciaid := DMAF.cdsActFij2.FieldbyName('CIAID').AsString;
      ls_solCambiosCodBarras := DMAF.cdsActFij2.FieldbyName('NUMSOLCAM').AsString;
      If MessageDlg('El activo: ' + ls_codbar + '-' + ls_codbar_des + #13 +
         'de la Solicitud de Cambio de Codigo de barras: ' + ls_solCambiosCodBarras + #13 +
         'Será quitada, ¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
      Begin
         xSQL := ' Delete ACF141 '
            + '     where ACF141.CIAID = ' + QuotedStr(ls_ciaid)
            + '       and ACF141.NUMSOLCAM = ' + QuotedStr(ls_solCambiosCodBarras)
            + '       and ACF141.ARTCODBAR = ' + QuotedStr(ls_codActivo);
         DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
         RecuperarDetalle;
      End;
   End;
End;

Procedure TFCambioCodiboBarraAF.Z2bbtnAceptaClick(Sender: TObject);
Begin
   If DMAF.cdsActFij2.RecordCount = 0 Then
   Begin
      ShowMessage('No hay Activos en el detalle para Cambiar su Código de Barras');
      Exit;
   End;

   If MessageDlg('La Solicitud de Cambio de Código de Barras: ' + dbeSolCambio.Text + #13 +
      'pasará a estado ACEPTADO ' + #13 +
      '¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin
   // Verificando si los activos están en estado A (Activo)
      If ValidarEstadoActivo(dblcCompania.Text, dbeSolCambio.Text) = False Then
      Begin
         exit;
      End;

   // Cambiando el código de Barras
      xSQL := ' Update ACF201 '
         + '       set ACF201.CODIGOBARRA = (Select ACF141.CODIGOBARRA '
         + '                                   from ACF141 '
         + '                                  where ACF141.CIAID  = ' + QuotedStr(dblcCompania.Text)
         + '                                    and ACF141.NUMSOLCAM = ' + QuotedStr(dbeSolCambio.Text)
         + '                                    and ACF141.ARTCODBAR = ACF201.ARTCODBAR ) '
         + '     where Exists (Select 1 from ACF141  '
         + '                    Where ACF141.ARTCODBAR = ACF201.ARTCODBAR '
         + '                      and ACF141.CIAID = ' + QuotedStr(dblcCompania.Text)
         + '                      and ACF141.NUMSOLCAM =' + QuotedStr(dbeSolCambio.Text) + ') ';
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);

      xSQL := ' Update ACF140 '
         + '       set ESTADO = ' + QuotedStr('ACEPTADO')
         + '     where CIAID = ' + QuotedStr(dblcCompania.Text)
         + '       and NUMSOLCAM = ' + QuotedStr(dbeSolCambio.Text);
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      RecuperarCabecera;
      BloqueaCabecera;
      BloqueaDetalle;
      ShowMessage('Los activos Cambiaron de Código de Barras correctamente');
   End;
End;

Procedure TFCambioCodiboBarraAF.bbtnRegresaClick(Sender: TObject);
Begin
   DesbloqueaCabecera;
   BloqueaDetalle;
End;

Procedure TFCambioCodiboBarraAF.Z2bbtnAnulaClick(Sender: TObject);
Begin
   If dbeEstado.Text <> 'INICIAL' Then
   Begin
      showmessage('Sólo puede Anular solicitudes de Cambio en estado INICIAL');
      exit;
   End;
   If MessageDlg('La Solicitud de Cambio de Codigo de Barras: ' + dbeSolCambio.Text + #13 +
      'pasará a estado ANULADO ' + #13 +
      '¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin
      xSQL := ' Update ACF140 '
         + '       set ESTADO = ' + QuotedStr('ANULADO')
         + '     where CIAID = ' + QuotedStr(dblcCompania.Text)
         + '       and NUMSOLCAM = ' + QuotedStr(dbeSolCambio.Text);
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      RecuperarCabecera;
      BloqueaCabecera;
      BloqueaDetalle;
   End;
End;

Function TFCambioCodiboBarraAF.ValidarEstadoActivo(ps_Ciaid, ps_NumSolicitud: String): Boolean;
Begin
   xSQL := ' Select * from ACF201 '
      + '     where ACF201.ACFFLAGACT not in (''P'',''A'') '
      + '       and exists (Select 1 FROM ACF141 '
      + '                    where ACF141.ARTCODBAR = ACF201.ARTCODBAR '
      + '                      and ACF141.CIAID = ' + QuotedStr(ps_Ciaid)
      + '                      and ACF141.NUMSOLCAM = ' + QuotedStr(ps_NumSolicitud) + ' ) ';
   DMAF.cdsActFij3.Close;
   DMAF.cdsActFij3.DataRequest(xSQL);
   DMAF.cdsActFij3.Open;
   If DMAF.cdsActFij3.RecordCount > 0 Then
   Begin
      ShowMessage('El Activo con Código de Barra: ' + #13 + DMAF.cdsActFij3.FieldbyName('CODIGOBARRA').AsString +
         '-' + DMAF.cdsActFij3.FieldbyName('ACFDES').AsString + #13 +
         'Tiene estado: ' + DMAF.cdsActFij3.FieldbyName('ACFFLAGACT').AsString +
         ' y no se puede cambiar Su Código de Barras');
      Result := False;
      Exit;
   End;
   Result := True;
End;

Procedure TFCambioCodiboBarraAF.Z2bbtnImprimeClick(Sender: TObject);
Begin
   If dbeSolCambio.Text = '' Then
   Begin
      exit;
   End;
   xSQL := ' Select ACF140.CIAID COMPANIA, '
      + '           (SELECT TGE101.CIADES FROM TGE101 WHERE TGE101.CIAID =  ACF140.CIAID) COMPANIA_DESC,  '
      + '           ACF140.NUMSOLCAM SOL_CAMBIOCODBAR,  '
      + '           ACF140.MOTCAMID MOTIVO,  '
      + '           (SELECT ACF112.MOTCAMDES FROM ACF112 WHERE ACF112.MOTCAMID = ACF140.MOTCAMID) MOTIVO_DESC, '
      + '           ACF140.USUREG USUARIO ,  '
      + '           (SELECT UPPER(ACF115.NOMBRE) FROM ACF115 WHERE ACF115.USUARIO = ACF140.USUREG ) USUARIO_DESC,  '
      + '           ACF140.OBSERVACION OBSERVACION, '
      + '           ACF140.FECHA FECHA, '
      + '           ACF201.CODIGOBARRA CODIGO_BARRA, '
      + '           ACF201.ACFDES ACTIVO_DESCRIPCION, '
      + '           ACF141.CODIGOBARRA CODBAR_NUEVO, '
      + '           ACF141.CODIGOBARRA_ANT CODBAR_ANTERIOR, '
      + '           ACF140.ESTADO ESTADO, '
      + '           ACF141.ARTCODBAR CODIGOACTIVO, '
      +             QuotedStr(DMAF.wUsuario) + ' USUARIO_IMPRIME '
      + '      from ACF140, ACF141, ACF201 '
      + '     where ACF140.CIAID = ACF141.CIAID '
      + '       and ACF140.NUMSOLCAM = ACF141.NUMSOLCAM '
      + '       and ACF141.ARTCODBAR = ACF201.ARTCODBAR  '
      + '       and ACF140.CIAID = ' + QuotedStr(dblcCompania.Text)
      + '       and ACF140.NUMSOLCAM = ' + QuotedStr(dbeSolCambio.Text);
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppDBPipeline_SolCambioCodbar.DataSource := DMAF.dsQry;
   ppReport_SolCambioCodbar.DataPipeline := ppDBPipeline_SolCambioCodbar;
   ppReport_SolCambioCodbar.Template.FileName := wRutaRpt + 'ACF\DEMA\SolCambioCodBarras.rtm';

   ppReport_SolCambioCodbar.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppDesigner_SolCambioCodbar.Report := ppReport_SolCambioCodbar ;
   //ppDesigner_SolCambioCodbar.ShowModal() ;
   ppReport_SolCambioCodbar.Print;

End;

Procedure TFCambioCodiboBarraAF.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCambioCodiboBarraAF.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMAF.cdsQry9.Close;
   DMAF.cdsUsuario.Close;
   DMAF.cdsTrab.Close;
   DMAF.cdsActFij2.Close;
   DMAF.cdsActFij.Close;
   DMAF.cdsWork1.Close;
   DMAF.cdsWork2.Close;
   DMAF.cdsActFij.Close;
   DMAF.cdsQry.Close;
   DMAF.cdsActFij3.Close;
   FCambioCodiboBarraAF.Free;
End;

Procedure TFCambioCodiboBarraAF.dbeCodigoBarra_ActualExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If dbeCodigoBarra_Actual.Text = '' Then
   Begin
      LimpiarPanel;
      Exit;
   End;

   xSQL := 'Select * from ACF201 WHERE CODIGOBARRA = ' + QuotedStr(dbeCodigoBarra_Actual.Text);
   DMAF.cdsActFij.Close;
   DMAF.cdsActFij.DataRequest(xSQL);
   DMAF.cdsActFij.Open;

   If DMAF.cdsActFij.RecordCount = 0 Then
   Begin
      ShowMessage('Código de barras no existe');
      dbeCodigoBarra_Actual.SetFocus;
      Exit;
   End;

   If DMAF.cdsActFij.FieldbyName('ACFFLAGACT').AsString = 'I' Then
   Begin
      ShowMessage('Código de barras se encuentra Inactivado');
      dbeCodigoBarra_Actual.SetFocus;
      Exit;
   End;
   CompletarDatosActivoEnPanel;
End;

End.

