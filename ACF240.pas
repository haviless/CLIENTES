unit ACF240;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppDB, ppBands, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppCache,
  ppDBPipe, ppCtrls, ppPrnabl, StdCtrls, Mask, DBCtrls, ppVar, wwdblook,
  Buttons, wwdbdatetimepicker, Wwdbdlg, ExtCtrls, wwdbedit, Grids, DBGrids,
  ppEndUsr, ppModule, daDatMod, Wwdbigrd, Wwdbgrid, ppviewr;

type
  TFReporte = class(TForm)
    pprActFij: TppReport;
    dblcCia: TwwDBLookupCombo;
    bbtnOk1: TBitBtn;
    bbtnCancela1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbdtpFdesde: TwwDBDateTimePicker;
    dbdtpFHasta: TwwDBDateTimePicker;
    Label5: TLabel;
    dblcdCCosId: TwwDBLookupComboDlg;
    Label6: TLabel;
    dblcdCuenta: TwwDBLookupComboDlg;
    Label7: TLabel;
    rgDepre: TRadioGroup;
    rgActivo: TRadioGroup;
    dbeDescrip: TwwDBEdit;
    rgOrden: TRadioGroup;
    Label8: TLabel;
    ppHeaderBand1: TppHeaderBand;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    pprReporte1: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel17: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    pprReporte3: TppReport;
    pprReporte4: TppReport;
    pprReporte5: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel24: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppDBText18: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppdbW1: TppDBPipeline;
    pprReporte2: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppDetailBand7: TppDetailBand;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc8: TppDBCalc;
    ppVariable2: TppVariable;
    ppDBText21: TppDBText;
    ppLabel8: TppLabel;
    ppLabel28: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppLabel11: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc7: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppVariable1: TppVariable;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dblcLocal: TwwDBLookupCombo;
    dblcUbica: TwwDBLookupCombo;
    ppSummaryBand4: TppSummaryBand;
    ppDBCalc10: TppDBCalc;
    ppLabel29: TppLabel;
    ppDBText43: TppDBText;
    pnlTipoDep: TPanel;
    dbgTipoDep: TwwDBGrid;
    Label12: TLabel;
    ppHeaderBand2: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText48: TppDBText;
    ppDBText53: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc14: TppDBCalc;
    ppSystemVariable12: TppSystemVariable;
    ppLabel30: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppLabel31: TppLabel;
    ppSummaryBand5: TppSummaryBand;
    ppLabel32: TppLabel;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLabel33: TppLabel;
    ppDBText55: TppDBText;
    ppLabel34: TppLabel;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    ppDBCalc30: TppDBCalc;
    ppDBCalc31: TppDBCalc;
    ppDBCalc32: TppDBCalc;
    ppDBCalc33: TppDBCalc;
    ppDBCalc34: TppDBCalc;
    ppDBCalc35: TppDBCalc;
    ppDBCalc36: TppDBCalc;
    ppDBCalc37: TppDBCalc;
    ppDBCalc38: TppDBCalc;
    ppDBCalc39: TppDBCalc;
    ppDBCalc40: TppDBCalc;
    ppLabel35: TppLabel;
    ppDBCalc41: TppDBCalc;
    ppDBCalc42: TppDBCalc;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppDBText65: TppDBText;
    ppVariable3: TppVariable;
    ppVariable4: TppVariable;
    ppDBCalc43: TppDBCalc;
    ppDBCalc45: TppDBCalc;
    ppDBCalc46: TppDBCalc;
    ppDBCalc48: TppDBCalc;
    ppVariable5: TppVariable;
    ppVariable6: TppVariable;
    ppVariable7: TppVariable;
    ppVariable8: TppVariable;
    ppVariable9: TppVariable;
    ppVariable10: TppVariable;
    ppVariable11: TppVariable;
    ppVariable12: TppVariable;
    ppVariable13: TppVariable;
    ppVariable14: TppVariable;
    ppVariable15: TppVariable;
    ppDBText47: TppDBText;
    ppDBText54: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    rgPrevio: TRadioGroup;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel10: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLine19: TppLine;
    dbeCia: TwwDBEdit;
    dbeTipAct: TwwDBEdit;
    dbeLocal: TwwDBEdit;
    dbeUbica: TwwDBEdit;
    dbeCCosId: TwwDBEdit;
    dbeCuenta: TwwDBEdit;
    stCubrePantalla: TStaticText;
    dblcTipAct: TwwDBLookupComboDlg;
    procedure bbtnOk1Click(Sender: TObject);
    procedure bbtnCancela1Click(Sender: TObject);
    procedure Reporte1;
    procedure Reporte2;
    procedure Reporte3;
    procedure Reporte4;
    procedure Reporte5;
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure FormActivate(Sender: TObject);
    procedure dbgTipoDepDblClick(Sender: TObject);
    procedure ppVariable5OldOnCalc(Sender: TObject);
    procedure ppVariable6OldOnCalc(Sender: TObject);
    procedure ppVariable7OldOnCalc(Sender: TObject);
    procedure ppVariable8OldOnCalc(Sender: TObject);
    procedure ppVariable9OldOnCalc(Sender: TObject);
    procedure ppVariable3OldOnCalc(Sender: TObject);
    procedure ppVariable4OldOnCalc(Sender: TObject);
    procedure ppVariable10OldOnCalc(Sender: TObject);
    procedure ppVariable11OldOnCalc(Sender: TObject);
    procedure ppVariable12OldOnCalc(Sender: TObject);
    procedure ppVariable13OldOnCalc(Sender: TObject);
    procedure ppVariable14OldOnCalc(Sender: TObject);
    procedure ppVariable15OldOnCalc(Sender: TObject);
    procedure ppDBCalc25Calc(Sender: TObject);
    procedure ppDBCalc26Calc(Sender: TObject);
    procedure ppDBCalc4Calc(Sender: TObject);
    procedure ppDBCalc27Calc(Sender: TObject);
    procedure ppDBCalc32Calc(Sender: TObject);
    procedure ppDBCalc33Calc(Sender: TObject);
    procedure ppDBCalc38Calc(Sender: TObject);
    procedure ppDBCalc39Calc(Sender: TObject);
    procedure ppGroupFooterBand6AfterPrint(Sender: TObject);
    procedure dblcLocalExit(Sender: TObject);
    procedure dblcTipActxxExit(Sender: TObject);
    procedure pprReporte5PreviewFormCreate(Sender: TObject);
    procedure dblcdCCosIdExit(Sender: TObject);
    procedure dblcUbicaExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcdCuentaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XXCAMPO, WSQL , xdes, xAcfFlagAct,xDepflagpro,WPERIODO, WANO,
  wtabla: string;
  FReporte: TFReporte;

 implementation

