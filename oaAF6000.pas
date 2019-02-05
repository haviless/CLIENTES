unit oaAF3000;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mant, db, ExtCtrls;

type
  TFControlOperativo = class(TForm)

  private
    { Private declarations }
  public
    { Public declarations }
    procedure PanelCreaMant(Sender: TObject);
    procedure LimiteInsert(Sender: TObject);
    procedure LimiteEdit(Sender: TObject; MantFields: TFields);
    procedure ReclasEdit(Sender: TObject; MantFields: TFields);
    procedure ReclasInsert(Sender: TObject);
  end;


  procedure AFDepreciacionAjuste; stdcall;
  procedure AFCierreDepreciacion; stdcall;
  procedure AFContabilizaDepreciacion; stdcall;
  procedure AFContabilizaREI; stdcall;
  procedure AFCierreOperativo; stdcall;
  procedure AFReclasificacionContable; stdcall;
  procedure AFAjusteAnualActivos; stdcall;
  procedure AFRecuperaTexto; stdcall;
  procedure AFInicializaDepreciacion; stdcall;
  procedure AFLimiteReexpresion; stdcall;
  procedure AFEliminaDepreciacionAjuste; stdcall;

exports
  AFDepreciacionAjuste,
  AFCierreDepreciacion,
  AFContabilizaDepreciacion,
  AFContabilizaREI,
  AFCierreOperativo,
  AFReclasificacionContable,
  AFAjusteAnualActivos,
  AFRecuperaTexto,
  AFInicializaDepreciacion,
  AFLimiteReexpresion,
  AFEliminaDepreciacionAjuste;

  var
  FControlOperativo: TFControlOperativo;
  Mtx, MantLimite, MantRecl, MantLoad :TMant;
  pl, pg : TPanel;
  wxSql, xSql : string;
implementation

uses ACFDM, ACF222, ACF230, ACF290, ACF294, ACF232, ACF296, ACF298, ACF280,
            ACF231, ACF224;

{$R *.dfm}

procedure AFDepreciacionAjuste;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;


  try
     FDeprecia1:=TFDeprecia1.Create( Application );    // ACF222
     FDeprecia1.ActiveMDIChild;
  finally
  end;
end;

procedure AFCierreDepreciacion;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;


  try
     FCierraDepre:=TFCierraDepre.Create( Application );    // ACF230
     FCierraDepre.ActiveMDIChild;
  finally
  end;
end;

