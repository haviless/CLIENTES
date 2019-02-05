Unit ACF225;
// HPC_201401_ACF      Se está adicionando el evento KeyPress a todos los controles de este
//                     formulario para activar el Tab cuando se preciona el Enter.
//                     Se corrigió el evento exit del control dblcTipoD (Tipo de Depreciación) para que aparesca su descripción.
// HPC_201601_ACF      15/06/2016 Reordena Sangría de Código
//                     16/06/2016 Cambio de actualización con Control Transaccional y Scripts directos

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ppEndUsr, ppParameter, ppCtrls, ppBands, ppClass, ppVar,
   ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppViewr,
   ppTypes, Buttons, Mask, wwdbedit, wwdblook, fcLabel, ExtCtrls, StdCtrls,
   ppModule, daDataModule;

Type
   TFContabilizaDepre = Class(TForm)
      pnl1: TPanel;
      fcLabel1: TfcLabel;
      pnl2: TPanel;
      lblPeriodo: TLabel;
      Label1: TLabel;
      Label3: TLabel;
      Label74: TLabel;
      dblcPeriodo: TwwDBLookupCombo;
      dblcCiaId: TwwDBLookupCombo;
      dblcTDiario: TwwDBLookupCombo;
      edtTDiario: TEdit;
      lbFLGDET: TListBox;
      dblcTipoD: TwwDBLookupCombo;
      dbeTipo: TwwDBEdit;
      Z2bbtnCancela: TBitBtn;
      Z2bbtnEmitir: TBitBtn;
      ppdbResumen: TppDBPipeline;
      pprResumenBoleta: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppShape1: TppShape;
      ppLabel1: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      pplblCia: TppLabel;
      ppLabel14: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel2: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      pplblPeriodo: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText9: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText8: TppDBText;
      ppDBText10: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc2: TppDBCalc;
      ppDBCalc1: TppDBCalc;
      ppParameterList1: TppParameterList;
      ppDesigner1: TppDesigner;
      cbPer: TCheckBox;
      gbPerCnt: TGroupBox;
      meMesCNT: TMaskEdit;
      cbDiseno: TCheckBox;
      sbDiseno: TSpeedButton;
      ppDBCalc3: TppDBCalc;
      Procedure FormShow(Sender: TObject);
      Procedure dblcTDiarioExit(Sender: TObject);
      Procedure Z2bbtnEmitirClick(Sender: TObject);
      Procedure dblcTipoDExit(Sender: TObject);
      Procedure Z2bbtnCancelaClick(Sender: TObject);
      Procedure dblcPeriodoExit(Sender: TObject);
      Procedure pprResumenBoletaPreviewFormCreate(Sender: TObject);
      Procedure pplblCiaPrint(Sender: TObject);
      Procedure pplblPeriodoPrint(Sender: TObject);
      Procedure cbPerClick(Sender: TObject);
      Procedure dblcTDiarioKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcTipoDKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcPeriodoKeyPress(Sender: TObject; Var Key: Char);
      Procedure cbPerKeyPress(Sender: TObject; Var Key: Char);
      Procedure sbDisenoClick(Sender: TObject);
      Procedure dblcCiaIdKeyPress(Sender: TObject; Var Key: Char);
      Procedure AddCNT300;
      Procedure AddCNT301;
      Procedure GeneraCNT;
      Procedure GeneraAsiento;
      Procedure FiltraCNT301;
   End;

Var
   FContabilizaDepre: TFContabilizaDepre;
   xSQL, wFaperiodo: String;
   wNumReg, wFLGPLPER: integer;
   xTotalBruto, xTotalAjuste, wxCNTDEBEMN, wxCNTHABEMN, wxCNTDEBEME, wxCNTHABEME: double;
   xTotalG, xTotalL, xTotalD, xTotalC, xTotalA, xTotalX, xTotalN: double;
   xTotalT, xTotalM, xTotalF: Integer;
   xFIni, xFFin, wMM, wDD, wTr, wSM, wSS, wAAMM, wAATR, wAASM, wAASS, wTCambio,
      xFiltro2, xSQL1, wUbicId, wTDiario, wTDiario1, wTDiario2, wNComprob, wxCIAID, wxTDIARID, wxCNTCOMPROB, wPerCont: String;
   wDiarioWork2, wVezPrestamo, wFLGDET, wxCUENTAID, wxCNTGLOSA, wxCNTDH, wxAUXID, wxCCOSID, xFiltro1, wTDIARID1: String;
   wxCNTMTOORI, wxCNTMTOLOC, wxCNTMTOEXT: double;
   dFechaCNT: TDateTime;
   xSigueGrab: Boolean;

Implementation

{$R *.dfm}
Uses ACFDM, oaAF3000, DB;

Procedure TFContabilizaDepre.FormShow(Sender: TObject);
Begin
// selecciona Compañia conslidada
   xSQL := 'Select * from TGE101 where CNTCONSOL=''S'' ';
   DMAF.cdsCia.Close;
   DMAF.cdsCia.DataRequest(xSQL);
   DMAF.cdsCia.Open;