uses ACFDM;

{$R *.DFM}

procedure TFReporte.bbtnOk1Click(Sender: TObject);
var
   xFecStr : String;
begin
   if Length(dblcCia.Text)=0 then     // Cía obligatoria
     Raise exception.Create('Ingrese Compañía');

   //INICIO SAR666
   //se reemplaza todas las teclaraciones de DM1 por DMAF
   //if DM1.wboton='2' then
   if DMAF.wboton='2' then
   //FIN SAR666
      If Length(DBDTPFHASTA.Text)=0 then
      Raise exception.Create('Ingrese Adquisición al:');

   if DMAF.wboton='4' then
      If Length(DBDTPFHASTA.Text)=0 then
      Raise exception.Create('Ingrese Depreciacion al:');

   if DMAF.wboton='5' then
      If Length(DBDTPFHASTA.Text)=0 then
      Raise exception.Create('Ingrese Depreciacion al:');

   if DMAF.wboton>'2'  then
      If rgDepre.ItemIndex=0 then
      begin
         XDEPFLAGPRO:='<>';
         pplabel9.Caption:= 'X Depreciar';
         pplabel27.Caption:='X Depreciar';
         pplabel32.Caption:='X Depreciar';
      end
      else begin
         XDEPFLAGPRO:='=';
         pplabel9.Caption:= 'Depreciado';
         pplabel27.Caption:='Depreciado';
         pplabel32.Caption:='Depreciado';
      end;

   If DMAF.wboton>'2'  then
      If rgPrevio.ItemIndex=0 then
      begin
         wTabla:='ACF204';
         pplabel48.Caption:='(Definitivo)';
         pplabel49.Caption:='(Definitivo)';
         pplabel50.Caption:='(Definitivo)';
      end
      else begin
         wTabla:='ACF204W';
         pplabel48.Caption:='(Preliminar)';
         pplabel49.Caption:='(Preliminar)';
         pplabel50.Caption:='(Preliminar)';
      end;

   If rgActivo.ItemIndex=0 then
   begin
      xAcfFlagAct:='A';
      pplabel6.Caption:= 'Activos';
      pplabel16.Caption:= 'Activos';
   end
   else begin
      xAcfFlagAct:='I';
      pplabel6.Caption:= 'Inactivos';
      pplabel6.Caption:= 'Inactivos';
   end;

   If length(dbdtpFHasta.text)>0 then
   begin
      xFecStr:=DateToStr( DBDTPFHASTA.DATE );
      WPERIODO:=Copy(xFecStr,7,4)+Copy(xFecStr,4,2);
      WANO    :=Copy(xFecStr,7,4);
   end;

   If DMAF.wboton='1' then
      Reporte1;            //Catálogo de Activos(Xtipo-Activo/xCCosto)

   If DMAF.wboton='2' then
      Reporte2;            //Resúmen x tipo de Activo

   If DMAF.wboton='3' then
      Reporte3;            //Depreciación x Cuenta

   If DMAF.wboton='4' then
      Reporte4;            //Depreciación x tipo de Activo

   If DMAF.wboton='5' then
      Reporte5;            //Resúmen de la Depreciación

end;

procedure TFReporte.bbtnCancela1Click(Sender: TObject);
begin
   If DMAF.Wboton < '3'        then
      Close;
   If pnltipoDep.Visible=True then
      Close      else
   begin
      pnlTipoDep.Visible:=True;
      pnlTipoDep.Enabled:=True;
      bbtnok1.enabled:=False;
      bbtnok1.visible:=False;
      rgPrevio.Enabled:=False;
      rgPrevio.visible:=False;
   end;
end;

procedure TFReporte.Reporte1; // Catálogo de Activos
var
    xLen : String;