procedure AFContabilizaDepreciacion;
var xsql : string;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;

  try
     DMAF.cdsTDiario.Close;
     DMAF.cdsTDiario.DataRequest('Select * from TGE104');
     DMAF.cdsTDiario.Open;
     DMAF.cdsTDiario.IndexFieldNames:='TDIARID';
     FContabilidad:=TFContabilidad.Create( Application );    // ACF290
     xSQL:='Select '''' CIAID, '''' TACFID, '''' TACFDES, '''' CUENTAID, '''' CCOSID, '''' DH, '
           +  '0 DEBE, 0 HABER, '''' CTADES '
           +'From ACF204 '
           +'Where CIAID=''ZZ'' and FAPERIODO=''9999'' ';

     DMAF.cdsTrasSel.Close;
     DMAF.cdsTrasSel.DataRequest( xSQL );
     DMAF.cdsTrasSel.Open;

     FContabilidad.dbgConta.DataSource:=DMAF.dsTrasSel;
     FContabilidad.dbgConta.Selected.Clear;
     FContabilidad.dbgConta.Selected.Add('TACFID'#9'8'#9'Tipo~Activo'#9 );
     FContabilidad.dbgConta.Selected.Add('TACFDES'#9'30'#9'Descripcion'#9);
     FContabilidad.dbgConta.Selected.Add('CUENTAID'#9'18'#9'Cuenta~Contable'#9);
     FContabilidad.dbgConta.Selected.Add('CCOSID'#9'10'#9'Centro~Costo'#9);
     FContabilidad.dbgConta.Selected.Add('DEBE'#9'16'#9'Debe'#9);
     FContabilidad.dbgConta.Selected.Add('HABER'#9'16'#9'Haber'#9);

     FContabilidad.ActiveMDIChild;
  finally
  end;
end;

procedure AFContabilizaREI;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;


  try
     DMAF.cdsTDiario.Close;
     DMAF.cdsTDiario.DataRequest('Select * from TGE104');
     DMAF.cdsTDiario.Open;
     DMAF.cdsTDiario.IndexFieldNames:='TDIARID';
     FContaREI:=TFContaREI.Create( Application );    // ACF294
     xSQL:='Select '' '' CIAID, '' '' CTAORI, '' '' CTADESORI, '' '' CUENTAID, '' '' CCOSID, '' '' DH, '
           +  '0 DEBE, 0 HABER, '' '' CTADES '
           +'From ACF204 '
           +'Where CIAID=''ZZ'' and FAPERIODO=''9999'' ';

     DMAF.cdsTrasSel.Close;
     DMAF.cdsTrasSel.DataRequest( xSQL );
     DMAF.cdsTrasSel.Open;

     FContaREI.dbgConta.DataSource:=DMAF.dsTrasSel;

     FContaREI.dbgConta.Selected.Clear;
     FContaREI.dbgConta.Selected.Add('CTAORI'#9'18'#9'Cuenta~Origen'#9 );
     FContaREI.dbgConta.Selected.Add('CTADESORI'#9'40'#9'Descripcion'#9);
     FContaREI.dbgConta.Selected.Add('CUENTAID'#9'18'#9'Cuenta~Contable'#9);
     FContaREI.dbgConta.Selected.Add('CCOSID'#9'10'#9'Centro~Costo'#9);
     FContaREI.dbgConta.Selected.Add('DEBE'#9'16'#9'Debe'#9);
     FContaREI.dbgConta.Selected.Add('HABER'#9'16'#9'Haber'#9);

     FContaREI.ActiveMDIChild;
  finally
  end;
end;

procedure AFCierreOperativo;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;


  try
     FCierreOpe:=TFCierreOpe.Create( Application );    // ACF230
     FCierreOpe.ActiveMDIChild;
  finally
  end;
end;

procedure AFReclasificacionContable;
var xsql : string;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;


  try
     xSQL:='SELECT * FROM ACF110 ';
     DMAF.cdsCTA.Close;
     DMAF.cdsCTA.DataRequest( xSQL );
     DMAF.cdsCTA.IndexFieldNames:='CUENTAID';
     DMAF.cdsCTA.Open;
     DMAF.cdsTDiario.Close;
     DMAF.cdsTDiario.DataRequest('Select * from TGE104');
     DMAF.cdsTDiario.Open;
     DMAF.cdsTDiario.IndexFieldNames:='TDIARID';
     DMAF.cdsTrasSel.close;
     xSQL:='Select ACFID, TACFID, ACFDES, CUENTAID, ''                    '' CUENTAID2, '
        +  '0 VALORHIS, 0 AJUSTE, 0 DEPHIS, 0 DEPAJU '
        +'From ACF204 '
        +'Where CIAID=''ZZ'' and FAPERIODO=''9999'' ';
     DMAF.cdsTrasSel.Close;
     DMAF.cdsTrasSel.DataRequest( xSQL );
     DMAF.cdsTrasSel.Open;
     DMAF.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
     MantRecl:=TMant.Create(Application);
     MantRecl.User         := DMAF.wUsuario;
     MantRecl.Admin        := DMAF.wAdmin;
     MantRecl.DComC        := DMAF.DCom1;
     MantRecl.OnInsert     := FProcesos.ReclasInsert;
     MantRecl.OnEdit       := FProcesos.ReclasEdit;
     MantRecl.ClientDataSet:= DMAF.cdsReva;
     MantRecl.TableName    := 'ACF307';
     MantRecl.Titulo       := 'Reclasificación de Activos';
     MantRecl.Module       := DMAF.wModulo;
     MantRecl.OnCierra     := DMAF.DisminuyeForma;
     MantRecl.SectionName  := 'AFReclasificacion';
     MantRecl.FileNameIni  := '\oaAF.INI';
     MantRecl.Execute;
  finally
  end;
end;

procedure AFAjusteAnualActivos;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;


  try
     DMAF.cdsTDiario.Close;
     DMAF.cdsTDiario.DataRequest('Select * from TGE104');
     DMAF.cdsTDiario.Open;
     DMAF.cdsTDiario.IndexFieldNames:='TDIARID';
     FAjusteAnual:=TFAjusteAnual.Create( Application );    // ACF298
      xSQL:='Select CIAID, ACFID, TACFID, ACFDES, CUENTAID, '
           +  '0 VALORHIS, 0 AJUSTE, 0 VALORAJU, 0 DEPAJU '
           +'From ACF204 '
           +'Where CIAID=''ZZ'' and FAPERIODO=''9999'' ';
     DMAF.cdsTrasSel.Close;
     DMAF.cdsTrasSel.DataRequest( xSQL );
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
     FAjusteAnual.dbgConta.DataSource:=DMAF.dsTrasSel;
     FAjusteAnual.ActiveMDIChild;
  finally
  end;
end;

procedure AFRecuperaTexto;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;


  try
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
  end;
end;

procedure AFInicializaDepreciacion;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;


  try
     if MessageDlg('Proceso Inicializa la data para '+#13+#13+
                   '   Depreciar por Primera Vez.   '+#13+#13+
                   ' Solo se Debe Ejecutar Una Vez. '+#13+#13+
                   ' Para Esto todas las Tablas de  '+#13+#13+
                   '   Referencia deben estar Ok.   '+#13+#13+
                   '  ¿ Esta Seguro de Procesar ?  ', mtconfirmation,[mbYes,MbNo],0)=mrYes then begin

        if MessageDlg('Proceso Eliminara Data de Depreciación'+#13+#13+
                      '         de Periodos Anteriores       '+#13+#13+
                      '      ¿ Esta Seguro de Procesar ?     ', mtconfirmation,[mbYes,MbNo],0)=mrNo then Exit;

        xSQL:='DELETE FROM ACF204';

        DMAF.cdsQry.Close;
        DMAF.cdsQry.DataRequest( xSQL );
        TRY
           DMAF.cdsQry.Execute;
        EXCEPT
        END;

       if  (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then begin
        xSQL:='Insert into ACF204 ( CIAID, ACFID, TACFID, CUENTAID, DEPVALHIST, '
             +  'DEPVALAJUS, DEPFLAGPRO, TACFDEPREC, DEPCOD, CCOSID, ACFVALOMN, '
             +  'ACFDES, ACFFECADQ, DEPFECHA, ACFREFOR, FAPERIODO, DEPNOMESES,DEPNETOAJU ) '
             +'Select ACF201.CIAID, ACFID, ACF201.TACFID, ACF201.CUENTAID, '
             +  'ACFVALOMN, ACFVALOMN, ''X'', ACF101.TACFDEPREC, ''01'', CCOSID, '
             +  'ACFVALOMN, ACFDES, ACFFECADQ, ACFFINIDEP, ACF201.ACFREFOR, '
             +  'SUBSTR( CHAR( ACFFINIDEP ),1,4)||SUBSTR( CHAR( ACFFINIDEP ), 6, 2 ), 1,ACFVALOMN '
             +'From ACF201, ACF101, ACF110 '
             +'Where ACF201.CIAID=ACF101.CIAID and ACF201.TACFID=ACF101.TACFID '
             +  'and ACF201.ACFVALOMN>0 AND ACFFLAGACT=''A'' '
             + ' AND ACF110.CUENTAID=ACF201.CUENTAID AND ACF110.FLGASTO=''N'' ';
       end;
       if (SRV_D = 'ORACLE') then
       begin
        xSQL:='Insert into ACF204 ( CIAID	, ACFID, TACFID, CUENTAID, DEPVALHIST, '
             +  'DEPVALAJUS, DEPFLAGPRO, TACFDEPREC, DEPCOD, CCOSID, ACFVALOMN, '
             +  'ACFDES, ACFFECADQ, DEPFECHA, ACFREFOR, FAPERIODO, DEPNOMESES,DEPNETOAJU ) '
             +'Select ACF201.CIAID, ACFID, ACF201.TACFID, ACF201.CUENTAID, '
             +  'ACFVALOMN, ACFVALOMN, ''X'', ACF101.TACFDEPREC, ''01'', CCOSID, '
             +  'ACFVALOMN, SUBSTR(ACFDES,1,40), ACFFECADQ, ACFFECADQ, ACF201.ACFREFOR, '
             +  'TO_CHAR( ACFFECADQ,''YYYYMM''),1,ACFVALOMN '
             +'From ACF201, ACF101, ACF110 '
             +'Where ACF201.CIAID=ACF101.CIAID and ACF201.TACFID=ACF101.TACFID '
             +  'and ACF201.ACFVALOMN>0 AND ACFFLAGACT=''A'' '
             + ' AND ACF110.CUENTAID=ACF201.CUENTAID AND ACF110.FLGASTO=''N'' ';
       end;
        DMAF.cdsQry.Close;
        DMAF.cdsQry.DataRequest( xSQL );
        DMAF.cdsQry.Execute;

       if  (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
              xSQL:='Update ACF102 set FAPROC=''X'', FLCONTA='''', FLREI='''', FLANUAL='''' ' ;
       if (SRV_D = 'ORACLE') then
              xSQL:='Update ACF102 set FAPROC=''X'', FLCONTA=NULL, FLREI=NULL, FLANUAL=NULL ' ;
        DMAF.cdsQry.Close;
        DMAF.cdsQry.DataRequest( xSQL );
        DMAF.cdsQry.Execute;
       if  (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
          xSQL:='Update ACF104 set FAPERIODO='''', FAFECDEPRE=''01/01/1900''' ;
       if (SRV_D = 'ORACLE') then
          xSQL:='Update ACF104 set FAPERIODO=''199901'', FAFECDEPRE=''01/01/1900''' ;

        DMAF.cdsQry.Close;
        DMAF.cdsQry.DataRequest( xSQL );
        DMAF.cdsQry.Execute;
        ShowMessage('Proceso Terminado');
     end;
  finally
  end;
end;

procedure AFLimiteReexpresion;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;


  try
      DMAF.wBoton:='2';
      DMAF.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      MantLimite := TMant.Create(Application);
      try
        MantLimite.User   := DMAF.wUsuario;
        MantLimite.Admin  := DMAF.wAdmin;
        MantLimite.Module := DMAF.wModulo;
        MantLimite.DComC  := DMAF.DCOM1;
        MantLimite.OnCreateMant  := nil ;
        MantLimite.TableName     := 'ACF309';
        MantLimite.ClientDataSet := DMAF.cdsLimReCab;
        MantLimite.Filter        := '';
        MantLimite.Titulo 				:= 'Límite de Reexpresión';
        MantLimite.OnInsert 			:= FProcesos.LimiteInsert;
        MantLimite.OnEdit 				:= FProcesos.LimiteEdit;
        MantLimite.OnCierra     := DMAF.DisminuyeForma;
        MantLimite.OnDelete 			:= nil;
        MantLimite.OnShow 				:= nil;
        MantLimite.OnCierra 		  := DMAF.DisminuyeForma;
        MantLimite.SectionName		:='LimiteR';
        MantLimite.FileNameIni		:='\oaAF.ini';
        MantLimite.Execute;
      finally
      end;
  finally
  end;
end;

procedure TFControlOperativo.LimiteEdit(Sender: TObject; MantFields: TFields);
begin


   DMAF.wModo:='M';
   DMAF.cdsLimReCab.Data:=MantLimite.FMant.cds2.Data;
   DMAF.cdsLimReCab.GotoCurrent(MantLimite.FMant.cds2);
   if DMAF.cdsLimReCab.RecordCount>0 then
   begin
      FLimReexpres:=TFLimReexpres.Create(Application);
      FLimReexpres.ActiveMDIChild;         // ACF224
   end;
end;

procedure TFControlOperativo.LimiteInsert(Sender: TObject);
var wxSql : string;
begin


   DMAF.wModo:='A';
   wxSql:='SELECT * FROM ACF309 WHERE 1<>1';
   DMAF.cdsLimReCab.Close;
   DMAF.cdsLimReCab.DataRequest(wxSql);
   DMAF.cdsLimReCab.Open;

   FLimReexpres:=TFLimReexpres.Create(Application);
   FLimReexpres.ActiveMDIChild;          // ACF224
end;

procedure AFEliminaDepreciacionAjuste;
var xsql : string;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;


  try
     XSQL:='SELECT * FROM TGE101 ORDER BY CIAID';
     DMAF.cdsCia.Close;
     DMAF.cdsCia.DataRequest(XSQL);
     DMAF.cdsCia.open;

     FDesDeprecia:=TFDesDeprecia.Create( Application );    // ACF231
     FDesDeprecia.ActiveMDIChild;
  finally
  end;
end;

procedure TFControlOperativo.PanelCreaMant(Sender: TObject);
begin
  pl := TMant(Sender).FMant.pnlBtns;
  pl.Height:= pg.Height+1;
  pg.Align := alClient;
  pg.Parent:= Tmant(Sender).Fmant.pnlBtns;
  pl.AutoSize:=true;
  Tmant(Sender).Fmant.pnlBtns.Visible:=true;
end;

procedure TFControlOperativo.ReclasEdit(Sender: TObject; MantFields: TFields);
begin


   DMAF.cdsReva.Data:=MantRecl.FMant.cds2.Data;
   DMAF.cdsReva.GotoCurrent(MantRecl.FMant.cds2);
   if DMAF.cdsReva.RecordCount>0 then
   begin
      DMAF.wModo:='M';
      FReclasifica:=TFReclasifica.Create(Application);    // ACF296
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
      FReclasifica.dbgConta.DataSource:=DMAF.dsTrasSel;
      FReclasifica.ActiveMDIChild;
   end;
end;

procedure TFControlOperativo.ReclasInsert(Sender: TObject);
begin


   DMAF.wModo:='A';
   wxSql:='SELECT * FROM ACF307 WHERE 1<>1';
   DMAF.cdsReva.Close;
   DMAF.cdsReva.DataRequest(wxSql);
   DMAF.cdsReva.Open;
   FReclasifica:=TFReclasifica.Create(Application);
   FReclasifica.ActiveMDIChild;          // ACF296
end;

end.
