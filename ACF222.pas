Unit ACF222;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, wwmonthcalendar, Mask, wwdbedit, wwdbdatetimepicker,
   wwdblook, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, ComCtrls;

Type
   TFDeprecia1 = Class(TForm)
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
      pbDep: TProgressBar;
      Label3: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCiades: TEdit;
      Procedure bbtnOk1Click(Sender: TObject);
      Procedure bbtnCancela4Click(Sender: TObject);
      Procedure dbgTipoDepDblClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dblcTipoDExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcdPeriodoExit(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FDeprecia1: TFDeprecia1;
   wSql, wFaperiodo: String;

Implementation

Uses ACFDM;

{$R *.DFM}

Procedure TFDeprecia1.FormActivate(Sender: TObject);
Begin
End;

// GRID DE SELECCION DE TIPOS

Procedure TFDeprecia1.dbgTipoDepDblClick(Sender: TObject);
Begin
   wMensaje1.Visible := False;
   wMensaje2.Visible := False;
   wMensaje3.Caption := DMAF.cdsUDep.FieldByName('DepDescri').Value;
   wMensaje4.Visible := False;

// PRESENTA POSIBLES PERIODOS A PROCESAR EN LOOKUP: MISMO TIPO-
// DEPREC., PDTE. DE PROCESO'X' y MAYOR A ULTIMO PERIODO DEPRECIACION
   wSQL := 'SELECT * FROM ACF102 WHERE';
   wSQL := wSQL + ' DEPCOD=' + '''' + DMAF.CDSUDEP.FieldByName('DEPCOD').VALUE + '''';
   wSql := wSql + ' AND FAPROC=' + '''' + 'X' + '''';
   wSql := wSql + ' AND FAPERIODO>' + '''' + DMAF.CDSUDEP.FieldByName('FAPERIODO').AsString + '''';
   wSql := wSql + ' ORDER BY FAPERIODO';

   DMAF.cdsFACTOR.Close;
   DMAF.cdsFACTOR.DataRequest(wSQL);
   DMAF.cdsFACTOR.Open;
End;

// LOOKUP de periodo , PROCESO PRELIMINAR.

Procedure TFDeprecia1.bbtnOk1Click(Sender: TObject);
Var
   wXX, wFECANO, wFECDIA, wFECTRIM, wFECSS, wFECAASEM, wFECMMSS,
      wFECMES, wFECDIASS, wFECSEM, wFECAATRI, wFECAASS, xFecDep, xFecStr: String;
   wFecpro: TDate;
   WHReg: TTime;
   wCambioAA, xSQL, xACF1, xACF2, xACF3, xACF4, xACF5, xanoant: String;
   nYear, nMonth, nDay: Word;
   xMesIni, xMM, xYY, wsqlx, wsqly, xFlAnual, xmesant: String;
   XMONREIACUM, XMONREIPERI: double;
   XMONREIDEPAC, XMONREIDEPR: double;
Begin
   wCambioAA := 'SI'; // ES PARA EL 2005 NO HAY AJUSTE
//   wCambioAA:='NO'; // ES PARA EL 2004 SI HAY AJUSTE
   If dblcCia.Text = '' Then
   Begin
      ShowMessage('Error : Falta Compañía');
      Exit;
   End;

   If dbeTipo.Text = '' Then
   Begin
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   End;

   wFaperiodo := dblcdPeriodo.text;

   wMensaje2.caption := '';
   wSql := 'CIAID=''' + dblcCia.Text + ''' AND FAPERIODO=''' + WFAPERIODO + ''' AND DEPCOD=''' + dblcTipoD.Text + '''';
   WMensaje2.caption := DMAF.DisplayDescrip('dspQry1', 'ACF102', '*', wSql, 'FaFecDepre');

   xFlAnual := DMAF.cdsQry.FieldByName('FLGDEPACUM').AsString;

   If Length(WMensaje2.caption) = 0 Then
   Begin
      Raise exception.Create('No existe Periodo de Depreciación');
   End;

   If DMAF.cdsFactor.FieldByname('FAPROC').AsString = 'P' Then
   Begin
      Raise exception.Create('Periodo ya fue Procesado');
   End;
   wMensaje4.Visible := True;
   wMensaje4.Caption := DMAF.CdsFactor.FieldByname('FADESCRIP').AsString;

// SE ACCESó EN GRID
   If DMAF.cdsUDep.FieldByName('FAPERIODO').AsString >= DMAF.cdsFactor.FieldByname('FAPERIODO').AsString Then
   Begin
      wXX := 'Periodo debe ser posterior a última Depreciación ' + DMAF.cdsUDep.FieldByName('FAPERIODO').AsString;
      Raise exception.Create(wxx);
   End;

   xSQL := 'SELECT CIAID, TACFID, ACFID, ACFREFOR, '
      + 'SUM( ' + DMAF.wReplacCeros + '(AFDEPREP,0) ) XSUM '
      + 'FROM ACF103 '
      + 'WHERE CIAID=''' + dblcCia.Text + ''' '
      + 'GROUP BY CIAID, TACFID, ACFID, ACFREFOR '
      + 'HAVING SUM( ' + DMAF.wReplacCeros + '( AFDEPREP,0 ) )<>100';

   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName := 'dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   //
   xACF1 := 'Compañía      : ' + DMAF.cdsQry.FieldByName('CIAID').AsString;
   xACF2 := 'Tipo Activo    : ' + DMAF.cdsQry.FieldByName('TACFID').AsString;
   xACF3 := 'Activo Fijo     : ' + DMAF.cdsQry.FieldByName('ACFID').AsString;
   xACF4 := '# Reforma     : ' + DMAF.cdsQry.FieldByName('ACFREFOR').AsString;

   If DMAF.cdsQry.RecordCount > 0 Then
   Begin
      xACF5 := 'Total.Distrib. : ' + FloatToStr(DMAF.cdsQry.FieldByName('XSUM').Value) + '%';
      Raise Exception.Create('Error en Distribución, Revisar ' + Chr(13) +
         Chr(13) + xACF1 + Chr(13) + xACF2 + Chr(13) +
         xACF3 + Chr(13) + xACF4 + Chr(13) + xACF5);
   End;
   //

   If MessageDlg('¿ Seguro de Procesar ? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   Screen.Cursor := CrHourGlass;

   pbDep.Max := 11;
   pbDep.Min := 0;
   pbDep.Position := 0;
   pbDep.Position := pbDep.Position + 1;

   wFecpro := Date;
   wHreg := Time;
// toma datos de registro de fecha

   xFecStr := DateToStr(DMAF.cdsFactor.FieldByname('FaFecDepre').AsDateTime);

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      WSQL := 'SELECT * FROM TGE114 WHERE FECHA='
         + 'DATE(''' + FORMATDATETIME('YYYY-MM-DD', DMAF.cdsFactor.fieldbyname('FaFecDepre').AsDateTime) + ''')';
   End;
   If (SRV_D = 'ORACLE') Then
   Begin
      WSQL := 'SELECT * FROM TGE114 WHERE FECHA='
         + 'TO_DATE(''' + FORMATDATETIME(DMAF.wFormatFecha, DMAF.cdsFactor.fieldbyname('FaFecDepre').AsDateTime) + ''')';
   End;
   DMAF.cdsWork1.Close;
   DMAF.cdsWork1.datarequest(WSQL);
   DMAF.cdsWork1.OPEN;

   pbDep.Position := pbDep.Position + 1;

   If DMAF.cdsWork1.RecordCount > 0 Then
   Begin
      wFECDIA := DMAF.cdsWork1.FIELDBYNAME('FECDIA').AsString;
      wFECTRIM := DMAF.cdsWork1.FIELDBYNAME('FECTRIM').AsString;
      wFECSS := DMAF.cdsWork1.FIELDBYNAME('FECSS').AsString;
      wFECAASEM := DMAF.cdsWork1.FIELDBYNAME('FECAASEM').AsString;
      wFECMMSS := DMAF.cdsWork1.FIELDBYNAME('FECMMSS').AsString;
      wFECDIASS := DMAF.cdsWork1.FIELDBYNAME('FECDIASS').AsString;
      wFECSEM := DMAF.cdsWork1.FIELDBYNAME('FECSEM').AsString;
      wFECAATRI := DMAF.cdsWork1.FIELDBYNAME('FECAATRI').AsString;
      wFECAASS := DMAF.cdsWork1.FIELDBYNAME('FECAASS').AsString;
   End;
   wFECANO := Copy(xFecStr, 7, 4);
   wFECMES := Copy(xFecStr, 4, 2);

//............... Proceso de Depreciación Preliminar ....................

//1.LIMPIA AREA DE TRABAJO ACF204W
//  deletea TIPO especifico......
   wSql := 'DELETE FROM ACF204W WHERE CIAID=''' + dblcCia.Text + ''' AND  DEPCOD=''' + dblcTipoD.Text + '''';

   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

   pbDep.Position := pbDep.Position + 1;

//2.Crea Area de trabajo a partir de ACF204 y realiza proceso, con regs.
//  pdtes(X), meses a depreciar > 0 y Tipo de Depreciación específico.

   xFecDep := FORMATDATETIME('YYYY-MM-DD', DMAF.cdsFactor.FieldByname('FaFecDepre').AsDateTime);

//Genera Temporal

//CALCULO AÑO ANTERIOR
 //CALCULO  DEL MES ANTERIOR

   xanoant := inttostr(strtoint(copy(dblcdPeriodo.Text, 1, 4)) - 1);

   xmesant := DMAF.StrZero(strtoint(copy(dblcdPeriodo.Text, 5, 2)) - 1, 2);
   If xmesant = '00' Then
   Begin
      xmesant := inttostr(strtoint(copy(dblcdPeriodo.Text, 1, 4)) - 1) + '12';
   End
   Else
   Begin
      xmesant := inttostr(strtoint(copy(dblcdPeriodo.Text, 1, 4))) + xmesant;
   End;

//////////////////////////////////////////////////////////////////
//    Calcula REI de la Depreciacion Explicado por LUZ          //
//////////////////////////////////////////////////////////////////

   wSql := 'DELETE FROM ACF208 WHERE CIAID=''' + dblcCia.Text + '''';

   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

   pbDep.Position := pbDep.Position + 1;

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      wSql := 'Insert into ACF208( CIAID, TACFID, ACFID, ACFREFOR, FAPERIODO, REIDEP ) '
         + 'SELECT CIAID, TACFID, ACFID, ACFREFOR, ''' + WFAPERIODO + ''', SUM( REIDEP )'
         + 'FROM ( '
         + 'SELECT CIAID, TACFID, ACFID, ACFREFOR, FAPERIODO, FACTOR, '
         + 'DEPIMPAJUS, ROUND(FACTOR*DEPIMPAJUS,2), '
         + 'ROUND(FACTOR*DEPIMPAJUS,2)-DEPIMPAJUS REIDEP '
         + 'FROM ( '
         + 'SELECT CIAID, TACFID, ACFID, ACFREFOR, FAPERIODO, '
         + 'MAX(B.IPM) IPM03, MAX(C.IPM) IPM, ROUND(MAX(B.IPM)/MAX(C.IPM),3) FACTOR, '
         + 'SUM(DEPVALHIST) DEPVALHIST, SUM(DEPVALAJUS) DEPVALAJUS, '
         + 'SUM(DEPIMPHIST) DEPIMPHIST, SUM(DEPIMPAJUS) DEPIMPAJUS '
         + 'FROM ACF204 '
         + 'LEFT JOIN CNT103 B ON B.PERIODO=''' + WFAPERIODO + ''''
         + 'LEFT JOIN CNT103 C ON C.PERIODO=FAPERIODO '
         + 'WHERE CIAID=''' + dblcCia.Text + ''' '
         + 'AND FAPERIODO>=''' + xanoant + '12' + ''' AND FAPERIODO<''' + WFAPERIODO + ''''
         + 'GROUP BY CIAID, TACFID, ACFID, ACFREFOR, FAPERIODO '
         + ') A '
         + ') B '
         + 'GROUP BY CIAID, TACFID, ACFID, ACFREFOR';
   End;
   If (SRV_D = 'ORACLE') Then
   Begin
      wSql := 'Insert into ACF208( CIAID, TACFID, ACFID, ACFREFOR, FAPERIODO, REIDEP ) '
         + 'SELECT CIAID, TACFID, ACFID, ACFREFOR, ''' + WFAPERIODO + ''', SUM( REIDEP ) '
         + 'FROM ( '
         + 'SELECT CIAID, TACFID, ACFID, ACFREFOR, FAPERIODO, FACTOR, '
         + 'DEPIMPAJUS, ROUND(FACTOR*DEPIMPAJUS,2), '
         + 'ROUND(FACTOR*DEPIMPAJUS,2)-DEPIMPAJUS REIDEP '
         + 'FROM ( '
         + 'SELECT CIAID, TACFID, ACFID, ACFREFOR, FAPERIODO, '
         + 'MAX(B.IPM) IPM03, MAX(C.IPM) IPM, ROUND(MAX(B.IPM)/MAX(C.IPM),3) FACTOR, '
         + 'SUM(DEPVALHIST) DEPVALHIST, SUM(DEPVALAJUS) DEPVALAJUS, '
         + 'SUM(DEPIMPHIST) DEPIMPHIST, SUM(DEPIMPAJUS) DEPIMPAJUS '
         + 'FROM ACF204, CNT103 B, CNT103 C '
         + 'WHERE CIAID=''' + dblcCia.Text + ''' '
         + 'and FAPERIODO>=''' + xanoant + '12' + ''' AND FAPERIODO<''' + WFAPERIODO + ''' '
         + 'and B.PERIODO=''' + WFAPERIODO + ''' '
         + 'and C.PERIODO=FAPERIODO '
         + 'GROUP BY CIAID, TACFID, ACFID, ACFREFOR, FAPERIODO '
         + ') A '
         + ') B '
         + 'GROUP BY CIAID, TACFID, ACFID, ACFREFOR';
   End;

   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

   pbDep.Position := pbDep.Position + 1;

//////////////////////////////////////////////////////////////////
// inserta registros De la Depreciación del Periodo Anterior    //
//////////////////////////////////////////////////////////////////

//////////////
// FALTA PASAR A ORACLE
//////////////

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin

      xFecDep := FORMATDATETIME('YYYY-MM-DD', DMAF.cdsFactor.FieldByname('FaFecDepre').AsDateTime);

      DecodeDate(DMAF.cdsFactor.FieldByname('FaFecDepre').AsDateTime, nYear, nMonth, nDay);
      xMesIni := '(' + IntToStr(nYear) + '*360+' + InttoStr(nMonth) + '*30)';

      wSql := 'INSERT INTO ACF204W '
         + '(DEPCOD, CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO,'
         + 'FAREDONDEO,  DEPNOMESES, DEPFECHA, TACFDEPREC, '
         + 'DEPVALHIST, DEPVALAJUS, '
         + 'DEPANTHIST, DEPANTAJUS, '
         + 'DEPIMPHIST, DEPIMPAJUS, '
         + 'DEPACUHIST, DEPACUAJUS, DEPFLAGPRO, DEPFECPRO, DEPUSER, DEPHREG,'
         + 'DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, CCOSID, LOCID,PISO,AREA,AMBCOD,UBICID,'
         + 'FECANO,FECMES,FECDIA,FECDIASS,FECTRIM,FECSEM,FECSS,FECAATRI,'
         + 'FECAASEM,FECAASS,FECMMSS,ACFREFOR,AFCOD,AFDEPREP, ACFREIPERI, ACFREIACUM, ACFFINIDEP, ACFREIDEPAC, ARTCODBAR, VERI )'
         + '( '
         + 'SELECT A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, Max( B.CUENTAID ), '
         + 'Max( A.DEPFLAGREF ), '
         + '''' + WFAPERIODO + ''', '
         + 'CASE WHEN MAX(J.FAJUSTE)=''S'' THEN '
         + 'DECIMAL( MAX( C.IPM )/MAX( D.IPM ) + '
         + 'CASE WHEN DECIMAL( MAX( C.IPM )/MAX( D.IPM ),15,4 )- '
         + 'DECIMAL( MAX( C.IPM )/MAX( D.IPM ),15,3 )>=0.0005 '
         + 'THEN 0.001 ELSE 0 END, 15,3) ELSE 0 END, '
         + ' ( ' + xMesIni + ' - ( year(max(depfecha))*360+month(max(depfecha))*30) )/30 ,'
         + 'Max( A.DEPFECHA ), '
         + 'CASE WHEN MAX(J.FDEPREC)=''S'' THEN Max( A.TACFDEPREC ) ELSE 0 END, '
       // DEPVALHIST
      + 'CASE WHEN SUM(COALESCE(ACFVNUEVO,0))>0 '
         + 'THEN SUM(COALESCE(ACFVNUEVO,0)) '
         + 'ELSE SUM( COALESCE(A.DEPVALHIST,0) ) '
         + 'END, '
       // DEPVALAJUS
      + 'CASE WHEN SUM( COALESCE(ACFVNUEVO,0) )>0 '
         + 'THEN SUM( COALESCE(ACFVNUEVO,0) ) '
         + 'ELSE SUM( COALESCE(A.DEPVALAJUS,0) ) '
         + 'END, '
       // DEPANTHIST
      + 'CASE WHEN SUM(COALESCE(ACFVDEPRE,0))>0 '
         + 'THEN SUM(COALESCE(ACFVDEPRE,0)) '
         + 'ELSE '
         + 'SUM(COALESCE(A.DEPACUHIST,0) ) '
         + 'END, '
       // DEPANTAJUS
      + 'CASE WHEN SUM(COALESCE(ACFVDEPRE,0))>0 '
         + 'THEN SUM(COALESCE(ACFVDEPRE,0)) '
         + 'ELSE '
         + 'SUM(COALESCE(A.DEPACUAJUS,0) ) '
         + 'END, '
       //+ 'SUM( COALESCE(A.DEPACUAJUS,0) ), ' //15

      + '0, 0, 0, 0, '
         + '''T'' , DATE(''' + FORMATDATETIME('YYYY-MM-DD', WFECPRO) + '''), '
         + '''' + DMAF.wUsuario + ''', ''' + FORMATDATETIME('HH:MM AM/PM', WHREG) + ''', '
         + 'DATE(''' + xFecDep + '''), Max(A.ACFDES), Max(A.ACFFECADQ), '
         + 'Max( A.ACFVALOMN ), Max( B.CCOSID ), Max( B.LOCID ),Max( B.PISO ),Max( B.AREA ),Max( B.AMBCOD ) Max( B.UBICID ), '
         + '''' + WFECANO + ''', ''' + WFECMES + ''', ''' + WFECDIA + ''', '
         + '''' + WFECDIASS + ''', ''' + WFECTRIM + ''', ''' + WFECSEM + ''', '
         + '''' + WFECSS + ''', ''' + WFECAATRI + ''', ''' + WFECAASEM + ''', '
         + '''' + WFECAASS + ''', ''' + WFECMMSS + ''', '
         + 'Max( A.ACFREFOR ), Max( A.AFCOD ), Max( A.AFDEPREP ), '

       // AGREGADO PARA OBTENER EL REI DEL MES

       // REI DEL PERIODO
       //+'SUM( COALESCE( A.ACFREIACUM, A.DEPVALAJUS) ), '
      + '(CASE WHEN SUM( COALESCE(ACFVNUEVO,0))>0 '
         + 'THEN 0 '
         + 'ELSE SUM( COALESCE( A.ACFREIACUM, A.DEPVALAJUS) ) '
         + 'END), '

       //REI ACUMULADO
       {
       + '(CASE WHEN SUM( COALESCE(ACFVNUEVO,0) )>0 '
       +       'THEN SUM( COALESCE(ACFVNUEVO,0) ) '
       +       'ELSE SUM( COALESCE(A.DEPVALAJUS,0) ) '
       +       'END)- '
       + '(CASE WHEN SUM( COALESCE(ACFVNUEVO,0))>0 '
       +       'THEN SUM( COALESCE(ACFVNUEVO,0)) '
       +       'ELSE SUM( COALESCE(A.DEPVALHIST,0) ) '
       +       'END), '
       }
       //REI ACUMULADO
      + '(CASE WHEN SUM( COALESCE(ACFVNUEVO,0) )>0 '
         + 'THEN 0 '
         + 'ELSE SUM( COALESCE(A.DEPVALAJUS,0) ) '
         + 'END)- '
         + '(CASE WHEN SUM( COALESCE(ACFVNUEVO,0))>0 '
         + 'THEN 0 '
         + 'ELSE SUM( COALESCE(A.DEPVALHIST,0) ) '
         + 'END), '
       //

      + 'MAX(B.ACFFINIDEP), '

       //  REI DEP.ACUMULADA
      + '(CASE WHEN SUM( COALESCE(ACFVNUEVO,0))>0 '
         + 'THEN 0 '
         + 'ELSE SUM( COALESCE(A.ACFREIDEPAC,0) ) '
         + 'END), A.ARTCODB      AR, A.VERI '
//
      + 'FROM ACF204 A, ACF101 E, ACF201 B, CNT103 C, CNT103 D , ACF110 J '
         + 'WHERE A.CIAID=''' + dblcCia.Text + ''' AND A.TACFID=E.TACFID AND '
         + 'A.DEPFLAGPRO=''X'' and '
         + '( ' + xMesIni + '-( year( DEPFECHA )*360+month( DEPFECHA )*30) )/30 >=1 and '
         + 'A.DEPCOD=''' + dblcTipoD.Text + ''' and '
         + 'A.CIAID=B.CIAID and A.ACFID=B.ACFID and '
         + 'A.ACFREFOR=B.ACFREFOR and A.ARTCODBAR=B.ARTCODBAR AND '
       // PARA QUE NO APAREZCAN LOS ACTIVOS DADOS DE BAJA
      + '( B.DESANOMES IS NULL OR B.DESANOMES='''' OR B.DESANOMES>''' + WFAPERIODO + ''' ) AND '
       //
      + 'C.PERIODO=''' + WFAPERIODO + ''' and '

       /////////////////////////////////////////////////////////////////////////
       // se descarta este proceso por que en el 2005 no se ajusta
{obc       +     'D.PERIODO=CASE WHEN SUBSTR(CHAR(B.ACFFINIDEP),1,4)||SUBSTR(CHAR(B.ACFFINIDEP),6,2)<='''+xanoant+'12'' '
       +     '                THEN '''+xanoant+'12'' '
       +     '         ELSE  SUBSTR(CHAR(B.ACFFINIDEP),1,4)||SUBSTR(CHAR(B.ACFFINIDEP),6,2) END 'obc}
      + 'D.PERIODO=SUBSTR(CHAR(B.ACFFINIDEP),1,4)||SUBSTR(CHAR(B.ACFFINIDEP),6,2) '
       /////////////////////////////////////////////////////////////////////////

      + ' AND B.CUENTAID=J.CUENTAID '
         + 'Group by A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, A.ACFREFOR, A.ARTCODBAR, A.VERI ) ';
   End;

   If (SRV_D = 'ORACLE') Then
   Begin
      xFecDep := FORMATDATETIME('DD-MM-YYYY', DMAF.cdsFactor.FieldByname('FaFecDepre').AsDateTime);

      DecodeDate(DMAF.cdsFactor.FieldByname('FaFecDepre').AsDateTime, nYear, nMonth, nDay);
      xMesIni := '(' + IntToStr(nYear) + '*360+' + InttoStr(nMonth) + '*30)';

      wSql := 'INSERT INTO ACF204W '
         + '(DEPCOD, CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO,'
         + 'FAREDONDEO,  DEPNOMESES, DEPFECHA, TACFDEPREC, '
         + 'DEPVALHIST, DEPVALAJUS, '
         + 'DEPANTHIST, DEPANTAJUS, '
         + 'DEPIMPHIST, DEPIMPAJUS, '
         + 'DEPACUHIST, DEPACUAJUS, DEPFLAGPRO, DEPFECPRO, DEPUSER, DEPHREG,'
         + 'DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, CCOSID, LOCID,PISO,AREA,AMBCOD,UBICID,'
         + 'FECANO,FECMES,FECDIA,FECDIASS,FECTRIM,FECSEM,FECSS,FECAATRI,'
         + 'FECAASEM,FECAASS,FECMMSS,ACFREFOR,AFCOD,AFDEPREP, ACFREIPERI, ACFREIACUM, ACFFINIDEP, ACFREIDEPAC,ARTCODBAR, VERI )'
         + '( '
         + 'SELECT A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, Max( B.CUENTAID ), '
         + 'Max( A.DEPFLAGREF ), '
         + '''' + WFAPERIODO + ''', ';

       /////////////////////////////////////////////////////////////////////////
       // Por cambio de Año
      If wCambioAA = 'NO' Then
      Begin
         wSql := wSql
            + ' DECODE ( MAX(J.FAJUSTE),''S'' , '
            + ' MAX( C.IPM )/MAX( D.IPM ) + '
            + ' DECODE(LEAST(MAX( C.IPM )/MAX( D.IPM )- '
            + '              MAX( C.IPM )/MAX( D.IPM ),0.0004), 0.0004, 0.001, 0 ),0), ';
      End
      Else
      Begin
         wSql := wSql + ' 1.0000, ';
      End;
       /////////////////////////////////////////////////////////////////////////
      wSql := wSql
         + '( ' + xMesIni + ' - ( TO_NUMBER(TO_CHAR(MAX(DEPFECHA),''YYYY''))*360+TO_NUMBER(TO_CHAR(MAX(DEPFECHA),''MM''))*30) )/30 ,'
         + 'Max( A.DEPFECHA ), '
       {
       + ' DECODE ( MAX(J.FAJUSTE),''S'' , '
       +' MAX( C.IPM )/MAX( D.IPM ) + '
       +' DECODE(LEAST(MAX( C.IPM )/MAX( D.IPM )- '
       +'              MAX( C.IPM )/MAX( D.IPM ),0.0004), 0.0004, 0.001, 0 ),0), '
       + '( '+xMesIni+' - ( TO_NUMBER(TO_CHAR(MAX(DEPFECHA),''YYYY''))*360+TO_NUMBER(TO_CHAR(MAX(DEPFECHA),''MM''))*30) )/30 ,'
       + 'Max( A.DEPFECHA ), '
       + 'DECODE(MAX(J.FDEPREC),''S'',Max( A.TACFDEPREC ),0) , '
       //       + 'CASE WHEN MAX(J.FDEPREC)=''S'' THEN Max( A.TACFDEPREC ) ELSE 0 END, '
       +' DECODE( SUM(NVL(ACFVNUEVO,0)),0,SUM( NVL(A.DEPVALHIST,0)),SUM(NVL(ACFVNUEVO,0))),   '
       + 'SUM( NVL(A.DEPVALAJUS,0) ), '
       +' DECODE(  SUM(NVL(ACFVDEPRE,0)),0, SUM(NVL(A.DEPACUHIST,0) ),SUM(NVL(ACFVDEPRE,0))), '
       + 'SUM( NVL(A.DEPACUAJUS,0) ), '

       }
      + 'CASE WHEN MAX(J.FDEPREC)=''S'' THEN Max( A.TACFDEPREC ) ELSE 0 END, ';
      If wCambioAA = 'NO' Then
      Begin
         wSql := wSql
           // DEPVALHIST
         + 'CASE WHEN SUM(NVL(ACFVNUEVO,0))>0 '
            + 'THEN SUM(NVL(ACFVNUEVO,0)) '
            + 'ELSE SUM( NVL(A.DEPVALHIST,0) ) '
            + 'END, '
           // DEPVALAJUS
         + 'CASE WHEN SUM( NVL(ACFVNUEVO,0) )>0 '
            + 'THEN SUM( NVL(ACFVNUEVO,0) ) '
            + 'ELSE SUM( NVL(A.DEPVALAJUS,0) ) '
            + 'END, '
           // DEPANTHIST
         + 'CASE WHEN SUM(NVL(ACFVDEPRE,0))>0 '
            + 'THEN SUM(NVL(ACFVDEPRE,0)) '
            + 'ELSE '
            + 'SUM(NVL(A.DEPACUHIST,0) ) '
            + 'END, '
           // DEPANTAJUS
         + 'CASE WHEN SUM(NVL(ACFVDEPRE,0))>0 '
            + 'THEN SUM(NVL(ACFVDEPRE,0)) '
            + 'ELSE '
            + 'SUM(NVL(A.DEPACUAJUS,0) ) '
            + 'END, ';
      End
      Else
      Begin
         wSql := wSql
           // DEPVALHIST
         + 'CASE WHEN SUM(NVL(ACFVNUEVO,0))>0 '
            + 'THEN SUM(NVL(ACFVNUEVO,0)) '
            + 'ELSE SUM( NVL(A.DEPVALAJUS,0) ) '
            + 'END, '
           // DEPVALAJUS
         + 'CASE WHEN SUM( NVL(ACFVNUEVO,0) )>0 '
            + 'THEN SUM( NVL(ACFVNUEVO,0) ) '
            + 'ELSE SUM( NVL(A.DEPVALAJUS,0) ) '
            + 'END, '
           // DEPANTHIST
         + 'CASE WHEN SUM(NVL(ACFVDEPRE,0))>0 '
            + 'THEN SUM(NVL(ACFVDEPRE,0)) '
            + 'ELSE '
            + 'SUM(NVL(A.DEPACUAJUS,0) ) '
            + 'END, '
           // DEPANTAJUS
         + 'CASE WHEN SUM(NVL(ACFVDEPRE,0))>0 '
            + 'THEN SUM(NVL(ACFVDEPRE,0)) '
            + 'ELSE '
            + 'SUM(NVL(A.DEPACUAJUS,0) ) '
            + 'END, ';
      End;
       //+ 'SUM( NVL(A.DEPACUAJUS,0) ), ' //15
      wSql := wSql
         + '0, 0, 0, 0, '

      + '''T'' , TO_DATE(''' + FORMATDATETIME('DD/MM/YYYY', WFECPRO) + '''), '
         + '''' + DMAF.wUsuario + ''', SYSDATE, '
         + 'TO_DATE(''' + xFecDep + '''), Max(A.ACFDES), Max(A.ACFFECADQ), '
         + 'Max( A.ACFVALOMN ), Max( B.CCOSID ), Max( B.LOCID ), Max( B.PISO ),Max( B.AREA ),Max( B.AMBCOD ),Max( B.UBICID ), '
         + '''' + WFECANO + ''', ''' + WFECMES + ''', ''' + WFECDIA + ''', '
         + '''' + WFECDIASS + ''', ''' + WFECTRIM + ''', ''' + WFECSEM + ''', '
         + '''' + WFECSS + ''', ''' + WFECAATRI + ''', ''' + WFECAASEM + ''', '
         + '''' + WFECAASS + ''', ''' + WFECMMSS + ''', '
         + 'Max( A.ACFREFOR ), Max( A.AFCOD ), Max( A.AFDEPREP ), '

       // AGREGADO PARA OBTENER EL REI DEL MES
       // REI DEL PERIODO
       //+'SUM( NVL( A.ACFREIACUM, A.DEPVALAJUS) ), '
      + '(CASE WHEN SUM( NVL(ACFVNUEVO,0))>0 '
         + 'THEN 0 '
         + 'ELSE SUM( NVL( A.ACFREIACUM, A.DEPVALAJUS) ) '
         + 'END), ';
       //REI ACUMULADO
       {
       + '(CASE WHEN SUM( NVL(ACFVNUEVO,0) )>0 '
       +       'THEN SUM( NVL(ACFVNUEVO,0) ) '
       +       'ELSE SUM( NVL(A.DEPVALAJUS,0) ) '
       +       'END)- '
       + '(CASE WHEN SUM( NVL(ACFVNUEVO,0))>0 '
       +       'THEN SUM( NVL(ACFVNUEVO,0)) '
       +       'ELSE SUM( NVL(A.DEPVALHIST,0) ) '
       +       'END), '
       }
      If wCambioAA = 'NO' Then
      Begin
         wSql := wSql
           //REI ACUMULADO
         + '(CASE WHEN SUM( NVL(ACFVNUEVO,0) )>0 '
            + 'THEN 0 '
            + 'ELSE SUM( NVL(A.DEPVALAJUS,0) ) '
            + 'END)- '
            + '(CASE WHEN SUM( NVL(ACFVNUEVO,0))>0 '
            + 'THEN 0 '
            + 'ELSE SUM( NVL(A.DEPVALHIST,0) ) '
            + 'END), ';
           //
      End
      Else
      Begin
         wSql := wSql
           //REI ACUMULADO
         + '(CASE WHEN SUM( NVL(ACFVNUEVO,0) )>0 '
            + 'THEN 0 '
            + 'ELSE SUM( NVL(A.DEPVALAJUS,0) ) '
            + 'END)- '
            + '(CASE WHEN SUM( NVL(ACFVNUEVO,0))>0 '
            + 'THEN 0 '
            + 'ELSE SUM( NVL(A.DEPVALAJUS,0) ) '
            + 'END), ';
           //
      End;
      wSql := wSql
         + 'MAX(B.ACFFINIDEP), '

       //  REI DEP.ACUMULADA
      + '(CASE WHEN SUM( NVL(ACFVNUEVO,0))>0 '
         + 'THEN 0 '
         + 'ELSE SUM( NVL(A.ACFREIDEPAC,0) ) '
         + 'END), A.ARTCODBAR, A.VERI '
