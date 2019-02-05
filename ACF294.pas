unit ACF294;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwmonthcalendar, Mask, wwdbedit, wwdbdatetimepicker,
  wwdblook, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DB, DBClient, wwClient,
  ppCache, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ppBands,oaContabiliza;

type
  TFContaREI = class(TForm)
    wMensaje2: TLabel;
    wMensaje3: TLabel;
    pnlCab: TPanel;
    Label2: TLabel;
    dblcdPeriodo: TwwDBLookupComboDlg;
    Panel2: TPanel;
    Z2bbtnContab: TBitBtn;
    bbtnBorra: TBitBtn;
    dbgConta: TwwDBGrid;
    bbtnOk: TBitBtn;
    Label34: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCiaDes: TEdit;
    pnlDatos: TPanel;
    lblTDiario: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    Label15: TLabel;
    dtpFComp: TwwDBDateTimePicker;
    lblNoReg: TLabel;
    meNoReg: TwwDBEdit;
    Label56: TLabel;
    dbeCambio: TwwDBEdit;
    lblCNT: TLabel;
    Z2bbtnPreview: TBitBtn;
    pprAsiento: TppReport;
    ppdbAsiento: TppDBPipeline;
    procedure dbgTipoDepDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dtpFCompExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure dbeCambioExit(Sender: TObject);
    procedure bbtnBorraClick(Sender: TObject);
    procedure Z2bbtnPreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure GrabaPrevio;
  public
    { Public declarations }
         ximporte:string;
  end;

var
  FContaREI: TFContaREI;
  wSql, wFaperiodo : string;

implementation

uses ACFDM, oaAF3000, ACF292;

{$R *.DFM}
//{$I OPER.PAS}

procedure TFContaREI.FormActivate(Sender: TObject);
begin
end;

// GRID DE SELECCION DE TIPOS
procedure TFContaREI.dbgTipoDepDblClick(Sender: TObject);
begin
end;

// LOOKUP de periodo , PROCESO PRELIMINAR.
procedure TFContaREI.bbtnOkClick(Sender: TObject);
var
   xSQL : String;
   xWhere: String;
