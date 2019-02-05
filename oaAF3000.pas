Unit oaAF3000;
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201104_ACF
// FECHA DE MODIF.  : 01/04/2011
// DESCRIPCION      : Se implementa los cambios necesarios para levantar
//                    las funcionalidades requeriedas para la generación
//                    de la solicitud de desactivación de activos fijos
//********************************************************
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201107_ACF
// FECHA DE MODIF.  : 09/05/2011
// DESCRIPCION      : Se implementa los cambios necesarios para levantar
//                    las funcionalidades requeriedas para registro de
//                    solicitudes de cambio de Cod de Barras
//********************************************************

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad
//                30/10/2017 Control de Acceso por Grupo de Usuario
// HPC_201801_ACF 08/08/2018 Se adiciona nuevo formulario para luego implementarlo en la Depreciación
// HPC_201802_ACF 05/10/2018 Se Actualiza la Versión, cambio solo en el DFM

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, db, ExtCtrls, StdCtrls;

Type
   TFProcesos = Class(TForm)
      lblVersion: TLabel;

   Private
    { Private declarations }
   Public
    { Public declarations }
      Procedure PanelCreaMant(Sender: TObject);
   //   Procedure LimiteInsert(Sender: TObject);
   //   Procedure LimiteEdit(Sender: TObject; MantFields: TFields);
   //   Procedure ReclasEdit(Sender: TObject; MantFields: TFields);
   //   Procedure ReclasInsert(Sender: TObject);
      Procedure MantSolDesactivacionEdit(Sender: TObject; MantFields: TFields);
      Procedure MantSolDesactivacionInsert(Sender: TObject);
      Procedure MantCambioCodbarrasEdit(Sender: TObject; MantFields: TFields);
      Procedure MantCambioCodbarrasInsert(Sender: TObject);
   End;

Procedure AFDepreciacionAjuste; stdcall; // ACF222.pas
Procedure AFCierreDepreciacion; stdcall; // ACF230.pas
Procedure AFContabilizaDepreciacion; stdcall; // ACF225.pas
//Procedure AFContabilizaREI; stdcall;
//Procedure AFCierreOperativo; stdcall;
//Procedure AFReclasificacionContable; stdcall;
//Procedure AFAjusteAnualActivos; stdcall;
Procedure AFRecuperaTexto; stdcall;
Procedure AFInicializaDepreciacion; stdcall; // oaAF3000.pas / ACF219.pas
//Procedure AFLimiteReexpresion; stdcall;
Procedure AFEliminaDepreciacionAjuste; stdcall; // ACF231.pas
Procedure AFActCenCos; stdcall; // ACF234.pas
Procedure AFSolicitudDesactivacion; stdcall; //ACF130.pas
Procedure AFCambioCodbarras; stdcall; //ACF140.pas
Procedure AFCopiaCds; stdcall;
Procedure AFVerificaVersion; stdcall;

Exports
   AFInicializaDepreciacion,
   AFDepreciacionAjuste,
   AFCierreDepreciacion,
   AFContabilizaDepreciacion,
   AFEliminaDepreciacionAjuste,
   AFActCenCos,
   AFSolicitudDesactivacion,
   AFCambioCodbarras,
   AFCopiaCds,
   AFVerificaVersion;

Var
   FProcesos: TFProcesos;
   Mtx, MantLimite, MantRecl, MantLoad: TMant;
   MantSolDesactivacion: TMant;
   MantCambioCodbarras: TMant;
   pl, pg: TPanel;
   wxSql, xSql: String;
Implementation

{
Uses ACFDM, ACF219, ACF222, ACF230, ACF225, ACF290, ACF294, ACF232, ACF296, ACF298,
   ACF231, ACF224, ACF234, ACF786, ACF130, ACF788, ACF140;
}
Uses ACFDM, ACF219, ACF222, ACF230, ACF225, ACF234, ACF786, ACF130, ACF788, ACF140;

// ACF219  -  FIniciaDepre
// ACF222  -  FDeprecia1
// ACF230  -  FCierraDepre
// ACF225  -  FContabilizaDepre
// ACF231  -  FDesDeprecia
// ACF234  -  FActCenCos
// ACF130  -  FDesactivacionAF

