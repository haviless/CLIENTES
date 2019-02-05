Unit ACF205;
//INICIO USO DE ESTANDARES    : 01/08/2011
//UNIDAD                      : ACF205
//FORMULARIO                  : FTomaInvAF
//FECHA CREACION              :
//AUTOR                       : Equipo de Desarrollo
//OBJETIVO                    : Registrar los traslados de los activos fijos dessde
//                              una ubicación origen hacia una ubicación destino
//                              indicando además el usuario que recibirá el activo.
//                              En el caso que sea el primer traslado del activo,
//                              entonces se generará una nota de salida en estado
//                              INICIAL
//********************************************************
// HPP_201101_ACF  28/02/2011   Se invoca al Procedimiento de BD SP_ACF_SALIDA_TRASLADO
//                              que se encarga de generar una nota de salida cuando se
//                              el primer traslado del activo fijo
// HPP_201102_ACF  07/03/2011   Al registrar un nuevo traslado se bloquea los campos de "Responsable del Traslado"
//                              y "Usuario Autorizado que entrega" y se completa por defecto
//                              con los datos del Usuario que se ingresó al sistema
// HPP_201105_ACF  06/04/2011   Verifica que el usuario que recibe tenga asociado un centro
//                              de costo en la tabla de Usuario de Bien
// HPP_201106_ACF  11/04/2011  -Verifica que el centro de costo sea válido
//                             -Se adiciona el campo UBIORI que indica si el traslado
//                              corresponde a ubicación única o ubicación múltiple
// HPP_201107_ACF  13/05/2011   Se crea un edit control enlazado al campo ACF201.CODIGOBARRA
//                              el cual contiene el código de barra actual del activo
//                              fijo. y este campo será usado por el usuario para identificar
//                              al activo, y el sistema usará al campo ACF201.ARTCODBAR como
//                              llave primaria del maestro de activos
// HPP_201108_ACF  28/06/2011   se modifica el criterio que determina si un activo fijo aún no
//                              tiene salidas de almacén
// HPC_201109_ACF  19/08/2011   Se actualiza el campo LOG332.NFAC null en los casos
//                              que el campo LOG332.ESTADOID está en 'X' esto para
//                              que el procedimiento SP_ACF_SALIDA_TRASLADO pueda
//                              registrar una línea en la nota de salida para este
//                              activo fijo
// HPC_201501_ACF  16/01/2015   Se retira la condicion "Si es primer traslado" al generar una nota de salida,
//                              tambien la variable ls_PrimerTraslado
// HPC_201503_ACF  24/08/2015   Se modifica para que libere el Ccentro de Costo sugerido de la tabla de usuarios de Activos Fijos

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad
// HPC_201801_ACF 06/07/2018    Se colocó el condicional debido a que solo se debe de actualizar el estado en el primer traslado
// HPC_201802_ACF 05/10/2018   Se realiza cambio a las columnas de Ubicación de Destino
//********************************************************
Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Provider, Db,
   Wwdatsrc, DBClient, wwclient, Wwquery, DBTables, Mask, wwdbedit, Wwdbdlg,
   wwdblook, Wwtable, ExtCtrls, wwdbdatetimepicker, ppEndUsr, ppParameter,
   ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
   ppComm, ppRelatv, ppDB, ppDBPipe;

Type
   TFTomaInvAF = Class(TForm)
      PageControl1: TPageControl;
      pnlBusqueda: TPanel;
      lblBusca: TLabel;
      dbgBusca: TwwDBGrid;
      bbtnOkBusca: TBitBtn;
      bbtnCancBusca: TBitBtn;
      dbeBusca: TwwDBEdit;
      ppdbPadron: TppDBPipeline;
      pprPadron: TppReport;
      ppdsgPadron: TppDesigner;
      lblTitulo: TLabel;
      tsTraslados: TTabSheet;
      Bevel4: TBevel;
      dbgActivosxTras: TwwDBGrid;
      btnInsertaTraslado: TwwIButton;
      Bevel5: TBevel;
      bbtnIniciaTraslado: TBitBtn;
      lblDestinatario: TLabel;
      pnlDatosOrigen: TPanel;
      lblDocRefSal: TLabel;
      dblcDocRefSal: TwwDBLookupCombo;
      lblNumDocSal: TLabel;
      dbeNumDocSal: TwwDBEdit;
      lblFechaTras: TLabel;
      dbdtpFecTras: TwwDBDateTimePicker;
      lblMotivoSal: TLabel;
      dblcMotivoSal: TwwDBLookupCombo;
      lblUserDest: TLabel;
      dblcResponsabTras: TwwDBLookupCombo;
      edtResponsabTras: TEdit;
      lblDestLocal: TLabel;
      dblcDestLocal: TwwDBLookupCombo;
      edtDestLocal: TEdit;
      lblDestPiso: TLabel;
      dblcDestPiso: TwwDBLookupCombo;
      edtDestPiso: TEdit;
      lblDestArea: TLabel;
      dblcDestArea: TwwDBLookupCombo;
      edtDestArea: TEdit;
      lblDestAmbiente: TLabel;
      dblcDestAmbiente: TwwDBLookupCombo;
      edtDestAmbiente: TEdit;
      lblDestUsuario: TLabel;
      dbeUsuBienTras: TwwDBEdit;
      bbtnBuscaUsuBienTras: TBitBtn;
      edtUsuBienTras: TEdit;
      bbtnCancelSal: TBitBtn;
      bbtnGrabaSal: TBitBtn;
      bbtnAdicDetalleTras: TBitBtn;
      bbtnRepTraslado: TBitBtn;
      bbtnTrasladoAnt: TBitBtn;
      lblUsuAutorDest: TLabel;
      dbeUsuAutoTras: TwwDBEdit;
      bbtnBuscaUsuAutoTras: TBitBtn;
      edtUsuAutoTras: TEdit;
      lblObservac: TLabel;
      dbeObservac: TwwDBEdit;
      bbtnElimTras: TBitBtn;
      bbtnComienzadenuevo: TBitBtn;
      Label17: TLabel;
      Label19: TLabel;
      pnlBuscaxDato: TPanel;
      Label21: TLabel;
      dbgBuscaxDato: TwwDBGrid;
      bbtnOkBuscaxDato: TBitBtn;
      bbtnCancBuscaxDato: TBitBtn;
      dbeBuscaxDato: TwwDBEdit;
      ppParameterList1: TppParameterList;
      lblAceptado: TLabel;
      RadioGroup_OrigenActivo: TRadioGroup;
      RadioButton_unico: TRadioButton;
      RadioButton_multiple: TRadioButton;
      GroupBox1: TGroupBox;
      lblReuCodBarras: TLabel;
      dbeCodigoBarra: TwwDBEdit;
      dbeReuCodBarras: TwwDBEdit;
      Shape1: TShape;
      GroupBox2: TGroupBox;
      lblOrigLocal: TLabel;
      dblcOrigLocal: TwwDBLookupCombo;
      edtOrigLocal: TEdit;
      lblOrigPiso: TLabel;
      dblcOrigPiso: TwwDBLookupCombo;
      edtOrigPiso: TEdit;
      lblOrigArea: TLabel;
      dblcOrigArea: TwwDBLookupCombo;
      edtOrigArea: TEdit;
      lblOrigAmbiente: TLabel;
      dblcOrigAmbiente: TwwDBLookupCombo;
      edtOrigAmbiente: TEdit;
      lblOrigUsuario: TLabel;
      dbeOrigUsuario: TwwDBEdit;
      edtOrigUsuario: TEdit;
      lblOrigEstado: TLabel;
      dbeOrigEstado: TwwDBEdit;
      lblOrigDenomina: TLabel;
      edtOrigDenominaci: TEdit;
      edtOrigAcfDesl: TEdit;
      lblOrigMeterial: TLabel;
      dbeOrigMaterial: TwwDBEdit;
      dbeOrigMarca: TwwDBEdit;
      lblOrigMarca: TLabel;
      lblOrigModelo: TLabel;
      dbeOrigModelo: TwwDBEdit;
      lblOrigSerie: TLabel;
      dbeOrigSerie: TwwDBEdit;
      lblOrigDimension: TLabel;
      dbeOrigDimensio: TwwDBEdit;
      Label1: TLabel;
      lblOrigen: TLabel;
      lblUsuAutorOrig: TLabel;
      dbeUsuOrigTras: TwwDBEdit;
      bbtnBuscaUsuOrigTras: TBitBtn;
      edtUsuOrigTras: TEdit;
      BtnCabecera: TBitBtn;
      Btndetalle: TBitBtn;
      Label2: TLabel;
      dblcdCCosto: TwwDBLookupComboDlg;
      edtCCosto: TEdit;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel20: TppLabel;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppLabel9: TppLabel;
      ppLabel13: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel22: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppDBText21: TppDBText;
      ppLabel21: TppLabel;
      ppDBText18: TppDBText;
      ppLabel25: TppLabel;
      ppDBText19: TppDBText;
      ppLabel3: TppLabel;
      ppLabel5: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLabel14: TppLabel;
      ppLabel18: TppLabel;
      ppLabel24: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel26: TppLabel;
      ppDBText22: TppDBText;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppDBText20: TppDBText;
      ppDetailBand1: TppDetailBand;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText3: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel15: TppLabel;
      ppDBText16: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppDBText9: TppDBText;
      ppLabel33: TppLabel;
      ppDBText17: TppDBText;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppDBText31: TppDBText;
      ppLabel30: TppLabel;
      ppLine5: TppLine;
      ppDBText30: TppDBText;
      ppLabel4: TppLabel;
      Procedure dbeBuscaExit(Sender: TObject);
      Procedure bbtnOkBuscaClick(Sender: TObject);
      Procedure bbtnCancBuscaClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
      Function StrZero(wNumero: String; wLargo: Integer): String;
      Procedure bbtnBuscaRespClick(Sender: TObject);
      Procedure dblcDestLocalExit(Sender: TObject);
      Procedure dblcDestPisoExit(Sender: TObject);
      Procedure dblcDestAreaExit(Sender: TObject);
      Procedure dblcDestAmbienteExit(Sender: TObject);
      Procedure dbeUsuBienTrasExit(Sender: TObject);
      Procedure bbtnGrabaSalClick(Sender: TObject);
      Procedure dbeReuCodBarrasExit(Sender: TObject);
      Procedure dblcResponsabTrasExit(Sender: TObject);
      Procedure bbtnIniciaTrasladoClick(Sender: TObject);
      Function UltimaOrden: String;
      Procedure dblcResponsabTrasCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure btnInsertaTrasladoClick(Sender: TObject);
      Procedure edtUsuBienTrasExit(Sender: TObject);
      Procedure bbtnCancelSalClick(Sender: TObject);
      Procedure bbtnRepTrasladoClick(Sender: TObject);
      Procedure bbtnTrasladoAntClick(Sender: TObject);
      Procedure dbeNumDocSalExit(Sender: TObject);
      Procedure edtUsuOrigTrasExit(Sender: TObject);
      Procedure bbtnBuscaUsuAutoTrasClick(Sender: TObject);
      Procedure bbtnBuscaUsuOrigTrasClick(Sender: TObject);
      Procedure dbeUsuAutoTrasExit(Sender: TObject);
      Procedure dbeUsuOrigTrasExit(Sender: TObject);
      Procedure edtUsuAutoTrasExit(Sender: TObject);
      Procedure dbgActivosxTrasKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure bbtnElimTrasClick(Sender: TObject);
      Procedure bbtnImpActRevClick(Sender: TObject);
      Procedure bbtnComienzadenuevoClick(Sender: TObject);
      Procedure dbdtpFecTrasExit(Sender: TObject);
      Procedure dblcMotivoSalExit(Sender: TObject);
      Procedure dbeObservacExit(Sender: TObject);
      Procedure bbtnBuscaxSerieClick(Sender: TObject);
      Procedure bbtnOkBuscaxDatoClick(Sender: TObject);
      Procedure bbtnCancBuscaxDatoClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnAdicDetalleTrasClick(Sender: TObject);
      Procedure RadioButton_unicoClick(Sender: TObject);
      Procedure dbeCodigoBarraExit(Sender: TObject);
      Procedure BtnCabeceraClick(Sender: TObject);
      Procedure BtndetalleClick(Sender: TObject);
      Procedure dblcdCCostoExit(Sender: TObject);

   Private
    { Private declarations }
      Procedure MuestraGrid;
      Procedure AnulaTraslado;
      Procedure RecuperaDetalle(p_NumTraslado: String);

   Public
      Function Consistencia(): Boolean;
      Procedure InactivaCampos(InacAct: boolean);
    { Public declarations }
   End;

Var
   FTomaInvAF: TFTomaInvAF;
   wNuevo: Boolean;
   wCCOSID, xxLocalTras, xxPisoTras, xxAreaTras: String;
   wVezGrabaSal: integer;
   xBuscaUsuBienTras: boolean; // flag q indica búsqueda de Usuario del Bien
   xBuscaUsuAutoTras: boolean; // flag q indica búsqueda de Usuario Autorizado en Destino
   xBuscaUsuOrigTras: boolean; // flag q indica búsqueda de Usuario Autorizado en Origen
   xTrabIdUsuario: String;

Implementation

Uses ACFDM;

{$R *.DFM}

Procedure TFTomaInvAF.dbeBuscaExit(Sender: TObject);
Var
   xSQL, xVarBusca: String;
