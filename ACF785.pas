Unit ACF785;
//*********************************************************
// CREADO POR       : Abelardo Sulca Palomino
// Nº HPP           : HPP_201103_ACF
// FECHA CREACION   : 15/03/2011
// DESCRIPCION      : Ventana que permite ingresar los criterios de
//                    consulta para el reporte de traslados
//*********************************************************
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201107_ACF
// FECHA DE MODIF.  : 13/05/2011
// DESCRIPCION      : Se adiciona el campo ACF201.CODIGOBARRA en las consultas
//                    para que se muestre el código de barra cambiado por el usuario
//********************************************************

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, wwdbdatetimepicker, wwdblook, Buttons, ppDB, ppDBPipe,
   ppBands, ppCache, ppClass, ppComm, ppRelatv, ppProd, ppReport, ppEndUsr,
   ppCtrls, ppPrnabl, ppParameter, ppVar;

Type
   TFRptTraslados = Class(TForm)
      lblUserDest: TLabel;
      dblcResponsabTras: TwwDBLookupCombo;
      edtResponsabTras: TEdit;
      lblFechaTras: TLabel;
      dblcMotivoSal: TwwDBLookupCombo;
      lblMotivoSal: TLabel;
      wwDBDateTimePicker_Hasta: TwwDBDateTimePicker;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
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
      Z2bbtnImprime: TBitBtn;
      ppReport_Traslados: TppReport;
      ppDBPipeline_Traslados: TppDBPipeline;
      ppDesigner_Traslados: TppDesigner;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppShape1: TppShape;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppLine10: TppLine;
      ppLabel11: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText3: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppLabel12: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel13: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel14: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppSystemVariable4: TppSystemVariable;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      wwDBDateTimePicker_Desde: TwwDBDateTimePicker;
      Label4: TLabel;
      RadioButton_PorArea: TRadioButton;
      RadioButton_PorLocalidad: TRadioButton;
      Procedure FormShow(Sender: TObject);
      Procedure dblcResponsabTrasExit(Sender: TObject);
      Procedure dblcDestLocalExit(Sender: TObject);
      Procedure dblcDestPisoExit(Sender: TObject);
      Procedure dblcDestAmbienteExit(Sender: TObject);
      Procedure dblcDestAreaExit(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
    //INICIO HPP_201107_ACF
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    //FIN HPP_201107_ACF
   Private
    { Private declarations }
      Procedure Asignalookup;
   Public
    { Public declarations }
   End;

Var
   FRptTraslados: TFRptTraslados;
   xSQL: String;

Implementation

Uses ACFDM;

{$R *.dfm}

Procedure TFRptTraslados.Asignalookup;
Begin
   //Responsable
   xSQL := 'select * from ACF115';
   DMAF.cdsUsuario.Close;
   DMAF.cdsUsuario.DataRequest(xSQL);
   DMAF.cdsUsuario.Open;
   dblcResponsabTras.LookupField := 'USUARIO';
   dblcResponsabTras.LookupTable := DMAF.cdsUsuario;
   dblcResponsabTras.Selected.Clear;
   dblcResponsabTras.Selected.Add('USUARIO'#9'15'#9'Usuario');
   dblcResponsabTras.Selected.Add('NOMBRE'#9'25'#9'Nombre Usuario');
   //Motivo traslado
   xSQL := 'select * from ACF108';
   DMAF.cdsMotivos.Close;
   DMAF.cdsMotivos.DataRequest(xSQL);
   DMAF.cdsMotivos.Open;
   dblcMotivoSal.LookupField := 'MOTDES';
   dblcMotivoSal.LookupTable := DMAF.cdsMotivos;
   dblcMotivoSal.Selected.Clear;
   dblcMotivoSal.Selected.Add('MOTDES'#9'15'#9'Motivo');
   //Localidad
   xSQL := 'select * from ACF120';
   DMAF.cdsLocal.Close;
   DMAF.cdsLocal.DataRequest(xSQL);
   DMAF.cdsLocal.Open;
   dblcDestLocal.LookupField := 'LOCID';
   dblcDestLocal.LookupTable := DMAF.cdsLocal;
   dblcDestLocal.Selected.Clear;
   dblcDestLocal.Selected.Add('LOCID'#9'2'#9'Id'#9'F');
   dblcDestLocal.Selected.Add('LOCDES'#9'30'#9'Local'#9'F');
   //Piso
   xSQL := 'select * from ACF121';
   DMAF.cdsPiso.Close;
   DMAF.cdsPiso.DataRequest(xSQL);
   DMAF.cdsPiso.Open;
   dblcDestPiso.LookupField := 'PISO';
   dblcDestPiso.LookupTable := DMAF.cdsPiso;
   dblcDestPiso.Selected.Clear;
   dblcDestPiso.Selected.Add('PISO'#9'2'#9'Id'#9'F');
   dblcDestPiso.Selected.Add('PISODES'#9'36'#9'Piso'#9'F');
   //Area
   xSQL := 'select * from ACF122';
   DMAF.cdsArea.Close;
   DMAF.cdsArea.DataRequest(xSQL);
   DMAF.cdsArea.Open;
   dblcDestArea.LookupField := 'AREA';
   dblcDestArea.LookupTable := DMAF.cdsArea;
   dblcDestArea.Selected.Clear;
   dblcDestArea.Selected.Add('AREA'#9'2'#9'Id'#9'F');
   dblcDestArea.Selected.Add('AREADES'#9'50'#9'Área'#9'F');
   //Ambiente
   xSQL := 'select * from ACF123';
   DMAF.cdsAmbiente.Close;
   DMAF.cdsAmbiente.DataRequest(xSQL);
   DMAF.cdsAmbiente.Open;
   dblcDestAmbiente.LookupField := 'AMBCOD';
   dblcDestAmbiente.LookupTable := DMAF.cdsAmbiente;
   dblcDestAmbiente.Selected.Clear;
   dblcDestAmbiente.Selected.Add('AMBCOD'#9'3'#9'Id'#9'F');
   dblcDestAmbiente.Selected.Add('AMBDES'#9'50'#9'Ambiente'#9'F');

End;

Procedure TFRptTraslados.FormShow(Sender: TObject);
Begin
   Asignalookup;
   wwDBDateTimePicker_Desde.Date := Now;
   wwDBDateTimePicker_Hasta.Date := Now;
End;

Procedure TFRptTraslados.dblcResponsabTrasExit(Sender: TObject);
Begin
   If dblcResponsabTras.Text = '' Then
   Begin
      edtResponsabTras.text := '';
      exit;
   End;
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

End;

Procedure TFRptTraslados.dblcDestLocalExit(Sender: TObject);
Begin
   If dblcDestLocal.Text = '' Then
   Begin
      edtDestLocal.text := '';
      exit;
   End;
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
   DMAF.cdsPiso.Filter := 'LOCID=' + quotedstr(DMAF.cdsLocal.FieldByName('LOCID').AsString);
   DMAF.cdsPiso.Filtered := True;
End;

Procedure TFRptTraslados.dblcDestPisoExit(Sender: TObject);
Begin
   If dblcDestPiso.text = '' Then
   Begin
      edtDestPiso.text := '';
      exit;
   End;
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
   DMAF.cdsArea.Filter := 'LOCID=' + quotedstr(DMAF.cdsLocal.FieldByName('LOCID').AsString)
      + ' and PISO=' + quotedstr(DMAF.cdsPiso.FieldByName('PISO').AsString);
   DMAF.cdsArea.Filtered := True;
End;

Procedure TFRptTraslados.dblcDestAmbienteExit(Sender: TObject);
Begin
   If dblcDestAmbiente.text = '' Then
   Begin
      edtDestAmbiente.text := '';
      exit;
   End;
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

End;

Procedure TFRptTraslados.dblcDestAreaExit(Sender: TObject);
Begin
   If dblcDestArea.text = '' Then
   Begin
      edtDestArea.text := '';
      exit;
   End;
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
   DMAF.cdsAmbiente.Filter := 'LOCID=' + quotedstr(DMAF.cdsLocal.FieldByName('LOCID').AsString)
      + ' and PISO=' + quotedstr(DMAF.cdsPiso.FieldByName('PISO').AsString)
      + ' and AREA=' + quotedstr(DMAF.cdsArea.FieldByName('AREA').AsString);
   DMAF.cdsAmbiente.Filtered := True;
End;

Procedure TFRptTraslados.Z2bbtnImprimeClick(Sender: TObject);
Var
   ls_responsable, ls_motivo, ls_localidad: String;
   ls_piso, ls_area, ls_ambiente, ls_fechas: String;
Begin
   //verifica rango de fechas
   ls_fechas := 'Desde: ' + datetostr(wwDBDateTimePicker_Desde.date) + ' Hasta: ' + datetostr(wwDBDateTimePicker_Hasta.date);
   //Responsable
   If dblcResponsabTras.text = '' Then
   Begin
      ls_responsable := 'TODOS';
   End
   Else
   Begin
      ls_responsable := edtResponsabTras.text;
   End;
   //Motivo
   If dblcMotivoSal.text = '' Then
   Begin
      ls_motivo := 'TODOS';
   End
   Else
   Begin
      ls_motivo := dblcMotivoSal.text;
   End;
   //Localidad
   If dblcDestLocal.text = '' Then
   Begin
      ls_localidad := 'TODAS';
   End
   Else
   Begin
      ls_localidad := dblcDestLocal.text + '-' + edtDestLocal.text;
   End;
   //piso
   If dblcDestPiso.text = '' Then
   Begin
      ls_piso := 'TODOS';
   End
   Else
   Begin
      ls_piso := dblcDestPiso.text + '-' + edtDestPiso.text;
   End;
   //area
   If dblcDestArea.text = '' Then
   Begin
      ls_area := 'TODAS';
   End
   Else
   Begin
      ls_area := dblcDestArea.text + '-' + edtDestArea.text;
   End;
   //ambiente
   If dblcDestAmbiente.text = '' Then
   Begin
      ls_ambiente := 'TODOS';
   End
   Else
   Begin
      ls_ambiente := dblcDestAmbiente.text + '-' + edtDestAmbiente.text;
   End;

   xSQL := 'SELECT ACF320.Numdoc NUMERO_TRASLADO, ' +
      'ACF320.FECTRAS FECHA_TRASLADO, ' +
      'ACF320.Usuario USUARIO_RESPONSABLE, (SELECT INITCAP(ACF115.NOMBRE) FROM ACF115 WHERE ACF115.USUARIO = ACF320.Usuario) NOMBRE_RESPONSABLE, ' +
      'ACF320.Local_d LOCALIDAD_CODIGO, (SELECT INITCAP(ACF120.LOCDES)  FROM ACF120 WHERE ACF320.LOCAL_D = ACF120.LOCID) LOCALIDAD_DESCRIPCION , ' +
      'ACF320.Piso_d PISO_CODIGO,  (SELECT INITCAP(ACF121.PISODES) FROM ACF121 WHERE ACF320.Local_d = ACF121.LOCID AND ACF320.Piso_d = ACF121.PISO  ) PISO_DESCRIPCION, ' +
      'ACF320.Area_d AREA_CODIGO,  (SELECT INITCAP(ACF122.AREADES) FROM ACF122 WHERE ACF320.Local_d = ACF122.LOCID AND ACF320.Piso_d = ACF122.PISO AND ACF320.Area_d = ACF122.AREA ) AREA_DESCRIPCION, ' +
      'ACF320.Amb_d AMBIENTE_CODIGO,   (SELECT INITCAP(ACF123.AMBDES)  FROM ACF123 WHERE ACF320.Local_d = ACF123.LOCID AND ACF320.Piso_d = ACF123.PISO AND ACF320.Area_d = ACF123.AREA AND ACF320.Amb_d = ACF123.AMBCOD  ) AMBIENTE_DESCRIPCON, ' +
      'ACF320.USUAUT_D USUARIO_RECIBE, ' +
      'INITCAP(ACF320.NOMAUT_D) NOMBRE_RECIBE, ' +
      'INITCAP(ACF320.MOTIVO) MOTIVO_TRASLADO, ' +
                  //INICIO HPP_201107_ACF
                  //'ACF201.ARTCODBAR ARTICULO_CODIGO, ' +
   'ACF201.CODIGOBARRA ARTICULO_CODIGO, ' +
                  //FIN HPP_201107_ACF
   'INITCAP(ACF201.ACFDES) ARTICULO_DESCRIPCION, ' +
      'INITCAP(ACF320.OBSERVAC) OBSERVACION, ' +
      quotedStr(DMAF.wUsuario) + ' USUARIO_IMPRIME, ' +
      quotedStr(ls_fechas) + ' FILTRO_FECHAS, ' +
      quotedStr(ls_responsable) + ' FILTRO_RESPONSABLE, ' +
      quotedstr(ls_motivo) + ' FILTRO_MOTIVO, ' +
      quotedstr(ls_localidad) + ' FILTRO_LOCALIDAD, ' +
      quotedstr(ls_piso) + ' FILTRO_PISO, ' +
      quotedstr(ls_area) + ' FILTRO_AREA, ' +
      quotedstr(ls_ambiente) + ' FILTRO_AMBIENTE ' +
      'FROM ACF320, ACF321, ACF201 ' +
      'WHERE ACF320.DOCREF = ACF321.DOCREF ' +
      'AND ACF320.NUMDOC = ACF321.NUMDOC ' +
      'AND ACF320.ACEPTADO = ' + quotedStr('S') + ' ' +
      'AND ACF321.ARTCODBAR = ACF201.ARTCODBAR ' +
      'AND (ACF320.FECTRAS >= TO_DATE(' + quotedStr(datetostr(wwDBDateTimePicker_Desde.date)) + ', ' + quotedStr('DD/MM/YYYY')
      + ') AND ACF320.FECTRAS <= TO_DATE(' + quotedStr(datetostr(wwDBDateTimePicker_Hasta.date)) + ', ' + quotedStr('DD/MM/YYYY') + ') ) ';

   If dblcResponsabTras.text <> '' Then
   Begin
      xSQL := xSQL + ' AND ACF320.Usuario = ' + quotedStr(dblcResponsabTras.text);
   End;
   If dblcMotivoSal.text <> '' Then
   Begin
      xSQL := xSQL + ' AND ACF320.MOTIVO = ' + quotedStr(dblcMotivoSal.text);
   End;
   If dblcDestLocal.text <> '' Then
   Begin
      xSQL := xSQL + ' AND ACF320.Local_d = ' + quotedStr(dblcDestLocal.text);
   End;
   If dblcDestPiso.text <> '' Then
   Begin
      xSQL := xSQL + ' AND ACF320.Piso_d = ' + quotedStr(dblcDestPiso.text);
   End;
   If dblcDestArea.text <> '' Then
   Begin
      xSQL := xSQL + ' AND ACF320.Area_d = ' + quotedStr(dblcDestArea.text);
   End;
   If dblcDestAmbiente.text <> '' Then
   Begin
      xSQL := xSQL + ' AND ACF320.Amb_d = ' + quotedStr(dblcDestAmbiente.text);
   End;

   DMAF.cdsQry10.Close;
   DMAF.cdsQry10.DataRequest(xSQL);
   DMAF.cdsQry10.Open;
   If DMAF.cdsQry10.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppDBPipeline_Traslados.DataSource := DMAF.dsQry10;
   ppReport_Traslados.DataPipeline := ppDBPipeline_Traslados;
   If RadioButton_PorArea.checked Then
   Begin
      ppReport_Traslados.Template.FileName := wRutaRpt + 'ACF\DEMA\TrasladosRpt_Area.rtm';
   End
   Else
   Begin
      ppReport_Traslados.Template.FileName := wRutaRpt + 'ACF\DEMA\TrasladosRpt_Localidad.rtm';
   End;

   ppReport_Traslados.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppDesigner_Traslados.Report := ppReport_Traslados ;
   //ppDesigner_Traslados.ShowModal() ;
   ppReport_Traslados.Print;

End;
//INICIO HPP_201107_ACF

Procedure TFRptTraslados.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMAF.cdsQry10.Close;
End;
//FIN HPP_201107_ACF
End.