begin

   if edtCiaDes.text='' then begin
      dblcCia.SetFocus;
      ShowMessage( 'Error :  Falta Compañía' );
   end;

   if Length(dblcdPeriodo.text)<6 then begin
      dblcdPeriodo.SetFocus;
      ShowMessage( 'Error :  Periodo Errado' );
   end;

   if (SRV_D = 'DB2NT') then
   begin
      xSQL:='Select A.CIAID, A.CUENTAID CTAORI, B.CTADES CTADESORI, D.REIAJUSTE CUENTAID, A.CCOSID, '
        +  'CASE WHEN SUM(ACFREIPERI)<0  THEN ''D'' ELSE ''H'' END DH, '
        +  'CASE WHEN SUM(ACFREIPERI)<0  THEN SUM(ACFREIPERI)*(-1) ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(ACFREIPERI)>=0 THEN SUM(ACFREIPERI)      ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +  'Left Join TGE202 B ON ( B.CIAID =A.CIAID AND B.CUENTAID=A.CUENTAID ) '
        +  'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +  'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REIAJUSTE ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        //+  ' and A.CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.CUENTAID, B.CTADES, D.REIAJUSTE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.CUENTAID CTAORI, B.CTADES CTADESORI, D.REIDEPRE CUENTAID, A.CCOSID, '
        +  'CASE WHEN SUM(ACFREIDEPR)<0  THEN ''H'' ELSE ''D'' END DH, '
        +  'CASE WHEN SUM(ACFREIDEPR)>=0 THEN SUM(ACFREIDEPR)      ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(ACFREIDEPR)<0  THEN SUM(ACFREIDEPR)*(-1) ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +  'Left Join TGE202 B ON ( B.CIAID =A.CIAID AND B.CUENTAID=A.CUENTAID ) '
        +  'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +  'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REIDEPRE ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        //+  ' and A.CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.CUENTAID, B.CTADES, D.REIDEPRE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.CUENTAID CTAORI, B.CTADES CTADESORI, D.REI CUENTAID, '''' CCOSID, '
        +  'CASE WHEN SUM(ACFREIPERI)<0  THEN ''H'' ELSE ''D'' END DH, '
        +  'CASE WHEN SUM(ACFREIPERI)>=0  THEN (-1)*(SUM(ACFREIPERI)*(-1))-(SUM(ACFREIDEPR)*(-1))  ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(ACFREIPERI)<0 THEN (-1)*(SUM(ACFREIPERI)-SUM(ACFREIDEPR)) ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +  'Left Join TGE202 B ON ( B.CIAID =A.CIAID AND B.CUENTAID=A.CUENTAID ) '
        +  'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +  'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REI ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        //+  ' and A.CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.CUENTAID, B.CTADES, D.REI, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 ';

   {
   xSQL:='Select A.CIAID, A.CUENTAID CTAORI, A.TACFID, B.TACFDES, D.REIAJUSTE CUENTAID, A.CCOSID, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0  THEN ''D'' ELSE ''H'' END DH, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0  THEN round(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),2) ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)<0  THEN round(SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS),2)  ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +  'Left Join ACF202 B ON ( B.CIAID =A.CIAID AND B.CUENTAID=A.CUENTAID ) '
        +  'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +  'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REIAJUSTE ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        +  ' and CUENTAID=''1811010100000000'' '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.REIAJUSTE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.TACFID, B.TACFDES, D.REIDEPRE CUENTAID, A.CCOSID, '
        +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0  THEN ''H'' ELSE ''D'' END DH, '
        +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN ROUND(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS),2) ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0  THEN ROUND(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),2) ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +'Left Join ACF101 B ON ( B.TACFID=A.TACFID ) '
        +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REIDEPRE ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        +  ' and CUENTAID=''1811010100000000'' '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.REIDEPRE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.TACFID, B.TACFDES, D.REI CUENTAID, '''' CCOSID, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0  THEN ''H'' ELSE ''D'' END DH, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)<0  THEN ROUND((SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS)),2)-ROUND((SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)),2) ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0 THEN  ROUND((SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)),2)-ROUND((SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)),2) ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +'Left Join ACF101 B ON ( B.TACFID=A.TACFID ) '
        +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REI ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        +  ' and CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.REI, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 ';
        }
   end;

   If  (SRV_D = 'DB2400') then
   Begin
   xSQL:='Select A.CIAID, A.CUENTAID CTAORI, B.CTADES CTADESORI, D.REIAJUSTE CUENTAID, A.CCOSID, '
        +  'CASE WHEN SUM(ACFREIPERI)<0  THEN ''D'' ELSE ''H'' END DH, '
        +  'CASE WHEN SUM(ACFREIPERI)<0  THEN SUM(ACFREIPERI)*(-1) ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(ACFREIPERI)>=0 THEN SUM(ACFREIPERI)      ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +  'Left Join TGE202 B ON ( B.CIAID =A.CIAID AND B.CUENTAID=A.CUENTAID ) '
        +  'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +  'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REIAJUSTE ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        //+  ' and A.CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.CUENTAID, B.CTADES, D.REIAJUSTE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.CUENTAID CTAORI, B.CTADES CTADESORI, D.REIDEPRE CUENTAID, A.CCOSID, '
        +  'CASE WHEN SUM(ACFREIDEPR)<0  THEN ''H'' ELSE ''D'' END DH, '
        +  'CASE WHEN SUM(ACFREIDEPR)>=0 THEN SUM(ACFREIDEPR)      ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(ACFREIDEPR)<0  THEN SUM(ACFREIDEPR)*(-1) ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +  'Left Join TGE202 B ON ( B.CIAID =A.CIAID AND B.CUENTAID=A.CUENTAID ) '
        +  'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +  'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REIDEPRE ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        //+  ' and A.CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.CUENTAID, B.CTADES, D.REIDEPRE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.CUENTAID CTAORI, B.CTADES CTADESORI, D.REI CUENTAID, '''' CCOSID, '
        +  'CASE WHEN SUM(ACFREIPERI)<0  THEN ''H'' ELSE ''D'' END DH, '
        +  'CASE WHEN SUM(ACFREIPERI)>=0  THEN (-1)*(SUM(ACFREIPERI)*(-1))-(SUM(ACFREIDEPR)*(-1))  ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(ACFREIPERI)<0 THEN (-1)*(SUM(ACFREIPERI)-SUM(ACFREIDEPR)) ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +  'Left Join TGE202 B ON ( B.CIAID =A.CIAID AND B.CUENTAID=A.CUENTAID ) '
        +  'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +  'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REI ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        //+  ' and A.CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.CUENTAID, B.CTADES, D.REI, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 ';


   {
   xSQL:='Select A.CIAID, A.TACFID, B.TACFDES, D.REIAJUSTE CUENTAID, A.CCOSID, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0  THEN ''D'' ELSE ''H'' END DH, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0  THEN '
//*        +  ' round(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),2) '
        + '  case when (dec(( SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST) )*power(10,2),15,2)-int(( SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST) )*power(10,2)))*10>=5 '
        + '    then dec(( SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST) ),15,2)+1/power(10,2) else dec(( SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST) ),15,2) end  '
        +  ' ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)<0 THEN '
//*        +  ' round(SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS),2)  '
        + ' case when (dec(( SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS) )*power(10,2),15,2)-int(( SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS) ),15,2)+1/power(10,2) else dec(( SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS) ),15,2) end '
        +  ' ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +'Left Join ACF101 B ON ( B.TACFID=A.TACFID ) '
        +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REIAJUSTE ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        +  ' and A.CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.REIAJUSTE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.TACFID, B.TACFDES, D.REIDEPRE CUENTAID, A.CCOSID, '
        +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0  THEN ''H'' ELSE ''D'' END DH, '
        +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN '
//*        +  '  ROUND(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS),2) '
        + ' case when (dec(( SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) )*power(10,2),15,2)-int(( SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ),15,2)+1/power(10,2) else dec(( SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ),15,2) end '
        +  ' ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0  THEN '
//*        +  ' ROUND(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),2) '
        + ' case when (dec(( SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) )*power(10,2),15,2)-int(( SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) ),15,2)+1/power(10,2) else dec(( SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) ),15,2) end '
        +  ' ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +'Left Join ACF101 B ON ( B.TACFID=A.TACFID ) '
        +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REIDEPRE ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        +  ' and A.CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.REIDEPRE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.TACFID, B.TACFDES, D.REI CUENTAID, '''' CCOSID, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0  THEN ''H'' ELSE ''D'' END DH, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)<0  THEN '
//*        +  ' ROUND((SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS)),2)- '
        + ' (case when (dec(( SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS) )*power(10,2),15,2)-int(( SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS) ),15,2)+1/power(10,2) else dec(( SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS) ),15,2) end)- '
//*        +  ' ROUND((SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)),2) '
        + ' (case when (dec(( SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) )*power(10,2),15,2)-int(( SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ),15,2)+1/power(10,2) else dec(( SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ),15,2) end) '
        +  ' ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0 THEN  '
//*        +  ' ROUND((SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)),2)- '
        + ' (case when (dec(( SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST) )*power(10,2),15,2)-int(( SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST) ),15,2)+1/power(10,2) else dec(( SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST) ),15,2) end)- '
//*        +  ' ROUND((SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)),2) '
        + ' (case when (dec(( SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) )*power(10,2),15,2)-int(( SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) ),15,2)+1/power(10,2) else dec(( SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) ),15,2) end) '
        +  ' ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +'Left Join ACF101 B ON ( B.TACFID=A.TACFID ) '
        +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REI ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        +  ' and A.CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.REI, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 ';
     }
   End;

   if (SRV_D = 'ORACLE') then
   begin
   xSQL:='Select A.CIAID, A.CUENTAID CTAORI, B.CTADES CTADESORI, D.REIAJUSTE CUENTAID, A.CCOSID, '
        +  'CASE WHEN SUM(ACFREIPERI)<0  THEN ''D'' ELSE ''H'' END DH, '
        +  'CASE WHEN SUM(ACFREIPERI)<0  THEN SUM(ACFREIPERI)*(-1) ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(ACFREIPERI)>=0 THEN SUM(ACFREIPERI)      ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A, TGE202 B, ACF110 D, TGE202 C '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        //+  ' and A.CUENTAID=''1815010100000000'' '
        +  'AND ( B.CIAID(+) =A.CIAID AND B.CUENTAID(+)=A.CUENTAID ) '
        +  'AND ( D.CUENTAID(+)=A.CUENTAID ) '
        +  'AND ( C.CIAID(+) =D.CIAID AND C.CUENTAID(+)=D.REIAJUSTE ) '
        +'Group by A.CIAID, A.CUENTAID, B.CTADES, D.REIAJUSTE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.CUENTAID CTAORI, B.CTADES CTADESORI, D.REIDEPRE CUENTAID, A.CCOSID, '
        +  'CASE WHEN SUM(ACFREIDEPR)<0  THEN ''H'' ELSE ''D'' END DH, '
        +  'CASE WHEN SUM(ACFREIDEPR)>=0 THEN SUM(ACFREIDEPR)      ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(ACFREIDEPR)<0  THEN SUM(ACFREIDEPR)*(-1) ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A, TGE202 B, ACF110 D, TGE202 C '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        //+  ' and A.CUENTAID=''1815010100000000'' '
        +  'AND ( B.CIAID(+) =A.CIAID AND B.CUENTAID(+)=A.CUENTAID ) '
        +  'AND ( D.CUENTAID(+)=A.CUENTAID ) '
        +  'AND ( C.CIAID(+) =D.CIAID AND C.CUENTAID(+)=D.REIDEPRE ) '
        +'Group by A.CIAID, A.CUENTAID, B.CTADES, D.REIDEPRE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.CUENTAID CTAORI, B.CTADES CTADESORI, D.REI CUENTAID, '''' CCOSID, '
        +  'CASE WHEN SUM(ACFREIPERI)<0  THEN ''H'' ELSE ''D'' END DH, '
        +  'CASE WHEN SUM(ACFREIPERI)>=0  THEN (-1)*(SUM(ACFREIPERI)*(-1))-(SUM(ACFREIDEPR)*(-1))  ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(ACFREIPERI)<0 THEN (-1)*(SUM(ACFREIPERI)-SUM(ACFREIDEPR)) ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A, TGE202 B, ACF110 D, TGE202 C '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        //+  ' and A.CUENTAID=''1815010100000000'' '
        +  'AND ( B.CIAID(+) =A.CIAID AND B.CUENTAID(+)=A.CUENTAID ) '
        +  'AND ( D.CUENTAID(+)=A.CUENTAID ) '
        +  'AND ( C.CIAID(+) =D.CIAID AND C.CUENTAID(+)=D.REI ) '
        +'Group by A.CIAID, A.CUENTAID, B.CTADES, D.REI, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 ';

   {
   xSQL:='Select A.CIAID, A.TACFID, B.TACFDES, D.REIAJUSTE CUENTAID, A.CCOSID, '
        +  'Decode( least(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0 ),0, ''D'', ''H'' ) DH, '
        +  'Decode( least(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0 ),0, SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0) DEBE, '
        +  'Decode( greatest(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0), 0, SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS),0) HABER, C.CTADES '
        +'From ACF204 A, ACF101 B, ACF110 D, TGE202 C '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +   ' ( B.TACFID=A.TACFID(+) ) and '
        +   ' ( D.CUENTAID(+)=A.CUENTAID ) and '
        +   ' ( C.CIAID=A.CIAID AND C.CUENTAID=D.REIAJUSTE ) '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.REIAJUSTE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.TACFID, B.TACFDES, D.REIDEPRE CUENTAID, A.CCOSID, '
        +   'Decode( least(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0 ),0, ''H'', ''D'' ) DH, '
        +   ' Decode( GREATEST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0 ),0, SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS),0 ) DEBE, '
        +   'Decode( LEAST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0), 0, SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0 ) HABER, C.CTADES '
        +'From ACF204 A, ACF101 B, ACF110 D, TGE202 C '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +   ' ( B.TACFID=A.TACFID(+) ) and '
        +   ' ( D.CUENTAID(+)=A.CUENTAID ) and '
        +   ' ( C.CIAID=A.CIAID AND C.CUENTAID=D.REIDEPRE ) '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.REIDEPRE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'UNION '

        +'Select A.CIAID, A.TACFID, B.TACFDES, D.REI CUENTAID, '''' CCOSID, '
        +  'Decode( least(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0 ),0, ''H'', ''D'' ) DH, '
        +  'Decode( GREATEST(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0 ),0, (SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS))-(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)),0 ) DEBE, '
        +  'Decode( LEAST(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0), 0, (SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST))-(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)),0 ) HABER, C.CTADES '
        +'From ACF204 A, ACF101 B, ACF110 D, TGE202 C '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +   ' ( B.TACFID=A.TACFID(+) ) and '
        +   ' ( D.CUENTAID(+)=A.CUENTAID ) and '
        +   ' ( C.CIAID=A.CIAID AND C.CUENTAID=D.REI ) '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.REI, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 ';
    }
   end;
   DMAF.cdsTrasSel.Close;
   DMAF.cdsTrasSel.DataRequest( xSQL );
   DMAF.cdsTrasSel.Open;

   if DMAF.cdsTrasSel.RecordCount=0 then begin
      dblcdPeriodo.SetFocus;
      ShowMessage('No Existen Registros para el Periodo');
      Exit;
   end;

   DMAF.cdsTrasSel.IndexFieldNames:='CIAID;CTAORI;DH;CUENTAID';

   dbgConta.Selected.Clear;
   dbgConta.Selected.Add('CTAORI'#9'18'#9'Cuenta~Origen'#9'F');
   dbgConta.Selected.Add('CTADESORI'#9'40'#9'Descripción'#9'F');
   dbgConta.Selected.Add('CUENTAID'#9'18'#9'Cuenta~Contable'#9'F');
   dbgConta.Selected.Add('CCOSID'#9'10'#9'Centro~Costo'#9'F');
   dbgConta.Selected.Add('DEBE'#9'16'#9'Debe'#9'F');
   dbgConta.Selected.Add('HABER'#9'16'#9'Haber'#9'F');

   TNumericField( DMAF.cdsTrasSel.FieldByName('DEBE') ).DisplayFormat:='###,###,##0.00';
   TNumericField( DMAF.cdsTrasSel.FieldByName('HABER') ).DisplayFormat:='###,###,##0.00';

   dbgConta.ColumnByName('DEBE').FooterValue:=FLOATTOSTRF( DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEBE)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('HABER').FooterValue:=FLOATTOSTRF( DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(HABER)', ''),ffNumber,15,2 );

   lblCNT.Visible       :=False;
   pnlDatos.Enabled     :=True;
   Z2bbtnContab.Enabled      :=True;
   bbtnBorra.Enabled    :=True;
   Z2bbtnPreview.Enabled:=True;

   dtpFComp.Date:= StrToDate( '28/'+Copy(dblcdPeriodo.Text,5,2)+'/'+Copy(dblcdPeriodo.Text,1,4) );

   if DMAF.cdsTrasPen.FieldByName('FLREI').AsString='S' then begin
      xSQL:='SELECT * FROM ACF306 '
           +'WHERE CIAID='''   +dblcCia.text     +''' and '
           +      'CNTANOMM='''+dblcdPeriodo.Text+''' and CNTLOTE=''REI'' ';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
      DMAF.cdsQry.Open;

      dblcTDiario.text:=DMAF.cdsQry.FieldByname('TDIARID').AsString;
      dtpFComp.Date   :=DMAF.cdsQry.FieldByname('CNTFCOMP').Value;
      meNoReg.text    :=DMAF.cdsQry.FieldByname('CNTCOMPROB').AsString;
      dbeCambio.text  :=DMAF.cdsQry.FieldByname('CNTTCAMBIO').AsString;
      xWhere:='TDIARID='''+DMAF.cdsQry.FieldByname('TDIARID').AsString+'''';
      edtTDiario.Text :=DMAF.DisplayDescrip('dspTGE','TGE104','*',xWhere,'TDIARDES');
      lblCNT.Visible       :=True;
      pnlDatos.Enabled     :=False;
      Z2bbtnContab.Enabled      :=False;
      bbtnBorra.Enabled    :=False;
   end;

end;


procedure TFContaREI.dblcTDiarioExit(Sender: TObject);
var
   xWhere : String;
begin
   if not bbtnBorra.Focused then begin

      xWhere:='TDiarId='+''''+dblcTDiario.Text+'''';
      edtTDiario.Text:=DMAF.DisplayDescrip('dspTGE','TGE104','*',xWhere,'TDiarDes');
      if length(edtTDiario.Text)=0 then
      begin
         ShowMessage('Falta Tipo de Diario');
         dblcTDiario.SetFocus;
      end;
   end;

end;

procedure TFContaREI.dtpFCompExit(Sender: TObject);
var
   xSQL, xWhere : String;
begin

   if length(edtTDiario.Text)>0 then begin

      xSQL:='';
      xSQL:='Select MAX( CNTCOMPROB ) NUMERO From CNT300 '
           +'Where CIAID='   +''''+dblcCia.Text     +''' and '
           +      'TDIARID=' +''''+dblcTDiario.text +''' and '
           +      'CNTANOMM='+''''+dblcdPeriodo.text+''' ';

      DMAF.cdsQry.Close;
      DMAF.cdsQry.ProviderName:= 'dspTGE';
      DMAF.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
      DMAF.cdsQry.Open;
      if DMAF.cdsQry.FieldByName('NUMERO').AsString='' then
         meNoReg.Text:=DMAF.StrZero( 1, 10 )
      else begin
         meNoReg.Text:=DMAF.StrZero( StrtoInt(DMAF.cdsQry.FieldByName('NUMERO').AsString)+1, 10 );
      end;

      xWhere := 'TMonId='+''''+DMAF.wTMonExt+''''+' and '
              + 'Fecha='+DMAF.wRepFuncDate+''''+ FORMATDATETIME(DMAF.wFormatFecha,dtpFComp.Date)+''')';
      if length( DMAF.DisplayDescrip('dspTGE','TGE107','*',xWhere,'TMONID'))>0 then
         dbeCambio.Text:=FloattoStr(DMAF.cdsQry.fieldbyname('TCam'+DMAF.wVRN_TipoCambio).AsFloat)
      else begin
         dbeCambio.Text:='0';
      end;

   end;

end;



procedure TFContaREI.FormShow(Sender: TObject);
var
   xSQL : String;
begin
    wSQL:='SELECT FAPERIODO, FLREI FROM ACF102 '
         +'WHERE FAPROC=''P'' '
         +'ORDER BY FAPERIODO' ;
    DMAF.cdsTrasPen.Close;
    DMAF.cdsTrasPen.DataRequest(wSQL);
    DMAF.cdsTrasPen.Open;

    wSQL:='SELECT * FROM ACF306 '
         +'WHERE CNTANOMM=''AAAAMM'' ';
    DMAF.cdsACFCont.Close;
    DMAF.cdsACFCont.DataRequest(wSQL);
    DMAF.cdsACFCont.Open;

   xSQL:='Select A.CIAID, A.TACFID, '''' TACFDES, '''' CUENTAID, '''' CCOSID, '
        +' '' '' DH, 0 DEBE, 0 HABER '
        +'From ACF204 A '
        +'Where A.FAPERIODO=''AAAAMM'' ';

   DMAF.cdsTrasSel.Close;
   DMAF.cdsTrasSel.DataRequest( xSQL );
   DMAF.cdsTrasSel.Open;

   pnlCab.Enabled   :=True;
   lblCNT.Visible   :=False;
   pnlDatos.Enabled :=False;
   Z2bbtnContab.Enabled  :=False;
   bbtnBorra.Enabled:=False;

   dbgConta.Selected.Clear;
   dbgConta.Selected.Add('CTAORI'#9'18'#9'Cuenta~Origen'#9'F');
   dbgConta.Selected.Add('CTADESORI'#9'40'#9'Descripción'#9'F');
   dbgConta.Selected.Add('CUENTAID'#9'18'#9'Cuenta~Contable'#9'F');
   dbgConta.Selected.Add('CCOSID'#9'10'#9'Centro~Costo'#9'F');
   dbgConta.Selected.Add('DEBE'#9'16'#9'Debe'#9'F');
   dbgConta.Selected.Add('HABER'#9'16'#9'Haber'#9'F');
end;

procedure TFContaREI.dblcCiaExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere:='CIAID='''+dblcCia.Text+'''';
   edtCiaDes.Text:=BuscaDescripcion( DMAF.cdsCia, xWhere, 'CiaDes');
   if edtCiaDes.Text='' then begin
      dblcCia.SetFocus;
      Raise Exception.Create('Error : Compañía no Valida');
   end;
end;

procedure TFContaREI.Z2bbtnContabClick(Sender: TObject);
var
   xSQL  : String;
   xTCam : Double;
begin
   if MessageDlg('¿ Esta Seguro de Contabilizar ?', mtconfirmation,[mbYes,MbNo],0)=mrYes then
   begin
      if  length(dblcTDiario.text)=0 then
      begin
         dblcTDiario.SetFocus;
         Raise Exception.Create('Debe seleccionar el Tipo de Diario');
      end;
      if  length(meNoReg.text)=0 then
      begin
         dtpFComp.SetFocus;
         Raise Exception.Create('Debe seleccionar la fecha del Comprobante');
      end;

      DMAF.cdsTrasPen.Edit;
      DMAF.cdsTrasPen.FieldByname('FLREI').AsString:='S';

      GrabaPrevio;

//      DMAF.GeneraContabilidad(dblcCia.Text,dblcTDiario.Text,dblcdPeriodo.Text,meNoReg.Text, Self, Sender );

      wSQL:='UPDATE ACF102 SET FLREI=''S'' '
           +'WHERE FAPERIODO='''+dblcdPeriodo.Text+'''';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(WSQL); // Llamada remota al provider del servidor
      DMAF.cdsQry.Execute;


      lblCNT.Visible       :=True;
      pnlDatos.Enabled     :=False;
      Z2bbtnContab.Enabled      :=False;
      pnlCab.Enabled       :=False;
      Z2bbtnPreview.Enabled:=True;
      ShowMessage('Contabilización OK');
   end;
end;

procedure TFContaREI.dbeCambioExit(Sender: TObject);
begin
   if dbeCambio.text='' then
   begin
      dbeCambio.SetFocus;
      ShowMessage('Error en Tipo de Cambio');
   end;
end;


procedure TFContaREI.bbtnBorraClick(Sender: TObject);
begin
   Close;
end;


procedure TFContaREI.Z2bbtnPreviewClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
   xsql : String;

begin
   ximporte:='imprimir';
   if DMAF.cdsTrasPen.FieldByName('FLREI').AsString<>'S' then
      GrabaPrevio;

   with Comprobante do begin
      CIAID    := dblcCia.Text ;
      TDIARID  := dblcTDiario.Text ;
      CiaDes   := edtCiaDes.Text;
      Diario   := edtTDiario.Text ;
      Proveedor:= '';
      Glosa    := 'Depreciación Activos Periodo '+dblcdPeriodo.Text;
      Lote     := 'REI';
      TipoDoc  := '';
      TipoCamb := dbeCambio.Text ;
      Periodo  := dblcdPeriodo.Text ;
      NoComp   := meNoReg.Text ;
      NoDoc    := '';
      Cuenta   := '';
      Banco    := '';
      NumChq   := '';
      Moneda   := 'Soles';
      Importe  := FloattoStr(DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEBE)', ''));
      Tmoneda  := 'L';
   end;

   FVoucherImp:=TFVoucherImp.Create(Application);     // ACF292
   FVoucherImp.wBienedeForma := 'EGRESO';
   FVoucherImp.wComprobanteI:=Comprobante;
   with FVoucherImp do
   Try
      ShowModal;//ActiveMDIChild;
   Finally
   End;

end;


procedure TFContaREI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMAF.cdsTrasSel.IndexFieldNames:='';
   DMAF.cdsTrasSel.Close;
   DMAF.cdsTrasPen.Filtered:=False;
   DMAF.cdsTrasPen.Filter  :='';
   DMAF.cdsTrasPen.Close; DMAF.cdsTDiario.Close;
   Action:=caFree;
end;


procedure TFContaREI.GrabaPrevio;
var
   xSQL   : String;
   xTCam  : Double;
   xWhere : String;
   xCNTReg, xCon : Integer;
begin
      xSQL:='DELETE FROM ACF306 '
           +'WHERE CIAID='''   +dblcCia.Text     +''' and '
           +      'CNTANOMM='''+dblcdPeriodo.Text+''' and '
           +      'CNTLOTE=''REI'' ';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest( xSQL );
      try
        DMAF.cdsQry.Execute;
      except
      end;

      if dbeCambio.Text='' then begin
         xWhere := 'TMonId='+''''+DMAF.wTMonExt+''''+' and '
                 + 'Fecha='+DMAF.wRepFuncDate+''''+ FORMATDATETIME(DMAF.wFormatFecha,dtpFComp.Date)+''')';
         if length( DMAF.DisplayDescrip('dspTGE','TGE107','*',xWhere,'TMONID'))>0 then
            dbeCambio.Text:=FloattoStr(DMAF.cdsQry.fieldbyname('TCam'+DMAF.wVRN_TipoCambio).AsFloat)
         else begin
            dbeCambio.Text:='0';
         end;
      end;

      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
          xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
             +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+''')';
      end;
      if (SRV_D = 'ORACLE') then
      begin
          xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
             +'TO_DATE('''+FORMATDATETIME(DMAF.wFormatFecha,dtpFComp.Date)+''')';
      end;
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest( xSQL );
      DMAF.cdsQry.Open;

      xTCam:=StrToFloat( dbeCambio.Text );

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
///////////////////// NUEVO CALCULO DEL REI
      xSQL:='Insert Into ACF306 ( CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTFCOMP, '
           +   'CUENTAID, CNTGLOSA, CCOSID, CNTDH, TMONID, CNTTCAMBIO, '
           +   'CNTLOTE, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
           +   'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
           +   'CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
           +   'CNTAASS, CNTUSER, CNTFREG, CNTHREG, TDIARDES ) '
           +'Select A.CIAID, '''+dblcTDiario.Text+''', '''+meNoreg.Text+''', '
               +''''+dblcdPeriodo.text+''', DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+'''), '
               +'D.REIAJUSTE CUENTAID, ''Asiento del R.E.I. Periodo '+dblcdPeriodo.Text+''', '
               +'A.CCOSID, '
               +  'CASE WHEN SUM(ACFREIPERI)<0  THEN ''D'' ELSE ''H'' END DH, '
               +''''+DMAF.wTMonLoc+''', '+FloatToStr(xTcam)+', ''REI'', '
               +  'CASE WHEN SUM(ACFREIPERI)<0  THEN SUM(ACFREIPERI)*(-1) ELSE SUM(ACFREIPERI) END, '
               +  'CASE WHEN SUM(ACFREIPERI)<0  THEN SUM(ACFREIPERI)*(-1) ELSE SUM(ACFREIPERI) END, '
               +  '0, '
               +  'CASE WHEN SUM(ACFREIDEPR)>=0 THEN SUM(ACFREIDEPR)      ELSE 0 END DEBE, '
               +  '0, '
               +  'CASE WHEN SUM(ACFREIDEPR)<0  THEN SUM(ACFREIDEPR)*(-1) ELSE 0 END HABER, '
               +  '0, '
               +''''+DMAF.cdsQry.FieldByName('FECANO').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECMES').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECDIA').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECTRIM').AsString +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSEM').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSS').AsString   +''', '
               +''''+DMAF.cdsQry.FieldByName('FECAATRI').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASEM').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASS').AsString +''', '
               +''''+DMAF.wUsuario+''', CURRENT DATE, CURRENT TIME, MAX(A.CUENTAID) '
           +'From ACF204 A '
           +  'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
           +'Group by A.CIAID, D.REIAJUSTE, A.CCOSID'
           +'Having SUM(A.DEPIMPAJUS)>0 '

           +'Union '

           +'Select A.CIAID, '''+dblcTDiario.Text+''', '''+meNoreg.Text+''', '
               +''''+dblcdPeriodo.text+''', DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+'''), '
               +'D.REIDEPRE CUENTAID, ''Asiento del R.E.I. Periodo '+dblcdPeriodo.Text+''', '
               +'A.CCOSID, '
               +  'CASE WHEN SUM(ACFREIDEPR)<0  THEN ''H'' ELSE ''D'' END DH, '
               +''''+DMAF.wTMonLoc+''', '+FloatToStr(xTcam)+', '
               +'''REI'', '
               +  'CASE WHEN SUM(ACFREIDEPR)>=0 THEN SUM(ACFREIDEPR) ELSE SUM(ACFREIDEPR)*(-1) END DEBE, '
               +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ELSE SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) END, '
               +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ELSE SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) END, '
               +  '0, '
               +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ELSE 0 END DEBE, '
               +  '0, '
               +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0  THEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) ELSE 0 END HABER, '
               +  '0, '
               +''''+DMAF.cdsQry.FieldByName('FECANO').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECMES').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECDIA').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECTRIM').AsString +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSEM').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSS').AsString   +''', '
               +''''+DMAF.cdsQry.FieldByName('FECAATRI').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASEM').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASS').AsString +''', '
               +''''+DMAF.wUsuario+''', CURRENT DATE, CURRENT TIME, MAX(A.CUENTAID) '

        +  'CASE WHEN SUM(ACFREIDEPR)>=0 THEN SUM(ACFREIDEPR)      ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(ACFREIDEPR)<0  THEN SUM(ACFREIDEPR)*(-1) ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +  'Left Join TGE202 B ON ( B.CIAID =A.CIAID AND B.CUENTAID=A.CUENTAID ) '
        +  'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +  'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REIDEPRE ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        //+  ' and A.CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.CUENTAID, B.CTADES, D.REIDEPRE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.CUENTAID CTAORI, B.CTADES CTADESORI, D.REI CUENTAID, '''' CCOSID, '
        +  'CASE WHEN SUM(ACFREIPERI)<0  THEN ''H'' ELSE ''D'' END DH, '
        +  'CASE WHEN SUM(ACFREIPERI)>=0  THEN (-1)*(SUM(ACFREIPERI)*(-1))-(SUM(ACFREIDEPR)*(-1))  ELSE 0 END DEBE, '
        +  'CASE WHEN SUM(ACFREIPERI)<0 THEN (-1)*(SUM(ACFREIPERI)-SUM(ACFREIDEPR)) ELSE 0 END HABER, C.CTADES '
        +'From ACF204 A '
        +  'Left Join TGE202 B ON ( B.CIAID =A.CIAID AND B.CUENTAID=A.CUENTAID ) '
        +  'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +  'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.REI ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        //+  ' and A.CUENTAID=''1815010100000000'' '
        +'Group by A.CIAID, A.CUENTAID, B.CTADES, D.REI, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 ';