// selecciona Tipos de Diario
   xSQL := 'Select * from TGE104 where FLAGAF=''S'' ';
   DMAF.cdsQry10.Close;
   DMAF.cdsQry10.DataRequest(xSQL);
   DMAF.cdsQry10.Open;
   dblcTDiario.selected.clear;
   dblcTDiario.Selected.Add('TDIARID' + #9 + '3' + #9 + 'Diar.');
   dblcTDiario.Selected.Add('TDIARDES' + #9 + '20' + #9 + 'Nombre');
// Selecciona Tipos de Depreciacion
   xSQL := 'Select * from ACF104 where CIAID=' + quotedstr(DMAF.cdsCia.FieldbyName('CIAID').AsString);
   DMAF.cdsUDep.Close;
   DMAF.cdsUDep.DataRequest(xSQL);
   DMAF.cdsUDep.Open;
   dblcTipoD.selected.clear;
   dblcTipoD.Selected.Add('DEPCOD' + #9 + '3' + #9 + 'Cod.');
   dblcTipoD.Selected.Add('DEPDESCRI' + #9 + '20' + #9 + 'Nombre');
// Selecciona Compañias no consolidadas
   xSQL := 'Select * from TGE101 where CNTCONSOL<>''S'' ';
   DMAF.cdsCia1.Close;
   DMAF.cdsCia1.DataRequest(xSQL);
   DMAF.cdsCia1.Open;
   dblcCiaId.selected.clear;
   dblcCiaId.Selected.Add('CIAID' + #9 + '3' + #9 + 'Cia.');
   dblcCiaId.Selected.Add('CIADES' + #9 + '20' + #9 + 'Nombre');
   dblcTDiario.setfocus;
   cbDiseno.Visible := False;
End;

Procedure TFContabilizaDepre.dblcTDiarioExit(Sender: TObject);
Begin
   If Z2bbtnCancela.focused Then exit;

   DMAF.cdsQry10.IndexFieldNames := 'TDIARID';
   DMAF.cdsQry10.setkey;
   DMAF.cdsQry10.fieldbyname('TDIARID').AsString := dblcTDiario.text;
   If Not DMAF.cdsQry10.gotokey Then
   Begin
      ShowMessage('Tipo de Diario no es válido');
      edtTDiario.text := '';
      dblcTDiario.SetFocus;
      exit;
   End;
   edtTDiario.text := DMAF.cdsQry10.fieldbyname('TDIARDES').AsString;
   //////////////////////////////////////////////////////////////////////
   // si es '0' indica que el comprobante que se genera coresponderá a el
   // mes de la planilla.
   // si es '1' indica que el comprobante que se genera coresponderá a el
   // mes de la planilla + 1.
   wFLGPLPER := StrToInt(DMAF.cdsQry10.fieldbyname('FLGPLPER').AsString);
   wDiarioWork2 := dblcTDiario.Text;
   dblcTipoD.setfocus;
   //////////////////////////////////////////////////////////////////////
End;

Procedure TFContabilizaDepre.Z2bbtnEmitirClick(Sender: TObject);
Begin
   dblcTDiarioExit(self);
   xTotalG := 0;
   xTotalX := 0;
   xTotalL := 0;
   xTotalD := 0;
   xTotalC := 0;
   xTotalN := 0;
   xTotalA := 0;
   xTotalM := 0;
   xTotalF := 0;

   Screen.Cursor := crHourGlass;
   If dblcPeriodo.Text = '' Then
   Begin
      ShowMessage('Error : Falta Ingresar periodo');
      Screen.Cursor := crDefault;
      Exit;
   End;
   If dblcCiaId.Text = '' Then
   Begin
      ShowMessage('Error : Falta Ingresar la Compañia');
      Screen.Cursor := crDefault;
      Exit;
   End;

   If DMAF.cdsQry10.FieldByName('FLAGAF').AsString = 'S' Then // x Diario del Activo Fijo
   Begin
      GeneraAsiento;
      Screen.Cursor := crDefault;
      Exit;
   End;
End;

Procedure TFContabilizaDepre.AddCNT300;
Begin
// Insertamos en CNT300
   DMAF.cdsQry8.Append;
   DMAF.cdsQry8.FieldByName('CIAID').AsString := wxCiaId;
   DMAF.cdsQry8.FieldByName('TDIARID').AsString := wxTDIARID;

// Se acambia a Periodo Destino
   DMAF.cdsQry8.FieldByName('CNTANOMM').AsString := meMesCNT.text;
   DMAF.cdsQry8.FieldByName('CNTCOMPROB').AsString := '00000' + Copy(dblcPeriodo.text, 5, 2) + Copy(wxCNTCOMPROB, 8, 3);
   DMAF.cdsQry8.FieldByName('CNTFCOMP').AsDateTime := dFechaCNT;
   DMAF.cdsQry8.FieldByName('CNTMM').AsString := wMM; // mes
   DMAF.cdsQry8.FieldByName('CNTDD').AsString := wDD; // día
   DMAF.cdsQry8.FieldByName('CNTTRI').AsString := wTR; // trimestre
   DMAF.cdsQry8.FieldByName('CNTSEM').AsString := wSM; // semestre
   DMAF.cdsQry8.FieldByName('CNTSS').AsString := wSS; // semana
   DMAF.cdsQry8.FieldByName('CNTAATRI').AsString := wAATR; // año+trimestre
   DMAF.cdsQry8.FieldByName('CNTAASEM').AsString := wAASM; // año+semestre
   DMAF.cdsQry8.FieldByName('CNTAASS').AsString := wAASS; // año+semana
   DMAF.cdsQry8.FieldByName('CNTESTADO').AsString := 'I'; // I=Inicial
   DMAF.cdsQry8.FieldByName('CNTANO').AsString := copy(meMesCNT.text, 1, 4);
   DMAF.cdsQry8.FieldByName('TDIARDES').AsString := DMAF.cdsQry10.FieldbyName('TDIARDES').AsString;
   DMAF.cdsQry8.FieldByName('MODULO').AsString := 'AF';
   DMAF.cdsQry8.FieldByName('DOCMOD').AsString := 'AF';
   DMAF.cdsQry8.FieldByName('CNTLOTE').AsString := 'AFME';
   DMAF.cdsQry8.FieldByName('CNTGLOSA').AsString := DMAF.cdsQry10.FieldbyName('TDIARDES').AsString;
   DMAF.cdsQry8.FieldByName('TMONID').AsString := DMAF.wTMonLoc;
   DMAF.cdsQry8.FieldByName('CNTTCAMBIO').AsFloat := FRound(strtocurr(wTCambio), 15, 3);
   DMAF.cdsQry8.FieldByName('CNTTS').AsString := 'BV';
   DMAF.cdsQry8.FieldByName('CNTUSER').AsString := DMAF.wUsuario; // usuario que registra
   DMAF.cdsQry8.FieldByName('CNTFREG').AsdateTime := date; // fecha que registra usuario
   DMAF.cdsQry8.FieldByName('CNTHREG').AsdateTime := time; // hora que registra usuario
   DMAF.cdsQry8.FieldByName('CNTCUADRE').AsString := '';
   DMAF.cdsQry8.FieldByName('CNTESTADO').AsString := 'I'; //P
   DMAF.cdsQry8.FieldByName('CNTDEBEMN').AsFloat := wxCNTDEBEMN;
   DMAF.cdsQry8.FieldByName('CNTHABEMN').AsFloat := wxCNTHABEMN;
   DMAF.cdsQry8.FieldByName('CNTDEBEME').AsFloat := wxCNTDEBEME;
   DMAF.cdsQry8.FieldByName('CNTHABEME').AsFloat := wxCNTHABEME;
   DMAF.cdsQry8.Post;

   xSQL := 'Insert into CNT300(CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTFCOMP, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, '
      + '                      CNTAASEM, CNTAASS, CNTESTADO, CNTANO, TDIARDES, MODULO, DOCMOD, CNTLOTE, CNTGLOSA, TMONID, CNTTCAMBIO, '
      + '                      CNTTS, CNTUSER, CNTFREG, CNTHREG, CNTCUADRE, CNTDEBEMN, CNTHABEMN, CNTDEBEME, CNTHABEME) '
      + '   values('
      + quotedstr(DMAF.cdsQry8.FieldByName('CIAID').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('TDIARID').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTANOMM').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTCOMPROB').AsString) + ','
      + quotedstr(datetostr(DMAF.cdsQry8.FieldByName('CNTFCOMP').AsDateTime)) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTMM').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTDD').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTTRI').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTSEM').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTSS').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTAATRI').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTAASEM').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTAASS').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTESTADO').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTANO').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('TDIARDES').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('MODULO').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('DOCMOD').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTLOTE').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTGLOSA').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('TMONID').AsString) + ','
      + floattostr(DMAF.cdsQry8.FieldByName('CNTTCAMBIO').AsFloat) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTTS').AsString) + ','
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTUSER').AsString) + ','
      + '           trunc(sysdate),'
      + '           sysdate, '
      + quotedstr(DMAF.cdsQry8.FieldByName('CNTCUADRE').AsString) + ','
      + floattostr(DMAF.cdsQry8.FieldByName('CNTDEBEMN').AsFloat) + ','
      + floattostr(DMAF.cdsQry8.FieldByName('CNTHABEMN').AsFloat) + ','
      + floattostr(DMAF.cdsQry8.FieldByName('CNTDEBEME').AsFloat) + ','
      + floattostr(DMAF.cdsQry8.FieldByName('CNTHABEME').AsFloat) + ')';
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
End;

