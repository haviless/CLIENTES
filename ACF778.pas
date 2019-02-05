Unit ACF778;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, Mant;

Type
   TFToolsInv = Class(TForm)
      pnlAct: TPanel;
      Z2bbtnDetInv: TBitBtn;
      Procedure Z2bbtnDetInvClick(Sender: TObject);
      Procedure Regenera;
      Procedure MaestroActivo;
      Procedure MuestraACF302;
   Private
    { Private declarations }
      WXSQL: String;
   Public
    { Public declarations }
   End;

Var
   FToolsInv: TFToolsInv;
   MantInvD: TMant;

Implementation

Uses ACFDM, oaAF5000, ACF779;

{$R *.DFM}

Procedure TFToolsInv.Z2bbtnDetInvClick(Sender: TObject);
Var
   xFilter, xsql: String;

Begin
   Screen.Cursor := crHourGlass;

   DMAF.cdsInvC.Data := oaAF5000.MantInvC.FMant.cds2.Data;
   DMAF.cdsInvC.GotoCurrent(oaAF5000.MantInvC.FMant.cds2);

   XSQL := 'SELECT CIAID FROM ACF302'
      + ' where CIAID=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('CIAID').ASSTRING)
      + ' and INVNUM=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('INVNUM').ASSTRING);

   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName := 'dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;

   If (DMAF.cdsQry.recordcount > 0) Then
   Begin
      If (DMAF.cdsInvC.FieldByname('InvEstado').AsString <> 'Aceptado') Then
      Begin
         If MessageDlg('  Desea regenerar Inventario : ' + DMAF.cdsInvC.FieldByname('InvEstado').AsString,
            mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            Regenera;
            MaestroActivo;
            exit;
         End;
      End;
      MuestraACF302;

   End
   Else
   Begin
      MaestroActivo;
      Screen.Cursor := crDEFAULT;
   End;
End;

Procedure TFToolsInv.MuestraACF302;
Var
   xfilter: String;
Begin
   DMAF.cdsInvD.Open;
//     xFilter:=' ACF302.CIAID='+quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('CIAID').ASSTRING)
//             +' AND ACF302.INVNUM='+quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('INVNUM').ASSTRING);
   WXSQL := 'SELECT * FROM ACF302 WHERE ACF302.CIAID=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('CIAID').ASSTRING)
      + ' AND ACF302.INVNUM=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('INVNUM').ASSTRING);

   FToolsInvDet := TFToolsInvDet.Create(Application); // ACF779

   FToolsInvDet.Z2bbtnInicia.enabled := False; // desactiva botón de inicialización  de ACF779
   MantInvD := TMant.Create(Application);
   FToolsInvDet.Z2bbtnImp1.enabled := True;
   FToolsInvDet.Z2bbtnEdita.enabled := True;
   FToolsInvDet.Z2bbtnImp2.enabled := True;
   FToolsInvDet.Z2bbtnok.enabled := True;
   FToolsInvDet.Z2bbtntxt.enabled := True;

   MantInvD.Admin := DMAF.wAdmin;
   pg := FToolsInvDet.pnlAct;
   MantInvD.OnCreateMant := FInventarioFisico.PanelCreaMant;
   MantInvD.DComC := DMAF.DCOM1;
   MantInvD.ClientDataSet := DMAF.cdsInvD;
   MantInvD.Module := DMAF.wModulo;
   MantInvD.TableName := 'ACF302';
   MantInvD.UsuarioSQL.Add(WXSQL);
//     MantInvD.Filter         := xFilter;
   MantInvD.Titulo := 'Relacion de Inventario';
   MantInvD.User := DMAF.wUsuario;
   MantInvD.SectionName := 'AFInventarioDet';
   MantInvD.FileNameIni := '\oaAF.INI';
   MantInvD.Execute;

   Screen.Cursor := crDEFAULT;
End;

Procedure TFToolsInv.Regenera;
Var
   XSQL: String;
Begin
   Screen.Cursor := crHourGlass;
   XSQL := 'DELETE FROM ACF302'
      + ' where CIAID=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('CIAID').ASSTRING)
      + ' and INVNUM=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('INVNUM').ASSTRING);

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Execute;

   Screen.Cursor := crDefault;
End;

Procedure TFToolsInv.MaestroActivo;
Var
   xFilter, xSQL: String;
Begin
   XSQL := ' SELECT CIAID FROM ACF201'
      + ' WHERE CIAID=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('CIAID').ASSTRING)
      + ' AND ACFFLAGACT= ''A'' and ACFREFOR=''00'' ';

   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName := 'dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;

//     xFilter:='ACF201.CIAID='+quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('CIAID').ASSTRING)
//             +' AND ACFFLAGACT= ''A'' and ACFREFOR=''00'' ';

   wXSQL := 'SELECT * FROM ACF201 WHERE ACF201.CIAID=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('CIAID').ASSTRING)
      + ' AND ACF201.ACFFLAGACT= ''A'' and ACF201.ACFREFOR=''00'' ';

   DMAF.cdsActFij.Close;
   DMAF.cdsActFij.DataRequest(wxSQL);
   DMAF.cdsActFij.Open;

   FToolsInvDet := TFToolsInvDet.Create(Application); // ACF779
   MantInvD := TMant.Create(Application);

   If DMAF.cdsQry.Recordcount > 0 Then
      FToolsInvDet.Z2bbtnInicia.enabled := True // activa botón de inicialización DE ACF779
   Else
   Begin
      FToolsInvDet.Z2bbtnImp1.enabled := False;
      FToolsInvDet.Z2bbtnEdita.enabled := False;
      FToolsInvDet.Z2bbtnImp2.enabled := False;
      FToolsInvDet.Z2bbtnok.enabled := False;
      FToolsInvDet.Z2bbtntxt.enabled := False;
   End;
   MantInvD.Admin := DMAF.wAdmin;
   pg := FToolsInvDet.pnlAct;
   MantInvD.OnCreateMant := FInventarioFisico.PanelCreaMant;
   MantInvD.DComC := DMAF.DCOM1;
   MantInvD.ClientDataSet := DMAF.cdsInvD;
   MantInvD.Module := DMAF.wModulo;
   MantInvD.TableName := 'ACF201';
   MantInvD.UsuarioSQL.Add(WXSQL);
//     MantInvD.Filter         := xFilter;
   MantInvD.Titulo := 'Relacion de Inventario';
   MantInvD.User := DMAF.wUsuario;
   MantInvD.SectionName := 'AFInventarioDet';
   MantInvD.FileNameIni := '\oaAF.INI';
   MantInvD.Execute;
End;
End.