//////////////////////
      xSQL:='Insert Into ACF306 ( CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTFCOMP, '
           +   'CUENTAID, CNTGLOSA, CCOSID, CNTDH, TMONID, CNTTCAMBIO, '
           +   'CNTLOTE, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
           +   'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
           +   'CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
           +   'CNTAASS, CNTUSER, CNTFREG, CNTHREG, TDIARDES ) '


           +'Select A.CIAID, '''+dblcTDiario.Text+''', '''+meNoreg.Text+''', '
               +''''+dblcdPeriodo.text+''', DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+'''), '
               +'D.REIDEPRE CUENTAID, ''Asiento del R.E.I. Periodo '+dblcdPeriodo.Text+''', '
               +'A.CCOSID, '
               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0  THEN ''H'' ELSE ''D'' END DH, '
               +''''+DMAF.wTMonLoc+''', '+FloatToStr(xTcam)+', '
               +'''REI'', '
               +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ELSE SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) END, '
               +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ELSE SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) END, '
               +  '0, '
               +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ELSE 0 END DEBE, '
               +  '0, '
               +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0  THEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) ELSE 0 END HABER, '
               +  '0, '
               +''''+DMAF.cdsQry.FieldByName('FECANO').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECMES').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECDIA').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECTRIM').AsString +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSEM').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSS').AsString   +''', '
               +''''+DMAF.cdsQry.FieldByName('FECAATRI').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASEM').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASS').AsString +''', '
               +''''+DMAF.wUsuario+''', CURRENT DATE, CURRENT TIME, MAX(A.CUENTAID) '
           +'From ACF204 A '
           +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
           +'Group by A.CIAID, D.REIDEPRE, A.CCOSID '
  //         +'Having SUM(A.DEPIMPAJUS)>0 '

           +'Union '

           +'Select A.CIAID, '''+dblcTDiario.Text+''', '''+meNoreg.Text+''', '
               +''''+dblcdPeriodo.text+''', DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+'''), '
               +'D.REI CUENTAID, ''Asiento del R.E.I. Periodo '+dblcdPeriodo.Text+''', '
               +''''' CCOSID, '
               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0  THEN ''H'' ELSE ''D'' END DH, '
               +''''+DMAF.wTMonLoc+''', '+FloatToStr(xTcam)+', '
               +'''REI'', '
               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN  (SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS))-(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)) ELSE (SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST))-(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)) END, '
               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN  (SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS))-(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)) ELSE (SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST))-(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)) END, '
               +'0, '
               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN  (SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS))-(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)) ELSE 0 END DEBE, '
               +'0, '
               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0 THEN  (SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST))-(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)) ELSE 0 END HABER, '
               +'0, '
               +''''+DMAF.cdsQry.FieldByName('FECANO').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECMES').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECDIA').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECTRIM').AsString +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSEM').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSS').AsString   +''', '
               +''''+DMAF.cdsQry.FieldByName('FECAATRI').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASEM').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASS').AsString +''', '
               +''''+DMAF.wUsuario+''', CURRENT DATE, CURRENT TIME, MAX(A.CUENTAID) '
           +'From ACF204 A '
           +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
           +'Group by A.CIAID, D.REI '
