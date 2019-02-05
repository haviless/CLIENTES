Unit ACF780;
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201107_ACF
// FECHA DE MODIF.  : 13/05/2011
// DESCRIPCION      : Se cambia el campo origen de ACF201.ARTCODBAR a ACF201.CODIGOBARRA
//                    en todas las consultas
//********************************************************
//HPC_201402_ACF    : Al momento de marcar los activos para generar su denominacion;
//                    Se cambia la condición del If a ESTADOID<>'S'

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, Mant, DB, ppCache, ppDB, ppDBPipe, ppComm,
   ppRelatv, ppProd, ppClass, ppBands, ppReport, ppEndUsr, StrContainer,
   wwdblook, DBclient, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
   ppCtrls, ppVar, ppPrnabl, ppParameter;

Type
   TFToolsControlOpe = Class(TForm)
      pnlAct: TPanel;
      Z2bbtnAlmacen: TBitBtn;
      scFile: TStrContainer;
      Z2bbtnMantenimiento: TBitBtn;
      dblcResumen: TwwDBLookupCombo;
      ppdsgPadron: TppDesigner;
      pprPadron: TppReport;
      ppdbPadron: TppDBPipeline;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel23: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel20: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel11: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText3: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText9: TppDBText;
      ppDBText18: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppLabel10: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppLine2: TppLine;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppLabel3: TppLabel;
      ppDBText4: TppDBText;
      ppLabel4: TppLabel;
      ppDBText16: TppDBText;
      ppLabel19: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel21: TppLabel;
      ppDBText17: TppDBText;
      ppLabel9: TppLabel;
      ppLine1: TppLine;
      ppLabel22: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppLabel5: TppLabel;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppGroupFooterBand2: TppGroupFooterBand;
    bbtnDatosDeprec: TBitBtn;
      //Procedure Z2bbtnDetActClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      //Procedure Z2bbtnEnReparacionClick(Sender: TObject);
      Procedure Z2bbtnGrabarClick(Sender: TObject);
      Procedure Z2bbtnAlmacenClick(Sender: TObject);
      // Procedure BitBtn1Click(Sender: TObject);
      Procedure bbtnReformaClick(Sender: TObject);
      //Procedure Z2bbtnContableClick(Sender: TObject);
      Procedure z2bbtnOperativoClick(Sender: TObject);
      Procedure MantTrasladosEdit(Sender: TObject; MantFields: TFields);
      Procedure MantTrasladosInsert(Sender: TObject);
      Procedure dblcResumenChange(Sender: TObject);
      Procedure ppLabel11Print(Sender: TObject);

 // Inicio HPC_201301_ACF
      Procedure bbtnDatosDeprecClick(Sender: TObject);
 // Fin HPC_201301_ACF

   Private
    { Private declarations }
      wxSql: String;
      Procedure MantComprasEdit(Sender: TObject; MantFields: TFields);
      Procedure MantAlmacenEdit(Sender: TObject; MantFields: TFields);
      Procedure PadronValorizado;
      Procedure PadronValorizadoTAcf;
      Procedure Padron098Especial;
      Procedure UsuarioDelBien;
//    procedure MantAlmacenEdit(Sender: TObject; MantFields: TFields);
//    procedure MantTrasladosInsert(Sender: TObject);
//    procedure MantTrasladosEdit(Sender: TObject; MantFields: TFields);
   Public { Public declarations }
//    procedure MantTrasladosEdit(Sender: TObject; MantFields: TFields);
//    procedure MantTrasladosInsert(Sender: TObject);
   End;

Var
   FToolsControlOpe: TFToolsControlOpe;
   MantCompras, MantTraslados: TMant;
   wSectionAnt, wlbFiltroIni: String;
Implementation

//uses ACFDM, ACF001, ACF210, ACF212, ACF775, ACF293;
Uses ACFDM, ACF210, ACF781, ACF782, oaAF2000, ACF205;

{$R *.DFM}

(*
Procedure TFToolsControlOpe.Z2bbtnDetActClick(Sender: TObject);
Begin
   FToolsParaActivos := TFToolsParaActivos.Create(Application); // ACF781
   MantCompras := TMant.Create(Application);
   pg := FToolsParaActivos.pnlAct;
   MantCompras.OnCreateMant := FAFMaestros.PanelCreaMant;
   MantCompras.Admin := DMAF.wAdmin;
   MantCompras.ClientDataSet := DMAF.cdsCompras;
   MantCompras.Module := DMAF.wModulo;
   MantCompras.DCOMC := DMAF.DCOM1;
   MantCompras.FileNameIni := '\oaAF.INI';
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      MantCompras.Filter := 'TIPOADQ=''A'' and ( COALESCE(ACFREG,'''')='''' or ACFREG is NULL ) ';
   If SRV_D = 'ORACLE' Then
      MantCompras.Filter := 'TIPOADQ=''A'' and ( NVL(ACFREG,'''')='''' or ACFREG is NULL ) ';
   MantCompras.SectionName := 'AFCompras';
   MantCompras.TableName := 'LOG305';
   MantCompras.Titulo := 'Activos Fijos No Registrados';
   MantCompras.FileNameIni := '\oaAF.INI';
   MantCompras.OnEdit := MantComprasEdit;
   MantCompras.OnCierra := Nil; //DMAF.DisminuyeForma;
   MantCompras.User := DMAF.wUsuario;
   Try
      MantCompras.Execute;
   Finally
   End;
End;
*)
Procedure TFToolsControlOpe.MantComprasEdit(Sender: TObject; MantFields: TFields);
Begin

   DMAF.cdsCompras.Data := MantCompras.FMant.cds2.Data;
   DMAF.cdsCompras.GotoCurrent(MantCompras.FMant.cds2);
   If DMAF.cdsCompras.RecordCount = 0 Then Exit;
   If DMAF.cdsCompras.fieldbyname('ACFREG').asstring = 'S' Then
   Begin
      showmessage('Activo ya fue transferido');
      exit;
   End;

   DMAF.wModo := 'X';
   FMaestro := TFMaestro.create(Application); // ACF210
   FMaestro.ActiveMDIChild;
End;

Procedure TFToolsControlOpe.FormActivate(Sender: TObject);
Begin
   ShowMessage('Activate');
End;

Procedure TFToolsControlOpe.FormShow(Sender: TObject);
Begin
   ShowMessage('Show');
End;

(*
Procedure TFToolsControlOpe.Z2bbtnEnReparacionClick(Sender: TObject);
Begin
   Try
      FGuiaR := TFGuiaR.Create(Self); // ACF212
      FGuiaR.ShowModal;
   Finally
      FGuiaR.Free;
      DMAF.cdsQry.Close;
   End;
End;
*)

Procedure TFToolsControlOpe.Z2bbtnGrabarClick(Sender: TObject);
Var
   xLinea, xCampo, xBlanco, xUsuario: String;
   xSpace: Integer;
