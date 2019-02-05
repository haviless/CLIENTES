unit ACF292;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm,
  ppRelatv, ppCache, ppDB, ppDBPipe, StdCtrls, Buttons, ExtCtrls, DB,
  ppTypes, ppviewr, oaAF3000;
type
   RCabComprobante = record
       CiaDes,
       CIAID,
       TDIARID,
       Diario,
       Proveedor,
       numchq,
       banco,
       cuenta,
       Moneda,
       Glosa,
       Lote,
       TipoDoc,
       TipoCamb,
       Periodo,
       NoComp,
       NoDoc,
       Importe,
       Tmoneda
       : String;

  end;

  TFVoucherImp = class(TForm)
    ppdbCntCaja: TppDBPipeline;
    pprContabilizado: TppReport;
    rgImp: TRadioGroup;
    bbtnVouOk: TBitBtn;
    bbtnVouCa: TBitBtn;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    lblGlosa: TppLabel;
    ppLabel9: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel36: TppLabel;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine25: TppLine;
    lblCiaDes: TppLabel;
    lblTD: TppLabel;
    lblDiario: TppLabel;
    lblProveedor: TppLabel;
    lblTipoCamb: TppLabel;
    lblperiodo: TppLabel;
    lblNoComp: TppLabel;
    lblMoneda: TppLabel;
    pplblMesDia: TppLabel;
    ppLabel100: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText11: TppDBText;
    ppLabel4: TppLabel;
    ppLabel15: TppLabel;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    pplNoDoc: TppLabel;
    ppLabel17: TppLabel;
    ppLabel21: TppLabel;
    pplTCSBS: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    lblBanco: TppLabel;
    lblCuenta: TppLabel;
    lblNumChq: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppDBText10: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLine2: TppLine;
    ppDBText14: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine26: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel16: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel24: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel25: TppLabel;
    procedure bbtnVouOkClick(Sender: TObject);
    procedure pprContabilizadoPreviewFormCreate(Sender: TObject);
    procedure bbtnVouCaClick(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    xVoucherRTM : String;
    Procedure ImprimirComprobante(CabComprobante : RCabComprobante);
  public
    { Public declarations }
    wComprobanteI: RCabComprobante;
    wBienedeForma : String;
  end;

var
  FVoucherImp  : TFVoucherImp;

implementation

uses ACFDM;

{$R *.DFM}

procedure TFVoucherImp.bbtnVouOkClick(Sender: TObject);
begin
{
  if rgImp.ItemIndex=0 then
     xVoucherRTM:= ExtractFilePath(application.ExeName )+'\SOLFORMATOS\ACFVoucherG.RTM'
  else
     xVoucherRTM:=ExtractFilePath( application.ExeName ) +'\SOLFORMATOS\ACFVoucherD.RTM';
}

  if rgImp.ItemIndex=0 then
//        xVoucherRTM:= ExtractFilePath(application.ExeName )+'\SOLFORMATOS\'+DM1.cdsCia.FieldByName('RUTAREP').AsString+'\ACFVoucherG.RTM'
        xVoucherRTM:= ExtractFilePath(application.ExeName )+wRutaRpt+'\ACFVoucherG.RTM'
//	pprSolicitud.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\RepSolicitud.rtm';

  else
     xVoucherRTM:=ExtractFilePath( application.ExeName ) +'\SOLFORMATOS\ACFVoucherD.RTM';

  ImprimirComprobante( wComprobanteI );
end;


Procedure TFVoucherImp.ImprimirComprobante(CabComprobante : RCabComprobante);
var
  xSQL : string;
  ssql,xfech, xliq : string;
begin
   DMAF.cdsQry.IndexFieldNames:='';
   DMAF.cdsQry.Filtered:=False;
   DMAF.cdsQry.Filter  :='';
   DMAF.cdsQry.Close;

  with CabComprobante do
  begin
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    xSQL:='Select '
       +'ACF306.CIAID, ACF306.TDIARID, ACF306.CNTANOMM, ACF306.CNTCOMPROB, '
       +'ACF306.CNTLOTE, ACF306.DOCID, ACF306.CNTSERIE, ACF306.CNTNODOC, '
       +'ACF306.CNTFEMIS, ACF306.CNTFVCMTO, ACF306.CUENTAID, '
       +'ACF306.CLAUXID, ACF306.AUXID, ACF306.CCOSID, ACF306.CNTDH, '
       +'ACF306.CNTTCAMBIO, ACF306.TMONID, ACF306.CNTMTOORI, '
       +'ACF306.CNTMTOLOC, ACF306.CNTMTOEXT, ACF306.CNTESTADO, ACF306.CNTCUADRE, '
       +'ACF306.CNTFCOMP, ACF306.CNTGLOSA, ACF306.CAMPOVAR, '
       +'CASE WHEN CNTDH=''D'' THEN ACF306.CNTMTOLOC ELSE 0 END CNTDEBEMN, '
       +'CASE WHEN CNTDH=''H'' THEN ACF306.CNTMTOLOC ELSE 0 END CNTHABEMN, '
       +'0 CNTDEBEME, 0 CNTHABEME, CNTREG, TGE202.CTADES '
       +'From ACF306 '
       +'LEFT JOIN TGE202 ON (ACF306.CIAID=TGE202.CIAID and ACF306.CUENTAID=TGE202.CUENTAID) '
       +'Where ACF306.CIAID='''     + Ciaid   +''' and '
       +      'ACF306.CNTANOMM='''  + Periodo +''' and '
       +      'ACF306.TDIARID='''   + TDiarid +''' and '
       +      'ACF306.CNTCOMPROB='''+ NoComp  +''' and '
       +      'ACF306.CNTLOTE='''   + LOTE    +''' '
       +'Order By ACF306.CNTREG'
//       +'Order By ACF306.CAMPOVAR, ACF306.CNTDH'
   END
   else
   Begin
    xSQL:='Select '
       +'ACF306.CIAID, ACF306.TDIARID, ACF306.CNTANOMM, ACF306.CNTCOMPROB, '
       +'ACF306.CNTLOTE, ACF306.DOCID, ACF306.CNTSERIE, ACF306.CNTNODOC, '
       +'ACF306.CNTFEMIS, ACF306.CNTFVCMTO, ACF306.CUENTAID, '
       +'ACF306.CLAUXID, ACF306.AUXID, ACF306.CCOSID, ACF306.CNTDH, '
       +'ACF306.CNTTCAMBIO, ACF306.TMONID, ACF306.CNTMTOORI, '
       +'ACF306.CNTMTOLOC, ACF306.CNTMTOEXT, ACF306.CNTESTADO, ACF306.CNTCUADRE, '
       +'ACF306.CNTFCOMP, ACF306.CNTGLOSA, ACF306.CAMPOVAR, '
//       +'CASE WHEN CNTDH=''D'' THEN ACF306.CNTMTOLOC ELSE 0 END CNTDEBEMN, '
       +' DECODE(CNTDH,''D'',ACF306.CNTMTOLOC,0) CNTDEBEMN, '
  //     +'CASE WHEN CNTDH=''H'' THEN ACF306.CNTMTOLOC ELSE 0 END CNTHABEMN, '
       +' DECODE (CNTDH,''H'',ACF306.CNTMTOLOC,0) CNTHABEMN, '
       +'0 CNTDEBEME, 0 CNTHABEME, CNTREG, TGE202.CTADES  '
       +'From ACF306, TGE202  '
//       +'LEFT JOIN TGE202 ON (ACF306.CIAID=TGE202.CIAID and ACF306.CUENTAID=TGE202.CUENTAID) '
       +'Where ACF306.CIAID='''     + Ciaid   +''' and '
       +      'ACF306.CNTANOMM='''  + Periodo +''' and '
       +      'ACF306.TDIARID='''   + TDiarid +''' and '
       +      'ACF306.CNTCOMPROB='''+ NoComp  +''' and '
       +      'ACF306.CNTLOTE='''   + LOTE    +''' AND ACF306.CIAID=TGE202.CIAID AND ACF306.CUENTAID=TGE202.CUENTAID '
       +'Order By ACF306.CNTREG'
//       +'Order By ACF306.CAMPOVAR, ACF306.CNTDH'
   end;
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;
  end;

  ppdbCntCaja.DataSource := DMAF.dsQry;

  pprContabilizado.Template.FileName := xVoucherRTM;
  pprContabilizado.Template.LoadFromFile;

  with CabComprobante do
  begin
     lblCiades.Caption   := CiaDes ;
     lblDiario.Caption   := Diario  ;
     lblTD.Caption       := TDiarid ;
     lblGlosa.Caption    := Glosa ;
     lblTipoCamb.Caption := FloatToStrF( StrToFloat(TipoCamb),ffNumber,10,3);
     lblPeriodo.Caption  := Periodo ;
     lblNoComp.Caption   := NoComp ;
     lblmoneda.caption   := Moneda ;

     //lblImporte.Caption  := 'S/.'+FloatToStrF(StrToFloat(Importe),ffNumber,15,2);
  end;

  pprContabilizado.Print;
  pprContabilizado.Stop;
  ppdbCntCaja.DataSource := nil ;
  DMAF.cdsQry.Close;
end;

procedure TFVoucherImp.pprContabilizadoPreviewFormCreate(Sender: TObject);
begin
   pprContabilizado.PreviewForm.ClientHeight := 560;
   pprContabilizado.PreviewForm.ClientWidth  := 740;
   TppViewer(pprContabilizado.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;


procedure TFVoucherImp.bbtnVouCaClick(Sender: TObject);
begin
   Close;
end;

procedure TFVoucherImp.ppDetailBand2BeforePrint(Sender: TObject);
var
 xMesDia : string;
begin
end;

procedure TFVoucherImp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

end.
