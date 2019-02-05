unit ACF290;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwmonthcalendar, Mask, wwdbedit, wwdbdatetimepicker,
  wwdblook, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DB, DBClient, wwClient,
  ppTypes, ppCache, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, oaContabiliza,
  ppBands;



type
  TFContabilidad = class(TForm)
    wMensaje2: TLabel;
    wMensaje3: TLabel;
    pnlCab: TPanel;
    Label2: TLabel;
    dblcdPeriodo: TwwDBLookupComboDlg;
    Panel2: TPanel;
    Z2bbtnContab: TBitBtn;
    bbtnBorra: TBitBtn;
    dbgConta: TwwDBGrid;
    bbtnOk: TBitBtn;
    Label34: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCiaDes: TEdit;
    pnlDatos: TPanel;
    lblTDiario: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    Label15: TLabel;
    dtpFComp: TwwDBDateTimePicker;
    lblNoReg: TLabel;
    meNoReg: TwwDBEdit;
    Label56: TLabel;
    dbeCambio: TwwDBEdit;
    lblCNT: TLabel;
    Z2bbtnPreview: TBitBtn;
    pprAsiento: TppReport;
    ppdbAsiento: TppDBPipeline;
    procedure dbgTipoDepDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dtpFCompExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure dbeCambioExit(Sender: TObject);
    procedure bbtnBorraClick(Sender: TObject);
    procedure Z2bbtnPreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure GrabaPrevio;
  public
    { Public declarations }

  end;

var
  FContabilidad: TFContabilidad;
  wSql, wFaperiodo : string;

implementation

uses ACFDM, oaAF3000, ACF292;

{$R *.DFM}
//{$I OPER.PAS}

procedure TFContabilidad.FormActivate(Sender: TObject);
begin
end;

// GRID DE SELECCION DE TIPOS
procedure TFContabilidad.dbgTipoDepDblClick(Sender: TObject);
begin
end;

// LOOKUP de periodo , PROCESO PRELIMINAR.
procedure TFContabilidad.bbtnOkClick(Sender: TObject);
var
   xSQL : String;
   xWhere: String;
begin

   if edtCiaDes.text='' then begin
      dblcCia.SetFocus;
      ShowMessage( 'Error :  Falta Compañía' );
   end;

   if Length(dblcdPeriodo.text)<6 then begin
      dblcdPeriodo.SetFocus;
      ShowMessage( 'Error :  Periodo Errado' );
   end;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