Begin
   If MessageDlg('Seguro de Tranferir Archivos', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin

      Screen.Cursor := crHourGlass;

      xBlanco := '                                                            ';
      xSpace := 0;

      DMAF.cdsQry.IndexFieldNames := '';
      DMAF.cdsQry.Close;
//      DMAF.cdsQry.DataRequest( FPrincipal.Mant2.FMant.SQL );
      DMAF.cdsQry.DataRequest(Mant2.FMant.SQL);
      DMAF.cdsQry.Open;

      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      Begin
         xSQL := 'SELECT * FROM ACF202 '
            + 'Where CIAID=''' + DMAF.cdsQry.FieldByName('CIAID').AsString + ''' and '
            + 'COALESCE(F_ULTIMO,'''')=''S'' and '
            + 'COALESCE(FPROVE,'''')<>''S'' '
            + 'Order By CIAID, TACFID, ACFID ';
      End;
      If SRV_D = 'ORACLE' Then
      Begin
         xSQL := 'SELECT * FROM ACF202 '
            + 'Where CIAID=''' + DMAF.cdsQry.FieldByName('CIAID').AsString + ''' and '
            + 'NVL(F_ULTIMO,'''')=''S'' and '
            + 'NVL(FPROVE,'''')<>''S'' '
            + 'Order By CIAID, TACFID, ACFID ';
      End;

      DMAF.cdsTraslado.Close;
      DMAF.cdsTraslado.DataRequest(xSQL);
      DMAF.cdsTraslado.IndexFieldNames := 'CIAID;TACFID;ACFID';
      DMAF.cdsTraslado.Open;

      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xUsuario := '';

         DMAF.cdsTraslado.SetKey;
         DMAF.cdsTraslado.FieldByname('CIAID').Value := DMAF.cdsQry.FieldByname('CIAID').Value;
         DMAF.cdsTraslado.FieldByname('TACFID').Value := DMAF.cdsQry.FieldByname('TACFID').Value;
         DMAF.cdsTraslado.FieldByname('ACFID').Value := DMAF.cdsQry.FieldByname('ACFID').Value;
         If DMAF.cdsTraslado.Gotokey Then
         Begin
            xSpace := 10 - Length(Copy(DMAF.cdsTraslado.FieldByname('RECIBEID').AsString, 1, 10));
            xCampo := Copy(DMAF.cdsTraslado.FieldByname('RECIBEID').AsString, 1, 10) + Copy(xBlanco, 1, xSpace);
            xUsuario := xCampo;

            xSpace := 40 - Length(Copy(DMAF.cdsTraslado.FieldByname('TRARECIBE').AsString, 1, 40));
            xCampo := Copy(DMAF.cdsTraslado.FieldByname('TRARECIBE').AsString, 1, 40) + Copy(xBlanco, 1, xSpace);
            xUsuario := xUsuario + xCampo;
         End;

//         xSpace:=DMAF.cdsQry.FieldByName('ARTCODBAR').Size-Length(DMAF.cdsQry.FieldByName('ARTCODBAR').AsString);
         xCampo := DMAF.cdsQry.FieldByName('ARTCODBAR').AsString;
//         xCampo:=DMAF.cdsQry.FieldByName('ARTCODBAR').AsString+Copy(xBlanco,1,xSpace);
         xLinea := xLinea + xCampo;

         xSpace := DMAF.cdsQry.FieldByName('LOCID').Size - Length(DMAF.cdsQry.FieldByName('LOCID').AsString);
         xCampo := DMAF.cdsQry.FieldByName('LOCID').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         xSpace := DMAF.cdsQry.FieldByName('UBICID').Size - Length(DMAF.cdsQry.FieldByName('UBICID').AsString);
         xCampo := DMAF.cdsQry.FieldByName('UBICID').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         xSpace := DMAF.cdsQry.FieldByName('ACFDES').Size - Length(DMAF.cdsQry.FieldByName('ACFDES').AsString);
         xCampo := DMAF.cdsQry.FieldByName('ACFDES').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         xSpace := 50 - Length(xUsuario);
         xCampo := xUsuario + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         xSpace := DMAF.cdsQry.FieldByName('ACFMARCA').Size - Length(DMAF.cdsQry.FieldByName('ACFMARCA').AsString);
         xCampo := DMAF.cdsQry.FieldByName('ACFMARCA').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         xSpace := DMAF.cdsQry.FieldByName('ACFMODELO').Size - Length(DMAF.cdsQry.FieldByName('ACFMARCA').AsString);
         xCampo := DMAF.cdsQry.FieldByName('ACFMODELO').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         xSpace := DMAF.cdsQry.FieldByName('ACFSERIE').Size - Length(DMAF.cdsQry.FieldByName('ACFSERIE').AsString);
         xCampo := DMAF.cdsQry.FieldByName('ACFSERIE').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         xCampo := Copy(xBlanco, 1, 19);
         xLinea := xLinea + xCampo;

         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\INVENTARIO\BANCO1\ENVIO\FLINVT.TXT');

      DMAF.cdsTraslado.Close;
      DMAF.cdsTraslado.IndexFieldNames := '';

      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select * from TGE117');
      DMAF.cdsQry.IndexFieldNames := 'UBICID';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;

      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xSpace := DMAF.cdsQry.FieldByName('UBICID').Size - Length(DMAF.cdsQry.FieldByName('UBICID').AsString);
         xCampo := DMAF.cdsQry.FieldByName('UBICID').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         xSpace := DMAF.cdsQry.FieldByName('UBICABR').Size - Length(DMAF.cdsQry.FieldByName('UBICABR').AsString);
         xCampo := DMAF.cdsQry.FieldByName('UBICABR').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\INVENTARIO\BANCO1\ENVIO\TBUBIC.TXT');

      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select * from TGE126');
      DMAF.cdsQry.IndexFieldNames := 'LOCID';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;

      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xSpace := DMAF.cdsQry.FieldByName('LOCID').Size - Length(DMAF.cdsQry.FieldByName('LOCID').AsString);
         xSpace := 3 - Length(DMAF.cdsQry.FieldByName('LOCID').AsString);
         xCampo := DMAF.cdsQry.FieldByName('LOCID').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         xSpace := DMAF.cdsQry.FieldByName('LOCDES').Size - Length(DMAF.cdsQry.FieldByName('LOCDES').AsString);
         xCampo := DMAF.cdsQry.FieldByName('LOCDES').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\INVENTARIO\BANCO1\ENVIO\TBLOCA.TXT');

      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select * from ACF207');
      DMAF.cdsQry.IndexFieldNames := 'TRABID';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;

      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xSpace := DMAF.cdsQry.FieldByName('TRABID').Size - Length(DMAF.cdsQry.FieldByName('TRABID').AsString);
         xSpace := 10 - Length(DMAF.cdsQry.FieldByName('TRABID').AsString);
         xCampo := DMAF.cdsQry.FieldByName('TRABID').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;

         xSpace := DMAF.cdsQry.FieldByName('TRABNOM').Size - Length(DMAF.cdsQry.FieldByName('TRABNOM').AsString);
         xSpace := 40 - Length(DMAF.cdsQry.FieldByName('TRABNOM').AsString);
         xCampo := DMAF.cdsQry.FieldByName('TRABNOM').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;
{
         xSpace:=DMAF.cdsQry.FieldByName('CARGO').Size-Length(DMAF.cdsQry.FieldByName('CARGO').AsString);
         xCampo:=DMAF.cdsQry.FieldByName('CARGO').AsString+Copy(xBlanco,1,xSpace);
         xLinea:=xLinea+xCampo;
}
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\INVENTARIO\BANCO1\ENVIO\TBUSUA.TXT');

      Screen.Cursor := CrDefault;

      DMAF.cdsQry.IndexFieldNames := '';

      ShowMessage('Los Archivos fueron copiados al Directorio C:\INVENTARIO\BANCO1\ENVIO');
   End;
End;

Procedure TFToolsControlOpe.Z2bbtnAlmacenClick(Sender: TObject);
Var
   xSQL: String;
Begin
   FToolsParaActivos := TFToolsParaActivos.Create(Application); // ACF781

   // CON ALMACEN DE ACTIVO FIJO
   {xSQL:='Select A.* from LOG315 A, TGE151 B '
        +'Where A.NISATIP=''SALIDA'' AND A.ALMID=B.ALMID AND B.ALMACTIVOF=''S''';}

   // CON TRANSACCION SALIDA POR ACTIVO
//obc 07022005   xSQL:='Select A.* from LOG315 A, TGE208 B '
//        +'Where A.NISATIP=''SALIDA'' AND A.TRIID=B.TRIID AND B.TRISGT=''S'' AND B.TRINSERIE=''S''';

   xSQL := 'Select A.* from LOG332 A '
      + 'Where A.NISIT=''ACEPTADO'' AND (A.ESTADOID<>''X'' AND A.ESTADOID<>''A'' AND A.ESTADOID<>''T'') AND A.ENTREGADO=''N''';

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      xSQL := xSQL + ' AND CODBAR IS NOT NULL ';

   If SRV_D = 'ORACLE' Then
//obc 07022005      xSQL:=xSQL+' and ( NVL( ACFREG,'' '')='' '' OR ACFREG IS NULL ) ';
      xSQL := xSQL + ' AND CODBAR IS NOT NULL ';

   MantCompras := TMant.Create(Application);
   pg := FToolsParaActivos.pnlAct;
   MantCompras.OnCreateMant := FAFMaestros.PanelCreaMant;
   MantCompras.Module := DMAF.wModulo;
   MantCompras.Admin := DMAF.wAdmin;
   MantCompras.TableName := 'LOG332';