Begin
   If bbtnCancBusca.Focused Then exit;
   If length(dbeBusca.Text) > 0 Then
   Begin
      xVarBusca := '%' + trim(dbeBusca.Text) + '%';
      xSQL := 'Select RECIBEID,RECIBENOM,CCOSID '
         + '     from ACF126 '
         + '    where RECIBENOM like(' + quotedstr(xVarBusca) + ') GROUP BY RECIBEID, RECIBENOM, CCOSID';
      DMAF.cdsBusca.Close;
      DMAF.cdsBusca.IndexFieldNames := '';
      DMAF.cdsBusca.Filter := '';
      DMAF.cdsBusca.Filtered := False;
      DMAF.cdsBusca.DataRequest(xSQL);
      DMAF.cdsBusca.Open;
      DMAF.cdsBusca.IndexFieldNames := 'RECIBENOM';
      dbgBusca.Selected.Clear;
      dbgBusca.DataSource := DMAF.dsBusca;
      dbgBusca.Selected.Add('RECIBENOM'#9'50'#9'Usuario del Bien');
      dbgBusca.Selected.Add('RECIBEID'#9'6'#9'Id');
      DMAF.cdsBusca.EnableControls;
      dbgBusca.SetFocus;
   End
   Else
   Begin

      If (dbgBusca.Focused) And (DMAF.cdsBusca.RecordCount > 0) Then exit;
      Showmessage('Ingrese una condición para la Búsqueda');
   End;
End;

Procedure TFTomaInvAF.bbtnOkBuscaClick(Sender: TObject);
Begin
   If bbtnCancBusca.Focused Then exit;
// Traslados
   If PageControl1.ActivePageIndex = 0 Then
   Begin
      pnlBusqueda.Visible := False;
      PageControl1.Enabled := True;

   // flag q indica búsqueda de Usuario del Bien
      If xBuscaUsuBienTras Then
      Begin
         dbeUsuBienTras.Text := DMAF.cdsBusca.FieldByName('RECIBEID').AsString;
         edtUsuBienTras.Text := DMAF.cdsBusca.FieldByName('RECIBENOM').AsString;
         dbeUsuBienTras.SetFocus;
      End;

   // flag q indica búsqueda de Usuario Autorizado en Destino
      If xBuscaUsuAutoTras Then
      Begin
         dbeUsuAutoTras.Text := DMAF.cdsBusca.FieldByName('RECIBEID').AsString;
         edtUsuAutoTras.Text := DMAF.cdsBusca.FieldByName('RECIBENOM').AsString;
         dbeUsuAutoTras.SetFocus;
      End;

   // flag q indica búsqueda de Usuario Autorizado en Origen
      If xBuscaUsuOrigTras Then
      Begin
         dbeUsuOrigTras.Text := DMAF.cdsBusca.FieldByName('RECIBEID').AsString;
         edtUsuOrigTras.Text := DMAF.cdsBusca.FieldByName('RECIBENOM').AsString;
         dbeUsuOrigTras.SetFocus;
      End;
   End;

End;

Procedure TFTomaInvAF.bbtnCancBuscaClick(Sender: TObject);
Begin
   If PageControl1.ActivePageIndex = 0 Then
   Begin
      pnlBusqueda.Visible := False;
      PageControl1.Enabled := True;

   // flag q indica búsqueda de Usuario del Bien
      If xBuscaUsuBienTras Then
      Begin
         dbeUsuBienTras.SetFocus;
      End;

   // flag q indica búsqueda de Usuario Autorizado en Destino
      If xBuscaUsuAutoTras Then
      Begin
         dbeUsuAutoTras.SetFocus;
      End;

   // flag q indica búsqueda de Usuario Autorizado en Origen
      If xBuscaUsuOrigTras Then
      Begin
         dbeUsuOrigTras.SetFocus;
      End;
   End;
End;

Procedure TFTomaInvAF.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFTomaInvAF.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin
   PageControl1.ActivePageIndex := 0;

// Localidades para Activos Fijos
   xSQL := 'select * from ACF120';
   DMAF.cdsLocal.Close;
   DMAF.cdsLocal.DataRequest(xSQL);
   DMAF.cdsLocal.Open;
   DMAF.cdsLocal.IndexFieldNames := 'LOCID';
   DMAF.cdsLocal.Filter := '';
   DMAF.cdsLocal.Filtered := False;

// Pisos para Activos Fijos
   xSQL := 'select * from ACF121';
   DMAF.cdsPiso.Close;
   DMAF.cdsPiso.DataRequest(xSQL);
   DMAF.cdsPiso.Open;
   DMAF.cdsPiso.IndexFieldNames := 'LOCID;PISO';
   DMAF.cdsPiso.Filter := '';
   DMAF.cdsPiso.Filtered := False;

// Áreas para Activos Fijos
   xSQL := 'select * from ACF122';
   DMAF.cdsArea.Close;
   DMAF.cdsArea.DataRequest(xSQL);
   DMAF.cdsArea.Open;
   DMAF.cdsArea.IndexFieldNames := 'LOCID;PISO;AREA';
   DMAF.cdsArea.Filter := '';
   DMAF.cdsArea.Filtered := False;

// Ambientes para Activos Fijos
   xSQL := 'select * from ACF123';
   DMAF.cdsAmbiente.Close;
   DMAF.cdsAmbiente.DataRequest(xSQL);
   DMAF.cdsAmbiente.IndexFieldNames := 'LOCID;PISO;AREA;AMBCOD';
   DMAF.cdsAmbiente.Open;
   DMAF.cdsAmbiente.Filter := '';
   DMAF.cdsAmbiente.Filtered := False;

// Usuario de los Activos Fijos
   xSQL := 'select RECIBEID, RECIBENOM,CCOSID from ACF126 GROUP BY RECIBEID, RECIBENOM,CCOSID';
   DMAF.cdsResponsab.Close;
   DMAF.cdsResponsab.DataRequest(xSQL);
   DMAF.cdsResponsab.Open;
   DMAF.cdsResponsab.IndexFieldNames := 'RECIBEID';
   DMAF.cdsResponsab.Filter := '';
   DMAF.cdsResponsab.Filtered := False;

// Motivos de Transferencia de los Activos Fijos
   xSQL := 'select * from ACF108';
   DMAF.cdsMotivos.Close;
   DMAF.cdsMotivos.DataRequest(xSQL);
   DMAF.cdsMotivos.Open;
   DMAF.cdsMotivos.IndexFieldNames := 'MOTDES';
   DMAF.cdsMotivos.Filter := '';
   DMAF.cdsMotivos.Filtered := False;
   dblcMotivoSal.Selected.Clear;
   dblcMotivoSal.Selected.Add('MOTDES'#9'15'#9'Motivo');

// Documentos de Activos Fijos para realizar Traslados
   xSQL := 'select * from TGE110 WHERE DOCAF=' + quotedstr('S');
   DMAF.cdsDocs.Close;
   DMAF.cdsDocs.DataRequest(xSQL);
   DMAF.cdsDocs.Open;
   DMAF.cdsDocs.IndexFieldNames := 'DOCABR';
   DMAF.cdsDocs.Filter := '';
   DMAF.cdsDocs.Filtered := False;
   dblcDocRefSal.Selected.Clear;
   dblcDocRefSal.Selected.Add('DOCABR'#9'15'#9'Documento');

// Usuarios autorizados para realizar traslados
   xSQL := 'select * from ACF115';
   DMAF.cdsUsuario.Close;
   DMAF.cdsUsuario.DataRequest(xSQL);
   DMAF.cdsUsuario.Open;
   DMAF.cdsUsuario.IndexFieldNames := 'USUARIO';
   DMAF.cdsUsuario.Filter := '';
   DMAF.cdsUsuario.Filtered := False;
   dblcResponsabTras.Selected.Clear;
   dblcResponsabTras.Selected.Add('USUARIO'#9'15'#9'Usuario');
   dblcResponsabTras.Selected.Add('NOMBRE'#9'25'#9'Nombre Usuario');

// Tipos de Moneda
   xSQL := 'select * from TGE103';
   DMAF.cdsMoneda.Close;
   DMAF.cdsMoneda.DataRequest(xSQL);
   DMAF.cdsMoneda.Open;

// Estados de los Activos Fijos (Bueno, Malo, Regular, etc)
   xSQL := 'select * from ACF109';
   DMAF.cdsEstado.Close;
   DMAF.cdsEstado.DataRequest(xSQL);
   DMAF.cdsEstado.Open;

// Centros de Costo (sólo Movimientos)
   xSQL := 'Select CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV '
      + '     from TGE203 '
      + '    where CCOSMOV=' + quotedstr('S')
      + '      and CCOSACT=''S''';
   DMAF.cdsCCosto.Close;
   DMAF.cdsCCosto.DataRequest(xSQL);
   DMAF.cdsCCosto.open;
   DMAF.cdsCCosto.Filter := '';
   DMAF.cdsCCosto.Filtered := False;
   DMAF.cdsCCosto.IndexFieldNames := 'CCOSID';
   dblcdCCosto.LookupTable := DMAF.cdsCCosto;
   If DMAF.wModo = 'A' Then // nueva Orden de Traslado
      bbtnIniciaTrasladoClick(self);
   If DMAF.wModo = 'M' Then // modificacion de Orden de Traslado
      bbtnTrasladoAntClick(self);

   MuestraGrid;
End;

Function TFTomaInvAF.StrZero(wNumero: String; wLargo: Integer): String;
Var
   i: integer;
   s: String;
Begin
   s := '';
   For i := 1 To wLargo Do
   Begin
      s := s + '0';
   End;
   s := s + trim(wNumero);
   result := copy(s, length(s) - (wLargo - 1), wLargo);
End;

Procedure TFTomaInvAF.bbtnBuscaRespClick(Sender: TObject);
Begin
   xBuscaUsuBienTras := True;
   xBuscaUsuAutoTras := False;
   xBuscaUsuOrigTras := False;
   PageControl1.Enabled := False;
   pnlBusqueda.BringToFront;
   pnlBusqueda.Left := 210;
   pnlBusqueda.Top := 129;
   pnlBusqueda.Visible := True;
   dbeBusca.Clear;
   dbeBusca.SetFocus;
End;

Procedure TFTomaInvAF.dblcDestLocalExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If bbtnComienzadenuevo.Focused Then exit;
   If DMAF.cdsLocal.IndexFieldNames <> 'LOCID' Then
      DMAF.cdsLocal.IndexFieldNames := 'LOCID';
   DMAF.cdsLocal.SetKey;
   DMAF.cdsLocal.FieldByName('LOCID').AsString := dblcDestLocal.Text;
   If Not DMAF.cdsLocal.GotoKey Then
   Begin
      ShowMessage('LOCAL NO EXISTE EN LA RELACION, REINTENTE!');
      dblcDestLocal.SetFocus;
      exit;
   End;
   edtDestLocal.Text := DMAF.cdsLocal.FieldByName('LOCDES').AsString;
   dblcDestPiso.Clear;
   edtDestPiso.Clear;
   dblcDestArea.Clear;
   edtDestArea.Clear;
   dblcDestAmbiente.Clear;
   edtDestAmbiente.Clear;
   dbeUsuBienTras.Clear;
   edtUsuBienTras.Clear;
   dblcdCCosto.Clear;
   DMAF.cdsPiso.Filter := 'LOCID=' + quotedstr(DMAF.cdsLocal.FieldByName('LOCID').AsString);
   DMAF.cdsPiso.Filtered := True;
End;

Procedure TFTomaInvAF.dblcDestPisoExit(Sender: TObject);
Begin
   If bbtnComienzadenuevo.Focused Then exit;
   If dblcDestLocal.Focused Then exit;

   If DMAF.cdsPiso.IndexFieldNames <> 'PISO' Then
      DMAF.cdsPiso.IndexFieldNames := 'PISO';
   DMAF.cdsPiso.SetKey;
   DMAF.cdsPiso.FieldByName('PISO').AsString := dblcDestPiso.Text;
   If Not DMAF.cdsPiso.GotoKey Then
   Begin
      ShowMessage('PISO NO EXISTE EN LA RELACION, REINTENTE!');
      dblcDestPiso.SetFocus;
      exit;
   End;
   edtDestPiso.Text := DMAF.cdsPiso.FieldByName('PISODES').AsString;

   dblcDestArea.Clear;
   edtDestArea.Clear;
   dblcDestAmbiente.Clear;
   edtDestAmbiente.Clear;
   dbeUsuBienTras.Clear;
   edtUsuBienTras.Clear;
   dblcdCCosto.Clear;
   DMAF.cdsArea.Filter := 'LOCID=' + quotedstr(DMAF.cdsLocal.FieldByName('LOCID').AsString)
                   + ' and PISO=' + quotedstr(DMAF.cdsPiso.FieldByName('PISO').AsString);
   DMAF.cdsArea.Filtered := True;
End;

Procedure TFTomaInvAF.dblcDestAreaExit(Sender: TObject);
Begin
   If bbtnComienzadenuevo.Focused Then exit;
   If dblcDestLocal.Focused Then exit;
   If dblcDestPiso.Focused Then exit;

   If DMAF.cdsArea.IndexFieldNames <> 'AREA' Then
      DMAF.cdsArea.IndexFieldNames := 'AREA';
   DMAF.cdsArea.SetKey;
   DMAF.cdsArea.FieldByName('AREA').AsString := dblcDestArea.Text;
   If Not DMAF.cdsArea.GotoKey Then
   Begin
      ShowMessage('AREA NO EXISTE EN LA RELACION, REINTENTE!');
      dblcDestArea.SetFocus;
      exit;
   End;
   edtDestArea.Text := DMAF.cdsArea.FieldByName('AREADES').AsString;

   dblcDestAmbiente.Clear;
   edtDestAmbiente.Clear;
   dbeUsuBienTras.Clear;
   edtUsuBienTras.Clear;
   DMAF.cdsAmbiente.Filter := 'LOCID=' + quotedstr(DMAF.cdsLocal.FieldByName('LOCID').AsString)
      + ' and PISO=' + quotedstr(DMAF.cdsPiso.FieldByName('PISO').AsString)
      + ' and AREA=' + quotedstr(DMAF.cdsArea.FieldByName('AREA').AsString);
   DMAF.cdsAmbiente.Filtered := True;
End;

Procedure TFTomaInvAF.dblcDestAmbienteExit(Sender: TObject);
Begin
   If bbtnComienzadenuevo.Focused Then exit;
   If dblcDestLocal.Focused Then exit;
   If dblcDestPiso.Focused Then exit;
   If dblcDestArea.Focused Then exit;

   If DMAF.cdsAmbiente.IndexFieldNames <> 'AMBCOD' Then
      DMAF.cdsAmbiente.IndexFieldNames := 'AMBCOD';
   DMAF.cdsAmbiente.SetKey;
   DMAF.cdsAmbiente.FieldByName('AMBCOD').AsString := dblcDestAmbiente.Text;
   If Not DMAF.cdsAmbiente.GotoKey Then
   Begin
      ShowMessage('AMBIENTE NO EXISTE EN LA RELACION, REINTENTE!');
      dblcDestAmbiente.SetFocus;
      exit;
   End;
   edtDestAmbiente.Text := DMAF.cdsAmbiente.FieldByName('AMBDES').AsString;

   dbeUsuBienTras.Clear;
   edtUsuBienTras.Clear;
End;

Procedure TFTomaInvAF.dbeUsuBienTrasExit(Sender: TObject);
Begin
   If bbtnComienzadenuevo.Focused Then exit;
   If bbtnBuscaUsuBienTras.Focused Then exit;
   If dblcDestAmbiente.Focused Then exit;
   If dblcDestArea.Focused Then exit;
   If dblcDestPiso.Focused Then exit;
   If dblcDestLocal.Focused Then exit;
   If dbeUsuBienTras.Text <> '99999' Then
   Begin
      If DMAF.cdsResponsab.IndexFieldNames <> 'RECIBEID' Then
         DMAF.cdsResponsab.IndexFieldNames := 'RECIBEID';
      DMAF.cdsResponsab.SetKey;
      DMAF.cdsResponsab.FieldByName('RECIBEID').AsString := dbeUsuBienTras.Text;
      If Not DMAF.cdsResponsab.GotoKey Then
      Begin
         ShowMessage('USUARIO DEL BIEN NO EXISTE EN LA RELACION, REINTENTE!');
         dbeUsuBienTras.SetFocus;
         exit;
      End;

      dblcdCCosto.Text := DMAF.cdsResponsab.FieldByName('CCOSID').AsString;
      dblcdCCostoExit(Sender);

      edtUsuBienTras.Text := DMAF.cdsResponsab.FieldByName('RECIBENOM').AsString;
      dbeUsuAutoTras.SetFocus;
   End
   Else
   Begin
      edtUsuBienTras.enabled := True;
      edtUsuBienTras.Text := '';
      edtUsuBienTras.SetFocus;
   End;
End;

Procedure TFTomaInvAF.bbtnGrabaSalClick(Sender: TObject);
Var
   xSQL, xFecha, xFechaStr, wxCiaId: String;
   wDia, wMes, wAno: word;
   ls_PrimerTraslado: String;
   ls_mensaje: String;
   ls_OrigenActivo: String;

Begin
   If Length(Trim(dblcdCCosto.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar el CENTRO DE COSTO');
      dblcdCCosto.SetFocus;
      exit;
   End;
   wCCOSID := Trim(dblcdCCosto.Text);

   If length(trim(edtDestLocal.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Local');
      dblcDestLocal.SetFocus;
      exit;
   End;

   If length(trim(edtDestPiso.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Piso');
      dblcDestPiso.SetFocus;
      exit;
   End;

   If length(trim(edtDestArea.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Área');
      dblcDestArea.SetFocus;
      exit;
   End;

   If length(trim(edtDestAmbiente.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Ambiente');
      dblcDestAmbiente.SetFocus;
      exit;
   End;

   If length(trim(edtUsuBienTras.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Usuario del Bien');
      dbeUsuBienTras.SetFocus;
      exit;
   End;

   If length(trim(dblcMotivoSal.Text)) = 0 Then
   Begin
      ShowMessage('Debe Indicar el Motivo de Traslado');
      dblcMotivoSal.SetFocus;
      exit;
   End;

   If length(trim(dblcDocRefSal.Text)) = 0 Then
   Begin
      ShowMessage('Debe Indicar el Documento de Referencia para el Traslado');
      dblcDocRefSal.SetFocus;
      exit;
   End;

   If length(trim(dbeNumDocSal.Text)) = 0 Then
   Begin
      ShowMessage('Debe Indicar el Número de Documento de Referencia para el Traslado');
      dbeNumDocSal.SetFocus;
      exit;
   End;

   If length(trim(dblcResponsabTras.Text)) = 0 Then
   Begin
      ShowMessage('Debe Indicar el Responsable del Traslado');
      dblcResponsabTras.SetFocus;
      exit;
   End;

   If MessageDlg('¿Está seguro de actualizar estos datos para el/los Activo(s)?' + chr(13), mtconfirmation, [mbYes, mbNo], 0) = mrNo Then
      exit;

   xSQL := 'Update ACF126 SET CCOSID=''' + dblcdCCosto.Text + ''' WHERE RECIBEID=''' + dbeUsuAutoTras.Text + ''' ';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo actualizar el CCOSTO del usuario que RECIBE el ACTIVO...');
      exit;
   End;

   xSQL := 'update ACF320 set ACEPTADO=''S'' where NUMDOC=' + quotedstr(dbeNumDocSal.Text);
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Cabecera de Traslados No se ha podido Actualizar');
      exit;
   End;
   decodedate(dbdtpFecTras.Date, wAno, wMes, wDia);
   xFecha := strzero(trim(inttostr(wDia)), 2) + '/'
      + strzero(trim(inttostr(wMes)), 2) + '/'
      + copy(inttostr(wAno), 1, 4);
   xFechaStr := strzero(trim(inttostr(wDia)), 2) + '/'
      + strzero(trim(inttostr(wMes)), 2) + '/'
      + copy(inttostr(wAno), 1, 4);

   DMAF.cdsInvTras.DisableControls;
   DMAF.cdsInvTras.First;
   While Not DMAF.cdsInvTras.EOF Do
   Begin
   // obtiene CIAID desde el ACF123 - ambientes
      wxCiaId := DMAF.FindCiaId(dblcDestLocal.Text, dblcDestPiso.Text, dblcDestArea.Text, dblcDestAmbiente.Text);
      If (wxCiaId = 'EE') Or (wxCiaId = '') Then
      Begin
         ShowMessage('La Cia. no está asignada correctamente');
         Exit;
      End;

   // actualiza el archivo de Inventarios
      xSQL := 'update ACF201 '
         + '      set CIAID=' + quotedstr(wxCiaId) + ','
         + '          UBICID=' + quotedstr(wxCiaId) + ','
         + '          LOCID=' + quotedstr(dblcDestLocal.Text) + ','
         + '          PISO=' + quotedstr(dblcDestPiso.Text) + ','
         + '          AREA=' + quotedstr(dblcDestArea.Text) + ','
         + '          AMBCOD=' + quotedstr(dblcDestAmbiente.Text) + ','
         + '          RECIBEID=' + quotedstr(dbeUsuBienTras.Text) + ','
         + '          RECIBENOM=' + quotedstr(edtUsuBienTras.Text) + ','
         + '          CCOSID=' + quotedstr(wCCOSID) + ','
         + '          TRAFECHA=' + quotedstr(xFecha) + ','
         + '          OTRTDOC=' + quotedstr(dblcDocRefSal.Text) + ','
         + '          OTRNDOC=' + quotedstr(dbeNumDocSal.Text) + ','
         + '          ACFUSER=' + quotedstr(dblcResponsabTras.Text) + ','
         + '          VERI=' + quotedstr('S') + ','
         + '          ACFFREG=TO_DATE(SYSDATE),'
         + '          ACFHREG=SYSDATE '
         + '    where ARTCODBAR=' + quotedstr(DMAF.cdsInvTras.FieldByName('ARTCODBAR').AsString);
      Try
         DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Activo No se ha podido Actualizar');
         exit;
      End;

      If RadioButton_unico.Checked = True Then
      Begin
         ls_OrigenActivo := 'UNICO';
      End
      Else
      Begin
         ls_OrigenActivo := 'MULTIPLE';
      End;

      xSQL := ' Update ACF320 '
         + '       set ACF320.UBIORI = ' + QuotedStr(ls_OrigenActivo)
         + '     where ACF320.DOCREF = ' + QuotedStr(dblcDocRefSal.Text)
         + '       and ACF320.NUMDOC = ' + QuotedStr(dbeNumDocSal.Text);
      Try
         DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al actualizar Traslado');
         exit;
      End;

      ls_PrimerTraslado := 'NO';
// Inicio HPC_201801_ACF
// Se adiciona mas condiciones para no generar Mov. de Salida
      xSQL := ' Select A.ESTADOID '
         + '      FROM LOG332 A INNER JOIN TGE152 B ON A.CIAID = B.CIAID AND A.TINID = B.TINID  '
         + '     where A.CODBAR = ' + quotedstr(DMAF.cdsInvTras.FieldByName('ARTCODBAR').AsString)
         + '       and A.NISATIP = ' + QuotedStr('INGRESO')
         + '       and A.NISSIT = ' + QuotedStr('ACEPTADO')
         + '       and B.HABILITADO = ' + QuotedStr('S')
         + '       and (A.ESTADOID = ' + quotedstr('X') + '  ) ';
      DMAF.cdsQry9.close;
      DMAF.cdsQry9.DataRequest(xSQL);
      DMAF.cdsQry9.Open;
      If DMAF.cdsQry9.RecordCount > 0 Then
         ls_PrimerTraslado := 'SI';

// Si ya existe movimientos de traslado ya no debe generar Mov. de Salida
      xSQL := ' Select ARTCODBAR '
         + '      from ACF321 '
         + '     where ARTCODBAR = ' + quotedstr(DMAF.cdsInvTras.FieldByName('ARTCODBAR').AsString)
         + '       and NUMDOC NOT IN (' + QuotedStr(dbeNumDocSal.Text) + ') ';
      DMAF.cdsQry9.close;
      DMAF.cdsQry9.DataRequest(xSQL);
      DMAF.cdsQry9.Open;
      If DMAF.cdsQry9.RecordCount > 0 Then
         ls_PrimerTraslado := 'NO';
// Si encuentra movimientos de Depreciación ya no debe generar nota de salida
      xSQL := ' Select ARTCODBAR '
         + '      from ACF204 '
         + '     where ARTCODBAR = ' + quotedstr(DMAF.cdsInvTras.FieldByName('ARTCODBAR').AsString);
      DMAF.cdsQry9.close;
      DMAF.cdsQry9.DataRequest(xSQL);
      DMAF.cdsQry9.Open;
      If DMAF.cdsQry9.RecordCount > 0 Then
         ls_PrimerTraslado := 'NO';
// Si encuentra Maestro de Activos con estado diferente de ('P') ya no debe generar nota de salida
      xSQL := ' Select CODIGOBARRA '
         + '      from ACF201 '
         + '     where CODIGOBARRA = ' + quotedstr(DMAF.cdsInvTras.FieldByName('ARTCODBAR').AsString)
         + '       and ACFFLAGACT NOT IN (' + quotedstr('P') + ') ';
      DMAF.cdsQry9.close;
      DMAF.cdsQry9.DataRequest(xSQL);
      DMAF.cdsQry9.Open;
      If DMAF.cdsQry9.RecordCount > 0 Then
         ls_PrimerTraslado := 'NO';
// Fin HPC_201801_ACF

    // ACTUALIZA EL LOG332 ESTADOID:='T' , PARA CONSIDERARLOS COMO ACTIVOS CON ORDEN DE TRASLADO
    // RECIEN CUANDO SE REALIZA LA NOTA DE SALIDA POR iNVENTARIOS, SE LE MARCA CON UNA 'A' PARA
    // CONSIDERARLOS COMO YA ACTIVADOS
// Inicio HPC_201801_ACF
// Se colocó el condicional debido a que solo se debe de actualizar el estado en el primer traslado
      If ls_PrimerTraslado = 'SI' Then
      Begin
        xSQL := 'Update LOG332 '
           + '      set ESTADOID=' + quotedstr('T') + ','
           + '          OTRNDOC=' + quotedstr(dbeNumDocSal.Text) + ', '
           + '          NFAC = (Case when ESTADOID = ' + quotedstr('X') + ' Then null else NFAC end) '
           + '    where CODBAR=' + quotedstr(DMAF.cdsInvTras.FieldByName('ARTCODBAR').AsString);
        Try
           DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
        Except
           ShowMessage('Activo No se ha podido Actualizar en LOG332');
           exit;
        End;
      End;
// Fin HPC_201801_ACF

      xSQL := 'Update LOG332 '
         + '      set OTRNDOC=' + quotedstr(dbeNumDocSal.Text) + ', '
         + '          NFAC = (case when ESTADOID = ' + quotedstr('X') + ' then null else NFAC end) '
         + '    where CODBAR=' + quotedstr(DMAF.cdsInvTras.FieldByName('ARTCODBAR').AsString);
      Try
         DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Activo No se ha podido Actualizar en LOG332');
         exit;
      End;
      DMAF.cdsInvTras.Next;
   End;
   DMAF.cdsInvTras.EnableControls;

   If ls_PrimerTraslado = 'SI' Then
   Begin
      xSQL := 'BEGIN '
         + '      DB2ADMIN.SP_ACF_SALIDA_TRASLADO(' + quotedstr(dblcDocRefSal.Text) + ', '
         + quotedstr(dbeNumDocSal.Text) + ') ;'
         + '   END ;';
      DMAF.DCOM1.AppServer.Ejecutasql(xSQL);

      xSQL := ' SELECT NFAC '
         + '      FROM LOG332 '
         + '     WHERE OTRNDOC = ' + quotedstr(dbeNumDocSal.Text)
         + '       AND NISSIT = ' + QuotedStr('ACEPTADO')
         + '       AND NFAC IS NOT NULL '
         + '       AND NISATIP = ' + QuotedStr('INGRESO')
         + '       AND ROWNUM = 1 ';
      DMAF.cdsQry9.close;
      DMAF.cdsQry9.DataRequest(xSQL);
      DMAF.cdsQry9.Open;
      ls_mensaje := 'Se Generó la Nota de Salida Nº ' + DMAF.cdsQry9.FieldByName('NFAC').AsString;
      ShowMessage(ls_mensaje);
   End;

   btnInsertaTraslado.Enabled := False;
   bbtngrabaSal.Enabled := False;

   btnDetalle.Enabled := False;
   btnCabecera.Enabled := False;
   lblAceptado.Caption := 'ACEPTADO';

   dbgActivosxTras.KeyOptions := [];

   ShowMessage('Activo(s) Actualizado(s)');
End;

Procedure TFTomaInvAF.dbeReuCodBarrasExit(Sender: TObject);
Var
   xSQL: String;
Begin
   dbeReuCodBarras.Text := copy('000000' + trim(dbeReuCodBarras.Text),
      length(trim('000000' + dbeReuCodBarras.Text)) - 6 + 1, 6);

   If strtoint(dbeReuCodBarras.Text) = 0 Then exit;

   xSQL := 'Select A.LOCID,B.LOCDES,A.PISO,C.PISODES,A.AREA,D.AREADES,'
      + '          A.AMBCOD,E.AMBDES,A.ARTCODBAR,A.ACFDES,A.ESTADOID,'
      + '          A.MATERIALID,A.ACFDESL,A.ACFMARCA,'
      + '          A.ACFMODELO,A.ACFSERIE,A.ACFMEDIDA,'
      + '          A.RECIBEID,A.RECIBENOM,A.ACFFECADQ, '
      + '          A.ODCID,A.ACFFECRECE,A.PROV,A.DOCID,A.ACFSERIEDO,A.ACFNODOC,A.TMONID,A.ACFVALOMO '
      + '     from ACF201 A, ACF120 B, ACF121 C, ACF122 D, ACF123 E '
      + '    where (B.LOCID(+)=A.LOCID) and (C.LOCID(+)=A.LOCID and C.PISO(+)=A.PISO) '
      + '      and (D.LOCID(+)=A.LOCID and  D.PISO(+)=A.PISO and D.AREA(+)=A.AREA) '
      + '      and (E.LOCID(+)=A.LOCID and  E.PISO(+)=A.PISO and E.AREA(+)=A.AREA and E.AMBCOD(+)=A.AMBCOD) '
      + '      and A.ARTCODBAR=' + quotedstr(dbeReuCodBarras.Text);
   DMAF.cdsInventario.Close;
   DMAF.cdsInventario.IndexFieldNames := '';
   DMAF.cdsInventario.Filter := '';
   DMAF.cdsInventario.Filtered := False;
   DMAF.cdsInventario.DataRequest(xSQL);
   DMAF.cdsInventario.Open;
   If DMAF.cdsInventario.recordcount = 0 Then
   Begin
      ShowMessage('Código de Barras No Registrado');
      dbeCodigoBarra.SetFocus;
      exit;
   End;
   If DMAF.cdsInventario.recordcount > 1 Then
   Begin
      ShowMessage('Alerta Hay más de 1 código de Barras Registrado');
      dbeCodigoBarra.SetFocus;
      exit;
   End;

   If DMAF.cdsInvTras.IndexFieldNames <> 'ARTCODBAR' Then
      DMAF.cdsInvTras.IndexFieldNames := 'ARTCODBAR';
   DMAF.cdsInvTras.SetKey;
   DMAF.cdsInvTras.FieldByName('ARTCODBAR').AsString := dbeReuCodBarras.Text;
   If DMAF.cdsInvTras.Gotokey Then
   Begin
      ShowMessage('Activo ya fuen Inscrito en la Lista de Traslado');
      dbeCodigoBarra.SetFocus;

      exit;
   End;

   If length(trim(xxLocalTras)) > 0 Then
   Begin

      If ((xxLocalTras <> DMAF.cdsInventario.FieldByName('LOCID').AsString) Or
         (xxPisoTras <> DMAF.cdsInventario.FieldByName('PISO').AsString) Or
         (xxAreaTras <> DMAF.cdsInventario.FieldByName('AREA').AsString)) And (RadioButton_unico.Checked = True) Then
      Begin
         ShowMessage('Activo Fijo no pertenece al Local,Piso o Area Inicial');
         dbeCodigoBarra.SetFocus;
         exit;
      End;
   End;

   dblcOrigLocal.Text := DMAF.cdsInventario.FieldByName('LOCID').AsString;
   edtOrigLocal.Text := DMAF.cdsInventario.FieldByName('LOCDES').AsString;
   dblcOrigPiso.Text := DMAF.cdsInventario.FieldByName('PISO').AsString;
   edtOrigPiso.Text := DMAF.cdsInventario.FieldByName('PISODES').AsString;
   dblcOrigArea.Text := DMAF.cdsInventario.FieldByName('AREA').AsString;
   edtOrigArea.Text := DMAF.cdsInventario.FieldByName('AREADES').AsString;
   dblcOrigAmbiente.Text := DMAF.cdsInventario.FieldByName('AMBCOD').AsString;
   edtOrigAmbiente.Text := DMAF.cdsInventario.FieldByName('AMBDES').AsString;
   dbeOrigUsuario.Text := DMAF.cdsInventario.FieldByName('RECIBEID').AsString;
   edtOrigUsuario.Text := DMAF.cdsInventario.FieldByName('RECIBENOM').AsString;
   edtOrigDenominaci.Text := DMAF.cdsInventario.FieldByName('ACFDES').AsString;
   edtOrigAcfDesl.Text := DMAF.cdsInventario.FieldByName('ACFDESL').AsString;
   dbeOrigMaterial.Text := DMAF.cdsInventario.FieldByName('MATERIALID').AsString;
   dbeOrigMarca.Text := DMAF.cdsInventario.FieldByName('ACFMARCA').AsString;
   dbeOrigModelo.Text := DMAF.cdsInventario.FieldByName('ACFMODELO').AsString;
   dbeOrigSerie.Text := DMAF.cdsInventario.FieldByName('ACFSERIE').AsString;
   dbeOrigDimensio.Text := DMAF.cdsInventario.FieldByName('ACFMEDIDA').AsString;
   dbeOrigEstado.Text := DMAF.cdsInventario.FieldByName('ESTADOID').AsString;

   bbtnAdicDetalleTras.SetFocus;
End;

Procedure TFTomaInvAF.dblcResponsabTrasExit(Sender: TObject);
Begin
   If bbtnComienzadenuevo.Focused Then exit;

   If DMAF.cdsUsuario.IndexFieldNames <> 'USUARIO' Then
      DMAF.cdsUsuario.IndexFieldNames := 'USUARIO';
   DMAF.cdsUsuario.SetKey;
   DMAF.cdsUsuario.FieldByName('USUARIO').AsString := dblcResponsabTras.Text;
   If Not DMAF.cdsUsuario.GotoKey Then
   Begin
      ShowMessage('USUARIO NO EXISTE EN LA RELACION, REINTENTE!');
      dblcResponsabTras.Enabled := True;
      dblcResponsabTras.SetFocus;
      exit;
   End;
   edtResponsabTras.Text := DMAF.cdsUsuario.FieldByName('NOMBRE').AsString;

   xTrabIdUsuario := DMAF.cdsUsuario.FieldByName('TRABID').AsString;

End;

Procedure TFTomaInvAF.bbtnIniciaTrasladoClick(Sender: TObject);
Var
   xSQL: String;
Begin
// Doc. de Referencia
   lblDocRefSal.Enabled := True;
   dblcDocRefSal.Text := 'ORDEN TRASLADO';
// Número de Documento
   lblNumDocSal.Enabled := True;
   dbeNumDocSal.Text := UltimaOrden;
// Fecha de Traslado
   lblFechaTras.Enabled := True;
   dbdtpFecTras.Enabled := True;
   dbdtpFecTras.Date := date;
// Motivo del Traslado
   lblMotivoSal.Enabled := True;
   dblcMotivoSal.Enabled := True;
   dblcMotivoSal.Clear;
// Responsable de Servicios Generales
   lblUserDest.Enabled := True;
   dblcResponsabTras.Enabled := True;
   dblcResponsabTras.Clear;
   edtResponsabTras.Enabled := True;
   edtResponsabTras.Clear;
// observaciones
   lblObservac.Enabled := True;
   dbeObservac.Enabled := True;
   dbeObservac.clear;
// Título Destinatario
   lblDestinatario.Enabled := True;
// local destino
   lblDestLocal.Enabled := True;
   dblcDestLocal.Enabled := True;
   dblcDestLocal.Clear;
   edtDestLocal.Clear;
// piso destino
   lblDestPiso.Enabled := True;
   dblcDestPiso.Enabled := True;
   dblcDestPiso.Clear;
   edtDestPiso.Clear;
// area destino
   lblDestArea.Enabled := True;
   dblcDestArea.Enabled := True;
   dblcDestArea.Clear;
   edtDestArea.Clear;
//Inicio HPC_201503_ACF
// ccosto
   dblcdCCosto.Enabled := True;
   dblcdCCosto.Clear;
//Final HPC_201503_ACF

// ambiente
   lblDestAmbiente.Enabled := True;
   dblcDestAmbiente.Enabled := True;
   dblcDestAmbiente.Clear;
   edtDestAmbiente.Clear;
// usuario final
   lblDestUsuario.Enabled := True;
   dbeUsuBienTras.Enabled := True;
   dbeUsuBienTras.Clear;
   edtUsuBienTras.Enabled := False;
   edtUsuBienTras.Clear;
   bbtnBuscaUsuBienTras.Enabled := True;
// usuario autorizado q recibe
   lblUsuAutorDest.Enabled := True;
   dbeUsuAutoTras.Enabled := True;
   dbeUsuAutoTras.clear;
   edtUsuAutoTras.Enabled := False;
   edtUsuAutoTras.clear;
   bbtnBuscaUsuAutoTras.Enabled := True;
// título origen
   lblOrigen.Enabled := True;
// usuario autorizado q envía
   lblUsuAutorOrig.Enabled := True;
   dbeUsuOrigTras.Enabled := True;
   dbeUsuOrigTras.Clear;
   edtUsuOrigTras.Enabled := False;
   edtUsuOrigTras.Clear;
   bbtnBuscaUsuOrigTras.Enabled := True;
// botón de eliminación JCC 05/Nov
   bbtnElimTras.Enabled := False;

   xBuscaUsuBienTras := False;
   xBuscaUsuAutoTras := False;
   xBuscaUsuOrigTras := False;

   btnInsertaTraslado.Enabled := True;
   dbeNumDocSal.Enabled := False;
   dbgActivosxTras.DataSource := Nil;
//   btnInsertaTraslado.Enabled:=False;
   dbgActivosxTras.Enabled := False;

//   DMAF.cdsInvTras.Close;
   xxLocalTras := '';

   dblcMotivoSal.SetFocus;

   dblcResponsabTras.Text := DMAF.wUsuario;
   dblcResponsabTrasExit(Self);
   dbeUsuOrigTras.Text := xTrabIdUsuario;
   dbeUsuOrigTrasExit(Self);

   dblcResponsabTras.Enabled := False;
   edtResponsabTras.Enabled := False;
   dbeUsuOrigTras.Enabled := False;
   bbtnBuscaUsuOrigTras.Enabled := False;

End;

Function TFTomaInvAF.UltimaOrden: String;
Var
   xSQL: String;
Begin
   result := '00001';
   xSQL := 'Select max(NUMDOC) NUMDOC '
      + '     from ACF320 '
      + '    where DOCREF=' + quotedstr('ORDEN TRASLADO');
   DMAF.cdsBusca.Close;
   DMAF.cdsBusca.IndexFieldNames := '';
   DMAF.cdsBusca.Filter := '';
   DMAF.cdsBusca.DataRequest(xSQL);
   DMAF.cdsBusca.Open;
   If length(DMAF.cdsBusca.FieldByname('NUMDOC').AsString) > 0 Then
      result := trim(inttostr(strtoint(DMAF.cdsBusca.FieldByname('NUMDOC').AsString) + 1));
   result := strzero(result, 5);
End;

Procedure TFTomaInvAF.dblcResponsabTrasCloseUp(Sender: TObject; LookupTable,
   FillTable: TDataSet; modified: Boolean);
Begin
   If DMAF.cdsUsuario.IndexFieldNames <> 'USUARIO' Then
      DMAF.cdsUsuario.IndexFieldNames := 'USUARIO';
   DMAF.cdsUsuario.SetKey;
   DMAF.cdsUsuario.FieldByName('USUARIO').AsString := dblcResponsabTras.Text;
   If Not DMAF.cdsUsuario.GotoKey Then
   Begin
      ShowMessage('USUARIO NO EXISTE EN LA RELACION, REINTENTE!');
      dblcResponsabTras.SetFocus;
      exit;
   End;
   edtResponsabTras.Text := DMAF.cdsUsuario.FieldByName('NOMBRE').AsString;
End;

Procedure TFTomaInvAF.btnInsertaTrasladoClick(Sender: TObject);
Begin
   pnlDatosOrigen.Visible := True;
   pnlDatosOrigen.Left := 109;
   pnlDatosOrigen.Top := 105;
   dblcOrigLocal.Clear;
   edtOrigLocal.Clear;
   dblcOrigPiso.Clear;
   edtOrigPiso.Clear;
   dblcOrigArea.Clear;
   edtOrigArea.Clear;
   dblcOrigAmbiente.Clear;
   edtOrigAmbiente.Clear;
   dbeOrigUsuario.Clear;
   edtOrigUsuario.Clear;
   dbeOrigEstado.Clear;
   edtOrigDenominaci.Clear;
   edtOrigAcfDesl.Clear;
   dbeOrigMaterial.Clear;
   dbeOrigMarca.Clear;
   dbeOrigModelo.Clear;
   dbeOrigSerie.Clear;
   dbeOrigDimensio.Clear;
   dbeReuCodBarras.Clear;
   bbtnGrabaSal.Enabled := False;
   bbtnRepTraslado.Enabled := False;
   bbtnComienzadeNuevo.Enabled := False;
   btnInsertaTraslado.Enabled := False;
   dbgActivosxTras.Enabled := False;
   dbeCodigoBarra.SetFocus;
End;

Procedure TFTomaInvAF.edtUsuBienTrasExit(Sender: TObject);
Begin
   If bbtnComienzadenuevo.Focused Then exit;
   If (length(dbeUsuBienTras.Text) > 0) And (length(edtUsuBienTras.Text) > 0) Then
   Begin
      dbeUsuBienTras.setfocus;
   End;
End;

Procedure TFTomaInvAF.bbtnCancelSalClick(Sender: TObject);
Begin
   pnlDatosOrigen.Visible := False;
   If wVezGrabaSal > 0 Then
   Begin
      bbtnGrabaSal.Enabled := True;
      bbtnRepTraslado.Enabled := True;
      bbtnComienzadeNuevo.Enabled := True;
      btnInsertaTraslado.Enabled := True;
   End;
   dbgActivosxTras.Enabled := True;
   dbgActivosxTras.SetFocus;
End;

Procedure TFTomaInvAF.bbtnRepTrasladoClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select CAB.DOCREF,CAB.NUMDOC,CAB.FECTRAS,CAB.USUARIO,CAB.MOTIVO,CAB.LOCAL_D,CAB.LOCDES_D,CAB.PISO_D,CAB.AREA_D,CAB.AREADES_D,'
      + '          CAB.AMB_D,CAB.AMBDES_D,CAB.USUBIEN_D,CAB.NOMUSU_D, CAB.USUAUT_D, CAB.NOMAUT_D, CAB.USUAUT_O, CAB.NOMAUT_O, '
      + '          CAB.ACEPTADO, ''        '' ESTADOTRAS, '
      + '          INVEN.CODIGOBARRA ARTCODBAR,DET.LOCID,ACF120.LOCDES,DET.PISO,DET.AREA,ACF122.AREADES,DET.AMBCOD,ACF123.AMBDES,'
      + '          INVEN.ACFDES,INVEN.ACFDESL,INVEN.ESTADOID,INVEN.MATERIALID,INVEN.ACFMARCA,INVEN.ACFMODELO,INVEN.ACFSERIE,'
      + '          INVEN.ACFMEDIDA,INVEN.RECIBEID,INVEN.RECIBENOM,CAB.OBSERVAC '
      + '     from ACF321 DET,ACF320 CAB, ACF201 INVEN, ACF120, ACF122, ACF123 '
      + '    where DET.DOCREF=' + quotedstr(dblcDocRefSal.Text)
      + '      and DET.NUMDOC=' + quotedstr(dbeNumDocSal.Text)
      + '      and (CAB.DOCREF=DET.DOCREF and CAB.NUMDOC=DET.NUMDOC)'
      + '      and (DET.ARTCODBAR=INVEN.ARTCODBAR)'
      + '      and (ACF120.LOCID=DET.LOCID) '
      + '      and (ACF122.LOCID=DET.LOCID and ACF122.PISO=DET.PISO and ACF122.AREA=DET.AREA) '
// Inicio HPC_201802_ACF
// Se realiza cambio a las columnas de Ubicación de Destino
      + '      and (ACF123.LOCID=DET.TRANLOCID and ACF123.PISO=DET.TRANPISO and ACF123.AREA=DET.TRANAREA and ACF123.AMBCOD=DET.TRANAMBCOD)';
// Fin HPC_201802_ACF
   pprPadron.DataPipeline := Nil;
   ppdbPadron.DataSource := Nil;
   DMAF.cdsBusca.Close;
   DMAF.cdsBusca.IndexFieldNames := '';
   DMAF.cdsBusca.Filter := '';
   DMAF.cdsBusca.Filtered := False;
   DMAF.cdsBusca.DataRequest(xSQL);
   DMAF.cdsBusca.Open;
   If DMAF.cdsBusca.RecordCount = 0 Then
   Begin
      ShowMessage('No hay ocurrencias para mostrar');
      exit;
   End;
   DMAF.cdsBusca.First;
   While Not DMAF.cdsBusca.EOF Do
   Begin
      DMAF.cdsBusca.Edit;
      If DMAF.cdsBusca.FieldByName('ACEPTADO').AsString = 'S' Then
         DMAF.cdsBusca.FieldByName('ESTADOTRAS').AsString := 'ACEPTADO'
      Else
         If DMAF.cdsBusca.FieldByName('ACEPTADO').AsString = 'X' Then
            DMAF.cdsBusca.FieldByName('ESTADOTRAS').AsString := 'ANULADO'
         Else
            DMAF.cdsBusca.FieldByName('ESTADOTRAS').AsString := 'PREVIO';
      DMAF.cdsBusca.Next;
   End;
   ppdbPadron.DataSource := DMAF.dsBusca;
   pprPadron.DataPipeline := ppdbPadron;

   If RadioButton_unico.Checked = True Then
   Begin
      pprPadron.Template.FileName := wRutaRpt + 'ACF\DEMA\TrasladosACF201.rtm';
   End
   Else
   Begin
      pprPadron.Template.FileName := wRutaRpt + 'ACF\DEMA\TrasladosACF201_multiple.rtm';
   End;

   pprPadron.Template.LoadFromFile;
   pprPadron.Print;
   pprPadron.Stop;
End;

Procedure TFTomaInvAF.bbtnTrasladoAntClick(Sender: TObject);
Begin
   lblDocRefSal.Enabled := False;
   dblcDocRefSal.Text := 'ORDEN TRASLADO';
// Fecha de Traslado
   lblFechaTras.Enabled := False;
   dbdtpFecTras.Enabled := False;
// Motivo del Traslado
   lblMotivoSal.Enabled := False;
   dblcMotivoSal.Enabled := False;
// Responsable de Servicios Generales
   lblUserDest.Enabled := False;
   dblcResponsabTras.Enabled := False;
   edtResponsabTras.Enabled := False;
// observaciones
   lblObservac.Enabled := False;
   dbeObservac.Enabled := False;
// Título Destinatario
   lblDestinatario.Enabled := False;
// local destino
   lblDestLocal.Enabled := False;
   dblcDestLocal.Enabled := False;
// piso destino
   lblDestPiso.Enabled := False;
   dblcDestPiso.Enabled := False;
// area destino
   lblDestArea.Enabled := False;
   dblcDestArea.Enabled := False;
//Inicio HPC_201503_ACF
// ccosto
   dblcdCCosto.Enabled := False;
//Final HPC_201503_ACF
// ambiente
   lblDestAmbiente.Enabled := False;
   dblcDestAmbiente.Enabled := False;
// usuario final
   lblDestUsuario.Enabled := False;
   dbeUsuBienTras.Enabled := False;
   edtUsuBienTras.Enabled := False;
   bbtnBuscaUsuBienTras.Enabled := False;
// usuario autorizado q recibe
   lblUsuAutorDest.Enabled := False;
   dbeUsuAutoTras.Enabled := False;
   edtUsuAutoTras.Enabled := False;
   bbtnBuscaUsuAutoTras.Enabled := False;
// título origen
   lblOrigen.Enabled := False;
// usuario autorizado q envía
   lblUsuAutorOrig.Enabled := False;
   dbeUsuOrigTras.Enabled := False;
   edtUsuOrigTras.Enabled := False;
   bbtnBuscaUsuOrigTras.Enabled := False;

// botón de eliminación JCC 05/Nov
   bbtnElimTras.Enabled := False;

   DMAF.cdsLocal.Filter := '';
   DMAF.cdsLocal.Filtered := false;
   DMAF.cdsPiso.Filter := '';
   DMAF.cdsPiso.Filtered := false;
   DMAF.cdsArea.Filter := '';
   DMAF.cdsArea.Filtered := false;
   DMAF.cdsAmbiente.Filter := '';
   DMAF.cdsAmbiente.Filtered := false;

   RadioGroup_OrigenActivo.Enabled := False;
   RadioButton_unico.Enabled := False;
   RadioButton_multiple.Enabled := False;

   dbeNumDocSal.Enabled := True;
   dbeNumDocSal.Text := DMAF.cdsCabTraslado.FieldByName('NUMDOC').AsString;
   dbeNumDocSal.Enabled := False;
   dbeNumDocSalExit(self);
End;

Procedure TFTomaInvAF.dbeNumDocSalExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If bbtnComienzadenuevo.Focused Then exit;

   dbeNumDocSal.Text := strzero(dbeNumDocSal.Text, 5);

   xSQL := 'Select * from ACF320 '
      + '    where NUMDOC=' + quotedstr(dbeNumDocSal.Text);
   DMAF.cdsCabTraslado.Close;
   DMAF.cdsCabTraslado.IndexFieldNames := '';
   DMAF.cdsCabTraslado.Filter := '';
   DMAF.cdsCabTraslado.Filtered := False;
   DMAF.cdsCabTraslado.DataRequest(xSQL);
   DMAF.cdsCabTraslado.Open;

   If DMAF.cdsCabTraslado.RecordCount = 0 Then
   Begin
      ShowMessage('Número de Orden de Traslado No existe');
      dbeNumDocSal.SetFocus;
      exit;
   End;
// Fecha de Traslado
   dbdtpFecTras.date := DMAF.cdsCabTraslado.FieldByName('FECTRAS').AsDateTime;
// Motivo de Traslado
   dblcMotivoSal.Text := DMAF.cdsCabTraslado.FieldByName('MOTIVO').AsString;
// responsable de SSGG que se encarga del traslado
   dblcResponsabTras.Text := DMAF.cdsCabTraslado.FieldByName('USUARIO').AsString;
   dblcResponsabTrasExit(Sender);
// local destinatario
   dblcDestLocal.Text := DMAF.cdsCabTraslado.FieldByName('LOCAL_D').AsString;
   edtDestLocal.Text := DMAF.cdsCabTraslado.FieldByName('LOCDES_D').AsString;
// piso destinatario
   dblcDestPiso.Text := DMAF.cdsCabTraslado.FieldByName('PISO_D').AsString;
   dblcDestPisoExit(sender);
// area destinatario
   dblcDestArea.Text := DMAF.cdsCabTraslado.FieldByName('AREA_D').AsString;
   edtDestArea.Text := DMAF.cdsCabTraslado.FieldByName('AREADES_D').AsString;
// ambiente destinatario
   dblcDestAmbiente.Text := DMAF.cdsCabTraslado.FieldByName('AMB_D').AsString;
   edtDestAmbiente.Text := DMAF.cdsCabTraslado.FieldByName('AMBDES_D').AsString;
// observaciones
   dbeObservac.Text := DMAF.cdsCabTraslado.FieldByName('OBSERVAC').AsString;
// usuario que va a recibir el Activo
   dbeUsuBienTras.Text := DMAF.cdsCabTraslado.FieldByName('USUBIEN_D').AsString;
   edtUsuBienTras.Text := DMAF.cdsCabTraslado.FieldByName('NOMUSU_D').AsString;

   DMAF.cdsResponsab.IndexFieldNames := 'RECIBEID';
   DMAF.cdsResponsab.SetKey;
   DMAF.cdsResponsab.FieldByName('RECIBEID').AsString := dbeUsuBienTras.Text;
   DMAF.cdsResponsab.GotoKey;
   dblcdCCosto.Text := DMAF.cdsResponsab.FieldByName('CCOSID').AsString;

// Usuario autorizado (Jefe) del área que recibe el Activo
   dbeUsuAutoTras.Text := DMAF.cdsCabTraslado.FieldByName('USUAUT_D').AsString;
   edtUsuAutoTras.Text := DMAF.cdsCabTraslado.FieldByName('NOMAUT_D').AsString;
// Usuario autorizado que permite la salida del Activo
   dbeUsuOrigTras.Text := DMAF.cdsCabTraslado.FieldByName('USUAUT_O').AsString;
   edtUsuOrigTras.Text := DMAF.cdsCabTraslado.FieldByName('NOMAUT_O').AsString;

   If DMAF.cdsCabTraslado.FieldByName('UBIORI').AsString = 'UNICO' Then
   Begin
      RadioButton_unico.Checked := True;
      RadioButton_multiple.Checked := False;
   End
   Else
   Begin
      RadioButton_unico.Checked := False;
      RadioButton_multiple.Checked := True;
   End;

   RecuperaDetalle(dbeNumDocSal.Text);

   DMAF.cdsInvTras.IndexFieldNames := 'ARTCODBAR';
   dbgActivosxTras.DataSource := DMAF.dsInvTras;
   MuestraGrid;
   dbgActivosxTras.KeyOptions := [];
   dbgActivosxTras.Enabled := True;
   If DMAF.cdsCabTraslado.FieldByName('ACEPTADO').AsString = 'S' Then
   Begin
      BtnDetalle.Enabled := False;
      BtnCabecera.Enabled := False;
      bbtnGrabaSal.Enabled := False;
      btnInsertaTraslado.Enabled := False;
      bbtnRepTraslado.Enabled := True;
      lblAceptado.Caption := 'ACEPTADO';
   End
   Else
   Begin
      If DMAF.cdsCabTraslado.FieldByName('ACEPTADO').AsString = 'X' Then
      Begin
         BtnDetalle.Enabled := False;
         BtnCabecera.Enabled := False;
         bbtnGrabaSal.Enabled := False;
         btnInsertaTraslado.Enabled := False;
         bbtnRepTraslado.Enabled := True;
         lblAceptado.Caption := 'ANULADO';
      End
      Else
      Begin
         BtnDetalle.Enabled := True;
         BtnCabecera.Enabled := True;
         bbtnGrabaSal.Enabled := True;
         lblAceptado.Caption := '';
         btnInsertaTraslado.Enabled := True;
         bbtnRepTraslado.Enabled := True;
      End;
   End;
   If DMAF.wJK = '0' Then
   Begin
      BtnDetalle.Enabled := False;
      BtnCabecera.Enabled := False;
      bbtnGrabaSal.Enabled := False;
      dbgActivosxTras.Enabled := False;
      btnInsertaTraslado.Enabled := False;
      bbtnRepTraslado.Enabled := False;
   End;
End;

Procedure TFTomaInvAF.edtUsuOrigTrasExit(Sender: TObject);
Var
   xSQL, xFecTras, xFecReg: String;
   wAno, wMes, wDia: word;
Begin
   If (length(edtUsuOrigTras.Text) = 0) Then
   Begin
      ShowMessage('Debe indicar al Usuario Autorizado que Visará la Salida de los Activos');
      dbeUsuOrigTras.setfocus;
      exit;
   End;

// Fecha del Traslado
   decodedate(dbdtpFecTras.Date, wAno, wMes, wDia);
   xFecTras := strzero(trim(inttostr(wDia)), 2) + '/'
      + strzero(trim(inttostr(wMes)), 2) + '/'
      + copy(inttostr(wAno), 3, 2);

// Fecha de Registro del Sistema
   decodedate(Date, wAno, wMes, wDia);
   xFecReg := strzero(trim(inttostr(wDia)), 2) + '/'
      + strzero(trim(inttostr(wMes)), 2) + '/'
      + copy(inttostr(wAno), 3, 2);

   If DMAF.wModo = 'A' Then
      RecuperaDetalle('x')
   Else
      RecuperaDetalle(dbeNumDocSal.Text);

   DMAF.cdsInvTras.IndexFieldNames := 'ARTCODBAR';
   dbgActivosxTras.DataSource := DMAF.dsInvTras;

   dbgActivosxTras.Enabled := True;
   dbgActivosxTras.KeyOptions := [dgAllowDelete];

   MuestraGrid;

// Fecha de Traslado
   lblFechaTras.Enabled := False;
   dbdtpFecTras.Enabled := False;
// Motivo del Traslado
   lblMotivoSal.Enabled := False;
   dblcMotivoSal.Enabled := False;
// Responsable de Servicios Generales
   lblUserDest.Enabled := False;
   dblcResponsabTras.Enabled := False;
   edtResponsabTras.Enabled := False;
// observaciones
   lblObservac.Enabled := False;
   dbeObservac.Enabled := False;
// Título Destinatario
   lblDestinatario.Enabled := False;
// local destino
   lblDestLocal.Enabled := False;
   dblcDestLocal.Enabled := False;
// piso destino
   lblDestPiso.Enabled := False;
   dblcDestPiso.Enabled := False;
// area destino
   lblDestArea.Enabled := False;
   dblcDestArea.Enabled := False;
// ccosto
   dblcdCCosto.Enabled := False;

// ambiente
   lblDestAmbiente.Enabled := False;
   dblcDestAmbiente.Enabled := False;
// usuario final
   lblDestUsuario.Enabled := False;
   dbeUsuBienTras.Enabled := False;
   edtUsuBienTras.Enabled := False;
   bbtnBuscaUsuBienTras.Enabled := False;
// usuario autorizado q recibe
   lblUsuAutorDest.Enabled := False;
   dbeUsuAutoTras.Enabled := False;
   edtUsuAutoTras.Enabled := False;
   bbtnBuscaUsuAutoTras.Enabled := False;
// título origen
   lblOrigen.Enabled := False;
// usuario autorizado q envía
   lblUsuAutorOrig.Enabled := False;
   dbeUsuOrigTras.Enabled := False;
   edtUsuOrigTras.Enabled := False;
   bbtnBuscaUsuOrigTras.Enabled := False;
   bbtnComienzadeNuevo.Enabled := True;
End;

Procedure TFTomaInvAF.bbtnBuscaUsuAutoTrasClick(Sender: TObject);
Begin
   xBuscaUsuBienTras := False;
   xBuscaUsuAutoTras := True;
   xBuscaUsuOrigTras := False;
   PageControl1.Enabled := False;
   pnlBusqueda.BringToFront;
   pnlBusqueda.Left := 210;
   pnlBusqueda.Top := 129;
   pnlBusqueda.Visible := True;
   dbeBusca.Clear;
   dbeBusca.SetFocus;
End;

Procedure TFTomaInvAF.bbtnBuscaUsuOrigTrasClick(Sender: TObject);
Begin
   xBuscaUsuBienTras := False;
   xBuscaUsuAutoTras := False;
   xBuscaUsuOrigTras := True;
   PageControl1.Enabled := False;
   pnlBusqueda.BringToFront;
   pnlBusqueda.Left := 210;
   pnlBusqueda.Top := 129;
   pnlBusqueda.Visible := True;
   dbeBusca.Clear;
   dbeBusca.SetFocus;
End;

Procedure TFTomaInvAF.dbeUsuAutoTrasExit(Sender: TObject);
Begin

   If bbtnComienzadenuevo.Focused Then exit;
   If bbtnBuscaUsuAutoTras.Focused Then exit;
   If dblcDestAmbiente.Focused Then exit;
   If dblcDestArea.Focused Then exit;
   If dblcDestPiso.Focused Then exit;
   If dblcDestLocal.Focused Then exit;
   If dbeUsuAutoTras.Text <> '99999' Then
   Begin
      If DMAF.cdsResponsab.IndexFieldNames <> 'RECIBEID' Then
         DMAF.cdsResponsab.IndexFieldNames := 'RECIBEID';
      DMAF.cdsResponsab.SetKey;
      DMAF.cdsResponsab.FieldByName('RECIBEID').AsString := dbeUsuAutoTras.Text;
      If Not DMAF.cdsResponsab.GotoKey Then
      Begin
         ShowMessage('USUARIO QUE RECIBE NO EXISTE EN LA RELACION, REINTENTE!');
         dbeUsuAutoTras.SetFocus;
         exit;
      End;

      If DMAF.cdsResponsab.FieldByName('CCOSID').AsString = '' Then
      Begin
         ShowMessage('Usuario no tiene Centro de Costo Asociado' + #13 + ' en la tabla Usuarios del Bien');
         dbeUsuAutoTras.SetFocus;
         exit;
      End;

      edtUsuAutoTras.Text := DMAF.cdsResponsab.FieldByName('RECIBENOM').AsString;
   End
   Else
   Begin
      edtUsuAutoTras.enabled := True;
      edtUsuAutoTras.Text := '';
      edtUsuAutoTras.SetFocus;
   End;
End;

Procedure TFTomaInvAF.dbeUsuOrigTrasExit(Sender: TObject);
Begin
   wVezGrabaSal := 0;
   If bbtnBuscaUsuOrigTras.Focused Then exit;
   If dblcDestAmbiente.Focused Then exit;
   If dblcDestArea.Focused Then exit;
   If dblcDestPiso.Focused Then exit;
   If dblcDestLocal.Focused Then exit;
   If dbeUsuOrigTras.Text <> '99999' Then
   Begin
      If DMAF.cdsResponsab.IndexFieldNames <> 'RECIBEID' Then
         DMAF.cdsResponsab.IndexFieldNames := 'RECIBEID';
      DMAF.cdsResponsab.SetKey;
      DMAF.cdsResponsab.FieldByName('RECIBEID').AsString := dbeUsuOrigTras.Text;
      If Not DMAF.cdsResponsab.GotoKey Then
      Begin
         ShowMessage('USUARIO QUE ENTREGA NO EXISTE EN LA RELACION, REINTENTE!');
         dbeUsuOrigTras.SetFocus;
         exit;
      End;
      edtUsuOrigTras.Text := DMAF.cdsResponsab.FieldByName('RECIBENOM').AsString;

   End
   Else
   Begin
      edtUsuOrigTras.enabled := True;
      edtUsuOrigTras.Text := '';
      edtUsuOrigTras.SetFocus;
   End;
End;

Procedure TFTomaInvAF.edtUsuAutoTrasExit(Sender: TObject);
Begin
   If bbtnComienzadenuevo.Focused Then exit;
   If (length(dbeUsuAutoTras.Text) > 0) And (length(edtUsuAutoTras.Text) > 0) Then
   Begin
      dbeUsuAutoTras.setfocus;
   End;
End;

Procedure TFTomaInvAF.dbgActivosxTrasKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Var
   xSQL, xCodBarras: String;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      // SOLO ELIMNA CUANDO NO ES ACEPTADO(A) O ANULADO(X)
      If (DMAF.cdsCabTraslado.FieldByName('ACEPTADO').AsString <> 'S') And
         (DMAF.cdsCabTraslado.FieldByName('ACEPTADO').AsString <> 'X') Then
      Begin
         If MessageDlg('¿Eliminar Registro?', mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            xCodBarras := DMAF.cdsInvTras.FieldByName('ARTCODBAR').AsString;
            DMAF.cdsInvTras.Delete;
            xSQL := 'delete from ACF321 '
               + '    where NUMDOC=' + quotedstr(dbeNumDocSal.Text)
               + '      and ARTCODBAR=' + quotedstr(xCodBarras);
            Try
               DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se ha podido Borrar el Registro');
               exit;
            End;
         End;
      End;
   End;
End;

Procedure TFTomaInvAF.bbtnElimTrasClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'delete from ACF320 where NUMDOC=' + quotedstr(dbeNumDocSal.Text);
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Cabecera de Traslados No se ha podido Actualizar');
      exit;
   End;

   xSQL := 'delete from ACF321 where NUMDOC=' + quotedstr(dbeNumDocSal.Text);
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Detalle de Traslados No se ha podido Actualizar');
      exit;
   End;
   ShowMessage('Eliminación Efectuada');
   dblcDocRefSal.Clear;
   dbeNumDocSal.Clear;
   dbdtpFecTras.Clear;
   dblcMotivoSal.Clear;
   dblcResponsabTras.Clear;
   edtResponsabTras.Clear;
   dbeObservac.Clear;
   dblcDestLocal.Clear;
   edtDestLocal.Clear;
   dblcDestPiso.Clear;
   edtDestPiso.Clear;
   dblcDestArea.Clear;
// ccosto
   dblcdCCosto.Clear;
   edtDestArea.Clear;
   dblcDestAmbiente.Clear;
   edtDestAmbiente.Clear;
   dbeUsuBienTras.Clear;
   edtUsuBienTras.Clear;
   dbeUsuAutoTras.Clear;
   edtUsuAutoTras.Clear;
   DMAF.cdsInvTras.Close;
   bbtnTrasladoAnt.SetFocus;
End;

Procedure TFTomaInvAF.bbtnImpActRevClick(Sender: TObject);
Var
   xSQL: String;
Begin
End;

Procedure TFTomaInvAF.bbtnComienzadenuevoClick(Sender: TObject);
Begin

   AnulaTraslado;
   dblcDocRefSal.Clear;
   dbeNumDocSal.Clear;
   dbdtpFecTras.Clear;
   dblcMotivoSal.Clear;
   dblcResponsabTras.Clear;
   edtResponsabTras.Clear;
   dbeObservac.Clear;
   dblcDestLocal.Clear;
   edtDestLocal.Clear;
   dblcDestPiso.Clear;
   edtDestPiso.Clear;
   dblcDestArea.Clear;
// ccosto
   dblcdCCosto.Clear;
   edtDestArea.Clear;
   dblcDestAmbiente.Clear;
   edtDestAmbiente.Clear;
   dbeUsuBienTras.Clear;
   edtUsuBienTras.Clear;
   dbeUsuAutoTras.Clear;
   edtUsuAutoTras.Clear;
   dbeUsuOrigTras.Clear;
   edtUsuOrigTras.Clear;
   dbgActivosxTras.DataSource := Nil;
   bbtnGrabaSal.Enabled := False;
   bbtnRepTraslado.Enabled := False;
   btnInsertaTraslado.Enabled := False;
   bbtnIniciaTrasladoClick(self);
End;

Procedure TFTomaInvAF.dbdtpFecTrasExit(Sender: TObject);
Begin
   If bbtnComienzadenuevo.Focused Then exit;
End;

Procedure TFTomaInvAF.dblcMotivoSalExit(Sender: TObject);
Begin
   If bbtnComienzadenuevo.Focused Then exit;
End;

Procedure TFTomaInvAF.dbeObservacExit(Sender: TObject);
Begin
   If bbtnComienzadenuevo.Focused Then exit;
End;

Procedure TFTomaInvAF.bbtnBuscaxSerieClick(Sender: TObject);
Begin
   xBuscaUsuBienTras := True;
   xBuscaUsuAutoTras := False;
   xBuscaUsuOrigTras := False;
   PageControl1.Enabled := False;
   pnlBusqueda.BringToFront;
   pnlBusqueda.Left := 210;
   pnlBusqueda.Top := 129;
   pnlBusqueda.Visible := True;
   dbeBusca.Clear;
   dbeBusca.SetFocus;
End;

Procedure TFTomaInvAF.bbtnOkBuscaxDatoClick(Sender: TObject);
Begin
   If bbtnCancBuscaxDato.Focused Then exit;
   If PageControl1.ActivePageIndex = 0 Then
   Begin
   End;

End;

Procedure TFTomaInvAF.bbtnCancBuscaxDatoClick(Sender: TObject);
Begin
   If PageControl1.ActivePageIndex = 0 Then
   Begin
      pnlBusqueda.Visible := False;
      PageControl1.Enabled := True;

   // flag q indica búsqueda de Usuario del Bien
      If xBuscaUsuBienTras Then
      Begin
         dbeUsuBienTras.SetFocus;
      End;

   // flag q indica búsqueda de Usuario Autorizado en Destino
      If xBuscaUsuAutoTras Then
      Begin
         dbeUsuAutoTras.SetFocus;
      End;

   // flag q indica búsqueda de Usuario Autorizado en Origen
      If xBuscaUsuOrigTras Then
      Begin
         dbeUsuOrigTras.SetFocus;
      End;
   End;
End;

Procedure TFTomaInvAF.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   AnulaTraslado;

   DMAF.cdsBusca.close;
   DMAF.cdsQry9.close;
   DMAF.cdsInventario.Close;
   DMAF.cdsCabTraslado.Close;
   DMAF.cdsQry.Close;

End;

Procedure TFTomaInvAF.MuestraGrid;
Begin
   dbgActivosxTras.Selected.Clear;

   dbgActivosxTras.Selected.Add('CODIGOBARRA'#9'10'#9'C.Barras');

   dbgActivosxTras.Selected.Add('LOCID'#9'06'#9'Local');
   dbgActivosxTras.Selected.Add('PISO'#9'06'#9'Piso');
   dbgActivosxTras.Selected.Add('AREA'#9'06'#9'Área');
   dbgActivosxTras.Selected.Add('AMBCOD'#9'10'#9'Ambiente');
   dbgActivosxTras.Selected.Add('RECIBEID'#9'10'#9'Usuario');
   dbgActivosxTras.Selected.Add('RECIBENOM'#9'30'#9'Nombre');
   dbgActivosxTras.Selected.Add('ACFDES'#9'30'#9'Denominación');
   dbgActivosxTras.Selected.Add('ESTADOID'#9'06'#9'ESTADOID');
   dbgActivosxTras.Selected.Add('ACFDESL'#9'30'#9'Descripción');
   dbgActivosxTras.Selected.Add('MATERIALID'#9'8'#9'Material');
   dbgActivosxTras.Selected.Add('ACFMARCA'#9'15'#9'Marca');
   dbgActivosxTras.Selected.Add('ACFMODELO'#9'15'#9'Modelo');
   dbgActivosxTras.Selected.Add('ACFSERIE'#9'15'#9'Serie');
   dbgActivosxTras.Selected.Add('ACFMEDIDA'#9'20'#9'Dimensiones');
   dbgActivosxTras.Selected.Add('TIPMOT'#9'15'#9'Tipo Motivo');
   dbgActivosxTras.Selected.Add('MOTIVO'#9'15'#9'Motivo');
   dbgActivosxTras.Selected.Add('FECING'#9'12'#9'Fecha');
   dbgActivosxTras.Selected.Add('DOCREF'#9'15'#9'Doc.Traslado');
   dbgActivosxTras.Selected.Add('NUMDOC'#9'15'#9'Nro.Doc');
   dbgActivosxTras.Selected.Add('USUARIO'#9'15'#9'Usuario SSGG');

   dbgActivosxTras.Selected.Add('ARTCODBAR'#9'10'#9'Cod Activo');

   dbgActivosxTras.RefreshDisplay;
End;

Procedure TFTomaInvAF.AnulaTraslado;
Var
   xSQL: String;
Begin
//---------------------------------------------------
// determina si existen registros en el Detalle (ACF321),
// de no ser así marca como ANULADO la Cabecera (ACF320),
// siempre y cuando se haya grabado un registro, esto
// se controla con DMAF.cdsCabTraslado.RecordCount=1
//---------------------------------------------------
   If (DMAF.cdsInvTras.Active = True) And (DMAF.cdsCabTraslado.Active = True) Then
   Begin
      If (DMAF.cdsInvTras.RecordCount = 0) And (DMAF.cdsCabTraslado.RecordCount = 1) And (DMAF.cdsCabTraslado.FieldByName('ACEPTADO').asstring <> 'X') Then
      Begin
         If MessageDlg('¡No exite DETALLE, la operación se ANULARA!. esta seguro..?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            xSQL := 'update ACF320 set ACEPTADO=''X'' where NUMDOC=' + quotedstr(dbeNumDocSal.Text);
            Try
               DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se ha podido Anular el Registro de la Cabecera');
               exit;
            End;
         End;
      End;
   End;
End;

Procedure TFTomaInvAF.bbtnAdicDetalleTrasClick(Sender: TObject);
Var
   xSQL, wxCiaId, xFecha, xFechaStr: String;
   wAno, wMes, wDia: word;
   xUbicacionOrigen: String;
Begin
   If Not Consistencia() Then
   Begin
      Exit;
   End;

   xxLocalTras := dblcOrigLocal.Text;
   xxPisoTras := dblcOrigPiso.Text;
   xxAreaTras := dblcOrigArea.Text;
   decodedate(dbdtpFecTras.Date, wAno, wMes, wDia);

   xFecha := strzero(trim(inttostr(wDia)), 2) + '/'
      + strzero(trim(inttostr(wMes)), 2) + '/'
      + copy(inttostr(wAno), 1, 4);
   xFechaStr := strzero(trim(inttostr(wDia)), 2) + '/'
      + strzero(trim(inttostr(wMes)), 2) + '/'
      + copy(inttostr(wAno), 1, 4);

// obtiene CIAID desde el ACF123 - ambientes
   wxCiaId := DMAF.FindCiaId(dblcDestLocal.Text, dblcDestPiso.Text, dblcDestArea.Text, dblcDestAmbiente.Text);
   If (wxCiaId = 'EE') Or (wxCiaId = '') Then
   Begin
      ShowMessage('La Cia. no está asignada correctamente');
      Exit;
   End;

//---------------------------------------------------
// busca el nuevo numero de Orden de Traslado,
// y adiciona a la cabecera ACF320
//---------------------------------------------------
   DMAF.wModo := 'A';
   If (wVezGrabaSal = 0) And (DMAF.wModo = 'A') Then
   Begin

      If RadioButton_unico.Checked = true Then
      Begin
         xUbicacionOrigen := 'UNICO';
      End
      Else
      Begin
         xUbicacionOrigen := 'MULTIPLE';
      End;

      dbeNumDocSal.Text := UltimaOrden;
// Inicio HPC_201801_ACF
// Se cambia el SQL a Store Procedure
(*
      xSQL := 'insert into ACF320(DOCREF,NUMDOC,FECTRAS,MOTIVO,USUARIO,'
         + '                      LOCAL_D,LOCDES_D,PISO_D,AREA_D,AREADES_D,AMB_D,AMBDES_D,'
         + '                      USUBIEN_D,NOMUSU_D,USUAUT_D,NOMAUT_D,USUAUT_O,NOMAUT_O,FREG,HREG,OBSERVAC, UBIORI) '
         + '   values('
         +             quotedstr(dblcDocRefSal.Text) + ',' // 'ORDEN TRASLADO'
         +             quotedstr(dbeNumDocSal.Text) + ',' // Nro. ORDEN TRASLADO
         +             quotedstr(xFecha) + ',' // Fecha de Traslado
         +             quotedstr(dblcMotivoSal.Text) + ',' // Motivo de Traslado
         +             quotedstr(dblcResponsabTras.Text) + ', ' // Responsable Servicios Generales
         +             quotedstr(dblcDestLocal.Text) + ',' // Local de Destino
         +             quotedstr(edtDestLocal.Text) + ',' // Nombre Local
         +             quotedstr(dblcDestPiso.Text) + ',' // Piso de Destino
         +             quotedstr(dblcDestArea.Text) + ',' // Area de Destino
         +             quotedstr(edtDestArea.Text) + ',' // Nombre del Área
         +             quotedstr(dblcDestAmbiente.Text) + ',' // Ambiente de Destino
         +             quotedstr(edtDestAmbiente.Text) + ',' // Nombre del Ambiente
         +             quotedstr(dbeUsuBienTras.Text) + ',' // Usuario Final del Activo
         +             quotedstr(edtUsuBienTras.Text) + ', ' // Nombre de Usuario Final
         +             quotedstr(dbeUsuAutoTras.Text) + ',' // Usuario Autorizado que recibe activo
         +             quotedstr(edtUsuAutoTras.Text) + ', ' // Nombre de Usuario Autorizado q recibe
         +             quotedstr(dbeUsuOrigTras.Text) + ',' // Usuario Autorizado que envía activo
         +             quotedstr(edtUsuOrigTras.Text) + ', ' // Nombre de Usuario Autorizado q envía
         +             'TO_DATE(SYSDATE), SYSDATE, '
         +             quotedstr(dbeObservac.Text) + ', '
         +             QuotedStr(xUbicacionOrigen) + ')';
*)
      xSQL := 'CALL SP_ACF_ING_TRASLADO_CAB('
            +             quotedstr(dblcDocRefSal.Text) + ','   // 'ORDEN TRASLADO'
            +             quotedstr(dbeNumDocSal.Text) + ','    // Nro. ORDEN TRASLADO
            +             quotedstr(xFecha) + ','               // Fecha de Traslado
            +             quotedstr(dblcMotivoSal.Text) + ','   // Motivo de Traslado
            +             quotedstr(dblcResponsabTras.Text) + ', ' // Responsable Servicios Generales
            +             quotedstr(dblcDestLocal.Text) + ','   // Local de Destino
            +             quotedstr(edtDestLocal.Text) + ','    // Nombre Local
            +             quotedstr(dblcDestPiso.Text) + ','    // Piso de Destino
            +             quotedstr(dblcDestArea.Text) + ','    // Area de Destino
            +             quotedstr(edtDestArea.Text) + ','     // Nombre del Área
            +             quotedstr(dblcDestAmbiente.Text) + ','// Ambiente de Destino
            +             quotedstr(edtDestAmbiente.Text) + ',' // Nombre del Ambiente
            +             quotedstr(dbeUsuBienTras.Text) + ','  // Usuario Final del Activo
            +             quotedstr(edtUsuBienTras.Text) + ', ' // Nombre de Usuario Final
            +             quotedstr(dbeUsuAutoTras.Text) + ','  // Usuario Autorizado que recibe activo
            +             quotedstr(edtUsuAutoTras.Text) + ', ' // Nombre de Usuario Autorizado q recibe
            +             quotedstr(dbeUsuOrigTras.Text) + ','  // Usuario Autorizado que envía activo
            +             quotedstr(edtUsuOrigTras.Text) + ', ' // Nombre de Usuario Autorizado q envía
            +             quotedstr(dbeObservac.Text) + ', '
            +             QuotedStr(xUbicacionOrigen) + ') ';
// Fin HPC_201801_ACF
      Try
         DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar Cabecera de Traslado');
         exit;
      End;
   End;
//---------------------------------------------------

//---------------------------------------------------
// Pasa al archivo de Detalle de Ordenes de Traslados - ACF321
//---------------------------------------------------
// Inicio HPC_201801_ACF 
// Se cambia el SQL a Store Procedure
(*
   xSQL := 'insert into ACF321(CIAID,LOCID,PISO,AREA,AMBCOD,RECIBEID,RECIBENOM,ARTCODBAR,ACFDES,ESTADOID, '
      + '                      ACFDESL,MATERIALID,ACFMARCA,ACFMODELO,ACFSERIE,ACFMEDIDA,TIPMOT,MOTIVO,ODCID, '
      + '                      FECTRAS,DOCREF,NUMDOC,MONEDA,ACFVALOMO, ACFVALOMN, ACFVALOME, USUARIO, FREG, HREG, '
      + '                      TRANCIAID, TRANLOCID, TRANPISO, TRANAREA, TRANAMBCOD, '
      + '                      USUAUT_O, NOMAUT_O, USUBIEN_D, NOMUSU_D, USUAUT_D, NOMAUT_D) '
      + '   select CIAID,LOCID,PISO,AREA,AMBCOD,RECIBEID,RECIBENOM,ARTCODBAR,ACFDES,ESTADOID, '
      + '          ACFDESL,MATERIALID,ACFMARCA,ACFMODELO,ACFSERIE,ACFMEDIDA,'
      + '          ''TRASLADO'' TIPMOT, '
      +            quotedstr(dblcMotivoSal.Text) + ', ODCID, '
      +            quotedstr(xFecha) + ','
      +            quotedstr(dblcDocRefSal.Text) + ','
      +            quotedstr(dbeNumDocSal.Text) + ','
      +    '       TMONID,ACFVALOMO, ACFVALOMN, ACFVALOME,'
      +            quotedstr(dblcResponsabTras.Text) + ',TO_DATE(SYSDATE), SYSDATE, '
      +            quotedstr(wxCiaId) + ','
      +            quotedstr(dblcDestLocal.Text) + ',' + quotedstr(dblcDestPiso.Text) + ','
      +            quotedstr(dblcDestArea.Text) + ',' + quotedstr(dblcDestAmbiente.Text) + ', '
      +            quotedstr(dbeUsuOrigTras.Text) + ',' + quotedstr(edtUsuOrigTras.Text) + ', '
      +            quotedstr(dbeUsuBienTras.Text) + ',' + quotedstr(edtUsuBienTras.Text) + ', '
      +            quotedstr(dbeUsuAutoTras.Text) + ',' + quotedstr(edtUsuAutoTras.Text)
      +    ' from ACF201 '
      +    ' where ARTCODBAR=' + quotedstr(dbeReuCodBarras.Text);
*)
      xSQL := 'CALL SP_ACF_ING_TRASLADO_DET('
            +             quotedstr(dblcMotivoSal.Text) + ', '
            +             quotedstr(xFecha) + ','
            +             quotedstr(dblcDocRefSal.Text) + ','
            +             quotedstr(dbeNumDocSal.Text) + ','
            +             quotedstr(dblcResponsabTras.Text) + ','
            +             quotedstr(wxCiaId) + ','
            +             quotedstr(dblcDestLocal.Text) + ',' + quotedstr(dblcDestPiso.Text) + ','
            +             quotedstr(dblcDestArea.Text) + ',' + quotedstr(dblcDestAmbiente.Text) + ', '
            +             quotedstr(dbeUsuOrigTras.Text) + ',' + quotedstr(edtUsuOrigTras.Text) + ', '
            +             quotedstr(dbeUsuBienTras.Text) + ',' + quotedstr(edtUsuBienTras.Text) + ', '
            +             quotedstr(dbeUsuAutoTras.Text) + ',' + quotedstr(edtUsuAutoTras.Text) + ', '
            +             QuotedStr(dbeReuCodBarras.Text) + ') ';

// Fin HPC_201801_ACF
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Activo No se ha podido Actualizar, porque no grabó Arch. de Transferencias');
      exit;
   End;

   //---------------------------------------------------
   // se realiza en este momento, para permitir que la grabacion
   // de la cabecera y el detalle sean lo mas pronto posible
   //---------------------------------------------------
   If (wVezGrabaSal = 0) Then
   Begin
      xSQL := 'Select * from ACF320 '
         + '    where NUMDOC=' + quotedstr(dbeNumDocSal.Text);
      DMAF.cdsCabTraslado.Close;
      DMAF.cdsCabTraslado.IndexFieldNames := '';
      DMAF.cdsCabTraslado.Filter := '';
      DMAF.cdsCabTraslado.Filtered := False;
      DMAF.cdsCabTraslado.DataRequest(xSQL);
      DMAF.cdsCabTraslado.Open;
   End;
//---------------------------------------------------

//---------------------------------------------------
// Graba para visualizar en el Grid del Detalle
//---------------------------------------------------

   RecuperaDetalle(dbeNumDocSal.Text);
//---------------------------------------------------
   dblcOrigLocal.Clear;
   edtOrigLocal.Clear;
   dblcOrigPiso.Clear;
   edtOrigPiso.Clear;
   dblcOrigArea.Clear;
   edtOrigArea.Clear;
   dblcOrigAmbiente.Clear;
   edtOrigAmbiente.Clear;
   dbeOrigUsuario.Clear;
   edtOrigUsuario.Clear;
   dbeOrigEstado.Clear;
   edtOrigDenominaci.Clear;
   edtOrigAcfDesl.Clear;
   dbeOrigMaterial.Clear;
   dbeOrigMarca.Clear;
   dbeOrigModelo.Clear;
   dbeOrigSerie.Clear;
   dbeOrigDimensio.Clear;
   dbeReuCodBarras.Clear;
   wVezGrabaSal := wVezGrabaSal + 1;
   dbeCodigoBarra.Clear;
   dbeCodigoBarra.SetFocus;
End;

Procedure TFTomaInvAF.RadioButton_unicoClick(Sender: TObject);
Begin
   If RadioButton_unico.Checked = true Then
   Begin
      xSQL := ' Select A.* '
         + '      from ACF321 A, ACF321 B '
         + '     where A.DOCREF = B.DOCREF '
         + '       and A.NUMDOC = B.NUMDOC '
         + '       and( A.LOCID <> B.LOCID '
         + '          or A.PISO <> B.PISO '
         + '          or A.AREA <> B.AREA ) '
         + '       and A.DOCREF = ' + QuotedStr(dblcDocRefSal.Text)
         + '       and A.NUMDOC = ' + QuotedStr(dbeNumDocSal.Text);
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Open;
      If DMAF.cdsQry.RecordCount > 0 Then
      Begin
         ShowMessage('El traslado tiene Activos de distintas Ubicaciones, ' + #13 + 'no se puede marcar como Origen UNICO');
         RadioButton_multiple.Checked := True;
         Exit;
      End;
   End;
End;
// Inicio HPC_201801_ACF
// Se ha implementado para que no realice traslados de codigo de barras inactivas
Procedure TFTomaInvAF.dbeCodigoBarraExit(Sender: TObject);
Var
   xArtCodBar: String;
   xCodArt: String;
   xActInac: String;
Begin
   dbeCodigoBarra.Text := copy('000000' + trim(dbeCodigoBarra.Text),
      length(trim('000000' + dbeCodigoBarra.Text)) - 6 + 1, 6);
   If strtoint(dbeCodigoBarra.Text) = 0 Then exit;
   xArtCodBar := '';
   xActInac := '';
   xArtCodBar := DMAF.DisplayDescrip('dspTGE', 'ACF201', '*', 'CODIGOBARRA = ' + QuotedStr(dbeCodigoBarra.Text), 'ARTCODBAR');
   xActInac := DMAF.DisplayDescrip('dspTGE', 'ACF201', '*', 'CODIGOBARRA = ' + QuotedStr(dbeCodigoBarra.Text), 'ACFFLAGACT');
   If xArtCodBar = '' Then
   Begin
      ShowMessage('Código de Barras no válido');
      dbeCodigoBarra.SetFocus;
      Exit;
   End
   Else If (length(xArtCodBar) > 0) and (xActInac ='I') Then
   Begin
      ShowMessage('Código de Barra Inactivo');
      dbeCodigoBarra.SetFocus;
      Exit;
   End
   Else
   Begin
      dbeReuCodBarras.Text := xArtCodBar;

      xSQL := 'Select ARTID from LOG332 where CODBAR=''' + xArtCodBar + ''' AND ESTADOID=''N'' ';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(XSQL);
      DMAF.cdsQry.Open;
      //Solo valida de en el LOG332 es igual a 1 si es mayor salta la validacion
      If DMAF.cdsQry.RecordCount = 1 Then
      Begin
         ShowMessage('El Artículo no está liberado para poder ser Trasladado. Sólo se ha registrado el Ingreso a Almacén ');
         Exit;
      End;
   End;
   dbeReuCodBarrasExit(Self);
End;
// Fin HPC_201801_ACF

Procedure TFTomaInvAF.RecuperaDetalle(p_NumTraslado: String);
Var
   xSQL: String;
Begin
   xSQL := ' Select ACF201.CODIGOBARRA CODIGOBARRA , ACF321.* '
      + '      from ACF321, ACF201 '
      + '     where NUMDOC=' + quotedstr(p_NumTraslado)
      + '       and ACF321.ARTCODBAR = ACF201.ARTCODBAR ';
   DMAF.cdsInvTras.Close;
   DMAF.cdsInvTras.IndexFieldNames := '';
   DMAF.cdsInvTras.Filter := '';
   DMAF.cdsInvTras.Filtered := False;
   DMAF.cdsInvTras.DataRequest(xSQL);
   DMAF.cdsInvTras.Open;
End;

//Consistencia informacion necesaria para la grabacion
Function TFTomaInvAF.Consistencia: Boolean;
Begin

   If length(trim(edtDestLocal.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Local');
      Result := False;
      exit;
   End;

   If length(trim(edtDestPiso.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Piso');
      Result := False;
      exit;
   End;

   If length(trim(edtDestArea.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Área');
      Result := False;
      exit;
   End;

   If length(trim(edtDestAmbiente.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Ambiente');
      Result := False;
      exit;
   End;

   If length(trim(edtUsuBienTras.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Usuario del Bien');
      Result := False;
      exit;
   End;

   If length(trim(dblcMotivoSal.Text)) = 0 Then
   Begin
      ShowMessage('Debe Indicar el Motivo de Traslado');
      Result := False;
      exit;
   End;

   If length(trim(dblcDocRefSal.Text)) = 0 Then
   Begin
      ShowMessage('Debe Indicar el Documento de Referencia para el Traslado');
      Result := False;
      exit;
   End;

   If length(trim(dbeNumDocSal.Text)) = 0 Then
   Begin
      ShowMessage('Debe Indicar el Número de Documento de Referencia para el Traslado');
      Result := False;
      exit;
   End;

   If length(trim(dblcResponsabTras.Text)) = 0 Then
   Begin
      ShowMessage('Debe Indicar el Responsable del Traslado');
      Result := False;
      exit;
   End;

   If length(trim(edtCCosto.Text)) = 0 Then
   Begin
      ShowMessage('Debe Indicar el Centro de Costo');
      Result := False;
      exit;
   End;

End;

Procedure TFTomaInvAF.InactivaCampos(InacAct: boolean);
Begin
// Fecha de Traslado
   lblFechaTras.Enabled := InacAct;
   dbdtpFecTras.Enabled := InacAct;
// Motivo del Traslado
   lblMotivoSal.Enabled := InacAct;
   dblcMotivoSal.Enabled := InacAct;
// Responsable de Servicios Generales
//   lblUserDest.Enabled          := False;
//   dblcResponsabTras.Enabled    := False;
//   edtResponsabTras.Enabled     := False;
// observaciones
   lblObservac.Enabled := InacAct;
   dbeObservac.Enabled := InacAct;
// Título Destinatario
   lblDestinatario.Enabled := InacAct;
// local destino
   lblDestLocal.Enabled := InacAct;
   dblcDestLocal.Enabled := InacAct;
// piso destino
   lblDestPiso.Enabled := InacAct;
   dblcDestPiso.Enabled := InacAct;
// area destino
   lblDestArea.Enabled := InacAct;
   dblcDestArea.Enabled := InacAct;
// ccosto
   dblcdCCosto.Enabled := InacAct;
// ambiente
   lblDestAmbiente.Enabled := InacAct;
   dblcDestAmbiente.Enabled := InacAct;
// usuario final
   lblDestUsuario.Enabled := InacAct;
   dbeUsuBienTras.Enabled := InacAct;
   edtUsuBienTras.Enabled := InacAct;
   bbtnBuscaUsuBienTras.Enabled := InacAct;
// usuario autorizado q recibe
   lblUsuAutorDest.Enabled := InacAct;
   dbeUsuAutoTras.Enabled := InacAct;
   edtUsuAutoTras.Enabled := InacAct;
   bbtnBuscaUsuAutoTras.Enabled := InacAct;
// título origen
   lblOrigen.Enabled := InacAct;
// boton inicia traslado
   btnInsertaTraslado.Enabled := InacAct;
// usuario autorizado q envía
   lblUsuAutorOrig.Enabled := False;
   dbeUsuOrigTras.Enabled := False;
   edtUsuOrigTras.Enabled := False;
   bbtnBuscaUsuOrigTras.Enabled := False;
   If InacAct Then
   Begin
      bbtnComienzadeNuevo.Enabled := False;
    //Grid de detalle de origen
      dbgActivosxTras.Enabled := False;
   End
   Else
   Begin
      bbtnComienzadeNuevo.Enabled := True;
      dbgActivosxTras.Enabled := True;
   End;
End;

Procedure TFTomaInvAF.BtnCabeceraClick(Sender: TObject);
Begin
   InactivaCampos(True);
   dblcMotivoSal.SetFocus;
End;

Procedure TFTomaInvAF.BtndetalleClick(Sender: TObject);
Var
   xSql, wxCiaId: String;
Begin

   wxCiaId := DMAF.FindCiaId(dblcDestLocal.Text, dblcDestPiso.Text, dblcDestArea.Text, dblcDestAmbiente.Text);
   If Not Consistencia() Then
   Begin
      Exit;
   End;
   DMAF.cdsInvtras.DisableControls;
  //Si existe detalle actualiza
   xSql := ' Update ACF321 '
      + '       set MOTIVO=' + quotedstr(dblcMotivoSal.Text) + ','
      + '           DOCREF=' + quotedstr(dblcDocRefSal.Text) + ','
      + '           NUMDOC=' + quotedstr(dbeNumDocSal.Text) + ','
      + '           USUARIO=' + quotedstr(dblcResponsabTras.Text) + ','
      + '           FECTRAS=' + quotedstr(DateToStr(dbdtpFecTras.Date)) + ','
      + '           TRANAREA=' + quotedstr(dblcDestArea.Text) + ','
      + '           TRANAMBCOD=' + quotedstr(dblcDestAmbiente.Text) + ','
      + '           TRANLOCID=' + quotedstr(dblcDestLocal.Text) + ','
      + '           TRANPISO=' + quotedstr(dblcDestPiso.Text) + ','
      + '           TRANCIAID=' + quotedstr(wxCiaId) + ','
      + '           USUAUT_O=' + quotedstr(dbeUsuOrigTras.Text) + ','
      + '           NOMAUT_O=' + quotedstr(edtUsuOrigTras.Text) + ','
      + '           NOMUSU_D=' + quotedstr(edtUsuBienTras.Text) + ','
      + '           USUAUT_D=' + quotedstr(dbeUsuAutoTras.Text) + ','
      + '           NOMAUT_D=' + quotedstr(edtUsuAutoTras.Text) + ','
      + '           USUBIEN_D=' + quotedstr(dbeUsuBienTras.Text)
      + '     Where NUMDOC=' + quotedstr(dbeNumDocSal.Text);
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
  //Actualiza el Grid
   RecuperaDetalle(dbeNumDocSal.Text);
   DMAF.cdsInvtras.EnableControls;
   EdtUsuOrigTrasExit(Sender);
End;

Procedure TFTomaInvAF.dblcdCCostoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CCOSID=''' + dblcdCCosto.Text + ''' and CCOSMOV=''S'' AND CCOSACT=''S'' ';
   edtCCosto.Text := DMAF.DisplayDescrip('dspTGE', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES');
   wCCOSID := Trim(dblcdCCosto.Text);
   If length(edtCCosto.Text) = 0 Then
   Begin
      edtCCosto.Text := '';
      ShowMessage('Centro de Costo NO esta Activo');
      dblcdCCosto.setfocus;
      Exit;
   End;
End;

End.

