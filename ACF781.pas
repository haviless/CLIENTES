Unit ACF781;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls;

Type
   TFToolsParaActivos = Class(TForm)
      pnlAct: TPanel;
      Z2bbtnDetAct: TBitBtn;
      Procedure Z2bbtnDetActClick(Sender: TObject);
   Private
    { Private declarations }
      xSQL: String;
   Public
    { Public declarations }
   End;

Var
   FToolsParaActivos: TFToolsParaActivos;

Implementation

Uses ACFDM, ACF777, ACF213, ACF780;

{$R *.DFM}

Procedure TFToolsParaActivos.Z2bbtnDetActClick(Sender: TObject);
Var
   wVez: integer;
   wArtId: String;
Begin
//   if FVariables.w_AF_Registro then
//   begin
//      ShowMessage( 'sólo puede accesar a una opción de actualización de Inventarios a la vez');
//      Exit;
//   end;

//   FVariables.w_AF_Registro := True;
   DMAF.cdsQry.Close;
   DMAF.cdsQry.IndexFieldNames := '';

   MantCompras.FMant.cds2.First;
   wVez := 0;
   While (Not MantCompras.FMant.cds2.Eof) Do
   Begin
      If (MantCompras.FMant.cds2.FieldByName('ESTADOID').AsString) = 'S' Then
      Begin
         If wVez = 0 Then
         Begin
            wArtId := (MantCompras.FMant.cds2.FieldByName('ARTID').AsString);

                // Busca Descripción (ACFDESL) desde LOG305 (O.Compra)
            xSQL := 'Select * from LOG305 '
               + 'Where CIAID=''' + MantCompras.FMant.cds2.FieldByName('CIAID').AsString + ''' AND '
               + 'PROV=''' + MantCompras.FMant.cds2.FieldByname('PROV').AsString + ''' AND '
               + 'ODCID=''' + MantCompras.FMant.cds2.FieldByname('ODCID').AsString + ''' AND '
               + 'ARTID=''' + MantCompras.FMant.cds2.FieldByname('ARTID').AsString + '''';
            DMAF.cdsBusca.Close;
            DMAF.cdsBusca.DataRequest(xSQL);
            DMAF.cdsBusca.Open;
            DMAF.wDescripcion := DMAF.cdsBusca.FieldByname('DODCOBS').AsString;
                //

            wVez := 1;
         End;
         If wArtId <> (MantCompras.FMant.cds2.FieldByName('ARTID').AsString) Then
         Begin
            ShowMessage('Solo se puede ejecutar para el mismo Articulo');
            Exit;
         End;
      End;
      MantCompras.FMant.cds2.Next;
   End;
   FDenominacion := TFDenominacion.create(Application);
   FDenominacion.ShowModal; // ACF213
End;

End.

