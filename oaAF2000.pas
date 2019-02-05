Unit oaAF2000;
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201104_ACF
// FECHA DE MODIF.  : 01/04/2011
// DESCRIPCION      : Se modifica el mantenimiento de Activos para que la
//                    funcionalidad de desactivación de activos genere
//                    automáticamente una solcitud de desactivación en estado ACEPTADO
//********************************************************
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201106_ACF
// FECHA DE MODIF.  : 11/04/2011
// DESCRIPCION      : Se quita la funcionalidad de adicionar activos al maestro de activos
//                    debido a que los activos se crean desde el módulo de inventarios
//                    con una nota de ingreso
//********************************************************

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad
//                30/10/2017 Control de Acceso por Grupo de Usuario
// HPC_201801_ACF 09/04/2018 Se implementa debido a que solo debe mostrar Activos o Inactivos
// HPC_201802_ACF 05/10/2018 Se Actualiza la Versión, cambio solo en el DFM

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   DBClient, Dialogs, Mant, ExtCtrls, db, StdCtrls;

Type
   TFAFMaestros = Class(TForm)
      lblVersion: TLabel;
      Procedure Mant2Delete(Sender: TObject; MantFields: TFields);
      Procedure Mant2Edit(Sender: TObject; MantFields: TFields);
      Procedure Mant2Insert(Sender: TObject);
      Procedure Mant3Insert(Sender: TObject);
      Procedure Mant3Edit(Sender: TObject; MantFields: TFields);
      Procedure Mant3Delete(Sender: TObject; MantFields: TFields);

      Procedure MantControlOpeDelete(Sender: TObject; MantFields: TFields);
      Procedure MantControlOpeEdit(Sender: TObject; MantFields: TFields);
      Procedure MantControlOpeInsert(Sender: TObject);

      Procedure PanelCreaMant(Sender: TObject);

   Private
    { Private declarations }
   Public
    { Public declarations }

   End;

Procedure AFMaestroActivoFijoMant; stdcall;
Procedure AFControlOperativoMant; stdcall;
Procedure AFTiposActivoMant; stdcall;
Procedure AFVerificaVersion; stdcall;

Exports
   AFMaestroActivoFijoMant,
   AFControlOperativoMant,
   AFTiposActivoMant,
   AFVerificaVersion;

Var
   FAFMaestros: TFAFMaestros;
   Mant3, Mant2, MantControlOpe: TMant;
   wxSql: String;
   pl, pg: TPanel;

Implementation

{$R *.dfm}

Uses ACFDM, MsgDlgs, ACF210, ACF777, ACF250, ACF205, ACF206, ACF780;
// ACF210 FMaestro Maestro de Activos Fijos
// ACF777 FToolsActivo Tool del Maestro de Activos
// ACF250 FTActivo Tipos de Activos Fijos
// ACF205 FMaestro Control Operativo
// ACF780 FToolsControlOpe Tool del Control Operativo

Procedure AFMaestroActivoFijoMant;
Var
   xSQL: String;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160202') Then Exit;
// Fin HPC_201701_ACF

   Screen.Cursor := crHourGlass;
   xSQL := 'SELECT * FROM SOLREF WHERE ZARCHIVO=' + quotedstr('VWAFRESUMEN');

   DMAF.cdsVistas.CLose;
   DMAF.cdsVistas.DataRequest(xSQL);
   DMAF.cdsVistas.Open;
   DMAF.wboton := '11';
   DMAF.wCierraCds := '1';
   FToolsActivo := TFToolsActivo.Create(Application); // ACF777
   DMAF.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mant2 := TMant.Create(Application);
   Try
      Mant2.User := DMAF.wUsuario;
      Mant2.Admin := DMAF.wAdmin;
      Mant2.DComC := DMAF.DCOM1;
      Mant2.Module := DMAF.wModulo;
      Mant2.TableName := 'ACF201';
      Mant2.Titulo := 'Maestro de Activo';
      Mant2.Filter := '';
      Mant2.ClientDataSet := DMAF.cdsActFij;
      pg := FToolsActivo.pnlAct;
      Mant2.OnCreateMant := FAFMaestros.PanelCreaMant;
      Mant2.OnEdit := FAFMaestros.Mant2Edit;
      Mant2.OnInsert := FAFMaestros.Mant2Insert;
      Mant2.SectionName := 'AFMAESTRO';
      Mant2.FileNameIni := '\oaAF.INI';
      Mant2.OnCierra := DMAF.DisminuyeForma;
      Mant2.NoVisible.Clear;
      Screen.Cursor := crDefault;
      DMAF.wJK := '1';
      Mant2.Execute;
   Finally
   End;
