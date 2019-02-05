Unit oaAF5000;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad
//                30/10/2017 Control de Acceso por Grupo de Usuario
// HPC_201802_ACF 05/10/2018 Se Actualiza la Versión, cambio solo en el DFM

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, db, ExtCtrls, StdCtrls;

Type
   TFInventarioFisico = Class(TForm)
      lblVersion: TLabel;

   Private
    { Private declarations }
   Public
    { Public declarations }
      Procedure PanelCreaMant(Sender: TObject);
      Procedure InvInsert(Sender: TObject);
      Procedure InvEdit(Sender: TObject; MantFields: TFields);
   End;

Procedure AFInventarioFisico; stdcall;
Procedure AFVerificaVersion; stdcall;

Exports
   AFInventarioFisico,
   AFVerificaVersion;

Var
   FInventarioFisico: TFInventarioFisico;
   MantInvc: TMant;
   pl, pg: TPanel;
   wxSql: String;

Implementation

Uses ACFDM, ACF260, ACF778;

{$R *.dfm}

Procedure AFInventarioFisico;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160501') Then Exit;
// Fin HPC_201701_ACF

   Try

      wxSql := 'SELECT * FROM ACF301 WHERE 1<>1';
      DMAF.cdsInvC.Close;
      DMAF.cdsInvC.DataRequest(wxSql);
      DMAF.cdsInvC.Open;
      FToolsInv := TFToolsInv.Create(Application); // ACF778

      MantInvC := TMant.Create(Application);
      Try

//       DMAF.wCierraCds:='1';  //por '1' ejecuta los close de los cds.
         MantInvC.Admin := DMAF.wAdmin;
         MantInvC.OnInsert := FInventarioFisico.InvInsert;
         MantInvC.OnEdit := FInventarioFisico.InvEdit;
         MantInvC.OnCierra := DMAF.DisminuyeForma;
         pg := FToolsInv.pnlAct;
         MantInvC.OnCreateMant := FInventarioFisico.PanelCreaMant;
         MantInvC.DComC := DMAF.DCom1;
         MantInvC.ClientDataSet := DMAF.cdsInvC;
         MantInvC.TableName := 'ACF301';
         MantInvC.Module := 'AF';
         MantInvC.Titulo := 'Inventario';
         MantInvC.User := DMAF.wUsuario;
         MantInvC.SectionName := 'AFInventario';
         MantInvC.FileNameIni := '\oaAF.INI';
         MantInvC.Execute;
      Finally
      End;
   Finally
   End;
End;

Procedure TFInventarioFisico.InvEdit(Sender: TObject; MantFields: TFields);
Begin

   DMAF.wModo := 'M';
   DMAF.cdsInvC.Data := MantInvC.FMant.cds2.Data;
   DMAF.cdsInvC.GotoCurrent(MantInvC.FMant.cds2);
   If DMAF.cdsInvC.RecordCount > 0 Then
   Begin
      If DMAF.cdsInvC.FieldByname('InvEstado').AsString = 'Aceptado' Then
         Raise Exception.Create('Inventario Aceptado. No se Puede Modificar');

      FManteInv := TFManteInv.Create(Application);
      FManteInv.ActiveMDIChild; // ACF260
   End;
End;

Procedure TFInventarioFisico.InvInsert(Sender: TObject);
Begin
   DMAF.wModo := 'A';
   wxSql := 'SELECT * FROM ACF301 WHERE 1<>1';
   DMAF.cdsInvC.Close;
   DMAF.cdsInvC.DataRequest(wxSql);
   DMAF.cdsInvC.Open;

   FManteInv := TFManteInv.Create(Application);
   FManteInv.ActiveMDIChild; // ACF260
End;

Procedure TFInventarioFisico.PanelCreaMant(Sender: TObject);
Begin
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 1;
   pg.Align := alClient;
   pg.Parent := Tmant(Sender).Fmant.pnlBtns;
   pl.AutoSize := true;
   Tmant(Sender).Fmant.pnlBtns.Visible := true;
End;

Procedure AFVerificaVersion;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;
   FInventarioFisico := TFInventarioFisico.Create(Application);
   If DMAF.fg_VerificaVersion(FInventarioFisico.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.