begin
// query : Maestro de Activos - CCosto - Ubicación
   WSQL:='SELECT A.CIAID, A.TACFID, A.CCOSID, A.ACFFECINS, A.ACFFECADQ, '
        +    'A.ACFDES, A.ACFID, A.ACFMARCA, A.ACFMODELO, A.ACFSERIE, '
        +    'A.ACFFECRECE, A.LOCID, A.ACFFLACOMP, B.CCOSDES, B.CCOSABR, '
        +    'C.UBICABR, D.TACFABR, D.TACFDES, F.LOCABR, E.CTAABR '
        +'FROM ACF201 A '
        +'Left Join TGE202 E on ( A.CIAID=E.CIAID and A.CUENTAID=E.CUENTAID ), '
        +'TGE203 B, TGE117 C, ACF101 D, TGE126 F '
        +'WHERE A.CCOSID  = B.CCOSID   and '         // EMPAREJADOS X C.COSTO
        +      'A.UBICID  = C.UBICID   and '         // EMPAREJADOS X UBICACION
        +      'A.CIAID   = D.CIAID    and '         // EMPAREJADOS X CIA
        +      'A.TACFID  = D.TACFID   and '         //     Y TIPO ACTIVO
        +      'A.LOCID   = F.LOCID    and '         //EMPAREJADOS X LOCALIDAD
        +      'A.CIAID='''+dblcCia.TEXT+''' and '   // CIA
        +      'A.ACFFLAGACT='''+xACFFLAGACT +'''';  // ACTIVO

   IF length(dblcTipAct.text)>0 then begin
      xLen := IntToStr( Length(dblcTIPACT.TEXT) );
      WSQL:=WSQL+' AND SubStr(A.TACFID,1,'+xLen+')='''+dblcTIPACT.TEXT+'''';// TIPO DE ACTIVO
   end;

   IF length(DBLCDCCOSID.TEXT)>0 then
      WSQL:=WSQL+' AND A.CCOSID='+''''+DBLCDCCOSID.TEXT+''''; // CENTRO DE COSTO

   IF length(DBLCDCUENTA.TEXT)>0 then
      WSQL:=WSQL+' AND A.CUENTAID='+''''+DBLCDCUENTA.TEXT+''''; // CUENTA

   IF length(dbdtpFDesde.text)>0 then
   begin
      WSQL:=WSQL+' AND A.ACFFECADQ>= ';           // Fecha de Adquisición (desde)
      WSQL:=WSQL+'DATE('+''''+FORMATDATETIME('YYYY-MM-DD',DBDTPFDESDE.DATE)+''''+')';
      pplabel42.text:='desde';
      pplabel43.text:= dbdtpFDesde.text;
   end          else
   begin
      pplabel42.text:='';
      pplabel43.text:='';
   end;

   IF length(dbdtpFHasta.text)>0 then
   begin
      WSQL:=WSQL+' AND A.ACFFECADQ<= ';           // Fecha de Adquisición (hasta)
      WSQL:=WSQL+'DATE('+''''+FORMATDATETIME('YYYY-MM-DD',DBDTPFHASTA.DATE)+''''+')';
      pplabel44.text:='al';
      pplabel45.text:= dbdtpFHasta.text;
   end          else
   begin
      pplabel44.text:='';
      pplabel45.text:='';
   end;

   If length(dbeDescrip.text)>0 then
      WSQL:=WSQL+' AND A.ACFDES LIKE '+''''+'%'+DBEDESCRIP.TEXT+'%'+'''';

   If rgOrden.ItemIndex=0 then
   begin
      WSQL:=WSQL+' ORDER BY A.TACFID, A.ACFID';
   end
   else begin
      WSQL:=WSQL+' ORDER BY A.CCOSID, A.ACFID';
   end;

   DMAF.cdsWork1.Close;
   DMAF.Dcom1.Appserver.EjecutaQry2(WSQL);
   DMAF.cdsWork1.Open;

   if rgOrden.ItemIndex=0 then begin // Catálogo de Activos
      pprActFij.Print;       //   x  Tipo de Activo
      pprActFij.Reset;       //   x Centro de Costo
   end
   else begin
      pprReporte1.print;     //   x Centro de Costo
      pprReporte1.Reset;     //   x Centro de Costo
   end
end;

procedure TFReporte.Reporte2; //Resúmen x tipo de Activo
var
   xLen : String;
begin
   ppLABEL38.TEXT:=DBDTPFHASTA.TEXT;
// GENERA AREA DE TRABAJO
   DMAF.DCom1.Appserver.CreaTabla('ACFWORK1','ACFUSER');

   xLen := IntToStr( Length(dblcTIPACT.TEXT) );

//.... Saldo Inicial
   WSQL:='INSERT INTO ACFUSER(LOCID, TACFID, XVALOR1,XVALOR2,XVALOR3,XVALOR4) '
        +'(SELECT LOCID, TACFID, SUM(ACFVALOMN), 0, 0, 0 '
        +'FROM ACF201 '
        +'WHERE CIAID='''+DBLCCIA.TEXT+''' and ACFFLAGACT=''A'' and '
        +      'FECANOMES <'''+WPERIODO+''' and '
        +      'SubStr( TACFID,1,'+xLen+')='''+dblcTIPACT.TEXT+''' '
        +'GROUP BY LOCID, TACFID )';
   DMAF.DCOM1.AppServer.EjecutaSQL(WSQL);

//..... Adiciones/Compras
   WSQL:='INSERT INTO ACFUSER(LOCID, TACFID,XVALOR1,XVALOR2,XVALOR3,XVALOR4)'
        +'(SELECT LOCID, TACFID, 0, SUM(ACFVALOMN), 0, 0 '
        +'FROM ACF201 A '
        +'WHERE CIAID='''+DBLCCIA.TEXT+''' and FECANOMES>='''+WPERIODO+''' and '
        +      'SubStr( TACFID,1,'+xLen+')='''+dblcTIPACT.TEXT+''' '
        +'GROUP BY LOCID, TACFID )';
   DMAF.DCOM1.AppServer.EjecutaSQL(WSQL);

//..... Ventas/Retiros
   WSQL:='INSERT INTO ACFUSER(LOCID, TACFID,XVALOR1,XVALOR2,XVALOR3,XVALOR4) '
        +'(SELECT LOCID, TACFID, 0, 0, SUM(ACFVALOMN), 0 '
        +'FROM ACF201 '
        +'WHERE CIAID='''+DBLCCIA.TEXT+''' and ACFFLAGACT=''I'' and ' // INACTIVOS
        +      'DESANOMES>='''+WPERIODO+''' and '
        +      'SubStr( TACFID,1,'+xLen+')='''+dblcTIPACT.TEXT+''' '
        +'GROUP BY LOCID, TACFID)';
   DMAF.DCOM1.AppServer.EjecutaSQL(WSQL);

// SUMARIZA
   WSQL:='SELECT A.LOCID, A.TACFID, SUM(A.XVALOR1) AS SALDOINI, '
        +  'SUM(A.XVALOR2) AS COMPRAS, SUM(A.XVALOR3) AS RETIROS, '
        +  'B.LOCDES, C.TACFABR '
        +'FROM ACFUSER A, TGE126 B, ACF101 C '
        +'WHERE A.LOCID=B.LOCID and '              // EMPAREJADOS X LOCALIDAD
        +      'C.CIAID='''+DBLCCIA.TEXT+''' and '
        +      'A.TACFID=C.TACFID '                // EMPAREJADOS X TIPO ACTIVO
        +'GROUP BY A.LOCID, A.TACFID, B.LOCDES, C.TACFABR ';

   DMAF.cdsWORK1.CLOSE;
   DMAF.Dcom1.Appserver.EjecutaQry2(WSQL);
   DMAF.cdsWORK1.OPEN;
   pprReporte2.Print;     //Resúmen x tipo de Activo
   pprReporte2.Reset;     //Resúmen x tipo de Activo
   DMAF.cdsWORK1.CLOSE;
end;

procedure TFReporte.Reporte3;//Depreciación x Cuenta
var
   xLen : String;
begin
   xLen := IntToStr( Length(dblcTIPACT.TEXT) );
// query : Archivo de Depreciación (x cuenta)
   WSQL:='SELECT A.CIAID, A.CCOSID, A.ACFVALOMN, A.FAREDONDEO, A.DEPVALAJUS, '
        +   'A.DEPACUAJUS, A.DEPACUHIST, A.DEPNOMESES, A.DEPFLAGPRO, '
        +   'A.CUENTAID, A.ACFDES, A.ACFFECADQ, B.CUENTAID, B.CTADES '
        +'FROM '+WTABLA+' A, TGE202 B '
        +'WHERE A.DEPCOD='''+DMAF.CDSUDEP.FieldByName('DEPCOD').VALUE+''' and '
        +      'A.CUENTAID=B.CUENTAID and '         // EMPAREJADOS X CUENTA
        +      'A.CIAID=B.CIAID and '               // Y CIA
        +      'SubStr( A.TACFID,1,'+xLen+')='''+dblcTIPACT.TEXT+''' and '
        +      'A.CIAID='''+DBLCCIA.TEXT+''' and '  // CIA
        +      'A.DEPFLAGPRO'+XDEPFLAGPRO+'''Z'' '; // DEPRECIADO x DEP.

   if Length(dbdtpFHasta.text)>0 then
   begin
      WSQL:=WSQL+' and A.DEPFECDEPR<=';           // Fecha de Depreciación (hasta)
      WSQL:=WSQL+'DATE('''+FORMATDATETIME('YYYY-MM-DD',DBDTPFHASTA.DATE)+''') ';
      pplabel46.text:='al';
      pplabel47.text:= dbdtpFHasta.text;
   end          else
   begin
      pplabel46.text:='';
      pplabel47.text:='';
   end;

   WSQL:=WSQL+'ORDER BY A.CUENTAID, A.ACFFECADQ';// X CUENTA Y FECHA ADQUISICION

   DMAF.cdsWork1.Close;
   DMAF.Dcom1.Appserver.EjecutaQry2(WSQL);
   DMAF.cdsWork1.Open;

   pprREPORTE3.Print;       //Depreciación x Cuenta
   pprREPORTE3.Reset;       //Depreciación x Cuenta
   DMAF.CDSWORK1.CLOSE;
end;

procedure TFReporte.Reporte4;//Depreciación x tipo de Activo
var
   xLen : String;
begin
   ppLABEL39.TEXT:=DBDTPFHASTA.TEXT;
// GENERA AREA DE TRABAJO

   xLen := IntToStr( Length(dblcTIPACT.TEXT) );

   DMAF.DCom1.Appserver.CreaTabla('ACFWORK1','ACFUSER');

//.... Saldo Inicial : ACTIVO/DEPRECIACION
   WSQL:='INSERT INTO ACFUSER(LOCID,TACFID,XVALOR1,XVALOR2,XVALOR3,XVALOR4,ACFID,ACFDES) '
        +'(SELECT LOCID,TACFID,SUM(ACFVALOMN),SUM(DEPVALAJUS),0,0,ACFID,ACFDES '
        +'FROM '+WTABLA+' '
        +'WHERE DEPCOD='''+DMAF.CDSUDEP.FieldByName('DEPCOD').VALUE+''' and '
        +      'CIAID='''+DBLCCIA.TEXT+''' and '
        +      'SubStr( TACFID,1,'+xLen+')='''+dblcTIPACT.TEXT+''' and '
        +      'DEPFLAGPRO'+XDEPFLAGPRO+'''Z'' and '
        +      'FAPERIODO<'''+WPERIODO+''' '
        +'GROUP BY LOCID, TACFID, ACFID, ACFDES ) ';
   DMAF.DCOM1.AppServer.EjecutaSQL(WSQL);

//..... Mes Depreciación
   WSQL:='INSERT INTO ACFUSER(LOCID,TACFID,XVALOR1,XVALOR2,XVALOR3,XVALOR4,ACFID,ACFDES) '
        +'(SELECT LOCID, TACFID, 0, 0, SUM(DEPVALAJUS), 0, ACFID, ACFDES '
        +'FROM '+WTABLA+' '
        +'WHERE DEPCOD='''+DMAF.CDSUDEP.FieldByName('DEPCOD').VALUE+''' and '
        +      'CIAID='''+DBLCCIA.TEXT+''' and '
        +      'SubStr( TACFID,1,'+xLen+')='''+dblcTIPACT.TEXT+''' and '
        +      'DEPFLAGPRO'+XDEPFLAGPRO+'''Z'' and '
        +      'FAPERIODO='''+WPERIODO+''' '
        +'GROUP BY LOCID, TACFID, ACFID, ACFDES)';
   DMAF.DCOM1.AppServer.EjecutaSQL(WSQL);

//..... ACUMULADO PERIODO DEPRECIACION
   WSQL:='INSERT INTO ACFUSER(LOCID,TACFID,XVALOR1,XVALOR2,XVALOR3,XVALOR4,ACFID,ACFDES)'
        +'(SELECT LOCID, TACFID, 0, 0, 0, SUM(DEPVALAJUS),ACFID,ACFDES '
        +'FROM '+WTABLA+' '
        +'WHERE DEPCOD='''+DMAF.CDSUDEP.FieldByName('DEPCOD').VALUE+''' and '
        +      'CIAID='''+DBLCCIA.TEXT+''' and '
        +      'SubStr( TACFID,1,'+xLen+')='''+dblcTIPACT.TEXT+''' and '
        +      'DEPFLAGPRO'+XDEPFLAGPRO+'''Z'' and '
        +      'FECANO='''+WANO+''' '
        +'GROUP BY LOCID, TACFID, ACFID, ACFDES)';
   DMAF.DCOM1.AppServer.EjecutaSQL(WSQL);

// SUMARIZA
   WSQL:='SELECT A.ACFID, A.ACFDES, A.TACFID, SUM(A.XVALOR1) AS INIACT, '
        +   'SUM(A.XVALOR2) AS INIDEPRE, SUM(A.XVALOR3) AS MESDEPRE, '
        +   'SUM(A.XVALOR4) AS PERDEPRE, A.LOCID, B.LOCDES, C.TACFDES '
        +'FROM ACFUSER A, TGE126 B, ACF101 C '
        +'WHERE A.LOCID=B.LOCID and C.CIAID='''+DBLCCIA.TEXT+''' and '
        +      'A.TACFID=C.TACFID '
        +'GROUP BY A.LOCID, A.TACFID, A.ACFID, A.ACFDES, B.LOCDES,C.TACFDES';
   DMAF.CDSWORK1.CLOSE;
   DMAF.Dcom1.Appserver.EjecutaQry2(WSQL);
   DMAF.CDSWORK1.OPEN;

   pprReporte4.Print;       //Depreciación x tipo de Activo
   pprReporte4.Reset;       //Depreciación x tipo de Activo
   DMAF.CDSWORK1.CLOSE;
end;

procedure TFReporte.Reporte5;//Resúmen de la Depreciación
var
   xLen : String;
begin
   ppLABEL40.TEXT:=DBDTPFHASTA.TEXT;
   xLen := IntToStr( Length(dblcTIPACT.TEXT) );

// GENERA AREA DE TRABAJO
   DMAF.DCom1.Appserver.CreaTabla('ACFWORK1','ACFUSER');

//.... Saldo Inicial : ACTIVO/DEPRECIACION
   WSQL:='INSERT INTO ACFUSER(LOCID,TACFID,XVALOR1,XVALOR2,XVALOR3,XVALOR4) '
        +'(SELECT LOCID, TACFID, SUM(ACFVALOMN),SUM(DEPVALAJUS),0,0 '
        +'FROM '+WTABLA+' '
        +'WHERE DEPCOD='''+DMAF.CDSUDEP.FieldByName('DEPCOD').VALUE+''' and '
        +      'CIAID='''+DBLCCIA.TEXT+''' and '
        +      'SubStr( TACFID,1,'+xLen+')='''+dblcTIPACT.TEXT+''' and '
        +      'DEPFLAGPRO'+XDEPFLAGPRO+'''Z'' and '
        +      'FAPERIODO<'''+WPERIODO+''' '
        +'GROUP BY LOCID, TACFID)';
   DMAF.DCOM1.AppServer.EjecutaSQL(WSQL);

//..... Mes Depreciación
   WSQL:='INSERT INTO ACFUSER(LOCID,TACFID,XVALOR1,XVALOR2,XVALOR3,XVALOR4) '
        +'(SELECT LOCID, TACFID, 0, 0, SUM(DEPVALAJUS), 0 '
        +'FROM '+WTABLA+' '
        +'WHERE DEPCOD='''+DMAF.CDSUDEP.FieldByName('DEPCOD').VALUE+''' and '
        +      'CIAID='''+DBLCCIA.TEXT+''' and '
        +      'SubStr( TACFID,1,'+xLen+')='''+dblcTIPACT.TEXT+''' and '
        +      'DEPFLAGPRO'+XDEPFLAGPRO+'''Z'' and '
        +      'FAPERIODO='''+WPERIODO+''' '
        +'GROUP BY LOCID, TACFID) ';
   DMAF.DCOM1.AppServer.EjecutaSQL(WSQL);

//..... ACUMULADO PERIODO DEPRECIACION
   WSQL:='INSERT INTO ACFUSER(LOCID,TACFID,XVALOR1,XVALOR2,XVALOR3,XVALOR4) '
        +'(SELECT LOCID, TACFID, 0, 0, 0, SUM(DEPVALAJUS) '
        +'FROM '+WTABLA+' '
        +'WHERE DEPCOD='''+DMAF.CDSUDEP.FieldByName('DEPCOD').VALUE+''' and '
        +      'CIAID='''+DBLCCIA.TEXT+''' and '
        +      'SubStr( TACFID,1,'+xLen+')='''+dblcTIPACT.TEXT+''' and '
        +      'DEPFLAGPRO'+XDEPFLAGPRO+'''Z'' and '
        +      'FECANO ='+''''+WANO+''' '
        +'GROUP BY LOCID, TACFID)';
   DMAF.DCOM1.AppServer.EjecutaSQL(WSQL);

