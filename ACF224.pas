unit ACF224;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwmonthcalendar, Mask, wwdbedit, wwdbdatetimepicker,
  wwdblook, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, ComCtrls,
  wwClient,db, dbclient,oaContabiliza;

type
  TFLimReexpres = class(TForm)
    BitBtOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    dbgLimite: TwwDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    dbeCia: TwwDBEdit;
    dblcdcia: TwwDBLookupCombo;
    dbdtpFecha: TwwDBDateTimePicker;
    edttasnom: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    dblcdTipAct: TwwDBLookupComboDlg;
    dblcdActivo: TwwDBLookupComboDlg;
    dbeTipact: TwwDBEdit;
    dbeActivo: TwwDBEdit;
    edtmontotas: TEdit;
    BitBtnAceptar: TBitBtn;
    BitBtnContabilizado: TBitBtn;
    pnllimite: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    activop: TwwDBLookupComboDlg;
    montop: TwwDBEdit;
    BitBtnAceptard: TBitBtn;
    BitBtnCancelar: TBitBtn;
    pnlDatos: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    dtpFComp: TwwDBDateTimePicker;
    meNoReg: TwwDBEdit;
    dbeCambio: TwwDBEdit;
    dbecuenta: TwwDBEdit;
    Label13: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    lblACF: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    procedure bbtnOk1Click(Sender: TObject);
    procedure dbgTipoDepDblClick(Sender: TObject);
    procedure dblcTipoDExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdciaExit(Sender: TObject);
    procedure dblcdTipActExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbdtpFechaExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtOkClick(Sender: TObject);
    procedure BitBtnAceptarClick(Sender: TObject);
    procedure BitBtnContabilizadoClick(Sender: TObject);
    procedure dbgLimiteDblClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BitBtnAceptardClick(Sender: TObject);
    procedure dblcdActivoExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dtpFCompExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

    { Private declarations }
    xCNTReg  : Integer;
    procedure GrabaPrevio;
    procedure InsertaConta;
  public
    { Public declarations }
  end;

var
  FLimReexpres: TFLimReexpres;
  wSql, wFaperiodo,xxanomm,xxanommc : string;
  xxcuentaid,xxtacfid:string;
implementation

uses ACFDM, ACF292,oaAF3000;

{$R *.DFM}
//{$I OPER.PAS}

procedure TFLimReexpres.dbgTipoDepDblClick(Sender: TObject);
begin
end;

// LOOKUP de periodo , PROCESO PRELIMINAR.
procedure TFLimReexpres.bbtnOk1Click(Sender: TObject);
var
   wXX, wFECANO, wFECDIA, wFECTRIM, wFECSS, wFECAASEM, wFECMMSS,
   wFECMES, wFECDIASS, wFECSEM, wFECAATRI, wFECAASS, xFecDep, xFecStr : string;
   wFecpro : TDate;
   WHReg   : TTime;
   xSQL, xACF1, xACF2, xACF3, xACF4, xACF5 : String;
   nYear, nMonth, nDay : Word;
   xMesIni, xMM, xYY : sTRING;
begin

end;

procedure TFLimReexpres.GrabaPrevio;
var
   xSQL     : String;
   xCtaAju1 : String;
   xCtaDep1 : String;
   xCtaDeA1 : String;
   xCtaAju2 : String;
   xCtaDep2 : String;
   xCtaDeA2,anom,mesm : String;
   Year, Month, Day :word;
