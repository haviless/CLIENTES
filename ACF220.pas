unit ACF220;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwmonthcalendar, Mask, wwdbedit, wwdbdatetimepicker,
  wwdblook, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls;

type
  TFDeprecia = class(TForm)
    Label1: TLabel;
    bbtnOk1: TBitBtn;
    bbtnCancela4: TBitBtn;
    wMensaje1: TLabel;
    wMensaje2: TLabel;
    dblcdPeriodo: TwwDBLookupComboDlg;
    wMensaje3: TLabel;
    Label2: TLabel;
    wMensaje4: TLabel;
    Label74: TLabel;
    dblcTipoD: TwwDBLookupCombo;
    dbeTipo: TwwDBEdit;
    procedure bbtnOk1Click(Sender: TObject);
    procedure bbtnCancela4Click(Sender: TObject);
    procedure dbgTipoDepDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcTipoDExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdPeriodoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDeprecia: TFDeprecia;
  wSql, wFaperiodo : string;

implementation

uses ACFDM;

{$R *.DFM}

procedure TFDeprecia.FormActivate(Sender: TObject);
begin
// PRESENTA TIPOS DE DEPRECIACION ACTIVOS
    wSQL:= 'SELECT * FROM ACF104 WHERE';
    wSql:=wSql+' DEPFLAGACT='+''''+'A'+'''';
    //INICIO SAR666
   (* DM1.cdsUDEP.Close;
    DM1.cdsUDEP.DataRequest(wSQL);
    DM1.cdsUDEP.Open;

   if DM1.cdsUDep.RecordCount=1 then begin*)

    DMAF.cdsUDEP.Close;
    DMAF.cdsUDEP.DataRequest(wSQL);
    DMAF.cdsUDEP.Open;

   if DMAF.cdsUDep.RecordCount=1 then begin
   //FIN SAR666
      //INICIO SAR666
      //dblcTipoD.Text:=DM1.cdsUDep.FieldByName('DEPCOD').AsString;
      dblcTipoD.Text:=DMAF.cdsUDep.FieldByName('DEPCOD').AsString;
      //FIN SAR666
      dblcTipoDExit(Sender);
      dblcdPeriodo.SetFocus;
   end;


end;

// GRID DE SELECCION DE TIPOS
procedure TFDeprecia.dbgTipoDepDblClick(Sender: TObject);
begin
   wMensaje1.Visible:=False;
   wMensaje2.Visible:=False;
   wMensaje3.Caption:=DMAF.cdsUDep.FieldByName('DepDescri').Value; //SAR666
   wMensaje4.Visible:=False;

// PRESENTA POSIBLES PERIODOS A PROCESAR EN LOOKUP: MISMO TIPO-
// DEPREC., PDTE. DE PROCESO'X' y MAYOR A ULTIMO PERIODO DEPRECIACION
    wSQL:= 'SELECT * FROM ACF102 WHERE';
    wSQL:=wSQL+' DEPCOD='+''''+DMAF.CDSUDEP.FieldByName('DEPCOD').VALUE+'''';   //SAR666
    wSql:=wSql+' AND FAPROC='+''''+'X'+'''' ;
    wSql:=wSql+' AND FAPERIODO>'+''''+DMAF.CDSUDEP.FieldByName('FAPERIODO').AsString+'''';   //SAR666
    wSql:=wSql+' ORDER BY FAPERIODO';

    //INICIO SAR666
    (*DM1.cdsFACTOR.Close;
    DM1.cdsFACTOR.DataRequest(wSQL);
    DM1.cdsFACTOR.Open;*)
    DMAF.cdsFACTOR.Close;
    DMAF.cdsFACTOR.DataRequest(wSQL);
    DMAF.cdsFACTOR.Open;
    //FIN SAR666
end;

// LOOKUP de periodo , PROCESO PRELIMINAR.
procedure TFDeprecia.bbtnOk1Click(Sender: TObject);
var
   wXX, wFECANO, wFECDIA, wFECTRIM, wFECSS, wFECAASEM, wFECMMSS,
   wFECMES, wFECDIASS, wFECSEM, wFECAATRI, wFECAASS, xFecDep, xFecStr : string;
   wFecpro : TDate;
   WHReg   : TTime;
   xSQL, xACF1, xACF2, xACF3, xACF4, xACF5 : String;
