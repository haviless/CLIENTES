Unit ACF250;
// HPC_201401_ACF    Se ha adicionado las sentencias de Insertar y Actualizar en forma nativa los tipos de Activos al momento de grabar.
//                   Se ha adicionado en el evento exit del control dblcdCuentaDep (Cuenta de Depreciación) para que pueda salir la descripción de dicha cuenta.

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Wwdbspin, StdCtrls, Buttons, Wwdbdlg, wwdblook, Mask, wwdbedit, ExtCtrls;

Type
   TFTActivo = Class(TForm)
      pnlPrincipal: TPanel;
      pnlDetalle: TPanel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label11: TLabel;
      dbeDescripcion: TwwDBEdit;
      dbeAbrev: TwwDBEdit;
      dbeTActivo: TwwDBEdit;
      dbeCuenta: TwwDBEdit;
      dblcdCuenta: TwwDBLookupComboDlg;
      Z2bbtnRegistra: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Label5: TLabel;
      seVida: TwwDBSpinEdit;
      dbeDepre: TwwDBEdit;
      Label6: TLabel;
      Label1: TLabel;
      dblcCia: TwwDBLookupCombo;
      dbeCia: TwwDBEdit;
      Bevel1: TBevel;
      Bevel2: TBevel;
      Label8: TLabel;
      Label7: TLabel;
      dblcdCuentaDep: TwwDBLookupComboDlg;
      dbeCuentaDep: TwwDBEdit;
      Procedure dbeTActivoExit(Sender: TObject);
      Procedure Z2bbtnRegistraClick(Sender: TObject);
      Procedure dblcdCuentaExit(Sender: TObject);
      Procedure dbeDepreExit(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
      Procedure dblcdCuentaDepExit(Sender: TObject);
   Private
    { Private declarations }
      xCrea: Boolean;
   Public
    { Public declarations }
   End;

Var
   FTActivo: TFTActivo;

Implementation

//USES ACFDM, ACF001;
Uses ACFDM, oaAF2000;

{$R *.DFM}

Procedure TFTActivo.dbeTActivoExit(Sender: TObject);
Var
   xSQL: String;
   xNivel1: String;
   xNivel: Integer;
   xTActivo: String;
Begin
   If xCrea Then exit;
   If Z2bbtnRegistra.Focused Then Exit;
   If Z2bbtnCanc2.Focused Then Exit;
   If dblcCia.Focused Then Exit;
   If DMAF.wModo = 'M' Then Exit;

   xSQL := 'Select * From ACF101 Where CIAID=''' + dblcCia.Text + ''' and '
      + 'TACFID=''' + dbeTActivo.Text + '''';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName := 'dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.RecordCount > 0 Then
   Begin
      ShowMessage('Tipo de Activo Fijo Ya Existe');
      dbeTActivo.SetFocus;
      exit;
   End;
   //
   xNivel1 := '';
   DMAF.cdsNivel.First;
   While Not DMAF.cdsNivel.Eof Do
   Begin
      If Trim(DMAF.cdsNivel.FieldByName('Signo').AsString) = '=' Then
      Begin
         If length(dbeTActivo.Text) = DMAF.cdsNivel.FieldByName('DIGITOS').AsInteger Then
         Begin
            xNivel1 := DMAF.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         End
      End;
      If DMAF.cdsNivel.FieldByName('Signo').AsString = '<=' Then
      Begin
         If length(dbeTActivo.Text) <= DMAF.cdsNivel.FieldByName('DIGITOS').AsInteger Then
         Begin
            xNivel1 := DMAF.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         End
      End;
      If DMAF.cdsNivel.FieldByName('Signo').AsString = '>=' Then
      Begin
         If length(dbeTActivo.Text) >= DMAF.cdsNivel.FieldByName('DIGITOS').AsInteger Then
         Begin
            xNivel1 := DMAF.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         End
      End;
      DMAF.cdsNivel.Next;
   End;

   If Length(xNivel1) = 0 Then
   Begin
      dbeTActivo.SetFocus;
      Raise Exception.Create('Longitud de Tipo Activo NO Existe en Tabla Nivel');
   End;

   DMAF.cdsNivel.First;
   While (Not DMAF.cdsNivel.Eof) And (DMAF.cdsNivel.FieldByName('NIVEL').Text < xNivel1) Do
   Begin
      xNivel := DMAF.cdsNivel.FieldByName('DIGITOS').AsInteger;
      xTActivo := copy(dbeTActivo.Text, 1, xNivel);

      xSQL := 'select * From ACF101 Where TACFID=''' + xTActivo + '''';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Open;
      If DMAF.cdsQry.RecordCount = 0 Then
      Begin
         dbeTActivo.SetFocus;
         ShowMessage('T.Activo ' + xTActivo + ' No Tiene Registrado a ' + IntToStr(xNivel) + ' Digitos');
         exit;
      End;
      DMAF.cdsNivel.Next;
   End;
End;

Procedure TFTActivo.Z2bbtnRegistraClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If length(dbeCia.Text) = 0 Then
   Begin
      dblcCia.SetFocus;
      Raise Exception.Create('Falta Código de Compañía');
   End;
   If Length(dbeTActivo.Text) = 0 Then
   Begin
      dbeTActivo.setFocus;
      Raise Exception.Create('Falta Tipo de Activo Fijo');
   End;
   If Length(dbeDescripcion.Text) = 0 Then
   Begin
      dbeDescripcion.setFocus;
      Raise Exception.Create('Falta Decripción');
   End;
   If Length(dbeAbrev.Text) = 0 Then
   Begin
      dbeAbrev.setFocus;
      Raise Exception.Create('Falta Abreviatura');
   End;
   If Length(dbeCuenta.Text) = 0 Then
   Begin
      dblcdCuenta.setFocus;
      Raise Exception.Create('Falta Cuenta Contable');
   End;
   If seVida.Value <= 0 Then
   Begin
      seVida.setFocus;
      Raise Exception.Create('Error en Vida Util. Debe ser Mayor a Cero');
   End;
   If DMAF.cdsTipAct.FieldByName('TACFDEPREC').Value <= 0 Then
   Begin
      dbeDepre.setFocus;
      Raise Exception.Create('Error en Depreciación. Debe Ser Mayor a Cero');
   End;

// Inicio HPC_201401_ACF
   If DMAF.wModo = 'A' Then
   Begin
      xSQL := 'Select * From ACF101 Where CIAID=''' + dblcCia.Text + ''' and '
         + 'TACFID=''' + dbeTActivo.Text + '''';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.ProviderName := 'dspTGE';
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Open;
      If DMAF.cdsQry.RecordCount > 0 Then
      Begin
         ShowMessage('Tipo de Activo Fijo Ya Existe');
         dbeTActivo.SetFocus;
         exit;
      End;

      xSQL := ' Insert Into ACF101 (TACFDES,TACFABR,CUENTAID,TACFID,TACFVIDA,TACFDEPREC,CIAID,CTADEP,CTADEPACU,TACFDEP,FDEPINV)'
         + ' Values (' + QuotedStr(DMAF.cdsTipAct.FieldByName('TACFDES').AsString) + ','
         + ' ' + QuotedStr(DMAF.cdsTipAct.FieldByName('TACFABR').AsString) + ','
         + ' ' + QuotedStr(DMAF.cdsTipAct.FieldByName('CUENTAID').AsString) + ','
         + ' ' + QuotedStr(DMAF.cdsTipAct.FieldByName('TACFID').AsString) + ','
         + ' ''' + floattostr(DMAF.cdsTipAct.FieldByName('TACFVIDA').AsFloat) + ''','
         + ' ''' + floattostr(DMAF.cdsTipAct.FieldByName('TACFDEPREC').AsFloat) + ''','
         + ' ' + QuotedStr(DMAF.cdsTipAct.FieldByName('CIAID').AsString) + ','
         + ' ' + QuotedStr(DMAF.cdsTipAct.FieldByName('CTADEP').AsString) + ', '''','''','''' ';

      Try
         DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se puede grabar el tipo de activo fijo');
         exit;
      End;

   End
   Else
   Begin

      xSQL := ' Update ACF101 SET '
         + ' TACFDES =' + QuotedStr(DMAF.cdsTipAct.FieldByName('TACFDES').AsString) + ','
         + ' TACFABR =' + QuotedStr(DMAF.cdsTipAct.FieldByName('TACFABR').AsString) + ','
         + ' TACFVIDA =''' + floattostr(DMAF.cdsTipAct.FieldByName('TACFVIDA').AsFloat) + ''','
         + ' TACFDEPREC =''' + floattostr(DMAF.cdsTipAct.FieldByName('TACFDEPREC').AsFloat) + ''','
         + ' CUENTAID =' + QuotedStr(DMAF.cdsTipAct.FieldByName('CUENTAID').AsString) + ','
         + ' CTADEP =' + QuotedStr(DMAF.cdsTipAct.FieldByName('CTADEP').AsString) + ''
         + ' Where CIAID=''' + dblcCia.Text + ''' '
         + ' and TACFID=''' + dbeTActivo.Text + ''' ';
      Try
         DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar el tipo de activo fijo');
         exit;
      End;
   End;

//   cdsPost( DMAF.cdsTipAct );

   //DMAF.ControlTran;
// Fin HPC_201401_ACF
   If DMAF.wTipoAdicion = 'xFiltro' Then
   Begin
//      DMAF.ActualizaFiltro(Mant3,DMAF.cdsTipAct,DMAF.wModo);
   End;

   ShowMessage('Grabado');

   If DMAF.wModo = 'A' Then
   Begin
      dbeCia.Text := '';
      dbeCuenta.Text := '';
      DMAF.cdsTipAct.Insert;
      dblcCia.Enabled := True;
      dbeTActivo.Enabled := True;
      dblcCia.SetFocus;
   End;

End;

Procedure TFTActivo.dblcdCuentaExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If xCrea Then exit;
//   if Z2bbtnRegistra.Focused then Exit;
   If Z2bbtnCanc2.Focused Then Exit;

   xSQL := 'CUENTAID=''' + dblcdCuenta.Text + '''';
   dbeCuenta.Text := DMAF.DisplayDescrip('dspTGE', 'TGE202', '*', xSQL, 'CTADES');
   If Length(dbeCuenta.Text) = 0 Then
   Begin
      dblcdCuenta.setFocus;
      ShowMessage('Falta Cuenta Contable');
   End;
End;

Procedure TFTActivo.dbeDepreExit(Sender: TObject);
Begin
   If xCrea Then exit;
   If Z2bbtnRegistra.Focused Then Exit;
   If Z2bbtnCanc2.Focused Then Exit;

   If DMAF.cdsTipAct.FieldByName('TACFDEPREC').Value <= 0 Then
   Begin
      dbeDepre.setFocus;
      ShowMessage('Error en Depreciación');
   End;
End;

Procedure TFTActivo.Z2bbtnCanc2Click(Sender: TObject);
Begin
   Close;
End;

Procedure TFTActivo.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   xCrea := true;

   If DMAF.wModo = 'A' Then
      DMAF.cdsTipAct.Delete;

   DMAF.cdsTipAct.CancelUpdates;
End;

Procedure TFTActivo.dblcCiaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then exit;

   xWhere := 'CIAID=''' + dblcCia.Text + '''';
   dbeCia.Text := DMAF.DisplayDescrip('dspTGE', 'TGE101', '*', xWhere, 'CIADES');

   If length(dbeCia.Text) = 0 Then
   Begin
      ShowMessage('Falta Código de Compañía');
      dblcCia.SetFocus;
      Exit;
   End;
   dbeTActivo.SetFocus;
End;

Procedure TFTActivo.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;

End;

Procedure TFTActivo.FormShow(Sender: TObject);
Var
   xWhere: String;
Begin
   xCrea := True;

   If DMAF.wModo = 'A' Then
   Begin
      dbeCuenta.Text := '';
//    Inicio HPC_201401_ACF
      dbeCuentadep.Text := '';
//    Fin HPC_201401_ACF
      dbeCia.Text := '';
      DMAF.cdsTipAct.Insert;
      dblcCia.Enabled := True;
      dbeTActivo.Enabled := True;
      dblcCia.SetFocus;
   End
   Else
   Begin
      xWhere := 'CIAID=''' + dblcCia.Text + '''';
      dbeCia.Text := DMAF.DisplayDescrip('dspTGE', 'TGE101', '*', xWhere, 'CIADES');
      xWhere := 'CIAID=''02'' AND CUENTAID=''' + dblcdCuenta.Text + '''';
      dbeCuenta.Text := DMAF.DisplayDescrip('dspTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
//    Inicio HPC_201401_ACF
      xWhere := 'CIAID=''02'' AND CUENTAID=''' + dblcdCuentadep.Text + '''';
      dbeCuentadep.Text := DMAF.DisplayDescrip('dspTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
//    Fin HPC_201401_ACF
      DMAF.cdsTipAct.Edit;
      dblcCia.Enabled := False;
      dbeTActivo.Enabled := False;
      dbeDescripcion.SetFocus;
   End;

   xCrea := False;
End;

Procedure TFTActivo.dblcdCuentaDepExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If xCrea Then exit;
//   if Z2bbtnRegistra.Focused then Exit;
   If Z2bbtnCanc2.Focused Then Exit;
// Inicio HPC_201401_ACF
   xSQL := 'CUENTAID=''' + dblcdCuentaDep.Text + '''';
   dbeCuentaDep.Text := DMAF.DisplayDescrip('dspTGE', 'TGE202', '*', xSQL, 'CTADES');
   If Length(dbeCuentaDep.Text) = 0 Then
   Begin
      ShowMessage('Falta Cuenta Contable');
   End;
// Fin HPC_201401_ACF

End;

End.

