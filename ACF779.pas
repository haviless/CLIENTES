Unit ACF779;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl,
   ppDB, ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, myChkBox,
   ppTypes, ppviewr, ppModule, daDatMod, StrContainer, DBCtrls,
   ComCtrls, FileCtrl, wwdblook, ppEndUsr, ppParameter;

Type
   TFToolsInvDet = Class(TForm)
      pnlAct: TPanel;
      Z2bbtnImp2: TBitBtn;
      ppdbInvD: TppDBPipeline;
      pprInvIni: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLabel1: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel2: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppDBText8: TppDBText;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      myCheckBox1: TmyCheckBox;
      ppLine1: TppLine;
      ppLine2: TppLine;
      Z2bbtnOk: TBitBtn;
      pprInvRes: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppLabel18: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppSystemVariable6: TppSystemVariable;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppDetailBand2: TppDetailBand;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppLabel34: TppLabel;
      ppDBText16: TppDBText;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      Z2bbtnEdita: TBitBtn;
      cbOk: TmyCheckBox;
      cbNoOk: TmyCheckBox;
      Z2bbtnInicia: TBitBtn;
      Z2bbtnTxt: TBitBtn;
      scFile: TStrContainer;
      Z2bbtnDeTxt: TBitBtn;
      dblcPalm: TwwDBLookupCombo;
      Label1: TLabel;
      Label2: TLabel;
      cbInformacion: TComboBox;
      Z2bbtnImprime: TBitBtn;
      Z2bbtnImp1: TBitBtn;
      ppdbPadron: TppDBPipeline;
      pprPadron: TppReport;
      ppParameterList1: TppParameterList;
      ppdsgPadron: TppDesigner;
      cbReportes: TComboBox;
      Label3: TLabel;
      Label4: TLabel;
      ppHeaderBand3: TppHeaderBand;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppSystemVariable8: TppSystemVariable;
      ppLabel33: TppLabel;
      ppDBText37: TppDBText;
      ppDBText38: TppDBText;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppFooterBand3: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppLabel37: TppLabel;
      ppDBText32: TppDBText;
      ppLabel38: TppLabel;
      ppDBText33: TppDBText;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      ppDBText34: TppDBText;
      ppLabel51: TppLabel;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppLabel52: TppLabel;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppGroupFooterBand4: TppGroupFooterBand;
      Procedure Z2bbtnImp1Click(Sender: TObject);
      Procedure Z2bbtnImp2Click(Sender: TObject);
      Procedure pprInvIniPreviewFormCreate(Sender: TObject);
      Procedure pprInvResPreviewFormCreate(Sender: TObject);
      Procedure Z2bbtnEditaClick(Sender: TObject);
      Procedure ppDetailBand2BeforePrint(Sender: TObject);
      Procedure Z2bbtnOkClick(Sender: TObject);
      Procedure Z2bbtnIniciaClick(Sender: TObject);
      Procedure Z2bbtnTxtClick(Sender: TObject);
      Procedure Z2bbtnDeTxtClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure cbInformacionChange(Sender: TObject);
      Procedure cbReportesChange(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      Procedure ReportexAmbientes;
      Procedure ReportexCodBarras;
   End;

Var
   FToolsInvDet: TFToolsInvDet;
   wDirTxt, wWhere: String;

Implementation

Uses ACFDM, ACF265, oaAF5000, ACF778;
{$R *.DFM}

Procedure TFToolsInvDet.Z2bbtnImp1Click(Sender: TObject);
Begin
   If DMAF.cdsInvC.FieldByname('InvEstado').AsString = 'Inicial' Then
      Raise Exception.Create('Inventario No se ha Inicializado');

   If DMAF.cdsInvC.FieldByname('InvEstado').AsString = 'Aceptado' Then
      Raise Exception.Create('Inventario Aceptado. No Puede Imprimir');

   pprInvIni.Print;
End;

Procedure TFToolsInvDet.Z2bbtnImp2Click(Sender: TObject);
Begin
   If DMAF.cdsInvC.FieldByname('InvEstado').AsString = 'Inicial' Then
      Raise Exception.Create('Inventario No se ha Inicializado');

   pprInvRes.Print;
End;

Procedure TFToolsInvDet.pprInvIniPreviewFormCreate(Sender: TObject);
Begin
   pprInvIni.PreviewForm.ClientHeight := 560;
   pprInvIni.PreviewForm.ClientWidth := 680;
   TppViewer(pprInvIni.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolsInvDet.pprInvResPreviewFormCreate(Sender: TObject);
Begin
   pprInvRes.PreviewForm.ClientHeight := 560;
   pprInvRes.PreviewForm.ClientWidth := 680;
   TppViewer(pprInvRes.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolsInvDet.Z2bbtnEditaClick(Sender: TObject);
Begin

   If DMAF.cdsInvC.FieldByname('InvEstado').AsString = 'Inicial' Then
      Raise Exception.Create('Inventario No se ha Inicializado');
   If DMAF.cdsInvC.FieldByname('InvEstado').AsString = 'Aceptado' Then
      Raise Exception.Create('Inventario Aceptado. No se Puede Modificar');
   FInvActualiza := TFInvActualiza.Create(Application);
   FInvActualiza.ShowModal; // ACF265
End;

Procedure TFToolsInvDet.ppDetailBand2BeforePrint(Sender: TObject);
Begin
   cbOk.Visible := False;
   cbNoOk.Visible := False;
   If DMAF.cdsInvD.FieldByname('FLAGOK').AsString = 'S' Then cbOk.Visible := True;
   If DMAF.cdsInvD.FieldByname('FLAGOK').AsString = 'C' Then cbOk.Visible := True;
   If DMAF.cdsInvD.FieldByname('FLAGOK').AsString = 'N' Then cbNoOk.Visible := True;
End;

Procedure TFToolsInvDet.Z2bbtnOkClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMAF.cdsInvC.FieldByname('InvEstado').AsString = 'Inicial' Then
      Raise Exception.Create('Inventario No se ha Inicializado');

   If DMAF.cdsInvC.FieldByname('InvEstado').AsString = 'Aceptado' Then
      Raise Exception.Create('Inventario Aceptado. No Puede Volver a Aceptar');

{   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
   xSql:='Select * From ACF302 '
        +'Where CIAID=''' +DMAF.cdsInvC.FieldByname('CiaId').AsString +''' and '
        +      'INVNUM='''+DMAF.cdsInvC.FieldByname('InvNum').AsString+''' and '
        +      'COALESCE(FLAGOK,'''')=''''';
   end;
   if SRV_D = 'ORACLE' then
   begin
   xSql:='Select * From ACF302 '
        +'Where CIAID=''' +DMAF.cdsInvC.FieldByname('CiaId').AsString +''' and '
        +      'INVNUM='''+DMAF.cdsInvC.FieldByname('InvNum').AsString+''' and '
        +      'NVL(FLAGOK,''nulo'')=''nulo''';
   end;
}

   // LO INVENTARIADO
   xSql := ' SELECT * FROM ACF302I WHERE CIAID=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('CIAID').ASSTRING)
      + ' AND INVNUM=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('INVNUM').ASSTRING);
   DMAF.cdsInventario.Close;
   DMAF.cdsInventario.DataRequest(xSql);
   DMAF.cdsInventario.IndexFieldNames := 'ARTCODBAR';
   DMAF.cdsInventario.Open;

//   if DMAF.cdsQry.RecordCount>0 then
//      Raise Exception.Create('Faltan Verficar Activos');

   If MessageDlg('Acepta el Inventario.  ¿ Esta Seguro ?  ',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   Screen.Cursor := crHourGlass;

   DMAF.cdsInventario.First;
   While Not DMAF.cdsInventario.Eof Do
   Begin
         ///////////////////////////////////////////////////////////////////////
         // POR BIENES NUEVOS
         // deben ser valorizados y registrados uno por uno a traves del sistema
         ///////////////////////////////////////////////////////////////////////
      If DMAF.cdsInventario.FieldByname('FLAG').AsString <> 'N' Then
      Begin
         xSQL := 'SELECT * FROM ACF201 WHERE ARTCODBAR=' + quotedstr(DMAF.cdsInventario.FieldByName('ARTCODBAR').AsString);
         DMAF.cdsActFij.Close;
         DMAF.cdsActFij.DataRequest(xSQL);
         DMAF.cdsActFij.Open;
         DMAF.cdsActFij.Edit;
         If (DMAF.cdsInventario.FieldByname('FLAG').AsString = 'T') Or //Trasnferido por bienes OK
            (DMAF.cdsInventario.FieldByname('FLAG').AsString = 'C') Then //Transferido por bienes Modificados
         Begin
            xSQL := 'SELECT * FROM ACF123 WHERE '
               + 'LOCID=' + DMAF.cdsInventario.FieldByName('LOCID').AsString
               + 'and PISO=' + DMAF.cdsInventario.FieldByName('PISO').AsString
               + 'and AREA=' + DMAF.cdsInventario.FieldByName('AREA').AsString
               + 'and AMBCOD=' + DMAF.cdsInventario.FieldByName('AMBCOD').AsString;
            DMAF.cdsQry.Close;
            DMAF.cdsQry.DataRequest(xSQL);
            DMAF.cdsQry.Open;
            DMAF.cdsActFij.FieldByName('LOCID').AsString := DMAF.cdsInventario.FieldByName('LOCID').AsString;
            DMAF.cdsActFij.FieldByName('PISO').AsString := DMAF.cdsInventario.FieldByName('PISO').AsString;
            DMAF.cdsActFij.FieldByName('AREA').AsString := DMAF.cdsInventario.FieldByName('AREA').AsString;
            DMAF.cdsActFij.FieldByName('AMBCOD').AsString := DMAF.cdsInventario.FieldByName('AMBCOD').AsString;
            DMAF.cdsActFij.FieldByName('CIAID').AsString := DMAF.cdsQry.FieldByName('CIAID').AsString;
            DMAF.cdsActFij.FieldByName('UBICID').AsString := DMAF.cdsQry.FieldByName('CIAID').AsString;
         End;

         If (DMAF.cdsInventario.FieldByname('FLAG').AsString = 'M') Or //Bienes Modificados
            (DMAF.cdsInventario.FieldByname('FLAG').AsString = 'C') Then //Transferido por bienes Modificados
         Begin
            DMAF.cdsActFij.FieldByName('ACFDES').AsString := DMAF.cdsInventario.FieldByName('ACFDES').AsString;
            DMAF.cdsActFij.FieldByName('ACFDESL').AsString := DMAF.cdsInventario.FieldByName('ACFDESL').AsString;
            DMAF.cdsActFij.FieldByName('ESTADOID').AsString := DMAF.cdsInventario.FieldByName('ESTADOID').AsString;
            DMAF.cdsActFij.FieldByName('MATERIALID').AsString := DMAF.cdsInventario.FieldByName('MATERIALID').AsString;
            DMAF.cdsActFij.FieldByName('ACFMARCA').AsString := DMAF.cdsInventario.FieldByName('ACFMARCA').AsString;
            DMAF.cdsActFij.FieldByName('ACFMODELO').AsString := DMAF.cdsInventario.FieldByName('ACFMODELO').AsString;
            DMAF.cdsActFij.FieldByName('ACFSERIE').AsString := DMAF.cdsInventario.FieldByName('ACFSERIE').AsString;
            DMAF.cdsActFij.FieldByName('ACFMEDIDA').AsString := DMAF.cdsInventario.FieldByName('ACFMEDIDA').AsString;
         End;
         DMAF.cdsActFij.FieldByName('RECIBEID').AsString := DMAF.cdsInventario.FieldByName('RECIBEID').AsString;
         DMAF.cdsActFij.FieldByName('RECIBENOM').AsString := DMAF.cdsInventario.FieldByName('RECIBENOM').AsString;
         DMAF.cdsActFij.FieldByName('FECINV').AsString := DMAF.cdsInventario.FieldByName('FECHA').AsString;
         DMAF.cdsActFij.FieldByName('VERI').AsString := 'S';
         DMAF.cdsActFij.FieldByName('AcFHReg').Value := Time;
         DMAF.cdsActFij.FieldByName('AcFFReg').Value := Date;
         DMAF.cdsActFij.FieldByName('AcFUser').Value := DMAF.wUsuario;
         DMAF.AplicaDatos(DMAF.cdsActFij, '');
      End;
      DMAF.cdsInventario.Next;
   End;

   // LO ENVIADO
   xSql := ' SELECT * FROM ACF302 WHERE CIAID=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('CIAID').ASSTRING)
      + ' AND INVNUM=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('INVNUM').ASSTRING)
      + ' AND FLAG=''F'' ';
   DMAF.cdsInventario.Close;
   DMAF.cdsInventario.DataRequest(xSQL);
   DMAF.cdsInventario.IndexFieldNames := 'ARTCODBAR';
   DMAF.cdsInventario.Open;
   DMAF.cdsInventario.First;
   While Not DMAF.cdsInventario.Eof Do
   Begin
      xSQL := 'SELECT * FROM ACF201 WHERE ARTCODBAR=' + quotedstr(DMAF.cdsInventario.FieldByName('ARTCODBAR').AsString);
      DMAF.cdsActFij.Close;
      DMAF.cdsActFij.DataRequest(xSQL);
      DMAF.cdsActFij.Open;
      DMAF.cdsActFij.Edit;
      DMAF.cdsActFij.FieldByName('VERI').AsString := 'N'; // NO UBICADO
      DMAF.cdsActFij.FieldByName('AcFHReg').Value := Time;
      DMAF.cdsActFij.FieldByName('AcFFReg').Value := Date;
      DMAF.cdsActFij.FieldByName('AcFUser').Value := DMAF.wUsuario;
      DMAF.AplicaDatos(DMAF.cdsActFij, '');
      DMAF.cdsInventario.Next;
   End;
   DMAF.cdsInventario.Close;
   DMAF.cdsActFij.Close;
   DMAF.cdsQry.Close;
{
      if DMAF.cdsInvD.FieldByname('FlagOk').AsString='C' then begin

         if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         begin
           xSQL:='Insert Into ACF202 '
                +'( CIAID, TACFID, ACFID, TRAFECHA, TRANUBICA, TRANLOCAL, '
                +  'TRANCCOS, UBICID, LOCID, CCOSID, TRAMOTIVO, '
                +  'TRAFREG, TRAHREG, TRAUSER )'
                +'Values ( '
                +''''+DMAF.cdsInvD.fieldbyname('CiaId').AsString +''', '
                +''''+DMAF.cdsInvD.fieldbyname('TACFID').AsString+''', '
                +''''+DMAF.cdsInvD.fieldbyname('ACFID').AsString +''', '
                +''''+FORMATDATETIME('YYYY-MM-DD',DMAF.cdsInvC.FieldByname('InvFecha').Value)+''', '
                +''''+DMAF.cdsInvD.fieldbyname('NewUbic').AsString+''', '
                +''''+DMAF.cdsInvD.fieldbyname('NewLoc').AsString +''', '
                +''''+DMAF.cdsInvD.fieldbyname('NewCCos').AsString+''', '
                +''''+DMAF.cdsInvD.fieldbyname('UBICID').AsString +''', '
                +''''+DMAF.cdsInvD.fieldbyname('LOCID').AsString  +''', '
                +''''+DMAF.cdsInvD.fieldbyname('CCosID').AsString +''', '
                +'''Inventario No.'+DMAF.cdsInvD.fieldbyname('InvNum').AsString+''', '
                +'CURRENT DATE, CURRENT TIME, '''+DMAF.wUsuario+''' )';
         end;

           if SRV_D = 'ORACLE' then
         begin
           xSQL:='Insert Into ACF202 '
                +'( CIAID, TACFID, ACFID, TRAFECHA, TRANUBICA, TRANLOCAL, '
                +  'TRANCCOS, UBICID, LOCID, CCOSID, TRAMOTIVO, '
                +  'TRAFREG, TRAHREG, TRAUSER )'
                +'Values ( '
                +''''+DMAF.cdsInvD.fieldbyname('CiaId').AsString +''', '
                +''''+DMAF.cdsInvD.fieldbyname('TACFID').AsString+''', '
                +''''+DMAF.cdsInvD.fieldbyname('ACFID').AsString +''', '
                +''''+FORMATDATETIME(DMAF.wFormatFecha,DMAF.cdsInvC.FieldByName('InvFecha').Value)+''', '
                +''''+DMAF.cdsInvD.fieldbyname('NewUbic').AsString+''', '
                +''''+DMAF.cdsInvD.fieldbyname('NewLoc').AsString +''', '
                +''''+DMAF.cdsInvD.fieldbyname('NewCCos').AsString+''', '
                +''''+DMAF.cdsInvD.fieldbyname('UBICID').AsString +''', '
                +''''+DMAF.cdsInvD.fieldbyname('LOCID').AsString  +''', '
                +''''+DMAF.cdsInvD.fieldbyname('CCosID').AsString +''', '
                +'''Inventario No.'+DMAF.cdsInvD.fieldbyname('InvNum').AsString+''', '
                +'SYSDATE, SYSDATE, '''+DMAF.wUsuario+''' )';
         end;
         DMAF.cdsQry.Close;
         DMAF.cdsQry.ProviderName:='dspTGE';
         DMAF.cdsQry.DataRequest(xSQL);
         DMAF.cdsQry.Execute;
      end;

      xSQL:='UPDATE ACF201 SET ';
      if Length(DMAF.cdsInvD.FieldByname('NewUbic').AsString)>0 then
         xSQL:=xSQL+'UBICID='''+DMAF.cdsInvD.FieldByname('NewUbic').AsString+''', ';
      if Length(DMAF.cdsInvD.FieldByname('NewLoc').AsString)>0 then
         xSQL:=xSQL+'LOCID='''+DMAF.cdsInvD.FieldByname('NewLoc').AsString+''', ';
      if Length(DMAF.cdsInvD.FieldByname('NewCCos').AsString)>0 then
         xSQL:=xSQL+'CCOSID='''+DMAF.cdsInvD.FieldByname('NewCCos').AsString+''', ';

         if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         begin
            xSQL:=xSQL
                 +'ACFMARCA=CASE WHEN COALESCE(ACFMARCA,'''')<>'''
                 +  DMAF.cdsInvD.fieldbyname('ACFMarca').AsString+''' Then '''
                 +  DMAF.cdsInvD.fieldbyname('ACFMarca').AsString+''' Else ACFMARCA END, '
                 +'ACFMODELO=CASE WHEN COALESCE(ACFMODELO,'''')<>'''
                 +  DMAF.cdsInvD.fieldbyname('ACFModelo').AsString+''' Then '''
                 +  DMAF.cdsInvD.fieldbyname('ACFModelo').AsString+''' Else ACFMODELO END, '
                 +'ACFSERIE=CASE WHEN COALESCE(ACFSERIE,'''')<>'''
                 +  DMAF.cdsInvD.fieldbyname('ACFSerie').AsString+''' Then '''
                 +  DMAF.cdsInvD.fieldbyname('ACFSerie').AsString+''' Else ACFSERIE END, ';

            xSQL:=xSQL+'ACFUSER='''+DMAF.wUsuario+''', '
                 +     'ACFFREG=CURRENT DATE, '
                 +     'ACFHREG=CURRENT TIME  '
                 +'WHERE CIAID=''' +DMAF.cdsInvD.fieldbyname('CiaId').AsString +''' and '
                 +      'TACFID='''+DMAF.cdsInvD.fieldbyname('TACFID').AsString+''' and '
                 +      'ACFID=''' +DMAF.cdsInvD.fieldbyname('ACFID').AsString +''' and '
                 +      'ACFREFOR=''00'' ';
         end;
         if SRV_D = 'ORACLE' then
         begin
            xSQL:=xSQL
                 +'DECODE(ACFMARCA,'' '
                 +  DMAF.cdsInvD.fieldbyname('ACFMarca').AsString+''', '
                 +  'ACFMARCA,'+''''+ DMAF.cdsInvD.fieldbyname('ACFMarca').AsString+''') AS ACFMARCA, '
                 +'DECODE(ACFMODELO,'' '
                 +  DMAF.cdsInvD.fieldbyname('ACFModelo').AsString+''', '
                 +  'ACFMODELO,'+''''+DMAF.cdsInvD.fieldbyname('ACFModelo').AsString+''') AS MODELO, '
                 +'DECODE(ACFSERIE,'' '
                 +  DMAF.cdsInvD.fieldbyname('ACFSerie').AsString+''', '
                 +  'ACFSERIE,'+''''+DMAF.cdsInvD.fieldbyname('ACFSerie').AsString+''') AS SERIE ';

            xSQL:=xSQL+'ACFUSER='''+DMAF.wUsuario+''', '
                 +     'ACFFREG=SYSDATE, '
                 +     'ACFHREG=SYSDATE  '
                 +'WHERE CIAID=''' +DMAF.cdsInvD.fieldbyname('CiaId').AsString +''' and '
                 +      'TACFID='''+DMAF.cdsInvD.fieldbyname('TACFID').AsString+''' and '
                 +      'ACFID=''' +DMAF.cdsInvD.fieldbyname('ACFID').AsString +''' and '
                 +      'ACFREFOR=''00'' ';
         end;

      DMAF.cdsQry.Close;
      DMAF.cdsQry.ProviderName:='dspTGE';
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Execute;

      DMAF.cdsInvD.Next;
   end;
}
   DMAF.cdsInvC.Edit;
   DMAF.cdsInvC.FieldByname('InvEstado').AsString := 'Aceptado';
//   oaAF5000.MantInvC.FMant.cds2.Edit;
//   oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('INVESTADO').ASSTRING:='Aceptado';
   DMAF.ControlTran;

   Screen.Cursor := crDefault;
   ShowMessage('Inventario Aceptado');

   // para refrescar el filtro del ACF301
   MantInvC.FMant.cds2.Data := DMAF.cdsInvC.Data;
   MantInvC.FMant.FiltraData('REFRESH');
   MantInvC.FMant.cds2.GotoCurrent(DMAF.cdsInvC);

End;

Procedure TFToolsInvDet.Z2bbtnIniciaClick(Sender: TObject);
Var
   xSQL, xfilter, wlbFiltro1, wxsql: String;
   nv: integer;
Begin
   If DMAF.cdsInvC.FieldByname('InvEstado').AsString = 'Aceptado' Then
   Begin
      Raise Exception.Create('Inventario Aceptado. No se Puede Inicializar');
      FToolsInvDet.Z2bbtnInicia.enabled := False; // desactiva botón de inicialización  de ACF779
   End;

{   if DMAF.cdsInvD.RecordCount>0 then
      begin
      showmessage ('Existe informacion, no puede ser inicializada');
      exit;
      end;
///////////////////////////////////// Descartar
    if DMAF.cdsInvD.RecordCount>0 then
    begin
      if MessageDlg('  Estado de Inventario : '+DMAF.cdsInvC.FieldByname('InvEstado').AsString+' '
                   + Chr(13)+Chr(13)+
                    '¿ Desea Volver a Inicializar Data ?',
         mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin

         Screen.Cursor:=crHourGlass;

         // Eliminar Data Anterior
         xSql:='Delete From ACF302 '
              +'Where CIAID=''' +DMAF.cdsInvC.FieldByname('CiaId').AsString+''' and '
              +      'INVNUM='''+DMAF.cdsInvC.FieldByname('InvNum').AsString+'''';
         DMAF.cdsQry.Close;
         DMAF.cdsQry.ProviderName:='dspTGE';
         DMAF.cdsQry.DataRequest(xSQL);
         DMAF.cdsQry.Execute;

         // Inicializar
        if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         begin
         xSql:='Insert Into ACF302 ( '
              +  'CIAID, INVNUM, ACFID, TACFID, '
              +  'ACFDES, ACFMARCA, ACFMODELO, ACFSERIE, CCOSID, UBICID, LOCID, '
              +  'USUARIO, FREG, HREG ) ('
              +'Select '
              +  'CIAID, '''+DMAF.cdsInvC.FieldByname('InvNum').AsString+''', ACFID, TACFID, '
              +  'ACFDES, ACFMARCA, ACFMODELO, ACFSERIE, CCOSID, UBICID, LOCID, '
              +  ''''+DMAF.wUsuario+''', CURRENT DATE, CURRENT TIME '
              +'From ACF201 '
              +'Where CIAID='''     +DMAF.cdsInvC.FieldByname('CiaId').AsString+''' and '
              +      'ACFFLAGACT='''+'A'+''' and '   // ACTIVO
              +      'ACFREFOR='''+'00'+''' )';        // No es Reforma
         end;
         if SRV_D = 'ORACLE' then
         begin
           xSql:='Insert Into ACF302 ( '
                +  'CIAID, INVNUM, ACFID, TACFID, '
                +  'ACFDES, ACFMARCA, ACFMODELO, ACFSERIE, CCOSID, UBICID, LOCID, '
                +  'USUARIO, FREG, HREG ) ('
                +'Select '
                +  'CIAID, '''+DMAF.cdsInvC.FieldByName('InvNum').AsString+''', ACFID, TACFID, '
                +  'ACFDES, ACFMARCA, ACFMODELO, ACFSERIE, CCOSID, UBICID, LOCID, '
                +  ''''+DMAF.wUsuario+''', SYSDATE, SYSDATE '
                +'From ACF201 '
                +'Where CIAID='''     +DMAF.cdsInvC.FieldByName('CiaId').AsString+''' and '
                +      'ACFFLAGACT='''+'A'+''' and '   // ACTIVO
                +      'ACFREFOR='''+'00'+''' )';        // No es Reforma
         end;

         DMAF.cdsQry.Close;
         DMAF.cdsQry.ProviderName:='dspTGE';
         DMAF.cdsQry.DataRequest(xSQL);
         DMAF.cdsQry.Execute;
      end
      else begin
         Exit;
      end;
   end
   else begin
      Screen.Cursor:=crHourGlass;

       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
       begin
      xSql:='Insert Into ACF302 ( '
           +  'CIAID, INVNUM, ACFID, TACFID, '
           +  'ACFDES, ACFMARCA, ACFMODELO, ACFSERIE, CCOSID, UBICID, LOCID, '
           +  'USUARIO, FREG, HREG ) ('
           +'Select '
           +  'CIAID, '''+DMAF.cdsInvC.FieldByname('InvNum').AsString+''', ACFID, TACFID, '
           +  'ACFDES, ACFMARCA, ACFMODELO, ACFSERIE, CCOSID, UBICID, LOCID, '
           +  ''''+DMAF.wUsuario+''', CURRENT DATE, CURRENT TIME '
           +'From ACF201 '
           +'Where CIAID='''     +DMAF.cdsInvC.FieldByname('CiaId').AsString+''' and '
           +      'ACFFLAGACT='''+'A'+''' and '
           +      'ACFREFOR='''+'00'+''' )';
       end;
       if SRV_D = 'ORACLE' then
       begin
          xSql:='Insert Into ACF302 ( '
               +  'CIAID, INVNUM, ACFID, TACFID, '
               +  'ACFDES, ACFMARCA, ACFMODELO, ACFSERIE, CCOSID, UBICID, LOCID, '
               +  'USUARIO, FREG, HREG ) ('
               +'Select '
               +  'CIAID, '''+DMAF.cdsInvC.FieldByname('InvNum').AsString+''', ACFID, TACFID, '
               +  'ACFDES, ACFMARCA, ACFMODELO, ACFSERIE, CCOSID, UBICID, LOCID, '
               +  ''''+DMAF.wUsuario+''', SYSDATE, SYSDATE '
               +'From ACF201 '
               +'Where CIAID='''     +DMAF.cdsInvC.FieldByname('CiaId').AsString+''' and '
               +      'ACFFLAGACT='''+'A'+''' and '
               +      'ACFREFOR='''+'00'+''' )';
       end;

      DMAF.cdsQry.Close;
      DMAF.cdsQry.ProviderName:='dspTGE';
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Execute;
   end;
}
///////////////////// nuevo... ///////////////////////////////////////

   Screen.Cursor := crHourGlass;
   FToolsInvDet.Z2bbtnInicia.enabled := False; // desactiva botón de inicialización  de ACF779

//  ACF778.MantInvD.FMant.cds2.First;
//  while not ACF778.MantInvD.FMant.cds2.Eof do begin

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSql := 'Insert Into ACF302 ( '
         + ' CIAID, INVNUM, LOCID, ACFDES, ACFDESL, ESTADOID, MATERIALID, ACFMARCA,'
         + ' ACFMODELO, ACFSERIE, ACFMEDIDA, ARTCODBAR, PISO, AREA, AMBCOD, RECIBEID,'
         + ' RECIBENOM, CANTI, FLAG, VERI, USINV, FECHA, HORA, USVERI, FECVER, HORVER,'
         + ' USUARIO, FREG, HREG )  '
         + ' SELECT '
         + 'CIAID,'
         + quotedstr(DMAF.cdsInvC.FieldByname('InvNum').AsString) + ','
         + 'LOCID, ACFDES,ACFDESL,ESTADOID,MATERIALID,ACFMARCA,ACFMODELO,ACFSERIE,ACFMEDIDA,ARTCODBAR,PISO,'
         + 'AREA,AMBCOD,RECIBEID,RECIBENOM,'
         + ' ''   '','' '','' '' ,''   '',''       '','
         + ' ''     '',''   '',''      '',''     '','
         + ' ''     '',''   '',''      '',''     '','
         + '''' + DMAF.wUsuario + ''', CURRENT DATE, CURRENT TIME '
         + ' FROM ACF201 ';
{           +' VALUES ('
           +quotedstr(DMAF.cdsInvC.FieldByname('CiaId').AsString)+','
           +quotedstr(DMAF.cdsInvC.FieldByname('InvNum').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('LOCID').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFDES').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFDESL').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ESTADOID').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('MATERIALID').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFMARCA').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFMODELO').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFSERIE').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFMEDIDA').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ARTCODBAR').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('PISO').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('AREA').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('AMBCOD').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('RECIBEID').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('RECIBENOM').AsString)+','
           +' ''   '','' '','' '' ,''   '',''       '','
           +' ''     '',''   '',''      '',''     '','
           +  ''''+DMAF.wUsuario+''', CURRENT DATE, CURRENT TIME )';
           }
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         xSql := 'Insert Into ACF302 ( '
            + ' CIAID, INVNUM, LOCID, ACFDES, ACFDESL, ESTADOID, MATERIALID, ACFMARCA,'
            + ' ACFMODELO, ACFSERIE, ACFMEDIDA, ARTCODBAR, PISO, AREA, AMBCOD, RECIBEID,'
            + ' RECIBENOM, CANTI, FLAG, VERI, USINV, FECHA, HORA, USVERI, FECVER, HORVER,'
            + ' USUARIO, FREG, HREG )  '
            + ' SELECT '
            + 'CIAID,'
            + quotedstr(DMAF.cdsInvC.FieldByname('InvNum').AsString) + ','
            + 'LOCID, ACFDES,ACFDESL,ESTADOID,MATERIALID,ACFMARCA,ACFMODELO,ACFSERIE,ACFMEDIDA,ARTCODBAR,PISO,'
            + 'AREA,AMBCOD,RECIBEID,RECIBENOM,'
            + ' ''   '','' '','' '' ,''   '',''      '','
            + ' ''     '',''   '',''      '',''     '','
            + '''' + DMAF.wUsuario + ''', SYSDATE, SYSDATE '
            + ' FROM ACF201 ';
{           +' VALUES ('
           +quotedstr(DMAF.cdsInvC.FieldByname('CiaId').AsString)+','
           +quotedstr(DMAF.cdsInvC.FieldByname('InvNum').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('LOCID').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFDES').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFDESL').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ESTADOID').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('MATERIALID').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFMARCA').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFMODELO').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFSERIE').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ACFMEDIDA').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('ARTCODBAR').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('PISO').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('AREA').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('AMBCOD').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('RECIBEID').AsString)+','
           +quotedstr(ACF778.MantInvD.FMant.cds2.Fieldbyname('RECIBENOM').AsString)+','
           +' ''   '','' '','' '' ,''   '',''      '','
           +' ''     '',''   '',''      '',''     '','
           +  ''''+DMAF.wUsuario+''', SYSDATE, SYSDATE '
           +' )';
       }
      End;

   wlbFiltro1 := '';
   For nv := 0 To ACF778.MantInvD.FMant.lbFiltroReal.Count - 1 Do
   Begin
      wlbFiltro1 := wlbFiltro1 + ACF778.MantInvD.FMant.lbFiltroReal.items[nv] + ' AND ';
   End;
   If length(wlbFiltro1) > 0 Then
   Begin
      xSQL := xSQL + ' WHERE ' + copy(wlbFiltro1, 1, length(wlbFiltro1) - 5) + ' '
   End;

   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(XSQL);
   Except
      showmessage('Error al inicializar');
   End;
