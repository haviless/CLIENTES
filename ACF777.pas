Unit ACF777;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : ACF777
//Formulario               : FCierrePer
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Es la barra de herramientas de la ventana de Control Contable
//                           ubicada en Activos Fijos/Maestros/Control Contable

//Actualizaciones:
//HPC_201110_ACF 25/08/2011: Se adiciona el botón "Depreciación Acum", el cual
//                           lista todos los activos fijos con su depreciación Acumulada
//                           de acuerdo al filtro que se haya ingresado.
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, Mant, DB, ppCache, ppDB, ppDBPipe, ppComm,
   ppRelatv, ppProd, ppClass, ppReport, ppBands, dbclient, DBTables, Wwquery,
   StrContainer, wwdblook, ppParameter, ppCtrls, ppVar,
   ppPrnabl, ppEndUsr;

Type
   TFToolsActivo = Class(TForm)
      pnlAct: TPanel;
      scFile: TStrContainer;
      dblcResumen: TwwDBLookupCombo;
      ppdsgPadron: TppDesigner;
      pprPadron: TppReport;
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
      ppParameterList1: TppParameterList;
      ppdbPadron: TppDBPipeline;
      Z2bbtnMantenimiento: TBitBtn;
      bbtnActualizaDepre: TBitBtn;
      bbtnSeleDepre: TBitBtn;
      Label1: TLabel;
      btnRptDepreciacionAcum: TBitBtn;
      ppdbRptDepreciacionAcum: TppDBPipeline;
      pprRptDepreciacionAcum: TppReport;
      ppdRptDepreciacionAcum: TppDesigner;
      ppParameterList2: TppParameterList;
      ppHeaderBand2: TppHeaderBand;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppFooterBand2: TppFooterBand;
      ppShape1: TppShape;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppLine10: TppLine;
      // Procedure Z2bbtnDetActClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      //Procedure Z2bbtnEnReparacionClick(Sender: TObject);
      //Procedure Z2bbtnGrabarClick(Sender: TObject);
      //Procedure Z2bbtnAlmacenClick(Sender: TObject);
      //Procedure BitBtn1Click(Sender: TObject);
      //Procedure bbtnReformaClick(Sender: TObject);
      Procedure dblcResumenChange(Sender: TObject);
      Procedure Z2bbtnMantenimientoClick(Sender: TObject);
      Procedure bbtnActualizaDepreClick(Sender: TObject);
      Procedure bbtnSeleDepreClick(Sender: TObject);
    //INICIO HPC_201110_ACF
      Procedure btnRptDepreciacionAcumClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    //FIN HPC_201110_ACF
   Private
    { Private declarations }
      Procedure MantComprasEdit(Sender: TObject; MantFields: TFields);
      Procedure MantAlmacenEdit(Sender: TObject; MantFields: TFields);
      Procedure PadronValorizado;
      Procedure PadronValorizadoTAcf;
      Procedure Padron098Especial;
   Public
    { Public declarations }
   End;

Var
   FToolsActivo: TFToolsActivo;
   MantCompras, MantDepre: TMant;
   wSectionAnt, wlbFiltroIni: String;

Implementation

Uses ACFDM, ACF210, oaAF2000, ACF205, ACF783;
//Uses ACFDM, ACF210, ACF293, ACF212, ACF775, oaAF2000, ACF205, ACF783;

{$R *.DFM}

(*
Procedure TFToolsActivo.Z2bbtnDetActClick(Sender: TObject);
Begin
   FToolsDepura := TFToolsDepura.Create(Application); // ACF775
   MantCompras := TMant.Create(Application);
   pg := FToolsDepura.pnlAct;
   MantCompras.OnCreateMant := FAFMaestros.PanelCreaMant;
   MantCompras.Admin := DMAF.wAdmin;
   MantCompras.ClientDataSet := DMAF.cdsCompras;
   MantCompras.Module := DMAF.wModulo;
   MantCompras.DComC := DMAF.DCOM1;
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
   MantCompras.User := DMAF.wUsuario;
   Try
      MantCompras.Execute;
   Finally
   End;
End;
*)

Procedure TFToolsActivo.MantComprasEdit(Sender: TObject; MantFields: TFields);
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

Procedure TFToolsActivo.FormActivate(Sender: TObject);
Begin
   ShowMessage('Activate');
End;

Procedure TFToolsActivo.FormShow(Sender: TObject);
Begin
   ShowMessage('Show');