{$R *.dfm}

Procedure AFActCenCos;
Var
   xsql: String;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160307') Then Exit;
// Fin HPC_201701_ACF

   Try
      DMAF.cdsQry9.Close;
      xSQL := 'SELECT * FROM TGE101 WHERE CNTCONSOL=''S''';
      DMAF.cdsCia.Close;
      DMAF.cdsCia.DataRequest(xSQL);
      DMAF.cdsCia.Open;
      FActCenCos := TFActCenCos.Create(Application); // ACF231
      FActCenCos.ShowModal;
   Finally
      FActCenCos.Free;
   End;
End;

Procedure AFDepreciacionAjuste;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160302') Then Exit;
// Fin HPC_201701_ACF

   Try
      FDeprecia1 := TFDeprecia1.Create(Application); // ACF222
      FDeprecia1.ShowModal;
   Finally
      FDeprecia1.Free;
   End;
End;

Procedure AFCierreDepreciacion;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160303') Then Exit;
// Fin HPC_201701_ACF

   Try
      FCierraDepre := TFCierraDepre.Create(Application); // ACF230
      FCierraDepre.Showmodal;
   Finally
      FCierraDepre.Free;
   End;
End;

Procedure AFContabilizaDepreciacion;
Var
   xsql: String;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160304') Then Exit;
// Fin HPC_201701_ACF

   Try
      DMAF.cdsQry10.Close;
      FContabilizaDepre := TFContabilizaDepre.Create(Application); // ACF225
      FContabilizaDepre.ShowModal;
   Finally
      FContabilizaDepre.Free;
   End;
End;

