Unit oaAF0000;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad
// HPC_201801_ACF 22/08/2018 Se implementa la Versión
// HPC_201802_ACF 05/10/2018 Se Actualiza la Versión, cambio solo en el DFM
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, mant, DB, DBClient, wwclient, StdCtrls;

Type
   TFAFIni = Class(TForm)
    lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }
      MantHelp: TMant;
   End;

Procedure AFDataModulo; stdcall;
Procedure AFMantenimientoAccesos; stdcall;
Procedure AFOpcionAccesos; stdcall;
Procedure AFOpcionAccesosShow; stdcall;
Procedure AFMantenimientoAyudaMant; stdcall;
// Inicio HPC_201801_ACF
// Se implementa versión
Procedure AFVerificaVersion; stdcall;

Exports
   AFDataModulo,
   AFMantenimientoAccesos,
   AFOpcionAccesos,
   AFOpcionAccesosShow,
   AFMantenimientoAyudaMant,
   AFVerificaVersion;
// Fin HPC_201801_ACF
Var
   FAFIni: TFAFIni;

Implementation

{$R *.dfm}

Uses ACFDM;

Procedure AFDataModulo;
Begin
   Application.Initialize;
   Try
      If (DMAF = Nil) Or (DMAF.sClose = '1') Then
      Begin
         DMAF := TDMAF.Create(Application);
         If DMAF.sClose = '1' Then
         Begin
            DMAF.Free;
            DMAF := Nil;
         End;
      End;
   Finally
   End;
End;

Procedure AFMantenimientoAccesos;
Begin
//
End;

Procedure AFOpcionAccesos;
Begin
//
End;

Procedure AFOpcionAccesosShow;
Begin
//
End;

Procedure AFMantenimientoAyudaMant;
Begin
   FAFIni := TFAFIni.Create(Nil);
   FAFIni.MantHelp := TMant.Create(Application);
   FAFIni.MantHelp.Module := DMAF.wModulo;
   FAFIni.MantHelp.Tipo := 'HELP';
   FAFIni.MantHelp.Admin := 'N';
   FAFIni.MantHelp.DComC := DMAF.DCOM1;
   FAFIni.MantHelp.User := DMAF.wUsuario;
   FAFIni.MantHelp.Execute;
End;

Procedure AFVerificaVersion;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;
   FAFIni := TFAFIni.Create(Application);
   If DMAF.fg_VerificaVersion(FAFIni.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;


End.

