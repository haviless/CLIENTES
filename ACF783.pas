Unit ACF783;
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201107_ACF
// FECHA DE MODIF.  : 13/05/2011
// DESCRIPCION      : Se modifica las consultas para que muestren el código de
//                    barras del campo ACF201.CODIGOBARRA
//********************************************************

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, ComCtrls, ppEndUsr, ppBands, ppPrnabl,
   ppClass, ppCtrls, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
   ppDBPipe, ppVar, ppParameter, wwdblook, wwdbdatetimepicker;

Type
   TFToolsDepreciacion = Class(TForm)
      pnlDepreciacion: TPanel;
      pcDepreciacion: TPageControl;
      ts1: TTabSheet;
      ts2: TTabSheet;
      cbConsultas: TComboBox;
      ppDBQry: TppDBPipeline;
      pprQry: TppReport;
      ppdsgQry: TppDesigner;
      ppParameterList1: TppParameterList;
      dblcPeriodoD: TwwDBLookupCombo;
      Label1: TLabel;
      cbFecRep: TCheckBox;
      gbFecRep: TGroupBox;
      dtpFecRep: TwwDBDateTimePicker;
      Label2: TLabel;
      rgHoja: TRadioGroup;
      ppHeaderBand2: TppHeaderBand;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLine4: TppLine;
      ppLabel19: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLine5: TppLine;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppDBText10: TppDBText;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppFooterB2: TppFooterBand;
      plblFiltro1: TppLabel;
      ppSummaryBand2: TppSummaryBand;
      ppShape2: TppShape;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppLabel3: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppShape7: TppShape;
      ppDBText55: TppDBText;
      ppDBText56: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLine6: TppLine;
      ppDBCalc31: TppDBCalc;
      ppDBCalc32: TppDBCalc;
      ppDBCalc33: TppDBCalc;
      ppDBCalc34: TppDBCalc;
      ppDBCalc35: TppDBCalc;
      ppReport1: TppReport;
      ppParameterList2: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppSystemVariable2: TppSystemVariable;
      pplFec: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppLabel40: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc1: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppDBCalc14: TppDBCalc;
      ppLabel50: TppLabel;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBCalc4: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBText24: TppDBText;
      ppLabel51: TppLabel;
      ppDBCalc15: TppDBCalc;
      ppLabel52: TppLabel;
      Procedure pcDepreciacionChange(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure cbConsultasChange(Sender: TObject);
      Procedure ppFooterBand1BeforeGenerate(Sender: TObject);
      Procedure cbFecRepClick(Sender: TObject);
   Private
    { Private declarations }
      FFooterBand: TppBand;
   Public
    { Public declarations }
   End;

Var
   FToolsDepreciacion: TFToolsDepreciacion;

Implementation

Uses ACFDM, ACF777, oaAF2000, SOLRef01;

{$R *.DFM}

Procedure TFToolsDepreciacion.pcDepreciacionChange(Sender: TObject);
Var
   xSQL: String;
Begin
   ts1.highlighted := False;
   ts2.highlighted := False;

   If pcDepreciacion.ActivePage = ts1 Then // x Depreciacion Definitiva
   Begin
      DMAF.wJK := '0';
      ts1.highlighted := True;
      XSQL := 'SELECT * FROM ACF204 ';
      ACF777.MantDepre.UsuarioSQL.Clear;
      ACF777.MantDepre.FMant.wTabla := 'ACF204';
      ACF777.MantDepre.UsuarioSQL.Add(XSQL);
      ACF777.MantDepre.NewQuery;
   End;

   If pcDepreciacion.ActivePage = ts2 Then // x Depreciacion Preliminar
   Begin
      DMAF.wJK := '0';
      ts2.highlighted := True;
      XSQL := 'SELECT * FROM ACF204W ';

      ACF777.MantDepre.UsuarioSQL.Clear;
      ACF777.MantDepre.FMant.wTabla := 'ACF204W';
      ACF777.MantDepre.UsuarioSQL.Add(XSQL);
      ACF777.MantDepre.NewQuery;
   End;
End;

Procedure TFToolsDepreciacion.FormCreate(Sender: TObject);
Var
   xSql, xSelSAnterior: String;
Begin
   pcDepreciacion.ActivePage := ts1;
   DMAF.cdsFACTOR.Close;
   DMAF.cdsFACTOR.DataRequest('SELECT * FROM ACF102 WHERE DEPCOD=''01'' AND FAPROC=''P'' ORDER BY FAFECDEPRE DESC');
   DMAF.cdsFACTOR.Open;
End;

Procedure TFToolsDepreciacion.cbConsultasChange(Sender: TObject);
Var
   xSelSAnterior, wMesAno, xSQL, wPeriodoMM, wPeriodoIni, wPeriodoFin, wPeriodoAAMM, wPeriodoAA: String;
   wlbFiltroTexto, wlbFiltro1, mm, xReplace, xFile1, xFile2, xSel, xSel1, xSel2, xGroup, xGroup1, xGroup2, xOrder, wlbFiltro, wAlias, wlbOrder: String;
   nv, i, nPos: integer;
   pLabel: TppLabel;
   pFooter0, pFooter1, pFooter2: TppFooterBand;
//   ppFooterB0, ppFooterb1, ppFooterB2 : TppFooterBand;
Begin
   xGroup := '';
   xOrder := '';
   xSel1 := '';
   xGroup1 := '';
   xFile1 := '';
   xFile2 := '';
   wlbFiltroTexto := '';
   xSel2 := '';
   xGroup2 := '';
   wPeriodoAAMM := DMAF.cdsFactor.FieldbyName('FAPERIODO').AsString;
   wPeriodoIni := '01/' + copy(wPeriodoAAMM, 5, 2) + '/' + copy(wPeriodoAAMM, 1, 4);
   wPeriodoAA := copy(wPeriodoAAMM, 1, 4);
   wMesAno := copy(wPeriodoAAMM, 5, 2) + '/' + copy(wPeriodoAAMM, 1, 4);
   wPeriodoMM := copy(wPeriodoAAMM, 5, 2);
   wPeriodoFin := DMAF.cdsFactor.FieldbyName('FAFECDEPRE').AsString;
      // Depreciacion Resumen x Tipo de Activo
   If cbConsultas.ItemIndex = 0 Then
   Begin
      xSel := 'SELECT XX.TACFID, XX.CUENTAID, XX.TACFDES, XX.DEPFECHA,SUM(SINDEPRE) SINDEPRE,SUM(VH) VH, '
         + 'SUM(VA) VA, SUM(DH) DH, SUM(DA) DA, SUM(ANTHIST) ANTHIST,SUM(DELMES) DELMES, SUM(NETOHIST) NETOHIST FROM '
         + '(SELECT ACF204.TACFID, ACF204.CUENTAID, B.TACFDES, ACF204.DEPFECHA, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')=ACF204.FAPERIODO AND DEPACUHIST=0)  THEN SUM(ACF204.DEPVALHIST) ELSE 0 END SINDEPRE, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPVALHIST) ELSE 0 END VH, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPVALAJUS) ELSE 0 END VA, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPACUHIST) ELSE 0 END DH, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPACUAJUS) ELSE 0 END DA, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPANTHIST) ELSE 0 END ANTHIST, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPIMPHIST) ELSE 0 END DELMES, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPNETOHIS) ELSE 0 END NETOHIST '
         + ' FROM ACF204, ACF101 B ' // Depreciacion
         + 'WHERE ACF204.UBICID IS NOT NULL AND ACF204.TACFID=B.TACFID '
         + 'AND ACF204.DEPFECDEPR=' + quotedstr(wPeriodoFin)
         + ' AND ACF204.DEPFLAGPRO IN(''X'',''P'') '
         + ' AND ACF204.VERI=' + quotedstr('S');
      xGroup := ' GROUP BY ACF204.TACFID,ACF204.CUENTAID, B.TACFDES, ACF204.DEPFECHA, '
         + ' ACF204.ACFFINIDEP, ACF204.FAPERIODO, DEPACUHIST ) XX '
         + 'GROUP BY XX.TACFID,XX.CUENTAID, XX.TACFDES, XX.DEPFECHA ';

      xSel1 := 'UNION ALL SELECT ACF201.TACFID, ACF201.CUENTAID, B.TACFDES, TO_DATE('
         + quotedstr(wPeriodoFin) + ') DEPFECHA, SUM(ACF201.ACFVALOMN) SINDEPRE, 0.00 VH, '
         + 'SUM(ACF201.ACFVALOMN) VA, 0.00 DH, 0.00 DA, 0.00 ANTHIST, 0.00 DELMES, 0.00 NETOHIST '
         + 'FROM ACF201, ACF101 B, (SELECT * FROM ACF101 WHERE TACFVIDA=0) X ' // Depreciacion
         + 'WHERE ACF201.TACFID=B.TACFID '
         + 'AND ACF201.TACFID=X.TACFID '
         + ' AND ACF201.ACFFLAGACT=''A'' '
         + ' AND ACF201.ACFFECADQ<=' + quotedstr(wPeriodoFin)
         + ' AND (ACF201.DESANOMES IS NULL OR ACF201.DESANOMES=' + quotedstr('') + ' OR ACF201.DESANOMES>' + quotedstr(wMesAno) + ') '
         + ' AND ACF201.VERI=' + quotedstr('S');
      xGroup1 := 'GROUP BY ACF201.TACFID,ACF201.CUENTAID, B.TACFDES ';
      xFile1 := 'ACF204.';
      xFile2 := 'ACF201.';

   End;
      ////////////////////
      ////////////////////
      // Depreciacion Resumen x Compañia / Tipo de Activo
   If cbConsultas.ItemIndex = 1 Then
   Begin
      xSel := 'SELECT XX.UBICID, XX.CIADES, XX.TACFID, XX.CUENTAID, XX.TACFDES, XX.DEPFECHA, SUM(SINDEPRE) SINDEPRE,SUM(VH) VH, '
         + 'SUM(VA) VA, SUM(DH) DH, SUM(DA) DA, SUM(ANTHIST) ANTHIST,SUM(DELMES) DELMES, SUM(NETOHIST) NETOHIST, '
         + 'SUM(SINDEPRE) + SUM(NETOHIST) TOTALNETO FROM '
         + '(SELECT ACF204.UBICID, C.CIADES, ACF204.TACFID, ACF204.CUENTAID, B.TACFDES, ACF204.DEPFECHA, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')=ACF204.FAPERIODO AND DEPACUHIST=0)  THEN SUM(ACF204.DEPVALHIST) ELSE 0 END SINDEPRE, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPVALHIST) ELSE 0 END VH, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPVALAJUS) ELSE 0 END VA, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPACUHIST) ELSE 0 END DH, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPACUAJUS) ELSE 0 END DA, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPANTHIST) ELSE 0 END ANTHIST, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPIMPHIST) ELSE 0 END DELMES, '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPNETOHIS) ELSE 0 END NETOHIST, '

           // NUEVA COLUMNA
      + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO AND DEPACUHIST>0) THEN SUM(ACF204.DEPNETOHIS) ELSE 0 END + '
         + ' CASE WHEN (TO_CHAR( ACFFINIDEP,''YYYYMM'')=ACF204.FAPERIODO AND DEPACUHIST=0)  THEN SUM(ACF204.DEPVALHIST) ELSE 0 END TOTNETO '

      + ' FROM ACF204, ACF101 B, TGE101 C ' // Depreciacion
         + 'WHERE ACF204.UBICID IS NOT NULL AND ACF204.UBICID=C.CIAID AND ACF204.TACFID=B.TACFID '
         + 'AND ACF204.DEPFECDEPR=' + quotedstr(wPeriodoFin)
         + ' AND ACF204.DEPFLAGPRO IN(''X'',''P'') '
         + ' AND ACF204.VERI=' + quotedstr('S');
      xGroup := ' GROUP BY ACF204.UBICID, C.CIADES,ACF204.TACFID,ACF204.CUENTAID, B.TACFDES, ACF204.DEPFECHA, '
         + ' ACF204.ACFFINIDEP, ACF204.FAPERIODO, DEPACUHIST ) XX '
         + 'GROUP BY XX.UBICID, XX.CIADES, XX.TACFID,XX.CUENTAID, XX.TACFDES, XX.DEPFECHA ';

      xSel1 := 'UNION ALL SELECT ACF201.UBICID, C.CIADES, ACF201.TACFID, ACF201.CUENTAID, B.TACFDES,TO_DATE('
         + quotedstr(wPeriodoFin) + ') DEPFECHA, '
         + 'SUM(ACF201.ACFVALOMN) SINDEPRE, 0.00 VH, '
         + 'SUM(ACF201.ACFVALOMN) VA, 0.00 DH, 0.00 DA, 0.00 ANTHIST, 0.00 DELMES, 0.00 NETOHIST, SUM(ACF201.ACFVALOMN) TOTNETO '
         + 'FROM ACF201, ACF101 B, TGE101 C, (SELECT * FROM ACF101 WHERE TACFVIDA=0) X ' // ACTIVOS NO DEPRECIABLES
         + 'WHERE ACF201.ubicid=C.CIAID and ACF201.TACFID=B.TACFID '
         + 'AND ACF201.TACFID=X.TACFID '
         + ' AND ACF201.ACFFLAGACT=''A'' '
         + ' AND ACF201.ACFFECADQ<=' + quotedstr(wPeriodoFin)
         + ' AND (ACF201.DESANOMES IS NULL OR ACF201.DESANOMES=' + quotedstr('') + ' OR ACF201.DESANOMES>' + quotedstr(wMesAno) + ') '
         + ' AND ACF201.VERI=' + quotedstr('S');
      xGroup1 := ' GROUP BY ACF201.UBICID,C.CIADES,ACF201.TACFID,ACF201.CUENTAID, B.TACFDES ';

      xSel2 := 'UNION ALL SELECT ACF201.UBICID, C.CIADES, ACF201.TACFID, ACF201.CUENTAID, B.TACFDES,TO_DATE('
         + quotedstr(wPeriodoFin) + ') DEPFECHA, '
         + 'SUM(ACF201.ACFVALOMN) SINDEPRE, 0.00 VH, '
         + 'SUM(ACF201.ACFVALOMN) VA, 0.00 DH, 0.00 DA, 0.00 ANTHIST, 0.00 DELMES, 0.00 NETOHIST, SUM(ACF201.ACFVALOMN) TOTNETO '
         + 'FROM ACF201, ACF101 B, TGE101 C, (SELECT * FROM ACF101 WHERE TACFVIDA>0) X ' // ACTIVOS DEPRECIABLES
         + 'WHERE ACF201.ubicid=C.CIAID and ACF201.TACFID=B.TACFID '
         + 'AND ACF201.TACFID=X.TACFID'
         + ' AND ACF201.ACFFLAGACT=''A'' '
         + ' AND ACF201.ACFFECADQ>=' + quotedstr(wPeriodoIni)
         + ' AND ACF201.ACFFECADQ<=' + quotedstr(wPeriodoFin)
         + ' and acf201.cuentaid like ''332%'' '
         + ' AND (ACF201.DESANOMES IS NULL OR ACF201.DESANOMES=' + quotedstr('') + ' OR ACF201.DESANOMES>' + quotedstr(wMesAno) + ') '
         + ' AND ACF201.VERI=' + quotedstr('S');
      xGroup2 := ' GROUP BY ACF201.UBICID,C.CIADES,ACF201.TACFID,ACF201.CUENTAID, B.TACFDES ';

      xFile1 := 'ACF204.';
      xFile2 := 'ACF201.';
   End;
      //////////////////////////////////////////////////////////////////////////
      // Cuadre Nuevo Activo
   If cbConsultas.ItemIndex = 2 Then
   Begin
      If ACF777.MantDepre.SectionName = 'AFDepreciacion' Then
      Begin
         wlbFiltro1 := '';
         For nv := 0 To ACF777.MantDepre.FMant.lbFiltroReal.Count - 1 Do
         Begin
            wlbFiltro1 := wlbFiltro1 + ACF777.MantDepre.FMant.lbFiltroReal.items[nv] + ' AND ';
         End;
      End;
      If length(wlbFiltro1) > 0 Then
         wlbFiltro1 := ' AND ' + copy(wlbFiltro1, 1, length(wlbFiltro1) - 5) + ' '
      Else
         wlbFiltro1 := '';

      xSelSAnterior := '';
      For i := 1 To StrToInt(wPeriodoMM) Do
      Begin
         mm := DMAF.strzero(i, 2);
         xSelSAnterior := xSelSAnterior +
            ' SELECT ' + QUOTEDSTR(mm) + ' MES, SUM(ACFVALOMN) SANTERIOR, 0 INGRESOS, 0 SALIDAS,'
            + ' 0 SALDO,0 VALAJUS, 0 VALHIST, 0 ACUHIST, 0 ACUAJUS, 0 DEPACUMANT, 0 DEPMES, 0 DEPNETO  FROM ACF201 '
            + ' WHERE ACFFLAGACT<>' + quotedstr('P') + ' AND VERI=' + quotedstr('S') + ' AND ACFFECADQ<' + QUOTEDSTR('01/' + mm + '/' + wPeriodoAA)
            + ' AND (DESANO IS NULL OR  DESANOMES>=' + QUOTEDSTR(wPeriodoAA + mm) + ')' + wlbFiltro1
            + ' GROUP BY ' + QUOTEDSTR(mm)
            + ' UNION ALL';
      End;

      xSel := 'SELECT ' + quotedstr(wPeriodoAAMM) + ' PERIODO, MES, '
         + ' case when MES=''01'' THEN ''Ene'''
         + '      when MES=''02'' THEN ''Feb'''
         + '      when MES=''03'' THEN ''Mar'''
         + '      when MES=''04'' THEN ''Abr'''
         + '      when MES=''05'' THEN ''May'''
         + '      when MES=''06'' THEN ''Jun'''
         + '      when MES=''07'' THEN ''Jul'''
         + '      when MES=''08'' THEN ''Ago'''
         + '      when MES=''09'' THEN ''Set'''
         + '      when MES=''10'' THEN ''Oct'''
         + '      when MES=''11'' THEN ''Nov'''
         + '      when MES=''12'' THEN ''Dic'''
         + ' end NomMes,'
         + ' ROUND(SUM(SANTERIOR),2) SANTERIOR, ROUND(SUM(INGRESOS),2) INGRESOS,'
         + ' ROUND(SUM(SALIDAS),2) SALIDAS, ROUND(SUM(SANTERIOR)+SUM(INGRESOS)-SUM(SALIDAS),2) SALDO,'
         + ' SUM(VALAJUS) VALAJUS, SUM(VALHIST) VALHIST, SUM(ACUHIST) ACUHIST, SUM(ACUAJUS) ACUAJUS,'
         + ' SUM(DEPACUMANT) DEPACUMANT, SUM(DEPMES) DEPMES, SUM(DEPNETO) DEPNETO'
         + ' FROM   ('
         + xSelSAnterior
         + ' SELECT SUBSTR(ACFFECADQ,4,2) MES, 0 SANTERIOR, SUM (ACFVALOMN) INGRESOS, 0 SALIDAS, 0 SALDO,'
         + ' 0 VALAJUS, 0 VALHIST, 0 ACUHIST, 0 ACUAJUS, 0 DEPACUMANT, 0 DEPMES, 0 DEPNETO FROM ACF201 '
         + ' WHERE ACFFLAGACT<>' + quotedstr('P') + ' AND VERI=' + quotedstr('S')
         + ' AND ACFFECADQ>=' + QUOTEDSTR('01/01/' + wPeriodoAA)
         + ' AND ACFFECADQ <=' + QUOTEDSTR(WPeriodoFin) + wlbFiltro1
         + ' GROUP BY SUBSTR(ACFFECADQ,4,2)'
         + ' UNION ALL'
         + ' SELECT SUBSTR(DESANOMES,5,2) MES, 0 SANTERIOR, 0 INGRESOS, SUM(ACFVALOMN) SALIDAS, 0 SALDO,'
         + ' 0 VALAJUS, 0 VALHIST, 0 ACUHIST, 0 ACUAJUS, 0 DEPACUMANT, 0 DEPMES, 0 DEPNETO  FROM ACF201'
         + ' WHERE ACFFLAGACT<>' + quotedstr('P') + ' AND VERI=' + quotedstr('S')
         + ' AND DESANOMES>=' + QUOTEDSTR(wPeriodoAA + '01') + ' AND DESANOMES<=' + QUOTEDSTR(wPeriodoAAMM) + wlbFiltro1
         + ' GROUP BY SUBSTR(DESANOMES,5,2)'
         + ' UNION ALL'
         + ' SELECT SUBSTR(DEPFECDEPR,4,2) MES,0 SANTERIOR, 0 INGRESOS, 0 SALIDAS, 0 SALDO, SUM(DEPVALAJUS) VALAJUS,'
         + ' SUM(DEPVALHIST) VALHIST, SUM(DEPACUHIST) ACUHIST, SUM(DEPACUAJUS) ACUAJUS, '
         + ' SUM(DEPANTHIST) DEPACUMANT, SUM(DEPIMPHIST) DEPMES, SUM(DEPNETOHIS) DEPNETO FROM ACF204'
         + ' WHERE DEPFECDEPR>=' + QUOTEDSTR('01/01/' + wPeriodoAA) + ' and DEPFECDEPR <=' + QUOTEDSTR(wPeriodoFin) + wlbFiltro1
         + ' GROUP BY SUBSTR(DEPFECDEPR,4,2)  ) A'
         + ' GROUP BY MES'
         + ' ORDER BY MES';
       //Cuadre Activo (anterior)
 {       xSel:='SELECT '+quotedstr(wPeriodoAAMM)+' PERIODO, CIAID, CIADES, TIPREG, CUENTAID, TACFDES,  SUM(SALANT) SALANT,SUM(COMPRAS) COMPRAS, '
           +'SUM(BAJAS) BAJAS, SUM(SALACT) SALACT, '
           +'SUM(FACSANT) FACSANT,SUM(FACMES) FACMES,SUM(FACSANT+FACMES) FACACT '
           +'FROM ('
           +'SELECT A.CIAID, B.CIADES, ''1'' TIPREG, A.CUENTAID, C.TACFDES, '
           +'SUM(SALANT) SALANT, SUM(COMPRAS) COMPRAS, SUM(BAJAS) BAJAS, SUM((SALANT+COMPRAS)) SALACT, '
           +'0 FACSANT, 0 FACMES, 0 FACSACT '
           +'FROM ('
           +'SELECT CIAID, CUENTAID, '
           +'CASE WHEN ((ACFFECADQ<'+quotedstr(wPeriodoIni)+') AND (ACFFLAGACT=''A'')) THEN SUM( NVL(ACFVALOMN,0)) ELSE 0 END SALANT, '
           +'CASE WHEN ((ACFFECADQ>='+quotedstr(wPeriodoIni)+' and ACFFECADQ<='
           +quotedstr(wPeriodoFin)+') AND (ACFFLAGACT=''A''))THEN SUM(NVL(ACFVALOMN,0)) '
           +'ELSE 0 END COMPRAS, '
           +'CASE WHEN ((ACFFECADQ>='+quotedstr(wPeriodoIni)+' and ACFFECADQ<='+quotedstr(wPeriodoFin)+') AND (ACFFLAGACT=''I''))THEN SUM(NVL(ACFVALOMN,0)) '
           +'ELSE 0 END BAJAS '
           +'FROM ACF201 '
           +'Where CIAID=''02'' AND ACFFLAGACT=''A'' AND TMONID IS NOT NULL AND VERI=''S'' '
           +'Group by CIAID,CUENTAID,ACFFECADQ,ACFFLAGACT) A, TGE101 B, ACF101 C '
           +'Where A.CIAID=B.CIAID(+) and A.CUENTAID=C.CUENTAID(+) '
           +'Group by A.CIAID, B.CIADES,A.CUENTAID, C.TACFDES '
           +'UNION ALL '
           +'SELECT A.CIAID, B.CIADES, ''1'' TIPREG, A.CUENTAID, C.TACFDES, 0 SALANT, 0 COMPRAS, 0 BAJAS, 0 SALACT, '
           +'SUM(FACSANT) FACSANT, SUM(FACMES) FACMES, SUM((FACSANT+FACMES)) FACSACT '
           +'FROM ('
           +'SELECT CIAID, CUENTAID, '
           +'CASE WHEN ((DCPANOMM<'+quotedstr(wPeriodoAAMM)+') AND (DCPESTDO=''P'')) THEN SUM( NVL(DCPMOLOC,0)) ELSE 0 END FACSANT, '
           +'CASE WHEN ((DCPANOMM='+quotedstr(wPeriodoAAMM)+') AND (DCPESTDO=''P'')) THEN SUM(NVL(DCPMOLOC,0)) ELSE 0 END FACMES '
           +'FROM CXP302 '
           +'Where DCPESTDO=''P'' AND CUENTAID LIKE ''33%'' '
//           +'Where CIAID=''01'' AND DCPESTDO=''P'' AND CUENTAID LIKE ''33%'' '
           +'Group by CIAID,CUENTAID,DCPANOMM,DCPESTDO) A, TGE101 B, ACF101 C '
           +'Where A.CIAID=B.CIAID(+) and A.CUENTAID=C.CUENTAID(+) '
           +'Group by A.CIAID, B.CIADES,A.CUENTAID, C.TACFDES '
           +') ';
         xGroup:=' GROUP BY CIAID, CIADES, TIPREG, CUENTAID, TACFDES ';
                                               }
   End;
      //////////////////////////////////////////////////////////////////////////
      // Cuadre de la Depreciacion
   If cbConsultas.ItemIndex = 33333 Then // no se usa
   Begin
      xSel := 'SELECT ' + quotedstr(wPeriodoAAMM) + ' PERIODO, A.CIAID, B.CIADES, ''2'' TIPREG, A.CUENTAID, C.TACFDES, SUM(SALANTVH) SALANTVH, SUM(COMPVH) COMPVH, '
         + 'SUM(BAJAVH) BAJAVH, SUM((SALANTVH+COMPVH)-BAJAVH)  SALACTVH, SUM(HISTVAJ) HISTVAJ, '
         + 'SUM(REIANT) REIANT, SUM(REIMES) REIMES, SUM(REIANT+REIMES) REIACT, SUM(NETO) NETO,SUM(NETO1) NETO1, '
         + 'SUM(IMPHIST) IMPHIST, SUM(IMPAJUS) IMPAJUS '
         + 'FROM ('
         + 'SELECT CIAID, CUENTAID, '
         + 'CASE WHEN ((DEPFECHA=' + quotedstr(wPeriodoFin) + ') and (ACFFECADQ<' + quotedstr(wPeriodoIni)
         + ') AND (DEPFLAGPRO IN(''X'',''P''))) THEN SUM( NVL(DEPVALHIST,0)) ELSE 0 END SALANTVH, '
         + 'CASE WHEN ((ACFFECADQ>=' + quotedstr(wPeriodoIni) + ' and ACFFECADQ<=' + quotedstr(wPeriodoFin)
         + ') AND (DEPFECHA=' + quotedstr(wPeriodoFin) + ') AND (DEPFLAGPRO IN(''X'',''P''))) THEN SUM(NVL(DEPVALHIST,0)) '
         + 'ELSE 0 END COMPVH, '
         + 'CASE WHEN ((ACFFECADQ>=' + quotedstr(wPeriodoIni) + ' and ACFFECADQ<=' + quotedstr(wPeriodoFin)
         + ') AND (DEPFECHA=' + quotedstr(wPeriodoFin) + ') AND (DEPFLAGPRO IN(''X'',''P'',''I''))) THEN SUM(NVL(DEPVALHIST,0)) '
         + 'ELSE 0 END BAJAVH, '
         + 'CASE WHEN ((DEPFECHA=' + quotedstr(wPeriodoFin) + ') AND (DEPFLAGPRO IN(''X'',''P''))) THEN SUM(NVL(DEPVALAJUS,0)) '
         + 'ELSE 0 END HISTVAJ, '
         + 'CASE WHEN ((DEPFECHA=' + quotedstr(wPeriodoFin) + ') and (ACFFECADQ<' + quotedstr(wPeriodoIni) + ') AND (DEPFLAGPRO IN(''X'',''P''))) '
         + 'THEN SUM(NVL(ACFREIACUM,0)) ELSE 0 END REIANT, '
         + 'CASE WHEN ((ACFFECADQ>=' + quotedstr(wPeriodoIni) + ' and ACFFECADQ<=' + quotedstr(wPeriodoFin) + ') AND '
         + '(DEPFECHA=' + quotedstr(wPeriodoFin) + ') AND (DEPFLAGPRO=''X'')) THEN SUM(NVL(ACFREIPERI,0)) ELSE 0 END REIMES, '
         + 'CASE WHEN ((DEPFECHA=' + quotedstr(wPeriodoFin) + ') AND (DEPFLAGPRO IN(''X'',''P''))) THEN SUM(NVL(DEPNETOHIS,0)) '
         + 'ELSE 0 END NETO, '
         + 'CASE WHEN ((DEPFECHA=' + quotedstr(wPeriodoFin) + ') AND (DEPFLAGPRO IN(''X'',''P''))) THEN SUM(NVL(DEPNETOAJU,0)) '
         + 'ELSE 0 END NETO1, '
         + 'CASE WHEN ((DEPFECHA=' + quotedstr(wPeriodoFin) + ') AND (DEPFLAGPRO IN(''X'',''P''))) THEN SUM(NVL(DEPIMPHIST,0)) '
         + 'ELSE 0 END IMPHIST, '
         + 'CASE WHEN ((DEPFECHA=' + quotedstr(wPeriodoFin) + ') AND (DEPFLAGPRO IN(''X'',''P'')))  THEN SUM(NVL(DEPIMPAJUS,0)) '
         + 'ELSE 0 END IMPAJUS '
         + 'FROM ACF204 '
         + 'Where CIAID=''01''  AND DEPFLAGPRO IN(''X'',''P'') '
         + 'Group by CIAID,CUENTAID,DEPFECHA,ACFFECADQ,DEPFLAGPRO) A, TGE101 B, ACF101 C '
         + 'Where A.CIAID=B.CIAID(+) and A.CUENTAID=C.CUENTAID(+) ';
      xGroup := ' Group by A.CIAID, B.CIADES,A.CUENTAID, C.TACFDES ';
   End;
      //////////////////////////////////////////////////////////////////////////
      // Depreciacion Detalle
   If cbConsultas.ItemIndex = 3 Then
   Begin
      xSel := 'SELECT ACF204.CUENTAID, ACF204.TACFID, B.TACFDES, ACF204.FAREDONDEO, ACF204.DEPFECHA, ACF204.DEPVALHIST, ACF204.DEPVALHIST DH,'
          //FIN HPP_201107_ACF
          (*
              +'ACF204.DEPVALAJUS, ACF204.DEPVALAJUS DA, ACF204.DEPNOMESES, ACF204.DEPACUHIST, ACF204.DEPACUAJUS, ACF204.TACFDEPREC, ACF204.ARTCODBAR, ACF204.ACFDES, ACF204.DEPANTHIST, ACF204.DEPIMPHIST, ACF204.DEPNETOHIS '
              +'FROM ACF204, ACF101 B '      // Depreciacion
              +'WHERE ACF204.TACFID=B.TACFID ';
          xOrder:=' ORDER BY ACF204.TACFID, ACF204.ARTCODBAR, ACF204.DEPFECHA ';

          *)
      + 'ACF204.DEPVALAJUS, ACF204.DEPVALAJUS DA, ACF204.DEPNOMESES, ACF204.DEPACUHIST, ACF204.DEPACUAJUS, ACF204.TACFDEPREC, ACF201.CODIGOBARRA ARTCODBAR, ACF204.ACFDES, ACF204.DEPANTHIST, ACF204.DEPIMPHIST, ACF204.DEPNETOHIS '
         + 'FROM ACF204, ACF101 B, ACF201 ' // Depreciacion
         + 'WHERE ACF204.TACFID=B.TACFID '
         + 'AND ACF201.ARTCODBAR = ACF204.ARTCODBAR ';
      xOrder := ' ORDER BY ACF204.TACFID, ACF201.CODIGOBARRA , ACF204.DEPFECHA ';
          //INICIO HPP_201107_ACF
   End;
      //////////////////////////////////////////////////////////////////////////
      // Traslados del Periodo
   If cbConsultas.ItemIndex = 44444 Then
   Begin
         //INICIO HPP_201107_ACF
         //xSel:='SELECT ACF321.FECTRAS, ACF321.NUMDOC,ACF321.ARTCODBAR,ACF204.UBICID,D.CIADES,C.TACFID, C.TACFDES,'
      xSel := 'SELECT ACF321.FECTRAS, ACF321.NUMDOC, ACF201.CODIGOBARRA ARTCODBAR,ACF204.UBICID,D.CIADES,C.TACFID, C.TACFDES,'
         //FIN HPP_201107_ACF
      + 'ACF204.DEPVALHIST VH,ACF204.ACFDES, ACF204.CUENTAID '
              //INICIO HPP_201107_ACF
              //+'FROM ACF321, ACF204 ACF204, ACF101 C, TGE101 D '
      + 'FROM ACF321, ACF204 ACF204, ACF101 C, TGE101 D , ACF201'
              //FIN HPP_201107_ACF
      + 'WHERE (ACF321.FECTRAS>=' + quotedstr(wPeriodoIni)
         + ' AND ACF321.FECTRAS<=' + quotedstr(wPeriodoFin)
         + ') AND ACF321.ARTCODBAR=ACF204.ARTCODBAR '
              //INICIO HPP_201107_ACF
      + ' AND ACF201.ARTCODBAR = ACF204.ARTCODBAR '
              //FIN HPP_201107_ACF
      + ' AND ACF204.DEPFECDEPR=' + quotedstr(wPeriodoFin)
         + ' AND TO_CHAR( ACF204.ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO '
         + ' AND ACF204.DEPFLAGPRO IN(''X'',''P'') '
         + ' AND ACF204.VERI=''S'' '
         + ' AND ACF204.TACFID=C.TACFID '
         + ' AND ACF204.UBICID=D.CIAID ';
      xOrder := ' ORDER BY ACF204.UBICID, ACF204.TACFID, ACF321.FECTRAS ';
   End;
      //////////////////////////////////////////////////////////////////////////
      // Depreciacion Padron Legalizado x Compañia
   If cbConsultas.ItemIndex = 4 Then
   Begin
      xSel := ' SELECT * FROM ( '
         + 'SELECT ACF204.CIAID, ACF204.UBICID,C.CIADES, SUBSTR(ACF204.FAPERIODO,5,2)||''/''||SUBSTR(ACF204.FAPERIODO,1,4) MESANO, '
         + 'ACF204.FAPERIODO, ACF204.ACFFECADQ, '
            //INICIO HPP_201107_ACF
            //+'ACF204.CUENTAID, ACF204.ACFID, ACF204.ACFDES, D.ACFDESL, ACF204.TACFDEPREC, ACF204.TACFID, B.TACFDES, ACF204.ARTCODBAR, '
      + 'ACF204.CUENTAID, ACF204.ACFID, ACF204.ACFDES, D.ACFDESL, ACF204.TACFDEPREC, ACF204.TACFID, B.TACFDES, D.CODIGOBARRA ARTCODBAR, '
            //FIN HPP_201107_ACF
      + 'ACF204.DEPVALHIST,ACF204.DEPVALAJUS, 0.00 REVALUACION, 0.00 DIFCAMBIO, 0.00 MEJORAS, 0.00 RETIROS, '
         + 'ACF204.DEPACUHIST, ACF204.DEPACUAJUS,ACF204.ACFREIPERI, ACF204.DEPNETOAJU, ACF204.ACFDEPEST, '
         + 'ACF204.ACFREIDEPR, ACF204.DEPNETOHIS, D.ACFSERIE, '''' ACFNDOC, ACF204.DEPANTHIST, ACF204.DEPIMPHIST, '
         + 'CASE WHEN D.OCNDOC  IS NOT NULL THEN ''OC''||SUBSTR(D.OCNDOC,1,8) '
         + '     WHEN D.ODCID   IS NOT NULL THEN ''OC''||SUBSTR(D.ODCID,1,8) '
         + '     WHEN D.NINDOC  IS NOT NULL THEN ''NI''||SUBSTR(D.NINDOC,1,8) '
         + '     WHEN D.OTRNDOC IS NOT NULL THEN ''OT''||SUBSTR(D.OTRNDOC,1,8) '
         + 'ELSE '''' END NCOMPROB '
         + 'From ACF204, ACF101 B, TGE101 C, ACF201 D '
         + 'WHERE ACF204.UBICID=C.CIAID AND ACF204.TACFID<>''07'' AND ACF204.TACFID=B.TACFID AND ACF204.ARTCODBAR=D.ARTCODBAR'
         + ' AND ACF204.DEPFECDEPR=' + quotedstr(wPeriodoFin)
         + ' AND ACF204.DEPFLAGPRO IN(''X'',''P'') '
         + ' AND B.TACFVIDA>0 '
         + ' AND ACF204.VERI=' + quotedstr('S');
      xSel1 := 'UNION ALL SELECT ACF201.CIAID, ACF201.UBICID,C.CIADES, '
         + quotedstr(wMesAno) + ' MESANO, '
         + quotedstr(wPeriodoAAMM) + ' FAPERIODO, '
         + 'ACF201.ACFFECADQ, '
            //INICIO HPP_201107_ACF
            //+'ACF201.CUENTAID, ACF201.ACFID, ACF201.ACFDES, ACF201.ACFDESL, B.TACFDEPREC, ACF201.TACFID, B.TACFDES, ACF201.ARTCODBAR, '
      + 'ACF201.CUENTAID, ACF201.ACFID, ACF201.ACFDES, ACF201.ACFDESL, B.TACFDEPREC, ACF201.TACFID, B.TACFDES, ACF201.CODIGOBARRA ARTCODBAR, '
            //FIN HPP_201107_ACF
      + 'ACF201.ACFVALOMN DEPVALHIST,ACF201.ACFVALOMN DEPVALAJUS, 0.00 REVALUACION, 0.00 DIFCAMBIO, 0.00 MEJORAS, 0.00 RETIROS, '
         + '0.00 DEPACUHIST, 0.00 DEPACUAJUS,0.00 ACFREIPERI, 0.00 DEPNETOAJU, '''' ACFDEPEST, '
         + '0.00 ACFREIDEPR, ACF201.ACFVALOMN DEPNETOHIS, ACF201.ACFSERIE, '''' ACFNDOC, 0.00 DEPANTHIST, 0.00 DEPIMPHIST, '
         + 'CASE WHEN ACF201.OCNDOC  IS NOT NULL THEN ''OC''||SUBSTR(ACF201.OCNDOC,1,8) '
         + '     WHEN ACF201.ODCID   IS NOT NULL THEN ''OC''||SUBSTR(ACF201.ODCID,1,8) '
         + '     WHEN ACF201.NINDOC  IS NOT NULL THEN ''NI''||SUBSTR(ACF201.NINDOC,1,8) '
         + '     WHEN ACF201.OTRNDOC IS NOT NULL THEN ''OT''||SUBSTR(ACF201.OTRNDOC,1,8) '
         + 'ELSE '''' END NCOMPROB '
         + 'From ACF201, ACF101 B, TGE101 C, (SELECT * FROM ACF101 WHERE TACFVIDA=0) X '
         + 'WHERE ACF201.UBICID=C.CIAID AND ACF201.TACFID<>''07'' AND ACF201.TACFID=B.TACFID '
         + 'AND ACF201.TACFID=X.TACFID '
         + ' AND ACF201.ACFFLAGACT=''A'' '
         + ' AND ACF201.ACFFECADQ<=' + quotedstr(wPeriodoFin)
         + ' AND ACF201.VERI=' + quotedstr('S')

      + ' UNION ALL SELECT ACF201.CIAID, ACF201.UBICID,C.CIADES, '
         + quotedstr(wMesAno) + ' MESANO, '
         + quotedstr(wPeriodoAAMM) + ' FAPERIODO, '
         + 'ACF201.ACFFECADQ, '
            //INICIO HPP_201107_ACF
            //+'ACF201.CUENTAID, ACF201.ACFID, ACF201.ACFDES, ACF201.ACFDESL, B.TACFDEPREC, ACF201.TACFID, B.TACFDES, ACF201.ARTCODBAR, '
      + 'ACF201.CUENTAID, ACF201.ACFID, ACF201.ACFDES, ACF201.ACFDESL, B.TACFDEPREC, ACF201.TACFID, B.TACFDES, ACF201.CODIGOBARRA ARTCODBAR, '
            //FIN HPP_201107_ACF
      + 'ACF201.ACFVALOMN DEPVALHIST,ACF201.ACFVALOMN DEPVALAJUS, 0.00 REVALUACION, 0.00 DIFCAMBIO, 0.00 MEJORAS, 0.00 RETIROS, '
         + '0.00 DEPACUHIST, 0.00 DEPACUAJUS,0.00 ACFREIPERI, 0.00 DEPNETOAJU, '''' ACFDEPEST, '
         + '0.00 ACFREIDEPR, ACF201.ACFVALOMN DEPNETOHIS, ACF201.ACFSERIE, '''' ACFNDOC, 0.00 DEPANTHIST, 0.00 DEPIMPHIST, '
         + 'CASE WHEN ACF201.OCNDOC  IS NOT NULL THEN ''OC''||SUBSTR(ACF201.OCNDOC,1,8) '
         + '     WHEN ACF201.ODCID   IS NOT NULL THEN ''OC''||SUBSTR(ACF201.ODCID,1,8) '
         + '     WHEN ACF201.NINDOC  IS NOT NULL THEN ''NI''||SUBSTR(ACF201.NINDOC,1,8) '
         + '     WHEN ACF201.OTRNDOC IS NOT NULL THEN ''OT''||SUBSTR(ACF201.OTRNDOC,1,8) '
         + 'ELSE '''' END NCOMPROB '
         + 'From ACF201, ACF101 B, TGE101 C, (SELECT * FROM ACF101 WHERE TACFVIDA>0) X '
         + 'WHERE ACF201.UBICID=C.CIAID AND ACF201.TACFID<>''07'' AND ACF201.TACFID=B.TACFID '
         + 'AND ACF201.TACFID=X.TACFID '
         + ' AND ACF201.ACFFLAGACT=''A'' '
         + ' AND ACF201.ACFFECADQ>=' + quotedstr(wPeriodoIni)
         + ' AND ACF201.ACFFECADQ<=' + quotedstr(wPeriodoFin)
         + ' and acf201.cuentaid like ''332%'' '
         + ' AND ACF201.VERI=' + quotedstr('S')

      + ' ) ACF204 ';
      xFile1 := 'ACF204.';
      xFile2 := 'ACF201.';
   End;
      //////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////
      // Depreciacion Padron Legalizado General
   If cbConsultas.ItemIndex = 5 Then
   Begin
      xSel := 'SELECT ACF204.CIAID, ACF204.UBICID,C.CIADES, SUBSTR(ACF204.FAPERIODO,5,2)||''/''||SUBSTR(ACF204.FAPERIODO,1,4) MESANO, '
         + 'ACF204.FAPERIODO, ACF204.ACFFECADQ, '
            //INICIO HPP_201107_ACF
            //+'ACF204.CUENTAID, ACF204.ACFID, ACF204.ACFDES, ACF204.TACFID, B.TACFDES, ACF204.ARTCODBAR, '
      + 'ACF204.CUENTAID, ACF204.ACFID, ACF204.ACFDES, ACF204.TACFID, B.TACFDES, D.CODIGOBARRA ARTCODBAR, '
            //FIN HPP_201107_ACF
      + 'ACF204.DEPVALHIST,ACF204.DEPVALAJUS, 0.00 REVALUACION, 0.00 DIFCAMBIO, 0.00 MEJORAS, 0.00 RETIROS, '
         + 'ACF204.DEPACUHIST, ACF204.DEPACUAJUS,ACF204.ACFREIPERI, ACF204.DEPNETOAJU, ACF204.ACFDEPEST, '
         + 'ACF204.ACFREIDEPR, ACF204.DEPNETOHIS, D.ACFSERIE, '''' ACFNDOC, '
         + 'CASE WHEN D.OCNDOC  IS NOT NULL THEN ''OC''||SUBSTR(D.OCNDOC,1,8) '
         + '     WHEN D.ODCID   IS NOT NULL THEN ''OC''||SUBSTR(D.ODCID,1,8) '
         + '     WHEN D.NINDOC  IS NOT NULL THEN ''NI''||SUBSTR(D.NINDOC,1,8) '
         + '     WHEN D.OTRNDOC IS NOT NULL THEN ''OT''||SUBSTR(D.OTRNDOC,1,8) '
         + 'ELSE '''' END NCOMPROB '
         + 'From ACF204, ACF101 B, TGE101 C, ACF201 D '
         + 'WHERE ACF204.UBICID=C.CIAID and ACF204.TACFID=B.TACFID AND ACF204.ARTCODBAR=D.ARTCODBAR'
         + ' AND ACF204.DEPFECDEPR=' + quotedstr(wPeriodoFin)
         + ' AND TO_CHAR( ACF204.ACFFINIDEP,''YYYYMM'')<>ACF204.FAPERIODO '
         + ' AND ACF204.DEPFLAGPRO IN(''X'',''P'') '
         + ' AND ACF204.VERI=' + quotedstr('S');

      xSel1 := 'UNION ALL SELECT ACF201.CIAID, ACF201.UBICID,C.CIADES, '
         + quotedstr(wMesAno) + ' MESANO, '
         + quotedstr(wPeriodoAAMM) + ' FAPERIODO, '
         + 'ACF201.ACFFECADQ, '
            //INICIO HPP_201107_ACF
            //+'ACF201.CUENTAID, ACF201.ACFID, ACF201.ACFDES, ACF201.TACFID, B.TACFDES, ACF201.ARTCODBAR, '
      + 'ACF201.CUENTAID, ACF201.ACFID, ACF201.ACFDES, ACF201.TACFID, B.TACFDES, ACF201.CODIGOBARRA ARTCODBAR, '
            //FIN HPP_201107_ACF
      + 'ACF201.ACFVALOMN DEPVALHIST,ACF201.ACFVALOMN DEPVALAJUS, 0.00 REVALUACION, 0.00 DIFCAMBIO, 0.00 MEJORAS, 0.00 RETIROS, '
         + '0.00 DEPACUHIST, 0.00 DEPACUAJUS,0.00 ACFREIPERI, 0.00 DEPNETOAJU, '''' ACFDEPEST, '
         + '0.00 ACFREIDEPR, 0.00 DEPNETOHIS, ACF201.ACFSERIE, '''' ACFNDOC, '
         + 'CASE WHEN ACF201.OCNDOC  IS NOT NULL THEN ''OC''||SUBSTR(ACF201.OCNDOC,1,8) '
         + '     WHEN ACF201.ODCID   IS NOT NULL THEN ''OC''||SUBSTR(ACF201.ODCID,1,8) '
         + '     WHEN ACF201.NINDOC  IS NOT NULL THEN ''NI''||SUBSTR(ACF201.NINDOC,1,8) '
         + '     WHEN ACF201.OTRNDOC IS NOT NULL THEN ''OT''||SUBSTR(ACF201.OTRNDOC,1,8) '
         + 'ELSE '''' END NCOMPROB '
         + 'From ACF201, ACF101 B, TGE101 C, (SELECT * FROM ACF101 WHERE TACFVIDA=0) X '
         + 'WHERE ACF201.UBICID=C.CIAID and ACF201.TACFID=B.TACFID '
         + 'AND ACF201.TACFID=X.TACFID '
         + ' AND ACF201.ACFFLAGACT=''A'' '
         + ' AND ACF201.ACFFECADQ<=' + quotedstr(wPeriodoFin)
         + ' AND ACF201.VERI=' + quotedstr('S');
      xFile1 := 'ACF204.';
      xFile2 := 'ACF201.';
   End;
      //////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////

   wlbOrder := '';

   If ACF777.MantDepre.SectionName = 'AFDepreciacion' Then
   Begin
      wlbFiltro := '';
      For nv := 0 To ACF777.MantDepre.FMant.lbFiltroReal.Count - 1 Do
      Begin
         If cbConsultas.ItemIndex = 333333 Then
            wAlias := 'A.'
         Else
            wAlias := ACF777.MantDepre.FMant.wTabla + '.';
         nPos := POS('SubStr', ACF777.MantDepre.FMant.lbFiltroReal.items[nv]);
         If nPos > 0 Then
            wlbFiltro := wlbFiltro + Copy(ACF777.MantDepre.FMant.lbFiltroReal.items[nv], nPos, nPos + 6) + wAlias + Copy(ACF777.MantDepre.FMant.lbFiltroReal.items[nv], nPos + 7, 100) + ' AND '
         Else
            wlbFiltro := wlbFiltro + wAlias + ACF777.MantDepre.FMant.lbFiltroReal.items[nv] + ' AND ';
         wlbFiltroTexto := wlbFiltroTexto + ACF777.MantDepre.FMant.lbFiltro.items[nv] + ', ';
      End;

      wlbOrder := '';
      For nv := 0 To ACF777.MantDepre.FMant.lbOrdenReal.Count - 1 Do
      Begin
         If cbConsultas.ItemIndex = 333333 Then
            wAlias := 'A.'
         Else
            wAlias := ACF777.MantDepre.FMant.wTabla + '.';

         wlbOrder := wlbOrder + wAlias + ACF777.MantDepre.FMant.lbOrdenReal.items[nv] + ', ';
      End;

      If length(trim(wlbOrder)) > 0 Then
         wlbOrder := ' Order by ' + Copy(wlbOrder, 1, Length(wlbOrder) - 2);
   End;

   If length(trim(wlbOrder)) > 0 Then
      xOrder := wlbOrder;

   If (cbConsultas.ItemIndex = 2) Then wlbFiltro := '';
   If length(wlbFiltro) = 0 Then
   Begin
      If cbConsultas.ItemIndex = 1 Then
      Begin
         If xSel1 = '' Then
            xSQL := xSel + xGroup
         Else
            xSQL := xSel + xGroup + xSel1 + xGroup1 + xSel2 + xGroup2;
      End
      Else
      Begin
         If xSel1 = '' Then
            xSQL := xSel + xGroup + xOrder
         Else
            xSQL := xSel + xGroup + xOrder + xSel1 + xGroup1 + xSel2 + xGroup2 + xOrder;
      End;
   End
   Else
   Begin
      If cbConsultas.ItemIndex = 1 Then
      Begin
         xSQL := xSel + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5) + ' ' + xGroup;
         If xFile1 <> '' Then
            wlbFiltro := StringReplace(wlbFiltro, xFile1, xFile2, [rfReplaceAll, rfIgnoreCase]);

         xSQL := xSQL + xSel1 + ' ' + xGroup1 + xSel2 + xGroup2;
      End
      Else
      Begin
         If xSel1 = '' Then
            xSQL := xSel + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5) + ' ' + xGroup + xOrder
         Else
         Begin
            xSQL := xSel + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5) + ' ' + xGroup + xOrder;
            If xFile1 <> '' Then
               wlbFiltro := StringReplace(wlbFiltro, xFile1, xFile2, [rfReplaceAll, rfIgnoreCase]);

            xSQL := xSQL + xSel1 + ' AND ' + copy(wlbFiltro, 1, length(wlbFiltro) - 5) + ' ' + xGroup1 + xOrder;
         End;
      End;
   End;

   ppdsgQry.Report := Nil;
   pprQry.DataPipeline := Nil;
   ppdbQry.DataSource := Nil;
   DMAF.cdsQry10.Filter := '';
   DMAF.cdsQry10.Filtered := False;
   DMAF.cdsQry10.IndexFieldNames := '';
   DMAF.cdsQry10.Close;
   DMAF.cdsQry10.DataRequest(xSQL);
   DMAF.cdsQry10.Open;
   If cbConsultas.ItemIndex = 0 Then DMAF.cdsQry10.IndexFieldNames := 'CUENTAID';
   If cbConsultas.ItemIndex = 1 Then DMAF.cdsQry10.IndexFieldNames := 'UBICID;CIADES;CUENTAID;TACFID;TACFDES';
   If cbConsultas.ItemIndex = 4 Then DMAF.cdsQry10.IndexFieldNames := 'UBICID;ARTCODBAR';
   If cbConsultas.ItemIndex = 7 Then DMAF.cdsQry10.IndexFieldNames := 'CUENTAID;ARTCODBAR';

   ppdbQry.DataSource := DMAF.dsQry10;
   pprQry.DataPipeline := ppdbQry;

   If rgHoja.ItemIndex = 0 Then
   Begin
      If cbConsultas.ItemIndex = 0 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\DepreResumenTacf.rtm';
      If cbConsultas.ItemIndex = 1 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\DepreResumenCiaTacf.rtm';
      If cbConsultas.ItemIndex = 2 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\CuadreNuevoActivo.rtm';
      If cbConsultas.ItemIndex = 3 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\DepreDetalle.rtm';
      If cbConsultas.ItemIndex = 4 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\Legal 1_A4.rtm';
      If cbConsultas.ItemIndex = 5 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\Legal 2.rtm';
   End
   Else
   Begin
      If cbConsultas.ItemIndex = 0 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\DepreResumenTacf.rtm';
      If cbConsultas.ItemIndex = 1 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\DepreResumenCiaTacf.rtm';
      If cbConsultas.ItemIndex = 2 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\CuadreNuevoActivo.rtm';
      If cbConsultas.ItemIndex = 3 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\DepreDetalle.rtm';
      If cbConsultas.ItemIndex = 4 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\Legal 1.rtm';
      If cbConsultas.ItemIndex = 5 Then pprQry.Template.FileName := wRutaRpt + 'ACF\DEMA\Legal 2.rtm';
   End;

   pprQry.Template.LoadFromFile;

   plabel := TppLabel.Create(FToolsDepreciacion);
   plabel.Band := ppFooterB2;
   If cbConsultas.ItemIndex = 0 Then
   Begin
      plabel.Name := 'plblFiltro0';
   End;
   If cbConsultas.ItemIndex = 1 Then
   Begin
      Try
         //plabel.Name:='plblFiltro1';
      Except
      End;
   End;
   If cbConsultas.ItemIndex = 2 Then
   Begin
      plabel.Name := 'plblFiltro2';
   End;

   If cbConsultas.ItemIndex = 4 Then
   Begin
      pplFec.Visible := False;
      ppSystemVariable2.Visible := False;
      If (cbFecRep.Checked) And (dtpFecRep.Date > 0) Then
      Begin
         pplFec.Text := Datetostr(dtpFecRep.Date);
         pplFec.Visible := True;
      End
      Else
         ppSystemVariable2.Visible := True;
   End;

   pLabel.Top := 0;
   plabel.Height := 0.1639;
   plabel.Left := 0.5208;
   pLabel.Alignment := taLeftJustify;
   pLabel.Transparent := False;
   pLabel.Autosize := True;
   pLabel.Visible := True;
   pLabel.Font.Size := 9;
   pLabel.Font.Name := 'Times New Roman';
   plabel.Caption := wlbFiltroTexto;
   ppdsgQry.Report := pprQry;
   ppdsgQry.ShowModal;
End;

Procedure TFToolsDepreciacion.ppFooterBand1BeforeGenerate(Sender: TObject);
Begin
//    ppLabel20.Caption:='xxxx';//wlbFiltro1
End;

Procedure TFToolsDepreciacion.cbFecRepClick(Sender: TObject);
Begin
   If cbFecRep.Checked Then
      gbFecRep.Enabled := True
   Else
      gbFecRep.Enabled := False;
End;

End.

