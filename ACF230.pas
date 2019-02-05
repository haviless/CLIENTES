Unit ACF230;
// HPC_201401_ACF se adiciono la linea Close en el boton de Procesar
//                para que luego del procesamiento de depreciación cierre el formulario

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, wwdblook, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
   Mask, wwdbedit, ComCtrls;

Type
   TFCierraDepre = Class(TForm)
      wMensaje3: TLabel;
      bbtnOk1: TBitBtn;
      wMensaje1: TLabel;
      wMensaje2: TLabel;
      Label2: TLabel;
      bbtnCancela4: TBitBtn;
      Label74: TLabel;
      dblcTipoD: TwwDBLookupCombo;
      dbeTipo: TwwDBEdit;
      pbCierre: TProgressBar;
      Label3: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCiades: TEdit;
      Label1: TLabel;
      dbePeriodo: TwwDBEdit;
      Procedure dbgTipoDepDblClick(Sender: TObject);
      Procedure bbtnOk1Click(Sender: TObject);
      Procedure bbtnCancela4Click(Sender: TObject);
      Procedure dblcTipoDExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;
Var
   wFecpro: TDate;
   WHReg: TTime;
   FCierraDepre: TFCierraDepre;
   wSql, wFaperiodo: String;
Implementation

Uses ACFDM;

{$R *.DFM}

Procedure TFCierraDepre.dbgTipoDepDblClick(Sender: TObject);
Begin
   wMensaje3.Caption := DMAF.cdsUDep.FieldByName('DepDescri').Value;
   wMensaje2.Caption := DMAF.cdsUDep.FieldByName('DepFCierre').AsString;
   wMensaje1.Visible := False;
End;

Procedure TFCierraDepre.bbtnOk1Click(Sender: TObject);
Var
   xCierre, wAANew, wMesNew, wDiaNew, wFAPERIODONew, wFAFECDEPRENew: String;
   XSQL, WFUERA: String;
   WFAFECDEPRE: TDATE;
   // vhn Fecha de Cierre
   wFAPERIODOCie, wFAFECDEPRECie: String;
Begin
   If dbeTipo.Text = '' Then
   Begin
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   End;
// Inicio HPC_201401_ACF
   If dbePeriodo.Text = '' Then
   Begin
      ShowMessage('Error : Falta Ingresar periodo');
      Exit;
   End;
// Fin HPC_201401_ACF

   pbCierre.Max := 6;
   pbCierre.Min := 0;
   pbCierre.Position := 0;
   pbCierre.Position := pbCierre.Position + 1;

   wFecpro := Date;
   wHreg := Time;

// PROCESO CONFIRMADO DE CIERRE
// 1. Marca como Procesado(P) a ACF204(Depreciación) los registros
//    que pasaron a ACF204W para ser procesados

   pbCierre.Position := pbCierre.Position + 1;

   wFaPeriodo := DMAF.cdsQry.fieldbYName('FAPERIODO').AsString;
   wFaFecDepre := DMAF.cdsQry.fieldbYName('FAFECDEPRE').value;

   // ELIMINAR LOS ACTIVOS CON FECHA MAYOR A LA FECHA DE CIERRE

   wSql := 'Delete From ACF204 '
      + ' Where CIAID=''' + dblcCia.Text + ''' and FAPERIODO>=''' + wFaPeriodo + ''' AND  DEPFLAGPRO=''X''';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