//
      + 'FROM ACF204 A, ACF101 E, ACF201 B, CNT103 C, CNT103 D , ACF110 J '
         + 'WHERE A.CIAID=''' + dblcCia.Text + ''' AND A.CIAID=E.CIAID AND A.TACFID=E.TACFID AND '
         + 'A.DEPFLAGPRO=''X'' and '
         + '( ' + xMesIni + '-( TO_NUMBER(TO_CHAR(DEPFECHA,''YYYY''))*360+TO_NUMBER(TO_CHAR(DEPFECHA,''MM''))*30) )/30 >=1 and '
         + 'A.DEPCOD=''' + dblcTipoD.Text + ''' and '
         + 'A.CIAID=B.CIAID(+) and A.TACFID=B.TACFID(+) and A.ACFID=B.ACFID(+)  AND '
         + ' A.ARTCODBAR=B.ARTCODBAR(+) AND A.ACFREFOR=B.ACFREFOR(+) and'
       // PARA QUE NO APAREZCAN LOS ACTIVOS DADOS DE BAJA
      + '( B.DESANOMES IS NULL OR B.DESANOMES='''' OR B.DESANOMES>''' + WFAPERIODO + ''' ) AND '
       //
      + 'C.PERIODO=''' + WFAPERIODO + ''' and '

       /////////////////////////////////////////////////////////////////////////
       // ESTO SE USA CUANDO SE APLICAN LOS AJUSTES QUE PARA EL 2005 FUE ANULADO
       // SE APLICA PARA ANTES DEL 2005
       {
       +     'D.PERIODO=CASE WHEN TO_CHAR(B.ACFFINIDEP,''YYYY'')||TO_CHAR(B.ACFFINIDEP,''MM'')<='''+xanoant+'12'' '
       +     '                THEN '''+xanoant+'12'' '
       +     '         ELSE  TO_CHAR(B.ACFFINIDEP,''YYYY'')||TO_CHAR(B.ACFFINIDEP,''MM'') END '
       }
       /////////////////////////////////////////////////////////////////////////

      + 'D.PERIODO=' + ' TO_CHAR(B.ACFFINIDEP,''YYYY'')||TO_CHAR(B.ACFFINIDEP,''MM'') '
       /////////////////////////////////////////////////////////////////////////

      + ' AND B.CUENTAID=J.CUENTAID '
         + 'Group by A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, A.ACFREFOR, A.ARTCODBAR, A.VERI ) ';
   {
   wSql:='INSERT INTO ACF204W '
       + '(DEPCOD, CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO,'
       + 'FAREDONDEO,  DEPNOMESES, DEPFECHA, TACFDEPREC, '
       + 'DEPVALHIST, DEPVALAJUS, '
       + 'DEPANTHIST, DEPANTAJUS, '
       + 'DEPIMPHIST, DEPIMPAJUS, '
       + 'DEPACUHIST, DEPACUAJUS, DEPFLAGPRO, DEPFECPRO, DEPUSER, DEPHREG,'
       + 'DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, CCOSID, LOCID,UBICID,'
       + 'FECANO,FECMES,FECDIA,FECDIASS,FECTRIM,FECSEM,FECSS,FECAATRI,'
//       + 'FECAASEM,FECAASS,FECMMSS,ACFREFOR,AFCOD,AFDEPREP,ACFREIPERI,ACFREIACUM)'
       + 'FECAASEM, FECAASS,FECMMSS,ACFREFOR,AFCOD,AFDEPREP, ACFREIPERI, ACFREIACUM,ACFFINIDEP)'
       +'( '
      +'SELECT A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, Max( B.CUENTAID ), '
       + 'Max( A.DEPFLAGREF ), '
       + ''''+WFAPERIODO+''', '
       // + 'CASE WHEN MAX(J.FAJUSTE)=''S'' THEN '
       + ' DECODE ( MAX(J.FAJUSTE),''S'' , '
       +' MAX( C.IPM )/MAX( D.IPM ) + '
       +' DECODE(LEAST(MAX( C.IPM )/MAX( D.IPM )- '
       +'              MAX( C.IPM )/MAX( D.IPM ),0.0004), 0.0004, 0.001, 0 ),0), '
       + '( '+xMesIni+' - ( TO_NUMBER(TO_CHAR(MAX(DEPFECHA),''YYYY''))*360+TO_NUMBER(TO_CHAR(MAX(DEPFECHA),''MM''))*30) )/30 ,'
       + 'Max( A.DEPFECHA ), '
       + 'DECODE(MAX(J.FDEPREC),''S'',Max( A.TACFDEPREC ),0) , '
       //       + 'CASE WHEN MAX(J.FDEPREC)=''S'' THEN Max( A.TACFDEPREC ) ELSE 0 END, '
       +' DECODE( SUM(NVL(ACFVNUEVO,0)),0,SUM( NVL(A.DEPVALHIST,0)),SUM(NVL(ACFVNUEVO,0))),   '
       + 'SUM( NVL(A.DEPVALAJUS,0) ), '
       +' DECODE(  SUM(NVL(ACFVDEPRE,0)),0, SUM(NVL(A.DEPACUHIST,0) ),SUM(NVL(ACFVDEPRE,0))), '
       + 'SUM( NVL(A.DEPACUAJUS,0) ), '
       + '0, 0, 0, 0, '
               + '''T'' , TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',WFECPRO)+'''), '
       + ''''+DMAF.wUsuario+''', SYSDATE, '
       + 'TO_DATE('''+xFecDep+'''), Max(A.ACFDES), Max(A.ACFFECADQ), '
       + 'Max( A.ACFVALOMN ), Max( B.CCOSID ), Max( B.LOCID ), Max( B.UBICID ), '
       + ''''+WFECANO  +''', ''' +WFECMES  +''', '''+WFECDIA+''', '
       + ''''+WFECDIASS+''', ''' +WFECTRIM +''', '''+WFECSEM+''', '
       + ''''+WFECSS   +''', ''' +WFECAATRI+''', '''+WFECAASEM+''', '
       + ''''+WFECAASS +''', ''' +WFECMMSS +''', '
       + 'Max( A.ACFREFOR ), Max( A.AFCOD ), Max( A.AFDEPREP ), '
       + 'SUM(A.ACFREIACUM)'
       +',(SUM( NVL(A.DEPVALAJUS,0) ))-(DECODE( SUM(NVL(ACFVNUEVO,0)),0,SUM( NVL(A.DEPVALHIST,0)),SUM(NVL(ACFVNUEVO,0)))),MAX(A.ACFFINIDEP)'
       +'FROM ACF204 A, ACF101 E, ACF201 B, CNT103 C, CNT103 D , ACF110 J '
       +'WHERE A.TACFID=E.TACFID AND '
       +     'A.DEPFLAGPRO=''X'' and '
       +     '( '+xMesIni+'-( TO_NUMBER(TO_CHAR(DEPFECHA,''YYYY''))*360+TO_NUMBER(TO_CHAR(DEPFECHA,''MM''))*30) )/30 >=1 and '
       +     'A.DEPCOD='''+dblcTipoD.Text+''' and '
       +     'A.CIAID=B.CIAID and A.ACFID=B.ACFID and '
       +     'A.ACFREFOR=B.ACFREFOR and '
       // PARA QUE NO APAREZCAN LOS ACTIVOS DADOS DE BAJA
       +     '( B.DESANOMES IS NULL OR B.DESANOMES='''' OR B.DESANOMES>'''+WFAPERIODO+''' ) AND '
       //
       +     'C.PERIODO='''+WFAPERIODO+''' and '
       +     'D.PERIODO=A.FAPERIODO AND B.CUENTAID=J.CUENTAID '
       +'Group by A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, A.ACFREFOR ) ';
        }
   End;
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

   pbDep.Position := pbDep.Position + 1;
   pbDep.Position := pbDep.Position + 1;

   /// REVISAR EL SQL
   /// NO TRANSFIERE CORRECTAMENTE LOS ACTIVOS PARA FEBRERO

//////////////////////////////////////////////////////////////
//   Genera Nuevos Registros                                //
//   Calcula                                                //
//////////////////////////////////////////////////////////////

   If SRV_D = 'DB2NT' Then
   Begin
      wSql := 'INSERT INTO ACF204W ( '
         + 'DEPCOD, CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO, '
         + 'FAREDONDEO, DEPNOMESES, DEPFECHA, TACFDEPREC, '
         + 'DEPVALHIST, DEPVALAJUS, '
         + 'DEPANTHIST, DEPANTAJUS, '
         + 'DEPIMPHIST, DEPIMPAJUS, '
         + 'DEPACUHIST, DEPACUAJUS, DEPFLAGPRO, DEPFECPRO, DEPUSER, DEPHREG,'
         + 'DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, CCOSID, LOCID,PISO,AREA,AMBCOD, UBICID,'
         + 'FECANO, FECMES, FECDIA, FECDIASS, FECTRIM, FECSEM, FECSS, FECAATRI, '
         + 'FECAASEM, FECAASS, FECMMSS, ACFREFOR, AFCOD, AFDEPREP, ACFDEPEST, ACFREIPERI, ACFREIACUM, ACFFINIDEP, ACFREIDEPAC, ARTCODBAR, VERI ) '
         + '( '
         + 'SELECT A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, A.CUENTAID, A.DEPFLAGREF, '
         + '''' + wFAPERIODO + ''', CASE WHEN J.FAJUSTE=''S'' THEN FAREDONDEO ELSE NULL END, DEPNOMESES, '
         + 'A.DEPFECHA, CASE WHEN J.FDEPREC=''S'' THEN  A.TACFDEPREC  ELSE 0 END, '
        // Valor
      + 'Round( A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100, 2 ), '
         + 'Round( A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100, 2 ), '
        // Anterior ANTERIOR HISTORICA
      + ' case when (dec((A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100)*power(10,2),15,2)-int((A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100)*power(10,2)))*10>=5 '
         + ' then dec((A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100),15,2)+1/power(10,2) else dec((A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100),15,2) end DEPANTHIST, '
        // ACUMULADA ANTERIOR AJUSTADA
      + ' case when (dec((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100)*power(10,2),15,2)-int((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100)*power(10,2)))*10>=5 '
         + ' then dec((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100),15,2)+1/power(10,2) else dec((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100),15,2) end  DEPANTAJUS, '
        //+ 'Round( A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100, 2 ), '
        //+ 'Round( A.DEPANTHIST * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100, 2 ), '
        // Importe
      + 'Round( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)* DEPNOMESES * COALESCE(B.AFDEPREP,100)/100, 4 ), '
         + 'Round( ((((A.DEPVALHIST*DECIMAL(FAREDONDEO,12,3))*A.TACFDEPREC)/100)/12)* DEPNOMESES * COALESCE(B.AFDEPREP,100)/100, 4 ), '
        // Acumulado
      + 'Round( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END, 2 ), '
         + 'Round( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END, 2 ), '
        //
      + '''X'', DATE(''' + FORMATDATETIME('YYYY-MM-DD', WFECPRO) + '''), '
         + '''' + DMAF.wUsuario + ''', ''' + FORMATDATETIME('HH:MM AM/PM', WHREG) + ''', '
         + 'DATE(''' + xFecDep + '''), '
         + 'A.ACFDES, A.ACFFECADQ, A.ACFVALOMN, CASE WHEN A.CIAID=B.CIAID and A.ACFID=B.ACFID THEN B.CCOSID ELSE A.CCOSID END, A.LOCID,A.PISO,A.AREA,A.AMBCOD, A.UBICID, '
         + '''' + WFECANO + ''', ''' + WFECMES + ''', ''' + WFECDIA + ''', '
         + '''' + WFECDIASS + ''', ''' + WFECTRIM + ''', ''' + WFECSEM + ''', '
         + '''' + WFECSS + ''', ''' + WFECAATRI + ''', ''' + WFECAASEM + ''', '
         + '''' + WFECAASS + ''', ''' + WFECMMSS + ''', A.ACFREFOR, B.AFCOD, B.AFDEPREP, ''DEPRECIADO'',  '
         + ' A.ACFREIACUM +(Round( A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100, 2 ))-(Round( A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100, 2 )) ,'
         + ' (Round( A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100, 2 ))-(Round( A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100, 2 )), A.ACFFINIDEP,  '
         + ' A.ACFREIDEPAC, A.ARTCODBAR, A.VERI '
         + ' FROM ACF204W A '
         + ' LEFT OUTER JOIN ACF103 B ON ( A.CIAID=B.CIAID and A.ACFID=B.ACFID and A.ACFREFOR=B.ACFREFOR ) '
         + ' , ACF110 J '
         + ' WHERE A.CIAID=''' + dblcCia.Text + ''' AND A.DEPFLAGPRO=''T'' and DEPNOMESES>=1 AND  A.CUENTAID=J.CUENTAID and '
         + 'A.DEPCOD=''' + dblcTipoD.Text + ''' and (J.FDEPREC=''S'' OR J.FAJUSTE=''S'' OR FLGASTO=''N'') )';
   End;
   If SRV_D = 'DB2400' Then
   Begin
      wSqly := 'INSERT INTO ACF204W ( '
         + 'DEPCOD, CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO, '
         + 'FAREDONDEO, DEPNOMESES, DEPFECHA, TACFDEPREC, '
         + 'DEPVALHIST, DEPVALAJUS, '
         + 'DEPANTHIST, DEPANTAJUS, ' // VHN
         + 'DEPIMPHIST, DEPIMPAJUS, '
         + 'DEPACUHIST, DEPACUAJUS, ACFREIDEPR, '
         + 'DEPFLAGPRO, DEPFECPRO, DEPUSER, DEPHREG,'
         + 'DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, CCOSID, LOCID, PISO,AREA,AMBCOD,UBICID,'
         + 'FECANO, FECMES, FECDIA, FECDIASS, FECTRIM, FECSEM, FECSS, FECAATRI, '
         + 'FECAASEM, FECAASS, FECMMSS, ACFREFOR, AFCOD, AFDEPREP , ACFDEPEST, ACFREIPERI, ACFREIACUM, ACFFINIDEP, ACFREIDEPAC, ARTCODBAR, VERI ) '
         + '( '
         + 'SELECT A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, A.CUENTAID, A.DEPFLAGREF, '
         + '''' + wFAPERIODO + ''',  CASE WHEN J.FAJUSTE=''S'' THEN FAREDONDEO ELSE NULL END, DEPNOMESES, '
         + 'A.DEPFECHA, CASE WHEN J.FDEPREC=''S'' THEN  A.TACFDEPREC  ELSE 0 END, '

        // Valor Historico
      + ' CASE WHEN COALESCE(B.AFDEPREP,0)=0 '
         + 'THEN A.DEPVALHIST '
         + 'ELSE '
         + 'CASE WHEN (DEC( (A.DEPVALHIST*COALESCE(B.AFDEPREP,100)/100)*POWER(10,2),15,2)-Int((A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100)*power(10,2)))*10>=5 '
         + ' then dec((A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100),15,2)+1/power(10,2) '
         + ' else dec((A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100),15,2) end '
         + ' END DEPVALHIST, '
        // Valor Ajustado
      + ' CASE WHEN COALESCE(B.AFDEPREP,0)=0 '
         + 'THEN '
         + ' CASE WHEN (DEC( (A.DEPVALHIST*DECIMAL(FAREDONDEO,12,3) )*power(10,2),15,2)- int((A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) )*power(10,2)))*10>=5 '
         + ' then dec((A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) ),15,2)+1/power(10,2) '
         + ' else dec((A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) ),15,2) end '
         + 'ELSE '
         + ' CASE WHEN (DEC( (A.DEPVALHIST*DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100)*power(10,2),15,2)- int((A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100)*power(10,2)))*10>=5 '
         + ' then dec((A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100),15,2)+1/power(10,2) else dec((A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100),15,2) end '
         + ' END DEPVALAJUS, '

        // ACUMULADA ANTERIOR HISTORICA
      + ' CASE WHEN COALESCE(B.AFDEPREP,0)=0 '
         + 'THEN A.DEPANTHIST '
         + 'ELSE '
         + ' case when (dec((A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100)*power(10,2),15,2)-int((A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100)*power(10,2)))*10>=5 '
         + ' then dec((A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100),15,2)+1/power(10,2) else dec((A.DEPANTHIST * COALESCE(B.AFDEPREP,100)/100),15,2) end '
         + ' END DEPANTHIST, '
        // ACUMULADA ANTERIOR AJUSTADA
      + ' CASE WHEN COALESCE(B.AFDEPREP,0)=0 '
         + 'THEN A.DEPANTHIST '
        //+       'THEN '
        //+           ' CASE WHEN (DEC( (A.DEPANTHIST*DECIMAL(FAREDONDEO,12,3) )*power(10,2),15,2)- int((A.DEPANTHIST * DECIMAL(FAREDONDEO,12,3) )*power(10,2)))*10>=5 '
        //+                ' then  dec( (A.DEPANTHIST*DECIMAL(FAREDONDEO,12,3) ),15,2)+1/power(10,2) '
        //+                ' else  dec( (A.DEPANTHIST*DECIMAL(FAREDONDEO,12,3) ),15,2) end '
      + 'ELSE '
         + ' case when (dec((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100)*power(10,2),15,2)-int((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100)*power(10,2)))*10>=5 '
         + ' then dec((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100),15,2)+1/power(10,2) else dec((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100),15,2) end  '
         + ' END DEPANTAJUS, '
        //+ ' CASE WHEN COALESCE(B.AFDEPREP,0)=0 '
        //+       'THEN A.DEPANTAJUS '
        //+       'ELSE '
        //+           ' case when (dec((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100)*power(10,2),15,2)-int((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100)*power(10,2)))*10>=5 '
        //+           ' then dec((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100),15,2)+1/power(10,2) else dec((A.DEPANTAJUS * COALESCE(B.AFDEPREP,100)/100),15,2) end  '
        //+ ' END DEPANTAJUS, '

        //CALCULO DE DEPIMPHIST
      + ' case when (dec(((((A.DEPVALHIST*A.TACFDEPREC)/100)/12)* DEPNOMESES * COALESCE(B.AFDEPREP,100)/100)*power(10,2),15,2)-int(((((A.DEPVALHIST*A.TACFDEPREC)/100)/12)* DEPNOMESES * COALESCE(B.AFDEPREP,100)/100)*power(10,2)))*10>=5 '
         + ' then dec(( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)* DEPNOMESES * COALESCE(B.AFDEPREP,100)/100 ),15,2)+1/power(10,2) else dec(( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)* DEPNOMESES * COALESCE(B.AFDEPREP,100)/100 ),15,2) end DEPIMPHIST, '
        //CALCULO DE DEPIMPAJUS
      + ' case when (dec(((((A.DEPVALHIST*A.TACFDEPREC)/100)/12)* DEPNOMESES * COALESCE(B.AFDEPREP,100)/100)*power(10,2),15,2)-int(((((A.DEPVALHIST*A.TACFDEPREC)/100)/12)* DEPNOMESES * COALESCE(B.AFDEPREP,100)/100)*power(10,2)))*10>=5 '
         + ' then dec(( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)* DEPNOMESES * COALESCE(B.AFDEPREP,100)/100 ),15,2)+1/power(10,2) else dec(( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)* DEPNOMESES * COALESCE(B.AFDEPREP,100)/100 ),15,2) end DEPIMPHIST, ';

      wSqlx :=
        // CALCULO DE DEPACUHIST
      ' case when (dec(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END )*power(10,2),15,2)-int(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END )*power(10,2)))*10>=5 '
         + ' then dec(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END ),15,2)+1/power(10,2) else dec(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END ),15,2) end DEPACUHIST, '
        // CALCULO DE DEPACUAJUS
      + ' case when (dec(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END )*power(10,2),15,2)-int(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END )*power(10,2)))*10>=5 '
         + ' then dec(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END ),15,2)+1/power(10,2) else dec(( COALESCE(DEPACUHIST,0)* CASE WHEN COALESCE(B.AFDEPREP,0)=0 THEN 1 ELSE B.AFDEPREP/100 END ),15,2) end  DEPACUAJUS, '

        // REI de la Depreciacion ACFREIDEPR
      + ' CASE WHEN COALESCE(B.AFDEPREP,0)=0 '
         + 'THEN'
         + ' CASE WHEN (DEC( (A.DEPANTHIST*DECIMAL(FAREDONDEO,12,3) )*power(10,2),15,2)- int((A.DEPANTHIST * DECIMAL(FAREDONDEO,12,3) )*power(10,2)))*10>=5 '
         + ' then  dec( (A.DEPANTHIST*DECIMAL(FAREDONDEO,12,3) ),15,2)+1/power(10,2) '
         + ' else  dec( (A.DEPANTHIST*DECIMAL(FAREDONDEO,12,3) ),15,2) end '
         + '-COALESCE(A.DEPANTHIST,0) '
         + 'ELSE'
         + ' X.REIDEP '
         + ' END REIDEP, '

        //+'X.REIDEP, '

        //
      + '''X'', DATE(''' + FORMATDATETIME('YYYY-MM-DD', WFECPRO) + '''), '
         + '''' + DMAF.wUsuario + ''', ''' + FORMATDATETIME('HH:MM AM/PM', WHREG) + ''', '
         + 'DATE(''' + xFecDep + '''), '
         + 'A.ACFDES, A.ACFFECADQ, A.ACFVALOMN, CASE WHEN A.CIAID=B.CIAID and A.ACFID=B.ACFID THEN B.CCOSID ELSE A.CCOSID END, A.LOCID, A.PISO,A.AREA,A.AMBCOD,A.UBICID, '
         + '''' + WFECANO + ''', ''' + WFECMES + ''', ''' + WFECDIA + ''', '
         + '''' + WFECDIASS + ''', ''' + WFECTRIM + ''', ''' + WFECSEM + ''', '
         + '''' + WFECSS + ''', ''' + WFECAATRI + ''', ''' + WFECAASEM + ''', '
         + '''' + WFECAASS + ''', ''' + WFECMMSS + ''', A.ACFREFOR, B.AFCOD, B.AFDEPREP,''DEPRECIADO'', '

        // REI ACUMULADO
        //+ ' COALESCE(A.ACFREIACUM,0), '
      + ' COALESCE(A.ACFREIPERI,0), '

        // REI DEL PERIODO
      + ' ( case when (dec((A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100)*power(10,2),15,2)- int((A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100)*power(10,2)))*10>=5 '
         + ' then  dec((A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100),15,2)+1/power(10,2) else dec((A.DEPVALHIST * DECIMAL(FAREDONDEO,12,3) * COALESCE(B.AFDEPREP,100)/100),15,2) end)- '
         + ' ( CASE WHEN (DEC((A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100)*POWER(10,2),15,2)-Int ((A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100)*power(10,2)))*10>=5 '
         + ' then  dec((A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100),15,2)+1/power(10,2) else dec((A.DEPVALHIST * COALESCE(B.AFDEPREP,100)/100),15,2) end ), '
        //

      + 'A.ACFFINIDEP, '

        // REI DE LA DEPRECIACION ACUMULADA
      + 'A.ACFREIDEPAC, A.ARTCODBAR, A.VERI '

      + 'FROM ACF204W A '
         + 'LEFT OUTER JOIN ACF103 B ON ( A.CIAID=B.CIAID and A.ACFID=B.ACFID and A.ACFREFOR=B.ACFREFOR ) '
         + 'LEFT JOIN ACF208 X ON ( A.CIAID=X.CIAID and A.TACFID=X.TACFID AND A.ACFID=X.ACFID and A.ACFREFOR=X.ACFREFOR ) '
         + ' , ACF110 J '

      + 'WHERE A.CIAID=''' + dblcCia.Text + ''' AND A.DEPFLAGPRO=''T'' and DEPNOMESES>=1 AND A.CUENTAID=J.CUENTAID and '
         + 'A.DEPCOD=''' + dblcTipoD.Text + ''' and (J.FDEPREC=''S'' OR J.FAJUSTE=''S'' OR FLGASTO=''N'' ) )';
      wSql := wSQLy + wSQLx;
   End;

   If (SRV_D = 'ORACLE') Then
   Begin
      wSql := 'INSERT INTO ACF204W ( '
         + 'DEPCOD, CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO, '
         + 'FAREDONDEO, DEPNOMESES, DEPFECHA, TACFDEPREC, '
         + 'DEPVALHIST, DEPVALAJUS, '
         + 'DEPANTHIST, DEPANTAJUS, ' // VHN
         + 'DEPIMPHIST, DEPIMPAJUS, '
         + 'DEPACUHIST, DEPACUAJUS, DEPFLAGPRO, DEPFECPRO, DEPUSER, DEPHREG,'
         + 'DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, CCOSID, LOCID, PISO,AREA,AMBCOD,UBICID,'
         + 'FECANO, FECMES, FECDIA, FECDIASS, FECTRIM, FECSEM, FECSS, FECAATRI, '
//              + 'FECAASEM, FECAASS, FECMMSS, ACFREFOR, AFCOD, AFDEPREP, ACFDEPEST, ACFREIACUM,ACFREIPERI ) '
      + 'FECAASEM, FECAASS, FECMMSS, ACFREFOR, AFCOD, AFDEPREP, ACFDEPEST,ACFREIPERI, ACFREIACUM,ACFFINIDEP, ARTCODBAR, VERI ) '
         + '( '
         + 'SELECT A.DEPCOD, A.CIAID, A.ACFID, A.TACFID, A.CUENTAID, A.DEPFLAGREF, '
         + '''' + wFAPERIODO + ''', DECODE( J.FAJUSTE,''S'', FAREDONDEO,0), DEPNOMESES, '
         + 'A.DEPFECHA, DECODE( J.FDEPREC,''S'', A.TACFDEPREC, 0) , '

      + 'Round( A.DEPVALHIST * NVL(B.AFDEPREP,100)/100, 2 ), '
         + 'Round( A.DEPVALHIST * FAREDONDEO * NVL(B.AFDEPREP,100)/100, 2 ), '

      + 'Round( A.DEPANTHIST * NVL(B.AFDEPREP,100)/100, 2 ), '
         + 'Round( A.DEPANTHIST * FAREDONDEO * NVL(B.AFDEPREP,100)/100, 2 ), '

      + 'Round( (((A.DEPVALHIST*A.TACFDEPREC)/100)/12)* DEPNOMESES * NVL(B.AFDEPREP,100)/100, 3 ), '
         + 'Round( ((((A.DEPVALHIST* FAREDONDEO)*A.TACFDEPREC)/100)/12)* DEPNOMESES * NVL(B.AFDEPREP,100)/100, 3 ), '
         + 'Round( NVL(DEPACUHIST,0)* DECODE(NVL(B.AFDEPREP,0),0,1, B.AFDEPREP/100), 2 ), '
         + 'Round( NVL(DEPACUHIST,0)* DECODE(NVL(B.AFDEPREP,0),0,1, B.AFDEPREP/100) , 2 ), '

      + '''X'', TO_DATE(''' + FORMATDATETIME(DMAF.wFormatFecha, WFECPRO) + '''), '
         + '''' + DMAF.wUsuario + ''', SYSDATE, '
         + 'TO_DATE(''' + xFecDep + '''), '
         + 'A.ACFDES, A.ACFFECADQ, A.ACFVALOMN, '
         + 'CASE WHEN A.CIAID=B.CIAID AND A.ACFID=B.ACFID THEN B.CCOSID ELSE A.CCOSID END CCOSID, '
              //+ 'DECODE(A.CIAID,B.CIAID,DECODE(A.ACFID,B.ACFID,B.CCOSID,A.CCOSID),0),
      + 'A.LOCID, A.PISO, A.AREA, A.AMBCOD, A.UBICID, '
         + '''' + WFECANO + ''', ''' + WFECMES + ''', ''' + WFECDIA + ''', '
         + '''' + WFECDIASS + ''', ''' + WFECTRIM + ''', ''' + WFECSEM + ''', '
         + '''' + WFECSS + ''', ''' + WFECAATRI + ''', ''' + WFECAASEM + ''', '
         + '''' + WFECAASS + ''', ''' + WFECMMSS + ''', A.ACFREFOR, B.AFCOD, B.AFDEPREP, ''DEPRECIADO'', '
         + ' A.ACFREIACUM+(Round( A.DEPVALHIST * FAREDONDEO * NVL(B.AFDEPREP,100)/100, 2 )-Round( A.DEPVALHIST * NVL(B.AFDEPREP,100)/100, 2 )), '
         + 'Round( A.DEPVALHIST * FAREDONDEO * NVL(B.AFDEPREP,100)/100, 2 )-Round( A.DEPVALHIST * NVL(B.AFDEPREP,100)/100, 2 ),A.ACFFINIDEP, A.ARTCODBAR, A.VERI '
         + 'FROM ACF204W A, ACF103 B , ACF110 J '
         + 'WHERE A.CIAID=''' + dblcCia.Text + ''' AND A.CIAID=B.CIAID(+) and A.ACFID=B.ACFID(+) and A.ACFREFOR=B.ACFREFOR(+)  '
         + 'AND  A.DEPFLAGPRO=''T'' and DEPNOMESES>=1 AND A.CUENTAID=J.CUENTAID and '
         + 'A.DEPCOD=''' + dblcTipoD.Text + ''' and (J.FDEPREC=''S'' OR J.FAJUSTE=''S'' OR FLGASTO=''N'' ) )';
   End;
          //agregar
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

   pbDep.Position := pbDep.Position + 1;

// 3.Actualiza "Z" a ACF204w cuando el activo está totalmente Depreciado

   wSql := 'DELETE FROM ACF204W '
      + 'WHERE CIAID=''' + dblcCia.Text + ''' AND DEPCOD=''' + dblcTipoD.Text + ''' and DEPFLAGPRO=''T''';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

