Unit ACF234;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Mask, wwdbedit, wwdblook, Buttons;

Type
   TFActCenCos = Class(TForm)
      wMensaje3: TLabel;
      wMensaje2: TLabel;
      Label2: TLabel;
      Label74: TLabel;
      Label3: TLabel;
      Label1: TLabel;
      bbtnOk1: TBitBtn;
      bbtnCancela4: TBitBtn;
      dblcTipoD: TwwDBLookupCombo;
      dbeTipo: TwwDBEdit;
      dblcCia: TwwDBLookupCombo;
      edtCiades: TEdit;
      dbePeriodo: TwwDBEdit;
      Procedure FormShow(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcTipoDExit(Sender: TObject);
      Procedure bbtnOk1Click(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FActCenCos: TFActCenCos;

Implementation

{$R *.dfm}

Uses ACFDM;

Procedure TFActCenCos.FormShow(Sender: TObject);
Begin
   dblcCia.SetFocus;
End;

Procedure TFActCenCos.dblcCiaExit(Sender: TObject);
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
   wSQL := 'SELECT A.*, B.FAFECDEPRE FECHACIERRE, B.FAPERIODO PERIODOCIERRE FROM ACF104 A, ACF102 B '
      + 'WHERE A.CIAID=' + quotedstr(dblcCia.Text)
      + ' AND  A.DEPFLAGACT=' + quotedstr('A')
      + ' AND  A.CIAID=B.CIAID AND A.DEPCOD=B.DEPCOD AND B.FAPROC=' + quotedstr('X');
   DMAF.cdsUDep.Close;
   DMAF.cdsUDep.DataRequest(wSQL);
   DMAF.cdsUDep.Open;
   dblcTipoD.SetFocus;
End;

Procedure TFActCenCos.dblcTipoDExit(Sender: TObject);
Var
   xWhere, xSQL: String;
Begin
   If dblcCia.Focused Then Exit;

   xWhere := 'CIAID=''' + dblcCia.Text + ''' and DEPCOD=''' + dblcTipoD.Text + '''';
   dbeTipo.Text := DMAF.cdsUDep.FieldbyName('DEPDESCRI').Asstring;
   If dbeTipo.Text = '' Then
   Begin
      dblcTipoD.SetFocus;
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   End;

   xSQL := 'SELECT * FROM ACF104 WHERE CIAID=''01''';
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

Procedure TFActCenCos.bbtnOk1Click(Sender: TObject);
Var
   wSQL: String;
Begin
   If MessageDlg('Actualizar los Centros de Costo ¿ Esta Seguro ? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   wSQL := 'UPDATE CNT311 SET CCOSID=''0301'', CCOSDES=''GERENCIA ADMIN'' WHERE CIAID=''02'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''1101'', CCOSDES=''BAZAR''           WHERE CIAID=''04'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''0801'', CCOSDES=''CENTRO CULTURAL'' WHERE CIAID=''05'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''0900'', CCOSDES=''DEMATOURS''       WHERE CIAID=''06'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''2801'', CCOSDES=''CR HUAYCHULO CO'' WHERE CIAID=''07'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''1001'', CCOSDES=''DEMACER COSTO C'' WHERE CIAID=''08'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''3001'', CCOSDES=''H TACNA COSTO H'' WHERE CIAID=''09'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''3101'', CCOSDES=''H MOQUEGUA COST'' WHERE CIAID=''10'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''3201'', CCOSDES=''H AYACUCHO COST'' WHERE CIAID=''11'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''3301'', CCOSDES=''H NASCA COSTO C'' WHERE CIAID=''12'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''3401'', CCOSDES=''H MOSSONE COSTO'' WHERE CIAID=''13'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''4201'', CCOSDES=''CR AREQUIPA COS'' WHERE CIAID=''14'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''4801'', CCOSDES=''LOCAL ZORRITOS''  WHERE CIAID=''15'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''5101'', CCOSDES=''SARAPAMPA COSTO'' WHERE CIAID=''16'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;
   wSQL := 'UPDATE CNT311 SET CCOSID=''5201'', CCOSDES=''HOTEL C.R.CUZCO'' WHERE CIAID=''17'' AND CNTANOMM=''' + dbePeriodo.Text + ''' AND TDIARID=''20'' AND CCOSID IS NOT NULL';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(wSql);
   Except
   End;

   ShowMessage('Centros de Costo Actualizados');

End;

End.

