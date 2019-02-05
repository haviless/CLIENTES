Unit ACF219;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, wwdblook, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
   Mask, wwdbedit, ComCtrls;

Type
   TFIniciaDepre = Class(TForm)
      Label2: TLabel;
      wMensaje1: TLabel;
      wMensaje2: TLabel;
      wMensaje3: TLabel;
      Label1: TLabel;
      wMensaje4: TLabel;
      Label74: TLabel;
      Label3: TLabel;
      bbtnOk1: TBitBtn;
      bbtnCancela4: TBitBtn;
      dblcdPeriodo: TwwDBLookupComboDlg;
      dblcTipoD: TwwDBLookupCombo;
      dbeTipo: TwwDBEdit;
      pbDep: TProgressBar;
      edtCiades: TEdit;
      dblcCia: TwwDBLookupCombo;
      Procedure bbtnOk1Click(Sender: TObject);
      Procedure bbtnCancela4Click(Sender: TObject);
      Procedure dblcTipoDExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblcdPeriodoExit(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;
Var
   wFecpro: TDate;
   WHReg: TTime;
   FIniciaDepre: TFIniciaDepre;
   wSql, wFaperiodo: String;
Implementation

Uses ACFDM;

{$R *.DFM}

Procedure TFIniciaDepre.bbtnOk1Click(Sender: TObject);
Var
   xCierre: String;
   XSQL: String;
   WFECDEPRE: TDATE;
Begin
   If dbeTipo.Text = '' Then
   Begin
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   End;

   If dblcdPeriodo.Text = '' Then
   Begin
      ShowMessage('Error : Falta Ingresar periodo');
      Exit;
   End;

   Try
       // Actualiza CIAID='01' , todo lo que es diferente de '01'
      xSQL := 'UPDATE ACF201 SET CIAID=' + quotedstr(DMAF.cdsCia.FieldbyName('CIAID').Asstring)
         + ' WHERE CIAID<>' + quotedstr(DMAF.cdsCia.FieldbyName('CIAID').Asstring);
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL);
      Screen.Cursor := CrHourGlass;
      DMAF.cdsQry.Execute;

       // ESTE PROCESO SE PUEDE EJECUTAR VARIAS VECES, CON EL PERIODO
       // EN CURSO, HASTA QUE ESTE SEA CERRADO, DESPUES NO
      xSQL := 'DELETE FROM ACF204 WHERE CIAID=' + quotedstr(DMAF.cdsCia.FieldbyName('CIAID').Asstring)
         + ' AND DEPCOD=' + quotedstr(DMAF.cdsUDep.FieldbyName('DEPCOD').Asstring)
         + ' AND DEPFLAGPRO=''X'''
         + ' and (DEPFECHA>' + quotedstr(DMAF.CDSUDEP.FieldByName('FAFECDEPRE').AsString)
         + ' AND  DEPFECHA<=' + quotedstr(DMAF.CDSFACTOR.FieldByName('FAFECDEPRE').AsString)
         + ')';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL);
      Screen.Cursor := CrHourGlass;
      DMAF.cdsQry.Execute;
       /////////////////////////////
      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      Begin
         xSQL := 'Insert into ACF204 ( CIAID, ACFID, TACFID, CUENTAID,LOCID, PISO,AREA,AMBCOD,UBICID '
            + 'ARTCODBAR,DEPVALHIST,DEPVALAJUS, DEPFLAGPRO, TACFDEPREC, DEPCOD, CCOSID, ACFVALOMN, '
            + 'ACFDES, ACFFECADQ, DEPFECHA, ACFREFOR, FAPERIODO, DEPNOMESES,DEPNETOAJU, VERI, ACFFINIDEP ) '
            + 'Select ' + quotedstr(DMAF.cdsCia.FieldbyName('CIAID').Asstring)
            + ', ACFID, ACF201.TACFID, ACF201.CUENTAID,ACF201.LOCID, ACF201.PISO,ACF201.AREA,ACF201.AMBCOD,ACF201.UBICID '
            + 'ACF201.ARTCODBAR,ACFVALOMN, ACFVALOMN, ''X'', ACF101.TACFDEPREC, ''01'', CCOSID, '
            + 'ACFVALOMN, ACFDES, ACFFECADQ, ACFFINIDEP, ACF201.ACFREFOR, '
            + 'SUBSTR( CHAR( ACFFINIDEP ),1,4)||SUBSTR( CHAR( ACFFINIDEP ), 6, 2 ), 1,ACFVALOMN, ACF201.VERI,ACF201.ACFFINIDEP '
            + 'From ACF201, ACF101, ACF110 '
            + 'Where ACF201.CIAID=ACF101.CIAID and ACF201.TACFID=ACF101.TACFID '
            + 'and ACF201.ACFVALOMN>0 AND ACFFLAGACT=''A'' '
            + ' AND ACF110.CUENTAID=ACF201.CUENTAID AND ACF110.FLGASTO=''N'' '
            + ' and (ACFFINIDEP>' + quotedstr(DMAF.CDSUDEP.FieldByName('FAFECDEPRE').AsString)
            + ' AND  ACFFINIDEP<=' + quotedstr(DMAF.CDSFACTOR.FieldByName('FAFECDEPRE').AsString)
            + ')';
      End;
      If (SRV_D = 'ORACLE') Then
      Begin
         xSQL := 'Insert into ACF204 ( CIAID	, ACFID, TACFID, CUENTAID, LOCID, PISO,AREA,AMBCOD,UBICID, '
            + 'ARTCODBAR,DEPVALHIST,DEPVALAJUS, DEPFLAGPRO, TACFDEPREC, DEPCOD, CCOSID, ACFVALOMN, '
            + 'ACFDES, ACFFECADQ, DEPFECHA, ACFREFOR, FAPERIODO, DEPNOMESES,DEPNETOAJU,VERI, ACFFINIDEP ) '
            + 'Select ' + quotedstr(DMAF.cdsCia.FieldbyName('CIAID').Asstring)
            + ', ACF201.ACFID,ACF201.TACFID, ACF201.CUENTAID,ACF201.LOCID, ACF201.PISO,ACF201.AREA,ACF201.AMBCOD,ACF201.UBICID, '
            + 'ACF201.ARTCODBAR,ACFVALOMN, ACFVALOMN, ''X'', '
            + 'CASE WHEN ACF201.TACFDEPREC IS NULL '
            + 'THEN ACF101.TACFDEPREC '
            + 'ELSE ACF201.TACFDEPREC END, '
            + ' ''01'', CCOSID, ACFVALOMN, '
            + 'SUBSTR(ACFDES,1,40), ACFFECADQ, ACFFINIDEP, ACF201.ACFREFOR, '
            + 'TO_CHAR( ACFFINIDEP,''YYYYMM''),1,ACFVALOMN, ACF201.VERI, ACFFINIDEP '
            + 'From ACF201, ACF101, ACF110 '
            + 'Where ACF201.CIAID=ACF101.CIAID and ACF201.TACFID=ACF101.TACFID '
            + 'and ACF201.ACFVALOMN>0 AND ACFFLAGACT=''A'' '
            + ' AND ACF110.CUENTAID=ACF201.CUENTAID AND ACF110.FLGASTO=''N'' '