begin

   if dbeTipo.Text='' then begin
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   end;

   wFaperiodo:=dblcdPeriodo.text;
   wMensaje2.caption:='';
   wSql:='FAPERIODO='''+WFAPERIODO+''' AND DEPCOD='''+dblcTipoD.Text+'''';
   WMensaje2.caption:=DMAF.DisplayDescrip('dspQry1','ACF102','*',wSql,'FaFecDepre');     //SAR666
   if Length(WMensaje2.caption)=0 then
   begin
      Raise exception.Create('No existe Periodo de Depreciación');
   end;

   If DMAF.cdsFactor.FieldByname('Faproc').AsString='P' then //SAR666
   begin
      Raise exception.Create('Periodo ya fue Procesado');
   end;
   wMensaje4.Visible:=True;
   wMensaje4.Caption:=DMAF.CdsFactor.FieldByname('FaDescrip').AsString;  //SAR666

// SE ACCESó EN GRID
   if DMAF.cdsUDep.FieldByName('FaPeriodo').AsString >= DMAF.cdsFactor.FieldByname('FaPeriodo').AsString then
   begin
      wXX:='Periodo debe ser posterior a última Depreciación ' +DMAF.cdsUDep.FieldByName('FaPeriodo').AsString;
      Raise exception.Create(wxx);
   end;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='SELECT CIAID,TACFID,ACFID,ACFREFOR, '
           +  'SUM( COALESCE(AFDEPREP,0) ) as XSUM '
           +'FROM ACF103 '
           +'GROUP BY CIAID, TACFID, ACFID, ACFREFOR '
           +'HAVING SUM( COALESCE( AFDEPREP,0 ) )<>100';
   end;

   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='SELECT CIAID,TACFID,ACFID,ACFREFOR, '
           +  'SUM(' +DMAF.wReplacCeros +'(AFDEPREP,0) ) as XSUM '    //SAR666
           +'FROM ACF103 '
           +'GROUP BY CIAID, TACFID, ACFID, ACFREFOR '
           +'HAVING SUM('+DMAF.wReplacCeros+'( AFDEPREP,0 ) )<>100'; //SAR666
   end;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName:='dspTGE';
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;
   //
   xACF1:='Compañía      : '  + DMAF.cdsQry.FieldByName('CIAID').AsString;
   xACF2:='Tipo Activo    : ' + DMAF.cdsQry.FieldByName('TACFID').AsString;
   xACF3:='Activo Fijo     : '+ DMAF.cdsQry.FieldByName('ACFID').AsString;
   xACF4:='# Reforma     : '  + DMAF.cdsQry.FieldByName('ACFREFOR').AsString;

   if DMAF.cdsQry.RecordCount>0 then begin    //SAR666
      xACF5:='Total.Distrib. : ' + FloatToStr(DMAF.cdsQry.FieldByName('XSUM').Value)+'%';
      Raise Exception.Create('Error en Distribución, Revisar ' + Chr(13)+
                              Chr(13) + xACF1 + Chr(13) + xACF2 + Chr(13)+
                              xACF3 + Chr(13) + xACF4 + Chr(13) + xACF5 );
   end;
   //
   Screen.Cursor:=CrHourGlass;
   
   wFecpro:=Date;
   wHreg  :=Time;
// toma datos de registro de fecha

   xFecStr:=DateToStr(DMAF.cdsFactor.FieldByname('FaFecDepre').AsDateTime);

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      WSQL:='SELECT * FROM TGE114 WHERE FECHA='
           +'DATE('''+FORMATDATETIME('YYYY-MM-DD',DMAF.cdsFactor.fieldbyname('FaFecDepre').AsDateTime)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
       WSQL:='SELECT * FROM TGE114 WHERE FECHA='
         +'TO_DATE('''+FORMATDATETIME(DMAF.wFormatFecha,DMAF.cdsFactor.fieldbyname('FaFecDepre').AsDateTime)+''')';
   end;
   DMAF.cdsWork1.Close;
   DMAF.cdsWork1.datarequest(WSQL);
   DMAF.cdsWork1.OPEN;

   if DMAF.cdsWork1.RecordCount>0 then begin
      wFECDIA  :=DMAF.cdsWork1.FIELDBYNAME('FECDIA').AsString;
      wFECTRIM :=DMAF.cdsWork1.FIELDBYNAME('FECTRIM').AsString;
      wFECSS   :=DMAF.cdsWork1.FIELDBYNAME('FECSS').AsString;
      wFECAASEM:=DMAF.cdsWork1.FIELDBYNAME('FECAASEM').AsString;
      wFECMMSS :=DMAF.cdsWork1.FIELDBYNAME('FECMMSS').AsString;
      wFECDIASS:=DMAF.cdsWork1.FIELDBYNAME('FECDIASS').AsString;
      wFECSEM  :=DMAF.cdsWork1.FIELDBYNAME('FECSEM').AsString;
      wFECAATRI:=DMAF.cdsWork1.FIELDBYNAME('FECAATRI').AsString;
      wFECAASS :=DMAF.cdsWork1.FIELDBYNAME('FECAASS').AsString;
   end;
   wFECANO  :=Copy(xFecStr,7,4);
   wFECMES  :=Copy(xFecStr,4,2);

//............... Proceso de Depreciación Preliminar ....................

//1.LIMPIA AREA DE TRABAJO ACF204W
//  deletea TIPO especifico......
   wSql:='DELETE FROM ACF204W WHERE DEPCOD='''+dblcTipoD.Text+'''';

   try
     DMAF.DCom1.AppServer.EjecutaSQL(wSql);
   except
   end;

//2.Crea Area de trabajo a partir de ACF204 y realiza proceso, con regs.
//  pdtes(X), meses a depreciar > 0 y Tipo de Depreciación específico.

   xFecDep := FORMATDATETIME('YYYY-MM-DD',DMAF.cdsFactor.FieldByname('FaFecDepre').AsDateTime);

//Genera Temporal

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin

   xFecDep := FORMATDATETIME('YYYY-MM-DD',DMAF.cdsFactor.FieldByname('FaFecDepre').AsDateTime);

   wSql:='INSERT INTO ACF204W '
       + '(DEPCOD, CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO,'
       + 'FAREDONDEO,  DEPNOMESES, DEPFECHA, TACFDEPREC, '
       + 'DEPVALHIST, DEPVALAJUS, '
       + 'DEPANTHIST, DEPANTAJUS, '
       + 'DEPIMPHIST, DEPIMPAJUS, '
       + 'DEPACUHIST, DEPACUAJUS, DEPFLAGPRO, DEPFECPRO, DEPUSER, DEPHREG,'
       + 'DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, CCOSID, LOCID,UBICID,'
       + 'FECANO,FECMES,FECDIA,FECDIASS,FECTRIM,FECSEM,FECSS,FECAATRI,'
       + 'FECAASEM,FECAASS,FECMMSS,ACFREFOR,AFCOD,AFDEPREP)'
       +'( '
      +'SELECT A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, Max( B.CUENTAID ), '
       + 'Max( A.DEPFLAGREF ), '
       + ''''+WFAPERIODO+''', '
       + 'DECIMAL( MAX( C.IPM )/MAX( D.IPM ) + '
       + 'CASE WHEN DECIMAL( MAX( C.IPM )/MAX( D.IPM ),15,4 )- '
       +           'DECIMAL( MAX( C.IPM )/MAX( D.IPM ),15,3 )>=0.0005 '
       +      'THEN 0.001 ELSE 0 END, 15,3), '
       + 'Max( ((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30) ), '
       + 'Max( A.DEPFECHA ), '
       + 'CASE WHEN MAX(E.TACFDEP)=''S'' THEN Max( A.TACFDEPREC ) ELSE 0 END, '
       + 'SUM( COALESCE(A.DEPVALAJUS,0) ), '
       + 'SUM( COALESCE(A.DEPVALAJUS,0) ), '
       + 'SUM( COALESCE(A.DEPACUAJUS,0) ), '
       + 'SUM( COALESCE(A.DEPACUAJUS,0) ), '
       + '0, 0, 0, 0, '
       + '''T'' , DATE('''+FORMATDATETIME('YYYY-MM-DD',WFECPRO)+'''), '
       + ''''+DMAF.wUsuario+''', '''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
       + 'DATE('''+xFecDep+'''), Max(A.ACFDES), Max(A.ACFFECADQ), '
       + 'Max( A.ACFVALOMN ), Max( B.CCOSID ), Max( B.LOCID ), Max( B.UBICID ), '
       + ''''+WFECANO  +''', ''' +WFECMES  +''', '''+WFECDIA+''', '
       + ''''+WFECDIASS+''', ''' +WFECTRIM +''', '''+WFECSEM+''', '
       + ''''+WFECSS   +''', ''' +WFECAATRI+''', '''+WFECAASEM+''', '
       + ''''+WFECAASS +''', ''' +WFECMMSS +''', '
       + 'Max( A.ACFREFOR ), Max( A.AFCOD ), Max( A.AFDEPREP ) '
       +'FROM ACF204 A, ACF101 E, ACF201 B, CNT103 C, CNT103 D '
       +'WHERE A.TACFID=E.TACFID AND '
       +     'A.DEPFLAGPRO=''X'' and '
       +     '((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)>=1 and '
       +     'A.DEPCOD='''+dblcTipoD.Text+''' and '
       +     'A.CIAID=B.CIAID and A.ACFID=B.ACFID and '
       +     'A.ACFREFOR=B.ACFREFOR and '
       +     'C.PERIODO='''+WFAPERIODO+''' and '
       +     'D.PERIODO=A.FAPERIODO '
       +'Group by A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, A.ACFREFOR ) ';
   end;
   if (SRV_D = 'ORACLE') then
   begin

      xFecDep := FORMATDATETIME('DD-MM-YYYY',DMAF.cdsFactor.FieldByname('FaFecDepre').AsDateTime);

      wSql:='INSERT INTO ACF204W '
          + '(DEPCOD, CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO,'
          + 'FAREDONDEO,  DEPNOMESES, DEPFECHA, TACFDEPREC, '
          + 'DEPVALHIST, DEPVALAJUS, '
          + 'DEPANTHIST, DEPANTAJUS, '
          + 'DEPIMPHIST, DEPIMPAJUS, '
          + 'DEPACUHIST, DEPACUAJUS, DEPFLAGPRO, DEPFECPRO, DEPUSER, DEPHREG,'
          + 'DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, CCOSID, LOCID,UBICID,'
          + 'FECANO,FECMES,FECDIA,FECDIASS,FECTRIM,FECSEM,FECSS,FECAATRI,'
          + 'FECAASEM,FECAASS,FECMMSS,ACFREFOR,AFCOD,AFDEPREP)'
          +'( '
         +'SELECT A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, Max( B.CUENTAID ), '
          + 'Max( A.DEPFLAGREF ), '
          + ''''+WFAPERIODO+''', '
          +' MAX( C.IPM )/MAX( D.IPM ) + '
          +' DECODE(LEAST(MAX( C.IPM )/MAX( D.IPM )- '
          +'              MAX( C.IPM )/MAX( D.IPM ),0.0004), 0.0004, 0.001, 0 ), '
          + 'Max (TO_NUMBER(TO_CHAR(TO_DATE('''+xFecDep+ '''),''DDD'')-TO_NUMBER(TO_CHAR(A.DEPFECHA,''DDD''))/30) ), '
          + 'Max( A.DEPFECHA ), Max( A.TACFDEPREC ), '
          + 'SUM( NVL(A.DEPVALAJUS,0) ), '
          + 'SUM( NVL(A.DEPVALAJUS,0) ), '
          + 'SUM( NVL(A.DEPACUAJUS,0) ), '
          + 'SUM( NVL(A.DEPACUAJUS,0) ), '
          + '0, 0, 0, 0, '
          + '''T'' , TO_DATE('''+FORMATDATETIME('DD-MM-YYY',WFECPRO)+'''), '
          + ''''+DMAF.wUsuario+''', SYSDATE, '
          + 'TO_DATE('''+ xFecDep +'''), Max(A.ACFDES), Max(A.ACFFECADQ), '
          + 'Max( A.ACFVALOMN ), Max( B.CCOSID ), Max( B.LOCID ), Max( B.UBICID ), '
          + ''''+WFECANO  +''', ''' +WFECMES  +''', '''+WFECDIA+''', '
          + ''''+WFECDIASS+''', ''' +WFECTRIM +''', '''+WFECSEM+''', '
          + ''''+WFECSS   +''', ''' +WFECAATRI+''', '''+WFECAASEM+''', '
          + ''''+WFECAASS +''', ''' +WFECMMSS +''', '
          + 'Max( A.ACFREFOR ), Max( A.AFCOD ), Max( A.AFDEPREP ) '
          +'FROM ACF204 A, ACF101 E, ACF201 B, CNT103 C, CNT103 D '
          +'WHERE A.TACFID=E.TACFID AND A.DEPFLAGPRO=''X'' and '
         +     '( TO_CHAR(TO_DATE('''+xFecDep+'''),''DDD'')-TO_CHAR(A.DEPFECHA,''DDD'') )/30>=1 and '
          +     'A.DEPCOD='''+dblcTipoD.Text+''' and '
          +     'A.CIAID=B.CIAID and A.ACFID=B.ACFID and '
          +     'A.ACFREFOR=B.ACFREFOR and '
          +     'C.PERIODO='''+WFAPERIODO+''' and '
          +     'D.PERIODO=A.FAPERIODO '
          +'Group by A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, A.ACFREFOR ) ';
      end;

   DMAF.DCom1.AppServer.EjecutaSQL(wSql);

  //Genera Nuevos Registros
   if (SRV_D = 'DB2NT') then
   begin
   wSql:='INSERT INTO ACF204W ( '
        + 'DEPCOD, CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO, '
        + 'FAREDONDEO, DEPNOMESES, DEPFECHA, TACFDEPREC, '
        + 'DEPVALHIST, DEPVALAJUS, '
        + 'DEPANTHIST, DEPANTAJUS, ' // VHN
        + 'DEPIMPHIST, DEPIMPAJUS, '
        + 'DEPACUHIST, DEPACUAJUS, DEPFLAGPRO, DEPFECPRO, DEPUSER, DEPHREG,'
        + 'DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, CCOSID, LOCID, UBICID,'
        + 'FECANO, FECMES, FECDIA, FECDIASS, FECTRIM, FECSEM, FECSS, FECAATRI, '
        + 'FECAASEM, FECAASS, FECMMSS, ACFREFOR, AFCOD, AFDEPREP ) '
        +'( '
       +'SELECT A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, A.CUENTAID, A.DEPFLAGREF, '
        + ''''+wFAPERIODO+''', FAREDONDEO, '
        + '((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30), '
        + 'A.DEPFECHA, A.TACFDEPREC, '
        + 'Round( A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100, 2 ), '
        + 'Round( A.DEPVALAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100, 2 ), '

        + 'Round( A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100, 2 ), '
        + 'Round( A.DEPANTAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100, 2 ), '

        + 'Round( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100, 2 ), '
        + 'Round( ((((A.DEPVALAJUS*DECIMAL(FAREDONDEO,12,3))*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100, 2 ), '

        + 'Round( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END, 2 ), '
        + 'Round( COALESCE(DEPACUAJUS,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END, 2 ), '
        + '''X'', DATE('''+FORMATDATETIME('YYYY-MM-DD',WFECPRO)+'''), '
        + ''''+DMAF.wUsuario+''', '''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
        + 'DATE('''+xFecDep+'''), '
        + 'A.ACFDES, A.ACFFECADQ, A.ACFVALOMN, CASE WHEN A.CIAID=B.CIAID and A.ACFID=B.ACFID THEN B.CCOSID ELSE A.CCOSID END, A.LOCID, A.UBICID, '
        + ''''+WFECANO  +''', ''' +WFECMES  +''', '''+WFECDIA+''', '
        + ''''+WFECDIASS+''', ''' +WFECTRIM +''', '''+WFECSEM+''', '
        + ''''+WFECSS   +''', ''' +WFECAATRI+''', '''+WFECAASEM+''', '
        + ''''+WFECAASS +''', ''' +WFECMMSS +''', A.ACFREFOR, B.AFCOD, B.AFDEPREP '
        +'FROM ACF204W A '
        +'LEFT OUTER JOIN ACF103 B ON ( A.CIAID=B.CIAID and A.ACFID=B.ACFID and A.ACFREFOR=B.ACFREFOR ) '
        +'WHERE A.DEPFLAGPRO=''T'' and '
        +     '((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)>=1 and '
        +     'A.DEPCOD='''+dblcTipoD.Text+''' )';
   end;

   If (SRV_D = 'DB2400') then
   begin
   wSql:='INSERT INTO ACF204W ( '
        + 'DEPCOD, CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO, '
        + 'FAREDONDEO, DEPNOMESES, DEPFECHA, TACFDEPREC, '
        + 'DEPVALHIST, DEPVALAJUS, '
        + 'DEPANTHIST, DEPANTAJUS, ' // VHN
        + 'DEPIMPHIST, DEPIMPAJUS, '
        + 'DEPACUHIST, DEPACUAJUS, DEPFLAGPRO, DEPFECPRO, DEPUSER, DEPHREG,'
        + 'DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, CCOSID, LOCID, UBICID,'
        + 'FECANO, FECMES, FECDIA, FECDIASS, FECTRIM, FECSEM, FECSS, FECAATRI, '
        + 'FECAASEM, FECAASS, FECMMSS, ACFREFOR, AFCOD, AFDEPREP ) '
        +'( '
       +'SELECT A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, A.CUENTAID, A.DEPFLAGREF, '
        + ''''+wFAPERIODO+''', FAREDONDEO, '
        + '((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30), '
        + 'A.DEPFECHA, A.TACFDEPREC, '
