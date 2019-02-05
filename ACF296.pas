unit ACF296;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ACF290, ppDB, ppDBPipe, ppBands, ppCache, ppClass, ppComm, ppRelatv,
  ppProd, ppReport, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, db,
  wwdbdatetimepicker, StdCtrls, wwdblook, Buttons, Wwdbdlg, ExtCtrls,
  DBClient, wwClient,oaContabiliza;

type
  TFReclasifica = class(TFContabilidad)
    dblcdCtaAct: TwwDBLookupComboDlg;
    Label1: TLabel;
    Label3: TLabel;
    dblcdCtaNew: TwwDBLookupComboDlg;
    BitBtn1: TBitBtn;
    dtpFecha: TwwDBDateTimePicker;
    Label4: TLabel;
    dbeNumero: TwwDBEdit;
    Label5: TLabel;
    Z2bbtnGraba: TBitBtn;
    Label6: TLabel;
    dbePeriodo: TwwDBEdit;
    BitBtn2: TBitBtn;
    Z2bbtnCambia: TBitBtn;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Z2bbtnPreviewClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dtpFCompExit(Sender: TObject);
    procedure Z2bbtnCambiaClick(Sender: TObject);
    procedure bbtnBorraClick(Sender: TObject);
  private
    { Private declarations }
    xMONTO   : Double;
    xDH      : String;
    xCuenta1 : String;
    xCuenta2 : String;
    xCNTReg  : Integer;
    fGraba   : Boolean;
    xCrea    : Boolean;
    procedure GrabaPrevio;
    procedure InsertaConta;
  public
    { Public declarations }

  end;

var
  FReclasifica: TFReclasifica;
  procedure cdsPost( xxCds:TwwClientDataSet );

implementation

uses ACFDM, ACF292, oaAF3000;

{$R *.DFM}
//{$I OPER.PAS}

procedure TFReclasifica.dblcCiaExit(Sender: TObject);
var
   xWhere : String;