//             +' and (ACFFECADQ>'+quotedstr(DMAF.CDSUDEP.FieldByName('FAFECDEPRE').AsString)
//             +' AND  ACFFECADQ<='+quotedstr(DMAF.CDSFACTOR.FieldByName('FAFECDEPRE').AsString)
         + ' and (ACFFINIDEP>' + quotedstr(DMAF.CDSUDEP.FieldByName('FAFECDEPRE').AsString)
            + ' AND  ACFFINIDEP<=' + quotedstr(DMAF.CDSFACTOR.FieldByName('FAFECDEPRE').AsString)
            + ') and VERI IN(''S'') ';
      End;
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Execute;
      Screen.Cursor := CrDefault;
       // SE ANULA
{       if  (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
              xSQL:='Update ACF102 set FAPROC=''X'', FLCONTA='''', FLREI='''', FLANUAL='''' '
             +'WHERE CIAID='+quotedstr(DMAF.cdsCia.FieldbyName('CIAID').Asstring);              ;
       if (SRV_D = 'ORACLE') then
              xSQL:='Update ACF102 set FAPROC=''X'', FLCONTA=NULL, FLREI=NULL, FLANUAL=NULL '
             +'WHERE CIAID='+quotedstr(DMAF.cdsCia.FieldbyName('CIAID').Asstring);
        DMAF.cdsQry.Close;
        DMAF.cdsQry.DataRequest( xSQL );
        DMAF.cdsQry.Execute;
       if  (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
          xSQL:='Update ACF104 set FAPERIODO='''', FAFECDEPRE=''01/01/1900'' '
             +'WHERE CIAID='+quotedstr(DMAF.cdsCia.FieldbyName('CIAID').Asstring);
       if (SRV_D = 'ORACLE') then
          xSQL:='Update ACF104 set FAPERIODO=''199901'', FAFECDEPRE=''01/01/1900'' '
             +'WHERE CIAID='+quotedstr(DMAF.cdsCia.FieldbyName('CIAID').Asstring);

        DMAF.cdsQry.Close;
        DMAF.cdsQry.DataRequest( xSQL );
        DMAF.cdsQry.Execute;}
      ShowMessage('Proceso Terminado');
//     end;}
   Finally
      Screen.Cursor := CrDefault;
   End;
End;

Procedure TFIniciaDepre.bbtnCancela4Click(Sender: TObject);
Begin
   Close;
End;

Procedure TFIniciaDepre.dblcTipoDExit(Sender: TObject);
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

Procedure TFIniciaDepre.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFIniciaDepre.FormClose(Sender: TObject;
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

Procedure TFIniciaDepre.dblcCiaExit(Sender: TObject);
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

Procedure TFIniciaDepre.FormShow(Sender: TObject);
Begin
   dblcCia.SetFocus;
End;

Procedure TFIniciaDepre.dblcdPeriodoExit(Sender: TObject);
Begin
   If DMAF.cdsFactor.FieldByName('FAPERIODO').AsString <> dblcdPeriodo.Text Then
   Begin
      ShowMessage('Error : Periodo no Existe');
      dblcdPeriodo.SetFocus;
      Exit;
   End;
End;

End.

