Unit ACF265;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   wwdblook, Wwdbdlg, DBCtrls, StdCtrls, Mask, wwdbedit, Buttons, ExtCtrls;

Type
   TFInvActualiza = Class(TForm)
      Panel1: TPanel;
      Panel2: TPanel;
      wwDBEdit1: TwwDBEdit;
      wwDBEdit2: TwwDBEdit;
      dbeTAcF: TwwDBEdit;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      gbCambio: TGroupBox;
      dblcdCCosNew: TwwDBLookupComboDlg;
      dbeCCosNDes: TDBEdit;
      dblcLocNew: TwwDBLookupCombo;
      dbeLocNDes: TDBEdit;
      dbeUbicNDes: TDBEdit;
      Z2bbtnCambioOk: TBitBtn;
      gbDatos: TGroupBox;
      dbeCCosto: TwwDBEdit;
      dbeCCosDes: TDBEdit;
      dbeLoc: TwwDBEdit;
      dbeLocDes: TDBEdit;
      dbeUbic: TwwDBEdit;
      dbeUbicDes: TDBEdit;
      Z2bbtnOk: TBitBtn;
      Z2bbtnCambio: TBitBtn;
      Z2bbtnNoOk: TBitBtn;
      dbeTACFDes: TwwDBEdit;
      Z2bbtnCambioCa: TBitBtn;
      Panel3: TPanel;
      Z2bbtnSigue: TBitBtn;
      dbeEstado: TwwDBEdit;
      Label1: TLabel;
      Panel4: TPanel;
      Label9: TLabel;
      wwDBEdit4: TwwDBEdit;
      wwDBEdit5: TwwDBEdit;
      Label10: TLabel;
      Label11: TLabel;
      wwDBEdit6: TwwDBEdit;
      Z2bbtnAnte: TBitBtn;
      dblcUbicNew: TwwDBLookupComboDlg;
      Label2: TLabel;
      Label12: TLabel;
      Label13: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Procedure Z2bbtnOkClick(Sender: TObject);
      Procedure Z2bbtnCambioOkClick(Sender: TObject);
      Procedure Z2bbtnNoOkClick(Sender: TObject);
      Procedure Z2bbtnCambioClick(Sender: TObject);
      Procedure dblcdCCosNewExit(Sender: TObject);
      Procedure dblcLocNewExit(Sender: TObject);
      Procedure dbeTAcFExit(Sender: TObject);
      Procedure Z2bbtnCambioCaClick(Sender: TObject);
      Procedure Z2bbtnSigueClick(Sender: TObject);
      Procedure Z2bbtnAnteClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcUbicNewExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
      Procedure MuestraDescripcion;
      Procedure GrabaDetalle;
   Public
    { Public declarations }
   End;

Var
   FInvActualiza: TFInvActualiza;

Implementation

Uses ACFDM;

{$R *.DFM}

Procedure TFInvActualiza.Z2bbtnOkClick(Sender: TObject);
Begin
   DMAF.cdsInvD.Edit;
   DMAF.cdsInvD.FieldByname('NewCCos').AsString := '';
   DMAF.cdsInvD.FieldByname('NewLoc').AsString := '';
   DMAF.cdsInvD.FieldByname('NewUbic').AsString := '';
   DMAF.cdsInvD.FieldByname('FlagOk').AsString := 'S'; // Ok.
   cdsPost(DMAF.cdsInvD);

   GrabaDetalle;
End;