begin
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='DELETE FROM ACF306 '
           +'WHERE CIAID='''   +dblcdCia.Text   +''' and '
           +      'COALESCE(CNTCOMPROB,'''')='''' ';
   end;
   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='DELETE FROM ACF306 '
           +'WHERE CIAID='''   +dblcdCia.Text   +''' and '
           +      'NVL(CNTCOMPROB,''NULO'')=''NULO'' ';
   end;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   try
      DMAF.cdsQry.Execute;
   except
   end;

      xSQL:='DELETE FROM ACF306 '
           +'WHERE CIAID='''   +dblcdCia.Text   +''' and '
           +      'CNTCOMPROB='''+meNoReg.TEXT+''' AND TDIARID='''+DMAF.cdsLimReCab.fieldbyname('TDIARID').asstring+''' AND CNTANOMM='''+FORMATDATETIME('YYYYMM',dtpFComp.Date)
           + ''' AND CNTFCOMP='''+formatdatetime(DMAF.wFormatFecha,dtpFComp.Date)+''' AND CNTLOTE=''LREE''';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   try
      DMAF.cdsQry.Execute;
   except
   end;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
           +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
           +'TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFComp.Date)+''')';
   end;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;

   xCNTReg:=0;

   DecodeDate(dtpFComp.date, Year, Month, Day);
   anom:=inttostr(year);
   mesm:=inttostr(month);
   if length(mesm)=1 then
      mesm:=concat('0',mesm)
   else
      mesm:=mesm;
   xxanommc:=anom+mesm;


   xSQL:='SELECT * FROM ACF310 WHERE CIAID ='''
           +dblcdcia.text+''' AND  LREEID='''+DMAF.cdsLimReCab.fieldbyname('LREEID').asstring+'''';
   DMAF.cdsQry2.Close;
   DMAF.cdsQry2.DataRequest( xSQL );
   DMAF.cdsQry2.Open;


   DMAF.cdsACFCont.close;
   DMAF.cdsACFCont.datarequest('SELECT * FROM ACF306 WHERE CIAID=''DD''');
   DMAF.cdsACFCont.OPEN;

   DMAF.cdsqry2.First;
   while not DMAF.cdsqry2.Eof do begin

       if DMAF.cdsQry2.fieldbyname('MONTODIF').asstring<>'' then
       Begin
         Insertaconta;
     End;
     DMAF.cdsQry2.Next;
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
         +' Where ACF306.CIAID='''     + dblcdCia.text      +''' and '
         +      'ACF306.CNTANOMM='''  + xxanommc +''' and '
         +      'ACF306.TDIARID='''   + dblcTDiario.Text  +''' and '
         +      'ACF306.CNTCOMPROB='''+ meNoreg.Text      +''' and '
         +      'ACF306.CNTLOTE=''LREE'' )';
   DMAF.CDSQRY.CLOSE;
   DMAF.CDSQRY.DATAREQUEST(wsql);
   DMAF.CDSQRY.EXECUTE;

   DMAF.CDSQRY.CLOSE;

   WSQL:='SELECT * FROM CNT311 WHERE '
         +'      CIAID='''     + dblcdCia.text      +''' and '
         +      'CNTANOMM='''  + xxanommc +''' and '
         +      'TDIARID='''   + dblcTDiario.Text  +''' and '
         +      'CNTCOMPROB='''+ meNoreg.Text      +''' and '
         +      'CNTLOTE=''LREE'' ';
   DMAF.cdsCNT311.Close;
   DMAF.cdsCNT311.DataRequest(WSQL);
   DMAF.cdsCNT311.Open;

{  if DMAF.cdsReva.FieldByName('FLCONTA').AsString='S' then
   begin

      if SOLConta(dblcdCia.text,
                       dblcTDiario.Text,
                       dblcdPeriodo.Text,
                       meNoreg.Text,
                       DMAF.wReplacCeros, SRV_D, 'C', DMAF.wModulo, DMAF.cdsCNT311, DMAF.cdsNivel,
                       DMAF.cdsResultSet, DMAF.DCOM1, Self ) then

   end;
   if DMAF.cdsReva.FieldByName('FLCONTA').AsString<>'S' then
   begin

      if SOLConta(dblcCia.text,
                       dblcTDiario.Text,
                       dblcdPeriodo.Text,
                       meNoreg.Text,
                       DMAF.wReplacCeros, SRV_D, 'P', DMAF.wModulo, DMAF.cdsCNT311, DMAF.cdsNivel,
                       DMAF.cdsResultSet, DMAF.DCOM1, Self ) then

   end;

 }
end;


procedure TFLimReexpres.dblcTipoDExit(Sender: TObject);
var
   xWhere : String;
begin

end;

procedure TFLimReexpres.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0 );
   end;
end;

procedure TFLimReexpres.dblcdciaExit(Sender: TObject);
var
  xwhere:string;
begin
   xWhere:='CIAID='''+dblcdcia.Text+'''';
   dbecia.Text:=DMAF.DisplayDescrip('dspTGE','TGE101','CIADES',xWhere,'CIADES');

   if dbecia.Text='' then begin
      dblcdcia.SetFocus;
      ShowMessage('Error : Falta Compañía');
      Exit;
   end;


end;

procedure TFLimReexpres.dblcdTipActExit(Sender: TObject);
var
  xwhere:string;
begin
   xWhere:='TACFID='''+dblcdTipAct.Text+'''';
   dbeTipact.Text:=DMAF.DisplayDescrip('dspTGE','ACF101','TACFDES',xWhere,'TACFDES');
   BitBtn2.enabled:=true;
   if dbeTipact.Text='' then begin
      dblcdTipAct.SetFocus;
      ShowMessage('Error : Falta Tipo de Activo');
      Exit;
   end;

   DMAF.cdsActFij.Close;
   DMAF.cdsActFij.DataRequest('Select * from ACF201 where TACFID='''+DMAF.cdsTipAct.fieldbyname('TACFID').asstring
                     +''' AND CIAID='''+dblcdcia.TEXT+'''');
   DMAF.cdsActFij.Open;

end;

procedure TFLimReexpres.BitBtn1Click(Sender: TObject);
begin
   if dblcdcia.Text='' then begin
      dblcdCia.SetFocus;
      Raise Exception.Create('Error : Compañía no Valida');
   end;

   if dbdtpFecha.Text='' then begin
      dbdtpFecha.SetFocus;
      Raise Exception.Create('Error : Fecha no Valida');
   end;
   if edttasnom.Text='' then begin
      edttasnom.SetFocus;
      Raise Exception.Create('Error : Debe Registrar Nombre');
   end;




   DMAF.cdsLimReDet.Close;
   DMAF.cdsLimReDet.DataRequest('SELECT * FROM ACF310 WHERE LREEID=''DD''');
   DMAF.cdsLimReDet.open;

   DMAF.cdsLimReCab.fieldbyname('CIAID').asstring:=dblcdcia.text;
   DMAF.cdsLimReCab.fieldbyname('FECHA').asdatetime:=dbdtpFecha.date;
   DMAF.cdsLimReCab.fieldbyname('ACFANOMM').asstring:=xxanomm;
   DMAF.cdsLimReCab.fieldbyname('NOMTASADOR').asstring:=edttasnom.text;

   BitBtn2.enabled:=true;
   panel2.enabled:=true;
   dbgLimite.ENABLED:=TRUE;
end;

procedure TFLimReexpres.dbdtpFechaExit(Sender: TObject);
var
  Year, Month, Day: Word;
  anom,mesm:string;