//   MantCompras.Filter         := 'NISATIP=''INGRESO'' AND ENTREGADO=''N'' AND CODBAR IS NOT NULL';

   MantCompras.ClientDataSet := DMAF.cdsCompras;
   MantCompras.DCOMC := DMAF.DCOM1;
   MantCompras.Registros := 30;
   MantCompras.FileNameIni := '\oaAF.INI';
   {
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      MantCompras.Filter      := 'FNSERIE=''S'' and ( COALESCE(ACFREG,'''')='''' OR ACFREG IS NULL ) ';
   if SRV_D = 'ORACLE' then
      MantCompras.Filter      := 'FNSERIE=''S'' and ( NVL(ACFREG,'''')='''' OR ACFREG IS NULL ) ';
   }
   MantCompras.MultiColorRows := False;
   MantCompras.SectionName := 'AFAlmacen';
//   MantCompras.TableName      := 'LOG332';
   MantCompras.Titulo := 'Articulos de Almacén No Registrados';
   MantCompras.OnEdit := MantAlmacenEdit;
   MantCompras.OnCierra := Nil; //DMAF.DisminuyeForma;
   MantCompras.UsuarioSQL.Add(xSQL);
   MantCompras.UserCheckB.Add('ESTADOID');
//   MantCompras.fmant.MultiSelect..MultiSelect.:=True;
   MantCompras.User := DMAF.wUsuario;
   Try
      MantCompras.Execute;
   Finally
   End;
End;