Procedure TFContabilizaDepre.AddCNT301;
Begin
// Insertamos en CNT301
   DMAF.cdsQry9.Append;
   DMAF.cdsQry9.FieldByName('CIAID').AsString := DMAF.cdsQry6.FieldbyName('CIAID1').AsString;
   DMAF.cdsQry9.FieldByName('TDIARID').AsString := DMAF.cdsQry6.FieldbyName('TDIARID').AsString;
   DMAF.cdsQry9.FieldByName('CNTCOMPROB').AsString := '00000' + Copy(dblcPeriodo.text, 5, 2) + Copy(wNComprob, 8, 3);
   DMAF.cdsQry9.FieldByName('CNTANO').AsString := copy(meMesCNT.Text, 1, 4);
   DMAF.cdsQry9.FieldByName('CNTANOMM').AsString := meMesCNT.Text;

   DMAF.cdsQry9.FieldByName('CNTLOTE').AsString := 'AFME';
   DMAF.cdsQry9.FieldByName('CUENTAID').AsString := DMAF.cdsQry6.FieldbyName('CUENTAID').AsString;

   If (DMAF.cdsQry6.FieldByName('FLGDET').AsString = 'B') Then // Diario de Egresos de Bancos
      DMAF.cdsQry9.FieldByName('CUENTAID').AsString := TRIM(DMAF.cdsQry6.FieldbyName('CUENTAID').AsString) +
         DMAF.cdsQry2.FieldbyName('TRABBCODEP').AsString;

   DMAF.cdsQry9.FieldByName('CNTGLOSA').AsString := trim(DMAF.cdsQry6.FieldbyName('CNTGLOSA').AsString) +
      '  (' + DMAF.cdsQry6.FieldbyName('CIAID').AsString + ')' +
      '  ' + copy(dblcPeriodo.text, 5, 2) + '/' +
      copy(dblcPeriodo.text, 1, 4);

   If DMAF.cdsQry6.FieldByName('FLGDET').AsString = 'C' Then // x Diario del Activo Depreciacion
   Begin
      If length(DMAF.cdsQry2.FieldbyName('CCOSID').AsString) > 0 Then
         DMAF.cdsQry9.FieldByName('CCOSID').AsString := DMAF.cdsQry2.FieldbyName('CCOSID').AsString
      Else
         DMAF.cdsQry9.FieldByName('CCOSID').AsString := '0000';
   End;

   If (DMAF.cdsQry6.FieldByName('FLGDET').AsString = 'A') Then // Diario de Prestamos, Liquidacione y Bancos
   Begin // en cuentas que van al detalle con el AUXID(TRABID)
      DMAF.cdsQry9.FieldByName('CLAUXID').AsString := 'E';
   End;

   DMAF.cdsQry9.FieldByName('CNTSERIE').AsString := 'AFIJO';
   DMAF.cdsQry9.FieldByName('CNTDH').AsString := DMAF.cdsQry6.FieldbyName('CNTDH').AsString;
   DMAF.cdsQry9.FieldByName('TMONID').AsString := DMAF.wTMonLoc;
   DMAF.cdsQry9.FieldByName('CNTTCAMBIO').AsFloat := StrToFloat(wTCambio);
   DMAF.cdsQry9.FieldByName('CNTMTOORI').AsFloat := DMAF.cdsQry2.fieldbyname('MONTORUBRO').AsFloat;
   If DMAF.cdsQry9.FieldByName('TMONID').AsString = DMAF.wTMonLoc Then
   Begin
      DMAF.cdsQry9.FieldByName('CNTMTOLOC').AsFloat := DMAF.cdsQry9.FieldByName('CNTMTOORI').AsFloat;
      DMAF.cdsQry9.FieldByName('CNTMTOEXT').AsFloat := FRound(DMAF.cdsQry9.FieldByName('CNTMTOORI').AsFloat /
         DMAF.cdsQry9.FieldByName('CNTTCAMBIO').AsFloat, 15, 2);
   End;

   If (DMAF.cdsQry9.FieldByName('CNTDH').AsString = 'D') Then
   Begin
      DMAF.cdsQry9.FieldByName('CNTDEBEMN').AsFloat := DMAF.cdsQry9.FieldByName('CNTMTOLOC').AsFloat;
      DMAF.cdsQry9.FieldByName('CNTDEBEME').AsFloat := DMAF.cdsQry9.FieldByName('CNTMTOEXT').AsFloat;
      DMAF.cdsQry9.FieldByName('CNTHABEMN').AsFloat := 0;
      DMAF.cdsQry9.FieldByName('CNTHABEME').AsFloat := 0;
   End
   Else
   Begin
      DMAF.cdsQry9.FieldByName('CNTHABEMN').AsFloat := DMAF.cdsQry9.FieldByName('CNTMTOLOC').AsFloat;
      DMAF.cdsQry9.FieldByName('CNTHABEME').AsFloat := DMAF.cdsQry9.FieldByName('CNTMTOEXT').AsFloat;
      DMAF.cdsQry9.FieldByName('CNTDEBEMN').AsFloat := 0;
      DMAF.cdsQry9.FieldByName('CNTDEBEME').AsFloat := 0;
   End;
   DMAF.cdsQry9.FieldByName('CNTCUADRE').AsString := ''; //S

   DMAF.cdsQry9.FieldByName('CNTTS').AsString := 'BV';
   DMAF.cdsQry9.FieldByName('CNTMODDOC').AsString := 'AF';
   DMAF.cdsQry9.FieldByName('CNTFCOMP').AsDateTime := dFechaCNT;
   DMAF.cdsQry9.FieldByName('CNTFEMIS').AsDateTime := DMAF.cdsFactor.FieldByName('FAFECDEPRE').AsDateTime;
   DMAF.cdsQry9.FieldByName('CNTFVCMTO').AsDateTime := DMAF.cdsFactor.FieldByName('FAFECDEPRE').AsDateTime;
   DMAF.cdsQry9.FieldByName('CNTESTADO').AsString := 'Z'; // luego se actualiza a I=Inicial
   DMAF.cdsQry9.FieldByName('CNTUSER').AsString := DMAF.wUsuario; // usuario que registra
   DMAF.cdsQry9.FieldByName('CNTFREG').AsDateTime := date; // fecha que registra usuario
   DMAF.cdsQry9.FieldByName('CNTHREG').AsDateTime := time; // hora que registra usuario
   DMAF.cdsQry9.FieldByName('CNTREG').AsInteger := wNumreg + 1;
   DMAF.cdsQry9.FieldByName('MODULO').AsString := 'AF';

   DMAF.cdsQry9.FieldByName('CNTMM').AsString := wMM; // mes
   DMAF.cdsQry9.FieldByName('CNTDD').AsString := wDD; // día
   DMAF.cdsQry9.FieldByName('CNTTRI').AsString := wTR; // trimestre
   DMAF.cdsQry9.FieldByName('CNTSEM').AsString := wSM; // semestre
   DMAF.cdsQry9.FieldByName('CNTSS').AsString := wSS; // semana
   DMAF.cdsQry9.FieldByName('CNTAATRI').AsString := wAATR; // año+trimestre
   DMAF.cdsQry9.FieldByName('CNTAASEM').AsString := wAASM; // año+semestre
   DMAF.cdsQry9.FieldByName('CNTAASS').AsString := wAASS; // año+semana

   DMAF.cdsQry9.Post;
   xSQL := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CNTGLOSA, CCOSID, '
      + '                      CLAUXID, CNTSERIE, CNTDH, TMONID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTDEBEMN, '
      + '                      CNTDEBEME, CNTHABEMN, CNTHABEME, CNTCUADRE, CNTTS, CNTMODDOC, CNTFCOMP, CNTFEMIS, CNTFVCMTO, CNTESTADO, '
      + '                      CNTUSER, CNTFREG, CNTHREG, CNTREG, MODULO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS) '
      + '   Values(' + quotedstr(DMAF.cdsQry9.FieldByName('CIAID').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('TDIARID').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTCOMPROB').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTANO').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTANOMM').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTLOTE').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CUENTAID').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTGLOSA').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CCOSID').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CLAUXID').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTSERIE').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTDH').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('TMONID').AsString) + ','
      + floattostr(DMAF.cdsQry9.FieldByName('CNTTCAMBIO').AsFloat) + ','
      + floattostr(DMAF.cdsQry9.FieldByName('CNTMTOORI').AsFloat) + ','
      + floattostr(DMAF.cdsQry9.FieldByName('CNTMTOLOC').AsFloat) + ','
      + floattostr(DMAF.cdsQry9.FieldByName('CNTMTOEXT').AsFloat) + ','
      + floattostr(DMAF.cdsQry9.FieldByName('CNTDEBEMN').AsFloat) + ','
      + floattostr(DMAF.cdsQry9.FieldByName('CNTDEBEME').AsFloat) + ','
      + floattostr(DMAF.cdsQry9.FieldByName('CNTHABEMN').AsFloat) + ','
      + floattostr(DMAF.cdsQry9.FieldByName('CNTHABEME').AsFloat) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTCUADRE').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTTS').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTMODDOC').AsString) + ','
      + quotedstr(datetostr(DMAF.cdsQry9.FieldByName('CNTFCOMP').AsDateTime)) + ','
      + quotedstr(datetostr(DMAF.cdsQry9.FieldByName('CNTFEMIS').AsDateTime)) + ','
      + quotedstr(datetostr(DMAF.cdsQry9.FieldByName('CNTFVCMTO').AsDateTime)) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTESTADO').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTUSER').AsString) + ','
      + '              trunc(sysdate),'
      + '              sysdate, '
      + inttostr(DMAF.cdsQry9.FieldByName('CNTREG').AsInteger) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('MODULO').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTMM').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTDD').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTTRI').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTSEM').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTSS').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTAATRI').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTAASEM').AsString) + ','
      + quotedstr(DMAF.cdsQry9.FieldByName('CNTAASS').AsString) + ')';
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
End;