Procedure TFInvActualiza.Z2bbtnCambioOkClick(Sender: TObject);
Begin
   If (Length(dbeCCosNDes.Text) > 0) Or (Length(dbeLocNDes.Text) > 0) Or
      (Length(dbeUbicNDes.Text) > 0) Then
   Begin
      If MessageDlg('¿ Esta Seguro de Cambios ? ',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMAF.cdsInvD.Edit;
         DMAF.cdsInvD.FieldByname('FlagOk').AsString := 'C'; // Cambios
         gbCambio.Enabled := False;
         gbDatos.Enabled := True;
         GrabaDetalle;
      End;
   End
   Else
   Begin
      dblcdCCosNew.SetFocus;
      Raise Exception.Create('Error No se han Registrado Cambios');
   End;
End;

Procedure TFInvActualiza.GrabaDetalle;
Begin
   If DMAF.cdsInvC.FieldByname('InvEstado').AsString <> 'Editado' Then
   Begin
      DMAF.cdsInvC.Edit;
      DMAF.cdsInvC.FieldByname('InvEstado').AsString := 'Editado';
      cdsPost(DMAF.cdsInvC);
      DMAF.ControlTran;
   End;

   DMAF.cdsInvD.Edit;
   DMAF.cdsInvD.FieldByname('FReg').Value := Date;
   DMAF.cdsInvD.FieldByname('HReg').Value := Time;
   DMAF.cdsInvD.FieldByname('Usuario').Value := DMAF.wUsuario;
   cdsPost(DMAF.cdsInvD);
   DMAF.ControlTran;

   DMAF.cdsInvD.Next;
   If DMAF.cdsInvD.Eof Then Close;
   MuestraDescripcion;
End;

Procedure TFInvActualiza.Z2bbtnNoOkClick(Sender: TObject);
Begin
   DMAF.cdsInvD.Edit;
   DMAF.cdsInvD.FieldByname('FlagOk').AsString := 'N'; // Cambios
   DMAF.cdsInvD.FieldByname('NewCCos').AsString := '';
   DMAF.cdsInvD.FieldByname('NewLoc').AsString := '';
   DMAF.cdsInvD.FieldByname('NewUbic').AsString := '';
   cdsPost(DMAF.cdsInvD);

   GrabaDetalle;
End;

Procedure TFInvActualiza.Z2bbtnCambioClick(Sender: TObject);
Begin
   gbDatos.Enabled := False;
   gbCambio.Enabled := True;
   dblcdCCosNew.SetFocus;
End;

Procedure TFInvActualiza.dblcdCCosNewExit(Sender: TObject);
Var
   xCondicion: String;
Begin
   xCondicion := 'CCOSID=' + '''' + dblcdCCosNew.Text + '''';
   dbeCCosNDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE203', '*', xCondicion, 'CCOSDES');
   If Length(dblcdCCosNew.Text) > 0 Then
   Begin
      If Length(dbeCCosNDes.Text) = 0 Then
      Begin
         dblcdCCosNew.SetFocus;
         Raise Exception.Create('Error en Centro de Costo');
      End;
   End;
End;

Procedure TFInvActualiza.dblcLocNewExit(Sender: TObject);
Var
   xCondicion: String;
Begin
   xCondicion := 'LocId=' + '''' + dblcLocNew.Text + '''';
   dbeLocNDes.Text := BuscaDescripcion(DMAF.cdsLocalidad, xCondicion, 'LocAbr');
   If Length(dblcLocNew.Text) > 0 Then
   Begin
      If Length(dbeLocNDes.Text) = 0 Then
      Begin
         dblcLocNew.SetFocus;
         Raise Exception.Create('Error en Localidad');
      End;
   End;
End;

Procedure TFInvActualiza.dbeTAcFExit(Sender: TObject);
Var
   xCondicion: String;
Begin
   xCondicion := 'CIAID=''' + DMAF.cdsInvD.FieldByname('CiaId').AsString + ''' and '
      + 'TAcFId=''' + dbeTAcF.Text + '''';
   dbeTACFDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF101', '*', xCondicion, 'TACFDES');
End;

Procedure TFInvActualiza.MuestraDescripcion;
Var
   xCondicion: String;
Begin
   xCondicion := xCondicion + 'TAcFId=' + '''' + DMAF.cdsInvD.FieldByname('TAcFId').AsString + '''';
   dbeTAcFDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF101', '*', xCondicion, 'TAcFDes');

// Actual
   xCondicion := 'CCOSID=' + '''' + dbeCCosto.Text + '''';
   dbeCCosDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE203', '*', xCondicion, 'CCOSDES');

   xCondicion := 'UbicId=' + '''' + dbeUbic.Text + '''';
   dbeUbicDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE117', '*', xCondicion, 'UBICDES');

   xCondicion := 'LocId=' + '''' + dbeLoc.Text + '''';
   dbeLocDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE126', '*', xCondicion, 'LOCDES');

// Nuevos
   xCondicion := 'CCOSID=' + '''' + dblcdCCosNew.Text + '''';
   dbeCCosNDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE203', '*', xCondicion, 'CCOSDES');

   xCondicion := 'UbicId=' + '''' + dblcUbicNew.Text + '''';
   dbeUbicNDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE117', '*', xCondicion, 'UBICDES');

   xCondicion := 'LocId=' + '''' + dblcLocNew.Text + '''';
   dbeLocNDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE126', '*', xCondicion, 'LOCDES');

   If DMAF.cdsInvD.FieldByname('FlagOk').AsString = 'S' Then dbeEstado.text := 'Confirmado';
   If DMAF.cdsInvD.FieldByname('FlagOk').AsString = 'C' Then dbeEstado.text := 'Con Cambios';
   If DMAF.cdsInvD.FieldByname('FlagOk').AsString = 'N' Then dbeEstado.text := 'No Existe';
   If DMAF.cdsInvD.FieldByname('FlagOk').AsString = '' Then dbeEstado.text := '';
End;

Procedure TFInvActualiza.Z2bbtnCambioCaClick(Sender: TObject);
Begin
   gbCambio.Enabled := False;
   gbDatos.Enabled := True;
   Z2bbtnOk.SetFocus;
End;

Procedure TFInvActualiza.Z2bbtnSigueClick(Sender: TObject);
Begin
   DMAF.cdsInvD.Next;
   If DMAF.cdsInvD.Eof Then
   Begin
      ShowMessage('Es el Ultimo Registro');
      Close;
   End;
   MuestraDescripcion;
End;

Procedure TFInvActualiza.Z2bbtnAnteClick(Sender: TObject);
Begin
   DMAF.cdsInvD.Prior;
   If DMAF.cdsInvD.BOF Then
      ShowMessage('Es el Primer Registro');
   MuestraDescripcion;
End;

Procedure TFInvActualiza.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;

End;

Procedure TFInvActualiza.dblcUbicNewExit(Sender: TObject);
Var
   xCondicion: String;
Begin
   xCondicion := 'UbicId=' + '''' + dblcUbicNew.Text + '''';
   dbeUbicNDes.Text := BuscaDescripcion(DMAF.cdsUbica, xCondicion, 'UbicDes');
   If Length(dblcUbicNew.Text) > 0 Then
   Begin
      If Length(dbeUbicNDes.Text) = 0 Then
      Begin
         dblcUbicNew.SetFocus;
         Raise Exception.Create('Error en Ubicación');
      End;
   End;
End;

Procedure TFInvActualiza.FormShow(Sender: TObject);
Begin
   DMAF.cdsInvD.First;
   MuestraDescripcion;
   Z2bbtnOk.SetFocus;
End;

End.

