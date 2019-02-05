Unit ACF130;
//********************************************************
// CREADO POR       : Abelardo Sulca Palomino
// Nº HPP           : HPP_201104_ACF
// FECHA DE CREACION: 01/04/2011
// DESCRIPCION      : Ventana de mantenimiento de la Solicitud de Desactivación
//********************************************************
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201107_ACF
// FECHA DE MODIF.  : 13/05/2011
// DESCRIPCION      : Por el cambio de Código de Barras del Activo Fijo
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
   TFDesactivacionAF = Class(TForm)
      dbgCodBarra: TwwDBGrid;
      btnAdiccionaArticulo: TwwIButton;
      bbtn_AceptaCabecera: TBitBtn;
      bbtnRegresa: TBitBtn;
      Z2bbtnAcepta: TBitBtn;
      Z2bbtnImprime: TBitBtn;
      Z2bbtnAnula: TBitBtn;
      pnlEstado: TPanel;
      Label14: TLabel;
      dbdtpFecSolicita: TwwDBDateTimePicker;
      Label76: TLabel;
      Label1: TLabel;
      edtMotivo_des: TEdit;
      Label2: TLabel;
      dbdtpFecAutoriza: TwwDBDateTimePicker;
      Label3: TLabel;
      Label133: TLabel;
      edtUsuAutorizaDes: TEdit;
      dbeObservacion: TwwDBEdit;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      dblUsuSolicita_des: TEdit;
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
      dblUsuSolicita: TwwDBLookupComboDlg;
      dblUsuAutoriza: TwwDBLookupComboDlg;
      dblCodigoBarra: TwwDBLookupComboDlg;
      Label7: TLabel;
      dbeSolDesactivacion: TwwDBEdit;
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
      ppDBPipeline_SolDesactivacion: TppDBPipeline;
      ppReport_SolDesactivacion: TppReport;
      ppDesigner_SolDesactivacion: TppDesigner;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppFooterBand1: TppFooterBand;
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
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLine1: TppLine;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppLine10: TppLine;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppLine13: TppLine;
      ppLine14: TppLine;
      ppLine15: TppLine;
      ppLine16: TppLine;
      ppLine17: TppLine;
      ppLine18: TppLine;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      dblCodigoBarra_actual: TwwDBLookupComboDlg;
      Procedure FormShow(Sender: TObject);
      Procedure dblcCompaniaExit(Sender: TObject);
      Procedure dblcMotivoExit(Sender: TObject);
      Procedure dblUsuSolicitaExit(Sender: TObject);
      Procedure bbtn_AceptaCabeceraClick(Sender: TObject);
      Procedure btnAdiccionaArticuloClick(Sender: TObject);
      Procedure bbtnRetiraCodBarraClick(Sender: TObject);
      Procedure dblCodigoBarraExit(Sender: TObject);
      Procedure bbtnAdicionaCodBarraClick(Sender: TObject);
      Procedure dbgCodBarraKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnAnulaClick(Sender: TObject);
      Procedure dblUsuAutorizaExit(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblCodigoBarra_actualExit(Sender: TObject);

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
      xCia, xNumSolDesactivacion: String;
   End;

Var
   FDesactivacionAF: TFDesactivacionAF;

   xSQL: String;
Implementation

Uses ACFDM;
{$R *.dfm}

Procedure TFDesactivacionAF.Asignalookup;
Begin
// Compañia
   dblcCompania.Selected.Clear;
   dblcCompania.Selected.Add('CIAID'#9'2'#9'CIA'#9'F');
   dblcCompania.Selected.Add('CIADES'#9'25'#9'Descripci'#243'n'#9'F');
   dblcCompania.LookupField := 'CIAID';
   dblcCompania.LookupTable := DMAF.cdsCia;

// Motivo
   xSQL := 'select * from ACF105';
   DMAF.cdsQry9.Close;
   DMAF.cdsQry9.DataRequest(xSQL);
   DMAF.cdsQry9.Open;
   dblcMotivo.LookupField := 'DESACID';
   dblcMotivo.LookupTable := DMAF.cdsQry9;
   dblcMotivo.Selected.Clear;
   dblcMotivo.Selected.Add('DESACID'#9'2'#9'Id'#9'F');
   dblcMotivo.Selected.Add('DESACDES'#9'20'#9'Motivo'#9'F');

// Usuario solicita
   xSQL := 'select * from ACF115';
   DMAF.cdsUsuario.Close;
   DMAF.cdsUsuario.DataRequest(xSQL);
   DMAF.cdsUsuario.Open;
   dblUsuSolicita.Selected.Clear;
   dblUsuSolicita.Selected.Add('USUARIO'#9'12'#9'C'#243'digo'#9'F');
   dblUsuSolicita.Selected.Add('NOMBRE'#9'40'#9'Nombre'#9'F');
   dblUsuSolicita.LookupField := 'USUARIO';
   dblUsuSolicita.LookupTable := DMAF.cdsUsuario;

// Usuario Autoriza
   xSQL := 'Select RECIBEID,RECIBENOM,CCOSID from ACF126 WHERE FLGAUTDES = ' + QuotedStr('S');
   DMAF.cdsTrab.Close;
   DMAF.cdsTrab.DataRequest(xSQL);
   DMAF.cdsTrab.Open;
   dblUsuAutoriza.Selected.Clear;
   dblUsuAutoriza.Selected.Add('RECIBEID'#9'12'#9'C'#243'digo'#9'F');
   dblUsuAutoriza.Selected.Add('RECIBENOM'#9'40'#9'Nombre'#9'F');
   dblUsuAutoriza.LookupField := 'RECIBEID';
   dblUsuAutoriza.LookupTable := DMAF.cdsTrab;

// Detalle de la solicitud de desactivacion
   xSQL := ' Select ACF201.CODIGOBARRA, ACF131.ARTCODBAR,ACF131.ARTID, ACF201.ACFDES,ACF201.RECIBEID, ACF201.RECIBENOM, ACF201.ACFID, '
      + '           ACF131.CIAID,  ACF131.NUMSOLDES '
      + '      from ACF131, ACF201 '
      + '     where ACF131.ARTCODBAR = ACF201.ARTCODBAR '
      + '       and 1 = 2 ';
   DMAF.cdsActFij2.Close;
   DMAF.cdsActFij2.DataRequest(xSQL);
   DMAF.cdsActFij2.Open;
   dbgCodBarra.Selected.Clear;
   dbgCodBarra.Selected.Add('CODIGOBARRA'#9'8'#9'Cod~Barra'#9'F');
   dbgCodBarra.Selected.Add('ARTID'#9'8'#9'Cod~Art'#237'culo'#9'F');
   dbgCodBarra.Selected.Add('ACFDES'#9'20'#9'Nombre'#9'F');
   dbgCodBarra.Selected.Add('RECIBEID'#9'8'#9'Cod~Resp'#9'F');
   dbgCodBarra.Selected.Add('RECIBENOM'#9'40'#9'Responsable'#9'F');
   dbgCodBarra.Selected.Add('ARTCODBAR'#9'8'#9'Cod~Activo'#9'F');

// Artículo
   xSQL := 'Select * from ACF201 WHERE 1 = 2';
   DMAF.cdsActFij.Close;
   DMAF.cdsActFij.DataRequest(xSQL);
   DMAF.cdsActFij.Open;
   dblCodigoBarra_actual.Selected.Clear;
   dblCodigoBarra_actual.Selected.Add('CODIGOBARRA'#9'8'#9'Cod Barra'#9'F');
   dblCodigoBarra_actual.Selected.Add('ACFDES'#9'25'#9'Descripci'#243'n'#9'F');
   dblCodigoBarra_actual.LookupField := 'CODIGOBARRA';
   dblCodigoBarra_actual.LookupTable := DMAF.cdsActFij;
End;

Procedure TFDesactivacionAF.AsignaDataSource;
Begin
   xSQL := 'Select * from ACF130 where 1=2';
   DMAF.cdsWork1.Close;
   DMAF.cdsWork1.DataRequest(xSQL);
   DMAF.cdsWork1.Open;
   dblcCompania.DataSource := DMAF.dsWork1;
   dblcCompania.DataField := 'CIAID';
   dbeSolDesactivacion.DataSource := DMAF.dsWork1;
   dbeSolDesactivacion.DataField := 'NUMSOLDES';
   dblcMotivo.DataSource := DMAF.dsWork1;
   dblcMotivo.DataField := 'DESACID';
   dblUsuSolicita.DataSource := DMAF.dsWork1;
   dblUsuSolicita.DataField := 'USUARIO';
   dbdtpFecSolicita.DataSource := DMAF.dsWork1;
   dbdtpFecSolicita.DataField := 'FECHA';
   dblUsuAutoriza.DataSource := DMAF.dsWork1;
   dblUsuAutoriza.DataField := 'USUAUT';
   dbdtpFecAutoriza.DataSource := DMAF.dsWork1;
   dbdtpFecAutoriza.DataField := 'FECAUT';
   dbeObservacion.DataSource := DMAF.dsWork1;
   dbeObservacion.DataField := 'OBSERVACION';

   dbeEstado.DataSource := DMAF.dsWork1;
   dbeEstado.DataField := 'ESTADO';

   dbgCodBarra.DataSource := DMAF.dsActFij2;

// Panel de activos a desactivar
   xSQL := 'select * from ACF131 where 1=2';
   DMAF.cdsWork2.Close;
   DMAF.cdsWork2.DataRequest(xSQL);
   DMAF.cdsWork2.Open;
End;

Procedure TFDesactivacionAF.FormShow(Sender: TObject);
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
      DMAF.cdsWork1.FieldbyName('USUARIO').AsString := DMAF.wUsuario;
      xSQL := 'USUARIO=' + quotedstr(DMAF.wUsuario);
      dblUsuSolicita_des.text := DMAF.DisplayDescrip('dspTGE', 'ACF115', 'NOMBRE', xSQL, 'NOMBRE');
      If dblUsuSolicita_des.text = '' Then
      Begin
         ShowMessage(DMAF.wUsuario + ' No es usuario de Servicios Generales, No puede continuar');
         FDesactivacionAF.close;
      End;
      dbdtpFecSolicita.Date := now;
   End
   Else
   Begin
      If DMAF.wModo = 'M' Then
      Begin
      //recuperar solicitud de desactivacion
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
End;

Procedure TFDesactivacionAF.GrabaCabecera;
Var
   ls_anio, ls_NumeroSolicitud: String;
Begin
   ls_anio := Copy(datetoStr(dbdtpFecSolicita.Date), 7, 4);
// si numero no existe se genera numero
   If dbeSolDesactivacion.Text = '' Then
   Begin
      xSQL := 'TO_CHAR(FECHA,' + QuotedStr('YYYY') + ') = ' + QuotedStr(ls_anio);
      ls_NumeroSolicitud := DMAF.DisplayDescrip('dspTGE', 'ACF130', 'LPAD( NVL(MAX(TO_NUMBER(SUBSTR(NUMSOLDES,5,4)))+1,1),4,' + QuotedStr('0') + ') as F', xSQL, 'F');
      DMAF.cdsWork1.FieldByName('NUMSOLDES').AsString := ls_anio + ls_NumeroSolicitud;
      DMAF.cdsWork1.FieldByName('USUREG').AsString := DMAF.wUsuario;
      DMAF.cdsWork1.FieldByName('FECREG').Value := now;
   End
   Else
   Begin
      DMAF.cdsWork1.FieldByName('USUMOD').AsString := DMAF.wUsuario;
      DMAF.cdsWork1.FieldByName('FECMOD').Value := now;
   End;
   DMAF.cdsWork1.FieldByName('PROCESO').AsString := 'BLOQUE';
   DMAF.cdsWork1.ApplyUpdates(0);
   xCia := dblcCompania.Text;
   xNumSolDesactivacion := dbeSolDesactivacion.Text;
End;

Procedure TFDesactivacionAF.dblcCompaniaExit(Sender: TObject);
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

Procedure TFDesactivacionAF.dblcMotivoExit(Sender: TObject);
Begin
   xSQL := 'DESACID=' + quotedstr(dblcMotivo.Text);
   If dblcMotivo.Text = '' Then
   Begin
      edtMotivo_des.Text := '';
      exit;
   End;
   If dblcMotivo.Text <> '' Then
   Begin
      edtMotivo_des.Text := DMAF.DisplayDescrip('dspTGE', 'ACF105', 'DESACDES', xSQL, 'DESACDES');
      If edtMotivo_des.Text = '' Then
      Begin
         ShowMessage('Ingrese un Motivo válido de Desactivación');
         dblcMotivo.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFDesactivacionAF.dblUsuSolicitaExit(Sender: TObject);
Begin
   xSQL := 'USUARIO=' + quotedstr(dblUsuSolicita.Text);
   If dblUsuSolicita.text = '' Then
   Begin
      dblUsuSolicita_des.text := '';
      exit;
   End;
   If dblUsuSolicita.text <> '' Then
   Begin
      dblUsuSolicita_des.text := DMAF.DisplayDescrip('dspTGE', 'ACF115', 'NOMBRE', xSQL, 'NOMBRE');
      If dblUsuSolicita_des.text = '' Then
      Begin
         Showmessage('Ingrese un Solicitante Válido');
         dblUsuSolicita.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFDesactivacionAF.bbtn_AceptaCabeceraClick(Sender: TObject);
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
   If dblUsuSolicita.Text = '' Then
   Begin
      showmessage('Debe ingresar el Usuario que Solicita');
      dblUsuSolicita.SetFocus;
      exit;
   End;
   If dbdtpFecSolicita.Text = '' Then
   Begin
      showmessage('Debe ingresar la fecha de la Solicitud de Desactivación');
      dbdtpFecSolicita.SetFocus;
      exit;
   End;
   If dbeObservacion.Text = '' Then
   Begin
      showmessage('Debe ingresar un comentario en el campo Observacion');
      dbeObservacion.SetFocus;
      exit;
   End;
   GrabaCabecera;
   BloqueaCabecera;
   DesbloqueaDetalle;
   btnAdiccionaArticulo.Enabled := True;

   DMAF.wModo := 'M';
   DMAF.cdsWork1.Edit;

End;

Procedure TFDesactivacionAF.BloqueaCabecera;
Begin
   dblcCompania.Enabled := false;
   dblcMotivo.Enabled := false;
   dblUsuSolicita.Enabled := false;
   dbdtpFecSolicita.Enabled := false;
   dblUsuAutoriza.Enabled := false;
   dbdtpFecAutoriza.Enabled := false;
   dbeObservacion.Enabled := false;
   bbtn_AceptaCabecera.Enabled := false;
End;

Procedure TFDesactivacionAF.DesbloqueaCabecera;
Begin
   dblcMotivo.Enabled := True;
   dbdtpFecSolicita.Enabled := True;
   dblUsuAutoriza.Enabled := True;
   dbdtpFecAutoriza.Enabled := True;
   dbeObservacion.Enabled := True;
   bbtn_AceptaCabecera.Enabled := True;
End;

Procedure TFDesactivacionAF.BloqueaDetalle;
Begin
   btnAdiccionaArticulo.Enabled := false;
   dbgCodBarra.Enabled := false;
   bbtnRegresa.Enabled := false;
   Z2bbtnAcepta.Enabled := false;
   Z2bbtnAnula.Enabled := false;
End;

Procedure TFDesactivacionAF.DesbloqueaDetalle;
Begin
   btnAdiccionaArticulo.Enabled := True;
   dbgCodBarra.Enabled := True;
   bbtnRegresa.Enabled := True;
   Z2bbtnAcepta.Enabled := True;
   Z2bbtnAnula.Enabled := True;
End;

Procedure TFDesactivacionAF.CompletarDatosActivoEnPanel;
Begin
   DMAF.cdsActFij.Filter := '';

   DMAF.cdsActFij.Filtered := False;
   DMAF.cdsActFij.Filter := 'ARTCODBAR = ' + QuotedStr(dblCodigoBarra.Text);
   DMAF.cdsActFij.Filtered := True;
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
   End;
   DMAF.cdsActFij.Filtered := False;
End;

Procedure TFDesactivacionAF.btnAdiccionaArticuloClick(Sender: TObject);
Begin
   pnlCodBarra.Visible := True;
   xSQL := 'select * from ACF201 WHERE NVL(ACFFLAGACT,' + QuotedStr('X') + ') IN (' + QuotedStr('A') + ',' + QuotedStr('P') + ',' + QuotedStr('X') + ')';
   DMAF.cdsActFij.Close;
   DMAF.cdsActFij.DataRequest(xSQL);
   DMAF.cdsActFij.Open;

End;

Procedure TFDesactivacionAF.bbtnRetiraCodBarraClick(Sender: TObject);
Begin
   pnlCodBarra.Visible := False;
   LimpiarPanel;
End;

Procedure TFDesactivacionAF.dblCodigoBarraExit(Sender: TObject);
Begin
   CompletarDatosActivoEnPanel;
   If (edtCodigoBarraDes.Text = '') And (dblCodigoBarra_actual.Text <> '') Then
   Begin
      ShowMessage('Ingrese Código de Barras válido');
      dblCodigoBarra_actual.SetFocus;
      Exit;
   End;
End;

Procedure TFDesactivacionAF.bbtnAdicionaCodBarraClick(Sender: TObject);
Begin
   CompletarDatosActivoEnPanel;
   If (dblCodigoBarra.Text = '') Or (edtCodigoBarraDes.Text = '') Then
   Begin
      showmessage('Debe ingresar un Código de Barras válido');
      dblCodigoBarra_actual.SetFocus;
      exit;
   End;

// Verificando si el activo ya fue ingresado
   xSQL := ' SELECT 1 FROM ACF131 WHERE CIAID  = ' + QuotedStr(dblcCompania.Text) +
      ' AND NUMSOLDES = ' + QuotedStr(dbeSolDesactivacion.Text) +
      ' AND ARTCODBAR = ' + QuotedStr(dblCodigoBarra.Text);
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.recordcount > 0 Then
   Begin
      ShowMessage('Esta activo ya EXISTE en la Solicitud de Desactivación');
      Exit;
   End;

   xSQL := ' INSERT INTO ACF131 (CIAID,NUMSOLDES,ARTCODBAR,ARTID,USUREG,FECREG,USUMOD,FECMOD) ' +
      ' VALUES(' + QuotedStr(dblcCompania.Text) +
      ', ' + QuotedStr(dbeSolDesactivacion.Text) +
      ', ' + QuotedStr(dblCodigoBarra.Text) +
      ', ' + QuotedStr(dbeArticulo.Text) +
      ', USER, SYSDATE,NULL,NULL )';

   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   RecuperarDetalle;
   LimpiarPanel;
   dblCodigoBarra_actual.SetFocus;
End;

Procedure TFDesactivacionAF.LimpiarPanel;
Begin
   dbeArticulo.Text := '';
   dblCodigoBarra.Text := '';
   dblCodigoBarra_actual.Text := '';
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
End;

Procedure TFDesactivacionAF.RecuperarCabecera;
Begin
   If dbeSolDesactivacion.Text = '' Then
   Begin
      xCia := DMAF.cdsQry10.FieldbyName('CIAID').AsString;
      xNumSolDesactivacion := DMAF.cdsQry10.FieldbyName('NUMSOLDES').AsString;
   End;
   xSQL := 'select * from ACF130 where CIAID = ' + QuotedStr(xCia) + ' AND NUMSOLDES = ' + QuotedStr(xNumSolDesactivacion);
   DMAF.cdsWork1.Close;
   DMAF.cdsWork1.DataRequest(xSQL);
   DMAF.cdsWork1.Open;
   xSQL := 'CIAID=' + quotedstr(dblcCompania.Text);
   dblcCompania_des.text := DMAF.DisplayDescrip('dspTGE', 'TGE101', 'CIADES', xSQL, 'CIADES');
   xSQL := 'DESACID=' + quotedstr(dblcMotivo.Text);
   edtMotivo_des.Text := DMAF.DisplayDescrip('dspTGE', 'ACF105', 'DESACDES', xSQL, 'DESACDES');
   xSQL := 'USUARIO=' + quotedstr(dblUsuSolicita.Text);
   dblUsuSolicita_des.text := DMAF.DisplayDescrip('dspTGE', 'ACF115', 'NOMBRE', xSQL, 'NOMBRE');

   xSQL := 'RECIBEID = ' + QuotedStr(dblUsuAutoriza.Text);
   edtUsuAutorizaDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF126', 'RECIBENOM', xSQL, 'RECIBENOM');

   If DMAF.cdsWork1.FieldbyName('ESTADO').AsString = 'ACEPTADO' Then
   Begin
      dbeEstado.Font.Color := clGreen;
   End
   Else
   Begin
      If DMAF.cdsWork1.FieldbyName('ESTADO').AsString = 'ANULADO' Then
         dbeEstado.Font.Color := clRed
      Else
         dbeEstado.Font.Color := clBlue;
   End;
End;

Procedure TFDesactivacionAF.RecuperarDetalle;
Begin
   xSQL := ' Select ACF201.CODIGOBARRA, ACF131.ARTCODBAR,ACF131.ARTID,  ACF201.ACFDES,ACF201.RECIBEID, ACF201.RECIBENOM, ACF201.ACFID, '
      + '           ACF131.CIAID,  ACF131.NUMSOLDES '
      + '      from ACF131, ACF201 '
      + '     where ACF131.ARTCODBAR = ACF201.ARTCODBAR '
      + '       and ACF131.CIAID = ' + QuotedStr(xCia)
      + '       and ACF131.NUMSOLDES = ' + QuotedStr(xNumSolDesactivacion);
   DMAF.cdsActFij2.Close;
   DMAF.cdsActFij2.DataRequest(xSQL);
   DMAF.cdsActFij2.Open;
End;

Procedure TFDesactivacionAF.dbgCodBarraKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Var
   ls_codbar, ls_codbar_des, ls_soldesactivacion, ls_ciaid: String;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      ls_codbar := DMAF.cdsActFij2.FieldbyName('ARTCODBAR').AsString;
      ls_codbar_des := DMAF.cdsActFij2.FieldbyName('ACFDES').AsString;
      ls_ciaid := DMAF.cdsActFij2.FieldbyName('CIAID').AsString;
      ls_soldesactivacion := DMAF.cdsActFij2.FieldbyName('NUMSOLDES').AsString;
      If MessageDlg('El activo: ' + ls_codbar + '-' + ls_codbar_des + #13 +
         'de la Solicitud de Desactivación: ' + ls_soldesactivacion + #13 +
         'Será quitada, ¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
      Begin
         xSQL := ' Delete ACF131 '
            + '     where ACF131.CIAID = ' + QuotedStr(ls_ciaid)
            + '       and ACF131.NUMSOLDES = ' + QuotedStr(ls_soldesactivacion)
            + '       and ACF131.ARTCODBAR = ' + QuotedStr(ls_codbar);
         DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
         RecuperarDetalle;
      End;
   End;
End;

Procedure TFDesactivacionAF.Z2bbtnAceptaClick(Sender: TObject);
Var
   ls_anio, ls_mes: String;
Begin
   If dblUsuAutoriza.Text = '' Then
   Begin
      showmessage('Debe ingresar el usuario que Autoriza');
      exit;
   End;
   If dbdtpFecAutoriza.Text = '' Then
   Begin
      showmessage('Debe ingresar la fecha de Autorización');
      exit;
   End;
   If DMAF.cdsActFij2.RecordCount = 0 Then
   Begin
      ShowMessage('No hay Activos en el detalle a Desactivar');
      Exit;
   End;

   If MessageDlg('La Solicitud de Desactivación: ' + dbeSolDesactivacion.Text + #13 +
      'pasará a estado ACEPTADO ' + #13 +
      '¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin
   // Verificando si los activos están en estado A (Activo)
      If ValidarEstadoActivo(dblcCompania.Text, dbeSolDesactivacion.Text) = False Then
      Begin
         exit;
      End;

   // desactivando activo fijo
      ls_anio := Copy(dbdtpFecSolicita.Text, 7, 4);
      ls_mes := Copy(dbdtpFecSolicita.Text, 4, 2);

      xSQL := ' UPDATE ACF201 '
         + '       SET ACF201.ACFFLAGACT = ' + QuotedStr('I') + ', '
         + '           ACF201.ACFFECINAC = TO_DATE(' + QuotedStr(dbdtpFecSolicita.Text) + ', ' + QuotedStr('dd/mm/yyyy') + '),'
         + '           ACF201.DESACID = ' + QuotedStr(dblcMotivo.Text) + ', '
         + '           ACF201.ACFDESACMO = ' + QuotedStr(dbeObservacion.Text) + ', '
         + '           ACF201.DESAUTORI = ' + QuotedStr(edtUsuAutorizaDes.Text) + ', '
         + '           ACF201.DESANO = ' + QuotedStr(ls_anio) + ' ,'
         + '           ACF201.DESANOMES = ' + QuotedStr(ls_anio + ls_mes)
         + '     WHERE EXISTS (SELECT 1 FROM ACF131  '
         + '                    WHERE ACF131.ARTCODBAR = ACF201.ARTCODBAR '
         + '                      AND ACF131.CIAID = ' + QuotedStr(dblcCompania.Text)
         + '                      AND ACF131.NUMSOLDES =' + QuotedStr(dbeSolDesactivacion.Text) + ') ';
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);

      xSQL := ' UPDATE ACF130 '
         + '       SET ESTADO = ' + QuotedStr('ACEPTADO')
         + '     WHERE CIAID = ' + QuotedStr(dblcCompania.Text)
         + '       AND NUMSOLDES = ' + QuotedStr(dbeSolDesactivacion.Text);
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      RecuperarCabecera;
      BloqueaCabecera;
      BloqueaDetalle;
      ShowMessage('Los activos pasaron a estado I-INACTIVO correctamente');
   End;
End;

Procedure TFDesactivacionAF.bbtnRegresaClick(Sender: TObject);
Begin
   DesbloqueaCabecera;
   BloqueaDetalle;
End;

Procedure TFDesactivacionAF.Z2bbtnAnulaClick(Sender: TObject);
Begin
   If dbeEstado.Text <> 'INICIAL' Then
   Begin
      showmessage('Sólo puede Anular solicitudes en estado INICIAL');
      exit;
   End;

   If MessageDlg('La Solicitud de Desactivación: ' + dbeSolDesactivacion.Text + #13 +
      'pasará a estado ANULADO ' + #13 +
      '¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin
      xSQL := ' Update ACF130 '
         + '       set ESTADO = ' + QuotedStr('ANULADO')
         + '     where CIAID = ' + QuotedStr(dblcCompania.Text)
         + '       and NUMSOLDES = ' + QuotedStr(dbeSolDesactivacion.Text);
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      RecuperarCabecera;
      BloqueaCabecera;
      BloqueaDetalle;
   End;
End;

Function TFDesactivacionAF.ValidarEstadoActivo(ps_Ciaid, ps_NumSolicitud: String): Boolean;
Begin
   xSQL := ' SELECT ARTCODBAR, ACFDES, ACFFLAGACT '
      + '      FROM ACF201 '
      + '     WHERE ACF201.ACFFLAGACT =  ' + QuotedStr('I')
      + '       AND EXISTS (SELECT 1 FROM ACF131 '
      + '                    WHERE ACF131.ARTCODBAR = ACF201.ARTCODBAR '
      + '                      AND ACF131.CIAID = ' + QuotedStr(ps_Ciaid)
      + '                      AND ACF131.NUMSOLDES = ' + QuotedStr(ps_NumSolicitud) + ' ) ';
   DMAF.cdsActFij3.Close;
   DMAF.cdsActFij3.DataRequest(xSQL);
   DMAF.cdsActFij3.Open;
   If DMAF.cdsActFij3.RecordCount > 0 Then
   Begin
      ShowMessage('El Activo con Código de Barra: ' + #13 + DMAF.cdsActFij3.FieldbyName('ARTCODBAR').AsString
                 +'-' + DMAF.cdsActFij3.FieldbyName('ACFDES').AsString + #13
                 +'Tiene estado: ' + DMAF.cdsActFij3.FieldbyName('ACFFLAGACT').AsString
                 +' y no puede ser Desactivado');
      Result := False;
      Exit;
   End;
   Result := True;
End;

Procedure TFDesactivacionAF.dblUsuAutorizaExit(Sender: TObject);
Begin
   xSQL := 'RECIBEID=' + quotedstr(dblUsuAutoriza.Text);
   If dblUsuAutoriza.text = '' Then
   Begin
      edtUsuAutorizaDes.text := '';
      exit;
   End;
   If dblUsuAutoriza.text <> '' Then
   Begin
      edtUsuAutorizaDes.text := DMAF.DisplayDescrip('dspTGE', 'ACF126', 'RECIBENOM', xSQL, 'RECIBENOM');
      If edtUsuAutorizaDes.text = '' Then
      Begin
         ShowMessage('El Usuario que Autoriza no es válido');
         dblUsuAutoriza.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFDesactivacionAF.Z2bbtnImprimeClick(Sender: TObject);
Begin
   If dbeSolDesactivacion.Text = '' Then
   Begin
      exit;
   End;

   xSQL := ' Select ACF130.CIAID COMPANIA, '
      + '          (SELECT TGE101.CIADES FROM TGE101 WHERE TGE101.CIAID =  ACF130.CIAID) COMPANIA_DESC, '
      + '           ACF130.NUMSOLDES SOL_DESACTIVACION, ACF130.DESACID MOTIVO, '
      + '          (SELECT ACF105.DESACDES FROM ACF105 WHERE ACF105.DESACID = ACF130.DESACID) MOTIVO_DESC, '
      + '           ACF130.ESTADO , ACF130.USUARIO SOLICITA , '
      + '          (SELECT UPPER(ACF115.NOMBRE) FROM ACF115 WHERE ACF115.USUARIO = ACF130.USUARIO ) SOLICITA_DESC, '
      + '           ACF130.FECHA, ACF130.USUAUT AUTORIZA, '
      + '          (SELECT UPPER(ACF126.RECIBENOM) FROM ACF126 WHERE ACF126.RECIBEID = ACF130.USUAUT) AUTORIZA_DESC, '
      + '           ACF130.FECAUT, ACF130.OBSERVACION, ACF201.CODIGOBARRA COD_BARRA, '
      + '           ACF201.ACFDES COD_BARRA_DESC, '
      + '           ACF201.LOCID, (Select ACF120.LOCDES  from ACF120 where ACF201.LOCID = ACF120.LOCID) LOCALIDAD_DES1, '
      + '           ACF201.PISO,  (Select ACF121.PISODES from ACF121 where ACF201.LOCID = ACF121.LOCID and ACF201.PISO = ACF121.PISO) PISO_DES1, '
      + '           ACF201.AREA,  (Select ACF122.AREADES from ACF122 where ACF201.LOCID = ACF122.LOCID and ACF201.PISO = ACF122.PISO '
      + '                             and ACF201.AREA = ACF122.AREA ) AREA_DES1, '
      + '           ACF201.AMBCOD,(Select ACF123.AMBDES  from ACF123 where ACF201.LOCID = ACF123.LOCID and ACF201.PISO = ACF123.PISO '
      + '                             and ACF201.Area = ACF123.AREA AND ACF201.AMBCOD = ACF123.AMBCOD  ) AMBIENTE_DES1, '
      +             QuotedStr(DMAF.wUsuario) + ' USUARIO_IMPRIME '
      + '      from ACF130, ACF131, ACF201 '
      + '     where ACF130.CIAID = ACF131.CIAID '
      + '       and ACF130.NUMSOLDES = ACF131.NUMSOLDES '
      + '       and ACF201.ARTCODBAR = ACF131.ARTCODBAR '
      + '       and ACF130.CIAID = ' + QuotedStr(dblcCompania.Text)
      + '       and ACF130.NUMSOLDES = ' + QuotedStr(dbeSolDesactivacion.Text);
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppDBPipeline_SolDesactivacion.DataSource := DMAF.dsQry;
   ppReport_SolDesactivacion.DataPipeline := ppDBPipeline_SolDesactivacion;
   ppReport_SolDesactivacion.Template.FileName := wRutaRpt + 'ACF\DEMA\SolDesactivacion.rtm';

   ppReport_SolDesactivacion.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppDesigner_SolDesactivacion.Report := ppReport_SolDesactivacion ;
   //ppDesigner_SolDesactivacion.ShowModal() ;
   ppReport_SolDesactivacion.Print;
End;

Procedure TFDesactivacionAF.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFDesactivacionAF.FormClose(Sender: TObject;
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
   FDesactivacionAF.Free;
End;

Procedure TFDesactivacionAF.dblCodigoBarra_actualExit(Sender: TObject);
Begin
   DMAF.cdsActFij.Filter := '';
   DMAF.cdsActFij.Filtered := False;
   DMAF.cdsActFij.Filter := 'CODIGOBARRA = ' + QuotedStr(dblCodigoBarra_actual.Text);
   DMAF.cdsActFij.Filtered := True;
   If DMAF.cdsActFij.RecordCount > 0 Then
      dblCodigoBarra.Text := DMAF.cdsActFij.FieldbyName('ARTCODBAR').AsString
   Else
      dblCodigoBarra.Text := '';
   dblCodigoBarraExit(Self);
End;

End.