Procedure TFContabilizaDepre.FiltraCNT301;
Begin
   xFiltro2 := 'CIAID=' + quotedstr(wxCIAID)
      + ' and TDIARID=' + quotedstr(wxTDIARID)
      + ' and CUENTAID=' + quotedstr(wxCUENTAID)
      + ' and CNTGLOSA=' + quotedstr(wxCNTGLOSA)
      + ' and (CCOSID IS NULL OR TRIM(CCOSID)=' + quotedstr(wxCCOSID) + ')'
      + ' and (AUXID IS NULL OR AUXID=' + quotedstr(wxAUXID) + ')'
      + ' and CNTDH=' + quotedstr(wxCNTDH);
End;

Procedure TFContabilizaDepre.GeneraAsiento;
Var
   sFecha: String;
Begin
   If dblcPeriodo.Text = '200705' Then
      sFecha := '30/06/2007'
   Else
      sFecha := DMAF.CDSFACTOR.FieldByName('FAFECDEPRE').AsString;

   xSQL := 'Select to_date(last_day(''01/' + Copy(meMesCNT.text, 5, 2) + '/' + Copy(meMesCNT.text, 1, 4) + ''')) FecMes from dual';
   DMAF.AbreCDS(DMAF.cdsQry, xSQL, '', '');
   dFechaCNT := DMAF.cdsQry.FieldByname('fecmes').AsDateTime;

   xSQL := 'Select TACFID, ''C'' GRUBID,CCOSID,sum(DEPIMPHIST) MONTORUBRO '
      + '     from ACF204 '
      + '    where UBICID=' + quotedstr(dblcCiaId.Text)
      + '      and FAPERIODO=' + quotedstr(dblcPeriodo.Text)
      + '      and ACFFINIDEP<' + quotedstr(sFecha)
      + '    group by TACFID,CCOSID ';
   DMAF.AbreCDS(DMAF.cdsQry2, xSQL, '', '');
   GeneraCNT;
End;

Procedure TFContabilizaDepre.GeneraCNT;
Var
   xIndice, xFiltro, xRubBasico, xWhere, wDiarioWork: String;
   xrub4tacat, xrubIES, xmonmin, wUbicId, wCiaId1, xFiltro1: String;
   xGanancia, xtmn4tacat, xtmnIES: double;
   i, xCNTREG: integer;
Begin
   wVezPrestamo := '0';
   /////////////////////////////////////////////////////////////////////////////
   // Determina que TIPOS DE ACTIVOS intervienen para generar el Asiento de acuerdo a ACF150
   xIndice := 'TACFID';
   xFiltro := '';
   lbFLGDET.Items.Clear;
   If wTDIARID1 = '' Then
      xSQL := 'Select CIAID, TACFID, CUENTAID, CNTDH, CNTGLOSA, CIAID1, TACFID1, TDIARID, FLGDET '
         + '     from ACF150 '
         + '    where CIAID=' + quotedstr(dblcCiaId.Text)
         + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
   Else
      xSQL := 'Select CIAID, TACFID, CUENTAID, CNTDH, CNTGLOSA, CIAID1, TACFID1, TDIARID, FLGDET '
         + '     from ACF150 '
         + '    where CIAID=' + quotedstr(dblcCiaId.Text)
         + '      and TDIARID=' + quotedstr(wTDIARID1);
   DMAF.cdsQry6.Filter := '';
   DMAF.cdsQry6.Filtered := False;
   DMAF.AbreCDS(DMAF.cdsQry6, xSQL, xIndice, xFiltro);

   /////////////////////////////////////////////////////////////////////////////
   // carga lbFLGDET, con las Cuentas que se generaran al detalle,
   // si FLGDET='N' sin detalle, 'C' detalle por CCOSID, 'A' detalle x AUXID
   DMAF.cdsQry6.First;
   While Not DMAF.cdsQry6.EOF Do
   Begin
      If DMAF.cdsQry6.FieldByName('FLGDET').AsString <> 'N' Then
      Begin
         lbFLGDET.Items.Add(DMAF.cdsQry6.FieldByName('FLGDET').AsString +
            DMAF.cdsQry6.FieldByName('CUENTAID').AsString);
      End;
      DMAF.cdsQry6.Next;
   End;

   DMAF.cdsQry2.First;
   While Not DMAF.cdsQry2.EOF Do
   Begin
      DMAF.cdsQry6.SetKey;
      DMAF.cdsQry6.FieldByName('TACFID').AsString := DMAF.cdsQry2.fieldbyname('TACFID').AsString;
      If Not DMAF.cdsQry6.Gotokey Then
      Begin
         DMAF.cdsQry2.Edit;
         DMAF.cdsQry2.fieldbyname('GRUBID').AsString := 'Z';
         DMAF.cdsQry2.Post;
      End;
      DMAF.cdsQry2.Next;
   End;
   DMAF.cdsQry6.Filter := '';
   DMAF.cdsQry6.Filtered := False;
   DMAF.cdsQry2.Filter := 'GRUBID<>' + quotedstr('Z');
   DMAF.cdsQry2.Filtered := True;

   /////////////////////////////////////////////////////////////////////////////
   // Genera el Asiento de Impuestos para Cia. Principal y Filiales
   // y tambien los otros rubros de Boleta Normal (Ganancias y Descuentos)
   // de acuerdo a la dinamica de la tabla RRHH150
   // Este proceso se puede realizar varias veces
   /////////////////////////////

   wNComprob := '0000000001';
   wXTDIARID := dblcTDIARIO.Text;
   //          Para determinar la Cia. Principal, supuestamente '02'
   xFiltro := 'FLGCIA=' + QuotedStr('S');
   DMAF.AbreCDS(DMAF.cdsQry7, 'Select * from TGE117 ', '', xFiltro);
   wCiaId1 := DMAF.cdsQry7.FieldbyName('CIAID').AsString;

   /////////////////////////////////////////////////////////////////////////////
   // se eliminan registros solo la primera vez de proceso, si se trata de un diario
   // que se agrupa con otro no se elimina en la segunda vez del proceso
   // ej: Diario '14'-Sueldos y '80'-Prestamos
   If wVezPrestamo = '0' Then
      wDiarioWork := dblcTDiario.Text
   Else
      wDiarioWork := wTDIARID1;

   // Se Verifica En Periodo Destino
   xFiltro := '(CIAID=' + QuotedStr(dblcCiaId.Text)
      + '   AND TDIARID=' + QuotedStr(wDiarioWork)
      + '   AND CNTANOMM=' + QuotedStr(meMesCNT.Text)
      + '   AND CNTLOTE=''AFME'' '
      + '   AND CNTCOMPROB LIKE ''00000''||''' + Copy(dblcPeriodo.text, 5, 2) + '%'' )';

   xFiltro1 := '(CIAID=' + QuotedStr(dblcCiaId.Text)
      + '    AND TDIARID=' + QuotedStr(wDiarioWork)
      + '    AND CNTANOMM=' + QuotedStr(meMesCNT.Text)
      + '    AND CNTLOTE=''AFME'' '
      + '    AND CNTCOMPROB LIKE ''00000''||''' + Copy(dblcPeriodo.text, 5, 2) + '%'' ) '
      + ' OR    (CIAID=' + QuotedStr(wCiaId1)
      + '    AND CNTGLOSA LIKE ' + QuotedStr('%(' + dblcCiaId.Text + ')%')
      + '    AND TDIARID=' + QuotedStr(wDiarioWork)
      + '    AND CNTANOMM=' + QuotedStr(meMesCNT.Text)
      + '    AND CNTLOTE=''AFME'' AND CNTCOMPROB LIKE ''00000''||''' + Copy(dblcPeriodo.text, 5, 2) + '%'' ) ';

   /////////////////////////////////////////////////////////////////////////////
   // chequea si existen comprobantes ya generados para este periodo
   DMAF.AbreCDS(DMAF.cdsQry8, 'Select * from CNT300 where ' + xFiltro, '', '');
   If DMAF.cdsQry8.RecordCount > 0 Then
   Begin
      If MessageDlg('¡¡¡YA EXISTEN COMPROBANTES GENERADOS EN ESTE PERIODO!!!, ¿ Desea regenerarlos ? ',
         mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;
   End;

// Elimina los registros de los archivos Contables
   xSQL := 'Delete from CNT300 where ' + xFiltro;
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL := 'Delete from CNT311 where ' + xFiltro1;
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL := 'Delete from CNT301 where ' + xFiltro1;
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);

   DMAF.cdsQry7.Close;
   DMAF.cdsQry8.Close;
   DMAF.cdsQry9.Close;
   DMAF.cdsQry7.Filter := '';
   DMAF.cdsQry7.Filtered := False;
   DMAF.cdsQry8.Filter := '';
   DMAF.cdsQry8.Filtered := False;
   DMAF.cdsQry9.Filter := '';
   DMAF.cdsQry9.Filtered := False;
   DMAF.AbreCDS(DMAF.cdsQry8, 'Select * from CNT300 where ' + xFiltro, '', '');
   DMAF.AbreCDS(DMAF.cdsQry9, 'select * from CNT311 where ' + xFiltro1, '', '');

   xSQL := 'FECHA=' + DMAF.wRepFuncDate + '''' + formatdatetime(DMAF.wFormatFecha, DMAF.cdsFactor.FieldbyName('FAFECDEPRE').AsDateTime) + '''' + ')';
   If length(DMAF.DisplayDescrip('dspTGE', 'TGE114', '*', XSQL, 'FECANO')) > 0 Then
   Begin
      wMM := DMAF.cdsQry.fieldbyname('FECMES').Value; // mes
      wDD := DMAF.cdsQry.fieldbyname('FECDIA').Value; // día
      wTR := DMAF.cdsQry.fieldbyname('FECSEM').Value; // semestre
      wSS := DMAF.cdsQry.fieldbyname('FECSS').Value; // semana
      wAATR := DMAF.cdsQry.fieldbyname('FECAATRI').Value; // año+trimestre
      wAASM := DMAF.cdsQry.fieldbyname('FECAASEM').Value; // año+semestre
      wAASS := DMAF.cdsQry.fieldbyname('FECAASS').Value; // año+semana
   End;

   /////////////////////////////
   // Tipo de Cambio
   xSQL := 'FECHA=' + DMAF.wRepFuncDate + '''' + formatdatetime(DMAF.wFormatFecha, DMAF.cdsFactor.FieldbyName('FAFECDEPRE').AsDateTime) + '''' + ')';
   wTCambio := Floattostrf(DMAF.DisplayReal('dspTGE', 'TGE107', 'TCAMVBV', xSQL, 'TCAMVBV'),
      fffixed, 15, 3);
   If (Length(wTCambio) = 0) Or (wTCambio = '0.000') Then
   Begin
      ShowMessage('Error: Fecha NO Tiene Registrado el Tipo de Cambio');
      Exit;
   End;

   DMAF.cdsQry2.IndexFieldNames := 'TACFID';
   DMAF.cdsQry2.First;
   While Not DMAF.cdsQry2.EOF Do
   Begin
      DMAF.cdsQry6.Filter := '';
      DMAF.cdsQry6.Filtered := False;
      DMAF.cdsqry6.Filter := 'CIAID=' + quotedstr(dblcCiaId.Text)
         + '              AND TACFID=' + quotedstr(DMAF.cdsQry2.fieldbyname('TACFID').AsString);
      DMAF.cdsQry6.Filtered := True;
      DMAF.cdsQry6.First;
      While Not DMAF.cdsQry6.EOF Do
      Begin
            ////////////////////////////////////////////////////////////////////
            // Numeracion del Comprobante:
            // Si se trata de la Principal se numera '00000000'+cia filial.
            // Si se trata de la Filial se numera '0000000001'
         If wCiaId1 = DMAF.cdsQry6.FieldbyName('CIAID1').AsString Then
            wNComprob := '0000000001' //+dblcCiaid.Text
         Else
            wNComprob := '0000000001';
         AddCNT301;
      //   DMAF.AplicaDatos(DMAF.cdsQry9, '');
         DMAF.cdsQry6.Next;
      End;
      DMAF.cdsQry2.Next;
   End;
   /////////////////////////////////////////////////////////////////////////////
   // Lee el CNT311 para sumarizar AFP y numerar 'CNTREG'
   xSQL := 'Select * from CNT311 where 1<>1 ';
   DMAF.AbreCDS(DMAF.cdsQry3, xSQL, '', '');
   /////////////////////////////////////////////////////////////////////////////
   xSQL := 'Select a.*, rowid from CNT311 A where ' + xFiltro1 + ' Order by CIAID, TDIARID, CUENTAID, CNTGLOSA, CCOSID, AUXID, CNTDH ';
   /////////////////////////////////////////////////////////////////////////////
   DMAF.cdsQry3.Close;
   DMAF.cdsQry3.Filter := '';
   DMAF.cdsQry3.Filtered := False;
   DMAF.AbreCDS(DMAF.cdsQry9, xSQL, '', '');
   DMAF.cdsQry3.Data := DMAF.cdsQry9.Data;
   DMAF.cdsQry9.First;
   While Not DMAF.cdsQry9.EOF Do
   Begin
      wFLGDET := 'N';
      If (DMAF.cdsQry10.FieldByName('FLAGAF').AsString = 'S') Then // x Diario del Activo
      Begin
         For i := 0 To lbFLGDET.Count - 1 Do
         Begin
            If Pos(DMAF.cdsQry9.FieldByName('CUENTAID').AsString, lbFLGDET.Items[i]) > 0 Then
            Begin
               wFLGDET := copy(lbFLGDET.Items[i], 1, 1);
            End;
         End;
      End;
      wxCNTMTOORI := 0;
      wxCNTMTOLOC := 0;
      wxCNTMTOEXT := 0;
      wxCNTDEBEMN := 0;
      wxCNTHABEMN := 0;
      wxCNTDEBEME := 0;
      wxCNTHABEME := 0;
      wxCCOSID := '';
      wxAUXID := '';

      wxCIAID := DMAF.cdsQry9.FieldbyName('CIAID').AsString;
      wxTDIARID := DMAF.cdsQry9.FieldbyName('TDIARID').AsString;
      wxCUENTAID := DMAF.cdsQry9.FieldbyName('CUENTAID').AsString;
      wxCNTGLOSA := DMAF.cdsQry9.FieldbyName('CNTGLOSA').AsString;
      xCNTREG := DMAF.cdsQry9.FieldbyName('CNTREG').AsInteger;

      If wFLGDET = 'C' Then // x Centro de Costo y Cuenta al Detalle
         wxCCOSID := DMAF.cdsQry9.FieldbyName('CCOSID').AsString;

      If (wFLGDET = 'A') Or (wFLGDET = 'L') Or (wFLGDET = 'B') Then // x Diario de Prestamos,Liquidaciones, Bancos y Cuenta al Detalle
         wxAUXID := DMAF.cdsQry9.FieldbyName('AUXID').AsString; // estos Flags se usaron para Planillas

      wxCNTDH := DMAF.cdsQry9.FieldbyName('CNTDH').AsString;
      While Not DMAF.cdsQry9.EOF
         And (wxCIAID = DMAF.cdsQry9.FieldbyName('CIAID').AsString)
         And (wxTDIARID = DMAF.cdsQry9.FieldbyName('TDIARID').AsString)
         And (wxCUENTAID = DMAF.cdsQry9.FieldbyName('CUENTAID').AsString)
         And (wxCNTGLOSA = DMAF.cdsQry9.FieldbyName('CNTGLOSA').AsString)
         And (wxCCOSID = DMAF.cdsQry9.FieldbyName('CCOSID').AsString)
         And (wxAUXID = DMAF.cdsQry9.FieldbyName('AUXID').AsString)
         And (wxCNTDH = DMAF.cdsQry9.FieldbyName('CNTDH').AsString) Do
      Begin
         wxCNTMTOORI := wxCNTMTOORI + DMAF.cdsQry9.FieldbyName('CNTMTOORI').AsFloat;
         wxCNTMTOLOC := wxCNTMTOLOC + DMAF.cdsQry9.FieldbyName('CNTMTOLOC').AsFloat;
         wxCNTMTOEXT := wxCNTMTOEXT + DMAF.cdsQry9.FieldbyName('CNTMTOEXT').AsFloat;
         wxCNTDEBEMN := wxCNTDEBEMN + DMAF.cdsQry9.FieldbyName('CNTDEBEMN').AsFloat;
         wxCNTHABEMN := wxCNTHABEMN + DMAF.cdsQry9.FieldbyName('CNTHABEMN').AsFloat;
         wxCNTDEBEME := wxCNTDEBEME + DMAF.cdsQry9.FieldbyName('CNTDEBEME').AsFloat;
         wxCNTHABEME := wxCNTHABEME + DMAF.cdsQry9.FieldbyName('CNTHABEME').AsFloat;
         DMAF.cdsQry9.Next;
      End;
    //////////////////////////////////////////////////////////////////////
      {
      xFiltro2 := 'CIAID=' + quotedstr(wxCIAID)
       + ' and TDIARID=' + quotedstr(wxTDIARID)
       + ' and CUENTAID=' + quotedstr(wxCUENTAID)
       + ' and CNTGLOSA=' + quotedstr(wxCNTGLOSA)
       + ' and (CCOSID IS NULL OR TRIM(CCOSID)=' + quotedstr(wxCCOSID) + ')'
       + ' and (AUXID IS NULL OR AUXID=' + quotedstr(wxAUXID) + ')'
       + ' and CNTDH=' + quotedstr(wxCNTDH);

      }
      FiltraCNT301; // aqui carga la variable xFILTRO2;
      DMAF.cdsQry3.Filter := '';
      DMAF.cdsQry3.Filtered := False;
      DMAF.cdsqry3.Filter := xFiltro2;
      DMAF.cdsQry3.Filtered := True;
    ///////////////////////////////////////////////////////////////////////
      DMAF.cdsQry3.Edit;
      DMAF.cdsQry3.FieldbyName('TDIARID').AsString := dblcTDiario.Text; //wxCNTMTOORI;
      DMAF.cdsQry3.FieldbyName('CNTMTOORI').AsFloat := wxCNTMTOORI;
      DMAF.cdsQry3.FieldbyName('CNTMTOLOC').AsFloat := wxCNTMTOLOC;
      DMAF.cdsQry3.FieldbyName('CNTMTOEXT').AsFloat := wxCNTMTOEXT;
      DMAF.cdsQry3.FieldbyName('CNTDEBEMN').AsFloat := wxCNTDEBEMN;
      DMAF.cdsQry3.FieldbyName('CNTHABEMN').AsFloat := wxCNTHABEMN;
      DMAF.cdsQry3.FieldbyName('CNTDEBEME').AsFloat := wxCNTDEBEME;
      DMAF.cdsQry3.FieldbyName('CNTHABEME').AsFloat := wxCNTHABEME;
      DMAF.cdsQry3.FieldByName('CNTHREG').AsDateTime := time;
      DMAF.cdsQry3.FieldbyName('CNTESTADO').AsString := 'I';
      DMAF.cdsQry3.Post;
      xSQL := 'Update CNT311 '
         + '      Set TDIARID=' + quotedstr(DMAF.cdsQry3.FieldbyName('TDIARID').AsString) + ','
         + '          CNTMTOORI=' + floattostr(DMAF.cdsQry3.FieldbyName('CNTMTOORI').AsFloat) + ', '
         + '          CNTMTOLOC=' + floattostr(DMAF.cdsQry3.FieldbyName('CNTMTOLOC').AsFloat) + ', '
         + '          CNTMTOEXT=' + floattostr(DMAF.cdsQry3.FieldbyName('CNTMTOEXT').AsFloat) + ', '
         + '          CNTDEBEMN=' + floattostr(DMAF.cdsQry3.FieldbyName('CNTDEBEMN').AsFloat) + ', '
         + '          CNTHABEMN=' + floattostr(DMAF.cdsQry3.FieldbyName('CNTHABEMN').AsFloat) + ', '
         + '          CNTDEBEME=' + floattostr(DMAF.cdsQry3.FieldbyName('CNTDEBEME').AsFloat) + ', '
         + '          CNTHABEME=' + floattostr(DMAF.cdsQry3.FieldbyName('CNTHABEME').AsFloat) + ', '
         + '          CNTHREG=sysdate, '
         + '          CNTESTADO=' + quotedstr(DMAF.cdsQry3.FieldbyName('CNTESTADO').AsString)
         + '    Where ' + xFiltro2;
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      //DMAF.AplicaDatos(DMAF.cdsQry3, '');
   End;
   DMAF.cdsQry3.Filter := '';
   DMAF.cdsQry3.Filtered := False;
   DMAF.cdsQry9.Data := DMAF.cdsQry3.Data;
   DMAF.cdsQry3.Close;
   // Elimina del CNT311 los registros con CNTESTADO='Z'

   xSQL := 'Delete FROM CNT311 '
      + '    where (CIAID=' + QuotedStr(dblcCiaId.Text)
      + '      and TDIARID=' + QuotedStr(dblcTDiario.Text)
      + '      and CNTANOMM=' + QuotedStr(meMesCNT.text)
      + '      and CNTESTADO=' + quotedstr('Z') + ')'
      + '    or '
      + '         (CIAID=' + QuotedStr(wCiaId1)
      + '      and CNTGLOSA LIKE ' + QuotedStr('%(' + dblcCiaId.Text + ')%')
      + '      and TDIARID=' + QuotedStr(dblcTDiario.Text)
      + '      and CNTANOMM=' + QuotedStr(meMesCNT.text)
      + '      and CNTESTADO=' + quotedstr('Z') + ')'
      + '    or '
      + '         (CIAID=' + QuotedStr(dblcCiaId.Text)
      + '      and TDIARID=' + QuotedStr(wTDIARID1)
      + '      and CNTANOMM=' + QuotedStr(meMesCNT.text)
      + '      and CNTESTADO=' + quotedstr('Z') + ')'
      + '    or '
      + '         (CIAID=' + QuotedStr(wCiaId1)
      + '      and TDIARID=' + QuotedStr(wTDIARID1)
      + '      and CNTANOMM=' + QuotedStr(meMesCNT.text)
      + '      and CNTESTADO=' + quotedstr('Z') + ')';
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);

   /////////////////////////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////////////////////
   // Este proceso se usa en Planillas, no se usa para el Activo Fijo
   // Variable para determiniar si a un Diario principal, se le agruparan otros Diarios,
   // por Ej: el caso del Diario '14' Sueldos (generado x rubros) , que en su proceso
   // excluye los prestamos de los trabajadores, por que estos se generan al detalle
   // ( rubro/trabid), y el prestamo como Diario '80' debe juntarse al '14', entonces,
   // cuando se termina de procesar el '14' en forma automatica el programa generara
   // proceso del Diario '80' y adicionando estos registros al CNT311 como TDIARID='14'.
   wTDIARID1 := DMAF.cdsQry10.FieldByName('TDIARID1').AsString;

   If (wTDIARID1 <> '') And (wVezPrestamo = '0') Then
   Begin
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest('SELECT * FROM TGE104 WHERE TDIARID=' + quotedstr(wTDIARID1));
      DMAF.cdsQry.Open;
      If DMAF.cdsQry.FieldByName('FLAGPL').AsString = 'A' Then // x Diario de Prestamos
      Begin
        //solo se ejecuta por asiento de planillas
        // GeneraPrestamos; // este procedimiento vuelve a ejecutar el GeneraCNT.