//*        + 'Round( A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100, 2 ), '
        + ' case when (dec(( A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100 )*power(10,2),15,2)-int(( A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100 )*power(10,2)))*10>=5 '
        + ' then dec(( A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100 ),15,2)+1/power(10,2) else dec(( A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100 ),15,2) end, '

//*        + 'Round( A.DEPVALAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100, 2 ), '
        + ' case when (dec(( A.DEPVALAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100 )*power(10,2),15,2)-int(( A.DEPVALAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100 )*power(10,2)))*10>=5 '
        + ' then dec(( A.DEPVALAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100 ),15,2)+1/power(10,2) else dec(( A.DEPVALAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100 ),15,2) end, '

//*        + 'Round( A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100, 2 ), '
        + ' case when (dec(( A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100 )*power(10,2),15,2)-int(( A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100 )*power(10,2)))*10>=5 '
        + ' then dec(( A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100 ),15,2)+1/power(10,2) else dec(( A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100 ),15,2) end, '

//*        + 'Round( A.DEPANTAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100, 2 ), '
         + ' case when (dec(( A.DEPANTAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100 )*power(10,2),15,2)-int(( A.DEPANTAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100 )*power(10,2)))*10>=5 '
        + ' then dec(( A.DEPANTAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100 ),15,2)+1/power(10,2) else dec(( A.DEPANTAJUS * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100 ),15,2) end, '