//           +'Having SUM(A.DEPIMPAJUS)>0 ';
   end;
   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='Insert Into ACF306 ( CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTFCOMP, '
           +   'CUENTAID, CNTGLOSA, CCOSID, CNTDH, TMONID, CNTTCAMBIO, '
           +   'CNTLOTE, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
           +   'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
           +   'CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
           +   'CNTAASS, CNTUSER, CNTFREG, CNTHREG, TDIARDES ) '

           +'Select A.CIAID, '''+dblcTDiario.Text+''', '''+meNoreg.Text+''', '
               +''''+dblcdPeriodo.text+''', TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFComp.Date)+'''), '
               +'D.REIAJUSTE CUENTAID, ''Asiento del R.E.I. Periodo '+dblcdPeriodo.Text+''', '
               +'A.CCOSID, '
//               +'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0  THEN ''D'' ELSE ''H'' END DH, '
               + ' DECODE (LEAST(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0),0,''D'',''H'') DH, '
               +''''+DMAF.wTMonLoc+''', '+FloatToStr(xTcam)+', '
               +'''REI'', '
//               +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0  THEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST) ELSE SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS) END, '
               +' DECODE(LEAST(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0),0,SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS)), '
//               +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0  THEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST) ELSE SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS) END, '
               +' DECODE(LEAST(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0),0,SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS)), '

               +  '0, '
//               +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)>0  THEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST) ELSE 0 END DEBE, '
               +' DECODE(LEAST(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0),0,SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0) DEBE, '
               +  '0, '
//               +  'CASE WHEN SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST)<0 THEN SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS)  ELSE 0 END HABER, '
               +' DECODE(GREATEST(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST),0),0,SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS),0) HABER, '
               +  '0, '
               +''''+DMAF.cdsQry.FieldByName('FECANO').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECMES').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECDIA').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECTRIM').AsString +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSEM').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSS').AsString   +''', '
               +''''+DMAF.cdsQry.FieldByName('FECAATRI').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASEM').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASS').AsString +''', '
               +''''+DMAF.wUsuario+''', SYSDATE, SYSDATE, MAX(A.CUENTAID) '

           +'From ACF204 A, ACF110 D '