//    ACF778.MantInvD.FMant.cds2.Next;
//    end;

//////////////////////////////////////////////////////////////////////

   If DMAF.cdsInvC.FieldByname('InvEstado').AsString = 'Inicial' Then
   Begin
      DMAF.cdsInvC.Edit;
      DMAF.cdsInvC.FieldByname('InvEstado').AsString := 'Generado';
      DMAF.ControlTran;
   End;

///////////////////////////////
   wxsql := ' SELECT * FROM ACF302 WHERE ACF302.CIAID=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('CIAID').ASSTRING)
      + ' AND ACF302.INVNUM=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('INVNUM').ASSTRING);

   ACF778.MantInvD.UsuarioSql.Clear;
   ACF778.MantInvD.FMant.wTabla := 'ACF302';
   ACF778.MantInvD.UsuarioSQL.Add(WXSQL);
   ACF778.MantInvD.NewQuery;
///////////////////////////

   Screen.Cursor := crDefault;
   ShowMessage('Inicialización Terminada');
End;

Procedure TFToolsInvDet.Z2bbtnTxtClick(Sender: TObject);
Var
   xSel, xLinea, xCampo, xBlanco, xUsuario, wlbFiltro, xSQL: String;
   xSpace, nv: Integer;
Begin
   If MessageDlg('Seguro de Tranferir Archivos', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin

      Screen.Cursor := crHourGlass;

      xBlanco := '                                                            ';
      xSpace := 0;

{OBC 2/10/2006      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
        xSQL:='SELECT * FROM ACF202 '
             +'Where CIAID='''+DMAF.cdsQry.FieldByName('CIAID').AsString+''' and '
             +      'COALESCE(F_ULTIMO,'''')=''S'' and '
             +      'COALESCE(FPROVE,'''')<>''S'' '
             +'Order By CIAID, TACFID, ACFID ';
      end;}
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF302 A FLINVT.TXT  DE ACUERDO AL NUMERO DE INVENTARIO
{OBC 2/10/2006      xSel:='SELECT * FROM ACF302201 '
             +'Where ACFFLAGACT=''A'' ';//+quotedstr(DMAF.cdsQry.FieldByName('CIAID').AsString)
}
//             +' Order By LOCID,PISO,AREA,AMBCOD,ARTCODBAR ';
      xSel := ' SELECT * FROM ACF302 WHERE ACF302.CIAID=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('CIAID').ASSTRING)
         + ' AND ACF302.INVNUM=' + quotedstr(oaAF5000.MantInvC.FMant.cds2.FIELDBYNAME('INVNUM').ASSTRING);

      wlbFiltro := '';
      For nv := 0 To ACF778.MantInvD.FMant.lbFiltroReal.Count - 1 Do
      Begin
         wlbFiltro := wlbFiltro + ACF778.MantInvD.FMant.lbFiltroReal.items[nv] + ' AND ';
      End;

      If length(wlbFiltro) = 0 Then
         xSQL := xSel
      Else
         xSQL := xSel + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5);

      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL);
//      DMAF.cdsQry.IndexFieldNames:='LOCID;PISO;AREA;AMBCOD;ARTCODBAR';
      DMAF.cdsQry.IndexFieldNames := 'ARTCODBAR';
      DMAF.cdsQry.Open;
      scFile.Lines.Clear;
      DMAF.cdsQry.First;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xUsuario := '';

         ///////////////////////////////////////////////////////////////////////
         xSpace := DMAF.cdsQry.FieldByName('LOCID').Size - Length(DMAF.cdsQry.FieldByName('LOCID').AsString);
         xCampo := DMAF.cdsQry.FieldByName('LOCID').AsString + Copy(xBlanco, 1, xSpace); //LOCAL - 2
         xLinea := xLinea + xCampo;
         xSpace := 2;
         xCampo := '00'; //BLOKE - 2
         xLinea := xLinea + xCampo;
         xSpace := DMAF.cdsQry.FieldByName('PISO').Size - Length(DMAF.cdsQry.FieldByName('PISO').AsString);
         xCampo := DMAF.cdsQry.FieldByName('PISO').AsString + Copy(xBlanco, 1, xSpace); //PISO - 2
         xLinea := xLinea + xCampo;
         xSpace := DMAF.cdsQry.FieldByName('AREA').Size - Length(DMAF.cdsQry.FieldByName('AREA').AsString);
         xCampo := DMAF.cdsQry.FieldByName('AREA').AsString + Copy(xBlanco, 1, xSpace); //AREA - 2
         xLinea := xLinea + xCampo;
         xSpace := DMAF.cdsQry.FieldByName('AMBCOD').Size - Length(DMAF.cdsQry.FieldByName('AMBCOD').AsString);
         xCampo := DMAF.cdsQry.FieldByName('AMBCOD').AsString + Copy(xBlanco, 1, xSpace); //AMBIE - 3
         xLinea := xLinea + xCampo;
         ///////////////////////////////////////////////////////////////////////
         If Length(DMAF.cdsQry.FieldByName('RECIBEID').AsString) > 5 Then //RESP - 5  , RECIBEID 6
            xCampo := copy(DMAF.cdsQry.FieldByName('RECIBEID').AsString, 1, 5)
         Else
         Begin
            xSpace := 5 - Length(DMAF.cdsQry.FieldByName('RECIBEID').AsString);
            xCampo := DMAF.cdsQry.FieldByName('RECIBEID').AsString + Copy(xBlanco, 1, xSpace);
         End;

         xLinea := xLinea + xCampo;
         If Length(DMAF.cdsQry.FieldByName('RECIBENOM').AsString) > 30 Then
            xCampo := copy(DMAF.cdsQry.FieldByName('RECIBENOM').AsString, 1, 30)
         Else
         Begin
            xSpace := 30 - Length(DMAF.cdsQry.FieldByName('RECIBENOM').AsString);
            xCampo := DMAF.cdsQry.FieldByName('RECIBENOM').AsString + Copy(xBlanco, 1, xSpace);
         End;
         xLinea := xLinea + xCampo;
         xSpace := DMAF.cdsQry.FieldByName('ARTCODBAR').Size - Length(DMAF.cdsQry.FieldByName('ARTCODBAR').AsString);
         xCampo := DMAF.cdsQry.FieldByName('ARTCODBAR').AsString + Copy(xBlanco, 1, xSpace); //COBAR - 6
         xLinea := xLinea + xCampo;
         xSpace := 10 + (DMAF.cdsQry.FieldByName('ACFDES').Size - Length(DMAF.cdsQry.FieldByName('ACFDES').AsString));
         xCampo := DMAF.cdsQry.FieldByName('ACFDES').AsString + Copy(xBlanco, 1, xSpace); //DENO - 60  , ACFDES 50
         xLinea := xLinea + xCampo;
         xCampo := copy(DMAF.cdsQry.FieldByName('ESTADOID').AsString, 1, 1); //ESTAD - 1
         xLinea := xLinea + xCampo;
         xSpace := 5 + (DMAF.cdsQry.FieldByName('ACFDESL').Size - Length(DMAF.cdsQry.FieldByName('ACFDESL').AsString));
         xCampo := DMAF.cdsQry.FieldByName('ACFDESL').AsString + Copy(xBlanco, 1, xSpace); //DESC - 60 , ACFDESL 55
         xLinea := xLinea + xCampo;
         xSpace := 5 + (DMAF.cdsQry.FieldByName('MATERIALID').Size - Length(DMAF.cdsQry.FieldByName('MATERIALID').AsString));
         xCampo := DMAF.cdsQry.FieldByName('MATERIALID').AsString + Copy(xBlanco, 1, xSpace); //MATE - 15 , MATERAILID 10
         xLinea := xLinea + xCampo;
         If Length(DMAF.cdsQry.FieldByName('ACFMARCA').AsString) > 20 Then //MARCA - 20  , ACFMARCA 25
            xCampo := copy(DMAF.cdsQry.FieldByName('ACFMARCA').AsString, 1, 20)
         Else
         Begin
            xSpace := 20 - Length(DMAF.cdsQry.FieldByName('ACFMARCA').AsString);
            xCampo := DMAF.cdsQry.FieldByName('ACFMARCA').AsString + Copy(xBlanco, 1, xSpace);
         End;
         xLinea := xLinea + xCampo;
         If Length(DMAF.cdsQry.FieldByName('ACFMODELO').AsString) > 20 Then ////MODELO - 20 , ACFMODELO 25
            xCampo := copy(DMAF.cdsQry.FieldByName('ACFMODELO').AsString, 1, 20)
         Else
         Begin
            xSpace := 20 - Length(DMAF.cdsQry.FieldByName('ACFMODELO').AsString);
            xCampo := DMAF.cdsQry.FieldByName('ACFMODELO').AsString + Copy(xBlanco, 1, xSpace);
         End;
         xLinea := xLinea + xCampo;
         If Length(DMAF.cdsQry.FieldByName('ACFSERIE').AsString) > 20 Then ////SERIE - 20 , ACFSERIE 25
            xCampo := copy(DMAF.cdsQry.FieldByName('ACFSERIE').AsString, 1, 20)
         Else
         Begin
            xSpace := 20 - Length(DMAF.cdsQry.FieldByName('ACFSERIE').AsString);
            xCampo := DMAF.cdsQry.FieldByName('ACFSERIE').AsString + Copy(xBlanco, 1, xSpace);
         End;
         xLinea := xLinea + xCampo;
         If Length(DMAF.cdsQry.FieldByName('ACFMEDIDA').AsString) > 20 Then ////DIMEN - 20  , ACFMEDIDA 25
            xCampo := copy(DMAF.cdsQry.FieldByName('ACFMEDIDA').AsString, 1, 20)
         Else
         Begin
            xSpace := 20 - Length(DMAF.cdsQry.FieldByName('ACFMEDIDA').AsString);
            xCampo := DMAF.cdsQry.FieldByName('ACFMEDIDA').AsString + Copy(xBlanco, 1, xSpace);
         End;
         xLinea := xLinea + xCampo;
         xSpace := 3;
         xCampo := '1  '; // CANTI
         xLinea := xLinea + xCampo;
         xSpace := 1;
         xCampo := 'E'; // FLAG
         xLinea := xLinea + xCampo;
         xSpace := 1;
         xCampo := ' '; // VERI
         xLinea := xLinea + xCampo;
         xSpace := 3;
         xCampo := '   '; // USINV
         xLinea := xLinea + xCampo;
         xSpace := 6;
         xCampo := '      '; // FECHA
         xLinea := xLinea + xCampo;
         xSpace := 5;
         xCampo := '     '; // HORA
         xLinea := xLinea + xCampo;
         xSpace := 3;
         xCampo := '   '; // USVERI
         xLinea := xLinea + xCampo;
         xSpace := 6;
         xCampo := '      '; // FECVER
         xLinea := xLinea + xCampo;
         xSpace := 5;
         xCampo := '     '; // HORVER
         xLinea := xLinea + xCampo;

         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\FLINVT.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF302 A FLBARR2.TXT  (indices de codigos de barras) SEGUN NUMERO DE INVENTARIO
{OBC 2/10/2006      xSel:='SELECT * FROM ACF201 '
             +'Where ACFFLAGACT=''A'' ';//+quotedstr(DMAF.cdsQry.FieldByName('CIAID').AsString)
      if length(wlbFiltro)=0 then
         xSQL:=xSel
      else
         xSQL:=xSel+' AND '+copy(wlbFiltro,1,length(wlbFiltro)-5);

      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.IndexFieldNames:='ARTCODBAR';
      DMAF.cdsQry.Open;
}
      scFile.Lines.Clear;
      xSpace := 0;
      DMAF.cdsQry.First;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xCampo := DMAF.cdsQry.FieldByName('ARTCODBAR').AsString;
         xLinea := xLinea + xCampo;
         xCampo := DMAF.StrZero(xSpace, 5);
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         xSpace := xSpace + 1;
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\FLBARR2.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF120 A TBLOCA.TXT
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select * from ACF120');
      DMAF.cdsQry.IndexFieldNames := 'LOCID';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;
      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xSpace := DMAF.cdsQry.FieldByName('LOCID').Size - Length(DMAF.cdsQry.FieldByName('LOCID').AsString);
         xCampo := DMAF.cdsQry.FieldByName('LOCID').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;
         xSpace := DMAF.cdsQry.FieldByName('LOCDES').Size - Length(DMAF.cdsQry.FieldByName('LOCDES').AsString);
         xCampo := DMAF.cdsQry.FieldByName('LOCDES').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\TBLOCA.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL TBBLOQ.TXT
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select * from ACF120');
      DMAF.cdsQry.IndexFieldNames := 'LOCID';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;
      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xCampo := DMAF.cdsQry.FieldByName('LOCID').AsString;
         xLinea := xLinea + xCampo;
         xCampo := '00'; //Bloque
         xLinea := xLinea + xCampo;
         xCampo := 'BLOQUE 00 '; //Bloque
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\TBBLOQ.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF121 A TBPISO.TXT
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select * from ACF121');
      DMAF.cdsQry.IndexFieldNames := 'LOCID;PISO';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;
      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xCampo := DMAF.cdsQry.FieldByName('LOCID').AsString;
         xLinea := xLinea + xCampo;
         xCampo := '00'; //Bloque;
         xLinea := xLinea + xCampo;
         xCampo := DMAF.cdsQry.FieldByName('PISO').AsString;
         xLinea := xLinea + xCampo;
         xSpace := 6 + (DMAF.cdsQry.FieldByName('PISODES').Size - Length(DMAF.cdsQry.FieldByName('PISODES').AsString));
         xCampo := DMAF.cdsQry.FieldByName('PISODES').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\TBPISO.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF122 A TBAREA.TXT
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select * from ACF122');
      DMAF.cdsQry.IndexFieldNames := 'LOCID;PISO;AREA';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;
      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xCampo := DMAF.cdsQry.FieldByName('LOCID').AsString;
         xLinea := xLinea + xCampo;
         xCampo := '00'; //Bloque;
         xLinea := xLinea + xCampo;
         xCampo := DMAF.cdsQry.FieldByName('PISO').AsString;
         xLinea := xLinea + xCampo;
         xCampo := DMAF.cdsQry.FieldByName('AREA').AsString;
         xLinea := xLinea + xCampo;
         xSpace := DMAF.cdsQry.FieldByName('AREADES').Size - Length(DMAF.cdsQry.FieldByName('AREADES').AsString);
         xCampo := DMAF.cdsQry.FieldByName('AREADES').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\TBAREA.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF123 A TBAMBI.TXT
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select * from ACF123');
      DMAF.cdsQry.IndexFieldNames := 'LOCID;PISO;AREA;AMBCOD';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;
      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xCampo := DMAF.cdsQry.FieldByName('LOCID').AsString;
         xLinea := xLinea + xCampo;
         xCampo := '00'; //Bloque;
         xLinea := xLinea + xCampo;
         xCampo := DMAF.cdsQry.FieldByName('PISO').AsString;
         xLinea := xLinea + xCampo;
         xCampo := DMAF.cdsQry.FieldByName('AREA').AsString;
         xLinea := xLinea + xCampo;
         xCampo := DMAF.cdsQry.FieldByName('AMBCOD').AsString;
         xLinea := xLinea + xCampo;
         xSpace := DMAF.cdsQry.FieldByName('AMBDES').Size - Length(DMAF.cdsQry.FieldByName('AMBDES').AsString);
         xCampo := DMAF.cdsQry.FieldByName('AMBDES').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\TBAMBI.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF124 A TBSBN.TXT
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select * from ACF124');
      DMAF.cdsQry.IndexFieldNames := 'DENOMINACI';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;
      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xSpace := 17 + (DMAF.cdsQry.FieldByName('DENOMINACI').Size - Length(DMAF.cdsQry.FieldByName('DENOMINACI').AsString));
         xCampo := DMAF.cdsQry.FieldByName('DENOMINACI').AsString + Copy(xBlanco, 1, xSpace);
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\TBTSBN.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF126 A TBRESP.TXT
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select * from ACF126');
      DMAF.cdsQry.IndexFieldNames := 'RECIBEID';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;
      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xCampo := DMAF.cdsQry.FieldByName('RECIBEID').AsString;
         xLinea := xLinea + xCampo;
//         xSpace:=(DMAF.cdsQry.FieldByName('RECIBENOM').Size-Length(DMAF.cdsQry.FieldByName('RECIBENOM').AsString));
         If Length(DMAF.cdsQry.FieldByName('RECIBENOM').AsString) > 30 Then
            xCampo := copy(DMAF.cdsQry.FieldByName('RECIBENOM').AsString, 1, 30)
         Else
         Begin
            xSpace := 30 - Length(DMAF.cdsQry.FieldByName('RECIBENOM').AsString);
            xCampo := DMAF.cdsQry.FieldByName('RECIBENOM').AsString + Copy(xBlanco, 1, xSpace);
         End;
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\TBRESP.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF126 A TBESTD.TXT
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select * from ACF109');
      DMAF.cdsQry.IndexFieldNames := 'ESTADOID';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;
      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xCampo := DMAF.cdsQry.FieldByName('ESTADOID').AsString;
         xLinea := xLinea + xCampo;
//         xSpace:=(DMAF.cdsQry.FieldByName('ESTADODES').Size-Length(DMAF.cdsQry.FieldByName('ESTADODES').AsString));
         xCampo := copy(DMAF.cdsQry.FieldByName('ESTADODES').AsString, 1, 3);
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\TBESTD.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF201- ACFMARCA A TBMARCA.TXT
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select ACFMARCA from ACF201 GROUP BY ACFMARCA');
      DMAF.cdsQry.IndexFieldNames := 'ACFMARCA';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;
      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         If Length(DMAF.cdsQry.FieldByName('ACFMARCA').AsString) > 20 Then
            xCampo := copy(DMAF.cdsQry.FieldByName('ACFMARCA').AsString, 1, 20)
         Else
         Begin
            xSpace := 20 - Length(DMAF.cdsQry.FieldByName('ACFMARCA').AsString);
            xCampo := DMAF.cdsQry.FieldByName('ACFMARCA').AsString + Copy(xBlanco, 1, xSpace);
         End;
         If Length(DMAF.cdsQry.FieldByName('ACFMARCA').AsString) = 0 Then // por no tener MARCA
         Begin
            xSpace := 20 - 3;
            xCampo := 'S/M' + Copy(xBlanco, 1, xSpace);
         End;
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\TBMARC.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF201- ACFMODELO A TBMODE.TXT
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select ACFMODELO from ACF201 GROUP BY ACFMODELO');
      DMAF.cdsQry.IndexFieldNames := 'ACFMODELO';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;
      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         If Length(DMAF.cdsQry.FieldByName('ACFMODELO').AsString) > 20 Then
            xCampo := copy(DMAF.cdsQry.FieldByName('ACFMODELO').AsString, 1, 20)
         Else
         Begin
            xSpace := 20 - Length(DMAF.cdsQry.FieldByName('ACFMODELO').AsString);
            xCampo := DMAF.cdsQry.FieldByName('ACFMODELO').AsString + Copy(xBlanco, 1, xSpace);
         End;
         If Length(DMAF.cdsQry.FieldByName('ACFMODELO').AsString) = 0 Then // por no tener MODELO
         Begin
            xSpace := 20 - 3;
            xCampo := 'S/M' + Copy(xBlanco, 1, xSpace);
         End;
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\TBMODE.TXT');
      //////////////////////////////////////////////////////////////////////////
      // TRANSFERENCIA A TXT DEL ACF201- MATERIALID A TBMATE.TXT
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('Select MATERIALID from ACF201 GROUP BY MATERIALID');
      DMAF.cdsQry.IndexFieldNames := 'MATERIALID';
      DMAF.cdsQry.Open;
      DMAF.cdsQry.First;
      scFile.Lines.Clear;
      While Not DMAF.cdsQry.Eof Do
      Begin
         xLinea := '';
         xSpace := 5 + (DMAF.cdsQry.FieldByName('MATERIALID').Size - Length(DMAF.cdsQry.FieldByName('MATERIALID').AsString));
         xCampo := DMAF.cdsQry.FieldByName('MATERIALID').AsString + Copy(xBlanco, 1, xSpace); //DESC - 15 , MATERIALID 10
         If Length(DMAF.cdsQry.FieldByName('MATERIALID').AsString) = 0 Then // por no tener MATERIAL
         Begin
            xSpace := 15 - 3;
            xCampo := 'S/M' + Copy(xBlanco, 1, xSpace);
         End;
         xLinea := xLinea + xCampo;
         scFile.Lines.Add(xLinea);
         DMAF.cdsQry.Next;
      End;
      DMAF.cdsQry.Close;
      DMAF.cdsQry.IndexFieldNames := '';
      scFile.Lines.SaveToFile('C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL\TBMATE.TXT');
      //////////////////////////////////////////////////////////////////////////

      ShowMessage('Los Archivos fueron copiados al Directorio C:\ARCHIVOS DE PROGRAMA\TRF\GENERAL');
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFToolsInvDet.Z2bbtnDeTxtClick(Sender: TObject);
Var
   x: integer;
   xSql, wFlag: String;
Begin
   /////////////////////////////////////////////////////////////////////////////
   /// PAra seleecionar el FLINVT.TXT
   // Primero se eliminan los registros de la PALM indicada, si se cargaron anteriormente
   xSQL := 'DELETE FROM ACF302I WHERE CIAID=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('CIAID').AsString)
      + ' AND INVNUM=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVNUM').AsString)
      + ' AND PALMCOD=' + quotedstr(dblcPalm.Text);
   DMAF.DCOM1.AppServer.EjecutaSQL(xSql);

   ////////////////////////////////////////////////////////////////////////////
   // LO ENVIADO
   DMAF.cdsInventario.Close;
   DMAF.cdsInventario.DataRequest('Select * from ACF302 '
      + 'WHERE CIAID=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('CIAID').AsString)
      + ' AND INVNUM=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVNUM').AsString)
      );
   DMAF.cdsInventario.IndexFieldNames := 'ARTCODBAR';
   DMAF.cdsInventario.Open;

   // LO INVENTARIADO
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest('Select * from ACF302I WHERE 1<>1');
   DMAF.cdsQry.IndexFieldNames := 'ARTCODBAR';
   DMAF.cdsQry.Open;
   scFile.Lines.Clear;
   scFile.Lines.LoadFromFile('C:\ARCHIVOS DE PROGRAMA\TRF\USUARIOS\' + dblcPalm.Text + '\PALMTOPC\FLINVT.TXT');

   For x := 0 To scFile.Lines.Count - 1 Do
   Begin
       /////////////////////////////////////////////////////////////////////////
       // FLAG : I=Inventariado o Nuevo - M=Modificado
       // VERI : V=Inventariado y Verificado
      If copy(scFile.Lines.Strings[x], 272, 1) <> 'E' Then
      Begin
         wFlag := '';
          /////////////////////////////////////////////////////////////////////////
         If copy(scFile.Lines.Strings[x], 272, 1) = 'I' Then // x Bienes NUEVOS
         Begin
            DMAF.cdsInventario.SetKey;
            DMAF.cdsInventario.FieldByName('ARTCODBAR').AsString := copy(scFile.Lines.Strings[x], 47, 6);
            If Not DMAF.cdsInventario.GotoKey Then wFlag := 'N'; // x NO existir en ACF302
         End;
          /////////////////////////////////////////////////////////////////////////
         If copy(scFile.Lines.Strings[x], 272, 1) = 'I' Then // x Bienes OK - Inventariados sin Modificacion
         Begin
            DMAF.cdsInventario.SetKey;
            DMAF.cdsInventario.FieldByName('ARTCODBAR').AsString := copy(scFile.Lines.Strings[x], 47, 6);
            If DMAF.cdsInventario.GotoKey Then
            Begin
               wFlag := 'I'; // x EXISTIR en ACF302
               If (DMAF.cdsQry.FieldByName('LOCID').AsString <> copy(scFile.Lines.Strings[x], 1, 2)) Or
                  (DMAF.cdsQry.FieldByName('PISO').AsString <> copy(scFile.Lines.Strings[x], 5, 2)) Or
                  (DMAF.cdsQry.FieldByName('AREA').AsString <> copy(scFile.Lines.Strings[x], 7, 2)) Or
                  (DMAF.cdsQry.FieldByName('AMBCOD').AsString <> copy(scFile.Lines.Strings[x], 9, 3)) Then
               Begin
                  wFlag := 'T'; // x cambiar de Ubicacion (LocId,Piso,Area,Ambcod)
               End;
            End;
         End;
          /////////////////////////////////////////////////////////////////////////
         If copy(scFile.Lines.Strings[x], 272, 1) = 'M' Then // x Bienes Modificados
         Begin
            DMAF.cdsInventario.SetKey;
            DMAF.cdsInventario.FieldByName('ARTCODBAR').AsString := copy(scFile.Lines.Strings[x], 47, 6);
            If DMAF.cdsInventario.GotoKey Then
            Begin
               wFlag := 'M'; // x SI existir en ACF302
               If (DMAF.cdsQry.FieldByName('LOCID').AsString <> copy(scFile.Lines.Strings[x], 1, 2)) Or
                  (DMAF.cdsQry.FieldByName('PISO').AsString <> copy(scFile.Lines.Strings[x], 5, 2)) Or
                  (DMAF.cdsQry.FieldByName('AREA').AsString <> copy(scFile.Lines.Strings[x], 7, 2)) Or
                  (DMAF.cdsQry.FieldByName('AMBCOD').AsString <> copy(scFile.Lines.Strings[x], 9, 3)) Then
               Begin
                  wFlag := 'C'; // x cambiar de Ubicacion (LocId,Piso,Area,Ambcod)
               End;
            End;
         End;
          /////////////////////////////////////////////////////////////////////////

         DMAF.cdsQry.Append;
         DMAF.cdsQry.FieldByName('CIAID').AsString := oaAF5000.MantInvc.FMant.cds2.FieldbyName('CIAID').AsString;
         DMAF.cdsQry.FieldByName('INVNUM').AsString := oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVNUM').AsString;
         DMAF.cdsQry.FieldByName('LOCID').AsString := copy(scFile.Lines.Strings[x], 1, 2);
         DMAF.cdsQry.FieldByName('PISO').AsString := copy(scFile.Lines.Strings[x], 5, 2);
         DMAF.cdsQry.FieldByName('AREA').AsString := copy(scFile.Lines.Strings[x], 7, 2);
         DMAF.cdsQry.FieldByName('AMBCOD').AsString := copy(scFile.Lines.Strings[x], 9, 3);
         DMAF.cdsQry.FieldByName('RECIBEID').AsString := trim(copy(scFile.Lines.Strings[x], 12, 5));
         DMAF.cdsQry.FieldByName('RECIBENOM').AsString := trim(copy(scFile.Lines.Strings[x], 17, 30));
         DMAF.cdsQry.FieldByName('ARTCODBAR').AsString := copy(scFile.Lines.Strings[x], 47, 6);
         DMAF.cdsQry.FieldByName('ACFDES').AsString := trim(copy(scFile.Lines.Strings[x], 53, 50));
         DMAF.cdsQry.FieldByName('ESTADOID').AsString := copy(scFile.Lines.Strings[x], 113, 1);
         DMAF.cdsQry.FieldByName('ACFDESL').AsString := trim(copy(scFile.Lines.Strings[x], 114, 55));
          //////////////////////////////////////////////////////////////////////
         If trim(copy(scFile.Lines.Strings[x], 169, 15)) = 'S/M' Then
            DMAF.cdsQry.FieldByName('MATERIALID').AsString := ''
         Else
            DMAF.cdsQry.FieldByName('MATERIALID').AsString := trim(copy(scFile.Lines.Strings[x], 169, 15));
         If trim(copy(scFile.Lines.Strings[x], 184, 20)) = 'S/M' Then
            DMAF.cdsQry.FieldByName('ACFMARCA').AsString := ''
         Else
            DMAF.cdsQry.FieldByName('ACFMARCA').AsString := trim(copy(scFile.Lines.Strings[x], 184, 20));
         If trim(copy(scFile.Lines.Strings[x], 204, 20)) = 'S/M' Then
            DMAF.cdsQry.FieldByName('ACFMODELO').AsString := ''
         Else
            DMAF.cdsQry.FieldByName('ACFMODELO').AsString := trim(copy(scFile.Lines.Strings[x], 204, 20));
          //////////////////////////////////////////////////////////////////////
         DMAF.cdsQry.FieldByName('ACFSERIE').AsString := trim(copy(scFile.Lines.Strings[x], 224, 20)) +
            trim(copy(scFile.Lines.Strings[x], 244, 5));
         DMAF.cdsQry.FieldByName('ACFMEDIDA').AsString := trim(copy(scFile.Lines.Strings[x], 249, 20));
         DMAF.cdsQry.FieldByName('CANTI').AsString := trim(copy(scFile.Lines.Strings[x], 269, 3));
         DMAF.cdsQry.FieldByName('FLAG').AsString := wFlag;
         DMAF.cdsQry.FieldByName('VERI').AsString := trim(copy(scFile.Lines.Strings[x], 273, 1));
         DMAF.cdsQry.FieldByName('USINV').AsString := trim(copy(scFile.Lines.Strings[x], 274, 3));
         DMAF.cdsQry.FieldByName('FECHA').AsString := trim(copy(scFile.Lines.Strings[x], 277, 6));
         DMAF.cdsQry.FieldByName('HORA').AsString := trim(copy(scFile.Lines.Strings[x], 283, 5));
         DMAF.cdsQry.FieldByName('USVERI').AsString := trim(copy(scFile.Lines.Strings[x], 288, 3));
         DMAF.cdsQry.FieldByName('FECVER').AsString := trim(copy(scFile.Lines.Strings[x], 291, 6));
         DMAF.cdsQry.FieldByName('HORVER').AsString := trim(copy(scFile.Lines.Strings[x], 297, 5));
         DMAF.cdsQry.FieldByName('PALMCOD').AsString := dblcPalm.Text;
         DMAF.AplicaDatos(DMAF.cdsQry, '');
      End;
   End;
   /////////////////////////////////////////////////////////////////////////////
   // para determinar los Bienes FALTANTES
   xSQL := 'UPDATE ACF302 SET FLAG=''F'' WHERE '
      + 'CIAID=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('CIAID').AsString)
      + ' AND INVNUM=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVNUM').AsString)
      + ' AND ARTCODBAR NOT IN (SELECT ARTCODBAR FROM ACF302I) ';
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
End;

Procedure TFToolsInvDet.FormCreate(Sender: TObject);
Var
   xSql: String;
Begin
   DMAF.cdsQry3.Close;
   DMAF.cdsQry3.DataRequest('Select * from ACF127');
   DMAF.cdsQry3.Open;
End;

Procedure TFToolsInvDet.cbInformacionChange(Sender: TObject);
Var
   xSQL, xSel, wlbFiltro: String;
   nv: integer;
Begin
   If cbInformacion.Text = 'Lo Enviado' Then
   Begin
      ACF778.MantInvD.FMant.wTabla := 'ACF302';
   End;
   If cbInformacion.Text = 'Lo Inventariado' Then
   Begin
      ACF778.MantInvD.FMant.wTabla := 'ACF302I';
   End;

   xSel := 'SELECT * FROM '
      + ACF778.MantInvD.FMant.wTabla
      + ' WHERE CIAID=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('CIAID').AsString)
      + ' AND INVNUM=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVNUM').AsString);

   wlbFiltro := '';
   For nv := 0 To ACF778.MantInvD.FMant.lbFiltroReal.Count - 1 Do
   Begin
      wlbFiltro := wlbFiltro + ACF778.MantInvD.FMant.lbFiltroReal.items[nv] + ' AND ';
   End;
   If length(wlbFiltro) = 0 Then
      xSQL := xSel
   Else
      xSQL := xSel + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5);

   ACF778.MantInvD.UsuarioSQL.Clear;
   ACF778.MantInvD.UsuarioSQL.Add(xSQL);
   ACF778.MantInvD.NewQuery;
End;

Procedure TFToolsInvDet.cbReportesChange(Sender: TObject);
Begin
   If cbReportes.Text = 'Inventario x Local/Ambientes' Then
   Begin
      ReportexAmbientes;
   End;
   If cbReportes.Text = 'Inventario x Codigo de Barras' Then
   Begin
      ReportexCodBarras;
   End;
   DMAF.cdsQry.IndexFieldNames := '';
   DMAF.cdsQry.Filter := '';
   DMAF.cdsQry.Filtered := False;
End;

Procedure TFToolsInvDet.ReportexAmbientes;
Var
   wTabla, wlbFiltro, xSel, xSQL: String;
   nv: integer;
Begin
   wTabla := ACF778.MantInvD.FMant.wTabla;
   xSel := 'Select ('
      + wTabla + '.LOCID||' + wTabla + '.PISO||' + wTabla + '.AREA) GRUPO1,'
      + wTabla + '.LOCID LOCAL,B.LOCDES,'
      + wTabla + '.PISO,'
      + wTabla + '.AREA,D.AREADES,'
      + wTabla + '.AMBCOD AMBIENTE,E.AMBDES,'
      + wTabla + '.ARTCODBAR CODBARRAS,'
      + wTabla + '.ACFDES DENOMINACI,'
      + wTabla + '.ESTADOID ESTADO,'
      + 'trim(' + wTabla + '.ACFDES)||'' ''||trim(' + wTabla + '.ACFDESL) DESC_JUNTA, '
      + wTabla + '.MATERIALID MATERIAL,'
      + wTabla + '.ACFDESL,'
      + wTabla + '.ACFMARCA MARCA,'
      + wTabla + '.ACFMODELO MODELO,'
      + wTabla + '.ACFSERIE SERIE,'
      + wTabla + '.ACFMEDIDA DIMENSIONE,'
      + wTabla + '.FLAG,'
      + wTabla + '.VERI,'
      + wTabla + '.RECIBEID RESPONSABL,'
      + wTabla + '.RECIBENOM NOMBRE, '
      + wTabla + '.INVNUM, '
      + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVFECHA').AsString) + ' FECHAINV '
      + 'from ' + wTabla + ', ACF120 B, ACF121 C, ACF122 D, ACF123 E WHERE '
      + 'ACF201.CIAID=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('CIAID').AsString)
      + ' AND ACF201.INVNUM=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVNUM').AsString) + ' AND '
      + '(ACF201.LOCID=B.LOCID(+)) AND '
      + '(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
      + '(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
      + '(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and ACF201.AMBCOD=E.AMBCOD(+))';
   xSel := StringReplace(xSel, 'ACF201', wTabla, [rfReplaceAll, rfIgnoreCase]);

   wlbFiltro := '';
   For nv := 0 To ACF778.MantInvD.FMant.lbFiltroReal.Count - 1 Do
   Begin
      wlbFiltro := wlbFiltro + ACF778.MantInvD.FMant.lbFiltroReal.items[nv] + ' AND ';
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
   DMAF.cdsQry.IndexFieldNames := 'LOCAL;PISO;AREA;AMBIENTE;CODBARRAS';
   ppdbPadron.DataSource := DMAF.dsQry;
   pprPadron.DataPipeline := ppdbPadron;
   pprPadron.Template.FileName := wRutaRpt + 'ACF\DEMA\INVXAREA.rtm';
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
End;

Procedure TFToolsInvDet.ReportexCodBarras;
Var
   wTabla, wlbFiltro, xSel, xSQl: String;
   nv: integer;
Begin
   wTabla := ACF778.MantInvD.FMant.wTabla;
   xSel := 'SELECT ACF302.LOCID||ACF302.PISO||ACF302.AREA GRUPO1, ACF302.ACFDES||'' ''||trim(ACF302.ACFDESL) DESC_JUNTA,'
      + 'ACF302.ARTCODBAR CODBARRAS, ACF302.LOCID LOCAL,ACF302.PISO,ACF302.AREA,ACF302.AMBCOD AMBIENTE,ACF302.ACFDES DENOMINACI,'
      + 'ACF302.ACFDESL,ACF302.ESTADOID ESTADO,ACF302.MATERIALID MATERIAL,ACF302.ACFMARCA MARCA,ACF302.ACFMODELO MODELO,'
      + 'ACF302.ACFSERIE SERIE,ACF302.ACFMEDIDA DIMENSIONE,'
      + 'ACF302.RECIBEID RESPONSABL, ACF302.RECIBENOM NOMBRE, ACF302.INVNUM,'
      + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVFECHA').AsString) + ' FECHAINV,'
      + 'B.LOCDES,D.AREADES,E.AMBDES '
      + 'FROM ACF302, ACF120 B, ACF121 C, ACF122 D, ACF123 E WHERE FLAG=''E'' '
      + 'AND ACF302.CIAID=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('CIAID').AsString) + ' '
      + 'AND ACF302.INVNUM=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVNUM').AsString) + ' AND '
      + '(ACF302.LOCID=B.LOCID(+)) AND '
      + '(ACF302.LOCID=C.LOCID(+) and ACF302.PISO=C.PISO(+)) AND '
      + '(ACF302.LOCID=D.LOCID(+) and ACF302.PISO=D.PISO(+)  AND ACF302.AREA=D.AREA(+)) AND '
      + '(ACF302.LOCID=E.LOCID(+) and ACF302.PISO=E.PISO(+)  and ACF302.AREA=E.AREA(+) and ACF302.AMBCOD=E.AMBCOD(+)) '
      + 'UNION ALL '
      + 'SELECT ACF302I.LOCID||ACF302I.PISO||ACF302I.AREA GRUPO1, ACF302I.ACFDES||'' ''||trim(ACF302I.ACFDESL) DESC_JUNTA,'
      + 'ACF302I.ARTCODBAR CODBARRAS, ACF302I.LOCID LOCAL,ACF302I.PISO,ACF302I.AREA,ACF302I.AMBCOD AMBIENTE,ACF302I.ACFDES DENOMINACI,'
      + 'ACF302I.ACFDESL,ACF302I.ESTADOID ESTADO,ACF302I.MATERIALID MATERIAL,ACF302I.ACFMARCA MARCA,ACF302I.ACFMODELO MODELO,'
      + 'ACF302I.ACFSERIE SERIE,ACF302I.ACFMEDIDA DIMENSIONE,'
      + 'ACF302I.RECIBEID RESPONSABL, ACF302I.RECIBENOM NOMBRE,ACF302I.INVNUM,'
      + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVFECHA').AsString) + ' FECHAINV,'
      + 'B.LOCDES,D.AREADES,E.AMBDES '
      + 'FROM ACF302I, ACF120 B, ACF121 C, ACF122 D, ACF123 E '
      + 'WHERE ACF302I.CIAID=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('CIAID').AsString)
      + ' AND ACF302I.INVNUM=' + quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVNUM').AsString) + ' AND '
      + '(ACF302I.LOCID=B.LOCID(+)) AND '
      + '(ACF302I.LOCID=C.LOCID(+) and ACF302I.PISO=C.PISO(+)) AND '
      + '(ACF302I.LOCID=D.LOCID(+) and ACF302I.PISO=D.PISO(+)  AND ACF302I.AREA=D.AREA(+)) AND '
      + '(ACF302I.LOCID=E.LOCID(+) and ACF302I.PISO=E.PISO(+)  and ACF302I.AREA=E.AREA(+) and ACF302I.AMBCOD=E.AMBCOD(+)) ';

{
      xSel:='Select ('
              +wTabla+'.LOCID||'+wTabla+'.PISO||'+wTabla+'.AREA) GRUPO1,'
              +wTabla+'.LOCID LOCAL,B.LOCDES,'
              +wTabla+'.PISO,'
              +wTabla+'.AREA,D.AREADES,'
              +wTabla+'.AMBCOD AMBIENTE,E.AMBDES,'
              +wTabla+'.ARTCODBAR CODBARRAS,'
              +wTabla+'.ACFDES DENOMINACI,'
              +wTabla+'.ESTADOID ESTADO,'
              +'trim('+wTabla+'.ACFDES)||'' ''||trim('+wTabla+'.ACFDESL) DESC_JUNTA, '
              +wTabla+'.MATERIALID MATERIAL,'
              +wTabla+'.ACFDESL,'
              +wTabla+'.ACFMARCA MARCA,'
              +wTabla+'.ACFMODELO MODELO,'
              +wTabla+'.ACFSERIE SERIE,'
              +wTabla+'.ACFMEDIDA DIMENSIONE,'
              +wTabla+'.FLAG,'
              +wTabla+'.VERI,'
              +wTabla+'.RECIBEID RESPONSABL,'
              +wTabla+'.RECIBENOM NOMBRE '
             +'from '+wTabla+', ACF120 B, ACF121 C, ACF122 D, ACF123 E WHERE '
             +'ACF201.CIAID='+quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('CIAID').AsString)
             +' AND ACF201.INVNUM='+quotedstr(oaAF5000.MantInvc.FMant.cds2.FieldbyName('INVNUM').AsString)+' AND '
             +'(ACF201.LOCID=B.LOCID(+)) AND '
             +'(ACF201.LOCID=C.LOCID(+) and ACF201.PISO=C.PISO(+)) AND '
             +'(ACF201.LOCID=D.LOCID(+) and ACF201.PISO=D.PISO(+)  AND ACF201.AREA=D.AREA(+)) AND '
             +'(ACF201.LOCID=E.LOCID(+) and ACF201.PISO=E.PISO(+)  and ACF201.AREA=E.AREA(+) and ACF201.AMBCOD=E.AMBCOD(+))';
      xSel:=StringReplace(xSel, 'ACF201', wTabla, [rfReplaceAll, rfIgnoreCase]);
}
   wlbFiltro := '';
   For nv := 0 To ACF778.MantInvD.FMant.lbFiltroReal.Count - 1 Do
   Begin
      wlbFiltro := wlbFiltro + ACF778.MantInvD.FMant.lbFiltroReal.items[nv] + ' AND ';
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
   DMAF.cdsQry.IndexFieldNames := 'CODBARRAS';
   ppdbPadron.DataSource := DMAF.dsQry;
   pprPadron.DataPipeline := ppdbPadron;
   pprPadron.Template.FileName := wRutaRpt + 'ACF\DEMA\INVXLOCALBARRAS.rtm';
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
End;

End.