End;

(*
Procedure TFToolsActivo.Z2bbtnEnReparacionClick(Sender: TObject);
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

(*
Procedure TFToolsActivo.Z2bbtnGrabarClick(Sender: TObject);
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

         xSpace := DMAF.cdsQry.FieldByName('TRABNOMT').Size - Length(DMAF.cdsQry.FieldByName('TRABNOMT').AsString);
         xSpace := 40 - Length(DMAF.cdsQry.FieldByName('RECIBENOM').AsString);
         xCampo := DMAF.cdsQry.FieldByName('TRABNOMT').AsString + Copy(xBlanco, 1, xSpace);
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
*)

(*
Procedure TFToolsActivo.Z2bbtnAlmacenClick(Sender: TObject);
Var
   xSQL: String;
Begin
   FToolsDepura := TFToolsDepura.Create(Application); // ACF775

   // CON ALAMACEN DE ACTIVO FIJO
   {xSQL:='Select A.* from LOG315 A, TGE151 B '
        +'Where A.NISATIP=''SALIDA'' AND A.ALMID=B.ALMID AND B.ALMACTIVOF=''S''';}

   // CON TRANSACCION SALIDA POR ACTIVO
   xSQL := 'Select A.* from LOG315 A, TGE208 B '
      + 'Where A.NISATIP=''SALIDA'' AND A.TRIID=B.TRIID AND B.TRISGT=''S'' AND B.TRINSERIE=''S''';

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      xSQL := xSQL + ' and ( COALESCE(ACFREG,'''')='''' OR ACFREG IS NULL ) ';

   If SRV_D = 'ORACLE' Then
      xSQL := xSQL + ' and ( NVL( ACFREG,'' '')='' '' OR ACFREG IS NULL ) ';

   MantCompras := TMant.Create(Application);
   pg := FToolsDepura.pnlAct;
   MantCompras.OnCreateMant := FAFMaestros.PanelCreaMant;
   MantCompras.Module := DMAF.wModulo;
   MantCompras.Admin := DMAF.wAdmin;
   MantCompras.ClientDataSet := DMAF.cdsCompras;
   MantCompras.DComC := DMAF.DCOM1;
   MantCompras.Registros := 30;
   MantCompras.FileNameIni := '\oaAF.INI';
   {
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      MantCompras.Filter      := 'FNSERIE=''S'' and ( COALESCE(ACFREG,'''')='''' OR ACFREG IS NULL ) ';
   if SRV_D = 'ORACLE' then
      MantCompras.Filter      := 'FNSERIE=''S'' and ( NVL(ACFREG,'''')='''' OR ACFREG IS NULL ) ';
   }
   MantCompras.MultiColorRows := True;
   MantCompras.SectionName := 'AFAlmacen';
   MantCompras.TableName := 'LOG315';
   MantCompras.Titulo := 'Articulos de Almacén No Registrados';
   MantCompras.OnEdit := MantAlmacenEdit;
   MantCompras.UsuarioSQL.Add(xSQL);
   MantCompras.User := DMAF.wUsuario;
   Try
      MantCompras.Execute;
   Finally
   End;
End;
*)

Procedure TFToolsActivo.MantAlmacenEdit(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin

   DMAF.cdsCompras.Data := MantCompras.FMant.cds2.Data;
   DMAF.cdsCompras.GotoCurrent(MantCompras.FMant.cds2);
   If DMAF.cdsCompras.RecordCount = 0 Then Exit;
   If DMAF.cdsCompras.fieldbyname('ACFREG').asstring = 'S' Then
   Begin
      showmessage('Articulo ya fue transferido');
      exit;
   End;
   xSQL := 'Select ACFREG from LOG315 '
      + 'Where CIAID=''' + DMAF.cdsCompras.FieldByname('CIAID').AsString + ''' '
      + 'and LOCID=''' + DMAF.cdsCompras.FieldByname('LOCID').AsString + ''' '
      + 'and TINID=''' + DMAF.cdsCompras.FieldByname('TINID').AsString + ''' '
      + 'and ALMID=''' + DMAF.cdsCompras.FieldByname('ALMID').AsString + ''' '
      + 'and TDAID=''' + DMAF.cdsCompras.FieldByname('TDAID').AsString + ''' '
      + 'and NISAID=''' + DMAF.cdsCompras.FieldByname('NISAID').AsString + '''';
   DMAF.cdsQry.close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;

   DMAF.wModo := 'Z';
   FMaestro := TFMaestro.create(Application); // ACF210
   FMaestro.ActiveMDIChild;
End;

(*
Procedure TFToolsActivo.BitBtn1Click(Sender: TObject);
Begin
   Try
      FTProveedor := TFTProveedor.Create(Self); // ACF293
      FTProveedor.ShowModal;
   Finally
      FTProveedor.Free;
   End;
End;
*)

(*
Procedure TFToolsActivo.bbtnReformaClick(Sender: TObject);
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
*)

Procedure TFToolsActivo.dblcResumenChange(Sender: TObject);
Var
   nv: integer;
   xSQL, xSel, xGroup, wlbFiltro: String;
Begin
   xSel := '';
   xGroup := '';
   oaAF2000.Mant2.UsuarioSQL.Clear;
   oaAF2000.Mant2.NoVisible.Clear;
   //oaAF2000.Mant2.FMant.wTablaVW:='';
   //oaAF2000.Mant2.FMant.wSectionAnt:=Sis002.Mant2.SectionName;
   oaAF2000.Mant2.FMant.cds2.Close;
   oaAF2000.Mant2.FMant.cds2.Filtered := False;
   oaAF2000.Mant2.FMant.cds2.Filter := '';
   oaAF2000.Mant2.FMant.cds2.IndexFieldNames := '';

   If oaAF2000.Mant2.SectionName = 'AFCONTROLOPE' Then
   Begin
      wlbFiltroIni := '';
      For nv := 0 To oaAF2000.Mant2.FMant.lbFiltroReal.Count - 1 Do
      Begin
         wlbFiltroIni := wlbFiltroIni + oaAF2000.Mant2.FMant.lbFiltroReal.items[nv] + ' AND ';
      End;
   End;

   If dblcResumen.Text = 'Resumen x Localidad' Then
   Begin
      xSel := 'Select ACF201.LOCID,B.LOCDES, COUNT(*) CANT, SUM(ACF201.ACFVALOMN) ACFVALOMN '
         + 'from ACF201, ACF120 B  WHERE '
         + 'B.LOCID(+)=ACF201.LOCID AND ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.LOCID, B.LOCDES ';

      oaAF2000.Mant2.NoVisible.Add('CIAID');
      oaAF2000.Mant2.NoVisible.Add('TACFID');
      oaAF2000.Mant2.NoVisible.Add('CIADES');
      oaAF2000.Mant2.NoVisible.Add('TACFDES');
      oaAF2000.Mant2.NoVisible.Add('ACFDES');
      oaAF2000.Mant2.SectionName := 'AFResumenxLocalidad';
   End;

   If dblcResumen.Text = 'Resumen x Localidad / Tipo de Activo' Then
   Begin
      xSel := 'Select ACF201.LOCID,B.LOCDES, ACF201.TACFID, C.TACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201, ACF120 B, ACF101 C WHERE '
         + 'B.LOCID(+)=ACF201.LOCID AND C.TACFID(+)=ACF201.TACFID AND ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.LOCID, B.LOCDES, ACF201.TACFID, C.TACFDES ';

      oaAF2000.Mant2.NoVisible.Add('CIAID');
      oaAF2000.Mant2.NoVisible.Add('CIADES');
      oaAF2000.Mant2.NoVisible.Add('ACFDES');
      oaAF2000.Mant2.SectionName := 'AFResumenxLocalidadTacf';
   End;

   If dblcResumen.Text = 'Resumen x Localidad / Denominación' Then
   Begin
      xSel := 'Select ACF201.LOCID,B.LOCDES, ACF201.ACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201, ACF120 B WHERE '
         + 'B.LOCID(+)=ACF201.LOCID AND ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.LOCID, B.LOCDES, ACF201.ACFDES ';

      oaAF2000.Mant2.NoVisible.Add('CIAID');
      oaAF2000.Mant2.NoVisible.Add('CIADES');
      oaAF2000.Mant2.NoVisible.Add('TACFID');
      oaAF2000.Mant2.NoVisible.Add('TACFDES');
      oaAF2000.Mant2.SectionName := 'AFResumenxLocalidadDenom';
   End;

   If dblcResumen.Text = 'Resumen x Denominación' Then
   Begin
      xSel := 'Select ACF201.ACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201 where ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.ACFDES ';

      oaAF2000.Mant2.NoVisible.Add('CIAID');
      oaAF2000.Mant2.NoVisible.Add('CIADES');
      oaAF2000.Mant2.NoVisible.Add('LOCID');
      oaAF2000.Mant2.NoVisible.Add('LOCDES');
      oaAF2000.Mant2.NoVisible.Add('TACFID');
      oaAF2000.Mant2.NoVisible.Add('TACFDES');
      oaAF2000.Mant2.SectionName := 'AFResumenxDenom';
   End;

   If dblcResumen.Text = 'Resumen x Tipo de Activo' Then
   Begin
      xSel := 'Select ACF201.TACFID,B.TACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201, ACF101 B WHERE '
         + 'B.TACFID(+)=ACF201.TACFID AND ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.TACFID, B.TACFDES ';

      oaAF2000.Mant2.NoVisible.Add('CIAID');
      oaAF2000.Mant2.NoVisible.Add('CIADES');
      oaAF2000.Mant2.NoVisible.Add('ACFDES');
      oaAF2000.Mant2.NoVisible.Add('LOCID');
      oaAF2000.Mant2.NoVisible.Add('LOCDES');
      oaAF2000.Mant2.SectionName := 'AFResumenxTacf';
   End;

   If dblcResumen.Text = 'Resumen x Tipo de Activo / Denominación' Then
   Begin
      xSel := 'Select ACF201.TACFID,B.TACFDES, ACF201.ACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201, ACF101 B WHERE '
         + 'B.TACFID(+)=ACF201.TACFID AND ACF201.LOCID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.TACFID, B.TACFDES, ACF201.ACFDES ';

      oaAF2000.Mant2.NoVisible.Add('CIAID');
      oaAF2000.Mant2.NoVisible.Add('CIADES');
      oaAF2000.Mant2.NoVisible.Add('LOCID');
      oaAF2000.Mant2.NoVisible.Add('LOCDES');
      oaAF2000.Mant2.SectionName := 'AFResumenxTacfDenom';
   End;

   If dblcResumen.Text = 'Resumen x Cia / Tipo de Activo' Then
   Begin
      xSel := 'Select ACF201.CIAID,B.CIADES, ACF201.TACFID, C.TACFDES, COUNT(*) CANT, SUM(ACFVALOMN) ACFVALOMN '
         + 'from ACF201, TGE101 B, ACF101 C WHERE '
         + 'B.CIAID(+)=ACF201.CIAID AND C.TACFID(+)=ACF201.TACFID AND ACF201.CIAID<>' + quotedstr('98');
      xGroup := ' GROUP BY ACF201.CIAID, B.CIADES, ACF201.TACFID, C.TACFDES ';

      oaAF2000.Mant2.NoVisible.Add('ACFDES');
      oaAF2000.Mant2.NoVisible.Add('LOCID');
      oaAF2000.Mant2.NoVisible.Add('LOCDES');
      oaAF2000.Mant2.SectionName := 'AFResumenxCiaTacf';
   End;

   DMAF.wJK := '0'; // '1' habilita, '0' deshabilita - el onEdit y onInsert del Mant2.
//////////aqui me quede - controlar filtro entre sesiones
{   wlbFiltro:='';
   for nv:=0 to oaAF2000.Mant2.FMant.lbFiltroReal.Count-1 do
   begin
       wlbFiltro:=wlbFiltro+oaAF2000.Mant2.FMant.lbFiltroReal.items[nv]+' AND ';
   end;
}

   wlbFiltro := wlbFiltroIni;
   If length(wlbFiltro) = 0 Then
      xSQL := xSel + xGroup
   Else
      xSQL := xSel + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5) + xGroup;

   //oaAF2000.Mant2.FMant.wTablaVW:='ACF201';
   oaAF2000.Mant2.FMant.wTabla := 'VWAFRESUMEN';

   ///////////////////////////////////////////////////////////////////////////////////
   // SOLO CONSULTA POR PPREPORT
   If dblcResumen.Text = 'Padron' Then // por emision del Padron de Inventario
   Begin
      DMAF.wJK := '1';
      xSel := 'Select * FROM ACF201';

      xSel := 'Select (ACF201.LOCID||ACF201.PISO||ACF201.AREA) GRUPO1,ACF201.LOCID LOCAL,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,'
         + '       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
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
         xSQL := xSel + ' AND ' + wlbFiltro;

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

//      oaAF2000.Mant2.FMant.wTabla:='FLINVTFIN';
//      oaAF2000.Mant2.FMant.wSection:='AFCONTROLOPE';
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
      oaAF2000.Mant2.FMant.wTabla := 'ACF201';
      //oaAF2000.Mant2.FMant.wTablaVW:='';
      oaAF2000.Mant2.SectionName := 'AFCONTROLOPE';
      //oaAF2000.Mant2.FMant.wSection:='AFCONTROLOPE';
      //oaAF2000.Mant2.FMant.wSectionAnt:=oaAF2000.Mant2.SectionName;
   End;
   //////////////////////////////////////////////////////////////////////////////////
   If (dblcResumen.Text <> 'Padron') And (dblcResumen.Text <> 'Padron Valorizado') Then
   Begin
      oaAF2000.Mant2.UsuarioSQL.Add(XSQL);
      oaAF2000.Mant2.NewQuery;
   End;
End;

Procedure TFToolsActivo.Padron098Especial;
Var
   nv: integer;
   xSQL, xSel, xGroup, wlbFiltro, wlbOrden: String;
Begin
//////// para especiales artcodbar like '098%'
   xSel := 'Select (ACF201.LOCID||ACF201.PISO||ACF201.AREA) GRUPO1,(ACF201.LOCID||ACF201.PISO||ACF201.AREA||ACF201.AMBCOD) GRUPO2,ACF201.CIAID, ACF201.CIAID CIADES, '
      + '       ACF201.TACFID TACF, F.TACFDES, ACF201.LOCID LOCAL,B.LOCDES,ACF201.PISO,ACF201.AREA,D.AREADES,'
      + '       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
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
      + '(ACF201.TACFID=F.TACFID(+)) AND '
      + '((ACF201.ARTCODBAR>=''023330'' AND ARTCODBAR<=''024000'' ) OR '
      + '(ACF201.ARTCODBAR LIKE ''098%'' )) '; //ORDER BY ACF201.ACFDES, ACF201.ARTCODBAR ';

   wlbFiltro := '';
   For nv := 0 To oaAF2000.Mant2.FMant.lbFiltroReal.Count - 1 Do
   Begin
      wlbFiltro := wlbFiltro + oaAF2000.Mant2.FMant.lbFiltroReal.items[nv] + ' AND ';
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

Procedure TFToolsActivo.PadronValorizado;
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
      + '       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
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
   For nv := 0 To oaAF2000.Mant2.FMant.lbFiltroReal.Count - 1 Do
   Begin
      If Pos('ACF201.', oaAF2000.Mant2.FMant.lbFiltroReal.items[nv]) = 0 Then
         wAlias := 'ACF201.'
      Else
         wAlias := '';
      wlbFiltro := wlbFiltro + wAlias + oaAF2000.Mant2.FMant.lbFiltroReal.items[nv] + ' AND ';
      pLabel := TppLabel.Create(FToolsActivo);
      pLabel.Band := ppHeaderBand1;
      pLabel.Name := 'plblTitFecha' + inttostr(nv);
          // esta fecha proviene del filtro que selecciono el usuario
          //pLabel.Caption:=oaAF2000.Mant2.FMant.wTitFecha;
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
      for nv:=0 to oaAF2000.Mant2.FMant.lbOrdenReal.Count-1 do
      begin
          wlbOrden:=wlbOrden+oaAF2000.Mant2.FMant.lbOrdenReal.items[nv]+', ';
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

Procedure TFToolsActivo.PadronValorizadoTAcf;
Var
   nv: integer;
   xSQL, xSel, xGroup, wlbFiltro, wlbOrden: String;
Begin
// Padron Detalle x Cia y Tipo de Activo valorizado
   xSEL := 'Select ACF201.CIAID, F.CIADES, ACF201.TACFID TACF, G.TACFDES, ACF201.LOCID LOCAL,B.LOCDES,'' '' BLOQUE,ACF201.PISO,ACF201.AREA,D.AREADES,'
      + '       ACF201.AMBCOD AMBIENTE,E.AMBDES,ACF201.ARTCODBAR CODBARRAS,ACF201.ACFDES DENOMINACI,ACF201.ESTADOID ESTADO,'
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
   For nv := 0 To oaAF2000.Mant2.FMant.lbFiltroReal.Count - 1 Do
   Begin
      wlbFiltro := wlbFiltro + oaAF2000.Mant2.FMant.lbFiltroReal.items[nv] + ' AND ';
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

Procedure TFToolsActivo.Z2bbtnMantenimientoClick(Sender: TObject);
Begin
   FToolsDepreciacion := TFToolsDepreciacion.Create(Application); // ACF783

   xSQL := 'Select * from ACF204 '; // ORDER BY ARTCODBAR, DEPFECHA';

   MantDepre := TMant.Create(Application);
   pg := FToolsDepreciacion.pnlDepreciacion;
   MantDepre.OnCreateMant := FAFMaestros.PanelCreaMant;
   MantDepre.User := DMAF.wUsuario;
   MantDepre.Module := DMAF.wModulo;
   MantDepre.Admin := DMAF.wAdmin;
   MantDepre.TableName := 'ACF204';
   MantDepre.ClientDataSet := DMAF.cdsDepre;
   MantDepre.DComC := DMAF.DCOM1;
   MantDepre.Registros := 30;
   MantDepre.FileNameIni := '\oaAF.INI';
   MantDepre.MultiColorRows := False;
   MantDepre.SectionName := 'AFDepreciacion';
   MantDepre.Titulo := 'Depreciacion';
   MantDepre.OnInsert := Nil;
   MantDepre.OnEdit := Nil;
   //MantDepre.OnCierra       := DMAF.DisminuyeForma;
   DMAF.wJK := '1';
   MantDepre.UsuarioSQL.Add(xSQL);
   Try
      MantDepre.Execute;
   Finally
   End;
End;

Procedure TFToolsActivo.bbtnActualizaDepreClick(Sender: TObject);
Var
   xSQL, wlbFiltro, wAlias, sFecHasta: String;
   nv: integer;
Begin
   xSQL := 'SELECT FAPERIODO, FAFECDEPRE FROM ACF102 WHERE FAPROC=''P'' ORDER BY FAPERIODO DESC';
   DMAF.cdsQry.Close;
   //DMAF.cdsQry.ProviderName:='prvCNT';
   DMAF.cdsQry.ProviderName := 'dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   sFecHasta := DMAF.cdsQry.FieldByname('FAFECDEPRE').AsString;

   xSQL := 'SELECT * FROM ACF102 WHERE FAPROC=''X'' ';
   DMAF.cdsFactor.Close;
   DMAF.cdsFactor.DataRequest(xSQL);
   DMAF.cdsFactor.Open;

   wlbFiltro := '';
   For nv := 0 To oaAF2000.Mant2.FMant.lbFiltroReal.Count - 1 Do
   Begin
//       wAlias:=oaAF2000.Mant2.FMant.wTabla+'.';
      wlbFiltro := wlbFiltro + oaAF2000.Mant2.FMant.lbFiltroReal.items[nv] + ' AND ';
   End;

   xSQL := 'UPDATE ACF201 SET ACFFINIDEP=' + quotedstr(DMAF.cdsFactor.FieldbyName('FAFECDEPRE').AsString)
      + ' WHERE NOT EXISTS(SELECT ARTCODBAR FROM ACF204 WHERE ARTCODBAR=ACF201.ARTCODBAR) '
      + ' AND ACF201.ACFFLAGACT=''A'' AND ACF201.VERI=''S'' AND EXISTS(SELECT TACFID FROM ACF101  '
      + ' WHERE ACF101.TACFID=ACF201.TACFID AND TACFDEPREC<>0) '
      + ' AND (ACFVALOMN IS NOT NULL AND ACFVALOMN>0) and ACFFECADQ<=''' + sFecHasta + ''' ';

   If length(wlbFiltro) > 0 Then
      xSQL := xSQL + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5);

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Execute;
End;

Procedure TFToolsActivo.bbtnSeleDepreClick(Sender: TObject);
Var
   xSQL, sFecHasta: String;
Begin
   xSQL := 'SELECT FAPERIODO, FAFECDEPRE FROM ACF102 WHERE FAPROC=''P'' ORDER BY FAPERIODO DESC';
   DMAF.cdsQry.Close;
  //DMAF.cdsQry.ProviderName:='prvCNT';
   DMAF.cdsQry.ProviderName := 'dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;

   sFecHasta := DMAF.cdsQry.FieldByname('FAFECDEPRE').AsString;

   xSQL := 'SELECT * FROM ACF201 WHERE NOT EXISTS(SELECT ARTCODBAR FROM ACF204 WHERE ARTCODBAR=ACF201.ARTCODBAR) '
      + 'AND ACF201.ACFFLAGACT=''A'' AND ACF201.VERI=''S'' AND EXISTS(SELECT TACFID FROM ACF101  '
      + 'WHERE ACF101.TACFID=ACF201.TACFID '
      + 'AND TACFDEPREC<>0) and ACFFECADQ<=''' + sFecHasta + ''' ';
   oaAF2000.Mant2.UsuarioSQL.Clear;
   oaAF2000.Mant2.NoVisible.Clear;
   oaAF2000.Mant2.FMant.wTabla := 'ACF201';
  //oaAF2000.Mant2.FMant.wTablaVW:='';
   oaAF2000.Mant2.SectionName := 'AFMAESTRO';
  //oaAF2000.Mant2.FMant.wSection:='AFMAESTRO';
   oaAF2000.Mant2.UsuarioSQL.Add(XSQL);
   oaAF2000.Mant2.NewQuery;
End;
//INICIO HPC_201110_ACF

Procedure TFToolsActivo.btnRptDepreciacionAcumClick(Sender: TObject);
Var
   xSQL, xsFiltro: String;
   xnContador: integer;
Begin
   xsFiltro := '';
   For xnContador := 0 To Mant2.FMant.lbFiltroReal.Count - 1 Do
   Begin
      If length(trim(xsFiltro)) = 0 Then
         xsFiltro := Mant2.FMant.lbFiltroReal.items[xnContador]
      Else
         xsFiltro := xsFiltro + ' and ' + Mant2.FMant.lbFiltroReal.items[xnContador];
   End;
   If length(trim(xsFiltro)) > 0 Then
   Begin
      xsFiltro := ' AND ' + xsFiltro;
   End;
   xSQL := 'SELECT ACF201.CIAID, ACF201.CODIGOBARRA, ' +
      'ACF201.ACFDES, ACF201.LOCID, ' +
      'ACF201.UBICID, ACF201.PISO, ' +
      'ACF201.AREA, ACF201.AMBCOD, ' +
      'ACF201.ACFFLAGACT, ' +
      'ACF201.CUENTAID, ' +
      'ACF201.ACFFECADQ, ACF201.ACFFREG, ACF201.TMONID, ACF201.ACFVALOMO , ' +
      'ACFDEPRE.DEPVALHIST MONTO_ACTIVOHISTORICO, ' +
      'ACFDEPRE.DEPACUHIST MONTO_ACUMDEPRECIACION, ' +
      'ACFDEPRE.DEPFECHA FECHA_ULTDEPRECIACION, ' +
      'ACFDEPRE.DEPIMPHIST MONTO_DEPRECIACION, ' +
      QuotedStr(DMAF.wUsuario) + ' USUARIO_IMPRIME ' +
      'FROM ACF201 , (SELECT ACF204.ARTCODBAR, ACF204.DEPVALHIST , ACF204.DEPACUHIST , ' +
      'ACF204.DEPFECHA , ACF204.DEPIMPHIST ' +
      'FROM ACF204 , (SELECT ACF204.ARTCODBAR, MAX(ACF204.DEPFECHA) FECHAMAX ' +
      'FROM ACF204   GROUP BY ACF204.ARTCODBAR) ACF204_MAX ' +
      'WHERE ACF204.ARTCODBAR = ACF204_MAX.ARTCODBAR ' +
      'AND ACF204.DEPFECHA = ACF204_MAX.FECHAMAX  ) ACFDEPRE ' +
      'WHERE ACF201.ARTCODBAR = ACFDEPRE.ARTCODBAR(+) ' + xsFiltro;

   DMAF.cdsQry10.Close;
   DMAF.cdsQry10.DataRequest(xSQL);
   DMAF.cdsQry10.Open;

   ppdbRptDepreciacionAcum.DataSource := DMAF.dsQry10;
   pprRptDepreciacionAcum.DataPipeline := ppdbRptDepreciacionAcum;
   pprRptDepreciacionAcum.Template.FileName := wRutaRpt + 'ACF\DEMA\ActivosDepreciacionAcum.rtm';

   pprRptDepreciacionAcum.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppdRptDepreciacionAcum.Report := pprRptDepreciacionAcum ;
   //ppdRptDepreciacionAcum.ShowModal() ;
   pprRptDepreciacionAcum.Print;
End;

Procedure TFToolsActivo.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMAF.cdsQry10.Close;
End;
//FIN HPC_201110_ACF
End.