begin
   if xCrea then exit;

   xWhere:='CIAID='''+dblcCia.Text+'''';
   edtCiaDes.Text:=BuscaDescripcion( DMAF.cdsCia, xWhere, 'CiaDes');
   if edtCiaDes.Text='' then begin
      dblcCia.SetFocus;
      Raise Exception.Create('Error : Compañía no Valida');
   end;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.Datarequest( 'Select MAX( NUMERO ) NUMERO FROM ACF307 WHERE CIAID='''+dblcCia.Text+'''' );
   DMAF.cdsQry.Open;

   if DMAF.cdsQry.FieldByName('NUMERO').AsString='' then
      DMAF.cdsReva.FieldByname('NUMERO').AsString:='0001'
   else
      DMAF.cdsReva.FieldByname('NUMERO').AsString:=DMAF.StrZero( StrToInt( DMAF.cdsQry.FieldByName('NUMERO').AsString) +1 , 4 ) ;
end;

procedure cdsPost( xxCds:TwwClientDataSet );
var
   i:integer;
begin
   for i:=0 to xxCds.Fields.Count-1 do begin

       if xxCds.Fields[ i ].ClassType=TStringField then begin
          if xxCds.Fields[ i ].AsString='' then
             xxCds.Fields[ i ].Clear;
       end;

       if xxCds.Fields[ i ].ClassType=TMemoField then begin
          if xxCds.Fields[ i ].AsString='' then
             xxCds.Fields[ i ].AsString:='.';

          if trim(xxCds.Fields[ i ].AsString)='' then
             xxCds.Fields[ i ].AsString:='.';
       end;

{       if xxCds.Fields[ i ].ClassType=TFloatField then begin
          if xxCds.Fields[ i ].Asstring='' then
             xxCds.Fields[ i ].AsString:='0';
       end;
       if xxCds.Fields[ i ].ClassType=TIntegerField then begin
          if xxCds.Fields[ i ].Asstring='' then
             xxCds.Fields[ i ].AsString:='0';
       end;
       if xxCds.Fields[ i ].ClassType=TDateField then begin
          if xxCds.Fields[ i ].Asstring='' then
             xxCds.Fields[ i ].AsDateTime :=date;
       end;

}
   end;
end;


procedure TFReclasifica.bbtnOkClick(Sender: TObject);
var
   xSQL : String;
   xWhere: String;
begin

   if edtCiaDes.text='' then begin
      dblcCia.SetFocus;
      ShowMessage( 'Error :  Falta Compañía' );
   end;

   wSQL:='SELECT FAPERIODO, FLREI FROM ACF102 '
        +'WHERE FAPROC=''P'' '
        +'ORDER BY FAPERIODO' ;
   DMAF.cdsTrasPen.Close;
   DMAF.cdsTrasPen.DataRequest(wSQL);
   DMAF.cdsTrasPen.Open;
   DMAF.cdsTrasPen.Last;
   dbePeriodo.Text:=DMAF.cdsTrasPen.FieldByname('FAPERIODO').AsString;

   if (DMAF.wModo='A') and (not fGraba) then
   Begin
      if MessageDlg('¿ Esta Seguro de Regenerar la data ?', mtconfirmation,[mbYes,MbNo],0)=mrYes then
    begin

      if (SRV_D = 'DB2NT') then
      begin
      xSQL:='Insert Into ACF308( CIAID, NUMERO, FECHA, ACFID, TACFID, ACFDES, CUENTAID, CUENTAID2, '
           +                    'VALORHIS, AJUSTE, DEPHIS, DEPAJU ) '
           +'Select A.CIAID, '''+dbeNumero.text+''', DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.Date)+'''), '
           +  'A.ACFID, A.TACFID, A.ACFDES TACFDES, A.CUENTAID, ''  '' CUENTAID2, '
           +  'MAX( A.DEPVALHIST) VALORHIS, '
           +  'ROUND(SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)),2) AJUSTE, '
           +  'SUM( COALESCE(D.DEPIMPHIST,0) ) DEPHIS, '
           +  'ROUND(SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)),2) DEPAJU '
           +'From ACF204 A '
           +'Left Join ACF101 B ON ( B.TACFID=A.TACFID ) '
           +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=A.CUENTAID ), '
           +'ACF204 D '
           +'Where A.CIAID='''+dblcCia.text+''' and ';
         if dbePeriodo.Text<>'' then
            xSQL:=xSQL+'A.FAPERIODO='''+dbePeriodo.Text+''' AND ';
      xSQL:=xSQL
           +      'A.CUENTAID='''+dblcdCtaaCT.Text+''' AND A.DEPVALHIST>0 AND '
           +    '( D.CIAID =A.CIAID AND D.ACFID=A.ACFID AND D.TACFID=A.TACFID AND '
           +      'D.ACFREFOR=''00'' AND A.CUENTAID=D.CUENTAID) '
           +'GROUP BY A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID';
      end;
      If (SRV_D = 'DB2400') then
      Begin
      xSQL:='Insert Into ACF308( CIAID, NUMERO, FECHA, ACFID, TACFID, ACFDES, CUENTAID, CUENTAID2, '
           +                    'VALORHIS, AJUSTE, DEPHIS, DEPAJU ) '
           +'Select A.CIAID, '''+dbeNumero.text+''', DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.Date)+'''), '
           +  'A.ACFID, A.TACFID, A.ACFDES TACFDES, A.CUENTAID, ''  '' CUENTAID2, '
           +  'MAX( A.DEPVALHIST) VALORHIS, '
           + ' case when (dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) )*power(10,2),15,2)-int(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) )*power(10,2)))*10>=5 '
           + ' then dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) ),15,2)+1/power(10,2) else dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) ),15,2) end AJUSTE, '
           +  'SUM( COALESCE(D.DEPIMPHIST,0) ) DEPHIS, '
           + ' case when (dec(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) )*power(10,2),15,2)-int(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) )*power(10,2)))*10>=5 '
           + ' then dec(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) ),15,2)+1/power(10,2) else dec(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) ),15,2) end DEPAJU '
           +'From ACF204 A '
           +'Left Join ACF101 B ON ( B.TACFID=A.TACFID ) '
           +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=A.CUENTAID ), '
           +'ACF204 D '
           +'Where A.CIAID='''+dblcCia.text+''' and ';
         if dbePeriodo.Text<>'' then
            xSQL:=xSQL+'A.FAPERIODO='''+dbePeriodo.Text+''' AND ';
      xSQL:=xSQL
           +      'A.CUENTAID='''+dblcdCtaaCT.Text+''' AND A.DEPVALHIST>0 AND '
           +    '( D.CIAID =A.CIAID AND D.ACFID=A.ACFID AND D.TACFID=A.TACFID AND '
           +      'D.ACFREFOR=''00'' AND A.CUENTAID=D.CUENTAID) '
           +'GROUP BY A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID';
      End;

      if (SRV_D = 'ORACLE') then
      begin
      xSQL:='Insert Into ACF308( CIAID, NUMERO, FECHA, ACFID, TACFID, ACFDES, CUENTAID, CUENTAID2, '
           +                    'VALORHIS, AJUSTE, DEPHIS, DEPAJU, FREG,HREG,USUARIO ) '
           +'Select A.CIAID, '''+dbeNumero.text+''', TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFecha.Date)+'''), '
           +  'A.ACFID, A.TACFID, A.ACFDES TACFDES, A.CUENTAID, ''  '' CUENTAID2, '
           +  'MAX( A.DEPVALHIST) VALORHIS, '
           +  'ROUND(SUM(NVL(D.DEPVALAJUS,0)-NVL(D.DEPVALHIST,0)),2) AJUSTE, '
           +  'SUM( NVL(D.DEPIMPHIST,0) ) DEPHIS, '
           +  'ROUND(SUM(NVL(D.DEPIMPAJUS,0)-NVL(D.DEPIMPHIST,0)),2) DEPAJU,SYSDATE,SYSDATE,'''+DMAF.wUsuario+''' '
           +'From ACF204 A, ACF101 B, TGE202 C, ACF204 D '
           +'Where A.CIAID='''+dblcCia.text+''' and ';
         if dbePeriodo.Text<>'' then
            xSQL:=xSQL+'A.FAPERIODO='''+dbePeriodo.Text+''' AND ';
      xSQL:=xSQL
           +      'A.CUENTAID='''+dblcdCtaaCT.Text+''' AND A.DEPVALHIST>0 AND  B.TACFID=A.TACFID  AND C.CIAID =A.CIAID AND C.CUENTAID=A.CUENTAID AND '
           +    '( D.CIAID =A.CIAID AND D.ACFID=A.ACFID AND D.TACFID=A.TACFID AND '
           +      'D.ACFREFOR=''00'' AND A.CUENTAID=D.CUENTAID) '
           +'GROUP BY A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID';
      end;
      DMAF.cdsTrasSel.Close;
      DMAF.cdsTrasSel.DataRequest( xSQL );
      try
        DMAF.cdsTrasSel.Execute;
      except
      end;
    end;
   end;
      xSQL:='SELECT CIAID, ACFID, TACFID, ACFDES, CUENTAID, CUENTAID2,  '
           +                    'VALORHIS, AJUSTE, DEPHIS, DEPAJU,FREG,HREG,USUARIO  '
           +' from ACF308 '
           +'Where CIAID=''' +dblcCia.Text+  ''' and '
           +      'NUMERO='''+dbeNumero.Text+'''';
      DMAF.cdsTrasSel.Close;
      DMAF.cdsTrasSel.DataRequest( xSQL );
      try
      DMAF.cdsTrasSel.Open;
      except
      end;


{  xSQL:='Select A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID, ''                    '' CUENTAID2, '
        +  'MAX( A.DEPVALHIST) VALORHIS, '
        +  'ROUND(SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)),2) AJUSTE, '
        +  'SUM( COALESCE(D.DEPIMPHIST,0) ) DEPHIS, '
        +  'ROUND(SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)),2) DEPAJU '
        +'From ACF204 A '
        +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=A.CUENTAID ), '
        +'ACF204 D '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dbePeriodo.Text+''' AND '
        +      'A.CUENTAID='''+dblcdCtaaCT.Text+''' AND A.DEPVALHIST>0 AND '
        +    '( D.CIAID =A.CIAID AND D.ACFID=A.ACFID AND D.TACFID=A.TACFID AND '
        +      'D.ACFREFOR=''00'' AND A.CUENTAID=D.CUENTAID) '
        +'GROUP BY A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID';
   end;
   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='Select A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID, ''                    '' CUENTAID2, '
        +  'MAX( A.DEPVALHIST) VALORHIS, '
        +  'ROUND(SUM(NVL(D.DEPVALAJUS,0)-NVL(D.DEPVALHIST,0)),2) AJUSTE, '
        +  'SUM( NVL(D.DEPIMPHIST,0) ) DEPHIS, '
        +  'ROUND(SUM(NVL(D.DEPIMPAJUS,0)-NVL(D.DEPIMPHIST,0)),2) DEPAJU '
        +'From ACF204 A, TGE202 C,ACF204 D '
//        +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=A.CUENTAID ), '
//        +'ACF204 D '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dbePeriodo.Text+''' AND '
        +      'A.CUENTAID='''+dblcdCtaaCT.Text+''' AND A.DEPVALHIST>0 AND C.CIAID =A.CIAID AND C.CUENTAID=A.CUENTAID AND '
        +    '( D.CIAID =A.CIAID AND D.ACFID=A.ACFID AND D.TACFID=A.TACFID AND '
        +      'D.ACFREFOR=''00'' AND A.CUENTAID=D.CUENTAID) '
        +'GROUP BY A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID';
   end;}

   DMAF.cdsTrasSel.IndexFieldNames:='CIAID;TACFID;ACFID';

   dbgConta.Selected.Clear;
   dbgConta.Selected.Add('ACFID'#9'8'#9'Activo~Id.'#9'F');
   dbgConta.Selected.Add('TACFID'#9'7'#9'Tipo~Activo'#9'F');
   dbgConta.Selected.Add('ACFDES'#9'25'#9'Activo Fijo'#9'F');
   dbgConta.Selected.Add('CUENTAID'#9'17'#9'Cuenta~Contable'#9'F');
   dbgConta.Selected.Add('CUENTAID2'#9'17'#9'Nueva~Cuenta'#9);
   dbgConta.Selected.Add('VALORHIS'#9'12'#9'Valor~Historico'#9'F');
   dbgConta.Selected.Add('AJUSTE'#9'10'#9'Valor~Ajuste'#9'F');
   dbgConta.Selected.Add('DEPHIS'#9'10'#9'Deprec.~Acumulada.'#9'F');
   dbgConta.Selected.Add('DEPAJU'#9'10'#9'Deprec.~Ajuste'#9'F');

   TNumericField( DMAF.cdsTrasSel.FieldByName('VALORHIS') ).DisplayFormat:='###,###,##0.00';
   TNumericField( DMAF.cdsTrasSel.FieldByName('AJUSTE') ).DisplayFormat:='###,###,##0.00';
   TNumericField( DMAF.cdsTrasSel.FieldByName('DEPHIS') ).DisplayFormat:='###,###,##0.00';
   TNumericField( DMAF.cdsTrasSel.FieldByName('DEPAJU') ).DisplayFormat:='###,###,##0.00';

   dbgConta.ColumnByName('VALORHIS').FooterValue:=FLOATTOSTRF( DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(VALORHIS)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('AJUSTE').FooterValue:=FLOATTOSTRF( DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(AJUSTE)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('DEPHIS').FooterValue:=FLOATTOSTRF( DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEPHIS)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('DEPAJU').FooterValue:=FLOATTOSTRF( DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEPAJU)', ''),ffNumber,15,2 );

   lblCNT.Visible       :=False;
   pnlDatos.Enabled     :=True;
   Z2bbtnContab.Enabled :=True;
   bbtnBorra.Enabled    :=True;
   Z2bbtnPreview.Enabled:=True;

   if DMAF.cdsReva.fieldbyname('FLCONTA').asstring='S' then
   begin
      xSQL:='SELECT * FROM ACF306 '
           +'WHERE CIAID='''   +dblcCia.text     +''' and '
           +      'CNTANOMM='''+DMAF.cdsReva.fieldbyname('CNTANOMM').asstring+''' AND CNTLOTE=''RECL'' ';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   try
      DMAF.cdsQry.Open;
   except
   end;

{ CODIGO ANTERIOR
 if DMAF.cdsTrasPen.FieldByName('FLREI').AsString='S' then begin
      xSQL:='SELECT * FROM ACF306 '
           +'WHERE CIAID='''   +dblcCia.text     +''' and '
           +      'CNTANOMM='''+dblcdPeriodo.Text+'''';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
      DMAF.cdsQry.Open;}

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

procedure TFReclasifica.BitBtn1Click(Sender: TObject);
var
   i : Integer;
begin
   if Length(dblcdCtaNew.Text)>0 then begin
      for i:= 0 to dbgConta.SelectedList.Count-1 do
      begin
          dbgConta.datasource.dataset.GotoBookmark(dbgConta.SelectedList.items[i]);
          DMAF.cdsTrasSel.Edit;
          DMAF.cdsTrasSel.FieldByName('CUENTAID2').AsString:=dblcdCtaNew.Text;
      end;
      dbgConta.SelectedList.Clear;
   end;
end;

procedure TFReclasifica.Z2bbtnContabClick(Sender: TObject);
var
   xSQL : String;
   xTCam : Double;
begin
   if MessageDlg('¿ Esta Seguro de Contabilizar ?', mtconfirmation,[mbYes,MbNo],0)=mrYes then
   begin

      dblcdPeriodo.Text:=FORMATDATETIME('YYYYMM',dtpFComp.Date);

{      DMAF.cdsTrasSel.First;
      while not DMAF.cdsTrasSel.Eof do begin
         if DMAF.cdsTrasSel.FIELDBYNAME('CUENTAID2').AsString='' then
            DMAF.cdsTrasSel.Delete
         else
           DMAF.cdsTrasSel.Next;
      end;

      DMAF.cdsTrasSel.ApplyUpdates( 0 );
      }

      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
         xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
           +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+''')';
      end;
      if (SRV_D = 'ORACLE') then
      begin
         xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
           +'TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFComp.Date)+''')';
      end;
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest( xSQL );
      DMAF.cdsQry.Open;