//   xSQL:='Select A.CIAID, A.TACFID, B.TACFDES, D.CTADEPAC CUENTAID, A.CCOSID, ''D'' DH, '
   xSQL:='Select A.CIAID, A.TACFID, B.TACFDES, D.CTADEPRE CUENTAID, A.CCOSID, ''D'' DH, '
        +  'SUM(A.DEPIMPHIST) DEBE, 0 HABER, C.CTADES  '
        +'From ACF204 A '
        +'Left Join ACF101 B ON ( B.TACFID=A.TACFID ) '
        +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.CTADEPRE ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.CTADEPRE, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPHIST)>0 '
        +'Union '
        +'Select A.CIAID, A.TACFID, B.TACFDES, D.CTADEPAC CUENTAID, '''' CCOSID, ''H'' DH, '
        +  '0 DEBE, SUM(A.DEPIMPHIST) HABER, C.CTADES '
        +'From ACF204 A '
        +'Left Join ACF101 B ON ( B.TACFID=A.TACFID ) '
        +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
        +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=D.CTADEPAC ) '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.CTADEPAC, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 ';
   end;

   if (SRV_D = 'ORACLE') then
   begin
   xSQL:='Select A.CIAID, A.TACFID, B.TACFDES, D.CTADEPAC CUENTAID, A.CCOSID, ''D'' DH, '
        +  'SUM(A.DEPIMPHIST) DEBE, 0 HABER, C.CTADES  '
        +'From ACF204 A, ACF101 B, ACF110 D, TGE202 C '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +   ' ( B.TACFID=A.TACFID(+) ) and '
        +   ' ( D.CUENTAID(+)=A.CUENTAID ) and '
        +   ' ( C.CIAID=A.CIAID AND C.CUENTAID=D.CTADEPAC ) '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.CTADEPAC, A.CCOSID, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 '

        +'Union '

        +'Select A.CIAID, A.TACFID, B.TACFDES, D.CTADEPRE CUENTAID, '''' CCOSID, ''H'' DH, '
        +  '0 DEBE, SUM(A.DEPIMPHIST) HABER, C.CTADES '
        +'From ACF204 A, ACF101 B, ACF110 D, TGE202 C '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +   ' ( B.TACFID=A.TACFID(+) ) and '
        +   ' ( D.CUENTAID(+)=A.CUENTAID ) and '
        +   ' ( C.CIAID=A.CIAID AND C.CUENTAID=D.CTADEPRE ) '
        +'Group by A.CIAID, A.TACFID, B.TACFDES, D.CTADEPRE, C.CTADES '
        +'Having SUM(A.DEPIMPAJUS)>0 ';
   end;
   DMAF.cdsTrasSel.Close;
   DMAF.cdsTrasSel.DataRequest( xSQL );
   DMAF.cdsTrasSel.Open;
   DMAF.cdsTrasSel.IndexFieldNames:='CIAID;TACFID;DH;CUENTAID';


   if DMAF.cdsTrasSel.RecordCount=0 then begin
      dblcdPeriodo.SetFocus;
      ShowMessage('No Existen Registros para el Periodo');
      Exit;
   end;

   DMAF.cdsTrasSel.IndexFieldNames:='CIAID;TACFID;DH';

   dbgConta.Selected.Clear;
   dbgConta.Selected.Add('TACFID'#9'8'#9'Tipo~Activo'#9'F');
   dbgConta.Selected.Add('TACFDES'#9'30'#9'Descripción'#9'F');
   dbgConta.Selected.Add('CUENTAID'#9'18'#9'Cuenta~Contable'#9'F');
   dbgConta.Selected.Add('CCOSID'#9'10'#9'Centro~Costo'#9'F');
   dbgConta.Selected.Add('DEBE'#9'16'#9'Debe'#9'F');
   dbgConta.Selected.Add('HABER'#9'16'#9'Haber'#9'F');

   TNumericField( DMAF.cdsTrasSel.FieldByName('DEBE') ).DisplayFormat:='###,###,##0.00';
   TNumericField( DMAF.cdsTrasSel.FieldByName('HABER') ).DisplayFormat:='###,###,##0.00';

   dbgConta.ColumnByName('DEBE').FooterValue:=FLOATTOSTRF( DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEBE)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('HABER').FooterValue:=FLOATTOSTRF( DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(HABER)', ''),ffNumber,15,2 );

   lblCNT.Visible       :=False;
   pnlDatos.Enabled     :=True;
   Z2bbtnContab.Enabled      :=True;
   bbtnBorra.Enabled    :=True;
   Z2bbtnPreview.Enabled:=True;

   dtpFComp.Date:= StrToDate( '28/'+Copy(dblcdPeriodo.Text,5,2)+'/'+Copy(dblcdPeriodo.Text,1,4) );

   if DMAF.cdsTrasPen.FieldByName('FLCONTA').AsString='S' then begin
      xSQL:='SELECT * FROM ACF306 '
           +'WHERE CIAID='''   +dblcCia.text     +''' and '
           +      'CNTANOMM='''+dblcdPeriodo.Text+''' and '
           +      'CNTLOTE=''DEP'' ';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
      DMAF.cdsQry.Open;

      dblcTDiario.text:=DMAF.cdsQry.FieldByname('TDIARID').AsString;
      dtpFComp.Date   :=DMAF.cdsQry.FieldByname('CNTFCOMP').Value;
      meNoReg.text    :=DMAF.cdsQry.FieldByname('CNTCOMPROB').AsString;
      dbeCambio.text  :=DMAF.cdsQry.FieldByname('CNTTCAMBIO').AsString;
      xWhere:='TDIARID='''+DMAF.cdsQry.FieldByname('TDIARID').AsString+'''';
      edtTDiario.Text :=DMAF.DisplayDescrip('dspTGE','TGE104','*',xWhere,'TDIARDES');
      lblCNT.Visible       :=True;
      pnlDatos.Enabled     :=False;
      Z2bbtnContab.Enabled      :=False;
      bbtnBorra.Enabled    :=False;
   end;

	end;


procedure TFContabilidad.dblcTDiarioExit(Sender: TObject);
var
   xWhere : String;
begin
   if not bbtnBorra.Focused then begin

      xWhere:='TDiarId='+''''+dblcTDiario.Text+'''';
      edtTDiario.Text:=DMAF.DisplayDescrip('dspTGE','TGE104','*',xWhere,'TDiarDes');
      if length(edtTDiario.Text)=0 then
      begin
         ShowMessage('Falta Tipo de Diario');
         dblcTDiario.SetFocus;
      end;
   end;

end;

procedure TFContabilidad.dtpFCompExit(Sender: TObject);
var
   xSQL, xWhere : String;
begin

   if length(edtTDiario.Text)>0 then begin

      xSQL:='';
      xSQL:='Select MAX( CNTCOMPROB ) NUMERO From CNT300 '
           +'Where CIAID='   +''''+dblcCia.Text     +''' and '
           +      'TDIARID=' +''''+dblcTDiario.text +''' and '
           +      'CNTANOMM='+''''+dblcdPeriodo.text+''' ';

      DMAF.cdsQry.Close;
      DMAF.cdsQry.ProviderName:= 'dspTGE';
      DMAF.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
      DMAF.cdsQry.Open;
      if DMAF.cdsQry.FieldByName('NUMERO').AsString='' then
         meNoReg.Text:=DMAF.StrZero( 1, 10 )
      else begin
         meNoReg.Text:=DMAF.StrZero( StrtoInt(DMAF.cdsQry.FieldByName('NUMERO').AsString)+1, 10 );
      end;

      xWhere := 'TMonId='+''''+DMAF.wTMonExt+''''+' and '
              + 'Fecha='+DMAF.wRepFuncDate+''''+ FORMATDATETIME(DMAF.wFormatFecha,dtpFComp.Date)+''')';
      if length( DMAF.DisplayDescrip('dspTGE','TGE107','*',xWhere,'TMONID'))>0 then
         dbeCambio.Text:=FloattoStr(DMAF.cdsQry.fieldbyname('TCam'+DMAF.wVRN_TipoCambio).AsFloat)
      else begin
         dbeCambio.Text:='0';
      end;

   end;

end;



procedure TFContabilidad.dblcCiaExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere:='CIAID='''+dblcCia.Text+'''';
   edtCiaDes.Text:=BuscaDescripcion( DMAF.cdsCia, xWhere, 'CiaDes');
   if edtCiaDes.Text='' then begin
      dblcCia.SetFocus;
      Raise Exception.Create('Error : Compañía no Valida');
   end;
end;

procedure TFContabilidad.Z2bbtnContabClick(Sender: TObject);
var
   xSQL  : String;
   xTCam : Double;
   xWhere,FLAG: String;
begin
   xWhere:='FAPERIODO='''+dblcdPeriodo.TEXT+'''';
   FLAG :=DMAF.DisplayDescrip('dspTGE','ACF102','*',xWhere,'FLCONTA');

   if FLAG='S' then
   Begin
     Showmessage('El Periodo '''+dblcdPeriodo.TEXT+''' ya ha sido Contabilizado');
     Exit;
   End;


   if MessageDlg('¿ Esta Seguro de Contabilizar ?', mtconfirmation,[mbYes,MbNo],0)=mrYes then
   begin

      if  length(dblcTDiario.text)=0 then
      begin
         dblcTDiario.SetFocus;
         Raise Exception.Create('Debe seleccionar el Tipo de Diario');
      end;
      if  length(meNoReg.text)=0 then
      begin
         dtpFComp.SetFocus;
         Raise Exception.Create('Debe seleccionar la fecha del Comprobante');
      end;

      Screen.Cursor:=CrHourGlass;

      DMAF.cdsTrasPen.Edit;
      DMAF.cdsTrasPen.FieldByname('FLCONTA').AsString:='S';

      GrabaPrevio;

//      DMAF.GeneraContabilidad(dblcCia.Text,dblcTDiario.Text,dblcdPeriodo.Text,meNoReg.Text, Self, Sender );

      wSQL:='UPDATE ACF102 SET FLCONTA=''S'' '
           +'WHERE FAPERIODO='''+dblcdPeriodo.Text+'''';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(WSQL); // Llamada remota al provider del servidor
      DMAF.cdsQry.Execute;


      Screen.Cursor:=CrDefault;

      lblCNT.Visible       :=True;
      pnlDatos.Enabled     :=False;
      Z2bbtnContab.Enabled      :=False;
      pnlCab.Enabled       :=False;
      Z2bbtnPreview.Enabled:=True;
      ShowMessage('Depreciación Contabilizada');
   end;
end;

procedure TFContabilidad.dbeCambioExit(Sender: TObject);
begin
   if dbeCambio.text='' then
   begin
      dbeCambio.SetFocus;
      ShowMessage('Error en Tipo de Cambio');
   end;
end;

procedure TFContabilidad.bbtnBorraClick(Sender: TObject);
begin
   Close;
end;

procedure TFContabilidad.Z2bbtnPreviewClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
   xsql : String;

begin

   Screen.Cursor:=CrHourGlass;

   if DMAF.cdsTrasPen.FieldByName('FLCONTA').AsString<>'S' then
      GrabaPrevio;


   with Comprobante do begin
      CIAID    := dblcCia.Text ;
      TDIARID  := dblcTDiario.Text ;
      CiaDes   := edtCiaDes.Text;
      Diario   := edtTDiario.Text ;
      Proveedor:= '';
      Glosa    := 'Depreciación Activos Periodo '+dblcdPeriodo.Text;
      Lote     := 'DEP';
      TipoDoc  := '';
      TipoCamb := dbeCambio.Text ;
      Periodo  := dblcdPeriodo.Text ;
      NoComp   := meNoReg.Text ;
      NoDoc    := '';
      Cuenta   := '';
      Banco    := '';
      NumChq   := '';
      Moneda   := 'Soles';
      Importe  := FloattoStr(DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEBE)', ''));
      Tmoneda  := 'L';
   end;

   Screen.Cursor:=CrDefault;

   FVoucherImp:=TFVoucherImp.Create(Application);   // ACF292
   FVoucherImp.wBienedeForma := 'EGRESO';
   FVoucherImp.wComprobanteI:=Comprobante;
   with FVoucherImp do
   Try
      ShowModal; //ActiveMDIChild;
   Finally
   End;

end;




procedure TFContabilidad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMAF.cdsTrasSel.IndexFieldNames:='';
   DMAF.cdsTrasSel.Close;

   Action:=caFree;
end;

procedure TFContabilidad.GrabaPrevio;
var
   xSQL   : String;
   xTCam  : Double;
   xWhere : String;
   xCNTReg, xCon : Integer;
begin
   xSQL:='DELETE FROM ACF306 '
        +'WHERE CIAID='''   +dblcCia.Text     +''' and '
        +      'CNTANOMM='''+dblcdPeriodo.Text+''' and '
        +      'CNTLOTE=''DEP'' ';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   try
     DMAF.cdsQry.Execute;
   except
   end;

   if dbeCambio.Text='' then begin
      xWhere := 'TMonId='+''''+DMAF.wTMonExt+''''+' and '
              + 'Fecha='+DMAF.wRepFuncDate+''''+ FORMATDATETIME(DMAF.wFormatFecha,dtpFComp.Date)+''')';
      if length( DMAF.DisplayDescrip('dspTGE','TGE107','*',xWhere,'TMONID'))>0 then
         dbeCambio.Text:=FloattoStr(DMAF.cdsQry.fieldbyname('TCam'+DMAF.wVRN_TipoCambio).AsFloat)
      else begin
         dbeCambio.Text:='0';
      end;
   end;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
        xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
        +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
       xSQL:='SELECT * FROM TGE114 WHERE FECHA='
         +'TO_DATE('''+FORMATDATETIME(DMAF.wFormatFecha,dtpFComp.Date)+''')';
   end;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;

   xTCam:=StrToFloat( dbeCambio.Text );
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='Insert Into ACF306 ( CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTFCOMP, '
           +   'CUENTAID, CNTGLOSA, CCOSID, CNTDH, TMONID, CNTTCAMBIO, '
           +   'CNTLOTE, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
           +   'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
           +   'CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
           +   'CNTAASS, CNTUSER, CNTFREG, CNTHREG, TDIARDES ) '

           +'Select A.CIAID, '''+dblcTDiario.Text+''', '''+meNoreg.Text+''', '
               +''''+dblcdPeriodo.text+''', DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+'''), '
               +'D.CTADEPRE CUENTAID, ''Depreciación Activos Periodo '+dblcdPeriodo.Text+''', '
               +'A.CCOSID, ''D'' DH, '''+DMAF.wTMonLoc+''', '+FloatToStr(xTcam)+', '
               +'''DEP'', '
               +'SUM(A.DEPIMPHIST), SUM(A.DEPIMPHIST), SUM(A.DEPIMPHIST)*'+FloatToStr(xTcam)+', '
               +'SUM(A.DEPIMPHIST), SUM(A.DEPIMPHIST)*'+FloatToStr(xTcam)+', 0, 0, '
               +''''+DMAF.cdsQry.FieldByName('FECANO').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECMES').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECDIA').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECTRIM').AsString +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSEM').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSS').AsString   +''', '
               +''''+DMAF.cdsQry.FieldByName('FECAATRI').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASEM').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASS').AsString +''', '
               +''''+DMAF.wUsuario+''', CURRENT DATE, CURRENT TIME, MAX(A.CUENTAID) '
           +'From ACF204 A '
           +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
           +'Group by A.CIAID, D.CTADEPRE, A.CCOSID '
//           +'Having SUM(A.DEPIMPHIST)>0 '

           +'Union '

           +'Select A.CIAID, '''+dblcTDiario.Text+''', '''+meNoreg.Text+''', '
               +''''+dblcdPeriodo.text+''', DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+'''), '
               +'D.CTADEPAC CUENTAID, ''Depreciación Activos Periodo '+dblcdPeriodo.Text+''', '
               +''''' CCOSID, ''H'' DH, '''+DMAF.wTMonLoc+''', '+FloatToStr(xTcam)+', '
               +'''DEP'', '
               +'SUM(A.DEPIMPHIST), SUM(A.DEPIMPHIST), SUM(A.DEPIMPHIST)*'+FloatToStr(xTcam)+', '
               +'0, 0, SUM(A.DEPIMPHIST) HABER, SUM(A.DEPIMPHIST)*'+FloatToStr(xTcam)+', '
               +''''+DMAF.cdsQry.FieldByName('FECANO').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECMES').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECDIA').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECTRIM').AsString +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSEM').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSS').AsString   +''', '
               +''''+DMAF.cdsQry.FieldByName('FECAATRI').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASEM').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASS').AsString +''', '
               +''''+DMAF.wUsuario+''', CURRENT DATE, CURRENT TIME, MAX(A.CUENTAID) '
           +'From ACF204 A '
           +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' '
           +'Group by A.CIAID, D.CTADEPAC '
  //         +'Having SUM(A.DEPIMPAJUS)>0 ';
   end;
   if (SRV_D = 'ORACLE') then
      begin
      xSQL:='Insert Into ACF306 ( CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTFCOMP, '
           +   'CUENTAID, CNTGLOSA, CCOSID, CNTDH, TMONID, CNTTCAMBIO, '
           +   'CNTLOTE, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
           +   'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
           +   'CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
           +   'CNTAASS, CNTUSER, CNTFREG, CNTHREG, TDIARDES ) '
           +'Select A.CIAID, '''+dblcTDiario.Text+''', '''+meNoreg.Text+''', '
               +''''+dblcdPeriodo.text+''', TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFComp.Date)+'''), '
               +'D.CTADEPRE CUENTAID, ''Depreciación Activos Periodo '+dblcdPeriodo.Text+''', '
               +'A.CCOSID, ''D'' DH, '''+DMAF.wTMonLoc+''', '+FloatToStr(xTcam)+', '
               +'''DEP'', '
               +'SUM(A.DEPIMPHIST), SUM(A.DEPIMPHIST), SUM(A.DEPIMPHIST)*'+FloatToStr(xTcam)+', '
               +'SUM(A.DEPIMPHIST), SUM(A.DEPIMPHIST)*'+FloatToStr(xTcam)+', 0, 0, '
               +''''+DMAF.cdsQry.FieldByName('FECANO').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECMES').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECDIA').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECTRIM').AsString +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSEM').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSS').AsString   +''', '
               +''''+DMAF.cdsQry.FieldByName('FECAATRI').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASEM').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASS').AsString +''', '
               +''''+DMAF.wUsuario+''', SYSDATE, SYSDATE, MAX(A.CUENTAID) '
           +'From ACF204 A,ACF110 D '
//           +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' and A.CUENTAID=D.CUENTAID(+) '
           +'Group by A.CIAID, D.CTADEPRE, A.CCOSID '
//           +'Having SUM(A.DEPIMPHIST)>0 '

           +'Union '
           +'Select A.CIAID, '''+dblcTDiario.Text+''', '''+meNoreg.Text+''', '
               +''''+dblcdPeriodo.text+''', TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFComp.Date)+'''), '
               +'D.CTADEPAC CUENTAID, ''Depreciación Activos Periodo '+dblcdPeriodo.Text+''', '
               +''''' CCOSID, ''H'' DH, '''+DMAF.wTMonLoc+''', '+FloatToStr(xTcam)+', ' //MODIFICADO POR ANA
               +'''DEP'', '
               +'SUM(A.DEPIMPHIST), SUM(A.DEPIMPHIST), SUM(A.DEPIMPHIST)*'+FloatToStr(xTcam)+', '
               +'0, 0, SUM(A.DEPIMPHIST) HABER, SUM(A.DEPIMPHIST)*'+FloatToStr(xTcam)+', '
               +''''+DMAF.cdsQry.FieldByName('FECANO').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECMES').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECDIA').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECTRIM').AsString +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSEM').AsString  +''', '
               +''''+DMAF.cdsQry.FieldByName('FECSS').AsString   +''', '
               +''''+DMAF.cdsQry.FieldByName('FECAATRI').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASEM').AsString+''', '
               +''''+DMAF.cdsQry.FieldByName('FECAASS').AsString +''', '
               +''''+DMAF.wUsuario+''', SYSDATE, SYSDATE, MAX(A.CUENTAID) '
           +'From ACF204 A ,ACF110 D '
//           +'Left Join ACF110 D ON ( D.CUENTAID=A.CUENTAID ) '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dblcdPeriodo.Text+''' AND A.CUENTAID=D.CUENTAID(+) '
           +'Group by A.CIAID, D.CTADEPAC '
//           +'Having SUM(A.DEPIMPAJUS)>0 ';
   end;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Execute;

   wSQL:='SELECT * FROM ACF306 '
           +'Where ACF306.CIAID='''     + dblcCia.text      +''' and '
           +      'ACF306.CNTANOMM='''  + dblcdPeriodo.Text +''' and '
           +      'ACF306.TDIARID='''   + dblcTDiario.Text  +''' and '
           +      'ACF306.CNTCOMPROB='''+ meNoreg.Text      +''' and '
           +      'ACF306.CNTLOTE=''DEP'' ';
   DMAF.cdsACFCont.Close;
   DMAF.cdsACFCont.DataRequest(wSQL);
   DMAF.cdsACFCont.Open;
   DMAF.cdsACFCont.IndexFieldNames:='TDIARDES;CNTDH;CUENTAID;CCOSID';

   xCNTReg:=0;

   DMAF.cdsACFCont.First;
   while not DMAF.cdsACFCont.Eof do begin
      DMAF.cdsACFCont.Edit;
      xCNTReg:=xCNTReg+1;
      DMAF.cdsACFCont.FieldByName('CNTREG').AsInteger:=xCNTReg;
      DMAF.cdsACFCont.Next;
   end;

   DMAF.cdsACFCont.ApplyUpdates( 0 );

   // Codigo para generar el archivo cnt311 y usar la funcion Solconta

   DMAF.CDSQRY.CLOSE;
   WSQL:='INSERT INTO  CNT311 '
         + ' (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
         + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
         + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
         + ' CNTHABEMN,CNTHABEME,CNTREG) '

         + ' (SELECT CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
         + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
         + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
         + ' CNTHABEMN,CNTHABEME,CNTREG '
         +' FROM ACF306 '
         +' Where ACF306.CIAID='''     + dblcCia.text      +''' and '
         +      'ACF306.CNTANOMM='''  + dblcdPeriodo.Text +''' and '
         +      'ACF306.TDIARID='''   + dblcTDiario.Text  +''' and '
         +      'ACF306.CNTCOMPROB='''+ meNoreg.Text      +''' and '
         +      'ACF306.CNTLOTE=''DEP'' )';
   DMAF.CDSQRY.CLOSE;
   DMAF.CDSQRY.DATAREQUEST(wsql);
   DMAF.CDSQRY.EXECUTE;

   DMAF.CDSQRY.CLOSE;

   WSQL:='SELECT * FROM CNT311 WHERE '
         +'      CIAID='''     + dblcCia.text      +''' and '
         +      'CNTANOMM='''  + dblcdPeriodo.Text +''' and '
         +      'TDIARID='''   + dblcTDiario.Text  +''' and '
         +      'CNTCOMPROB='''+ meNoreg.Text      +''' and '
         +      'CNTLOTE=''DEP'' ';
   DMAF.cdsCNT311.Close;
   DMAF.cdsCNT311.DataRequest(WSQL);
   DMAF.cdsCNT311.Open;

   if DMAF.cdsTrasPen.FieldByName('FLCONTA').AsString='S' then
   begin

      if SOLConta(dblcCia.text,
                       dblcTDiario.Text,
                       dblcdPeriodo.Text,
                       meNoreg.Text,
                       SRV_D, 'C', DMAF.wModulo, DMAF.cdsCNT311, DMAF.cdsNivel,
                       DMAF.cdsResultSet, DMAF.DCOM1, Self ) then
         xCNTReg:=0;
   end;
   if DMAF.cdsTrasPen.FieldByName('FLCONTA').AsString<>'S' then
   begin

      if SOLConta(dblcCia.text,
                       dblcTDiario.Text,
                       dblcdPeriodo.Text,
                       meNoreg.Text,
                        SRV_D, 'P', DMAF.wModulo, DMAF.cdsCNT311, DMAF.cdsNivel,
                       DMAF.cdsResultSet, DMAF.DCOM1, Self ) then
         xCNTReg:=0;
   end;

end;

procedure TFContabilidad.FormShow(Sender: TObject);
var
   xSQL : String;
begin
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   Begin
      wSQL:='SELECT FAPERIODO, FLCONTA FROM ACF102 '
            +'WHERE coalesce(FAPROC,'''')=''P'' '
            +'ORDER BY FAPERIODO' ;
   end;
   if (SRV_D = 'ORACLE') then
   Begin
      wSQL:='SELECT FAPERIODO, FLCONTA FROM ACF102 '
            +'WHERE NVL(FAPROC,'''')=''P'' '
            +'ORDER BY FAPERIODO' ;
   End;
    DMAF.cdsTrasPen.Close;
    DMAF.cdsTrasPen.DataRequest(wSQL);
    DMAF.cdsTrasPen.Open;

    wSQL:='SELECT * FROM ACF306 '
         +'WHERE CNTANOMM=''AAAAMM'' ';
    DMAF.cdsACFCont.Close;
    DMAF.cdsACFCont.DataRequest(wSQL);
    DMAF.cdsACFCont.Open;

   xSQL:='Select A.CIAID, A.TACFID, '''' TACFDES, '''' CUENTAID, '''' CCOSID, '
        +' '' '' DH, 0 DEBE, 0 HABER '
        +'From ACF204 A '
        +'Where A.FAPERIODO=''AAAAMM'' ';

   DMAF.cdsTrasSel.Close;
   DMAF.cdsTrasSel.DataRequest( xSQL );
   DMAF.cdsTrasSel.Open;

   pnlCab.Enabled   :=True;
   lblCNT.Visible   :=False;
   pnlDatos.Enabled :=False;
   Z2bbtnContab.Enabled  :=False;
   bbtnBorra.Enabled:=False;
end;

end.
