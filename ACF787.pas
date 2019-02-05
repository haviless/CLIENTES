Unit ACF787;
//********************************************************
// CREADO POR       : Abelardo Sulca Palomino
// Nº HPP           : HPP_201104_ACF
// FECHA DE CREACION: 01/04/2011
// DESCRIPCION      : Ventana para mostrar el reporte de desactivaciones
//********************************************************
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
   Dialogs, ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, StdCtrls, wwdbdatetimepicker, Buttons, wwdblook, ppBands,
   ppCache, ppCtrls, ppPrnabl, ppVar, ppParameter, ExtCtrls;

Type
   TFRptDesactivados = Class(TForm)
      ppDBPipeline_AFDesactivados: TppDBPipeline;
      ppReport_AFDesactivados: TppReport;
      ppDesigner_AFDesactivados: TppDesigner;
      Label3: TLabel;
      dblcMotivo: TwwDBLookupCombo;
      edtMotivo_des: TEdit;
      Z2bbtnImprime: TBitBtn;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppSystemVariable4: TppSystemVariable;
      ppLabel1: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel2: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppDBText10: TppDBText;
      ppShape1: TppShape;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel14: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLine1: TppLine;
      ppLine8: TppLine;
      ppLine10: TppLine;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppLine2: TppLine;
      ppDBText11: TppDBText;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLine3: TppLine;
      ppLabel12: TppLabel;
      ppLine4: TppLine;
      ppLabel13: TppLabel;
      ppDBText12: TppDBText;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText8: TppDBText;
      ppDBText7: TppDBText;
      ppDBText9: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppDBCalc2: TppDBCalc;
      ppLabel15: TppLabel;
      Shape1: TShape;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      wwDBDateTimePicker_Desde: TwwDBDateTimePicker;
      wwDBDateTimePicker_Hasta: TwwDBDateTimePicker;
      Shape2: TShape;
      Procedure FormShow(Sender: TObject);
      Procedure dblcMotivoExit(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FRptDesactivados: TFRptDesactivados;

Implementation

Uses ACFDM;
{$R *.dfm}

Procedure TFRptDesactivados.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin
   wwDBDateTimePicker_Desde.Date := Now;
   wwDBDateTimePicker_Hasta.Date := Now;

   xSQL := 'select * from ACF105';
   DMAF.cdsQry9.Close;
   DMAF.cdsQry9.DataRequest(xSQL);
   DMAF.cdsQry9.Open;
   dblcMotivo.LookupField := 'DESACID';
   dblcMotivo.LookupTable := DMAF.cdsQry9;
   dblcMotivo.Selected.Clear;
   dblcMotivo.Selected.Add('DESACID'#9'2'#9'Id'#9'F');
   dblcMotivo.Selected.Add('DESACDES'#9'20'#9'Motivo'#9'F');
End;

Procedure TFRptDesactivados.dblcMotivoExit(Sender: TObject);
Begin
   xSQL := 'DESACID=' + quotedstr(dblcMotivo.Text);
   If dblcMotivo.Text = '' Then
   Begin
      edtMotivo_des.Text := '';
      exit;
   End;
   If dblcMotivo.Text <> '' Then
      edtMotivo_des.Text := DMAF.DisplayDescrip('dspTGE', 'ACF105', 'DESACDES', xSQL, 'DESACDES');
End;

Procedure TFRptDesactivados.Z2bbtnImprimeClick(Sender: TObject);
Var
   ls_sql_motivo, ls_filtro_fecha, ls_filtro_motivo: String;
Begin

   If dblcMotivo.Text <> '' Then
   Begin
      ls_sql_motivo := ' AND ACF201.DESACID = ' + QuotedStr(dblcMotivo.Text) + ' ';
      ls_filtro_motivo := dblcMotivo.Text + ' ' + edtMotivo_des.Text;
   End
   Else
   Begin
      ls_sql_motivo := '';
      ls_filtro_motivo := 'Todos';
   End;

   ls_filtro_fecha := 'Desde: ' + datetostr(wwDBDateTimePicker_Desde.date) + ' Hasta: ' + datetostr(wwDBDateTimePicker_Hasta.date);

   //INICIO HPP_201107_ACF
   //xSQL := ' SELECT ACF201.ARTCODBAR ACTIVO, '+
   xSQL := ' SELECT ACF201.CODIGOBARRA ACTIVO, ' +
   //FIN HPP_201107_ACF
   ' ACF201.ACFDES ACTIVO_DES, ' +
      ' ACF201.ACFFECINAC FECHA, ' +
      ' ACF201.DESACID COD_MOTIVO, ' +
      ' (SELECT ACF105.DESACDES FROM ACF105 WHERE ACF105.DESACID = ACF201.DESACID) MOTIVO_DESC, ' +
      ' UPPER(ACF201.DESAUTORI) AUTORIZA, ' +
      ' ACF201.DESANO AÑO, ' +
      ' ACF201.DESANOMES MES, ' +
      ' ACF201.ACFDESACMO OBSERVACION, ' +
      ' (SELECT ACF130.NUMSOLDES FROM ACF130, ACF131 ' +
      ' WHERE ACF130.CIAID = ACF131.CIAID  ' +
      ' AND ACF130.NUMSOLDES = ACF131.NUMSOLDES  ' +
      ' AND ACF131.ARTCODBAR = ACF201.ARTCODBAR  ' +
      ' AND ROWNUM = 1 ' +
      ' AND ACF130.ESTADO = ' + QuotedStr('ACEPTADO') + ' ) NUM_SOLDESACTIVACION, ' +
      QuotedStr(ls_filtro_fecha) + ' FILTRO_FECHA, ' +
      QuotedStr(DMAF.wUsuario) + ' USUARIO_IMPRIME, ' +
      QuotedStr(ls_filtro_motivo) + ' FILTRO_MOTIVO ' +
      ' FROM ACF201 ' +
      ' WHERE ( ACF201.ACFFECINAC >= TO_DATE(' + quotedStr(datetostr(wwDBDateTimePicker_Desde.date)) + ', ' + quotedStr('DD/MM/YYYY') + ')' +
      ' AND ACF201.ACFFECINAC <= TO_DATE(' + quotedStr(datetostr(wwDBDateTimePicker_Hasta.date)) + ', ' + quotedStr('DD/MM/YYYY') + '))' +
      ' AND ACF201.ACFFLAGACT = ' + QuotedStr('I') +
                  //INICIO HPP_201107_ACF
                   //ls_sql_motivo + ' ORDER BY ACF201.ARTCODBAR ' ;
   ls_sql_motivo + ' ORDER BY ACF201.CODIGOBARRA ';
                  //FIN HPP_201107_ACF

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppDBPipeline_AFDesactivados.DataSource := DMAF.dsQry;
   ppReport_AFDesactivados.DataPipeline := ppDBPipeline_AFDesactivados;
   ppReport_AFDesactivados.Template.FileName := wRutaRpt + 'ACF\DEMA\AFDesactivados.rtm';

   ppReport_AFDesactivados.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppDesigner_AFDesactivados.Report := ppReport_AFDesactivados ;
   //ppDesigner_AFDesactivados.ShowModal() ;
   ppReport_AFDesactivados.Print;
End;

Procedure TFRptDesactivados.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   //INICIO HPP_201107_ACF
   DMAF.cdsQry.Close;
   //FIN HPP_201107_ACF
   FRptDesactivados.Free;

End;

End.

