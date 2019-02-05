Unit ACF786;
//********************************************************
// CREADO POR       : Abelardo Sulca Palomino
// Nº HPP           : HPP_201104_ACF
// FECHA DE CREACION: 01/04/2011
// DESCRIPCION      : Ventana para ejecutar el reporte de desactivaciones
//********************************************************

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, StdCtrls, ExtCtrls, Buttons, Wwdbigrd;

Type
   TFToolSolDesactivacion = Class(TForm)
      pnlAct: TPanel;
      Z2bbtn_RptSolDesactivacion: TBitBtn;
      Procedure Z2bbtn_RptSolDesactivacionClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }

   Public
    { Public declarations }
   End;

Var
   FToolSolDesactivacion: TFToolSolDesactivacion;

Implementation
Uses ACFDM, ACF787;
{$R *.dfm}

Procedure TFToolSolDesactivacion.Z2bbtn_RptSolDesactivacionClick(
   Sender: TObject);
Begin
   Try
      FRptDesactivados := TFRptDesactivados.Create(Application); // ACF787
      FRptDesactivados.ShowModal;
   Finally
      FRptDesactivados.Free;
   End;
End;

Procedure TFToolSolDesactivacion.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   FToolSolDesactivacion.Free;
End;

End.