(*
Procedure AFContabilizaREI;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

   Try
      DMAF.cdsTDiario.Close;
      DMAF.cdsTDiario.DataRequest('Select * from TGE104');
      DMAF.cdsTDiario.Open;
      DMAF.cdsTDiario.IndexFieldNames := 'TDIARID';
      FContaREI := TFContaREI.Create(Application); // ACF294
      xSQL := 'Select '' '' CIAID, '' '' CTAORI, '' '' CTADESORI, '' '' CUENTAID, '' '' CCOSID, '' '' DH, '
         + '0 DEBE, 0 HABER, '' '' CTADES '
         + 'From ACF204 '
         + 'Where CIAID=''ZZ'' and FAPERIODO=''9999'' ';

      DMAF.cdsTrasSel.Close;
      DMAF.cdsTrasSel.DataRequest(xSQL);
      DMAF.cdsTrasSel.Open;

      FContaREI.dbgConta.DataSource := DMAF.dsTrasSel;

      FContaREI.dbgConta.Selected.Clear;
      FContaREI.dbgConta.Selected.Add('CTAORI'#9'18'#9'Cuenta~Origen'#9);
      FContaREI.dbgConta.Selected.Add('CTADESORI'#9'40'#9'Descripcion'#9);
      FContaREI.dbgConta.Selected.Add('CUENTAID'#9'18'#9'Cuenta~Contable'#9);
      FContaREI.dbgConta.Selected.Add('CCOSID'#9'10'#9'Centro~Costo'#9);
      FContaREI.dbgConta.Selected.Add('DEBE'#9'16'#9'Debe'#9);
      FContaREI.dbgConta.Selected.Add('HABER'#9'16'#9'Haber'#9);

      FContaREI.ActiveMDIChild;
   Finally
   End;
End;
*)

(*
Procedure AFCierreOperativo;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

   Try
      FCierreOpe := TFCierreOpe.Create(Application); // ACF230
      FCierreOpe.ActiveMDIChild;
   Finally
   End;
End;
*)

(*
Procedure AFReclasificacionContable;
Var
   xsql: String;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

   Try
      xSQL := 'SELECT * FROM ACF110 ';
      DMAF.cdsCTA.Close;
      DMAF.cdsCTA.DataRequest(xSQL);
      DMAF.cdsCTA.IndexFieldNames := 'CUENTAID';
      DMAF.cdsCTA.Open;
      DMAF.cdsTDiario.Close;
      DMAF.cdsTDiario.DataRequest('Select * from TGE104');
      DMAF.cdsTDiario.Open;
      DMAF.cdsTDiario.IndexFieldNames := 'TDIARID';
      DMAF.cdsTrasSel.close;
      xSQL := 'Select ACFID, TACFID, ACFDES, CUENTAID, ''                    '' CUENTAID2, '
         + '0 VALORHIS, 0 AJUSTE, 0 DEPHIS, 0 DEPAJU '
         + 'From ACF204 '
         + 'Where CIAID=''ZZ'' and FAPERIODO=''9999'' ';
      DMAF.cdsTrasSel.Close;
      DMAF.cdsTrasSel.DataRequest(xSQL);
      DMAF.cdsTrasSel.Open;
      DMAF.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      MantRecl := TMant.Create(Application);
      MantRecl.User := DMAF.wUsuario;
      MantRecl.Admin := DMAF.wAdmin;
      MantRecl.DComC := DMAF.DCom1;
      MantRecl.OnInsert := FProcesos.ReclasInsert;
      MantRecl.OnEdit := FProcesos.ReclasEdit;
      MantRecl.ClientDataSet := DMAF.cdsReva;
      MantRecl.TableName := 'ACF307';
      MantRecl.Titulo := 'Reclasificación de Activos';
      MantRecl.Module := DMAF.wModulo;
      MantRecl.OnCierra := DMAF.DisminuyeForma;
      MantRecl.SectionName := 'AFReclasificacion';
      MantRecl.FileNameIni := '\oaAF.INI';
      MantRecl.Execute;
   Finally
   End;
End;
*)

(*
Procedure AFAjusteAnualActivos;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

   Try
      DMAF.cdsTDiario.Close;
      DMAF.cdsTDiario.DataRequest('Select * from TGE104');
      DMAF.cdsTDiario.Open;
      DMAF.cdsTDiario.IndexFieldNames := 'TDIARID';
      FAjusteAnual := TFAjusteAnual.Create(Application); // ACF298
      xSQL := 'Select CIAID, ACFID, TACFID, ACFDES, CUENTAID, '
         + '0 VALORHIS, 0 AJUSTE, 0 VALORAJU, 0 DEPAJU '
         + 'From ACF204 '
         + 'Where CIAID=''ZZ'' and FAPERIODO=''9999'' ';
      DMAF.cdsTrasSel.Close;
      DMAF.cdsTrasSel.DataRequest(xSQL);
      DMAF.cdsTrasSel.Open;
      FAjusteAnual.dbgConta.Selected.Clear;
      FAjusteAnual.dbgConta.Selected.Add('TACFID'#9'7'#9'Tipo~Activo'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('ACFID'#9'8'#9'Activo~Id.'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('ACFDES'#9'30'#9'Activo Fijo'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('CUENTAID'#9'17'#9'Cuenta~Contable'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('VALORHIS'#9'14'#9'Valor~Historico'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('AJUSTE'#9'14'#9'Valor~Ajuste'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('VALORAJU'#9'14'#9'Valor~Nuevo'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('DEPAJU'#9'14'#9'Deprec.~Ajuste'#9'F');
      FAjusteAnual.dbgConta.DataSource := DMAF.dsTrasSel;
      FAjusteAnual.ActiveMDIChild;
   Finally
   End;
End;
*)

Procedure AFRecuperaTexto;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

{obc 6/6/2006 se anula por que llama al acf210  try
     DMAF.cdsTipAct.Close;
     DMAF.cdsTipAct.DataRequest( 'Select * From ACF101' );
     DMAF.cdsTipAct.Open;
     DMAF.cdsTipAct.IndexFieldNames:='TACFID';
     FToolsLoadTexto:=TFToolsLoadTexto.Create( Application );    // ACF280
     DMAF.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
     MantLoad       := TMant.Create(Application);
     MantLoad.Admin          := DMAF.wAdmin;
     pg := FToolsLoadTexto.pnlAct;
     MantLoad.OnCreateMant   := FProcesos.PanelCreaMant;//ToolsLoad;
     MantLoad.DComC          := DMAF.DCom1;
     MantLoad.ClientDataSet  := DMAF.cdsQry;
     MantLoad.TableName      := 'ACF305';
     MantLoad.Titulo         := 'Recuperar Texto';
     MantLoad.User           := DMAF.wUsuario;
     MantLoad.Module           := DMAF.wModulo;
     MantLoad.OnCierra     := DMAF.DisminuyeForma;
     MantLoad.SectionName    := 'AFLoadTexto';
     MantLoad.FileNameIni    := '\oaAF.INI';
     Try
        DMAF.cdsUbica.IndexFieldNames    :='UBICID';
        DMAF.cdsLocalidad.IndexFieldNames:='LOCID';
        MantLoad.Execute;
     finally
     end;
  finally
  end;}
End;

Procedure AFInicializaDepreciacion;
Var
   xsql: String;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160301') Then Exit;
// Fin HPC_201701_ACF

// Inicio HPC_201801_ACF
// Control de Acceso por Grupo de Usuario
   Try
      xSQL := 'SELECT * FROM TGE101 WHERE CNTCONSOL=''S''';
      DMAF.cdsCia.Close;
      DMAF.cdsCia.DataRequest(xSQL);
      DMAF.cdsCia.Open;
      FIniciaDepre := TFIniciaDepre.Create(Application); // ACF219
      FIniciaDepre.ShowModal;
//    FProcDeprec := TFProcDeprec.Create(Application); // ACF286
//    FProcDeprec.ShowModal;

   Finally
      FIniciaDepre.Free;
//    FProcDeprec.Free;
   End;
// Fin HPC_201801_ACF
End;

(*
Procedure AFLimiteReexpresion;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;
   Try
      DMAF.wBoton := '2';
      DMAF.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      MantLimite := TMant.Create(Application);
      Try
         MantLimite.User := DMAF.wUsuario;
         MantLimite.Admin := DMAF.wAdmin;
         MantLimite.Module := DMAF.wModulo;
         MantLimite.DComC := DMAF.DCOM1;
         MantLimite.OnCreateMant := Nil;
         MantLimite.TableName := 'ACF309';
         MantLimite.ClientDataSet := DMAF.cdsLimReCab;
         MantLimite.Filter := '';
         MantLimite.Titulo := 'Límite de Reexpresión';
         MantLimite.OnInsert := FProcesos.LimiteInsert;
         MantLimite.OnEdit := FProcesos.LimiteEdit;
         MantLimite.OnCierra := DMAF.DisminuyeForma;
         MantLimite.OnDelete := Nil;
         MantLimite.OnShow := Nil;
         MantLimite.OnCierra := DMAF.DisminuyeForma;
         MantLimite.SectionName := 'LimiteR';
         MantLimite.FileNameIni := '\oaAF.ini';
         MantLimite.Execute;
      Finally
      End;
   Finally
   End;
End;
*)

(*
Procedure TFProcesos.LimiteEdit(Sender: TObject; MantFields: TFields);
Begin

   DMAF.wModo := 'M';
   DMAF.cdsLimReCab.Data := MantLimite.FMant.cds2.Data;
   DMAF.cdsLimReCab.GotoCurrent(MantLimite.FMant.cds2);
   If DMAF.cdsLimReCab.RecordCount > 0 Then
   Begin

      FLimReexpres := TFLimReexpres.Create(Application);
      FLimReexpres.ActiveMDIChild; // ACF224
   End;
End;
*)

(*
Procedure TFProcesos.LimiteInsert(Sender: TObject);
Var
   wxSql: String;
Begin

   DMAF.wModo := 'A';
   wxSql := 'SELECT * FROM ACF309 WHERE 1<>1';
   DMAF.cdsLimReCab.Close;
   DMAF.cdsLimReCab.DataRequest(wxSql);
   DMAF.cdsLimReCab.Open;
   FLimReexpres := TFLimReexpres.Create(Application);
   FLimReexpres.ActiveMDIChild; // ACF224
End;
*)

Procedure AFEliminaDepreciacionAjuste;
Var
   xsql: String;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;
   ShowMessage('Opción Deshabilitada');
   Exit;
   {
   Try
      DMAF.cdsQry9.close;
      XSQL := 'SELECT * FROM TGE101 ORDER BY CIAID';
      DMAF.cdsCia.Close;
      DMAF.cdsCia.DataRequest(XSQL);
      DMAF.cdsCia.open;

      FDesDeprecia := TFDesDeprecia.Create(Application); // ACF231
      FDesDeprecia.ShowModal;
   Finally
      FDesDeprecia.Free;
   End;
   }
End;

Procedure TFProcesos.PanelCreaMant(Sender: TObject);
Begin
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 1;
   pg.Align := alClient;
   pg.Parent := Tmant(Sender).Fmant.pnlBtns;
   pl.AutoSize := true;
   Tmant(Sender).Fmant.pnlBtns.Visible := true;
End;

(*
Procedure TFProcesos.ReclasEdit(Sender: TObject; MantFields: TFields);
Begin

   DMAF.cdsReva.Data := MantRecl.FMant.cds2.Data;
   DMAF.cdsReva.GotoCurrent(MantRecl.FMant.cds2);
   If DMAF.cdsReva.RecordCount > 0 Then
   Begin
      DMAF.wModo := 'M';
      FReclasifica := TFReclasifica.Create(Application); // ACF296
      FReclasifica.dbgConta.Selected.Clear;
      FReclasifica.dbgConta.Selected.Add('ACFID'#9'8'#9'Activo~Id.'#9'F');
      FReclasifica.dbgConta.Selected.Add('TACFID'#9'7'#9'Tipo~Activo'#9'F');
      FReclasifica.dbgConta.Selected.Add('ACFDES'#9'25'#9'Activo Fijo'#9'F');
      FReclasifica.dbgConta.Selected.Add('CUENTAID'#9'17'#9'Cuenta~Contable'#9'F');
      FReclasifica.dbgConta.Selected.Add('CUENTAID2'#9'17'#9'Nueva~Cuenta'#9);
      FReclasifica.dbgConta.Selected.Add('VALORHIS'#9'12'#9'Valor~Historico'#9'F');
      FReclasifica.dbgConta.Selected.Add('AJUSTE'#9'10'#9'Valor~Ajuste'#9'F');
      FReclasifica.dbgConta.Selected.Add('DEPHIS'#9'10'#9'Deprec.~Acumulada.'#9'F');
      FReclasifica.dbgConta.Selected.Add('DEPAJU'#9'10'#9'Deprec.~Ajuste'#9'F');
      FReclasifica.dbgConta.DataSource := DMAF.dsTrasSel;
      FReclasifica.ActiveMDIChild;
   End;
End;
*)

(*
Procedure TFProcesos.ReclasInsert(Sender: TObject);
Begin

   DMAF.wModo := 'A';
   wxSql := 'SELECT * FROM ACF307 WHERE 1<>1';
   DMAF.cdsReva.Close;
   DMAF.cdsReva.DataRequest(wxSql);
   DMAF.cdsReva.Open;

   FReclasifica := TFReclasifica.Create(Application);
   FReclasifica.ActiveMDIChild; // ACF296
End;
*)

//INICIO HPP_201104_ACF

Procedure AFSolicitudDesactivacion;
Var
   xSQL: String;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160312') Then Exit;
// Fin HPC_201701_ACF

   Screen.Cursor := crHourGlass;

   xSQL := 'SELECT ACF130.CIAID, ' +
      ' ACF130.NUMSOLDES, ' +
      ' ACF130.DESACID , ' +
      ' ACF105.DESACDES, ' +
      ' ACF130.ESTADO, ' +
      ' ACF130.USUARIO, ' +
      ' ACF130.FECHA, ' +
      ' ACF130.USUAUT, ' +
      ' ACF126.RECIBENOM, ' +
      ' ACF130.FECAUT, ' +
      ' ACF130.OBSERVACION, ' +
      ' ACF130.PROCESO ' +
      ' FROM ACF130 , ACF105 , ACF126 ' +
      ' WHERE ACF130.DESACID = ACF105.DESACID(+) ' +
      ' AND ACF130.USUAUT = ACF126.RECIBEID(+) ';

   DMAF.cdsQry10.CLose;
   DMAF.cdsQry10.DataRequest(xSQL);
   DMAF.cdsQry10.Open;

   DMAF.wboton := '11';
   DMAF.wCierraCds := '1';

   FToolSolDesactivacion := TFToolSolDesactivacion.Create(Application); // ACF786
   DMAF.wTipoAdicion := 'xFiltro';
   MantSolDesactivacion := TMant.Create(Application);
   Try

      MantSolDesactivacion.Admin := DMAF.wAdmin;
      MantSolDesactivacion.DComC := DMAF.DCOM1;
      MantSolDesactivacion.Module := DMAF.wModulo;
      MantSolDesactivacion.UsuarioSQL.Add(xSQL);
      MantSolDesactivacion.TableName := 'VWACFSOLDES';
      MantSolDesactivacion.Titulo := 'Solicitudes de Desactivación';
      MantSolDesactivacion.Filter := '';
      MantSolDesactivacion.ClientDataSet := DMAF.cdsQry10;
      pg := FToolSolDesactivacion.pnlAct;
      MantSolDesactivacion.OnCreateMant := FProcesos.PanelCreaMant;
      MantSolDesactivacion.OnEdit := FProcesos.MantSolDesactivacionEdit;
      MantSolDesactivacion.OnInsert := FProcesos.MantSolDesactivacionInsert;
      MantSolDesactivacion.SectionName := 'AFTipoAct';
      MantSolDesactivacion.FileNameIni := '\oaAF.INI';
      MantSolDesactivacion.OnCierra := DMAF.DisminuyeForma;
      MantSolDesactivacion.NoVisible.Clear;
      Screen.Cursor := crDefault;
      MantSolDesactivacion.Execute;

   Finally

   End;
End;

Procedure TFProcesos.MantSolDesactivacionEdit(Sender: TObject; MantFields: TFields);
Begin

   If Not DMAF.DCOM1.Connected Then Exit;

   DMAF.cdsQry10.Data := MantSolDesactivacion.FMant.cds2.Data;
   DMAF.cdsQry10.GotoCurrent(MantSolDesactivacion.FMant.cds2);

   If DMAF.cdsQry10.RecordCount > 0 Then
   Begin
      Try
         DMAF.wModo := 'M';
         FDesactivacionAF := TFDesactivacionAF.Create(Application); // ACF130
         FDesactivacionAF.xCia := DMAF.cdsQry10.FieldbyName('CIAID').AsString;
         FDesactivacionAF.xNumSolDesactivacion := DMAF.cdsQry10.FieldbyName('NUMSOLDES').AsString;
      Finally

      End;
   End;
End;

Procedure TFProcesos.MantSolDesactivacionInsert(Sender: TObject);
Begin
   If Not DMAF.DCOM1.Connected Then Exit;
   Try
      DMAF.wModo := 'A';
      FDesactivacionAF := TFDesactivacionAF.Create(Application);
   //FDesactivacionAF.ActiveMDIChild;          // ACF130
   Finally

   End;
End;

Procedure AFCambioCodbarras;
Var
   xSQL: String;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160313') Then Exit;
// Fin HPC_201701_ACF

   Screen.Cursor := crHourGlass;

   xSQL := ' SELECT A.CIAID, A.NUMSOLCAM, A.CODIGOBARRA, A.ACFDES, A.CODIGOBARRA_NUE, A.CODIGOBARRA_ANT, ' +
      ' A.MOTCAMID, A.MOTCAMDES , A.FECHA, A.ESTADO, A.USUREG ' +
      ' FROM (SELECT ACF140.CIAID, ACF140.NUMSOLCAM, ACF201.CODIGOBARRA, ACF201.ACFDES, ' +
      ' ACF141.CODIGOBARRA CODIGOBARRA_NUE, ACF141.CODIGOBARRA_ANT , ACF140.MOTCAMID,  ' +
      ' ACF112.MOTCAMDES,ACF140.FECHA, ACF140.ESTADO, ACF140.USUREG  ' +
      ' FROM ACF140 , ACF141, ACF112, ACF201  ' +
      ' WHERE ACF141.ARTCODBAR = ACF201.ARTCODBAR (+) ' +
      ' AND ACF140.MOTCAMID = ACF112.MOTCAMID  ' +
      ' AND ACF140.CIAID = ACF141.CIAID (+) ' +
      ' AND ACF140.NUMSOLCAM = ACF141.NUMSOLCAM (+) ) A ' +
      ' WHERE 1 = 1 ';

   DMAF.cdsQry10.CLose;
   DMAF.cdsQry10.DataRequest(xSQL);
   DMAF.cdsQry10.Open;

   DMAF.wboton := '11';
   DMAF.wCierraCds := '1';

   FToolCambioCodBarra := TFToolCambioCodBarra.Create(Application); // ACF788
   DMAF.wTipoAdicion := 'xFiltro';
   MantCambioCodbarras := TMant.Create(Application);
   Try

      MantCambioCodbarras.Admin := DMAF.wAdmin;
      MantCambioCodbarras.DComC := DMAF.DCOM1;
      MantCambioCodbarras.Module := DMAF.wModulo;
      MantCambioCodbarras.UsuarioSQL.Add(xSQL);
      MantCambioCodbarras.TableName := 'VWACFCAMBCODBAR';
      MantCambioCodbarras.Titulo := 'Cambio de Código de Barras';
      MantCambioCodbarras.Filter := '';
      MantCambioCodbarras.ClientDataSet := DMAF.cdsQry10;
      pg := FToolCambioCodBarra.pnlAct;
      MantCambioCodbarras.OnCreateMant := FProcesos.PanelCreaMant;
      MantCambioCodbarras.OnEdit := FProcesos.MantCambioCodbarrasEdit;
      MantCambioCodbarras.OnInsert := FProcesos.MantCambioCodbarrasInsert;
      MantCambioCodbarras.SectionName := 'AFTipoAct';
      MantCambioCodbarras.FileNameIni := '\oaAF.INI';
      MantCambioCodbarras.OnCierra := DMAF.DisminuyeForma;
      MantCambioCodbarras.NoVisible.Clear;
      Screen.Cursor := crDefault;
      MantCambioCodbarras.Execute;

   Finally

   End;
End;

Procedure TFProcesos.MantCambioCodbarrasEdit(Sender: TObject; MantFields: TFields);
Begin

   If Not DMAF.DCOM1.Connected Then Exit;

   DMAF.cdsQry10.Data := MantCambioCodbarras.FMant.cds2.Data;
   DMAF.cdsQry10.GotoCurrent(MantCambioCodbarras.FMant.cds2);

   If DMAF.cdsQry10.RecordCount > 0 Then
   Begin
      Try
         DMAF.wModo := 'M';
         FCambioCodiboBarraAF := TFCambioCodiboBarraAF.Create(Application); // ACF140
         FCambioCodiboBarraAF.xCia := DMAF.cdsQry10.FieldbyName('CIAID').AsString;
         FCambioCodiboBarraAF.xNumCambioCodbarra := DMAF.cdsQry10.FieldbyName('NUMSOLCAM').AsString;
      Finally

      End;
   End;
End;

Procedure TFProcesos.MantCambioCodbarrasInsert(Sender: TObject);
Begin
   If Not DMAF.DCOM1.Connected Then Exit;
   Try
      DMAF.wModo := 'A';
      FCambioCodiboBarraAF := TFCambioCodiboBarraAF.Create(Application);
   Finally

   End;
End;

Procedure AFCopiaCds;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;
   ShowMessage('Esta Opción ha sido deshabilitada');
   Exit;
End;

Procedure AFVerificaVersion;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;
   FProcesos := TFProcesos.Create(Application);
   If DMAF.fg_VerificaVersion(FProcesos.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.