// SUMARIZA
   WSQL:='SELECT A.LOCID, A.TACFID, B.LOCDES, SUM(A.XVALOR1) AS INIACT, '
        +  'SUM(A.XVALOR2) AS INIDEPRE, SUM(A.XVALOR3) AS MESDEPRE, '
        +  'SUM(A.XVALOR4) AS PERDEPRE,  C.TACFABR '
        +'FROM ACFUSER A, TGE126 B, ACF101 C '
        +'WHERE A.LOCID=B.LOCID and '               // EMPAREJADOS X LOCALIDAD
        +      'C.CIAID='''+DBLCCIA.TEXT+''' and '  // EMPAREJADOS X CIA
        +      'A.TACFID=C.TACFID '                 // Y TIPO ACTIVO
        +'GROUP BY A.LOCID, A.TACFID, B.LOCDES,C.TACFABR ';

   DMAF.CDSWORK1.CLOSE;
   DMAF.Dcom1.Appserver.EjecutaQry2(WSQL);
   DMAF.CDSWORK1.OPEN;

   pprReporte5.Print;       //Resúmen de la Depreciación
   pprReporte5.Reset;

   DMAF.CDSWORK1.CLOSE;
end;

procedure TFReporte.FormActivate(Sender: TObject);
begin
   stCubrePantalla.Align := alClient ;
   Label9.Caption:=DMAF.wtitulo ;
   Label12.Visible:=False;

   IF DMAF.wboton='1' then  //(Tamaño screen)
   begin
      FReporte.Height:=474;
      bbtnOk1.Top:=405;
      bbtnCancela1.Top:=405;
   end
   else  // boton 2 al 5
   begin
      FReporte.Height:=354;
      bbtnOk1.Top:=284;
      bbtnCancela1.Top:=284;
   end;

   IF DMAF.wboton='1' then
   begin
      dblcCia.Visible:=True;
      pnlTipoDep.Visible:=False;
      pnlTipoDep.Enabled:=False;
      dblcTipAct.Enabled:=true;
      dblcLocal.Visible:=true;
      dblcUbica.Visible:=true;
      dbdtpFDesde.Enabled:=true;
      dbdtpFHasta.Enabled:=true;
      dblcdCCosId.Enabled:=true;
      dblcdCuenta.Enabled:=true;
      dbeDescrip.Enabled:=true;
      rgActivo.Enabled:=true;
      rgOrden.Enabled:=True;
      rgDepre.Enabled:=False;
      rgPrevio.Enabled:=False;
      dblcTipAct.Visible:=true;
      dblcLocal.Visible:=true;
      dblcUbica.Visible:=true;
      dbdtpFDesde.Visible:=true;
      dbdtpFHasta.Visible:=true;
      dblcdCCosId.Visible:=true;
      dblcdCuenta.Visible:=true;
      dbeDescrip.Visible:=true;
      rgActivo.Visible:=true;
      rgOrden.Visible:=True;
      rgDepre.Visible:=False;
      rgPrevio.Visible:=False;
      label1.Visible:=True;
      label2.Visible:=True;
      label4.Visible:=True;
      label3.Visible:=True;
      label6.Visible:=True;
      label7.Visible:=True;
      label5.Visible:=True;
      label8.Visible:=True;
      label10.Visible:=True;
      label11.Visible:=True;
   end
   else
   If DMAF.Wboton='2' then
   begin
      dblcCia.Visible:=True;
      dblcTipAct.Enabled:=True;
      dblcTipAct.Visible:=True;
      dblcTipAct.Top    :=66;
      dbdtpFHasta.Visible:=True;
      dbdtpFHasta.Enabled:=True;
      dbdtpFHasta.Top    :=96;
      dblcLocal.Visible:=True;
      dblcLocal.Visible:=True;
      dblcLocal.Top    :=126;

      pnlTipoDep.Visible:=False;
      pnlTipoDep.Enabled:=False;
      dblcUbica.Visible:=False;
      dbdtpFDesde.Enabled:=False;
      dblcdCCosId.Enabled:=False;
      dblcdCuenta.Enabled:=False;
      dbeDescrip.Enabled:=False;
      rgActivo.Enabled:=False;
      rgOrden.Enabled:=False;
      rgDepre.Enabled:=False;
      rgPrevio.Enabled:=False;
      dblcUbica.Visible:=False;
      dbdtpFDesde.Visible:=False;
      dblcdCCosId.Visible:=False;
      dblcdCuenta.Visible:=False;
      dbeDescrip.Visible:=False;
      rgActivo.Visible:=False;
      rgOrden.Visible:=False;
      rgDepre.Visible:=False;
      rgPrevio.Visible:=False;
      label1.Visible:=True;
      label2.Visible:=True;
      label2.Top:=70;
      label4.Visible:=False;
      label3.Visible:=True;
      label3.Top:=100;
      label6.Visible:=False;
      label7.Visible:=False;
      label5.Visible:=False;
      label8.Visible:=False;
      label10.Visible:=True;
      label10.Top:=130;
      label11.Visible:=False;
   end
   else
   begin
    // PRESENTA TIPOS DE DEPRECIACION ACTIVOS
    WSQL:= 'SELECT * FROM ACF104 WHERE';
    WSQL:=WSQL+' DEPFLAGACT='+''''+'A'+'''';
    DMAF.cdsUDEP.Close;
    DMAF.Dcom1.Appserver.EjecutaSQL(WSQL);
    DMAF.cdsUDEP.Open;
    pnlTipoDep.Visible:=True;
    pnlTipoDep.Enabled:=True;
    bbtnOk1.Visible:=False;
    bbtnOk1.Enabled:=False;
    rgPrevio.Visible:=False;
    rgPrevio.Enabled:=False
   end;

    wSQL:= 'Select * from ACF101 order by CIAID, TACFID';
    DMAF.cdsTipAct.Close;
    DMAF.cdsTipAct.DataRequest( wSQL );
    DMAF.cdsTipAct.Open;

   //Descripciones de Combos
   dbecia.visible    := dblcCia.Visible     ;
   dbetipact.visible := dblcTipAct.Visible  ;
   dbeLocal.Visible  := dblcLocal.Visible   ;
   dbeUbica.Visible  := dblcUbica.Visible   ;
   dbeCCosId.Visible := dblcdCCosId.Visible ;
   dbeCuenta.Visible := dblcdCuenta.Visible ;
/////////
   dbecia.top    := dblcCia.top     ;
   dbetipact.top := dblcTipAct.top  ;
   dbeLocal.top  := dblcLocal.top   ;
   dbeUbica.top  := dblcUbica.top   ;
   dbeCCosId.top := dblcdCCosId.top ;
   dbeCuenta.top := dblcdCuenta.top ;
/////////
   //fin de descripción de combos
   DMAF.cdsCia.IndexFieldNames := '' ;
   DMAF.cdsCia.Filtered := False     ;
   if not DMAF.cdsCia.Active then
      DMAF.cdsCia.Open ;
   if DMAF.cdsCia.RecordCount = 1 then
   begin
      dblcCia.Text := DMAF.cdsCia.fieldbyname('CIAID').AsString ;
      dbeCia.Text  := DMAF.cdsCia.fieldbyname('CIADES').AsString ;
      dblcCia.Enabled := False ;
   end ;
   self.SetFocus ;

   stCubrePantalla.Visible := false ;

//wmc0904   perform(CM_DialogKey,VK_TAB,0);
//

end;

procedure TFReporte.dbgTipoDepDblClick(Sender: TObject);
begin
   Label12.Caption    :=  DMAF.cdsUDep.FieldByName('DepDescri').Value;
   pplabel51.caption  :=  DMAF.cdsUDep.FieldByName('DepDescri').Value;
   pplabel52.caption  :=  DMAF.cdsUDep.FieldByName('DepDescri').Value;
   pplabel53.caption  :=  DMAF.cdsUDep.FieldByName('DepDescri').Value;
   pnlTipoDep.Visible :=  False ;
   pnlTipoDep.Enabled :=  False ;
   bbtnOk1.Visible    :=  True ;
   bbtnOk1.Enabled    :=  True ;
   rgPrevio.Visible   :=  True ;
   rgPrevio.Enabled   :=  True ;
   Label12.Visible    :=  True ;
   Label3.Caption     :=  'Depreciación al:' ;
   label1.Visible     :=  True ;
   dblcCia.Visible    :=  True ;

   If DMAF.Wboton='3' then
   begin
      dblcTipAct.Enabled:=True;
      dblcTipAct.Visible:=True;
      dblcTipAct.Top    :=66;
      dbdtpFHasta.Visible:=true;
      dbdtpFHasta.Enabled:=true;
      dbdtpFHasta.Top    :=96;
      dblcdCuenta.Visible:=True;
      dblcdCuenta.Enabled:=True;
      dblcdCuenta.Top    :=126;

      dblcLocal.Visible  :=False;
      dblcUbica.Visible  :=False;
      dbdtpFDesde.Enabled:=False;
      dblcdCCosId.Enabled:=False;
      dbeDescrip.Enabled :=False;
      rgActivo.Enabled   :=False;
      rgOrden.Enabled    :=False;
      rgDepre.Enabled    :=True;
      rgPrevio.Enabled   :=True;
      dblcLocal.Visible  :=False;
      dblcUbica.Visible  :=False;
      dbdtpFDesde.Visible:=False;
      dblcdCCosId.Visible:=False;
      dbeDescrip.Visible :=False;
      rgActivo.Visible   :=False;
      rgOrden.Visible    :=False;
      rgDepre.Visible    :=True;
      rgPrevio.Visible   :=True;
      label2.Visible     :=True;
      label2.Top:=71;
      label3.Visible     :=True;
      label3.Top:=101;
      label4.Visible     :=False;
      label5.Visible     :=False;
      label6.Visible     :=False;
      label7.Visible     :=True;
      label7.Top:=131;
      label8.Visible     :=False;
      label10.Visible    :=False;
      label11.Visible    :=False;
   end
   else
   begin
      dblcTipAct.Enabled:=True;
      dblcTipAct.Visible:=True;
      dblcTipAct.Top    :=66;
      dbdtpFHasta.Enabled:=true;
      dbdtpFHasta.Visible:=True;
      dbdtpFHasta.Top    :=96;
      dblcLocal.Enabled  :=true;
      dblcLocal.Visible  :=True;
      dblcLocal.Top      :=126;

      dblcUbica.Visible:=False;
      dbdtpFDesde.Enabled:=False;
      dblcdCCosId.Enabled:=False;
      dblcdCuenta.Enabled:=False;
      dbeDescrip.Enabled:=False;
      rgActivo.Enabled:=False;
      rgOrden.Enabled:=False;
      rgDepre.Enabled:=True;
      rgPrevio.Enabled:=True;
      dblcUbica.Visible:=False;
      dbdtpFDesde.Visible:=False;
      dblcdCCosId.Visible:=False;
      dblcdCuenta.Visible:=False;
      dbeDescrip.Visible:=False;
      rgActivo.Visible:=False;
      rgOrden.Visible:=False;
      rgDepre.Visible:=True;
      rgPrevio.Visible:=True;
      label2.Visible:=True;
      label2.Top:=71;
      label4.Visible:=False;
      label3.Visible:=True;
      label3.Top:=101;
      label6.Visible:=False;
      label7.Visible:=False;
      label5.Visible:=False;
      label8.Visible:=False;
      label10.Visible:=True;
      label10.Top:=131;
      label11.Visible:=False;
    end;
//////////////
   //Descripciones de Combos
   dbecia.visible    := dblcCia.Visible     ;
   dbetipact.visible := dblcTipAct.Visible  ;
   dbeLocal.Visible  := dblcLocal.Visible   ;
   dbeUbica.Visible  := dblcUbica.Visible   ;
   dbeCCosId.Visible := dblcdCCosId.Visible ;
   dbeCuenta.Visible := dblcdCuenta.Visible ;
/////////
   dbecia.top    := dblcCia.top     ;
   dbetipact.top := dblcTipAct.top  ;
   dbeLocal.top  := dblcLocal.top   ;
   dbeUbica.top  := dblcUbica.top   ;
   dbeCCosId.top := dblcdCCosId.top ;
   dbeCuenta.top := dblcdCuenta.top ;
/////////
   //fin de descripción de combos
//////////////
end;

// VARIABLES REPORTE3:
procedure TFReporte.ppVariable2Calc(Sender: TObject; var Value: Variant);
begin
     Value:=DMAF.cdsWork1.FieldByName('DEPVALAJUS').Value -
     DMAF.cdsWork1.FieldByName('ACFVALOMN').Value;
end;

procedure TFReporte.ppVariable5OldOnCalc(Sender: TObject);
begin
     PPVARIABLE5.Value:=DMAF.cdsWork1.FieldByName('DEPACUAJUS').Value -
     DMAF.cdsWork1.FieldByName('DEPACUHIST').Value;
end;

procedure TFReporte.ppVariable6OldOnCalc(Sender: TObject);
begin
     PPVARIABLE6.Value:=PPDBCALC5.Value - PPDBCALC45.Value;
end;

procedure TFReporte.ppVariable7OldOnCalc(Sender: TObject);
begin
     PPVARIABLE7.Value:=PPDBCALC43.Value - PPDBCALC46.Value;
end;

procedure TFReporte.ppVariable8OldOnCalc(Sender: TObject);
begin
     PPVARIABLE8.VALUE:=PPDBCALC48.Value - PPDBCALC1.Value;
end;

procedure TFReporte.ppVariable9OldOnCalc(Sender: TObject);
begin
     PPVARIABLE9.Value:=PPDBCALC3.Value - PPDBCALC2.Value;
end;

// Variables Reporte2
procedure TFReporte.ppVariable3OldOnCalc(Sender: TObject);
begin
     PPVARIABLE3.Value:=PPDBCALC11.Value + PPDBCALC12.Value -
     PPDBCALC13.Value;
end;

procedure TFReporte.ppVariable4OldOnCalc(Sender: TObject);
begin
     PPVARIABLE4.Value:=PPDBCALC8.Value + PPDBCALC7.Value -
     PPDBCALC9.Value;
end;

// Variables Reporte5
procedure TFReporte.ppVariable10OldOnCalc(Sender: TObject);
begin
     PPVARIABLE10.Value:=DMAF.cdsWork1.FieldByName('INIDEPRE').Value +
     DMAF.cdsWork1.FieldByName('PERDEPRE').Value;
end;

procedure TFReporte.ppVariable11OldOnCalc(Sender: TObject);
begin
     PPVARIABLE11.Value:=PPDBCALC20.Value + PPDBCALC22.Value;
end;

procedure TFReporte.ppVariable12OldOnCalc(Sender: TObject);
begin
     PPVARIABLE12.Value:=PPDBCALC15.Value + PPDBCALC17.Value;
end;

procedure TFReporte.ppVariable13OldOnCalc(Sender: TObject);
begin
     PPVARIABLE13.Value:=DMAF.cdsWork1.FieldByName('INIACT').Value -
     PPVARIABLE10.Value;
end;

procedure TFReporte.ppVariable14OldOnCalc(Sender: TObject);
begin
     PPVARIABLE14.Value:=PPDBCALC19.Value - PPVARIABLE11.Value;
end;

procedure TFReporte.ppVariable15OldOnCalc(Sender: TObject);
begin
     PPVARIABLE15.Value:=PPDBCALC14.Value - PPVARIABLE12.Value;
end;

// VARIABLES REPORTE4
procedure TFReporte.ppDBCalc25Calc(Sender: TObject);
begin
     PPDBCALC25.Value:=DMAF.cdsWork1.FieldByName('INIDEPRE').Value +
     DMAF.cdsWork1.FieldByName('PERDEPRE').Value;
end;

procedure TFReporte.ppDBCalc26Calc(Sender: TObject);
begin
     PPDBCALC26.Value:=DMAF.cdsWork1.FieldByName('INIACT').Value -
     PPDBCALC25.Value;
end;

procedure TFReporte.ppDBCalc4Calc(Sender: TObject);
begin
     PPDBCALC4.Value:=PPDBCALC23.Value + PPDBCALC6.Value;
end;

procedure TFReporte.ppDBCalc27Calc(Sender: TObject);
begin
     PPDBCALC27.Value:=PPDBCALC24.Value - PPDBCALC4.Value;
end;

procedure TFReporte.ppDBCalc32Calc(Sender: TObject);
begin
     PPDBCALC32.Value:=PPDBCALC28.Value + PPDBCALC31.Value;
end;

procedure TFReporte.ppDBCalc33Calc(Sender: TObject);
begin
     PPDBCALC33.Value:=PPDBCALC29.Value - PPDBCALC32.Value;
end;

procedure TFReporte.ppDBCalc38Calc(Sender: TObject);
begin
     PPDBCALC38.Value:=PPDBCALC35.Value + PPDBCALC37.Value;
end;

procedure TFReporte.ppDBCalc39Calc(Sender: TObject);
begin
     PPDBCALC39.Value:=PPDBCALC34.Value - PPDBCALC38.Value;
end;

procedure TFReporte.ppGroupFooterBand6AfterPrint(Sender: TObject);
begin
     PPDBCALC29.Value:= 0;
     PPDBCALC28.Value:= 0;
     PPDBCALC30.Value:= 0;
     PPDBCALC31.Value:= 0;
     PPDBCALC32.Value:= 0;
     PPDBCALC33.Value:= 0;

end;

procedure TFReporte.dblcLocalExit(Sender: TObject);
begin
   WSQL := 'LocId='+''''+dblclocal.Text+'''';
   xxcampo:=DMAF.DisplayDescrip('dspTGE','TGE126','*',WSQL,'LocDes');
   dbeLocal.Text := XXCAMPO ;
   If (Length(dblcLocal.Text)>0) and (Length(xxcampo)=0) then
   begin
      dblcLocal.SetFocus ;
      Raise exception.Create('Localidad no existe');
   end ;
end;

procedure TFReporte.dblcTipActxxExit(Sender: TObject);
begin
// Consistencia Cía-Tipo de activo y toma su descripción
    WSQL:='CiaId='''+dblcCia.Text+''' and TAcFId='''+dblcTipAct.Text+'''';
    xxcampo:=DMAF.DisplayDescrip('dspACF','ACF101','*',WSQL,'TAcFDes');
    dbeTipAct.Text := xxcampo ;
    if (Length(dblcTipAct.Text) > 0) and ( length ( xxcampo ) = 0 ) then
    begin
      dblcTipAct.SetFocus ;
      Raise exception.Create('Tipo de Activo no existe');
    end ;
end;

procedure TFReporte.pprReporte5PreviewFormCreate(Sender: TObject);
begin

  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  //INICIO SAR666
  //TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;
  //FIN SAR666

end;

procedure TFReporte.dblcdCCosIdExit(Sender: TObject);
begin
   WSQL:= 'CCosId='+''''+dblcdCCosId.Text+''''; // (ojo c/4 apóstrofes)
   xxcampo:=DMAF.DisplayDescrip('dspTGE','TGE203','*',WSQL,'CCosAbr');
   dbeCCosId.Text := XXCAMPO ;
   if (Length(dblcdCCosId.Text)>0) and (Length(xxcampo)=0) then
   begin
      dblcdCCosId.SetFocus ;
      Raise exception.Create('Centro de Costo no existe');
   end ;
end;

procedure TFReporte.dblcUbicaExit(Sender: TObject);
begin
   WSQL := 'Ubicid='+''''+dblcUbica.Text+'''';
   XXCAMPO:=DMAF.DisplayDescrip('dspTGE','TGE117','*',WSQL,'UBICABR');
   dbeUbica.Text := XXCAMPO ;
   If (Length(dblcUbica.Text)>0) and (Length(xxcampo)=0) then
   begin
      dblcUbica.SetFocus ;
      Raise exception.Create('Ubicación no existe');
   end ;
end;

procedure TFReporte.dblcCiaExit(Sender: TObject);
begin
{ Consistencia compañía y toma su descripción}
   WSQL := 'CiaId='+''''+dblcCia.Text+'''';
   XXCAMPO:=DMAF.DisplayDescrip('dspTGE','TGE101','*',WSQL,'CiaDes');
   If Length(XXCAMPO)=0 then
   begin
      dblcCia.SetFocus ;
      Raise exception.Create('Compañía no existe');
   end ;
   pplabel5.Caption:=XXCAMPO;
   pplabel11.Caption:=XXCAMPO;
   pplabel15.Caption:=XXCAMPO;
   pplabel18.Caption:=XXCAMPO;
   pplabel20.Caption:=XXCAMPO;
   pplabel23.Caption:=XXCAMPO;
end;

procedure TFReporte.dblcdCuentaExit(Sender: TObject);
begin
   WSQL:= 'CuentaId='''+dblcdCuenta.Text+''''; // se arma condición (ojo apóstrofe van c/4 apóstrofes)
   XXCAMPO:=DMAF.DisplayDescrip('dspTGE','TGE202','*',WSQL,'CtaAbr');
   dbeCuenta.Text := XXCAMPO ;
   If (Length(dblcdCuenta.Text)>0) and (Length(XXCAMPO)=0) then
   begin
      dblcdCuenta.SetFocus ;
      Raise exception.Create('Cuenta Contable no existe');
   end ;
end;

procedure TFReporte.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

procedure TFReporte.FormCreate(Sender: TObject);
begin
  if not dblcTipAct.LookupTable.Active then
     dblcTipAct.LookupTable.Open ;
end;

end.