//*        + 'Round( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100, 2 ), '
        + ' case when (dec(( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100 )*power(10,2),15,2)-int(( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100 )*power(10,2)))*10>=5 '
        + ' then dec(( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100 ),15,2)+1/power(10,2) else dec(( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100 ),15,2) end, '



//*        + 'Round( ((((A.DEPVALAJUS*DECIMAL(FAREDONDEO,12,3))*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100, 2 ), '
        + ' case when (dec(( ((((A.DEPVALAJUS*DECIMAL(FAREDONDEO,12,3))*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100 )*power(10,2),15,2)-int(( ((((A.DEPVALAJUS*DECIMAL(FAREDONDEO,12,3))*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100 )*power(10,2)))*10>=5 '
        + ' then dec(( ((((A.DEPVALAJUS*DECIMAL(FAREDONDEO,12,3))*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100 ),15,2)+1/power(10,2) else dec(( ((((A.DEPVALAJUS*DECIMAL(FAREDONDEO,12,3))*A.TACFDEPREC)/100)/12)*((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)* COALESCE(B.AFDEPREP,100)/100 ),15,2) end, '

//*        + 'Round( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END, 2 ), '
        + ' case when (dec(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END )*power(10,2),15,2)-int(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END )*power(10,2)))*10>=5 '
        + ' then dec(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END ),15,2)+1/power(10,2) else dec(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END ),15,2) end, '

