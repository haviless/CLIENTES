Unit oaAF1000;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad
//                30/10/2017 Control de Acceso por Grupo de Usuario
// HPC_201802_ACF 05/10/2018 Se Actualiza la Versión, cambio solo en el DFM


Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, db, ExtCtrls, StdCtrls;

Type
   TFParametros = Class(TForm)
      lblVersion: TLabel;

   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Procedure AFParametros; stdcall;
Procedure AFVerificaVersion; stdcall;

Exports
   AFParametros,
   AFVerificaVersion;

Var
   FParametros: TFParametros;
   Mtx: TMant;
   pl, pg: TPanel;

Implementation

Uses ACFDM;

{$R *.dfm}

Procedure AFParametros;
Var
   MRefe: TMant;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

   Application.Initialize;
   Try
      MRefe := TMant.Create(Application);
      MRefe.Module := 'AF';
      MRefe.Admin := DMAF.wAdmin;
      MRefe.DComC := DMAF.DCOM1;
      MRefe.User := DMAF.wUsuario;
      MRefe.OnCierra := DMAF.DisminuyeForma;
      MRefe.Execute;
   Except
   End;
End;

Procedure AFVerificaVersion;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160101') Then Exit;
// Fin HPC_201701_ACF

   FParametros := TFParametros.Create(Application);
   If DMAF.fg_VerificaVersion(FParametros.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.