//           +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' AND A.CUENTAID=D.CUENTAID(+) '
           +'Group by A.CIAID, D.REIAJUSTE, A.CCOSID '
//           +'Having SUM(A.DEPIMPAJUS)>0 '

           +'Union '

           +'Select A.CIAID, '''+dblcTDiario.Text+''', '''+meNoreg.Text+''', '
               +''''+dblcdPeriodo.text+''', TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFComp.Date)+'''), '
               +'D.REIDEPRE CUENTAID, ''Asiento del R.E.I. Periodo '+dblcdPeriodo.Text+''', '
               +'A.CCOSID, '
//               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0  THEN ''H'' ELSE ''D'' END DH, '
               +' DECODE (LEAST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0),0,''H'',''D'') DH, '
               +''''+DMAF.wTMonLoc+''', '+FloatToStr(xTcam)+', '
               +'''REI'', '
//               +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ELSE SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) END, '
               +' DECODE(GREATEST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0),0,SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS),SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)), '
//               +' CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ELSE SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) END, '
               +' DECODE(GREATEST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0),0,SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS),SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)), '
               +  '0, '
//               +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS) ELSE 0 END DEBE, '
               +' DECODE(GREATEST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0),0,SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS),0) DEBE, '
               +  '0, '
//               +  'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0  THEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST) ELSE 0 END HABER, '
               +' DECODE (LEAST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0),0,SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0) HABER, '
               +  '0, '
               +''''+DMAF.cdsQry.FieldByName('FECANO').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECMES').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECDIA').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECTRIM').AsString +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSEM').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSS').AsString   +''', '
               +''''+DMAF.cdsQry.FieldByName('FECAATRI').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASEM').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASS').AsString +''', '
               +''''+DMAF.wUsuario+''', SYSDATE, SYSDATE, MAX(A.CUENTAID) '
           +'From ACF204 A,ACF110 D '