//      xTCam:=StrToFloat( dbeCambio.Text );

{      DMAF.cdsTrasSel.First;
      while not DMAF.cdsTrasSel.Eof do begin

         if DMAF.cdsTrasSel.FIELDBYNAME('CUENTAID2').AsString<>'' then begin
            xSQL:='Update ACF201 SET CUENTAID='''+DMAF.cdsTrasSel.FIELDBYNAME('CUENTAID2').AsString+''' '
                 +'Where CIAID=''' +DMAF.cdsTrasSel.fIELDbYnAME('CIAID').AsString+''' AND  '
                 +      'ACFID=''' +DMAF.cdsTrasSel.fIELDbYnAME('ACFID').AsString+''' AND  '
                 +      'TACFID='''+DMAF.cdsTrasSel.fIELDbYnAME('TACFID').AsString+''' ';

            DMAF.cdsQry.Close;
            DMAF.cdsQry.DataRequest( xSQL );
            DMAF.cdsQry.Execute;
         end;
         DMAF.cdsTrasSel.Next;
      end;}
      DMAF.cdsReva.edit;
      DMAF.cdsReva.FieldByName('FLCONTA').asstring:='S';

      GrabaPrevio;

//      DMAF.GeneraContabilidad(dblcCia.Text,dblcTDiario.Text,dblcdPeriodo.Text,meNoReg.Text, Self, Sender );

      lblCNT.Visible       :=True;
      pnlDatos.Enabled     :=False;
      Z2bbtnContab.Enabled :=False;
      pnlCab.Enabled       :=False;
      Z2bbtnPreview.Enabled:=True;
      Z2bbtnGraba.Enabled  :=True;

      DMAF.cdsReva.edit;
      DMAF.cdsReva.FieldByName('TDIARID').asstring:=dblcTDiario.text;
      DMAF.cdsReva.FieldByName('CNTCOMPROB').asstring:=meNoReg.text;
      DMAF.cdsReva.FieldByName('FECCONTAB').asdatetime:=date;
      DMAF.cdsReva.FieldByName('CNTANOMM').asstring:=FORMATDATETIME('YYYYMM',dtpFComp.Date);
      cdsPost( DMAF.cdsReva );
      DMAF.AplicaDatos(DMAF.cdsReva,'REVA');
      ShowMessage('Depreciación Contabilizada');
   end;
end;


procedure TFReclasifica.GrabaPrevio;
var
   xSQL     : String;
   xCtaAju1 : String;
   xCtaDep1 : String;
   xCtaDeA1 : String;
   xCtaAju2 : String;
   xCtaDep2 : String;
   xCtaDeA2 : String;
begin
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='DELETE FROM ACF306 '
           +'WHERE CIAID='''   +dblcCia.Text   +''' and '
           +      'COALESCE(CNTCOMPROB,'''')='''' ';
   end;
   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='DELETE FROM ACF306 '
           +'WHERE CIAID='''   +dblcCia.Text   +''' and '
           +      'NVL(CNTCOMPROB,''NULO'')=''NULO'' ';
   end;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   try
      DMAF.cdsQry.Execute;
   except
   end;

      xSQL:='DELETE FROM ACF306 '
           +'WHERE CIAID='''   +dblcCia.Text   +''' and '
           +      'CNTCOMPROB='''+meNoReg.TEXT+''' AND TDIARID='''+dblcTDiario.TEXT+''' AND CNTANOMM='''+FORMATDATETIME('YYYYMM',dtpFComp.Date)
           + ''' AND CNTFCOMP='''+formatdatetime(DMAF.wFormatFecha,dtpFComp.Date)+'''';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   try
      DMAF.cdsQry.Execute;
   except
   end;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
           +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
           +'TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFComp.Date)+''')';
   end;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;

   xCNTReg:=0;

   DMAF.cdsTrasSel.First;
   while not DMAF.cdsTrasSel.Eof do begin

      if LENGTH(DMAF.cdsTrasSel.FIELDBYNAME('CUENTAID2').AsString)>2 then begin

         xSQL:='SELECT * FROM ACF110 WHERE CUENTAID='''+DMAF.cdsTrasSel.FIELDBYNAME('CUENTAID').AsString+'''';
         DMAF.cdsQry2.Close;
         DMAF.cdsQry2.DataRequest( xSQL );
         DMAF.cdsQry2.Open;

         xCtaAju1:=DMAF.cdsQry2.FieldByname('REIAJUSTE').AsString;
         xCtaDep1:=DMAF.cdsQry2.FieldByname('CTADEPAC').AsString;
         xCtaDeA1:=DMAF.cdsQry2.FieldByname('REIDEPRE').AsString;

         xSQL:='SELECT * FROM ACF110 WHERE CUENTAID='''+DMAF.cdsTrasSel.FIELDBYNAME('CUENTAID2').AsString+'''';
         DMAF.cdsQry2.Close;
         DMAF.cdsQry2.DataRequest( xSQL );
         DMAF.cdsQry2.Open;

         xCtaAju2:=DMAF.cdsQry2.FieldByname('REIAJUSTE').AsString;
         xCtaDep2:=DMAF.cdsQry2.FieldByname('CTADEPAC').AsString;
         xCtaDeA2:=DMAF.cdsQry2.FieldByname('REIDEPRE').AsString;

         // Reclasifica Activo
         if DMAF.cdsTrasSel.FieldByName('VALORHIS').AsFloat>0 then begin
            xMONTO:=DMAF.cdsTrasSel.FieldByName('VALORHIS').AsFloat;
            xDH    :='D';
            xCuenta1:=DMAF.cdsTrasSel.FieldByname('CUENTAID2').AsString;
            xCuenta2:=DMAF.cdsTrasSel.FieldByname('CUENTAID').AsString;
            InsertaConta;
         end;

         // Asiento de Ajuste
         if DMAF.cdsTrasSel.FieldByName('AJUSTE').AsFloat>0 then begin
            xMONTO:=DMAF.cdsTrasSel.FieldByName('AJUSTE').AsFloat;
            xDH    :='D';
            xCuenta1:=xCtaAju2;
            xCuenta2:=xCtaAju1;
            InsertaConta;
         end;

         // Asiento de DEPRECIACIÓN
         if DMAF.cdsTrasSel.FieldByName('DEPHIS').AsFloat>0 then begin
            xMONTO:=DMAF.cdsTrasSel.FieldByName('DEPHIS').AsFloat;
            xDH    :='D';
            xCuenta1:=xCtaDep1;
            xCuenta2:=xCtaDep2;
            InsertaConta;
         end;

         // Asiento de DEPRECIACIÓN ajuste
         if DMAF.cdsTrasSel.FieldByName('DEPAJU').AsFloat>0 then begin
            xMONTO:=DMAF.cdsTrasSel.FieldByName('DEPAJU').AsFloat;
            xDH    :='D';
            xCuenta1:=xCtaDeA1;
            xCuenta2:=xCtaDeA2;
            InsertaConta;
         end;
     end;
     DMAF.cdsTrasSel.Next;
   end;
   DMAF.cdsACFCont.ApplyUpdates( 0 );

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
         +      'ACF306.CNTLOTE=''RECL'' )';
   DMAF.CDSQRY.CLOSE;
   DMAF.CDSQRY.DATAREQUEST(wsql);
   DMAF.CDSQRY.EXECUTE;

   DMAF.CDSQRY.CLOSE;

   WSQL:='SELECT * FROM CNT311 WHERE '
         +'      CIAID='''     + dblcCia.text      +''' and '
         +      'CNTANOMM='''  + dblcdPeriodo.Text +''' and '
         +      'TDIARID='''   + dblcTDiario.Text  +''' and '
         +      'CNTCOMPROB='''+ meNoreg.Text      +''' and '
         +      'CNTLOTE=''RECL'' ';
   DMAF.cdsCNT311.Close;
   DMAF.cdsCNT311.DataRequest(WSQL);
   DMAF.cdsCNT311.Open;

  if DMAF.cdsReva.FieldByName('FLCONTA').AsString='S' then
   begin

      if SOLConta(dblcCia.text,
                       dblcTDiario.Text,
                       dblcdPeriodo.Text,
                       meNoreg.Text,
                       SRV_D, 'C', DMAF.wModulo, DMAF.cdsCNT311, DMAF.cdsNivel,
                       DMAF.cdsResultSet, DMAF.DCOM1, Self ) then

   end;
   if DMAF.cdsReva.FieldByName('FLCONTA').AsString<>'S' then
   begin

      if SOLConta(dblcCia.text,
                       dblcTDiario.Text,
                       dblcdPeriodo.Text,
                       meNoreg.Text,
                       SRV_D, 'P', DMAF.wModulo, DMAF.cdsCNT311, DMAF.cdsNivel,
                       DMAF.cdsResultSet, DMAF.DCOM1, Self ) then

   end;


end;


procedure TFReclasifica.InsertaConta;
var
   xTCam : Double;
begin

   DMAF.cdsACFCont.Insert;
   DMAF.cdsACFCont.FieldByName('CIAID').Value     :=dblcCia.Text;
   DMAF.cdsACFCont.FieldByName('TDIARID').Value   :=dblcTDiario.Text;
   DMAF.cdsACFCont.FieldByName('CNTCOMPROB').Value:=meNoreg.Text;
   DMAF.cdsACFCont.FieldByName('CNTANOMM').Value  :=dblcdPeriodo.text;    //        FORMATDATETIME('YYYYMM',.Date);
   DMAF.cdsACFCont.FieldByName('CNTFCOMP').Value  :=dtpFComp.Date;
   DMAF.cdsACFCont.FieldByName('CNTNODOC').Value  :=dbeNumero.text;

   DMAF.cdsACFCont.FieldByName('CUENTAID').Value  :=xCuenta1;
   DMAF.cdsACFCont.FieldByName('CNTGLOSA').Value  :='Reclasificación de Activos Periodo '+dblcdPeriodo.Text;
   DMAF.cdsACFCont.FieldByName('CNTDH').Value     :=xDH;
   DMAF.cdsACFCont.FieldByName('TMONID').Value    :=DMAF.wTMonLoc;
   DMAF.cdsACFCont.FieldByName('CNTTCAMBIO').Value:=StrToFloat( dbeCambio.Text );
   DMAF.cdsACFCont.FieldByName('CAMPOVAR').Value  :=DMAF.cdsTrasSel.FieldByname('TACFID').AsString;
   DMAF.cdsACFCont.FieldByName('CNTLOTE').Value   :='RECL';

   DMAF.cdsACFCont.FieldByName('CNTMTOORI').Value :=xMonto;
   DMAF.cdsACFCont.FieldByName('CNTMTOLOC').Value :=xMonto;
   DMAF.cdsACFCont.FieldByName('CNTMTOEXT').Value :=0;  //FRound( xMonto/xTCam,15,2);;

   if xDH='D' then begin
      DMAF.cdsACFCont.FieldByName('CNTDEBEMN').Value :=xMonto;
      DMAF.cdsACFCont.FieldByName('CNTDEBEME').Value :=0;  //FRound( xMonto/xTCam,15,2);
   end
   else begin
      DMAF.cdsACFCont.FieldByName('CNTHABEMN').Value :=xMonto;
      DMAF.cdsACFCont.FieldByName('CNTHABEME').Value :=0;  //FRound( xMonto/xTCam,15,2);
   end;

   DMAF.cdsACFCont.FieldByName('CNTANO').VALUE  :=DMAF.cdsQry.FieldByName('FECANO').Value;
   DMAF.cdsACFCont.FieldByName('CNTMM').VALUE   :=DMAF.cdsQry.FieldByName('FECMES').Value;
   DMAF.cdsACFCont.FieldByName('CNTDD').VALUE   :=DMAF.cdsQry.FieldByName('FECDIA').Value;
   DMAF.cdsACFCont.FieldByName('CNTTRI').VALUE  :=DMAF.cdsQry.FieldByName('FECTRIM').Value;
   DMAF.cdsACFCont.FieldByName('CNTSEM').VALUE  :=DMAF.cdsQry.FieldByName('FECSEM').Value;
   DMAF.cdsACFCont.FieldByName('CNTSS').VALUE   :=DMAF.cdsQry.FieldByName('FECSS').Value;
   DMAF.cdsACFCont.FieldByName('CNTAATRI').VALUE:=DMAF.cdsQry.FieldByName('FECAATRI').Value;
   DMAF.cdsACFCont.FieldByName('CNTAASEM').VALUE:=DMAF.cdsQry.FieldByName('FECAASEM').Value;
   DMAF.cdsACFCont.FieldByName('CNTAASS').VALUE :=DMAF.cdsQry.FieldByName('FECAASS').Value;
   xCNTReg:=xCNTReg+1;
   DMAF.cdsACFCont.FieldByName('CNTREG').VALUE :=xCNTReg;

   DMAF.cdsACFCont.FieldByName('CNTUSER').VALUE :=DMAF.wUsuario;
   DMAF.cdsACFCont.FieldByName('CNTFREG').VALUE :=DATE;
   DMAF.cdsACFCont.FieldByName('CNTHREG').VALUE :=TIME;

   ////////////////////

   DMAF.cdsACFCont.Insert;
   DMAF.cdsACFCont.FieldByName('CIAID').Value     :=dblcCia.Text;
   DMAF.cdsACFCont.FieldByName('TDIARID').Value   :=dblcTDiario.Text;
   DMAF.cdsACFCont.FieldByName('CNTCOMPROB').Value:=meNoreg.Text;
   DMAF.cdsACFCont.FieldByName('CNTANOMM').Value  :=dblcdPeriodo.text;
   DMAF.cdsACFCont.FieldByName('CNTFCOMP').Value  :=dtpFComp.Date;
   DMAF.cdsACFCont.FieldByName('CNTNODOC').Value  :=dbeNumero.text;

   DMAF.cdsACFCont.FieldByName('CUENTAID').Value  :=xCuenta2;
   DMAF.cdsACFCont.FieldByName('CNTGLOSA').Value  :='Reclasificación de Activos Número '+dbeNumero.Text;
   DMAF.cdsACFCont.FieldByName('TMONID').Value    :=DMAF.wTMonLoc;
   DMAF.cdsACFCont.FieldByName('CNTTCAMBIO').Value:=StrToFloat( dbeCambio.Text );
   DMAF.cdsACFCont.FieldByName('CAMPOVAR').Value  :=DMAF.cdsTrasSel.FieldByname('TACFID').AsString;
   DMAF.cdsACFCont.FieldByName('CNTLOTE').Value   :='RECL';

   DMAF.cdsACFCont.FieldByName('CNTMTOORI').Value :=xMonto;
   DMAF.cdsACFCont.FieldByName('CNTMTOLOC').Value :=xMonto;
   DMAF.cdsACFCont.FieldByName('CNTMTOEXT').Value :=0;  //FRound( xMonto/xTCam,15,2);;

   if xDH='D' then begin
      DMAF.cdsACFCont.FieldByName('CNTDH').Value     :='H';
      DMAF.cdsACFCont.FieldByName('CNTHABEMN').Value :=xMonto;
      DMAF.cdsACFCont.FieldByName('CNTHABEME').Value :=0;  //FRound( xMonto/xTCam,15,2);
   end
   else begin
      DMAF.cdsACFCont.FieldByName('CNTDH').Value     :='D';
      DMAF.cdsACFCont.FieldByName('CNTDEBEMN').Value :=xMonto;
      DMAF.cdsACFCont.FieldByName('CNTDEBEME').Value :=0;  //FRound( xMonto/xTCam,15,2);
   end;

   DMAF.cdsACFCont.FieldByName('CNTANO').VALUE  :=DMAF.cdsQry.FieldByName('FECANO').Value;
   DMAF.cdsACFCont.FieldByName('CNTMM').VALUE   :=DMAF.cdsQry.FieldByName('FECMES').Value;
   DMAF.cdsACFCont.FieldByName('CNTDD').VALUE   :=DMAF.cdsQry.FieldByName('FECDIA').Value;
   DMAF.cdsACFCont.FieldByName('CNTTRI').VALUE  :=DMAF.cdsQry.FieldByName('FECTRIM').Value;
   DMAF.cdsACFCont.FieldByName('CNTSEM').VALUE  :=DMAF.cdsQry.FieldByName('FECSEM').Value;
   DMAF.cdsACFCont.FieldByName('CNTSS').VALUE   :=DMAF.cdsQry.FieldByName('FECSS').Value;
   DMAF.cdsACFCont.FieldByName('CNTAATRI').VALUE:=DMAF.cdsQry.FieldByName('FECAATRI').Value;
   DMAF.cdsACFCont.FieldByName('CNTAASEM').VALUE:=DMAF.cdsQry.FieldByName('FECAASEM').Value;
   DMAF.cdsACFCont.FieldByName('CNTAASS').VALUE :=DMAF.cdsQry.FieldByName('FECAASS').Value;
   xCNTReg:=xCNTReg+1;
   DMAF.cdsACFCont.FieldByName('CNTREG').VALUE :=xCNTReg;


   DMAF.cdsACFCont.FieldByName('CNTUSER').VALUE :=DMAF.wUsuario;
   DMAF.cdsACFCont.FieldByName('CNTFREG').VALUE :=DATE;
   DMAF.cdsACFCont.FieldByName('CNTHREG').VALUE :=TIME;

end;

procedure TFReclasifica.FormActivate(Sender: TObject);
var
   xSQL,xwhere : String;
begin
   xCrea :=True;

   wSQL:='SELECT * FROM ACF306 '
        +'WHERE CNTANOMM=''AAAAMM'' ';
   DMAF.cdsACFCont.Close;
   DMAF.cdsACFCont.DataRequest(wSQL);
   DMAF.cdsACFCont.Open;

   DMAF.cdsTdiario.close;
   DMAF.cdsTdiario.DataRequest('SELECT * FROM TGE104');
   DMAF.cdsTdiario.Open;

   if DMAF.wModo='A' then begin
      pnlCab.Enabled:=True;
      edtciades.text:='';
      dblcTDiario.text:='';
      edtTDiario.text:='';
      meNoReg.text:='';
      dblcdCtaAct.text:='';
      DMAF.cdstrassel.close;
      fGraba:=False;
      DMAF.cdsReva.Insert
   end
   else begin
      DMAF.cdsReva.Edit;
      pnlCab.Enabled:=False;
      lblCNT.visible:=false;

      xSQL:='Select * From ACF308 '
           +'Where CIAID=''' +dblcCia.Text+  ''' and '
           +      'NUMERO='''+dbeNumero.Text+'''';
      DMAF.cdsTrasSel.Close;
      DMAF.cdsTrasSel.DataRequest( xSQL );
      DMAF.cdsTrasSel.Open;

      DMAF.cdsTrasSel.IndexFieldNames:='CIAID;TACFID;ACFID';
      dblcdCtaAct.text:=DMAF.cdsTrasSel.fieldbynAme('CUENTAID').asstring;

      dblcdCtaNew.SetFocus;
      dtpFComp.date:=DMAF.cdsreva.fieldbyname('FECHA').asdatetime;

      If DMAF.cdsreva.fieldbyname('TDIARID').asstring<>'' then
      begin
         xWhere:='CIAID='''+dblcCia.Text+'''';
         edtCiaDes.Text:=BuscaDescripcion( DMAF.cdsCia, xWhere, 'CiaDes');
      END;
      dblcTDiario.text:=DMAF.cdsreva.fieldbyname('TDIARID').asstring;
      If DMAF.cdsreva.fieldbyname('CIAID').asstring<>'' then
      begin
         xWhere:='TDiarId='+''''+dblcTDiario.Text+'''';
         edtTDiario.Text:=DMAF.DisplayDescrip('dspTGE','TGE104','*',xWhere,'TDiarDes');
      end;
      meNoReg.text:=DMAF.cdsreva.fieldbyname('CNTCOMPROB').asstring;
      dtpFComp.text:=DMAF.cdsreva.fieldbyname('FECHA').asstring;
      If DMAF.cdsreva.fieldbyname('FLCONTA').asstring='S' then
      Begin
        lblCNT.visible:=true;
      End;
   end;

      dbgConta.Selected.Clear;
      dbgConta.Selected.Add('ACFID'#9'8'#9'Activo~Id.'#9'F');
      dbgConta.Selected.Add('TACFID'#9'7'#9'Tipo~Activo'#9'F');
      dbgConta.Selected.Add('ACFDES'#9'25'#9'Activo Fijo'#9'F');
      dbgConta.Selected.Add('CUENTAID'#9'17'#9'Cuenta~Contable'#9'F');
      dbgConta.Selected.Add('VALORHIS'#9'12'#9'Valor~Historico'#9'F');
      dbgConta.Selected.Add('AJUSTE'#9'10'#9'Valor~Ajuste'#9'F');
      dbgConta.Selected.Add('CUENTAID2'#9'17'#9'Nueva~Cuenta'#9);
      dbgConta.Selected.Add('DEPHIS'#9'10'#9'Deprec.~Acumulada.'#9'F');
      dbgConta.Selected.Add('DEPAJU'#9'10'#9'Deprec.~Ajuste'#9'F');

      xCrea :=False;

end;

procedure TFReclasifica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   xCrea     := true;

   DMAF.cdsReva.CancelUpdates;

      //AGREGADO POR ANA
   DMAF.cdsTrasPen.Filtered:=False;
   DMAF.cdsTrasPen.Filter  :='';
   DMAF.cdsTrasPen.Close; DMAF.cdsTrasSel.close;

   DMAF.cdsTDiario.Filtered:=False;
   DMAF.cdsTDiario.Filter  :='';
   DMAF.cdsTDiario.Close; DMAF.cdsTrasSel.IndexFieldNames:='';
   Action:=caFree;
end;

procedure TFReclasifica.Z2bbtnGrabaClick(Sender: TObject);
var
   xSQL : String;
begin

   DMAF.cdsReva.Edit;
   DMAF.cdsReva.FieldByname('FREG').AsDateTime:=Date;
   DMAF.cdsReva.FieldByname('HREG').AsDateTime:=Time;
   DMAF.cdsReva.FieldByname('USUARIO').AsString:=DMAF.wUsuario;
   DMAF.cdsReva.ApplyUpdates( 0 );

   if (DMAF.wModo='A') and (not fGraba) then begin
//      MODIFICADO POR ANA PARA INSERTARLO EN EL BOTON DE CONSULTA
{      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin

      xSQL:='Insert Into ACF308( CIAID, NUMERO, FECHA, ACFID, TACFID, ACFDES, CUENTAID, CUENTAID2, '
           +                    'VALORHIS, AJUSTE, DEPHIS, DEPAJU ) '
           +'Select A.CIAID, '''+dbeNumero.text+''', DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.Date)+'''), '
           +  'A.ACFID, A.TACFID, A.ACFDES TACFDES, A.CUENTAID, '''' CUENTAID2, '
           +  'MAX( A.DEPVALHIST) VALORHIS, '
           +  'ROUND(SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)),2) AJUSTE, '
           +  'SUM( COALESCE(D.DEPIMPHIST,0) ) DEPHIS, '
           +  'ROUND(SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)),2) DEPAJU '
           +'From ACF204 A '
           +'Left Join ACF101 B ON ( B.TACFID=A.TACFID ) '
           +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=A.CUENTAID ), '
           +'ACF204 D '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dbePeriodo.Text+''' AND '
           +      'A.CUENTAID='''+dblcdCtaaCT.Text+''' AND A.DEPVALHIST>0 AND '
           +    '( D.CIAID =A.CIAID AND D.ACFID=A.ACFID AND D.TACFID=A.TACFID AND '
           +      'D.ACFREFOR=''00'' AND A.CUENTAID=D.CUENTAID) '
           +'GROUP BY A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID';
      end;
      if (SRV_D = 'ORACLE') then
      begin
      xSQL:='Insert Into ACF308( CIAID, NUMERO, FECHA, ACFID, TACFID, ACFDES, CUENTAID, CUENTAID2, '
           +                    'VALORHIS, AJUSTE, DEPHIS, DEPAJU ) '
           +'Select A.CIAID, '''+dbeNumero.text+''', TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFecha.Date)+'''), '
           +  'A.ACFID, A.TACFID, A.ACFDES TACFDES, A.CUENTAID, '''' CUENTAID2, '
           +  'MAX( A.DEPVALHIST) VALORHIS, '
           +  'ROUND(SUM(NVL(D.DEPVALAJUS,0)-NVL(D.DEPVALHIST,0)),2) AJUSTE, '
           +  'SUM( NVL(D.DEPIMPHIST,0) ) DEPHIS, '
           +  'ROUND(SUM(NVL(D.DEPIMPAJUS,0)-NVL(D.DEPIMPHIST,0)),2) DEPAJU '
           +'From ACF204 A, ACF101 B, TGE202 C, ACF204 D '
//           +'Left Join ACF101 B ON ( B.TACFID=A.TACFID ) '
//           +'Left Join TGE202 C ON ( C.CIAID =A.CIAID AND C.CUENTAID=A.CUENTAID ), '
//           +'ACF204 D '
           +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+dbePeriodo.Text+''' AND '
           +      'A.CUENTAID='''+dblcdCtaaCT.Text+''' AND A.DEPVALHIST>0 AND  B.TACFID=A.TACFID  AND C.CIAID =A.CIAID AND C.CUENTAID=A.CUENTAID AND '
           +    '( D.CIAID =A.CIAID AND D.ACFID=A.ACFID AND D.TACFID=A.TACFID AND '
           +      'D.ACFREFOR=''00'' AND A.CUENTAID=D.CUENTAID) '
           +'GROUP BY A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID';
      end;
      DMAF.cdsTrasSel.Close;
      DMAF.cdsTrasSel.DataRequest( xSQL );
      DMAF.cdsTrasSel.Execute;
                               }
{      xSQL:='Select * From ACF308 '
           +'Where CIAID=''' +dblcCia.Text+  ''' and '
           +      'NUMERO='''+dbeNumero.Text+'''';

      DMAF.cdsTrasSel.Close;
      DMAF.cdsTrasSel.DataRequest( xSQL );
      DMAF.cdsTrasSel.Open;}

      DMAF.cdsTrasSel.Edit;
      DMAF.cdsTrasSel.FieldByname('FREG').AsDateTime:=Date;
      DMAF.cdsTrasSel.FieldByname('HREG').AsDateTime:=Time;
      DMAF.cdsTrasSel.FieldByname('USUARIO').AsString:=DMAF.wUsuario;

      CDSPOST(DMAF.cdsTrasSel);
//      DMAF.cdsTrasSel.ApplyUpdates( 0 );
      DMAF.AplicaDatos(DMAF.cdsTrasSel,'RECLASIFICA');
//**fin de agregacion
   end
   else begin

      DMAF.cdsTrasSel.Edit;
      DMAF.cdsTrasSel.FieldByname('FREG').AsDateTime:=Date;
      DMAF.cdsTrasSel.FieldByname('HREG').AsDateTime:=Time;
      DMAF.cdsTrasSel.FieldByname('USUARIO').AsString:=DMAF.wUsuario;
//      DMAF.cdsTrasSel.ApplyUpdates( 0 );
      cdsPost(DMAF.cdsTrasSel);
      DMAF.AplicaDatos(DMAF.cdsTrasSel,'RECLASIFICA');
   end;
   fGraba:=True;

end;

procedure TFReclasifica.BitBtn2Click(Sender: TObject);
var
   i : Integer;
begin
   for i:= 0 to dbgConta.SelectedList.Count-1 do
   begin
       dbgConta.datasource.dataset.GotoBookmark(dbgConta.SelectedList.items[i]);
       DMAF.cdsTrasSel.Edit;
       DMAF.cdsTrasSel.FieldByName('CUENTAID2').Clear;
   end;
   dbgConta.SelectedList.Clear;
end;

procedure TFReclasifica.Z2bbtnPreviewClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
   xAAMM, xWhere : String;
begin

   xWhere := 'TMonId='+''''+DMAF.wTMonExt+''''+' and '
           + 'Fecha='+DMAF.wRepFuncDate+''''+ FORMATDATETIME(DMAF.wFormatFecha,dtpFComp.Date)+''')';
   if length( DMAF.DisplayDescrip('dspTGE','TGE107','*',xWhere,'TMONID'))>0 then
      dbeCambio.Text:=FloattoStr(DMAF.cdsQry.fieldbyname('TCam'+DMAF.wVRN_TipoCambio).AsFloat)
   else begin
      dbeCambio.Text:='0';
   end;

   if DMAF.cdsreva.fieldbyname('FLCONTA').asstring<>'S' then
       GrabaPrevio;

   xAAMM:='';
   if meNoReg.Text<>'' then
      xAAMM:=FORMATDATETIME('YYYYMM',dtpFComp.Date);

   with Comprobante do begin
      CIAID    := dblcCia.Text ;
      TDIARID  := dblcTDiario.Text ;
      CiaDes   := edtCiaDes.Text;
      Diario   := edtTDiario.Text ;
      Proveedor:= '';
      Glosa    := 'Reclasificación de Activos Número '+dbeNumero.Text;
      Lote     := 'RECL';
      TipoDoc  := '';
      TipoCamb := dbeCambio.Text ;
      Periodo  := xAAMM;
      NoComp   := meNoReg.Text ;
      NoDoc    := '';
      Cuenta   := '';
      Banco    := '';
      NumChq   := '';
      Moneda   := 'Soles';
   {   dbgConta.ColumnByName('VALORHIS').FooterValue:=FLOATTOSTRF( OperClientDataset(DMAF.cdsTrasSel, 'SUM(VALORHIS)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('AJUSTE').FooterValue:=FLOATTOSTRF( OperClientDataset(DMAF.cdsTrasSel, 'SUM(AJUSTE)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('DEPHIS').FooterValue:=FLOATTOSTRF( OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEPHIS)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('DEPAJU').FooterValue:=FLOATTOSTRF( OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEPAJU)', ''),ffNumber,15,2 );
}
      Importe  :=FloattoStr(DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(VALORHIS)', '')+DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(AJUSTE)', '')+DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEPHIS)', '')+DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(DEPAJU)', '') );

      Tmoneda  := 'L';
   end;

   FVoucherImp:=TFVoucherImp.Create(Application);   // ACF292
   FVoucherImp.wBienedeForma := 'EGRESO';
   FVoucherImp.wComprobanteI:=Comprobante;
   with FVoucherImp do
   Try
      ShowModal; //ActiveMDIChild;
   Finally
      Free;
   End;