//         Exit;
      End;
   End;
   /////////////////////////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////////////////////

   // Actualiza correlativo NUMREG, Numero de Comprobante y adiciona Cabecera - CNT300
   wDiarioWork := wDiarioWork2;
   dblcTDiario.Text := wDiarioWork2;
   xFiltro1 := '(CIAID=' + QuotedStr(dblcCiaId.Text) +
      ' AND TDIARID=' + QuotedStr(wDiarioWork) +
      ' AND CNTANOMM=' + QuotedStr(meMesCNT.text) + ' AND CNTCOMPROB LIKE ''00000''||''' + Copy(dblcPeriodo.text, 5, 2) + '%'' )' +
      ' OR ' +
      ' (CIAID=' + QuotedStr(wCiaId1) +
      ' AND CNTGLOSA LIKE ' + QuotedStr('%(' + dblcCiaId.Text + ')%') +
      ' AND TDIARID=' + QuotedStr(wDiarioWork) +
      ' AND CNTANOMM=' + QuotedStr(meMesCNT.text) + ' AND CNTCOMPROB LIKE ''00000''||''' + Copy(dblcPeriodo.text, 5, 2) + '%'')';
   DMAF.cdsQry9.Close;
   xSQL := 'SELECT * FROM CNT311 WHERE ' + xFiltro1 + ' ORDER BY CIAID,TDIARID,CNTCOMPROB,CNTGLOSA,CNTDH,CUENTAID ';
   DMAF.AbreCDS(DMAF.cdsQry9, xSQL, '', '');
   DMAF.cdsQry9.First;
   While Not DMAF.cdsQry9.EOF Do
   Begin
      wNumReg := 0;
      wxCNTDEBEMN := 0;
      wxCNTHABEMN := 0;
      wxCNTDEBEME := 0;
      wxCNTHABEME := 0;
      wxCIAID := DMAF.cdsQry9.FieldbyName('CIAID').AsString;
      wxTDIARID := DMAF.cdsQry9.FieldbyName('TDIARID').AsString;
      wxCNTCOMPROB := DMAF.cdsQry9.FieldbyName('CNTCOMPROB').AsString;
      While Not DMAF.cdsQry9.EOF
         And (wxCIAID = DMAF.cdsQry9.FieldbyName('CIAID').AsString)
         And (wxTDIARID = DMAF.cdsQry9.FieldbyName('TDIARID').AsString)
         And (wxCNTCOMPROB = DMAF.cdsQry9.FieldbyName('CNTCOMPROB').AsString) Do
      Begin
         wNumReg := wNumReg + 1;
         wxCNTDEBEMN := wxCNTDEBEMN + DMAF.cdsQry9.FieldbyName('CNTDEBEMN').AsFloat;
         wxCNTHABEMN := wxCNTHABEMN + DMAF.cdsQry9.FieldbyName('CNTHABEMN').AsFloat;
         wxCNTDEBEME := wxCNTDEBEME + DMAF.cdsQry9.FieldbyName('CNTDEBEME').AsFloat;
         wxCNTHABEME := wxCNTHABEME + DMAF.cdsQry9.FieldbyName('CNTHABEME').AsFloat;
         DMAF.cdsQry9.Edit;
         DMAF.cdsQry9.FieldbyName('CNTREG').AsFloat := wNumReg;
         DMAF.cdsQry9.FieldByName('CNTHREG').AsDateTime := time;
         DMAF.cdsQry9.FieldByName('CNTESTADO').AsString := 'I';
         DMAF.AplicaDatos(DMAF.cdsQry9, '');
         DMAF.cdsQry9.Next;
      End;
      AddCNT300;
   //   DMAF.AplicaDatos(DMAF.cdsQry8, '');
   End;

   ppdbResumen.DataSource := DMAF.dsQry9;

   If DMAF.cdsQry10.FieldByName('FLAGAF').AsString = 'S' Then // x Diario del Activo
   Begin
      pprResumenBoleta.template.FileName := wRutaRpt + 'ACF\DEMA\REPASIENTOCTS.rtm';
      pprResumenBoleta.template.LoadFromFile;
      ppLabel2.Caption := 'DEPRECIACION DEL ACTIVO FIJO  - Asiento Contable';
   End;

   Screen.Cursor := crDefault;
   If cbDiseno.Checked Then
   Begin
      ppDesigner1.Report := pprResumenBoleta;
      ppDesigner1.ShowModal;
   End
   Else
   Begin
      pprResumenBoleta.Print;
      pprResumenBoleta.Stop;
      pprResumenBoleta.DataPipeline := Nil;
   End;