//           +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' AND A.CUENTAID=D.CUENTAID(+) '
           +'Group by A.CIAID, D.REIDEPRE, A.CCOSID '
//           +'Having SUM(A.DEPIMPAJUS)>0 '

           +'Union '

           +'Select A.CIAID, '''+dblcTDiario.Text+''', '''+meNoreg.Text+''', '
               +''''+dblcdPeriodo.text+''', TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFComp.Date)+'''), '
               +'D.REI CUENTAID, ''Asiento del R.E.I. Periodo '+dblcdPeriodo.Text+''', '
               +''''' CCOSID, '
//               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0  THEN ''H'' ELSE ''D'' END DH, '
               +' DECODE(LEAST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0),0,''H'',''D'') DH, '
               +''''+DMAF.wTMonLoc+''', '+FloatToStr(xTcam)+', '
               +'''REI'', '
//               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN  (SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS))-(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)) ELSE (SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST))-(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)) END, '
               +' DECODE(GREATEST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0),0,(SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS))-(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)),(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST))-(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST))), '
//               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN  (SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS))-(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)) ELSE (SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST))-(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)) END, '
               +' DECODE(GREATEST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0),0,(SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS))-(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)),(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST))-(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST))), '
               +'0, '
//               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)<0  THEN  (SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS))-(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)) ELSE 0 END DEBE, '
               +' DECODE(GREATEST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0),0,(SUM(A.DEPVALHIST)-SUM(A.DEPVALAJUS))-(SUM(A.DEPIMPHIST)-SUM(A.DEPIMPAJUS)),0) DEBE, '
               +'0, '
//               +'CASE WHEN SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)>0 THEN  (SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST))-(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)) ELSE 0 END HABER, '
               +' DECODE(LEAST(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST),0),0,(SUM(A.DEPVALAJUS)-SUM(A.DEPVALHIST))-(SUM(A.DEPIMPAJUS)-SUM(A.DEPIMPHIST)),0) HABER, '
               +'0, '
               +''''+DMAF.cdsQry.FieldByName('FECANO').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECMES').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECDIA').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECTRIM').AsString +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSEM').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSS').AsString   +''', '
               +''''+DMAF.cdsQry.FieldByName('FECAATRI').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASEM').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASS').AsString +''', '
               +''''+DMAF.wUsuario+''', SYSDATE, SYSDATE, MAX(A.CUENTAID) '
           +'From ACF204 A, ACF110 D '