// fin eliminar activos
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xCierre := FORMATDATETIME('YYYY-MM-DD', DMAF.CDSUDEP.FieldByName('DEPFCIERRE').VALUE);
      wSql := 'Update ACF204 '
         + 'Set DEPFLAGPRO=''P'', '
         + 'DEPFECPRO=DATE(''' + FORMATDATETIME('YYYY-MM-DD', Date) + '''), '
         + 'DEPHREG=''' + FORMATDATETIME('HH:MM AM/PM', Time) + ''' '
         + 'Where CIAID=' + quotedstr(dblcCia.Text)
         + ' AND DEPCOD=' + quotedstr(dblcTipoD.Text)
         + ' AND DEPFLAGPRO=' + quotedstr('X');
//           +' AND ((TO_CHAR(TO_DATE('''+ xCierre +'''),''DDD'')-TO_CHAR(DEPFECHA,''DDD''))/30)>=1 ';
   End;

   If (SRV_D = 'ORACLE') Then
   Begin
      xCierre := FORMATDATETIME('DD-MM-YYYY', DMAF.CDSUDEP.FieldByName('FECHACIERRE').VALUE);
      wSql := 'Update ACF204 '
         + 'Set DEPFLAGPRO=''P'', '
         + 'DEPFECPRO=TO_DATE(''' + FORMATDATETIME(DMAF.wFormatFecha, Date) + '''), '
         + 'DEPHREG=SYSDATE '
         + 'Where CIAID=' + quotedstr(dblcCia.Text)
         + ' AND DEPCOD=' + quotedstr(dblcTipoD.Text)
         + ' AND DEPFLAGPRO=' + quotedstr('X');
//           +' AND (((TO_CHAR(TO_DATE('''+ xCierre +'''),''DDD'')-TO_CHAR(DEPFECHA,''DDD''))/30)>=1 '
//           +' OR DEPFECHA='+quotedstr(DMAF.cdsUDep.FieldbyName('FECHACIERRE').AsString)+')';
   End;

   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

   pbCierre.Position := pbCierre.Position + 1;

// 2. Recupera Area de trabajo ACF204w Insertándola a ACF204
//    selecciona tipo de depreciación específico

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      wSql := 'INSERT INTO ACF204 '
         + '(ACFDEPEST,CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO , '
         + 'FAREDONDEO, DEPNOMESES, DEPFECHA, '
         + 'DEPVALHIST, DEPVALAJUS, '
         + 'DEPANTHIST, DEPANTAJUS, '
         + 'DEPACUHIST, DEPACUAJUS, '
         + 'DEPIMPHIST, DEPIMPAJUS, DEPNETOHIS, DEPNETOAJU, '
         + 'TACFDEPREC, DEPFLAGPRO, DEPFECPRO,DEPUSER, '
         + 'DEPHREG, DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, DEPCOD, CCOSID,'
         + 'LOCID,PISO,AREA,AMBCOD,UBICID,FECANO,FECMES, FECDIA,FECDIASS,FECTRIM,FECSEM,FECSS,'
         + 'FECAATRI, FECAASEM,FECAASS, FECMMSS, ACFREFOR, AFCOD, AFDEPREP, '
         + 'ACFREIACUM, ACFREIPERI, ACFREIDEPR, ACFREIDEPAC, ACFFINIDEP,ARTCODBAR, VERI )'
         + '(SELECT ACFDEPEST,CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO, '
         + 'FAREDONDEO, DEPNOMESES, DEPFECDEPR, '
         + 'DEPVALHIST, DEPVALAJUS, '
         + 'COALESCE(DEPANTHIST,0), '
         + 'COALESCE(DEPANTAJUS,0), '
         + 'COALESCE(DEPACUHIST,0), '
         + 'COALESCE(DEPACUAJUS,0), '
         + 'DEPIMPHIST, DEPIMPAJUS, DEPNETOHIS, DEPNETOAJU, '
         + 'TACFDEPREC, DEPFLAGPRO, DEPFECPRO, ''' + DMAF.wUsuario + ''', '
         + 'DEPHREG, DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, DEPCOD, CCOSID,'
         + 'LOCID,PISO,AREA,AMBCOD, UBICID, FECANO,FECMES,FECDIA,FECDIASS,FECTRIM,FECSEM,FECSS,'
         + 'FECAATRI, FECAASEM, FECAASS, FECMMSS, ACFREFOR, AFCOD, AFDEPREP, '
         + 'ACFREIACUM, ACFREIPERI, ACFREIDEPR, ACFREIDEPAC, ACFFINIDEP,ARTCODBAR, VERI '
         + 'FROM ACF204W '
         + 'WHERE CIAID=''' + dblcCia.Text + ''' and DEPCOD=''' + dblcTipoD.Text + ''' ) ';
   End;
   If (SRV_D = 'ORACLE') Then
   Begin
      wSql := 'INSERT INTO ACF204 '
         + '(CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO , '
         + 'FAREDONDEO, DEPNOMESES, DEPFECHA, '
         + 'DEPVALHIST, DEPVALAJUS, '
         + 'DEPANTHIST, DEPANTAJUS, '
         + 'DEPACUHIST, DEPACUAJUS, '
         + 'DEPIMPHIST, DEPIMPAJUS, DEPNETOHIS, DEPNETOAJU, '
         + 'TACFDEPREC, DEPFLAGPRO, DEPFECPRO,DEPUSER, '
         + 'DEPHREG, DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, DEPCOD, CCOSID,'
         + 'LOCID,PISO,AREA,AMBCOD,UBICID,FECANO,FECMES,FECDIA,FECDIASS,FECTRIM,FECSEM,FECSS,'
         + 'FECAATRI,FECAASEM,FECAASS,FECMMSS,ACFREFOR,AFCOD,AFDEPREP,ACFREIACUM,ACFREIPERI,ARTCODBAR, VERI,ACFFINIDEP)'
         + '(SELECT CIAID, ACFID, TACFID, CUENTAID, DEPFLAGREF, FAPERIODO, '
         + 'FAREDONDEO, DEPNOMESES, DEPFECDEPR, '
         + 'DEPVALHIST, DEPVALAJUS, '
         + 'NVL(DEPANTHIST,0), '
         + 'NVL(DEPANTAJUS,0), '
         + 'NVL(DEPACUHIST,0), '
         + 'NVL(DEPACUAJUS,0), '
         + 'DEPIMPHIST, DEPIMPAJUS, DEPNETOHIS, DEPNETOAJU, '
         + 'TACFDEPREC, DEPFLAGPRO, DEPFECPRO, ''' + DMAF.wUsuario + ''', '
         + 'DEPHREG, DEPFECDEPR, ACFDES, ACFFECADQ, ACFVALOMN, DEPCOD, CCOSID,'
         + 'LOCID, PISO,AREA,AMBCOD,UBICID, FECANO,FECMES,FECDIA,FECDIASS,FECTRIM,FECSEM,FECSS,'
         + 'FECAATRI,FECAASEM,FECAASS,FECMMSS, ACFREFOR, AFCOD, AFDEPREP,ACFREIACUM,ACFREIPERI,ARTCODBAR,VERI,ACFFINIDEP '
         + ' FROM ACF204W '
         + 'WHERE CIAID=''' + dblcCia.Text + ''' and DEPCOD=''' + dblcTipoD.Text + ''' ) ';
   End;
   DMAF.DCOM1.AppServer.EjecutaSQL(wSql);

   pbCierre.Position := pbCierre.Position + 1;

// 3. Marca los Registros Totalmente Depreciados en Maestro
//    a partir de Area de trabajo

// 3. Deja limpia Area de trabajo
//    selecciona tipo de depreciación específico

   wSql := 'DELETE FROM ACF204W WHERE CIAID=''' + dblcCia.Text + ''' and DEPCOD =''' + dblcTipoD.Text + '''';
   DMAF.DCOM1.AppServer.EjecutaSQL(wSql);

   pbCierre.Position := pbCierre.Position + 1;

// 4. Actualiza como Procesado "P" a ACF102(Tabla de Factores) Periodo Procesado.
//    selecciona Periodo y tipo de depreciación específico

   wSql := 'Update ACF102 SET FAPROC=''P'' '
      + 'WHERE CIAID=''' + dblcCia.Text + ''' and FAPERIODO=''' + WFAPERIODO + ''' AND '
      + 'DEPCOD=''' + dblcTipoD.Text + '''';
   DMAF.DCOM1.AppServer.EjecutaSQL(wSql);

   /////////////////////////////////////////////////////////////////////////////
   // INSERTA SIGUIENTE PERIODO DE DEPRECIACION
   wSQL := 'SELECT * FROM ACF102 WHERE'
      + ' CIAID=''' + dblcCia.Text + ''' and FAPERIODO=''' + WFAPERIODO + ''' AND '
      + ' FAPROC=''P'' AND  DEPCOD=''' + dblcTipoD.Text + '''';

   DMAF.cdsFACTOR.Close;
   DMAF.cdsFACTOR.DataRequest(wSQL);
   DMAF.cdsFACTOR.Open;
   If StrToInt(copy(DMAF.cdsFactor.FieldbyName('FAPERIODO').AsString, 5, 2)) + 1 = 13 Then
   Begin
      wMesNew := '01';
      wAANew := IntToStr(StrToInt(copy(DMAF.cdsFactor.FieldbyName('FAPERIODO').AsString, 1, 4)) + 1);
   End
   Else
   Begin
      wMesNew := DMAF.StrZero(StrToInt(copy(DMAF.cdsFactor.FieldbyName('FAPERIODO').AsString, 5, 2)) + 1, 2);
      wAANew := copy(DMAF.cdsFactor.FieldbyName('FAPERIODO').AsString, 1, 4);
   End;
   /////////////////////////////////////////////////////////////////////////////
   Case StrToInt(wMesNew) Of
      1, 3, 5, 7,
         8, 10, 12:
         Begin
            wDiaNew := '31';
         End;
      4, 6, 9, 11:
         Begin
            wDiaNew := '30';
         End;
   Else
      Begin
         If (StrToInt(wAANew) Mod 4) = 0 Then
            wDiaNew := '29'
         Else
         Begin
            wDiaNew := '28';
         End;
      End;
   End;
   /////////////////////////////////////////////////////////////////////////////
   wFAPERIODONew := wAANew + wMesNew;
   wFAFECDEPRENew := wDiaNew + '/' + wMesNew + '/' + wAANew;

   wSql := 'INSERT INTO ACF102(DEPCOD,FAPROC,FAFECDEPRE,FAPERIODO,CIAID) '
      + 'VALUES('
      + quotedstr(DMAF.cdsFactor.FieldbyName('DEPCOD').AsString) + ','
      + quotedstr('X') + ','
      + quotedstr(wFAFECDEPRENew) + ','
      + quotedstr(wFAPERIODONew) + ','
      + quotedstr(DMAF.cdsFactor.FieldbyName('CIAID').AsString) + ')';
   DMAF.DCOM1.AppServer.EjecutaSQL(wSql);

   pbCierre.Position := pbCierre.Position + 1;

// 5. Actualiza la última Fecha de Depreciación y Periodo.
//    selecciona tipo de depreciacion especifico

   If StrToInt(copy(DMAF.cdsFactor.FieldbyName('FAPERIODO').AsString, 5, 2)) = 12 Then
   Begin
      wMesNew := '01';
      wAANew := IntToStr(StrToInt(copy(DMAF.cdsFactor.FieldbyName('FAPERIODO').AsString, 1, 4)) + 1);
   End
   Else
   Begin
      wMesNew := DMAF.StrZero(StrToInt(copy(DMAF.cdsFactor.FieldbyName('FAPERIODO').AsString, 5, 2)) + 1, 2);
      wAANew := copy(DMAF.cdsFactor.FieldbyName('FAPERIODO').AsString, 1, 4);
   End;
   /////////////////////////////////////////////////////////////////////////////
   Case StrToInt(wMesNew) Of
      1, 3, 5, 7,
         8, 10, 12:
         Begin
            wDiaNew := '31';
         End;
      4, 6, 9, 11:
         Begin
            wDiaNew := '30';
         End;
   Else
      Begin
         If (StrToInt(wAANew) Mod 4) = 0 Then
            wDiaNew := '29'
         Else
         Begin
            wDiaNew := '28';
         End;
      End;
   End;
   /////////////////////////////////////////////////////////////////////////////
   wFAFECDEPRECie := datetostr(strtodate('01/' + wMesNew + '/' + wAANew) - 1);

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      wSql := 'Update ACF104 SET FAFECDEPRE=(DATE(';
      wSql := wSql + '''' + FORMATDATETIME('YYYY-MM-DD', WFAFECDEPRE) + '''';
      wSql := wSql + ')), FAPERIODO=' + '''' + wFAPERIODO + '''';
      wSql := wSql + ' DEPFCIERRE=(TO_DATE(' + '''' + FORMATDATETIME(DMAF.wFormatFecha, wFAFECDEPRE) + '''';
      wSql := wSql + ')) WHERE CIAID=''' + dblcCia.Text + ''' and DEPCOD=' + '''' + dblcTipoD.Text + '''';
   End;

   If (SRV_D = 'ORACLE') Then
   Begin
      wSql := 'Update ACF104 SET '
         + ' FAFECDEPRE=TO_DATE(' + quotedstr(wFAFECDEPRECie) + ')'
         + ' ,FAPERIODO=' + quotedstr(wFAPERIODO)
         + ' ,DEPFCIERRE=TO_DATE(' + quotedstr(wFAFECDEPRECie) + ')'
         + ' WHERE CIAID=''' + dblcCia.Text + ''' and DEPCOD=' + '''' + dblcTipoD.Text + '''';
   End;

   DMAF.DCOM1.AppServer.EjecutaSQL(wSql);

   pbCierre.Position := pbCierre.Position + 1;

{   if (SRV_D = 'NT') Then
   begin
      xsql:=' UPDATE ACF204 SET DEPFLAGPRO=''X'' WHERE ACFID IN ( SELECT ACFID '
         +' FROM ACF204 GROUP BY CIAID,ACFID HAVING COUNT(ACFID)>=0 AND  COALESCE(MAX(FAREDONDEO),0)=0  )   ' ;
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Execute;

      DMAF.cdsQry.Close;
      xSQL:=' UPDATE ACF204 SET DEPFLAGPRO=''X'' WHERE CUENTAID IN (SELECT CUENTAID '
         + ' FROM ACF110 WHERE (FDEPREC=''N'' AND FAJUSTE=''S'')) AND FAPERIODO='''+wFaPeriodo+'''';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Execute;

   end;}
{
   If (SRV_D = 'DB2400') then
   Begin
      DMAF.cdsqry.close;
       XSQL:='SELECT CIAID,ACFID,CUENTAID,SUM(FAREDONDEO) FROM ACF204 WHERE    '
             +' SUBSTRING(CHAR(ACFFECADQ),1,4)||''''||SUBSTRING(CHAR(ACFFECADQ),6,2)='''+WFAPERIODO
             +''' GROUP BY CIAID,ACFID,CUENTAID '
             +' HAVING SUM(FAREDONDEO)=0 ';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(XSQL);
      DMAF.cdsQry.Open;

      xsql:='  SELECT CIAID,ACFID,CUENTAID FROM ACF204 ';
      DMAF.cdsQry2.Close;
      DMAF.cdsQry2.DataRequest(XSQL);
      DMAF.cdsQry2.Open;

      DMAF.cdsqry.IndexFieldNames:='CIAID;ACFID;CUENTAID';
      DMAF.cdsqry2.IndexFieldNames:='CIAID;ACFID;CUENTAID';

      DMAF.cdsQry.First;
      While not DMAF.cdsQry.eof do
      begin
          DMAF.cdsQry2.SetKey;
          DMAF.cdsQry2.FieldByname('CIAID').Asstring :=DMAF.cdsQry.FieldByname('CIAID').Asstring;
          DMAF.cdsQry2.FieldByname('ACFID').Asstring :=DMAF.cdsQry.FieldByname('ACFID').Asstring;
          DMAF.cdsQry2.FieldByname('CUENTAID').Asstring :=DMAF.cdsQry.FieldByname('CUENTAID').Asstring;

          if DMAF.cdsQry2.Gotokey then
          BEGIN
            WSQL:='UPDATE ACF204 SET DEPFLAGPRO=''X'' WHERE DEPFLAGPRO=''P'' AND ACFID='''+DMAF.cdsQry.FieldByname('ACFID').Asstring
                  + ''' AND CUENTAID='''+DMAF.cdsQry.FieldByname('CUENTAID').Asstring+'''';
          END;
             try
              DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
             except
             end;

          DMAF.cdsQry.Next;

      End;
      DMAF.cdsQry.Filtered:=False;
      DMAF.cdsQry.Filter  :='';
      DMAF.cdsQry.Close;

      DMAF.cdsQry2.Filtered:=False;
      DMAF.cdsQry2.Filter  :='';
      DMAF.cdsQry2.Close;

   End;

 if (SRV_D = 'ORACLE') then
   begin
      xsql:=' UPDATE ACF204 SET DEPFLAGPRO=''X'' WHERE ACFID IN ( SELECT ACFID '
         +' FROM ACF204 GROUP BY CIAID,ACFID HAVING COUNT(ACFID)>=0 AND  NVL(MAX(FAREDONDEO),0)=0  )   ' ;

     DMAF.cdsQry.Close;
     DMAF.cdsQry.DataRequest(xSQL);
     DMAF.cdsQry.Execute;
   end;
}

   ShowMessage('Cierre Ejecutado');
   wMensaje1.Visible := True;
   pbCierre.Position := 0;
// Inicio HPC_201401_ACF
   close;
// Fin HPC_201401_ACF

End;

Procedure TFCierraDepre.bbtnCancela4Click(Sender: TObject);
Begin
//   wMensaje3.Caption:='';
//   FormShow(self);
   Close;
End;

Procedure TFCierraDepre.dblcTipoDExit(Sender: TObject);
Var
   xWhere, xSQL: String;
Begin
   If dblcCia.Focused Then Exit;

   xWhere := 'CIAID=''' + dblcCia.Text + ''' and DEPCOD=''' + dblcTipoD.Text + '''';
//   dbeTipo.Text:=DMAF.DisplayDescrip('dspTGE','ACF104','DEPDESCRI',xWhere,'DEPDESCRI');
   dbeTipo.Text := DMAF.cdsUDep.FieldbyName('DEPDESCRI').Asstring;
   If dbeTipo.Text = '' Then
   Begin
      dblcTipoD.SetFocus;
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   End;

{   xSQL:='SELECT * FROM ACF104 '
         +'WHERE CIAID='''+dblcCia.Text+''' AND DEPFLAGACT=''A'''
         +' and DEPCOD='''+dblcTipoD.Text+''' ';
   DMAF.cdsUDEP.Close;
   DMAF.cdsUDEP.DataRequest(xSQL);
   DMAF.cdsUDEP.Open;
}
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
{     xSQL:='SELECT A.DEPCOD, MAX(A.FAPERIODO) FAPERIODO, MAX(B.FAFECDEPRE) FAFECDEPRE '
          +'FROM ACF204W A'
          +' Left Join ACF102 B ON ( A.CIAID=B.CIAID and A.FAPERIODO=B.FAPERIODO ) '
          +'WHERE A.CIAID='''+dblcCia.Text+''' and A.DEPCOD='''+dblcTipoD.Text+''' '
          +'GROUP BY A.DEPCOD';}
      xSQL := ' SELECT A.DEPCOD, MAX(A.FAPERIODO) FAPERIODO, MAX(A.DEPFECHA) FAFECDEPRE '
         + ' FROM ACF204W A'
         + ' WHERE A.CIAID=' + quotedstr(dblcCia.Text)
         + ' AND A.DEPCOD=' + quotedstr(dblcTipoD.Text)
         + ' AND A.DEPFECDEPR=' + quotedstr(DMAF.cdsUDep.FieldbyName('FECHACIERRE').AsString)
         + ' GROUP BY A.DEPCOD';
   End;

   If (SRV_D = 'ORACLE') Then
   Begin
{     xSQL:=' SELECT A.DEPCOD, MAX(A.FAPERIODO) FAPERIODO, MAX(B.FAFECDEPRE) FAFECDEPRE '
          +' FROM ACF204W A, ACF102 B'
          +' WHERE A.CIAID='''+dblcCia.Text+''' and A.CIAID=B.CIAID AND A.DEPCOD=B.DEPCOD '
          +' AND B.FAPROC=''X'' AND A.DEPFECDEPR=B.FAFECDEPRE AND A.DEPCOD='''+dblcTipoD.Text+''' '
          +' GROUP BY A.DEPCOD';}
      xSQL := ' SELECT A.DEPCOD, MAX(A.FAPERIODO) FAPERIODO, MAX(A.DEPFECHA) FAFECDEPRE '
         + ' FROM ACF204W A'
         + ' WHERE A.CIAID=' + quotedstr(dblcCia.Text)
         + ' AND A.DEPCOD=' + quotedstr(dblcTipoD.Text)
         + ' AND A.DEPFECDEPR=' + quotedstr(DMAF.cdsUDep.FieldbyName('FECHACIERRE').AsString)
         + ' GROUP BY A.DEPCOD';
   End;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;

   If DMAF.cdsQry.Recordcount = 0 Then
   Begin
      showmessage('Primero debe Depreciar');
      Exit;
   End;

   dbePeriodo.Text := DMAF.cdsQry.FieldByname('FAPERIODO').AsString;

End;

Procedure TFCierraDepre.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCierraDepre.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMAF.cdsQry.Filtered := False;
   DMAF.cdsQry.Filter := '';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.IndexFieldNames := '';

   DMAF.cdsQry2.Filtered := False;
   DMAF.cdsQry2.Filter := '';
   DMAF.cdsQry2.Close;
   DMAF.cdsQry2.IndexFieldNames := '';
End;

Procedure TFCierraDepre.dblcCiaExit(Sender: TObject);
Var
   xWhere, wSQL: String;
Begin
   xWhere := 'CIAID=''' + dblcCia.Text + '''';
   edtCiades.Text := DMAF.DisplayDescrip('dspTGE', 'TGE101', 'CIADES', xWhere, 'CIADES');

   If edtCiades.Text = '' Then
   Begin
      dblcCia.SetFocus;
      ShowMessage('Error : Falta Seleccionar Compañía');
      Exit;
   End;

// PRESENTA TIPOS DE DEPRECIACION ACTIVOS Y PDTES DE CIERRE.
//   wSQL:='SELECT * FROM ACF104 '
//        +'WHERE CIAID='''+dblcCia.Text+''' AND DEPFLAGACT=''A'' '
//        +  'AND DEPFCIERRE>FAFECDEPRE';
   wSQL := 'SELECT A.*, B.FAFECDEPRE FECHACIERRE, B.FAPERIODO PERIODOCIERRE FROM ACF104 A, ACF102 B '
      + 'WHERE A.CIAID=' + quotedstr(dblcCia.Text)
      + ' AND  A.DEPFLAGACT=' + quotedstr('A')
      + ' AND  A.CIAID=B.CIAID AND A.DEPCOD=B.DEPCOD AND B.FAPROC=' + quotedstr('X');
   DMAF.cdsUDep.Close;
   DMAF.cdsUDep.DataRequest(wSQL);
   DMAF.cdsUDep.Open;
   dblcTipoD.SetFocus;
{   if DMAF.cdsUDep.RecordCount=1 then
   begin
      dblcTipoD.Text:=DMAF.cdsUDep.FieldByName('DEPCOD').AsString;
      dblcTipoDExit(Sender);
   end;}
End;

Procedure TFCierraDepre.FormShow(Sender: TObject);
Begin
   dblcCia.SetFocus;
End;

End.