End;

Procedure TFContabilizaDepre.dblcTipoDExit(Sender: TObject);
Var
   xSQL: String;
   xWhere: String;
Begin
// Inicio HPC_201401_ACF
   xWhere := 'DEPCOD=''' + dblcTipoD.Text + '''';
   dbeTipo.Text := DMAF.DisplayDescrip('dspTGE', 'ACF104', 'DEPDESCRI', xWhere, 'DEPDESCRI');

   If dbeTipo.Text = '' Then
   Begin
      dblcTipoD.SetFocus;
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   End;
// Fin HPC_201401_ACF
   xSQL := 'SELECT * '
      + '  FROM ACF102 WHERE CIAID=' + quotedstr(DMAF.cdsCia.FieldbyName('CIAID').AsString)
      + '   AND FAPROC=''P'' ';
   DMAF.cdsFactor.Close;
   DMAF.cdsFactor.DataRequest(xSQL);
   DMAF.cdsFactor.Open;
   dblcPeriodo.selected.clear;
   dblcPeriodo.Selected.Add('FAPERIODO' + #9 + '3' + #9 + 'Periodo');
End;

Procedure TFContabilizaDepre.Z2bbtnCancelaClick(Sender: TObject);
Begin
   DMAF.cdsQry2.DisableControls;
   DMAF.dsQry2.Dataset := Nil;
   Close;
End;

Procedure TFContabilizaDepre.dblcPeriodoExit(Sender: TObject);
Var
   wMesCont: integer;
Begin
   If Z2bbtnCancela.focused Then exit;
   DMAF.cdsFactor.IndexFieldNames := 'FAPERIODO';
   DMAF.cdsFactor.setkey;
   DMAF.cdsFactor.fieldbyname('FAPERIODO').AsString := dblcPeriodo.Text;
   If Not DMAF.cdsFactor.gotokey Then
   Begin
      ShowMessage('Periodo no es válido');
      dblcPeriodo.setfocus;
      exit;
   End;

   // Periodo Destino
   meMesCNT.Text := dblcPeriodo.Text;

   DMAF.wveperbol := dblcPeriodo.text;
   /////////////////////////////////////////////////////////////////////////////
   // Para fecha de Comprobante COntable, un mes mas del mes de proceso
   wMesCont := strToInt(copy(dblcPeriodo.Text, 5, 2)) + wFLGPLPER;
   If wMesCont <= 9 Then // mes contable
      wPerCont := '0' + IntToStr(wMesCont) //Periodo Contable
   Else
      wPerCont := IntToStr(wMesCont);

   DMAF.cdsFactor.setkey;
   DMAF.cdsFactor.fieldbyname('FAPERIODO').AsString := copy(dblcPeriodo.Text, 1, 4) + wPerCont;
   DMAF.cdsFactor.gotokey;
   xFIni := DMAF.cdsFactor.fieldbyname('FAFECDEPRE').AsString;
   xFFin := DMAF.cdsFactor.fieldbyname('FAFECDEPRE').AsString;
   /////////////////////////////////////////////////////////////////////////////
   // se ubica nuevamente en el periodo de proceso
   DMAF.cdsFactor.setkey;
   DMAF.cdsFactor.fieldbyname('FAPERIODO').AsString := dblcPeriodo.Text;
   DMAF.cdsFactor.gotokey;
End;

Procedure TFContabilizaDepre.pprResumenBoletaPreviewFormCreate(
   Sender: TObject);
Begin
   pprResumenBoleta.PreviewForm.WindowState := WsMaximized;
   TppViewer(pprResumenBoleta.PreviewForm.Viewer).ZoomSetting := zs100Percent;
End;

Procedure TFContabilizaDepre.pplblCiaPrint(Sender: TObject);
Begin
   pplblCia.Caption := DMAF.cdsCia1.FieldbyName('CIAID').AsString + ' - ' + DMAF.cdsCia1.FieldbyName('CIADES').AsString;
End;

Procedure TFContabilizaDepre.pplblPeriodoPrint(Sender: TObject);
Begin
   pplblPeriodo.Text := wPerCont + '/' + copy(dblcPeriodo.Text, 1, 4)
End;

Procedure TFContabilizaDepre.cbPerClick(Sender: TObject);
Begin
   If cbPer.Checked Then
      gbPerCnt.Enabled := True
   Else
      gbPerCnt.Enabled := False;
End;

Procedure TFContabilizaDepre.dblcTDiarioKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFContabilizaDepre.dblcTipoDKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFContabilizaDepre.dblcPeriodoKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
// Fin HPC_201401_ACF
End;

Procedure TFContabilizaDepre.cbPerKeyPress(Sender: TObject; Var Key: Char);
Begin
// Inicia HPC_201401_ACF
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFContabilizaDepre.sbDisenoClick(Sender: TObject);
Begin
   cbDiseno.Checked := Not cbDiseno.Checked;
End;

Procedure TFContabilizaDepre.dblcCiaIdKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

End.

