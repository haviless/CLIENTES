Unit ACF260;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, DBCtrls, wwdbdatetimepicker, Mask, wwdbedit, wwdblook, ExtCtrls,
   Buttons;

Type
   TFManteInv = Class(TForm)
      pnlCab1: TPanel;
      dblcCia: TwwDBLookupCombo;
      dbeNumero: TwwDBEdit;
      dbeCiaDes: TwwDBEdit;
      pnlCab2: TPanel;
      dtpFecha: TwwDBDateTimePicker;
      dtpFecIni: TwwDBDateTimePicker;
      dtpFecFin: TwwDBDateTimePicker;
      pnlCab3: TPanel;
      dbeRespo: TwwDBEdit;
      dbmObser: TDBMemo;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Z2bbtnGraba: TBitBtn;
      bbtnClose: TBitBtn;
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure dbeNumeroExit(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnCloseClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
      xInicio: Boolean;
   Public
    { Public declarations }
   End;

Var
   FManteInv: TFManteInv;

Implementation

Uses ACFDM, oaAF5000;

{$R *.DFM}

Procedure TFManteInv.Z2bbtnGrabaClick(Sender: TObject);
Begin
   DMAF.cdsInvC.Edit;
   DMAF.cdsInvC.FieldByname('InvEstado').AsString := 'Inicial';
   DMAF.cdsInvC.FieldByname('Usuario').Value := DMAF.wUsuario;
   DMAF.cdsInvC.FieldByname('FReg').Value := Date;
   DMAF.cdsInvC.FieldByname('HReg').Value := Time;
   cdsPost(DMAF.cdsInvC);

   DMAF.ControlTran; // graba regs.original/y duplicados si los hay
End;

Procedure TFManteInv.dbeNumeroExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If xInicio Then Exit;
   If bbtnClose.Focused Then Exit;

   If Length(dbeNumero.text) = 0 Then
      Raise Exception.Create('Error en Numero de Inventario');
   If StrtoInt(dbeNumero.text) = 0 Then
      Raise Exception.Create('Error en Numero de Inventario');

   xSQL := 'Select * From ACF301 '
      + 'Where CIAID=''' + dblcCia.text + ''' and '
      + 'INVNUM=''' + dbeNumero.Text + '''';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.RecordCount > 0 Then
   Begin
      dbeNumero.SetFocus;
      Raise Exception.Create('Error Numero de Inventario Existe');
   End;

   DMAF.cdsInvC.Edit;
   DMAF.cdsInvC.FieldByname('InvEstado').AsString := '';
   DMAF.cdsInvC.FieldByname('InvObser').AsString := ' ';
   cdsPost(DMAF.cdsInvC);
   DMAF.ControlTran;

   pnlCab1.Enabled := False;
   pnlCab2.Enabled := True;
   pnlCab3.Enabled := True;
   dtpFecha.SetFocus;
End;

Procedure TFManteInv.dblcCiaExit(Sender: TObject);
Var
   xCondicion: String;
Begin
   If xInicio Then Exit;
   If bbtnClose.Focused Then Exit;
   DMAF.cdsQry.Close;
   xCondicion := 'CIAID=' + '''' + dblcCia.Text + '''';
   dbeCiaDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE101', '*', xCondicion, 'CiaAbr');
   If Length(dbeCiaDes.Text) = 0 Then
   Begin
      dblcCia.SetFocus;
      Raise Exception.Create('Error en Compañía');
   End;

   DMAF.cdsInvC.FieldByname('InvNum').AsString := BuscaUltNumero(dblcCia.Text);
   dbeNumero.SetFocus;
End;

Procedure TFManteInv.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   If (DMAF.wModo = 'A') And (DMAF.cdsInvC.FieldByname('InvEstado').AsString = '') Then
   Begin
      DMAF.cdsInvC.Delete;
      DMAF.ControlTran;
   End;
//   DMAF.cdsInvC.CancelUpdates;
  //////////////////////////////////////////////////////////////////////////////
   Screen.Cursor := crDefault;
   If DMAF.wModo = 'A' Then
   Begin
      MantInvC.FMant.cds2.Data := DMAF.cdsInvC.Data;
      MantInvC.FMant.FiltraData('NUEVO');
      MantInvC.FMant.cds2.GotoCurrent(DMAF.cdsInvC);
   End;
   If DMAF.wModo = 'M' Then
   Begin
      MantInvC.FMant.cds2.Data := DMAF.cdsInvC.Data;
      MantInvC.FMant.FiltraData('REFRESH');
      MantInvC.FMant.cds2.GotoCurrent(DMAF.cdsInvC);
   End;
   Action := CAFree;
  //////////////////////////////////////////////////////////////////////////////
End;

Procedure TFManteInv.bbtnCloseClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFManteInv.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;

End;

Procedure TFManteInv.FormShow(Sender: TObject);
Begin
   xInicio := True;

   If DMAF.wModo = 'A' Then
   Begin
      pnlCab1.Enabled := true;
      pnlCab2.Enabled := False;
      pnlCab3.Enabled := False;
      DMAF.cdsInvC.Insert;
      dblcCia.SetFocus;
   End
   Else
   Begin
      pnlCab1.Enabled := False;
      pnlCab2.Enabled := True;
      pnlCab3.Enabled := True;
      dbeCiaDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE101', '*', 'CIAID=' + '''' + dblcCia.Text + '''', 'CiaAbr');
      DMAF.cdsInvC.Edit;
      dtpFecha.SetFocus;
   End;
   xInicio := False;
End;

End.