end;

procedure TFReclasifica.dblcTDiarioExit(Sender: TObject);
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

procedure TFReclasifica.dtpFCompExit(Sender: TObject);
var
   xSQL, xWhere : String;
begin
   dblcdPeriodo.Text:=FORMATDATETIME('YYYYMM',dtpFComp.Date);
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

procedure TFReclasifica.Z2bbtnCambiaClick(Sender: TObject);
var
xsql:string;
begin
//  inherited;


   if MessageDlg('¿ Esta Seguro de Cambiar la Cuenta ?', mtconfirmation,[mbYes,MbNo],0)=mrYes then
   begin
   
      DMAF.cdsTrasSel.First;
      while not DMAF.cdsTrasSel.Eof do begin
         if DMAF.cdsTrasSel.FIELDBYNAME('CUENTAID2').AsString='' then
            DMAF.cdsTrasSel.Delete
         else
           DMAF.cdsTrasSel.Next;
      end;

      DMAF.cdsTrasSel.ApplyUpdates( 0 );

      DMAF.cdsTrasSel.First;
      while not DMAF.cdsTrasSel.Eof do begin

         if DMAF.cdsTrasSel.FIELDBYNAME('CUENTAID2').AsString<>'' then
         begin
            xSQL:='Update ACF201 SET CUENTAID='''+DMAF.cdsTrasSel.FIELDBYNAME('CUENTAID2').AsString+''' '
                 +'Where CIAID=''' +DMAF.cdsTrasSel.fIELDbYnAME('CIAID').AsString+''' AND  '
                 +      'ACFID=''' +DMAF.cdsTrasSel.fIELDbYnAME('ACFID').AsString+''' AND  '
                 +      'TACFID='''+DMAF.cdsTrasSel.fIELDbYnAME('TACFID').AsString+''' ';

            DMAF.cdsQry.Close;
            DMAF.cdsQry.DataRequest( xSQL );
            DMAF.cdsQry.Execute;
         end;
         DMAF.cdsTrasSel.Next;
      end;


       DMAF.cdsTrasSel.First;
      while not DMAF.cdsTrasSel.Eof do begin

         if DMAF.cdsTrasSel.FIELDBYNAME('CUENTAID2').AsString='  ' then
         begin
            xSQL:='Update ACF201 SET CUENTAID='''+DMAF.cdsTrasSel.FIELDBYNAME('CUENTAID').AsString+''' '
                 +'Where CIAID=''' +DMAF.cdsTrasSel.fIELDbYnAME('CIAID').AsString+''' AND  '
                 +      'ACFID=''' +DMAF.cdsTrasSel.fIELDbYnAME('ACFID').AsString+''' AND  '
                 +      'TACFID='''+DMAF.cdsTrasSel.fIELDbYnAME('TACFID').AsString+''' ';

            DMAF.cdsQry.Close;
            DMAF.cdsQry.DataRequest( xSQL );
            DMAF.cdsQry.Execute;
         end;
         DMAF.cdsTrasSel.Next;
      end;


   end;
end;

procedure TFReclasifica.bbtnBorraClick(Sender: TObject);
begin
  inherited;
 Close;
end;

end.
