Unit ACF788;
//********************************************************
// CREADO POR       : Abelardo Sulca Palomino
// FECHA DE CREACION: 09/05/2011
// DESCRIPCION      : Ventana para ejecutar el reporte de Cambio
//                    de código de barras
//********************************************************

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, StdCtrls, ExtCtrls, Buttons, Wwdbigrd, ppEndUsr, ppProd,
   ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCache,
   ppCtrls, ppVar, ppPrnabl, ppParameter;

Type
   TFToolCambioCodBarra = Class(TForm)
      pnlAct: TPanel;
      Z2bbtn_RptSolDesactivacion: TBitBtn;
      ppDBPipeline_CambioCodbarra: TppDBPipeline;
      ppReport_CambioCodbarra: TppReport;
      ppDesigner_CambioCodbarra: TppDesigner;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
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
      ppLabel19: TppLabel;
      ppLine2: TppLine;
      ppDBText5: TppDBText;
      ppLabel3: TppLabel;
      ppDBText7: TppDBText;
      ppLabel4: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppLabel2: TppLabel;
      ppLine4: TppLine;
      ppDetailBand1: TppDetailBand;
      ppDBCalc1: TppDBCalc;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText4: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc2: TppDBCalc;
      ppLabel6: TppLabel;
      ppLine3: TppLine;
      Procedure Z2bbtn_RptSolDesactivacionClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }

   Public
    { Public declarations }
   End;

Var
   FToolCambioCodBarra: TFToolCambioCodBarra;

Implementation
Uses ACFDM, oaAF3000;
{$R *.dfm}

Procedure TFToolCambioCodBarra.Z2bbtn_RptSolDesactivacionClick(
   Sender: TObject);
Var
   ls_codigobarra: String;
Begin
   ls_codigobarra := MantCambioCodbarras.FMant.cds2.FieldbyName('CODIGOBARRA').AsString;
   If ls_codigobarra = '' Then
   Begin
      ShowMessage('No se ha seleccionado ningún activo');
      exit;
   End;
   xSQL := ' SELECT ACF201.ARTCODBAR CODIGO_ACTIVO,ACF201.CODIGOBARRA CODIGO_BARRA, ACF201.ACFDES ACTIVO_DES, ' +
      ' ACF201.RECIBEID RESPONSABLE , ACF201.RECIBENOM RESPONSABLES_DES, ' +
      ' ACF140.CIAID COMPANIA, ACF140.NUMSOLCAM SOL_CAMBIO_CODBAR, ' +
      ' ACF140.MOTCAMID MOTIVO, (SELECT ACF112.MOTCAMDES FROM ACF112 WHERE ACF112.MOTCAMID = ACF140.MOTCAMID) MOTIVO_DESC, ' +
      ' ACF140.FECHA FECHA,ACF140.USUREG USUARIO, ACF141.CODIGOBARRA_ANT CODBAR_ANTERIOR, ACF141.CODIGOBARRA CODBAR_NUEVO,  ' +
      ' ACF140.OBSERVACION OBSERVACION, ' +
      QuotedStr(DMAF.wUsuario) + ' USUARIO_IMPRIME ' +
      ' FROM ACF140, ACF141 ,ACF201 ' +
      ' WHERE ACF140.CIAID = ACF141.CIAID ' +
      ' AND ACF140.NUMSOLCAM = ACF141.NUMSOLCAM ' +
      ' AND ACF141.ARTCODBAR = ACF201.ARTCODBAR ' +
      ' AND ACF140.ESTADO = ' + QuotedStr('ACEPTADO') +
      ' AND ACF201.CODIGOBARRA = ' + QuotedStr(ls_codigobarra) +
      ' ORDER BY ACF140.NUMSOLCAM ';

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppDBPipeline_CambioCodbarra.DataSource := DMAF.dsQry;
   ppReport_CambioCodbarra.DataPipeline := ppDBPipeline_CambioCodbarra;
   ppReport_CambioCodbarra.Template.FileName := wRutaRpt + 'ACF\DEMA\CambioCodBarras.rtm';

   ppReport_CambioCodbarra.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppDesigner_CambioCodbarra.Report := ppReport_CambioCodbarra ;
   //ppDesigner_CambioCodbarra.ShowModal() ;
   ppReport_CambioCodbarra.Print;
End;

Procedure TFToolCambioCodBarra.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   FToolCambioCodBarra.Free;
   DMAF.cdsQry.Close;
End;

End.