begin
   DecodeDate(dbdtpFecha.date, Year, Month, Day);
   anom:=inttostr(year);
   mesm:=inttostr(month);
   if length(mesm)=1 then
      mesm:=concat('0',mesm)
   else
      mesm:=mesm;
   xxanomm:=anom+mesm;
   if    DMAF.wModo='A' then
   Begin
      DMAF.cdsQry.Close;
      DMAF.cdsQry.Datarequest( 'Select MAX( LREEID ) LREEID FROM ACF309 WHERE CIAID='''+dblcdCia.Text+''' AND ACFANOMM='''+xxanomm+'''' );
      DMAF.cdsQry.Open;

      if DMAF.cdsQry.FieldByName('LREEID').AsString='' then
         DMAF.cdsLimReCab.FieldByname('LREEID').AsString:='0000000001'
      else
         DMAF.cdsLimReCab.FieldByname('LREEID').AsString:=DMAF.StrZero( StrToInt( DMAF.cdsQry.FieldByName('LREEID').AsString) +1 , 10 ) ;
   End;
end;

procedure TFLimReexpres.BitBtn2Click(Sender: TObject);
var
   xsql:string;
   deprec:double;
begin
  if dblcdActivo.Text='' then begin
      dblcdActivo.SetFocus;
      Raise Exception.Create('Error : Activo no Valida');
  end;

  if dblcdTipAct.Text='' then begin
      dblcdTipAct.SetFocus;
      Raise Exception.Create('Error : Tipo Activo no Valida');
  end;

  if edtmontotas.Text='' then begin
      edtmontotas.SetFocus;
      Raise Exception.Create('Error : Falta Registrar el Monto de Tasación del Activo');
  end;

  If DMAF.cdsLimReDet.fieldbyname('ACFID').asstring=dblcdActivo.text then
  Begin
      dblcdActivo.setfocus;
      Raise Exception.Create('Error : Activo ya Registrado');
  End;
  DMAF.cdsLimReDet.Insert;
  DMAF.cdsLimReDet.fieldbyname('CIAID').asstring:=DMAF.cdsLimReCab.fieldbyname('CIAID').asstring;
  DMAF.cdsLimReDet.fieldbyname('ACFANOMM').asstring:=DMAF.cdsLimReCab.fieldbyname('ACFANOMM').asstring;
  DMAF.cdsLimReDet.fieldbyname('LREEID').asstring:=DMAF.cdsLimReCab.FieldByname('LREEID').AsString;
  DMAF.cdsLimReDet.fieldbyname('ACFID').asstring:=dblcdActivo.text;
  DMAF.cdsLimReDet.fieldbyname('MONTASAC').asfloat:=strtofloat(edtmontotas.text);
  DMAF.cdsLimReDet.fieldbyname('CUENTAID').asstring:=xxcuentaid;
  DMAF.cdsLimReDet.fieldbyname('TACFID').asstring:=xxtacfid;

  xsql:='Select DEPFECHA, DEPVALAJUS,DEPACUAJUS, ACFVNUEVO, DEPNETOAJU from ACF204 '
       +'where acfid='''+DMAF.cdsLimReDet.fieldbyname('ACFID').asstring+''' '
       +'order by depfecha ';
  DMAF.cdsqry.close;
  DMAF.cdsqry.datarequest(xsql);
  DMAF.cdsqry.open;
    DMAF.cdsqry.last;

  DMAF.cdsLimReDet.fieldbyname('MONHIST').asfloat:=DMAF.cdsqry.fieldbyname('DEPNETOAJU').asfloat;

  if DMAF.cdsLimReDet.fieldbyname('MONTASAC').asfloat< DMAF.cdsqry.fieldbyname('DEPNETOAJU').asfloat  then
  Begin

    DMAF.cdsLimReDet.fieldbyname('MONTODIF').asfloat:=DMAF.cdsqry.fieldbyname('DEPNETOAJU').asfloat-DMAF.cdsLimReDet.fieldbyname('MONTASAC').asfloat;
  End;

  TNumericField( DMAF.cdsLimReDet.FieldByName('MONTASAC') ).DisplayFormat:='###,###,##0.00';
  TNumericField( DMAF.cdsLimReDet.FieldByName('MONTODIF') ).DisplayFormat:='###,###,##0.00';
  dbgLimite.ColumnByName('MONTASAC').FooterValue:=FLOATTOSTRF( DMAF.OperClientDataset(DMAF.cdsLimReDet, 'SUM(MONTASAC)', ''),ffNumber,15,2 );
  BitBtOk.enabled:=true;
  DMAF.cdsLimReDet.post;
  xxcuentaid:='';
  xxtacfid:='';
  BitBtOk.enabled:=true;
end;

procedure TFLimReexpres.BitBtOkClick(Sender: TObject);
var
xsql:string;
begin

  If DMAF.cdsLimReDet.recordcount=0 then
  Begin
     Raise Exception.Create('Error : No Existen Registros ');
  End;


if MessageDlg('¿ Esta Seguro de Grabar ?', mtconfirmation,[mbYes,MbNo],0)=mrYes then
begin
  DMAF.cdsLimReCab.edit;
  DMAF.cdsLimReCab.fieldbyname('ACFESTADO').asstring:='I';
  DMAF.cdsLimReCab.fieldbyname('ACFUSER').asstring  :=DMAF.wUsuario;
  DMAF.cdsLimReCab.fieldbyname('ACFFREG').value     :=date;
  DMAF.cdsLimReCab.fieldbyname('HREG').value        :=time;
  DMAF.cdsLimReCab.DataRequest( 'SELECT * FROM ACF309' );
  cdsPost(DMAF.cdsLimReCab);
  DMAF.AplicaDatos(DMAF.cdsLimReCab,'LIMITECAB');

  cdsPost(DMAF.cdsLimReDet);
  DMAF.AplicaDatos(DMAF.cdsLimReDet,'LIMITEDET');
  BitBtnAceptar.enabled:=true;
  Showmessage('Grabación Exitosa');

end;

end;

procedure TFLimReexpres.BitBtnAceptarClick(Sender: TObject);
var
xsql:string;
deprec,montotasac:double;
begin
   If DMAF.cdsLimReCab.fieldbyname('ACFESTADO').asstring='P' then
   Begin
      Raise Exception.Create('El Registro ya fue Aceptado');
   End;

      if dblcTDiario.Text='' then begin
      dblcTDiario.SetFocus;
      Raise Exception.Create('Error : Diario no Valida');
   end;


   if dtpFComp.Text='' then begin
      dtpFComp.SetFocus;
      Raise Exception.Create('Error : Fecha no Valida');
   end;

   if meNoReg.Text='' then begin
      meNoReg.SetFocus;
      Raise Exception.Create('Error : Comprobante no Valida');
   end;

   if dbeCambio.Text='' then begin
      dbeCambio.SetFocus;
      Raise Exception.Create('Error : Tipo de Cambio no Valida');
   end;

   if MessageDlg('¿ Esta Seguro de aceptar ?', mtconfirmation,[mbYes,MbNo],0)=mrYes then
   begin

     DMAF.cdsLimReDet.First;
  while not DMAF.cdsLimReDet.Eof do
  begin
        xsql:='select CIAID,DEPFECHA,DEPVALAJUS,ACFVNUEVO,ACFID,DEPNETOAJU,DEPACUAJUS from ACF204 where acfid='''+DMAF.cdsLimReDet.fieldbyname('ACFID').asstring+''' order by depfecha ';
        DMAF.cdsqry.close;
        DMAF.cdsqry.datarequest(xsql);
        DMAF.cdsqry.open;

        DMAF.cdsqry.last;
        deprec:=(DMAF.cdsLimReDet.fieldbyname('MONTASAC').asfloat*DMAF.cdsqry.fieldbyname('DEPACUAJUS').asfloat)/DMAF.cdsqry.fieldbyname('DEPNETOAJU').asfloat;
        montotasac:=deprec+DMAF.cdsLimReDet.fieldbyname('MONTASAC').asfloat;


        if DMAF.cdsLimReDet.fieldbyname('MONTASAC').asfloat<DMAF.cdsqry.FieldByName('DEPNETOAJU').asfloat then
        Begin
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
       begin
           xsql:='UPDATE ACF204 SET ACFVNUEVO='+floattostr(montotasac)+', '
                                  +'ACFVDEPRE='+floattostr(deprec)
{           +' ,DEPNETOHIS='+floattostr(montotasac)
           +' ,DEPACUHIST='+floattostr(deprec)
           +' ,DEPACUAJUS='+floattostr(deprec)}
           +' , ACFCOMPA='+floattostr(montotasac)+' WHERE ACFID='''+DMAF.cdsQry.fieldbyname('ACFID').asstring
            +''' AND CIAID='''+DMAF.cdsQry.fieldbyname('CIAID').asstring+''' AND DEPFECHA='
            +' DATE('''+FORMATDATETIME('YYYY-MM-DD',DMAF.cdsQry.fieldbyname('DEPFECHA').asdatetime)+''')';
       End;
      if (SRV_D = 'ORACLE') then
       begin
           xsql:='UPDATE ACF204 SET ACFVNUEVO='+floattostr(montotasac)+', '
                                  +'ACFVDEPRE='+floattostr(deprec)
{           +' ,DEPNETOHIS='+floattostr(montotasac)
           +' ,DEPACUHIST='+floattostr(deprec)
           +' ,DEPACUAJUS='+floattostr(deprec)}
           +' , ACFCOMPA='+floattostr(montotasac)+' WHERE ACFID='''+DMAF.cdsQry.fieldbyname('ACFID').asstring
            +''' AND CIAID='''+DMAF.cdsQry.fieldbyname('CIAID').asstring+''' AND DEPFECHA='
            +' TO_DATE('''+FORMATDATETIME('YYYY-MM-DD',DMAF.cdsQry.fieldbyname('DEPFECHA').asdatetime)+''')';

       End;
           DMAF.cdsQry2.Close;
           DMAF.cdsQry2.DataRequest(xsql);
           DMAF.cdsQry2.Execute;
        End;
        DMAF.cdsLimReDet.Next;
  end;



       DMAF.cdsLimReCab.edit;
       DMAF.cdsLimReCab.fieldbyname('ACFESTADO').asstring:='P';
       DMAF.cdsLimRecab.fieldbyname('ACFHREG').value:=Time;
       DMAF.cdsLimReCab.fieldbyname('FECHAC').asdatetime:=dtpFComp.date;
       DMAF.cdsLimReCab.fieldbyname('TDIARID').asstring:=dblcTDiario.text;
       DMAF.cdsLimReCab.fieldbyname('ACFCOMPROB').asstring:=meNoReg.text;
       DMAF.cdsLimReCab.fieldbyname('TCAMBIO').asstring:=dbeCambio.text;
       DMAF.cdsLimReCab.DataRequest( 'SELECT * FROM ACF309 WHERE LREEID='''
       +DMAF.cdsLimReCab.fieldbyname('LREEID').asstring+'''' );
       cdsPost(DMAF.cdsLimReCab);

       DMAF.AplicaDatos(DMAF.cdsLimReCab,'LIMITECAB');
       PNLDATOS.ENABLED:=TRUE;


   End;
          GrabaPrevio;
   {DMAF.cdsTDiario.Close;
   DMAF.cdsTDiario.datarequest('SELECT * from TGE104');
   DMAF.cdsTDiario.open;}

   Showmessage('Registros Aceptados');
end;

procedure TFLimReexpres.BitBtnContabilizadoClick(Sender: TObject);
begin


   If DMAF.cdsLimReCab.fieldbyname('ACFCONTA').asstring='S' then
   Begin
      Raise Exception.Create('Error : Registro ya ha sido Contabilizado');
   End;

   If DMAF.cdsLimReCab.fieldbyname('ACFESTADO').asstring='I' then
   Begin
      BitBtnAceptar.SetFocus;
      Raise Exception.Create('Debe Aceptar el comprobante');
   End;
   if MessageDlg('¿ Esta Seguro de Contabilizar ?', mtconfirmation,[mbYes,MbNo],0)=mrYes then
   begin
       DMAF.cdsLimReCab.edit;
       DMAF.cdsLimReCab.fieldbyname('ACFCONTA').asstring:='S';
       DMAF.cdsLimReCab.fieldbyname('ACFUSER').asstring:=DMAF.wUsuario;
       DMAF.cdsLimReCab.fieldbyname('ACFFREG').asdatetime:=date;
       DMAF.cdsLimReCab.fieldbyname('HREG').value:=time;
       cdsPost(DMAF.cdsLimReCab);
       DMAF.AplicaDatos(DMAF.cdsLimReCab,'LIMITECAB');


   End;
   Showmessage('Registros Contabilizados');
end;

procedure TFLimReexpres.dbgLimiteDblClick(Sender: TObject);
begin
  pnllimite.visible:=true;
  DMAF.cdsLimReDet.Edit;
end;

procedure TFLimReexpres.BitBtnCancelarClick(Sender: TObject);
begin
  pnllimite.Visible:=false;
end;

procedure TFLimReexpres.BitBtnAceptardClick(Sender: TObject);
var
  xsql:string;
begin
  DMAF.cdsLimReDet.edit;
  xsql:='select DEPFECHA,DEPVALAJUS,ACFVNUEVO,DEPNETOAJU from ACF204 where acfid='''+DMAF.cdsLimReDet.fieldbyname('ACFID').asstring+''' order by depfecha ';
  DMAF.cdsqry.close;
  DMAF.cdsqry.datarequest(xsql);
  DMAF.cdsqry.open;

  DMAF.cdsqry.last;

  if DMAF.cdsLimReDet.fieldbyname('MONTASAC').asfloat< DMAF.cdsqry.fieldbyname('DEPNETOAJU').asfloat  then
  Begin

    DMAF.cdsLimReDet.fieldbyname('MONTODIF').asfloat:=DMAF.cdsqry.fieldbyname('DEPNETOAJU').asfloat-DMAF.cdsLimReDet.fieldbyname('MONTASAC').asfloat;
  End
  else
    DMAF.cdsLimReDet.fieldbyname('MONTODIF').clear;
  DMAF.cdsLimReDet.post;
  pnlLimite.visible:=false;
end;

procedure TFLimReexpres.dblcdActivoExit(Sender: TObject);
begin
     xxcuentaid:=DMAF.cdsActFij.fieldbyname('CUENTAID').asstring;
  xxtacfid:=DMAF.cdsActFij.fieldbyname('TACFID').asstring;
  dbeActivo.text:=DMAF.cdsActFij.fieldbyname('ACFDES').asstring;
  dbecuenta.text:=DMAF.cdsActFij.fieldbyname('CUENTAID').asstring;
end;

procedure TFLimReexpres.BitBtn3Click(Sender: TObject);
var
   Comprobante : RCabComprobante;
   xAAMM, xWhere : String;
begin

   If (DMAF.cdsLimReDet.recordcount=1) and (DMAF.cdsLimReDet.fieldbyname('MONTODIF').asstring='') then
   Begin
      Raise Exception.Create('No se puede Contabilizar el Registro');
   End;

   xWhere := 'TMonId='+''''+DMAF.wTMonExt+''''+' and '
           + 'Fecha='+DMAF.wRepFuncDate+''''+ FORMATDATETIME(DMAF.wFormatFecha,dtpFComp.Date)+''')';
   if length( DMAF.DisplayDescrip('dspTGE','TGE107','*',xWhere,'TMONID'))>0 then
      dbeCambio.Text:=FloattoStr(DMAF.cdsQry.fieldbyname('TCam'+DMAF.wVRN_TipoCambio).AsFloat)
   else begin
      dbeCambio.Text:='0';
   end;

   if DMAF.cdsLimReCab.fieldbyname('ACFCONTA').asstring<>'S' then
       GrabaPrevio;

   xAAMM:='';
   if meNoReg.Text<>'' then
      xAAMM:=FORMATDATETIME('YYYYMM',dtpFComp.Date);

   with Comprobante do begin
      CIAID    := dblcdCia.Text ;
      TDIARID  := dblcTDiario.Text ;
      CiaDes   := dbeCia.Text;
      Diario   := edtTDiario.Text ;
      Proveedor:= '';
      Glosa    := 'Límite de Reexpresión';
      Lote     := 'LREE';
      TipoDoc  := '';
      TipoCamb := dbeCambio.Text ;
      Periodo  := xAAMM;
      NoComp   := meNoReg.Text ;
      NoDoc    := '';
      Cuenta   := '';
      Banco    := '';
      NumChq   := '';
      Moneda   := 'Soles';
   {   dbgConta.ColumnByName('VALORHIS').FooterValue:=FLOATTOSTRF( OperClientDataset(DMAF.cdsTrasSel, 'SUM(VALORHIS)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('AJUSTE').FooterValue:=FLOATTOSTRF( OperClientDataset(DMAF.cdsTrasSel, 'SUM(AJUSTE)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('DEPHIS').FooterValue:=FLOATTOSTRF( OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEPHIS)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('DEPAJU').FooterValue:=FLOATTOSTRF( OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEPAJU)', ''),ffNumber,15,2 );
}
//      Importe  :=FloattoStr(OperClientDataset(DMAF.cdsTrasSel, 'SUM(VALORHIS)', '')+OperClientDataset(DMAF.cdsTrasSel, 'SUM(AJUSTE)', '')+OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEPHIS)', '')+OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEPAJU)', '') );

      Tmoneda  := 'L';
   end;

   FVoucherImp:=TFVoucherImp.Create(Self);
   FVoucherImp.wBienedeForma := 'EGRESO';
   FVoucherImp.wComprobanteI:=Comprobante;
   with FVoucherImp do
   Try
      ShowModal;
   Finally
      Free;
   End;
End;
procedure TFLimReexpres.dblcTDiarioExit(Sender: TObject);
var
  xwhere:string;
begin
   If (DMAF.cdsLimReDet.recordcount=1) and (DMAF.cdsLimReDet.fieldbyname('MONTODIF').asstring='') then
   Begin
      Raise Exception.Create('No se puede Contabilizar el Registro');
      BitBtnContabilizado.enabled:=false;
   End;



     xWhere:='TDiarId='+''''+dblcTDiario.Text+'''';
      edtTDiario.Text:=DMAF.DisplayDescrip('dspTGE','TGE104','*',xWhere,'TDiarDes');
      if length(edtTDiario.Text)=0 then
      begin
         ShowMessage('Falta Tipo de Diario');
         dblcTDiario.SetFocus;
      end;

end;

procedure TFLimReexpres.dtpFCompExit(Sender: TObject);
begin
      DMAF.cdsQry.Close;
      DMAF.cdsQry.Datarequest( 'Select MAX( CNTCOMPROB ) CNTCOMPROB FROM ACF306 WHERE CIAID='''+dblcdCia.Text
      +''' AND CNTANOMM='''+FORMATDATETIME('YYYYMM',dtpFComp.Date)+''' AND CNTLOTE=''LREE'' AND TDIARID='''
      +dblcTDiario.text+'''');

      DMAF.cdsQry.Open;

      if DMAF.cdsQry.FieldByName('CNTCOMPROB').AsString='' then
         meNoReg.text:='0000000001'
      else
         meNoReg.text:=DMAF.StrZero( StrToInt( DMAF.cdsQry.FieldByName('CNTCOMPROB').AsString) +1 , 10 ) ;

end;

procedure TFLimReexpres.FormShow(Sender: TObject);
var
  xsql,xwhere:string;
begin
   DMAF.cdsTipAct.close;
   DMAF.cdsTipAct.DataRequest('SELECT * FROM ACF101');
   DMAF.cdsTipAct.open;

   BitBtn2.enabled:=false;
   BitBtOk.enabled:=false;
   dbglimite.enabled:=false;
   if DMAF.wModo='A' then
   Begin
      DMAF.cdsTDiario.Close;
      DMAF.cdsTDiario.datarequest('SELECT * from TGE104');
      DMAF.cdsTDiario.open;


      DMAF.cdsLimReCab.Close;
      DMAF.cdsLimReCab.DataRequest('SELECT * FROM ACF309 WHERE LREEID=''DD''');
      DMAF.cdsLimReCab.open;
      DMAF.cdsLimReCab.Insert;

      DMAF.cdsLimReDet.Close;
      DMAF.cdsLimReDet.DataRequest('SELECT * FROM ACF310 WHERE LREEID=''DD''');
      DMAF.cdsLimReDet.open;
      BitBtnAceptar.ENABLED:=FALSE;
      BitBtOk.enabled:=true;
      BitBtnContabilizado.enabled:=true;
      dblcdcia.text:='';
      dbeCia.text:='';
      dbdtpFecha.text:='';
      edttasnom.text:='';
      dblcdTipAct.TEXT:='';
      dbeTipact.text:='';
      dblcdActivo.text:='';
      dbeActivo.text:='';
      dbecuenta.text:='';
      edtmontotas.text:='';;
      activop.text:='';
      montop.text:='';
      BitBtn1.enabled:=true;
      dblcTDiario.text:='';
      edtTDiario.text:='';
      dtpFComp.text:='';
      meNoReg.text:='';
      dbeCambio.text:='';

   end;
   panel1.enabled:=true;
   panel2.enabled:=false;
   if DMAF.wModo='M' then
   Begin
      dblcdcia.text:=DMAF.cdsLimReCab.fieldbyname('CIAID').asstring;

      edttasnom.text:=DMAF.cdsLimReCab.fieldbyname('NOMTASADOR').asstring;
      dblcdTipAct.TEXT:='';
      dbeTipact.text:='';
      dblcdActivo.text:='';
      dbeActivo.text:='';
      dbecuenta.text:='';
      edtmontotas.text:='';;
      activop.text:='';
      montop.text:='';
      panel1.enabled:=false;
      BitBtn1.enabled:=false;
      panel2.enabled:=true;
      If   DMAF.cdsLimReCab.fieldbyname('ACFESTADO').asstring='I' then
      Begin
         panel1.enabled:=false;
         dbgLimite.ENABLED:=TRUE;
         BitBtn2.ENABLED:=TRUE;
      End;
      dblcTDiario.text:=DMAF.cdsLimReCab.fieldbyname('TDIARID').asstring;
      dtpFComp.date:=DMAF.cdsLimReCab.fieldbyname('FECHAC').asdatetime;
      meNoReg.text:=DMAF.cdsLimReCab.fieldbyname('ACFCOMPROB').asstring;
      dbeCambio.text:=DMAF.cdsLimReCab.fieldbyname('TCAMBIO').asstring;
      if DMAF.cdsLimReCab.fieldbyname('ACFCONTA').asstring='S' then
      Begin
             lblACF.visible:=True;
             pnlDatos.Enabled:=TRUE;
             panel1.enabled:=false;
             panel2.enabled:=false;
             dbglimite.enabled:=false;
             pnldatos.enabled:=false;
             BitBtnContabilizado.enabled:=false;
             BitBtnAceptar.enabled:=false;
             BitBtOk.enabled:=false;
             BitBtn1.enabled:=false;
             BitBtn2.enabled:=false;

      End
      else
             lblACF.visible:=false;
//      dbdtpFecha.text:=DMAF.cdsLimReCab.fieldbyname('FECHA').asstring;
      If  ( DMAF.cdsLimReCab.fieldbyname('ACFESTADO').asstring='P') and ( DMAF.cdsLimReCab.fieldbyname('ACFCONTA').asstring<>'S') then
      Begin
             pnlDatos.Enabled:=TRUE;
      End;
      xWhere:='TDiarId='+''''+dblcTDiario.Text+'''';
      edtTDiario.Text:=DMAF.DisplayDescrip('dspTGE','TGE104','*',xWhere,'TDiarDes');
      xWhere:='CIAID='''+dblcdcia.Text+'''';
      dbecia.Text:=DMAF.DisplayDescrip('dspTGE','TGE101','CIADES',xWhere,'CIADES');
      BitBtn1.enabled:=false;
      xsql:='SELECT * FROM ACF310 where LREEID='''+DMAF.cdsLimReCab.fieldbyname('LREEID').asstring+'''';
      DMAF.cdsLimReDet.close;
      DMAF.cdsLimReDet.DataRequest(xsql);
      DMAF.cdsLimReDet.open;
      DMAF.cdsTDiario.Close;
      DMAF.cdsTDiario.datarequest('SELECT * from TGE104');
      DMAF.cdsTDiario.open;

   End;
   panel1.enabled:=true;
   pnllimite.Visible:=false;
end;

// GRID DE SELECCION DE TIPOS
procedure TFLimReexpres.InsertaConta;
var
   xTCam : Double;
   XSQL : string;
begin

   xSQL:='SELECT REIAJUSTE FROM ACF110 '
        +'WHERE CUENTAID='''   +DMAF.cdsQry2.fieldbyname('CUENTAID').asstring+''' ';
   DMAF.cdsQry3.Close;
   DMAF.cdsQry3.DataRequest( xSQL );
   DMAF.cdsQry3.Open;


   DMAF.cdsACFCont.Insert;
   DMAF.cdsACFCont.FieldByName('CIAID').Value     :=dblcdCia.Text;
   DMAF.cdsACFCont.FieldByName('TDIARID').Value   :=dblcTDiario.Text;
   DMAF.cdsACFCont.FieldByName('CNTCOMPROB').Value:=meNoreg.Text;
   DMAF.cdsACFCont.FieldByName('CNTANOMM').Value  :=xxanommc;    //        FORMATDATETIME('YYYYMM',.Date);
   DMAF.cdsACFCont.FieldByName('CNTFCOMP').Value  :=dtpFComp.Date;
   DMAF.cdsACFCont.FieldByName('CNTNODOC').Value  :=' '; //dbeNumero.text;

   DMAF.cdsACFCont.FieldByName('CUENTAID').Value  :=DMAF.cdsQry3.fieldbyname('REIAJUSTE').asstring;
   DMAF.cdsACFCont.FieldByName('CNTGLOSA').Value  :='Limite de Reexpresión';
   DMAF.cdsACFCont.FieldByName('CNTDH').Value     :='H';
   DMAF.cdsACFCont.FieldByName('TMONID').Value    :=DMAF.wTMonLoc;
   DMAF.cdsACFCont.FieldByName('CNTTCAMBIO').Value:=StrToFloat( dbeCambio.Text );
   DMAF.cdsACFCont.FieldByName('CAMPOVAR').Value  :=DMAF.cdsQry2.FieldByname('TACFID').AsString;
   DMAF.cdsACFCont.FieldByName('CNTLOTE').Value   :='LREE';

   DMAF.cdsACFCont.FieldByName('CNTMTOORI').asfloat :=DMAF.cdsQry2.FieldByname('MONTODIF').Asfloat;
   DMAF.cdsACFCont.FieldByName('CNTMTOLOC').asfloat :=DMAF.cdsQry2.FieldByname('MONTODIF').Asfloat;
   DMAF.cdsACFCont.FieldByName('CNTMTOEXT').asfloat :=0;  //FRound( xMonto/xTCam,15,2);;

   if DMAF.cdsACFCont.FieldByName('CNTDH').asstring='D' then begin
      DMAF.cdsACFCont.FieldByName('CNTDEBEMN').asfloat :=DMAF.cdsQry2.FieldByname('MONTODIF').Asfloat;
      DMAF.cdsACFCont.FieldByName('CNTDEBEME').asfloat :=0;  //FRound( xMonto/xTCam,15,2);
   end
   else begin
      DMAF.cdsACFCont.FieldByName('CNTHABEMN').asfloat :=DMAF.cdsQry2.FieldByname('MONTODIF').Asfloat;
      DMAF.cdsACFCont.FieldByName('CNTHABEME').asfloat :=0;  //FRound( xMonto/xTCam,15,2);
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
   xCNTReg:=xCNTReg+1;
   DMAF.cdsACFCont.FieldByName('CNTREG').VALUE :=xCNTReg;

   DMAF.cdsACFCont.FieldByName('CNTUSER').VALUE :=DMAF.wUsuario;
   DMAF.cdsACFCont.FieldByName('CNTFREG').VALUE :=DATE;
   DMAF.cdsACFCont.FieldByName('CNTHREG').VALUE :=TIME;

   ////////////////////

   DMAF.cdsACFCont.Insert;
   DMAF.cdsACFCont.FieldByName('CIAID').Value     :=dblcdCia.Text;
   DMAF.cdsACFCont.FieldByName('TDIARID').Value   :=dblcTDiario.Text;
   DMAF.cdsACFCont.FieldByName('CNTCOMPROB').Value:=meNoreg.Text;
   DMAF.cdsACFCont.FieldByName('CNTANOMM').Value  :=xxanommc;
   DMAF.cdsACFCont.FieldByName('CNTFCOMP').Value  :=dtpFComp.Date;
   DMAF.cdsACFCont.FieldByName('CNTNODOC').Value  :=' '; //dbeNumero.text;

   DMAF.cdsACFCont.FieldByName('CUENTAID').asstring  :=DMAF.DisplayDescrip('dspTGE','ACF110','LIMREEX','CUENTAID='''+DMAF.cdsQry2.fieldbyname('CUENTAID').asstring+'''','LIMREEX');
   DMAF.cdsACFCont.FieldByName('CNTGLOSA').Value  :='Límite de Reexpresión';
   DMAF.cdsACFCont.FieldByName('TMONID').Value    :=DMAF.wTMonLoc;
   DMAF.cdsACFCont.FieldByName('CNTTCAMBIO').Value:=StrToFloat( dbeCambio.Text );
   DMAF.cdsACFCont.FieldByName('CAMPOVAR').asstring  :=DMAF.cdsQry2.FieldByname('TACFID').AsString;
   DMAF.cdsACFCont.FieldByName('CNTLOTE').asstring   :='LREE';

   DMAF.cdsACFCont.FieldByName('CNTMTOORI').asfloat :=DMAF.cdsQry2.FieldByname('MONTODIF').Asfloat;
   DMAF.cdsACFCont.FieldByName('CNTMTOLOC').asfloat :=DMAF.cdsQry2.FieldByname('MONTODIF').Asfloat;
   DMAF.cdsACFCont.FieldByName('CNTMTOEXT').asfloat :=0;  //FRound( xMonto/xTCam,15,2);;
   DMAF.cdsACFCont.FieldByName('CNTDH').Value     :='D';

   if DMAF.cdsACFCont.FieldByName('CNTDH').asstring='D' then begin
      DMAF.cdsACFCont.FieldByName('CNTDEBEMN').asfloat :=DMAF.cdsQry2.FieldByname('MONTODIF').Asfloat;
      DMAF.cdsACFCont.FieldByName('CNTDEBEME').asfloat :=0;  //FRound( xMonto/xTCam,15,2);
   end
   else begin
      DMAF.cdsACFCont.FieldByName('CNTHABEMN').asfloat :=DMAF.cdsQry2.FieldByname('MONTODIF').Asfloat;
      DMAF.cdsACFCont.FieldByName('CNTHABEME').asfloat :=0;  //FRound( xMonto/xTCam,15,2);
   end;

{   if xDH='D' then begin
      DMAF.cdsACFCont.FieldByName('CNTDH').Value     :='H';
      DMAF.cdsACFCont.FieldByName('CNTHABEMN').Value :=xMonto;
      DMAF.cdsACFCont.FieldByName('CNTHABEME').Value :=0;  //FRound( xMonto/xTCam,15,2);
   end
   else begin
      DMAF.cdsACFCont.FieldByName('CNTDH').Value     :='D';
      DMAF.cdsACFCont.FieldByName('CNTDEBEMN').Value :=xMonto;
      DMAF.cdsACFCont.FieldByName('CNTDEBEME').Value :=0;  //FRound( xMonto/xTCam,15,2);
   end;
 }
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
           +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
           +'TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFComp.Date)+''')';
   end;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;


   DMAF.cdsACFCont.FieldByName('CNTANO').VALUE  :=DMAF.cdsQry.FieldByName('FECANO').Value;
   DMAF.cdsACFCont.FieldByName('CNTMM').VALUE   :=DMAF.cdsQry.FieldByName('FECMES').Value;
   DMAF.cdsACFCont.FieldByName('CNTDD').VALUE   :=DMAF.cdsQry.FieldByName('FECDIA').Value;
   DMAF.cdsACFCont.FieldByName('CNTTRI').VALUE  :=DMAF.cdsQry.FieldByName('FECTRIM').Value;
   DMAF.cdsACFCont.FieldByName('CNTSEM').VALUE  :=DMAF.cdsQry.FieldByName('FECSEM').Value;
   DMAF.cdsACFCont.FieldByName('CNTSS').VALUE   :=DMAF.cdsQry.FieldByName('FECSS').Value;
   DMAF.cdsACFCont.FieldByName('CNTAATRI').VALUE:=DMAF.cdsQry.FieldByName('FECAATRI').Value;
   DMAF.cdsACFCont.FieldByName('CNTAASEM').VALUE:=DMAF.cdsQry.FieldByName('FECAASEM').Value;
   DMAF.cdsACFCont.FieldByName('CNTAASS').VALUE :=DMAF.cdsQry.FieldByName('FECAASS').Value;
   xCNTReg:=xCNTReg+1;
   DMAF.cdsACFCont.FieldByName('CNTREG').VALUE :=xCNTReg;


   DMAF.cdsACFCont.FieldByName('CNTUSER').VALUE :=DMAF.wUsuario;
   DMAF.cdsACFCont.FieldByName('CNTFREG').VALUE :=DATE;
   DMAF.cdsACFCont.FieldByName('CNTHREG').VALUE :=TIME;
end;

procedure TFLimReexpres.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

end.