// vhn
// actualiza los valosres de los Activos que no se Deprecian ni se ajustan

// FALTA EN ORACLE
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      wSql := 'Update ACF204W SET DEPVALAJUS = COALESCE(DEPVALHIST,0), '
         + 'DEPNETOAJU = COALESCE(DEPNETOHIS,0), '
         + 'DEPIMPAJUS = COALESCE(DEPIMPHIST,0), '
         + 'DEPANTAJUS = COALESCE(DEPANTHIST,0), '
         + 'DEPACUAJUS = COALESCE(DEPACUHIST,0) '
         + 'Where CIAID=''' + dblcCia.Text + ''' AND DEPFLAGPRO=''X'' and '
         + 'DEPCOD=''' + dblcTipoD.Text + ''' AND COALESCE(DEPVALAJUS,0)=0';
   End;
   If (SRV_D = 'ORACLE') Then
   Begin
      wSql := 'Update ACF204W SET DEPVALAJUS = NVL(DEPVALHIST,0), '
         + 'DEPNETOAJU = NVL(DEPNETOHIS,0), '
         + 'DEPIMPAJUS = NVL(DEPIMPHIST,0), '
         + 'DEPANTAJUS = NVL(DEPANTHIST,0), '
         + 'DEPACUAJUS = NVL(DEPACUHIST,0) '
         + 'Where CIAID=''' + dblcCia.Text + ''' AND DEPFLAGPRO=''X'' and '
         + 'DEPCOD=''' + dblcTipoD.Text + ''' AND NVL(DEPVALAJUS,0)=0';
   End;

   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   //

   pbDep.Position := pbDep.Position + 1;

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      // si se deprecia Enero
      wSql := 'Update ACF204W SET DEPNETOHIS = COALESCE(DEPVALHIST,0) - ( COALESCE(DEPANTHIST,0) + COALESCE(DEPIMPHIST,0) ), '
         + 'DEPNETOAJU = COALESCE(DEPVALAJUS,0) - ( COALESCE(DEPANTAJUS,0) + COALESCE(DEPIMPAJUS,0) + COALESCE(ACFREIDEPR,0) ), '
         + 'DEPACUHIST = COALESCE(DEPANTHIST,0) + COALESCE(DEPIMPHIST,0), '
         + 'DEPACUAJUS = COALESCE(DEPANTAJUS,0) + COALESCE(DEPIMPAJUS,0) + COALESCE(ACFREIDEPR,0), '
         + 'ACFREIACUM = COALESCE(DEPVALAJUS,0) - COALESCE(DEPVALHIST,0) '
         + 'Where CIAID=''' + dblcCia.Text + ''' AND DEPFLAGPRO=''X'' and '
         + 'DEPCOD=''' + dblcTipoD.Text + ''''
   End;

   If (SRV_D = 'ORACLE') Then
   Begin
      // si se deprecia Enero
      wSql := 'Update ACF204W SET DEPNETOHIS = NVL(DEPVALHIST,0) - ( NVL(DEPANTHIST,0) + NVL(DEPIMPHIST,0) ), '
         + 'DEPNETOAJU = NVL(DEPVALAJUS,0) - ( NVL(DEPANTAJUS,0) + NVL(DEPIMPAJUS,0) + NVL(ACFREIDEPR,0) ), '
         + 'DEPACUHIST = NVL(DEPANTHIST,0) + NVL(DEPIMPHIST,0), '
         + 'DEPACUAJUS = NVL(DEPANTAJUS,0) + NVL(DEPIMPAJUS,0) + NVL(ACFREIDEPR,0), '
         + 'ACFREIACUM = NVL(DEPVALAJUS,0) - NVL(DEPVALHIST,0) '
         + 'Where CIAID=''' + dblcCia.Text + ''' AND DEPFLAGPRO=''X'' and '
         + 'DEPCOD=''' + dblcTipoD.Text + ''''
           {
      wSql:='UPDATE ACF204W SET DEPNETOHIS=NVL(DEPVALHIST,0) -( NVL(DEPANTHIST,0)+NVL(DEPIMPHIST,0) ), '
           +                  ' DEPNETOAJU=NVL(DEPVALAJUS,0) -( NVL(DEPANTAJUS,0)+NVL(DEPIMPAJUS,0)+NVL(ACFREIDEPR,0) ), '
           +                  ' DEPACUHIST=NVL(DEPANTHIST,0) + NVL(TO_CHAR(DEPIMPHIST),0), '
           +                  ' DEPACUAJUS=NVL(DEPANTAJUS,0) + NVL(TO_CHAR(DEPIMPAJUS),0) + NVL(ACFREIDEPR,0) '
           +'Where CIAID='''+dblcCia.Text+''' AND DEPFLAGPRO=''X'' and '
           +      'DEPCOD='''+dblcTipoD.Text+'''';
           }
   End;

// agregara
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

   pbDep.Position := pbDep.Position + 1;

   wSql := 'Update ACF204W SET DEPFLAGPRO=''Z'' '
      + 'Where CIAID=''' + dblcCia.Text + ''' AND DEPACUHIST>=DEPVALHIST and '
      + 'DEPCOD=''' + dblcTipoD.Text + '''';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

   pbDep.Position := pbDep.Position + 1;

// Apedido de LUZ Generar 0 Bienes totalmente depreciados
        //CALCULO DE DEPIMPHIST
        //CALCULO DE DEPIMPAJUS
   wSql := 'Update ACF204W SET DEPIMPHIST=DEPIMPHIST+(DEPVALHIST-DEPACUHIST), '
      + 'DEPIMPAJUS=DEPIMPAJUS+(DEPVALHIST-DEPACUHIST), '
      + 'DEPACUHIST=DEPACUHIST+(DEPVALHIST-DEPACUHIST), '
      + 'DEPACUAJUS=DEPACUAJUS+(DEPVALHIST-DEPACUHIST), '
      + 'DEPNETOHIS=DEPNETOHIS-(DEPVALHIST-DEPACUHIST), '
      + 'DEPNETOAJU=DEPNETOAJU-(DEPVALHIST-DEPACUHIST) '
      + 'Where CIAID=''' + dblcCia.Text + ''' AND DEPFLAGPRO=''Z'' and DEPACUHIST>DEPVALHIST and '
      + 'DEPCOD=''' + dblcTipoD.Text + '''';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

// 09/02/2002
// A pedido de Luz Gutarra Inserta los Activos Adquiridos en el Periodo
// Pero no los deprecia ni ajusta.

   xYY := Copy(dblcdPeriodo.text, 1, 4);
   xMM := Copy(dblcdPeriodo.text, 5, 2);

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'Insert into ACF204W ( CIAID, ACFID, TACFID, CUENTAID, LOCID,PISO,AREA,AMBCOD,UBICID,DEPVALHIST, '
         + 'DEPVALAJUS, DEPFLAGPRO, TACFDEPREC, DEPCOD, CCOSID, ACFVALOMN, '
         + 'ACFDES, ACFFECADQ, DEPFECHA, ACFREFOR, FAPERIODO, DEPNOMESES, DEPNETOAJU, '
         + 'DEPFECDEPR, DEPNETOHIS, ACFDEPEST, ACFREIACUM, ACFREIPERI, ACFFINIDEP, ARTCODBAR, VERI ) '
         + 'Select ACF201.CIAID, ACFID, ACF201.TACFID, ACF201.CUENTAID,ACF201.LOCID,ACF201.PISO,ACF201.AREA,ACF201.AMBCOD,ACF201.UBICID, '
         + 'ACFVALOMN, ACFVALOMN, ''X'', ACF101.TACFDEPREC, ''01'', CCOSID, '
         + 'ACFVALOMN, ACFDES, ACFFECADQ, ACFINIDEP, ACF201.ACFREFOR, '
         + 'SUBSTR( CHAR( ACFFINIDEP ),1,4)||SUBSTR( CHAR( ACFFINIDEP ), 6, 2 ), 1, '
         + ' ACFVALOMN , DATE(''' + xFecDep + '''), ACFVALOMN, ''COMPRAS'', ACFVALOMN, 0, ACF201.ACFFINIDEP, ACF201.ARTCODBAR, ACF201.VERI '
         + 'From ACF201, ACF101, ACF110 '
         + 'Where ACF201.CIAID=''' + dblcCia.Text + ''' '
         + ' AND month(acffinidep)=' + xMM + ' and year(acffinidep)=' + xYY
         + ' AND ACF201.CIAID=ACF101.CIAID and ACF201.TACFID=ACF101.TACFID '
         + ' and ACF201.ACFVALOMN>0 AND ACFFLAGACT=''A'' '
         + ' AND ACF110.CUENTAID=ACF201.CUENTAID AND ACF110.FLGASTO=''N'' ';
   End;
   If (SRV_D = 'ORACLE') Then
   Begin
      xSQL := 'Insert into ACF204W ( CIAID, ACFID, TACFID, CUENTAID,LOCID,PISO,AREA,AMBCOD,UBICID, DEPVALHIST, '
         + 'DEPVALAJUS, DEPFLAGPRO, TACFDEPREC, DEPCOD, CCOSID, ACFVALOMN, '
         + 'ACFDES, ACFFECADQ, DEPFECHA, ACFREFOR, FAPERIODO, DEPNOMESES, DEPNETOAJU, '
         + 'DEPFECDEPR, DEPNETOHIS, ACFDEPEST, ACFREIACUM, ACFREIPERI, ACFFINIDEP, ARTCODBAR, VERI ) '
         + 'Select ACF201.CIAID, ACFID, ACF201.TACFID, ACF201.CUENTAID,ACF201.LOCID,ACF201.PISO,ACF201.AREA,ACF201.AMBCOD,ACF201.UBICID, '
         + 'ACFVALOMN, ACFVALOMN, ''X'', ACF101.TACFDEPREC, ''01'', CCOSID, '
         + 'ACFVALOMN, SUBSTR(ACFDES,1,40), ACFFECADQ, ACFFINIDEP, ACF201.ACFREFOR, '
         + 'TO_CHAR( ACFFINIDEP,''YYYYMM''),1, ACFVALOMN, TO_DATE(''' + xFecDep + '''), ACFVALOMN, ''COMPRAS'', ACFVALOMN, 0, ACF201.ACFFINIDEP, ACF201.ARTCODBAR, ACF201.VERI  '
         + 'From ACF201, ACF101, ACF110 '
         + 'Where ACF201.CIAID=''' + dblcCia.Text + ''' '
         + ' AND TO_CHAR(ACF201.acffinidep,''MM'')=''' + xMM + ''' and TO_CHAR(ACF201.acffinidep,''YYYY'')=' + xYY
         + ' AND ACF201.CIAID=ACF101.CIAID and ACF201.TACFID=ACF101.TACFID '
         + ' and ACF201.ACFVALOMN>0 AND ACFFLAGACT=''A'' '
         + ' AND ACF110.CUENTAID=ACF201.CUENTAID AND ACF110.FLGASTO=''N'' ';
   End;

   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(xSql);
   Except
   End;

// Fin Pedido de Luz

//Actualizar los valores para el REI ACUMULADO (ACFREIACUM) y  el REI del periodo ACFREIPERI
   xsql := ' SELECT * FROM ACF103 WHERE CIAID=''' + dblcCia.Text + '''';
   DMAF.cdsWork1.Close;
   DMAF.cdsWork1.datarequest(xsql);
   DMAF.cdsWork1.open;

   While Not DMAF.cdsWork1.eof Do
   Begin
      xsql := 'SELECT * FROM ACF204W '
         + 'WHERE CIAID=''' + DMAF.cdsWork1.Fieldbyname('CIAID').asstring + ''' '
         + 'and ACFID=''' + DMAF.cdsWork1.Fieldbyname('ACFID').asstring + ''' '
         + 'and TACFID=''' + DMAF.cdsWork1.FieldByName('TACFID').AsString + ''' '
         + 'and CCOSID=''' + DMAF.cdsWork1.Fieldbyname('CCOSID').asstring + ''' '
         + 'and FAPERIODO=''' + dblcdPeriodo.Text + ''' '
         + 'and ACFREFOR=''' + DMAF.cdsWork1.FieldByName('AcFRefor').AsString + '''';
      DMAF.cdsQry3.Close;
      DMAF.cdsQry3.datarequest(xsql);
      DMAF.cdsQry3.open;
      {
      XMONREIACUM :=(DMAF.cdsQry3.fieldbyname('ACFREIACUM').asfloat *DMAF.cdsWork1.FieldByName('AFDEPREP').Asfloat)/100;
      }
      XMONREIPERI := (DMAF.cdsQry3.fieldbyname('ACFREIPERI').asfloat * DMAF.cdsWork1.FieldByName('AFDEPREP').Asfloat) / 100;
      XMONREIDEPAC := (DMAF.cdsQry3.fieldbyname('ACFREIDEPAC').asfloat * DMAF.cdsWork1.FieldByName('AFDEPREP').Asfloat) / 100;
      XMONREIDEPR := (DMAF.cdsQry3.fieldbyname('ACFREIDEPR').asfloat * DMAF.cdsWork1.FieldByName('AFDEPREP').Asfloat) / 100;

      xsql := 'UPDATE ACF204W SET ACFREIPERI =' + floattostr(XMONREIPERI) + ', '
         + 'ACFREIDEPAC=' + floattostr(XMONREIDEPAC) + ', '
         + 'ACFREIDEPR=' + floattostr(XMONREIDEPR) + ', '
         + 'DEPACUAJUS=' + DMAF.wReplacCeros + '(DEPANTAJUS,0) + '
         + DMAF.wReplacCeros + '(DEPIMPAJUS,0) + '
         + floattostr(XMONREIDEPR) + ' '
         + 'WHERE CIAID=''' + DMAF.cdsWork1.Fieldbyname('CIAID').asstring + ''' '
         + 'and ACFID=''' + DMAF.cdsWork1.Fieldbyname('ACFID').asstring + ''' '
         + 'and TACFID=''' + DMAF.cdsWork1.FieldByName('TACFID').AsString + ''' '
         + 'and CCOSID=''' + DMAF.cdsWork1.Fieldbyname('CCOSID').asstring + ''' '
         + 'and FAPERIODO=''' + dblcdPeriodo.Text + ''' '
         + 'and ACFREFOR=''' + DMAF.cdsWork1.FieldByName('AcFRefor').AsString + '''';
      Try
         DMAF.DCOM1.AppServer.EjecutaSQL(xSql);
      Except
      End;

      DMAF.cdsWork1.next;
   End;

  //ACTUALIZA EL CAMPO DEL REI DEL PERIODO
   xSql := ' UPDATE ACF204W SET ACFREIPERI=0, ACFREIACUM=0, ACFREIDEPR=0, ACFREIDEPAC=0 '
      + 'Where CIAID=''' + dblcCia.Text + ''' AND FAPERIODO=''' + dblcdPeriodo.Text + ''' AND ACFDEPEST=''COMPRAS''';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(xSql);
   Except
   End;

  //ACTUALIZA EL CAMPO DEL REI DEL PERIODO
  // Nuevo Calculo LUZ
   xSql := 'UPDATE ACF204W SET '
      + 'ACFREIPERI =' + DMAF.wReplacCeros + '(DEPVALAJUS,0) - ' + DMAF.wReplacCeros + '(DEPVALHIST,0) - ' + DMAF.wReplacCeros + '(ACFREIPERI,0), '
      + 'ACFREIDEPAC=' + DMAF.wReplacCeros + '(ACFREIDEPR,0), '
      + 'ACFREIDEPR =' + DMAF.wReplacCeros + '(ACFREIDEPR,0) - ' + DMAF.wReplacCeros + '(ACFREIDEPAC,0), '
      + 'DEPACUAJUS =' + DMAF.wReplacCeros + '(DEPANTAJUS,0) + ' + DMAF.wReplacCeros + '(DEPIMPAJUS,0) + ( ' + DMAF.wReplacCeros + '(ACFREIDEPR,0) - ' + DMAF.wReplacCeros + '(ACFREIDEPAC,0) ), '
      + 'DEPNETOAJU =' + DMAF.wReplacCeros + '(DEPVALAJUS,0) - ( ' + DMAF.wReplacCeros + '(DEPANTAJUS,0) + ' + DMAF.wReplacCeros + '(DEPIMPAJUS,0) + ( ' + DMAF.wReplacCeros + '(ACFREIDEPR,0) - ' + DMAF.wReplacCeros + '(ACFREIDEPAC,0) ) ) '
      + 'Where CIAID=''' + dblcCia.Text + ''' AND FAPERIODO=''' + dblcdPeriodo.Text + '''';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(xSql);
   Except
   End;
//obc  SE ANULA 4.Actualiza Fecha pendiente de Cierre en Acf104 Ultima Depreciación
{ if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      wSql:='Update ACF104 SET DEPFCIERRE='
           +'DATE('''+FORMATDATETIME('YYYY-MM-DD',DMAF.CDSFACTOR.fieldbyname('FAFECDEPRE').VALUE)+''') '
           +'WHERE CIAID='''+dblcCia.Text+''' AND DEPCOD='''+dblcTipoD.Text+'''';
   end;
 if (SRV_D = 'ORACLE') then
   begin
      wSql:='Update ACF104 SET DEPFCIERRE='
           +'TO_DATE('''+FORMATDATETIME(DMAF.wFormatFecha,DMAF.CDSFACTOR.fieldbyname('FAFECDEPRE').VALUE)+''') '
           +'WHERE CIAID='''+dblcCia.Text+''' AND DEPCOD='''+dblcTipoD.Text+'''';
   end;
   try
    DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   except
   end;
}
   pbDep.Position := pbDep.Position + 1;

   Screen.Cursor := CrDefault;
   wMensaje1.visible := true;
   wMensaje2.Visible := true;

   ShowMessage('Depreciación Terminada');

   pbDep.Position := 0;

End;

Procedure TFDeprecia1.bbtnCancela4Click(Sender: TObject);
Begin
// obc 2004 febrero   FormActivate(self);
//   wMensaje3.Caption:='';
   Close;
End;

Procedure TFDeprecia1.dblcTipoDExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CIAID=''' + dblcCia.Text + ''' AND DEPCOD=''' + dblcTipoD.Text + '''';
   dbeTipo.Text := DMAF.DisplayDescrip('dspTGE', 'ACF104', 'DEPDESCRI', xWhere, 'DEPDESCRI');

   If dbeTipo.Text = '' Then
   Begin
      dblcTipoD.SetFocus;
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   End;

   wMensaje1.Visible := False;
   wMensaje2.Visible := False;
   wMensaje3.Caption := DMAF.cdsUDep.FieldByName('DepDescri').AsString;
   wMensaje4.Visible := False;

// PRESENTA POSIBLES PERIODOS A PROCESAR EN LOOKUP: MISMO TIPO-
// DEPREC., PDTE. DE PROCESO'X' y MAYOR A ULTIMO PERIODO DEPRECIACION
   wSQL := 'SELECT * FROM ACF102 '
      + 'WHERE CIAID=''' + dblcCia.Text + ''' AND DEPCOD=''' + DMAF.CDSUDEP.FieldByName('DEPCOD').AsString + ''' '
      + 'AND FAPROC=''X'' AND FAPERIODO>''' + DMAF.CDSUDEP.FieldByName('FAPERIODO').AsString + ''' '
      + 'ORDER BY FAPERIODO';
   DMAF.cdsFACTOR.Close;
   DMAF.cdsFACTOR.DataRequest(wSQL);
   DMAF.cdsFACTOR.Open;
End;

Procedure TFDeprecia1.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFDeprecia1.dblcdPeriodoExit(Sender: TObject);
Begin
   If DMAF.cdsFactor.FieldByName('FAPERIODO').AsString <> dblcdPeriodo.Text Then
   Begin
      ShowMessage('Error : Periodo no Existe');
      dblcdPeriodo.SetFocus;
      Exit;
   End;
End;

Procedure TFDeprecia1.dblcCiaExit(Sender: TObject);
Var
   xwhere, wSQL: String;
Begin
   xWhere := 'CIAID=''' + dblcCia.Text + '''';
   edtCiades.Text := DMAF.DisplayDescrip('dspTGE', 'TGE101', 'CIADES', xWhere, 'CIADES');

   If edtCiades.Text = '' Then
   Begin
      dblcCia.SetFocus;
      ShowMessage('Error : Falta Seleccionar Compañía');
      Exit;
   End;

   wSQL := 'SELECT * FROM ACF104 '
      + 'WHERE CIAID=''' + dblcCia.Text + ''' AND DEPFLAGACT=''A''';

   DMAF.cdsUDEP.Close;
   DMAF.cdsUDEP.DataRequest(wSQL);
   DMAF.cdsUDEP.Open;

   If DMAF.cdsUDep.RecordCount = 1 Then
   Begin
      dblcTipoD.Text := DMAF.cdsUDep.FieldByName('DEPCOD').AsString;
      dblcTipoDExit(Sender);
      dblcdPeriodo.SetFocus;
   End;

End;

Procedure TFDeprecia1.FormShow(Sender: TObject);
Begin
   dblcCia.SetFocus;
End;

End.