Procedure TFToolsControlOpe.MantAlmacenEdit(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
   MantCompras.FMant.cds2.Edit;

  //Inicio HPC_201402_ACF
  {if ( MantCompras.FMant.cds2.FieldByname('ESTADOID').AsString='N') or
     ( MantCompras.FMant.cds2.FieldByname('ESTADOID').AsString='' ) then}
   If MantCompras.FMant.cds2.FieldByname('ESTADOID').AsString <> 'S' Then
  //Final HPC_201402_ACF
   Begin
      MantCompras.FMant.cds2.FieldByname('ESTADOID').AsString := 'S';
      DMAF.AplicaDatos(MantCompras.FMant.cds2, '');
      Exit;
   End;
   If MantCompras.FMant.cds2.FieldByname('ESTADOID').AsString = 'S' Then
   Begin
      MantCompras.FMant.cds2.FieldByname('ESTADOID').AsString := 'N';
      DMAF.AplicaDatos(MantCompras.FMant.cds2, '');
   End;

{   if FVariables.w_AF_Registro then
   begin
      ShowMessage( 'sólo puede accesar a una opción de actualización de Inventarios a la vez');
      Exit;
   end;

   DMAF.cdsCompras.Data:=MantCompras.FMant.cds2.Data;
   DMAF.cdsCompras.GotoCurrent(MantCompras.FMant.cds2);
   if DMAF.cdsCompras.RecordCount=0 then Exit;
   if DMAF.cdsCompras.fieldbyname('ACFREG').asstring='S' then
   begin
      showmessage('Articulo ya fue transferido');
      exit;
   end;
   xSQL:='Select ACFREG from LOG315 '
        +'Where CIAID=''' +DMAF.cdsCompras.FieldByname('CIAID').AsString +''' '
        +  'and LOCID=''' +DMAF.cdsCompras.FieldByname('LOCID').AsString +''' '
        +  'and TINID=''' +DMAF.cdsCompras.FieldByname('TINID').AsString +''' '
        +  'and ALMID=''' +DMAF.cdsCompras.FieldByname('ALMID').AsString +''' '
        +  'and TDAID=''' +DMAF.cdsCompras.FieldByname('TDAID').AsString +''' '
        +  'and NISAID='''+DMAF.cdsCompras.FieldByname('NISAID').AsString+'''';
   DMAF.cdsQry.close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;

   DMAF.wModo:='Z';
   FMaestro := TFMaestro.create(Application);      // ACF210
   FVariables.w_AF_Registro := True;
   FMaestro.ActiveMDIChild;
}
End;

(*
Procedure TFToolsControlOpe.BitBtn1Click(Sender: TObject);
Begin
   Try
      FTProveedor := TFTProveedor.Create(Self); // ACF293
      FTProveedor.ShowModal;
   Finally
      FTProveedor.Free;
   End;
End;
*)

Procedure TFToolsControlOpe.bbtnReformaClick(Sender: TObject);
Var
   xCia, xTAcfid, xAcfid: String;
Begin
   DMAF.cdsActFij.Data := Mant2.FMant.cds2.Data;
   DMAF.cdsActFij.GotoCurrent(Mant2.FMant.cds2);
   If DMAF.cdsActFij.RecordCount = 0 Then Exit;
   DMAF.wModo := 'R';
   FMaestro := TFMaestro.create(Application); // ACF210
   FMaestro.ActiveMDIChild;
End;

(*
Procedure TFToolsControlOpe.Z2bbtnContableClick(Sender: TObject);
Begin
   FToolsControlOpe.Z2bbtnDetAct.Visible := True;
   FToolsControlOpe.Z2bbtnAlmacen.Visible := True;
   FToolsControlOpe.bitbtn1.Visible := True;
   FToolsControlOpe.Z2bbtnEnReparacion.Visible := True;
   FToolsControlOpe.Z2bbtnGrabar.Visible := True;
   FToolsControlOpe.bbtnReforma.Visible := True;
End;
*)

Procedure TFToolsControlOpe.z2bbtnOperativoClick(Sender: TObject);
Begin
   FToolsParaTraslados := TFToolsParaTraslados.Create(Application); // ACF782

   xSQL := 'Select * from ACF320 ';

   MantTraslados := TMant.Create(Application);
   pg := FToolsParaTraslados.pnlTraslados;
   MantTraslados.OnCreateMant := FAFMaestros.PanelCreaMant;
   MantTraslados.Module := DMAF.wModulo;
   MantTraslados.Admin := DMAF.wAdmin;
   MantTraslados.TableName := 'ACF320';
//   MantTraslados.Filter         := 'NISATIP=''INGRESO'' AND ENTREGADO=''N'' AND CODBAR IS NOT NULL';

   MantTraslados.ClientDataSet := DMAF.cdsInvTras;
   MantTraslados.DCOMC := DMAF.DCOM1;
   MantTraslados.Registros := 30;
   MantTraslados.FileNameIni := '\oaAF.INI';
   MantTraslados.Tabla2 := 'ACF321';
   MantTraslados.Tabla2Llave := 'NUMDOC';
   MantTraslados.MultiColorRows := False;
   MantTraslados.SectionName := 'AFTraslados';
   MantTraslados.Titulo := 'Traslados';
   MantTraslados.OnInsert := MantTrasladosInsert;
   MantTraslados.OnEdit := MantTrasladosEdit;
   MantTraslados.OnCierra := Nil; //DMAF.DisminuyeForma;
   DMAF.wJK := '1';
   MantTraslados.UsuarioSQL.Add(xSQL);
//   MantTraslados.UserCheckB.Add('ESTADOID');
//   MantTraslados.fmant.MultiSelect..MultiSelect.:=True;
   MantTraslados.User := DMAF.wUsuario;
   Try
      MantTraslados.Execute;
   Finally
   End;

{   if not DMAF.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   if FVariables.w_AF_Registro then
   begin
      ShowMessage( 'sólo puede accesar a una opción de actualización de Activos Fijos a la vez');
      Exit;
   end;
   FVariables.w_AF_Registro := True;
   FVariables.w_Num_Formas:=FVariables.w_Num_Formas+1;
}
{anterior   DMAF.cdsActFij.Data:=Mant2.FMant.cds2.Data;
   DMAF.cdsActFij.GotoCurrent(Mant2.FMant.cds2);
   if DMAF.cdsActFij.RecordCount=0 then Exit;
   DMAF.wModo:='M';
// Control Operativo del Activo
   FTomaInvAF := TFTomaInvAF.create(Application);      //  ACF205
   FTomaInvAF.ActiveMDIChild;}
End;

Procedure TFToolsControlOpe.MantTrasladosEdit(Sender: TObject;
   MantFields: TFields);
Begin

   DMAF.cdsCabTraslado.Data := MantTraslados.FMant.cds2.Data;
   DMAF.cdsCabTraslado.GotoCurrent(MantTraslados.FMant.cds2);
   If DMAF.cdsCabTraslado.RecordCount = 0 Then Exit;
   DMAF.wModo := 'M';
// Control Operativo del Activo
   FTomaInvAF := TFTomaInvAF.create(Application); //  ACF205
   FTomaInvAF.ShowModal;
End;

Procedure TFToolsControlOpe.MantTrasladosInsert(Sender: TObject);
Begin
   DMAF.wModo := 'A';
   wxSql := 'SELECT * FROM ACF320 WHERE 1<>1';
   DMAF.cdsCabTraslado.Close;
   DMAF.cdsCabTraslado.DataRequest(wxSql);
   DMAF.cdsCabTraslado.Open;
// Control Operativo del Activo
   FTomaInvAF := TFTomaInvAF.create(Application); //  ACF205
   FTomaInvAF.ShowModal;
End;

Procedure TFToolsControlOpe.dblcResumenChange(Sender: TObject);
Var
   nv: integer;
   xSQL, xSel, xGroup, wlbFiltro: String;
Begin
   xSel := '';
   xGroup := '';
   oaAF2000.MantControlOpe.UsuarioSQL.Clear;
   oaAF2000.MantControlOpe.NoVisible.Clear;
   //oaAF2000.MantControlOpe.FMant.wTablaVW:='';
   //oaAF2000.MantControlOpe.FMant.wSectionAnt:=oaAF2000.MantControlOpe.SectionName;
   oaAF2000.MantControlOpe.FMant.cds2.Close;
   oaAF2000.MantControlOpe.FMant.cds2.Filtered := False;
   oaAF2000.MantControlOpe.FMant.cds2.Filter := '';
   oaAF2000.MantControlOpe.FMant.cds2.IndexFieldNames := '';

   If oaAF2000.MantControlOpe.SectionName = 'AFCONTROLOPE' Then
   Begin
      wlbFiltroIni := '';
      For nv := 0 To oaAF2000.MantControlOpe.FMant.lbFiltroReal.Count - 1 Do
      Begin
         wlbFiltroIni := wlbFiltroIni + oaAF2000.MantControlOpe.FMant.lbFiltroReal.items[nv] + ' AND ';
      End;
   End;

   If dblcResumen.Text = 'Resumen x Localidad' Then
   Begin
      xSel := 'Select ACF201.LOCID,B.LOCDES, COUNT(*) CANT, SUM(ACF201.ACFVALOMN) ACFVALOMN '
         + 'from ACF201, ACF120 B  WHERE '
         + 'B.LOCID(+)=ACF201.LOCID AND ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.LOCID, B.LOCDES ';

      oaAF2000.MantControlOpe.NoVisible.Add('CIAID');
      oaAF2000.MantControlOpe.NoVisible.Add('TACFID');
      oaAF2000.MantControlOpe.NoVisible.Add('CIADES');
      oaAF2000.MantControlOpe.NoVisible.Add('TACFDES');
      oaAF2000.MantControlOpe.NoVisible.Add('ACFDES');
      oaAF2000.MantControlOpe.SectionName := 'AFResumenxLocalidad';
   End;

   If dblcResumen.Text = 'Resumen x Localidad / Tipo de Activo' Then
   Begin
      xSel := 'Select ACF201.LOCID,B.LOCDES, ACF201.TACFID, C.TACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201, ACF120 B, ACF101 C WHERE '
         + 'B.LOCID(+)=ACF201.LOCID AND C.TACFID(+)=ACF201.TACFID AND ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.LOCID, B.LOCDES, ACF201.TACFID, C.TACFDES ';

      oaAF2000.MantControlOpe.NoVisible.Add('CIAID');
      oaAF2000.MantControlOpe.NoVisible.Add('CIADES');
      oaAF2000.MantControlOpe.NoVisible.Add('ACFDES');
      oaAF2000.MantControlOpe.SectionName := 'AFResumenxLocalidadTacf';
   End;

   If dblcResumen.Text = 'Resumen x Localidad / Denominación' Then
   Begin
      xSel := 'Select ACF201.LOCID,B.LOCDES, ACF201.ACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201, ACF120 B WHERE '
         + 'B.LOCID(+)=ACF201.LOCID AND ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.LOCID, B.LOCDES, ACF201.ACFDES ';

      oaAF2000.MantControlOpe.NoVisible.Add('CIAID');
      oaAF2000.MantControlOpe.NoVisible.Add('CIADES');
      oaAF2000.MantControlOpe.NoVisible.Add('TACFID');
      oaAF2000.MantControlOpe.NoVisible.Add('TACFDES');
      oaAF2000.MantControlOpe.SectionName := 'AFResumenxLocalidadDenom';
   End;

   If dblcResumen.Text = 'Resumen x Denominación' Then
   Begin
      xSel := 'Select ACF201.ACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201 where ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.ACFDES ';

      oaAF2000.MantControlOpe.NoVisible.Add('CIAID');
      oaAF2000.MantControlOpe.NoVisible.Add('CIADES');
      oaAF2000.MantControlOpe.NoVisible.Add('LOCID');
      oaAF2000.MantControlOpe.NoVisible.Add('LOCDES');
      oaAF2000.MantControlOpe.NoVisible.Add('TACFID');
      oaAF2000.MantControlOpe.NoVisible.Add('TACFDES');
      oaAF2000.MantControlOpe.SectionName := 'AFResumenxDenom';
   End;

   If dblcResumen.Text = 'Resumen x Tipo de Activo' Then
   Begin
      xSel := 'Select ACF201.TACFID,B.TACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201, ACF101 B WHERE '
         + 'B.TACFID(+)=ACF201.TACFID AND ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.TACFID, B.TACFDES ';

      oaAF2000.MantControlOpe.NoVisible.Add('CIAID');
      oaAF2000.MantControlOpe.NoVisible.Add('CIADES');
      oaAF2000.MantControlOpe.NoVisible.Add('ACFDES');
      oaAF2000.MantControlOpe.NoVisible.Add('LOCID');
      oaAF2000.MantControlOpe.NoVisible.Add('LOCDES');
      oaAF2000.MantControlOpe.SectionName := 'AFResumenxTacf';
   End;

   If dblcResumen.Text = 'Resumen x Tipo de Activo / Denominación' Then
   Begin
      xSel := 'Select ACF201.TACFID,B.TACFDES, ACF201.ACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201, ACF101 B WHERE '
         + 'B.TACFID(+)=ACF201.TACFID AND ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.TACFID, B.TACFDES, ACF201.ACFDES ';

      oaAF2000.MantControlOpe.NoVisible.Add('CIAID');
      oaAF2000.MantControlOpe.NoVisible.Add('CIADES');
      oaAF2000.MantControlOpe.NoVisible.Add('LOCID');
      oaAF2000.MantControlOpe.NoVisible.Add('LOCDES');
      oaAF2000.MantControlOpe.SectionName := 'AFResumenxTacfDenom';
   End;

   If dblcResumen.Text = 'Resumen x Cia / Tipo de Activo' Then
   Begin
      xSel := 'Select ACF201.CIAID,B.CIADES, ACF201.TACFID, C.TACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201, TGE101 B, ACF101 C WHERE '
         + 'B.CIAID(+)=ACF201.CIAID AND C.TACFID(+)=ACF201.TACFID AND ACF201.CIAID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.CIAID, B.CIADES, ACF201.TACFID, C.TACFDES ';

      oaAF2000.MantControlOpe.NoVisible.Add('ACFDES');
      oaAF2000.MantControlOpe.NoVisible.Add('LOCID');
      oaAF2000.MantControlOpe.NoVisible.Add('LOCDES');
      oaAF2000.MantControlOpe.SectionName := 'AFResumenxCiaTacf';
   End;

   DMAF.wJK := '0'; // '1' habilita, '0' deshabilita - el onEdit y onInsert del MantControlOpe.
//////////aqui me quede - controlar filtro entre sesiones
{   wlbFiltro:='';
   for nv:=0 to oaAF2000.MantControlOpe.FMant.lbFiltroReal.Count-1 do
   begin
       wlbFiltro:=wlbFiltro+oaAF2000.MantControlOpe.FMant.lbFiltroReal.items[nv]+' AND ';
   end;
}
   wlbFiltro := wlbFiltroIni;
   If length(wlbFiltro) = 0 Then
      xSQL := xSel + xGroup
   Else
      xSQL := xSel + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5) + xGroup;

   //oaAF2000.MantControlOpe.FMant.wTablaVW:='ACF201';
   oaAF2000.MantControlOpe.FMant.wTabla := 'VWAFRESUMEN';

   ///////////////////////////////////////////////////////////////////////////////////
   // SOLO CONSULTA POR PPREPORT
   If dblcResumen.Text = 'Padron' Then // por emision del Padron de Inventario
   Begin
      DMAF.wJK := '1';
      xSel := 'Select * FROM ACF201';

      xSel := 'Select (ACF201.LOCID||ACF201.PISO||ACF201.AREA) GRUPO1,ACF201.LOCID LOCAL,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,'
             //INICIO HPP_201107_ACF
             //+'       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
      + '       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.CODIGOBARRA CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
             //FIN HPP_201107_ACF
      + '       trim(ACF201.ACFDES)||'' ''||trim(ACF201.ACFDESL) DESC_JUNTA, '
         + '       ACF201.MATERIALID MATERIAL,ACF201.ACFDESL,ACF201.ACFMARCA MARCA,'
         + '       ACF201.ACFMODELO MODELO,ACF201.ACFSERIE SERIE,ACF201.ACFMEDIDA DIMENSIONE,'' FLAG, '' VERI,'
         + '       ACF201.RECIBEID RESPONSABL,ACF201.RECIBENOM NOMBRE '
         + 'from ACF201, ACF120 B, ACF121 C, ACF122 D, ACF123 E WHERE '
         + '(ACF201.LOCID=B.LOCID(+)) AND '
         + '(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
         + '(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
         + '(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and ACF201.AMBCOD=E.AMBCOD(+))';

         ////////////////////////////////////////////////////////////////////////////////////////////////
         // desde FLINVTFIN
{         xSel := 'Select (A.LOCAL||A.PISO||A.AREA) GRUPO1,A.LOCAL,B.LOCDES,A.PISO,A.AREA,D.AREADES,'
             +'       A.AMBIENTE,E.AMBDES,A.CODBARRAS,A.DENOMINACI,A.ESTADO,'
             +'       trim(A.DENOMINACI)||'' ''||trim(A.ACFDESL) DESC_JUNTA, '
             +'       A.MATERIAL,A.ACFDESL,A.MARCA,'
             +'       A.MODELO,A.SERIE,A.DIMENSIONE,A.FLAG,A.VERI,'
             +'       A.RESPONSABL,A.NOMBRE '
             +'from FLINVTFIN A, ACF120 B, ACF121 C, ACF122 D, ACF123 E WHERE '
             +'(A.LOCAL=B.LOCID(+)) AND '
             +'(A.LOCAL=C.LOCID(+) and A.PISO=C.PISO(+)) AND '
             +'(A.LOCAL=D.LOCID(+) and A.PISO=D.PISO(+)  AND A.AREA=D.AREA(+)) AND '
             +'(A.LOCAL=E.LOCID(+) and A.PISO=E.PISO(+)  and A.AREA=E.AREA(+) and A.AMBIENTE=E.AMBCOD(+)) AND '
             +'A.LOCAL='+QUOTEDSTR('06');
        }////////////////////////////////////////////////////////////////////////////////////////////////

      If length(wlbFiltro) = 0 Then
         xSQL := xSel
      Else
         xSQL := xSel + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5);

      pprPadron.DataPipeline := Nil;
      ppdbPadron.DataSource := Nil;
      DMAF.cdsQry.Close;
      DMAF.cdsQry.IndexFieldNames := '';
      DMAF.cdsQry.Filter := '';
      DMAF.cdsQry.Filtered := False;
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Open;
      DMAF.cdsQry.IndexFieldNames := 'LOCAL;PISO;AREA;AMBIENTE;CODBARRAS';
      ppdbPadron.DataSource := DMAF.dsQry;
      pprPadron.DataPipeline := ppdbPadron;
      pprPadron.Template.FileName := wRutaRpt + 'ACF\DEMA\PADRONAFxAREA.rtm';
      pprPadron.Template.LoadFromFile;
{      if rgTipoImpresion.ItemIndex=0 then
      begin
         pprPadron.Print;
         pprPadron.Stop;
      end
      else
      begin
       }ppdsgPadron.Report := pprPadron;
      ppdsgPadron.Show;
//      end;

//      oaAF2000.MantControlOpe.FMant.wTabla:='FLINVTFIN';
//      oaAF2000.MantControlOpe.FMant.wSection:='AFCONTROLOPE';
   End;
   //////////////////////////////////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////////////////////////////////
   // SOLO CONSULTA POR PPREPORT
   If dblcResumen.Text = 'Padron Valorizado' Then // por emision del Padron de Inventario  VALORIZADO
   Begin // FORMATO de impresion A4
      DMAF.wJK := '1';
      PadronValorizado;
      Exit;
   End;
   //////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////
   If dblcResumen.Text = 'Padron x T.Activo Valor' Then // por Tipo de Activo
   Begin // FORMATO de impresion A4
      DMAF.wJK := '1';
      PadronValorizadoTAcf;
      Exit;
   End;
   //////////////////////////////////////////////////////////////////////////////////
   If dblcResumen.Text = 'Padron x 098 Especial' Then // Reporte especial artcodbar='098' TEMPORAL
   Begin // FORMATO de impresion A4
      DMAF.wJK := '1';
      Padron098Especial;
      Exit;
   End;

   ///////////////////////////////////////////////////////////////////////////////////
   If dblcResumen.Text = 'Principal' Then // por regresar al grid principal de entrada
   Begin
      DMAF.wJK := '1';
      xSel := 'Select * FROM ACF201';
      If length(wlbFiltro) = 0 Then
         xSQL := xSel
      Else
         xSQL := xSel; //+' WHERE '+copy(wlbFiltro,1,length(wlbFiltro)-5);
      wlbFiltroIni := '';
      oaAF2000.MantControlOpe.FMant.wTabla := 'ACF201';
      //oaAF2000.MantControlOpe.FMant.wTablaVW:='';
      oaAF2000.MantControlOpe.SectionName := 'AFCONTROLOPE';
      //oaAF2000.MantControlOpe.FMant.wSection:='AFCONTROLOPE';
   End;
   //////////////////////////////////////////////////////////////////////////////////
   If (dblcResumen.Text <> 'Padron') And (dblcResumen.Text <> 'Padron Valorizado') Then
   Begin
      oaAF2000.MantControlOpe.UsuarioSQL.Add(XSQL);
      oaAF2000.MantControlOpe.NewQuery;
   End;
End;

Procedure TFToolsControlOpe.PadronValorizado;
Var
   nv: integer;
   xSQL, xSel, xGroup, wlbFiltro, wlbOrden, wAlias: String;
   pLabel: TppLabel;
Begin
      // Relacion de Activos por Tipo de Activo / Local
{      xSel := 'Select (ACF201.LOCID||ACF201.PISO||ACF201.AREA) GRUPO1,(ACF201.TACFID||ACF201.LOCID||ACF201.PISO||ACF201.AREA||ACF201.AMBCOD) GRUPO2,ACF201.CIAID, ACF201.CIAID CIADES, '
                 +'       ACF201.TACFID TACF, F.TACFDES, ACF201.LOCID LOCAL,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,'
                 +'       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
                 +'       trim(ACF201.ACFDES)||'' ''||trim(ACF201.ACFDESL) DESC_JUNTA, '
                 +'       ACF201.MATERIALID MATERIAL,ACF201.ACFDESL,ACF201.ACFMARCA MARCA,'
                 +'       ACF201.ACFMODELO MODELO,ACF201.ACFSERIE SERIE,ACF201.ACFMEDIDA DIMENSIONE,ACF201.CIAID FLAG,ACF201.VERI,'
                 +'       ACF201.RECIBEID RESPONSABL,ACF201.RECIBENOM NOMBRE,ACF201.ACFVALOMN as VSNUS, '
                 +'       0 GRADOOP,0 VALTASUS,0 CONTRL,ACF201.ACFVALOMN TASCN_SOLE, ACF201.ACFFECADQ '
                 +'from ACF201, ACF120 B, ACF121 C, ACF122 D, ACF123 E, ACF101 F WHERE '
                 +'(ACF201.LOCID=B.LOCID(+)) AND '
                 +'(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
                 +'(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
                 +'(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and ACF201.AMBCOD=E.AMBCOD(+)) AND '
                 +'(ACF201.TACFID=F.TACFID(+))';
}
//     Padron Valorizado, sirve tambiene para relaacion de bajas
   xSel := 'Select (ACF201.LOCID||ACF201.PISO||ACF201.AREA) GRUPO1,(ACF201.LOCID||ACF201.PISO||ACF201.AREA||ACF201.AMBCOD) GRUPO2,ACF201.CIAID, ACF201.CIAID CIADES, '
      + '       ACF201.TACFID TACF, F.TACFDES, ACF201.LOCID LOCAL,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,'
                 //INICIO HPP_201107_ACF
                 //+'       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
   + '       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.CODIGOBARRA CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
                 //FIN HPP_201107_ACF
   + '       trim(ACF201.ACFDES)||'' ''||trim(ACF201.ACFDESL) DESC_JUNTA, '
      + '       ACF201.MATERIALID MATERIAL,ACF201.ACFDESL,ACF201.ACFMARCA MARCA,'
      + '       ACF201.ACFMODELO MODELO,ACF201.ACFSERIE SERIE,ACF201.ACFMEDIDA DIMENSIONE,ACF201.CIAID FLAG,ACF201.VERI,'
      + '       ACF201.RECIBEID RESPONSABL,ACF201.RECIBENOM NOMBRE,ACF201.ACFVALOMN as VSNUS, '
      + '       0 GRADOOP,0 VALTASUS,0 CONTRL,ACF201.ACFVALOMN TASCN_SOLE, ACF201.ACFFECADQ '
      + 'from ACF201, ACF120 B, ACF121 C, ACF122 D, ACF123 E, ACF101 F WHERE '
      + '(ACF201.LOCID=B.LOCID(+)) AND '
      + '(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
      + '(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
      + '(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and ACF201.AMBCOD=E.AMBCOD(+)) AND '
      + '(ACF201.TACFID=F.TACFID(+))';

//     Padron CON fECHA DE aDQUISICION PARA LOS ARTCOBAR LIKE '098%'
{      xSel := 'Select (ACF201.LOCID||ACF201.PISO||ACF201.AREA) GRUPO1,(ACF201.LOCID||ACF201.PISO||ACF201.AREA||ACF201.AMBCOD) GRUPO2,ACF201.CIAID, ACF201.CIAID CIADES, '
                 +'       ACF201.TACFID TACF, F.DENOMINACI DESCRIP, ACF201.LOCID LOCAL,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,'
                 +'       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
                 +'       trim(ACF201.ACFDES)||'' ''||trim(ACF201.ACFDESL) DESC_JUNTA, '
                 +'       ACF201.MATERIALID MATERIAL,ACF201.ACFDESL,ACF201.ACFMARCA MARCA,F.ACFDESL ITEM, '
                 +'       ACF201.ACFMODELO MODELO,ACF201.ACFSERIE SERIE,ACF201.ACFMEDIDA DIMENSIONE,ACF201.CIAID FLAG,ACF201.VERI,'
                 +'       ACF201.RECIBEID RESPONSABL,ACF201.RECIBENOM NOMBRE,ACF201.ACFVALOMN as VSNUS, '
                 +'       0 GRADOOP,0 VALTASUS,0 CONTRL,ACF201.ACFVALOMN TASCN_SOLE, ACF201.ACFFECADQ '
                 +'from ACF201, ACF120 B, ACF121 C, ACF122 D, ACF123 E, CUADERNO1 F WHERE '
                 +'(ACF201.LOCID=B.LOCID(+)) AND '
                 +'(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
                 +'(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
                 +'(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and ACF201.AMBCOD=E.AMBCOD(+)) AND '
                 +'(ACF201.ARTCODBAR=F.ARTCODBAR(+))';
}
//     Padron CON fECHA DE aDQUISICION estadoID MALOGRADO
{       xSel := 'Select (ACF201.LOCID||ACF201.PISO||ACF201.AREA) GRUPO1,(ACF201.LOCID||ACF201.PISO||ACF201.AREA||ACF201.AMBCOD) GRUPO2,ACF201.CIAID, ACF201.CIAID CIADES, '
                 +'       ACF201.TACFID TACF, '' '' DESCRIP, ACF201.LOCID LOCAL,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,'
                 +'       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
                 +'       trim(ACF201.ACFDES)||'' ''||trim(ACF201.ACFDESL) DESC_JUNTA, '
                 +'       ACF201.MATERIALID MATERIAL,ACF201.ACFDESL,ACF201.ACFMARCA MARCA, '' '' ITEM, '
                 +'       ACF201.ACFMODELO MODELO,ACF201.ACFSERIE SERIE,ACF201.ACFMEDIDA DIMENSIONE,ACF201.CIAID FLAG,ACF201.VERI,'
                 +'       ACF201.RECIBEID RESPONSABL,ACF201.RECIBENOM NOMBRE,ACF201.ACFVALOMN as VSNUS, '
                 +'       0 GRADOOP,0 VALTASUS,0 CONTRL,ACF201.ACFVALOMN TASCN_SOLE, ACF201.ACFFECADQ '
                 +'from ACF201, ACF120 B, ACF121 C, ACF122 D, ACF123 E WHERE '
                 +'(ACF201.LOCID=B.LOCID(+)) AND '
                 +'(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
                 +'(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
                 +'(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and  '
                 +'ACF201.AMBCOD=E.AMBCOD(+))';
}
         ////////////////////////////////////////////////////////////////////////////////////////////////
         // desde FLINVTFIN
{   xSQL := 'Select A.CIAID, E.CIADES, A.TACF, F.TACFDES, A.LOCAL,B.LOCDES,A.BLOQUE,A.PISO,A.AREA,C.AREADES,'
                 +'       A.AMBIENTE,D.AMBDES,A.CODBARRAS,A.DENOMINACI,A.ESTADO,'
                 +'       trim(A.DENOMINACI)||'' ''||trim(A.ACFDESL) DESC_JUNTA, '
                 +'       A.MATERIAL,A.ACFDESL,A.MARCA,'
                 +'       A.MODELO,A.SERIE,A.DIMENSIONE,A.FLAG,A.VERI,'
                 +'       A.RESPONSABL,A.NOMBRE,A.VSNUS*3.3 as VSNUS,A.GRADOOP,A.VALTASUS,A.CONTRL,A.TASCN_SOLE '
                 +'from FLINVTFIN A '
                 +'left outer join TBCIA  E on (E.CIAID=A.CIAID) '
                 +'left outer join TBTACF F on (F.TACF=A.TACF) '
                 +'left outer join TBLOCA B on (B.LOCID=A.LOCAL) '
                 +'left outer join TBAREA C on (C.LOCID=A.LOCAL and C.BLOQUE=A.BLOQUE and C.PISO=A.PISO and C.AREA=A.AREA) '
                 +'left outer join TBAMBI D on (D.LOCID=A.LOCAL and D.BLOQUE=A.BLOQUE and D.PISO=A.PISO and D.AREA=A.AREA and D.AMBCOD=A.AMBIENTE) '
                 +'where CIAID='+quotedstr(dblcEtCia.Text)+' and LOCAL<>'+quotedstr('98');
         ////////////////////////////////////////////////////////////////////////////////////////////////
      xSel := 'Select ACF201.LOCID,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,ACF201.AMBCOD,E.AMBDES '
                 +'from ACF201, ACF120 B, ACF121 C, ACF122 D, ACF123 E WHERE '
                 +'(ACF201.LOCID=B.LOCID(+)) AND '
                 +'(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
                 +'(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
                 +'(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and ACF201.AMBCOD=E.AMBCOD(+))';
}
   pprPadron.Template.FileName := wRutaRpt + 'ACF\DEMA\PADRONAFXAREATODODEF.rtm';
   pprPadron.template.LoadFromFile;
   wlbFiltro := '';
   wAlias := '';
   For nv := 0 To oaAF2000.MantControlOpe.FMant.lbFiltroReal.Count - 1 Do
   Begin
      If Pos('ACF201.', oaAF2000.MantControlOpe.FMant.lbFiltroReal.items[nv]) = 0 Then
         wAlias := 'ACF201.'
      Else
         wAlias := '';
      wlbFiltro := wlbFiltro + wAlias + oaAF2000.MantControlOpe.FMant.lbFiltroReal.items[nv] + ' AND ';
      pLabel := TppLabel.Create(FToolsControlOpe);
//          pLabel:=TppLabel.Create(oaAF2000.MantControlOpe);
      pLabel.Band := ppHeaderBand1;
      pLabel.Name := 'plblTitFecha' + inttostr(nv);
          // esta fecha proviene del filtro que selecciono el usuario
          //pLabel.Caption:=oaAF2000.MantControlOpe.FMant.wTitFecha;
      pLabel.Caption := 'Fecha de Filtro';
      pLabel.Left := 62.42;
      pLabel.Top := 5.000;
      pLabel.Alignment := taRightJustify;
      pLabel.Transparent := False;
      pLabel.Autosize := True;
      pLabel.Visible := True;
      pLabel.Font.Size := 9;
      pLabel.Font.Name := 'Times New Roman';
   End;

   If length(wlbFiltro) = 0 Then
      xSQL := xSel
   Else
      xSQL := xSel + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5);

{      wlbOrden:='';
      for nv:=0 to oaAF2000.MantControlOpe.FMant.lbOrdenReal.Count-1 do
      begin
          wlbOrden:=wlbOrden+oaAF2000.MantControlOpe.FMant.lbOrdenReal.items[nv]+', ';
      end;

      if length(wlbOrden)=0 then
         xSQL:=xSel
      else
         xSQL:=xSel+' ORDER BY '+copy(wlbOrden,1,length(wlbOrden)-2);
}
//Padron Valorizado
//      xSQL:=xSQL+' ORDER BY ACF201.TACFID,ACF201.ACFDES,ACF201.ARTCODBAR ';
//Tipo de Activo/Local
//        xSQL:=xSQL+' ORDER BY ACF201.TACFID,ACF201.LOCID,ACF201.PISO,ACF201.AREA,ACF201.AMBCOD,ACF201.ARTCODBAR ';
//      xSQL:=xSQL+' GROUP BY ACF201.LOCID,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,ACF201.AMBCOD,E.AMBDES ';

   pprPadron.DataPipeline := Nil;
   ppdbPadron.DataSource := Nil;
   DMAF.cdsQry.Close;
   DMAF.cdsQry.IndexFieldNames := '';
   DMAF.cdsQry.Filter := '';
   DMAF.cdsQry.Filtered := False;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   DMAF.cdsQry.IndexFieldNames := 'LOCAL;PISO;AREA;AMBIENTE;CODBARRAS';
//      DMAF.cdsQry.IndexFieldNames:='TACF;DENOMINACI;CODBARRAS';
   ppdbPadron.DataSource := DMAF.dsQry;
   pprPadron.DataPipeline := ppdbPadron;
//padron valorizado      pprPadron.Template.FileName := wRutaRpt+'ACF\DEMA\PADRONAFXAREATODODEF.rtm';
//      pprPadron.Template.FileName := 'C:\oaEjecuta\RTMS\ACF\DEMA\PADRONAFXLOCALDETALLE.rtm';
//      pprPadron.Template.FileName := 'C:\oaEjecuta\RTMS\ACF\DEMA\PADRONAFXLOCALBAJAS.rtm';
//      pprPadron.Template.FileName := 'C:\oaEjecuta\RTMS\ACF\DEMA\PADRONAFX098CUADERNO.rtm';
//      pprPadron.Template.FileName :='C:\oaEjecuta\RTMS\ACF\DEMA\PADRONXCIATACF.rtm';
   pprPadron.Template.LoadFromFile;
//      if rgTipoImpresion.ItemIndex=0 then
//      begin
//         pprPadron.Print;
//         pprPadron.Stop;
//      end
//      else
//      begin
   ppdsgPadron.Report := pprPadron;
   ppdsgPadron.Show;
//      end;
End;

Procedure TFToolsControlOpe.UsuarioDelBien;
Begin
End;

Procedure TFToolsControlOpe.PadronValorizadoTAcf;
Var
   nv: integer;
   xSQL, xSel, xGroup, wlbFiltro, wlbOrden: String;
Begin
// Padron Detalle x Cia y Tipo de Activo valorizado
   xSEL := 'Select ACF201.CIAID, ACF201.UBICID,F.CIADES, ACF201.TACFID TACF, G.TACFDES, ACF201.LOCID LOCAL,B.LOCDES,'' '' BLOQUE,ACF201.PISO,ACF201.AREA,D.AREADES,'
                 //INICIO HPP_201107_ACF
                 //+'       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
   + '       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.CODIGOBARRA CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
                 //FIN HPP_201107_ACF
   + '       trim(ACF201.ACFDES)||'' ''||trim(ACF201.ACFDESL) DESC_JUNTA, '
      + '       ACF201.MATERIALID MATERIAL,ACF201.ACFDESL,ACF201.ACFMARCA MARCA,'
      + '       ACF201.ACFMODELO MODELO,ACF201.ACFSERIE SERIE,ACF201.ACFMEDIDA DIMENSIONE,'' '' FLAG,ACF201.VERI,'
      + '       ACF201.RECIBEID RESPONSABL,ACF201.RECIBENOM NOMBRE,ACF201.ACFVALOMO as VSNUS,ACF201.GRADOOP,ACF201.ACFVALOMO VALTASUS,'' '' CONTRL,ACF201.ACFVALOMO TASCN_SOLE '
      + 'from ACF201, TGE101 F, ACF101 G, ACF120 B, ACF121 C, ACF122 D, ACF123 E '
      + 'WHERE (ACF201.CIAID=F.CIAID(+)) AND '
      + '(ACF201.TACFID=G.TACFID(+)) AND '
      + '(ACF201.LOCID=B.LOCID(+)) AND '
      + '(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
      + '(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
      + '(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and ACF201.AMBCOD=E.AMBCOD(+))';
   wlbFiltro := '';
   For nv := 0 To oaAF2000.MantControlOpe.FMant.lbFiltroReal.Count - 1 Do
   Begin
      wlbFiltro := wlbFiltro + oaAF2000.MantControlOpe.FMant.lbFiltroReal.items[nv] + ' AND ';
   End;

   If length(wlbFiltro) = 0 Then
      xSQL := xSel
   Else
      xSQL := xSel + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5);

//      xSQL:=xSQL+' ORDER BY ACF201.TACFID,ACF201.ACFDES,ACF201.ARTCODBAR ';
//Tipo de Activo/Local
//        xSQL:=xSQL+' ORDER BY ACF201.TACFID,ACF201.LOCID,ACF201.PISO,ACF201.AREA,ACF201.AMBCOD,ACF201.ARTCODBAR ';
//      xSQL:=xSQL+' GROUP BY ACF201.LOCID,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,ACF201.AMBCOD,E.AMBDES ';

   pprPadron.DataPipeline := Nil;
   ppdbPadron.DataSource := Nil;
   DMAF.cdsQry.Close;
   DMAF.cdsQry.IndexFieldNames := '';
   DMAF.cdsQry.Filter := '';
   DMAF.cdsQry.Filtered := False;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   DMAF.cdsQry.IndexFieldNames := 'TACF;DENOMINACI;CODBARRAS';
   ppdbPadron.DataSource := DMAF.dsQry;
   pprPadron.DataPipeline := ppdbPadron;
   pprPadron.Template.FileName := wRutaRpt + 'ACF\DEMA\PADRONXCIATACF.rtm';
   pprPadron.Template.LoadFromFile;
//      if rgTipoImpresion.ItemIndex=0 then
//      begin
//         pprPadron.Print;
//         pprPadron.Stop;
//      end
//      else
//      begin
   ppdsgPadron.Report := pprPadron;
   ppdsgPadron.Show;
//      end;
End;

Procedure TFToolsControlOpe.Padron098Especial;
Var
   nv: integer;
   xSQL, xSel, xGroup, wlbFiltro, wlbOrden: String;
Begin
//////// para especiales artcodbar like '098%'
{      xSel := 'Select (ACF201.LOCID||ACF201.PISO||ACF201.AREA) GRUPO1,(ACF201.LOCID||ACF201.PISO||ACF201.AREA||ACF201.AMBCOD) GRUPO2,ACF201.CIAID, ACF201.CIAID CIADES, '
                 +'       ACF201.TACFID TACF, F.TACFDES, ACF201.LOCID LOCAL,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,'
                 +'       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
                 +'       trim(ACF201.ACFDES)||'' ''||trim(ACF201.ACFDESL) DESC_JUNTA, '
                 +'       ACF201.MATERIALID MATERIAL,ACF201.ACFDESL,ACF201.ACFMARCA MARCA,'
                 +'       ACF201.ACFMODELO MODELO,ACF201.ACFSERIE SERIE,ACF201.ACFMEDIDA DIMENSIONE,ACF201.CIAID FLAG,ACF201.VERI,'
                 +'       ACF201.RECIBEID RESPONSABL,ACF201.RECIBENOM NOMBRE,ACF201.ACFVALOMN as VSNUS, '
                 +'       0 GRADOOP,0 VALTASUS,0 CONTRL,ACF201.ACFVALOMN TASCN_SOLE, ACF201.ACFFECADQ '
                 +'from ACF201, ACF120 B, ACF121 C, ACF122 D, ACF123 E, ACF101 F WHERE '
                 +'(ACF201.LOCID=B.LOCID(+)) AND '
                 +'(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
                 +'(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
                 +'(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and ACF201.AMBCOD=E.AMBCOD(+)) AND '
                 +'(ACF201.TACFID=F.TACFID(+)) AND '
                 +'((ACF201.ARTCODBAR>=''023330'' AND ARTCODBAR<=''024000'' ) OR '
                 +'(ACF201.ARTCODBAR LIKE ''098%'' )) ';//ORDER BY ACF201.ACFDES, ACF201.ARTCODBAR ';

}
{      xSel := 'Select (ACF201.LOCID||ACF201.PISO||ACF201.AREA) GRUPO1,(ACF201.LOCID||ACF201.PISO||ACF201.AREA||ACF201.AMBCOD) GRUPO2,ACF201.CIAID, ACF201.CIAID CIADES, '
                 +'       ACF201.TACFID TACF, F.TACFDES, ACF201.LOCID LOCAL,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,'
                 +'       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
                 +'       trim(ACF201.ACFDES)||'' ''||trim(ACF201.ACFDESL) DESC_JUNTA, '
                 +'       ACF201.MATERIALID MATERIAL,ACF201.ACFDESL,ACF201.ACFMARCA MARCA,'
                 +'       ACF201.ACFMODELO MODELO,ACF201.ACFSERIE SERIE,ACF201.ACFMEDIDA DIMENSIONE,ACF201.CIAID FLAG,ACF201.VERI,'
                 +'       ACF201.RECIBEID RESPONSABL,ACF201.RECIBENOM NOMBRE,ACF201.ACFVALOMN as VSNUS, '
                 +'       0 GRADOOP,0 VALTASUS,0 CONTRL,ACF201.ACFVALOMN TASCN_SOLE, ACF201.ACFFECADQ, ACF201.ODCID,ACF201.OCNDOC,ACF201.OCFECHA '
                 +'from '
                 +'(SELECT ACFDES FROM ACF201 WHERE ARTCODBAR LIKE ''098%'' GROUP BY ACFDES) X, '
                 +'(SELECT ACFDES FROM ACF201 WHERE (ARTCODBAR>=''023000'' AND ARTCODBAR<=''024000'') GROUP BY ACFDES) Y, '
                 +'ACF201, ACF120 B, ACF121 C, ACF122 D, ACF123 E, ACF101 F WHERE '
                 +'(ACF201.LOCID=B.LOCID(+)) AND '
                 +'(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
                 +'(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
                 +'(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and ACF201.AMBCOD=E.AMBCOD(+)) AND '
                 +'(ACF201.TACFID=F.TACFID(+)) AND '
                 +'((ACF201.ARTCODBAR>=''023000'' AND ACF201.ARTCODBAR<=''024000'' ) OR '
                 +'(ACF201.ARTCODBAR LIKE ''098%'' )) AND '
                 +'X.ACFDES=Y.ACFDES AND ACF201.ACFDES=X.ACFDES '
                 +'AND ((ACF201.ARTCODBAR>=''023000'' AND ACF201.ARTCODBAR<=''024000'') OR (ACF201.ARTCODBAR LIKE ''098%'')) ';
                }//ORDER BY ACF201.ACFDES, ACF201.ARTCODBAR ';
   xSel := 'Select (ACF201.LOCID||ACF201.PISO||ACF201.AREA) GRUPO1,(ACF201.LOCID||ACF201.PISO||ACF201.AREA||ACF201.AMBCOD) GRUPO2,ACF201.CIAID, ACF201.CIAID CIADES, '
      + '       ACF201.TACFID TACF, F.TACFDES, ACF201.LOCID LOCAL,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,'
                 //INICIO HPP_201107_ACF
                 //+'       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
   + '       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.CODIGOBARRA CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
                 //FIN HPP_201107_ACF
   + '       trim(ACF201.ACFDES)||'' ''||trim(ACF201.ACFDESL) DESC_JUNTA, '
      + '       ACF201.MATERIALID MATERIAL,ACF201.ACFDESL,ACF201.ACFMARCA MARCA,'
      + '       ACF201.ACFMODELO MODELO,ACF201.ACFSERIE SERIE,ACF201.ACFMEDIDA DIMENSIONE,ACF201.CIAID FLAG,ACF201.VERI,'
      + '       ACF201.RECIBEID RESPONSABL,ACF201.RECIBENOM NOMBRE,ACF201.ACFVALOMN as VSNUS, '
      + '       0 GRADOOP,0 VALTASUS,0 CONTRL,ACF201.ACFVALOMN TASCN_SOLE, ACF201.ACFFECADQ, ACF201.ODCID,ACF201.OCNDOC,ACF201.OCFECHA '
      + 'from '
      + 'ACF201, ACF120 B, ACF121 C, ACF122 D, ACF123 E, ACF101 F WHERE '
      + '(ACF201.LOCID=B.LOCID(+)) AND '
      + '(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
      + '(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
      + '(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and ACF201.AMBCOD=E.AMBCOD(+)) AND '
      + '(ACF201.TACFID=F.TACFID(+)) ';

   wlbFiltro := '';
   For nv := 0 To oaAF2000.MantControlOpe.FMant.lbFiltroReal.Count - 1 Do
   Begin
      wlbFiltro := wlbFiltro + oaAF2000.MantControlOpe.FMant.lbFiltroReal.items[nv] + ' AND ';
   End;

   If length(wlbFiltro) = 0 Then
      xSQL := xSel
   Else
      xSQL := xSel + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5);

   pprPadron.DataPipeline := Nil;
   ppdbPadron.DataSource := Nil;
   DMAF.cdsQry.Close;
   DMAF.cdsQry.IndexFieldNames := '';
   DMAF.cdsQry.Filter := '';
   DMAF.cdsQry.Filtered := False;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   DMAF.cdsQry.IndexFieldNames := 'DENOMINACI;CODBARRAS';
   ppdbPadron.DataSource := DMAF.dsQry;
   pprPadron.DataPipeline := ppdbPadron;
   pprPadron.Template.FileName := wRutaRpt + 'ACF\DEMA\PADRONAF098ESPECIAL.rtm';
   pprPadron.Template.LoadFromFile;
//      if rgTipoImpresion.ItemIndex=0 then
//      begin
//         pprPadron.Print;
//         pprPadron.Stop;
//      end
//      else
//      begin
   ppdsgPadron.Report := pprPadron;
   ppdsgPadron.Show;
//      end;
End;

Procedure TFToolsControlOpe.ppLabel11Print(Sender: TObject);
Begin
   ppLabel11.Caption := 'xxxxxxxxxxxxxxxxxxx'; //oaAF2000.MantControlOpe.FMant.wTitFecha;
End;

// Inicio HPC_201301_ACF

Procedure TFToolsControlOpe.bbtnDatosDeprecClick(Sender: TObject);
Var
   xSQL: String;
   x: integer;
Begin
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
   MantControlOpe.NoVisible.Clear;
   MantControlOpe.UsuarioSQL.Clear;
   MantControlOpe.UsuarioSQL.Add(xSQL);
   MantControlOpe.NewQuery;
   MantControlOpe.RefreshDisplay;
End;
// Fin HPC_201301_ACF

End.