End;

{ TFAFMaestros }

Procedure TFAFMaestros.Mant2Delete(Sender: TObject; MantFields: TFields);
Var
   xSql, xxCia, xxAct, xxAcD, xxFRe, xxRef: String;
Begin
   If DMAF.cdsActFij.RecordCount = 0 Then Exit;

   xxCia := MantFields.FieldByName('CIAID').AsString;
   xxAct := MantFields.FieldByName('ACFID').AsString;
   xxAcD := MantFields.FieldByName('ACFDES').AsString;
   xxFRe := MantFields.FieldByName('ACFFLAGREF').AsString;
   xxRef := MantFields.FieldByName('ACFREFOR').AsString;

   xSql := 'Select * From ACF204 '
      + '    Where CIAID=''' + xxCia + ''' and ACFID=''' + xxAct + ''' and '
      + '          DEPFLAGREF=''' + xxFRe + ''' and ACFREFOR=''' + xxRef + ''' and '
      + '          DEPFLAGPRO=''P''';

   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName := 'dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;

   If DMAF.cdsQry.RecordCount > 0 Then
   Begin
      ShowMessage('Activo Fijo Ya Fue Depreciado. NO se puede Eliminar');
      Exit;
   End;

   If MessageDlg('¿  Eliminar Registro  ? ' + chr(13) + chr(13)
      + 'Compañía=' + '''' + xxCia + '''' + chr(13)
      + 'Código   =' + '''' + xxAct + '''' + chr(13)
      + 'Activo   =' + '''' + xxAcD + '''' + chr(13)
      + 'Reforma  =' + '''' + xxRef + '''',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   DMAF.cdsActFij.Delete;
   DMAF.cdsActFij.DataRequest('Select * from ACF201');

   DMAF.ControlTran; // graba regs.original/y duplicados si los hay

   // Archivo de Activo Fijo
   xSql := 'Update ACF201 Set ACFIDCOMP='''' '
      + 'Where CIAID=''' + xxCia + ''' and ACFIDCOMP=''' + xxAct + '''';
   DMAF.DCom1.AppServer.EjecutaSQL(xSql);

   // Archivo de C.Costo
   xSql := 'Delete From ACF103 '
      + 'Where CIAID=''' + xxCia + ''' and ACFID=''' + xxAct + '''';
   DMAF.DCom1.AppServer.EjecutaSQL(xSql);

   // Archivo de Depreciacion
   xSql := 'Delete From ACF204 '
      + 'Where CIAID=''' + xxCia + ''' and ACFID=''' + xxAct + ''' and '
      + 'DEPFLAGREF=''' + xxFRe + ''' and ACFREFOR=''' + xxRef + '''';
   DMAF.DCom1.AppServer.EjecutaSQL(xSql);

   // Archivo de Depreciacion Work
   xSql := 'Delete From ACF204W '
      + 'Where CIAID=''' + xxCia + ''' and ACFID=''' + xxAct + ''' and '
      + 'DEPFLAGREF=''' + xxFRe + ''' and ACFREFOR=''' + xxRef + '''';
   DMAF.DCom1.AppServer.EjecutaSQL(xSql);

   DMAF.ActualizaFiltro(Mant2, DMAF.cdsActFij, 'E');

   ShowMessage('Activo Fijo ELIMINADO')
End;

Procedure TFAFMaestros.Mant2Edit(Sender: TObject; MantFields: TFields);
Begin
   If Not DMAF.DCOM1.Connected Then Exit;

   xSQL := 'select * from ACF201 WHERE ARTCODBAR = ' + QuotedStr(MantFields.FieldByName('ARTCODBAR').AsString);
   DMAF.cdsActFij.Close;
   DMAF.cdsActFij.DataRequest(xSQL);
   DMAF.cdsActFij.Open;

   If DMAF.cdsActFij.RecordCount = 0 Then Exit;
   DMAF.wModo := 'M';
// ACF210 FMaestro Maestro de Activos Fijos
   FMaestro := TFMaestro.create(Application); // ACF210
   FMaestro.ActiveMDIChild;
End;

Procedure TFAFMaestros.Mant2Insert(Sender: TObject);
Begin
   If Not DMAF.DCOM1.Connected Then Exit;

   DMAF.wModo := 'A';
   wxSql := 'SELECT * FROM ACF201 WHERE 1<>1';
   DMAF.cdsActFij.Close;
   DMAF.cdsActFij.DataRequest(wxSql);
   DMAF.cdsActFij.Open;
// ACF210 FMaestro Maestro de Activos Fijos
   FMaestro := TFMaestro.Create(Application);
   FMaestro.ActiveMDIChild; // ACF210
End;

Procedure TFAFMaestros.Mant3Delete(Sender: TObject; MantFields: TFields);
Var
   xCia, xTActivo: String;
Begin
   DMAF.cdsTipAct.Data := Mant3.FMant.cds2.Data;
   DMAF.cdsTipAct.GotoCurrent(Mant3.FMant.cds2);

   If DMAF.cdsTipAct.RecordCount = 0 Then Exit;

   xCia := DMAF.cdsTipAct.FieldByname('CiaId').AsString;
   xTActivo := DMAF.cdsTipAct.FieldByname('TAcFId').AsString;

   xSQL := 'Select * From ACF201 Where CIAID=''' + xCia + ''' and '
      + 'TACFID=''' + xTActivo + '''';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName := 'dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.RecordCount > 0 Then
   Begin
      ShowMessage('Tipo de Activo Fijo No Se Puede Eliminar. Ya Fue Usado');
      exit;
   End;

   If MessageDlg('¿  Eliminar Registro  ? ' + chr(13) + chr(13)
      + 'Compañía   =' + '''' + xCia + '''' + chr(13)
      + 'Tipo Activo=' + '''' + xTActivo + '''' + chr(13),
      mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   DMAF.cdsTipAct.Delete;
   DMAF.ControlTran;
   DMAF.ActualizaFiltro(Mant2, DMAF.cdsTipAct, 'E');
End;

Procedure TFAFMaestros.Mant3Edit(Sender: TObject; MantFields: TFields);
Begin
   If Not DMAF.DCOM1.Connected Then Exit;
   DMAF.cdsTipAct.Data := Mant3.FMant.cds2.Data;
   DMAF.cdsTipAct.GotoCurrent(Mant3.FMant.cds2);
   If DMAF.cdsTipAct.RecordCount = 0 Then Exit;
   DMAF.wModo := 'M';
// ACF250 FTActivo Tipos de Activos Fijos
   FTActivo := TFTActivo.create(Application); // ACF250
   FTActivo.ActiveMDIChild;
End;

Procedure TFAFMaestros.Mant3Insert(Sender: TObject);
Begin
   If Not DMAF.DCOM1.Connected Then Exit;

   DMAF.wModo := 'A';
   wxSql := 'SELECT * FROM ACF101 WHERE 1<>1';
   DMAF.cdsTipAct.Close;
   DMAF.cdsTipAct.DataRequest(wxSql);
   DMAF.cdsTipAct.Open;
// ACF250 FTActivo Tipos de Activos Fijos
   FTActivo := TFTActivo.Create(Application);
   FTActivo.ActiveMDIChild; // ACF250
End;

Procedure TFAFMaestros.MantControlOpeDelete(Sender: TObject;
   MantFields: TFields);
Begin
   If Not DMAF.DCOM1.Connected Or (DMAF.wJK = '0') Then Exit;
End;

Procedure TFAFMaestros.MantControlOpeEdit(Sender: TObject;
   MantFields: TFields);
Begin
   If Not (DMAF.DCOM1.Connected) Or (DMAF.wJK = '0') Then Exit;

   DMAF.cdsActFij.Data := MantControlOpe.FMant.cds2.Data;
   DMAF.cdsActFij.GotoCurrent(MantControlOpe.FMant.cds2);
   If DMAF.cdsActFij.RecordCount = 0 Then Exit;
   DMAF.wModo := 'M';
// Control Operativo del Activo
   FAFControlOpe := TFAFControlOpe.create(Application); //  ACF206
   FAFControlOpe.ActiveMDIChild;
End;

Procedure TFAFMaestros.MantControlOpeInsert(Sender: TObject);
Begin
   If Not (DMAF.DCOM1.Connected) Or (DMAF.wJK = '0') Then Exit;

   DMAF.wModo := 'A';
   wxSql := 'SELECT * FROM ACF201 WHERE 1<>1';
   DMAF.cdsActFij.Close;
   DMAF.cdsActFij.DataRequest(wxSql);
   DMAF.cdsActFij.Open;
// Control Operativo del Activo
   FAFControlOpe := TFAFControlOpe.create(Application); //  ACF206

   FAFControlOpe.ActiveMDIChild;
End;

Procedure TFAFMaestros.PanelCreaMant(Sender: TObject);
Begin
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 1;
   pg.Align := alClient;
   pg.Parent := Tmant(Sender).Fmant.pnlBtns;
   pl.AutoSize := true;
   Tmant(Sender).Fmant.pnlBtns.Visible := true;
End;

Procedure AFTiposActivoMant;
Var
   xSQL: String;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160203') Then Exit;
// Fin HPC_201701_ACF

   Screen.Cursor := crHourGlass;
   DMAF.cdsTipAct.Open;
   DMAF.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mant3 := TMant.Create(Application);
   Try
      Mant3.Admin := DMAF.wAdmin;
      Mant3.DComC := DMAF.DCOM1;
      Mant3.Module := DMAF.wModulo;
      Mant3.TableName := 'ACF101';
      Mant3.Titulo := 'Tipos de Activo';
      Mant3.Filter := '';
      Mant3.ClientDataSet := DMAF.cdsTipAct;
      Mant3.OnEdit := FAFMaestros.Mant3Edit;
      Mant3.OnInsert := FAFMaestros.Mant3Insert;
      Mant3.OnDelete := FAFMaestros.Mant3Delete;
      Mant3.SectionName := 'AFTipoAct';
      Mant3.FileNameIni := '\oaAF.INI';
      Mant3.OnCierra := DMAF.DisminuyeForma;
      Mant3.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mant3.Execute;
   Finally
   End;
End;
//// POR CONTROL OPERATIVO

Procedure AFControlOperativoMant;
Var
   xSQL: String;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ACF
// Control de Acceso por Grupo de Usuario
   If Not DMAF.wf_AccesoOpcion('3160201') Then Exit;
// Fin HPC_201701_ACF

   Screen.Cursor := crHourGlass;

   xSQL := 'SELECT * FROM SOLREF WHERE ZARCHIVO=' + quotedstr('VWAFRESUMEN');
   DMAF.cdsVistas.CLose;
   DMAF.cdsVistas.DataRequest(xSQL);
   DMAF.cdsVistas.Open;

   DMAF.wboton := '11';
   DMAF.wCierraCds := '1';

// Inicio HPC_201301_ACF
   xSQL := 'select A.CIAID, A.LOCID, A.TACFID, A.ACFID, A.ACFFLAGREF, A.ACFREFOR, '
      + '       A.ACFFLACOMP, A.ACFDES, A.ACFDESL, A.ACFTIPADQU, A.ESTADOID, '
      + '       A.MATERIALID, A.ACFMARCA, A.ACFMODELO, A.ACFSERIE, A.ACFCOLOR, '
      + '       A.ACFMEDIDA, A.ARTCODBAR, A.PISO, A.AREA, A.AMBCOD, A.UBICID, '
      + '       A.RECIBEID, A.RECIBENOM, A.CCOSID, A.CUENTAID, A.ACFFECADQ, A.PROV, '
      + '       A.DOCID, A.ACFSERIEDO, A.ACFNODOC, A.GARANTIA, A.TMONID, '
      + '       A.ACFCAMBIO, A.ACFVALOMO, A.ACFVALOMN, A.ACFVALOME, A.ACFFECINS, '
      + '       A.ACFFLAGACT, A.TACFVIDA, A.TRAFECHA, A.ACFIDCOMP, A.ACFFINIDEP, A.ACFFECINAC, '
      + '       A.ACFFECRECE, A.FECANOMES, A.DESACID, A.DESANO, A.DESANOMES, A.F_DEPRE, '
      + '       A.F_REPA, A.DESAUTORI, A.ACFEDITA, A.ARTID, A.ACFDESACMO, A.FECANO, '
      + '       A.FECMES, A.FECDIA, A.FECDIASS, A.FECTRIM, A.FECSEM, A.FECSS, A.FECAATRI, '
      + '       A.FECAASEM, A.FECAASS, A.FECMMSS, A.ACFUSER, A.ACFFREG, A.ACFHREG, '
      + '       A.ODCID, A.FECINV, A.OTRTDOC, A.OTRNDOC, A.OCNDOC, A.OCFECHA, A.NINDOC, '
      + '       A.VERI, A.GRADOOP, A.TACFDEPREC, A.FLAGINV, A.ARTCODBAR1, A.ARTCODBAR2, '
      + '       A.ACFDESL1, A.CODIGOBARRA, B.FAPERIODO, C.DEPFECDEPR, C.DEPNETOAJU '
      + '  from ACF201 A, '
      + '       (select CIAID, ARTCODBAR, '
      + '               max(FAPERIODO) FAPERIODO '
      + '          from ACF204 '
      + '        group by CIAID,ARTCODBAR '
      + '        ) B, '
      + '       (select CIAID, ARTCODBAR, FAPERIODO, DEPFECDEPR, DEPNETOAJU '
      + '          from ACF204 '
      + '        ) C '
      + '   where B.CIAID(+)=A.CIAID '
      + '     and B.ARTCODBAR(+)=A.ARTCODBAR '
      + '     and C.CIAID(+)=B.CIAID '
      + '     and C.ARTCODBAR(+)=B.ARTCODBAR '
      + '     and C.FAPERIODO(+)=B.FAPERIODO ';
// Inicio HPC_201801_ACF
// Se implementa debido a que solo debe mostrar Activos o Inactivos      
(*
   xSQL := 'select A.CIAID, A.LOCID, A.TACFID, A.ACFID, A.ACFFLAGREF, A.ACFREFOR, '
      + '       A.ACFFLACOMP, A.ACFDES, A.ACFDESL, A.ACFTIPADQU, A.ESTADOID, '
      + '       A.MATERIALID, A.ACFMARCA, A.ACFMODELO, A.ACFSERIE, A.ACFCOLOR, '
      + '       A.ACFMEDIDA, A.ARTCODBAR, A.PISO, A.AREA, A.AMBCOD, A.UBICID, '
      + '       A.RECIBEID, A.RECIBENOM, A.CCOSID, A.CUENTAID, A.ACFFECADQ, A.PROV, '
      + '       A.DOCID, A.ACFSERIEDO, A.ACFNODOC, A.GARANTIA, A.TMONID, '
      + '       A.ACFCAMBIO, A.ACFVALOMO, A.ACFVALOMN, A.ACFVALOME, A.ACFFECINS, '
      + '       A.ACFFLAGACT, A.TACFVIDA, A.TRAFECHA, A.ACFIDCOMP, A.ACFFINIDEP, A.ACFFECINAC, '
      + '       A.ACFFECRECE, A.FECANOMES, A.DESACID, A.DESANO, A.DESANOMES, A.F_DEPRE, '
      + '       A.F_REPA, A.DESAUTORI, A.ACFEDITA, A.ARTID, A.ACFDESACMO, A.FECANO, '
      + '       A.FECMES, A.FECDIA, A.FECDIASS, A.FECTRIM, A.FECSEM, A.FECSS, A.FECAATRI, '
      + '       A.FECAASEM, A.FECAASS, A.FECMMSS, A.ACFUSER, A.ACFFREG, A.ACFHREG, '
      + '       A.ODCID, A.FECINV, A.OTRTDOC, A.OTRNDOC, A.OCNDOC, A.OCFECHA, A.NINDOC, '
      + '       A.VERI, A.GRADOOP, A.TACFDEPREC, A.FLAGINV, A.ARTCODBAR1, A.ARTCODBAR2, '
      + '       A.ACFDESL1, A.CODIGOBARRA, ''      '' FAPERIODO, A.ACFFINIDEP DEPFECDEPR, 0.00 DEPNETOAJU '
      + '  from ACF201 A '
      + ' Where ACFFLAGACT <>''P'' ';
*)
   xSQL := 'select A.CIAID, A.LOCID, A.TACFID, A.ACFID, A.ACFFLAGREF, A.ACFREFOR, '
      + '       A.ACFFLACOMP, A.ACFDES, A.ACFDESL, A.ACFTIPADQU, A.ESTADOID, '
      + '       A.MATERIALID, A.ACFMARCA, A.ACFMODELO, A.ACFSERIE, A.ACFCOLOR, '
      + '       A.ACFMEDIDA, A.ARTCODBAR, A.PISO, A.AREA, A.AMBCOD, A.UBICID, '
      + '       A.RECIBEID, A.RECIBENOM, A.CCOSID, A.CUENTAID, A.ACFFECADQ, A.PROV, '
      + '       A.DOCID, A.ACFSERIEDO, A.ACFNODOC, A.GARANTIA, A.TMONID, '
      + '       A.ACFCAMBIO, A.ACFVALOMO, A.ACFVALOMN, A.ACFVALOME, A.ACFFECINS, '
      + '       A.ACFFLAGACT, A.TACFVIDA, A.TRAFECHA, A.ACFIDCOMP, A.ACFFINIDEP, A.ACFFECINAC, '
      + '       A.ACFFECRECE, A.FECANOMES, A.DESACID, A.DESANO, A.DESANOMES, CASE WHEN D.DEPACUAJUS > 0 THEN ''SI'' ELSE ''NO'' END F_DEPRE, '
      + '       A.F_REPA, A.DESAUTORI, A.ACFEDITA, A.ARTID, A.ACFDESACMO, A.FECANO, '
      + '       A.FECMES, A.FECDIA, A.FECDIASS, A.FECTRIM, A.FECSEM, A.FECSS, A.FECAATRI, '
      + '       A.FECAASEM, A.FECAASS, A.FECMMSS, A.ACFUSER, A.ACFFREG, A.ACFHREG, '
      + '       A.ODCID, A.FECINV, A.OTRTDOC, A.OTRNDOC, A.OCNDOC, A.OCFECHA, A.NINDOC, '
      + '       A.VERI, A.GRADOOP, A.TACFDEPREC, A.FLAGINV, A.ARTCODBAR1, A.ARTCODBAR2, '
      + '       A.ACFDESL1, A.CODIGOBARRA, D.FAPERIODO, D.DEPFECDEPR, D.DEPNETOAJU, D.DEPACUAJUS '
      + '  from ACF201 A, '
      + '       (select B.CIAID, B.ARTCODBAR, B.FAPERIODO, C.DEPFECDEPR, C.DEPNETOAJU, C.DEPACUAJUS FROM '
      + '       (select CIAID, ARTCODBAR, max(FAPERIODO) FAPERIODO from ACF204 group by CIAID, ARTCODBAR) B, '
      + '       (select CIAID, ARTCODBAR, FAPERIODO, DEPFECDEPR, DEPNETOAJU, DEPACUAJUS FROM ACF204 ) C '
      + '        WHERE B.CIAID = C.CIAID AND B.ARTCODBAR = C.ARTCODBAR AND B.FAPERIODO = C.FAPERIODO  ) D '
      + ' where D.CIAID(+)=A.CIAID '
      + '     and D.ARTCODBAR(+)=A.ARTCODBAR '
      + '     and ACFFLAGACT <>''P'' ' ;

// Fin HPC_201801_ACF
   FToolsControlOpe := TFToolsControlOpe.Create(Application); // ACF780
   DMAF.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   MantControlOpe := TMant.Create(Application);
   Try
      MantControlOpe.Admin := DMAF.wAdmin;
      MantControlOpe.DComC := DMAF.DCOM1;
      MantControlOpe.Module := DMAF.wModulo;
      MantControlOpe.User := DMAF.wUsuario;
      MantControlOpe.TableName := 'ACF201VW';
      MantControlOpe.Tabla2 := 'ACF321';
      MantControlOpe.Tabla2Llave := 'ARTCODBAR';
      MantControlOpe.Titulo := 'Maestro de Activo';
      MantControlOpe.Filter := '';
      MantControlOpe.ClientDataSet := DMAF.cdsActFij;
      pg := FToolsControlOpe.pnlAct;
      MantControlOpe.OnCreateMant := FAFMaestros.PanelCreaMant;
      MantControlOpe.OnEdit := FAFMaestros.MantControlOpeEdit;
      MantControlOpe.OnDelete := FAFMaestros.MantControlOpeDelete;
      MantControlOpe.SectionName := 'AFCONTROLOPE';
      MantControlOpe.FileNameIni := '\oaAF.INI';
      MantControlOpe.OnCierra := DMAF.DisminuyeForma;
      MantControlOpe.NoVisible.Clear;

      MantControlOpe.UsuarioSQL.Add(xSQL);

      Screen.Cursor := crDefault;
      DMAF.wJK := '1';
      MantControlOpe.Execute;
   Finally
   End;
End;

Procedure AFVerificaVersion;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;
   FAFMaestros := TFAFMaestros.Create(Application);
   If DMAF.fg_VerificaVersion(FAFMaestros.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.