//           +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' AND A.CUENTAID=D.CUENTAID(+)  '
           +'Group by A.CIAID, D.REI '
//           +'Having SUM(A.DEPIMPAJUS)>0 ';
   end;
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Execute;

   wSQL:='SELECT * FROM ACF306 '
        +'Where ACF306.CIAID='''     + dblcCia.text      +''' and '
        +      'ACF306.CNTANOMM='''  + dblcdPeriodo.Text +''' and '
        +      'ACF306.TDIARID='''   + dblcTDiario.Text  +''' and '
        +      'ACF306.CNTCOMPROB='''+ meNoreg.Text      +''' and '
        +      'ACF306.CNTLOTE=''REI'' ';

   DMAF.cdsACFCont.Close;
   DMAF.cdsACFCont.DataRequest(wSQL);
   DMAF.cdsACFCont.Open;
   DMAF.cdsACFCont.IndexFieldNames:='TDIARDES;CNTDH;CUENTAID;CCOSID';

   xCNTReg:=0;

   DMAF.cdsACFCont.First;
   while not DMAF.cdsACFCont.Eof do begin
      DMAF.cdsACFCont.Edit;
      xCNTReg:=xCNTReg+1;
      DMAF.cdsACFCont.FieldByName('CNTREG').AsInteger:=xCNTReg;
      DMAF.cdsACFCont.Next;
   end;

   DMAF.cdsACFCont.ApplyUpdates( 0 );

   DMAF.CDSQRY.CLOSE;
   WSQL:='INSERT INTO  CNT311 '
         + ' (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
         + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
         + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
         + ' CNTHABEMN,CNTHABEME,CNTREG) '

         + ' (SELECT CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
         + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
         + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
         + ' CNTHABEMN,CNTHABEME,CNTREG '
         +' FROM ACF306 '
         +' Where ACF306.CIAID='''     + dblcCia.text      +''' and '
         +      'ACF306.CNTANOMM='''  + dblcdPeriodo.Text +''' and '
         +      'ACF306.TDIARID='''   + dblcTDiario.Text  +''' and '
         +      'ACF306.CNTCOMPROB='''+ meNoreg.Text      +''' and '
         +      'ACF306.CNTLOTE=''REI'' )';
   DMAF.CDSQRY.CLOSE;
   DMAF.CDSQRY.DATAREQUEST(wsql);
   DMAF.CDSQRY.EXECUTE;

   DMAF.CDSQRY.CLOSE;

   WSQL:='SELECT * FROM CNT311 WHERE '
         +'      CIAID='''     + dblcCia.text      +''' and '
         +      'CNTANOMM='''  + dblcdPeriodo.Text +''' and '
         +      'TDIARID='''   + dblcTDiario.Text  +''' and '
         +      'CNTCOMPROB='''+ meNoreg.Text      +''' and '
         +      'CNTLOTE=''REI'' ';
   DMAF.cdsCNT311.Close;
   DMAF.cdsCNT311.DataRequest(WSQL);
   DMAF.cdsCNT311.Open;

   if DMAF.cdsTrasPen.FieldByName('FLREI').AsString='S' then
   begin

      if SOLConta(dblcCia.text,
                       dblcTDiario.Text,
                       dblcdPeriodo.Text,
                       meNoreg.Text,
                        SRV_D, 'C', DMAF.wModulo, DMAF.cdsCNT311, DMAF.cdsNivel,
                       DMAF.cdsResultSet, DMAF.DCOM1, Self ) then

   end;
   if DMAF.cdsTrasPen.FieldByName('FLREI').AsString<>'S' then
   begin

      if SOLConta(dblcCia.text,
                       dblcTDiario.Text,
                       dblcdPeriodo.Text,
                       meNoreg.Text,
                        SRV_D, 'P', DMAF.wModulo, DMAF.cdsCNT311, DMAF.cdsNivel,
                       DMAF.cdsResultSet, DMAF.DCOM1, Self ) then

   end;

{

      DMAF.cdsTrasSel.First;
      while not DMAF.cdsTrasSel.Eof do begin

         DMAF.cdsACFCont.Insert;
         DMAF.cdsACFCont.FieldByName('CIAID').Value     :=dblcCia.Text;
         DMAF.cdsACFCont.FieldByName('TDIARID').Value   :=dblcTDiario.Text;
         DMAF.cdsACFCont.FieldByName('CNTCOMPROB').Value:=meNoreg.Text;
         DMAF.cdsACFCont.FieldByName('CNTANOMM').Value  :=dblcdPeriodo.text;
         DMAF.cdsACFCont.FieldByName('CNTFCOMP').Value  :=dtpFComp.Date;

         DMAF.cdsACFCont.FieldByName('CUENTAID').Value  :=DMAF.cdsTrasSel.FieldByname('CUENTAID').AsString;
         DMAF.cdsACFCont.FieldByName('CNTGLOSA').Value  :='Depreciación Activos Periodo '+dblcdPeriodo.Text;
         DMAF.cdsACFCont.FieldByName('CCOSID').Value    :=DMAF.cdsTrasSel.FieldByname('CCOSID').AsString;
         DMAF.cdsACFCont.FieldByName('CNTDH').Value     :=DMAF.cdsTrasSel.FieldByname('DH').AsString;
         DMAF.cdsACFCont.FieldByName('TMONID').Value    :=DMAF.wTMonLoc;
         DMAF.cdsACFCont.FieldByName('CNTTCAMBIO').Value:=xTcam;
         DMAF.cdsACFCont.FieldByName('CAMPOVAR').Value  :=DMAF.cdsTrasSel.FieldByname('TACFID').AsString;
         DMAF.cdsACFCont.FieldByName('CNTLOTE').Value   :='REI';

         if DMAF.cdsTrasSel.FieldByname('DEBE').AsFloat>0 then begin
            DMAF.cdsACFCont.FieldByName('CNTMTOORI').Value :=DMAF.cdsTrasSel.FieldByname('DEBE').AsFloat;
            DMAF.cdsACFCont.FieldByName('CNTMTOLOC').Value :=DMAF.cdsTrasSel.FieldByname('DEBE').AsFloat;
            DMAF.cdsACFCont.FieldByName('CNTMTOEXT').Value :=FRound(DMAF.cdsTrasSel.FieldByname('DEBE').AsFloat/xTCam,15,2);;
            DMAF.cdsACFCont.FieldByName('CNTDEBEMN').Value :=DMAF.cdsTrasSel.FieldByname('DEBE').AsFloat;
            DMAF.cdsACFCont.FieldByName('CNTDEBEME').Value :=FRound(DMAF.cdsTrasSel.FieldByname('DEBE').AsFloat/xTCam,15,2);
         end
         else begin
            DMAF.cdsACFCont.FieldByName('CNTMTOORI').Value :=DMAF.cdsTrasSel.FieldByname('HABER').AsFloat;
            DMAF.cdsACFCont.FieldByName('CNTMTOLOC').Value :=DMAF.cdsTrasSel.FieldByname('HABER').AsFloat;
            DMAF.cdsACFCont.FieldByName('CNTMTOEXT').Value :=FRound(DMAF.cdsTrasSel.FieldByname('HABER').AsFloat/xTCam,15,2);;
            DMAF.cdsACFCont.FieldByName('CNTHABEMN').Value :=DMAF.cdsTrasSel.FieldByname('HABER').AsFloat;
            DMAF.cdsACFCont.FieldByName('CNTHABEME').Value :=FRound(DMAF.cdsTrasSel.FieldByname('HABER').AsFloat/xTCam,15,2);
         end;

         DMAF.cdsACFCont.FieldByName('CNTANO').VALUE  :=DMAF.cdsQry.FieldByName('FECANO').Value;
         DMAF.cdsACFCont.FieldByName('CNTMM').VALUE   :=DMAF.cdsQry.FieldByName('FECMES').Value;
         DMAF.cdsACFCont.FieldByName('CNTDD').VALUE   :=DMAF.cdsQry.FieldByName('FECDIA').Value;
         DMAF.cdsACFCont.FieldByName('CNTTRI').VALUE  :=DMAF.cdsQry.FieldByName('FECTRIM').Value;
         DMAF.cdsACFCont.FieldByName('CNTSEM').VALUE  :=DMAF.cdsQry.FieldByName('FECSEM').Value;
         DMAF.cdsACFCont.FieldByName('CNTSS').VALUE   :=DMAF.cdsQry.FieldByName('FECSS').Value;
         DMAF.cdsACFCont.FieldByName('CNTAATRI').VALUE:=DMAF.cdsQry.FieldByName('FECAATRI').Value;
         DMAF.cdsACFCont.FieldByName('CNTAASEM').VALUE:=DMAF.cdsQry.FieldByName('FECAASEM').Value;
         DMAF.cdsACFCont.FieldByName('CNTAASS').VALUE :=DMAF.cdsQry.FieldByName('FECAASS').Value;

         DMAF.cdsACFCont.FieldByName('CNTUSER').VALUE :=DMAF.wUsuario;
         DMAF.cdsACFCont.FieldByName('CNTFREG').VALUE :=DATE;
         DMAF.cdsACFCont.FieldByName('CNTHREG').VALUE :=TIME;

         DMAF.cdsTrasSel.Next;
      end;

      DMAF.cdsACFCont.ApplyUpdates( 0 );
}

end;


end.