//*        + 'Round( COALESCE(DEPACUAJUS,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END, 2 ), '
        + ' case when (dec(( COALESCE(DEPACUAJUS,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END )*power(10,2),15,2)-int(( COALESCE(DEPACUAJUS,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END )*power(10,2)))*10>=5 '
        + ' then dec(( COALESCE(DEPACUAJUS,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END ),15,2)+1/power(10,2) else dec(( COALESCE(DEPACUAJUS,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END ),15,2) end, '


        + '''X'', DATE('''+FORMATDATETIME('YYYY-MM-DD',WFECPRO)+'''), '
        + ''''+DMAF.wUsuario+''', '''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
        + 'DATE('''+xFecDep+'''), '
        + 'A.ACFDES, A.ACFFECADQ, A.ACFVALOMN, CASE WHEN A.CIAID=B.CIAID and A.ACFID=B.ACFID THEN B.CCOSID ELSE A.CCOSID END, A.LOCID, A.UBICID, '
        + ''''+WFECANO  +''', ''' +WFECMES  +''', '''+WFECDIA+''', '
        + ''''+WFECDIASS+''', ''' +WFECTRIM +''', '''+WFECSEM+''', '
        + ''''+WFECSS   +''', ''' +WFECAATRI+''', '''+WFECAASEM+''', '
        + ''''+WFECAASS +''', ''' +WFECMMSS +''', A.ACFREFOR, B.AFCOD, B.AFDEPREP '
        +'FROM ACF204W A '
        +'LEFT OUTER JOIN ACF103 B ON ( A.CIAID=B.CIAID and A.ACFID=B.ACFID and A.ACFREFOR=B.ACFREFOR ) '
        +'WHERE A.DEPFLAGPRO=''T'' and '
        +     '((DAYS(DATE('''+xFecDep+'''))-DAYS(A.DEPFECHA))/30)>=1 and '
        +     'A.DEPCOD='''+dblcTipoD.Text+''' )';

   end;

   if (SRV_D = 'ORACLE') then
   begin
        wSql:='INSERT INTO ACF204W ( '
              + 'DEPCOD, CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO, '
              + 'FAREDONDEO, DEPNOMESES, DEPFECHA, TACFDEPREC, '
              + 'DEPVALHIST, DEPVALAJUS, '
              + 'DEPIMPHIST, DEPIMPAJUS, '
              + 'DEPACUHIST, DEPACUAJUS, DEPFLAGPRO, DEPFECPRO, DEPUSER, DEPHREG,'
              + 'DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, CCOSID, LOCID, UBICID,'
              + 'FECANO, FECMES, FECDIA, FECDIASS, FECTRIM, FECSEM, FECSS, FECAATRI, '
              + 'FECAASEM, FECAASS, FECMMSS, ACFREFOR, AFCOD, AFDEPREP ) '
              +'( '
             +'SELECT A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, A.CUENTAID, A.DEPFLAGREF, '
              + ''''+wFAPERIODO+''', FAREDONDEO, '
              +'((TO_CHAR(TO_DATE('''+xFecDep+'''),''DDD'')-TO_CHAR(A.DEPFECHA,''DDD''))/30), '
              + 'A.DEPFECHA, A.TACFDEPREC, '

              + 'ROUND( A.DEPVALHIST * DECODE(NVL(B.AFDEPREP,0),0,1,B.AFDEPREP/100),2), '
{DECIMAL}     + 'Round( A.DEPVALAJUS * FAREDONDEO * DECODE(NVL(B.AFDEPREP,0),0,1,B.AFDEPREP/100), 2 ), '  //CORREGIR EL DECIMAL
              + 'ROUND((((A.DEPVALHIST *A.TACFDEPREC)/100)/12)*DECODE(NVL(B.AFDEPREP,0),0,1,B.AFDEPREP/100)*((TO_CHAR(TO_DATE('''+xFecDep+'''),''DDD'')-TO_CHAR(A.DEPFECHA,''DDD''))/30),2),'
{DECIMAL}     + 'Round( (((A.DEPVALAJUS*FAREDONDEO*A.TACFDEPREC)/100)/12)*((TO_CHAR(TO_DATE('''+xFecDep+'''),''DDD'')-TO_CHAR(A.DEPFECHA,''DDD''))/30)* DECODE(NVL(B.AFDEPREP,0),0,1,B.AFDEPREP/100), 2 ), '//CORREGIR EL DECIMAL

              + 'ROUND(NVL(DEPACUHIST,0)*DECODE(NVL(B.AFDEPREP,0),0,1,B.AFDEPREP/100),2), '
              + 'Round(NVL(DEPACUAJUS,0)* DECODE(NVL(B.AFDEPREP,0),0,1,B.AFDEPREP/100), 2 ), '
              + '''X'', TO_DATE('''+FORMATDATETIME(DMAF.wFormatFecha,WFECPRO)+'''), '
              + ''''+DMAF.wUsuario+''', SYSDATE, '
              + 'TO_DATE('''+xFecDep+'''), '
              + 'A.ACFDES, A.ACFFECADQ, A.ACFVALOMN,A.CCOSID,A.LOCID, A.UBICID, '
//DECODE DE   + 'A.ACFDES, A.ACFFECADQ, A.ACFVALOMN,DECODE(A.CIAID,B.CIAID,DECODE(A.ACFID,B.ACFID,B.CCOSID,A.CCOSID)),A.CCOSID,A.LOCID, A.UBICID, '
//               CASE WHEN A.CIAID=B.CIAID and A.ACFID=B.ACFID THEN B.CCOSID ELSE A.CCOSID END,
              + ''''+WFECANO  +''', ''' +WFECMES  +''', '''+WFECDIA+''', '
              + ''''+WFECDIASS+''', ''' +WFECTRIM +''', '''+WFECSEM+''', '
              + ''''+WFECSS   +''', ''' +WFECAATRI+''', '''+WFECAASEM+''', '
              + ''''+WFECAASS +''', ''' +WFECMMSS +''', A.ACFREFOR, B.AFCOD, B.AFDEPREP '
              +'FROM ACF204W A,ACF103 B '
              +'WHERE  A.CIAID=B.CIAID(+) and A.ACFID=B.ACFID(+) and A.ACFREFOR=B.ACFREFOR(+)  '
              +'AND  A.DEPFLAGPRO=''T'' and '
              +     '((TO_CHAR(TO_DATE('''+xFecDep+'''),''DDD'')-TO_CHAR(A.DEPFECHA,''DDD''))/30)>=1 and '
              +     'A.DEPCOD='''+dblcTipoD.Text+''' )';
   end;

   DMAF.DCom1.AppServer.EjecutaSQL(wSql);

//3.Actualiza "Z" a ACF204w cuando el activo está totalmente Depreciado

   wSql:='DELETE FROM ACF204W '
        +'WHERE DEPCOD='''+dblcTipoD.Text+''' and DEPFLAGPRO=''T''';
   DMAF.DCom1.AppServer.EjecutaSQL(wSql);

 if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      wSql:='Update ACF204W SET DEPNETOHIS = COALESCE(DEPVALHIST,0) - ( COALESCE(DEPANTHIST,0) + COALESCE(DEPIMPHIST,0) ), '
           +                   'DEPNETOAJU = COALESCE(DEPVALAJUS,0) - ( COALESCE(DEPANTAJUS,0) + COALESCE(DEPIMPAJUS,0) ), '
           +                   'DEPACUHIST = COALESCE(DEPANTHIST,0) + COALESCE(DEPIMPHIST,0), '
           +                   'DEPACUAJUS = COALESCE(DEPANTAJUS,0) + COALESCE(DEPIMPAJUS,0) '
           +'Where DEPFLAGPRO=''X'' and '
           +      'DEPCOD='''+dblcTipoD.Text+'''';
   end;


 if (SRV_D = 'ORACLE') then
   begin
      wSql:='UPDATE ACF204W SET DEPNETOHIS=(NVL(TO_CHAR(DEPVALHIST),0)-(NVL(TO_CHAR(DEPANTHIST),0)+NVL(TO_CHAR(DEPIMPHIST),0))), '
           +                 ' DEPNETOAJU=(NVL(TO_CHAR(DEPVALAJUS),0)-(NVL(TO_CHAR(DEPANTAJUS),0)+NVL(TO_CHAR(DEPIMPAJUS),0))), '
           +                 ' DEPACUHIST=NVL(TO_CHAR(DEPANTHIST),0)+NVL(TO_CHAR(DEPIMPHIST),0), '
           +                 ' DEPACUAJUS=NVL(TO_CHAR(DEPANTAJUS),0)+NVL(TO_CHAR(DEPIMPAJUS),0) '
           +'Where DEPFLAGPRO=''X'' and '
           +      'DEPCOD='''+dblcTipoD.Text+'''';
   end;


   DMAF.DCom1.AppServer.EjecutaSQL(wSql);

   wSql:='Update ACF204W SET DEPFLAGPRO=''Z'''
        +'Where  DEPACUHIST>=DEPVALHIST and '
        +       'DEPCOD='''+dblcTipoD.Text+'''';
   TRY
      DMAF.DCom1.AppServer.EjecutaSQL(wSql);
   except
   end;

//4.Actualiza Fecha pendiente de Cierre en Acf104 Ultima Depreciación
 if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      wSql:='Update ACF104 SET DEPFCIERRE='
           +'DATE('''+FORMATDATETIME('YYYY-MM-DD',DMAF.CDSFACTOR.fieldbyname('FAFECDEPRE').VALUE)+''') '
           +'WHERE DEPCOD='''+dblcTipoD.Text+'''';
   end;
 if (SRV_D = 'ORACLE') then
   begin
      wSql:='Update ACF104 SET DEPFCIERRE='
           +'TO_DATE('''+FORMATDATETIME(DMAF.wFormatFecha,DMAF.CDSFACTOR.fieldbyname('FAFECDEPRE').VALUE)+''') '
           +'WHERE DEPCOD='''+dblcTipoD.Text+'''';
   end;
   DMAF.DCom1.AppServer.EjecutaSQL(wSql);

   Screen.Cursor:=CrDefault;
   wMensaje1.visible:=true;
   wMensaje2.Visible:=true;
end;

procedure TFDeprecia.bbtnCancela4Click(Sender: TObject);
begin
   FormActivate(self);
   wMensaje3.Caption:='';
end;

procedure TFDeprecia.dblcTipoDExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere:='DEPCOD='''+dblcTipoD.Text+'''';
   dbeTipo.Text:=DMAF.DisplayDescrip('dspTGE','ACF104','DEPDESCRI',xWhere,'DEPDESCRI');

   if dbeTipo.Text='' then begin
      dblcTipoD.SetFocus;
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   end;

   wMensaje1.Visible:=False;
   wMensaje2.Visible:=False;
   wMensaje3.Caption:=DMAF.cdsUDep.FieldByName('DepDescri').Value;
   wMensaje4.Visible:=False;

// PRESENTA POSIBLES PERIODOS A PROCESAR EN LOOKUP: MISMO TIPO-
// DEPREC., PDTE. DE PROCESO'X' y MAYOR A ULTIMO PERIODO DEPRECIACION
    wSQL:= 'SELECT * FROM ACF102 WHERE';
    wSQL:=wSQL+' DEPCOD='+''''+DMAF.CDSUDEP.FieldByName('DEPCOD').VALUE+'''';
    wSql:=wSql+' AND FAPROC='+''''+'X'+'''' ;
    wSql:=wSql+' AND FAPERIODO>'+''''+DMAF.CDSUDEP.FieldByName('FAPERIODO').VALUE+'''';
    wSql:=wSql+' ORDER BY FAPERIODO';

    DMAF.cdsFACTOR.Close;
    DMAF.cdsFACTOR.DataRequest(wSQL);
    DMAF.cdsFACTOR.Open;

end;

procedure TFDeprecia.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0 );
   end;
end;

procedure TFDeprecia.dblcdPeriodoExit(Sender: TObject);
begin
   if DMAF.cdsFactor.FieldByName('FAPERIODO').AsString<>dblcdPeriodo.Text then begin
      ShowMessage( 'Error : Periodo no Existe');
      dblcdPeriodo.SetFocus;
      Exit;
   end;
end;

end.
