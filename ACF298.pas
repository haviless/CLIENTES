unit ACF298;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ACF294, ppDB, ppDBPipe, ppBands, ppCache, ppClass, ppComm, ppRelatv,
  ppProd, ppReport, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  wwdbdatetimepicker, StdCtrls, wwdblook, Buttons, Wwdbdlg, ExtCtrls, db,
  DBClient, wwClient, ComCtrls,oaCONTABILIZA;

type
  TFAjusteAnual = class(TFContaREI)
    pb1: TProgressBar;
    z2bbtnContabilizar: TBitBtn;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Z2bbtnPreviewClick(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnContabilizarClick(Sender: TObject);
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
    procedure GrabaPrevio2;
    procedure InsertaConta;
  public
    { Public declarations }
  end;

var
  FAjusteAnual: TFAjusteAnual;

implementation

uses ACFDM, oaAF3000, ACF292;

{$R *.DFM}
//{$I OPER.PAS}

procedure TFAjusteAnual.dblcCiaExit(Sender: TObject);
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

procedure TFAjusteAnual.bbtnOkClick(Sender: TObject);
var
   xSQL  : String;
   xWhere: String;
   xAAMM,FCONTA : String;
begin

   if edtCiaDes.text='' then begin
      dblcCia.SetFocus;
      ShowMessage( 'Error :  Falta Compañía' );
   end;

   if Length(dblcdPeriodo.text)<6 then begin
      dblcdPeriodo.SetFocus;
      ShowMessage( 'Error :  Periodo Errado' );
   end;


   xAAMM := IntToStr( StrtoInt(Copy(dblcdPeriodo.Text,1,4))-1 )+'12';

   if (SRV_D = 'DB2NT') OR (SRV_D = 'DB2400') then
   begin
{   xSQL:='Select A.CIAID, A.ACFID, A.TACFID,A.ACFDES, A.CUENTAID, '
        +  'MAX( A.DEPVALHIST) VALORHIS, '
        +  'ROUND(SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)),2) AJUSTE, '
        +  'MAX( A.DEPVALHIST) + ROUND(SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)),2) VALORAJU, '
        +  'ROUND(SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)),2) DEPAJU '
        +'From ACF204 A, ACF204 D '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+xAAMM+''' AND '
        +      ' A.DEPVALHIST>0 AND '
        +    '( D.CIAID =A.CIAID AND D.ACFID=A.ACFID AND D.TACFID=A.TACFID AND '
        +      'D.ACFREFOR=''00'' AND A.CUENTAID=D.CUENTAID) '
        +'GROUP BY A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID';}

    XSQL:='SELECT A.CUENTAID,A.CCOSID, '
         +  'COALESCE( DEPVALAJUS,0)-COALESCE( DEPVALHIST,0) AJUSTE, '
         +  'COALESCE( DEPIMPAJUS,0)-COALESCE( DEPIMPHIST,0) DEPAJU, '
         +  'DEPVALHIST VALORHIS FROM ACF204 A'
          +' WHERE CIAID='''+dblcCia.text+''' and FAPERIODO='''+xAAMM+''' AND '
          +    ' DEPVALHIST>0 '
          +' ORDER BY A.CUENTAID, A.CCOSID ';
   end;

{
   If (SRV_D = 'DB2400') then
   Begin
   xSQL:='SELECT B.CIAID, B.TACFID, B.CUENTAID , B.CCOSID,SUM(B.VALORHIS) VALORHIS,SUM(B.AJUSTE) AJUSTE, '
        +' SUM(B.VALORAJU) VALORAJU, SUM(B.DEPAJU) DEPAJU  FROM '

        +'( Select A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID, A '
        +  'MAX( A.DEPVALHIST) VALORHIS, '
        + ' case when (dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) )*power(10,2),15,2)-int(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) ),15,2)+1/power(10,2) else dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) ),15,2) end AJUSTE, '


        +  'MAX( A.DEPVALHIST) + '
        + ' case when (dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) )*power(10,2),15,2)-int(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) ),15,2)+1/power(10,2) else dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) ),15,2) end VALORAJU, '

        + ' case when (dec(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) )*power(10,2),15,2)-int(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) ),15,2)+1/power(10,2) else dec(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) ),15,2) end DEPAJU '

        +'From ACF204 A, ACF204 D '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+xAAMM+''' AND '
        +      ' A.DEPVALHIST>0 AND '
        +    '( D.CIAID =A.CIAID AND D.ACFID=A.ACFID AND D.TACFID=A.TACFID AND '
        +      'D.ACFREFOR=''00'' AND A.CUENTAID=D.CUENTAID) '
        +'GROUP BY A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID, A.CCOSID '
        +'HAVING SUM( COALESCE(D.ACFVNUEVO,0) )=0 '

        +' ) B '
        +' GROUP BY B.CIAID, B.TACFID, B.CUENTAID ,B.CCOSID ';
   End;
}


{ 25/02/2002  CAMBIADO
   If (SRV_D = 'DB2400') then
   Begin
   xSQL:='Select A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID, '
        +  'MAX( A.DEPVALHIST) VALORHIS, '
        + ' case when (dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) )*power(10,2),15,2)-int(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) ),15,2)+1/power(10,2) else dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) ),15,2) end AJUSTE, '


        +  'MAX( A.DEPVALHIST) + '
        + ' case when (dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) )*power(10,2),15,2)-int(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) ),15,2)+1/power(10,2) else dec(( SUM(COALESCE(D.DEPVALAJUS,0)-COALESCE(D.DEPVALHIST,0)) ),15,2) end VALORAJU, '

        + ' case when (dec(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) )*power(10,2),15,2)-int(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) )*power(10,2)))*10>=5 '
        + ' then dec(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) ),15,2)+1/power(10,2) else dec(( SUM(COALESCE(D.DEPIMPAJUS,0)-COALESCE(D.DEPIMPHIST,0)) ),15,2) end DEPAJU '

        +'From ACF204 A, ACF204 D '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+xAAMM+''' AND '
        +      ' A.DEPVALHIST>0 AND '
        +    '( D.CIAID =A.CIAID AND D.ACFID=A.ACFID AND D.TACFID=A.TACFID AND '
        +      'D.ACFREFOR=''00'' AND A.CUENTAID=D.CUENTAID) '
        +'GROUP BY A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID '
        +'HAVING SUM( COALESCE(D.ACFVNUEVO,0) )=0 '
        +' ORDER BY A.ACFID ' ;

   End;
  }
   if (SRV_D = 'ORACLE') then
   begin
   {xSQL:='Select A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID, '
        +  'MAX( A.DEPVALHIST) VALORHIS, '
        +  'ROUND(SUM(NVL(D.DEPVALAJUS,0)-NVL(D.DEPVALHIST,0)),2) AJUSTE, '
        +  'MAX( A.DEPVALHIST) + ROUND(SUM(NVL(D.DEPVALAJUS,0)-NVL(D.DEPVALHIST,0)),2) VALORAJU, '
        +  'ROUND(SUM(NVL(D.DEPIMPAJUS,0)-NVL(D.DEPIMPHIST,0)),2) DEPAJU '
        +'From ACF204 A, ACF204 D '
        +'Where A.CIAID='''+dblcCia.text+''' and A.FAPERIODO='''+xAAMM+''' AND '
        +      ' A.DEPVALHIST>0 AND '
        +    '( D.CIAID =A.CIAID AND D.ACFID=A.ACFID AND D.TACFID=A.TACFID AND '
        +      'D.ACFREFOR=''00'' AND A.CUENTAID=D.CUENTAID) '
        +'GROUP BY A.CIAID, A.ACFID, A.TACFID, A.ACFDES, A.CUENTAID'
        +' ORDER BY A.ACFID ' ;
    }

     XSQL:='SELECT A.CUENTAID,A.CCOSID,A.AJUSTE,A.DEPAJU,B.VALORHIS FROM '
          +'   (Select CIAID, CUENTAID, CCOSID, '
          +'  SUM(NVL( DEPVALAJUS,0)-COALESCE( DEPVALHIST,0)) AJUSTE, '
          +'  SUM(NVL( DEPIMPAJUS,0)-COALESCE( DEPIMPHIST,0)) DEPAJU '
          +' From ACF204 '
          +' WHERE CIAID='''+dblcCia.text+''' and SUBSTR(FAPERIODO,1,4)='''+COPY(xAAMM,1,4)+''' AND '
          +' DEPVALHIST>0 GROUP BY CIAID,CUENTAID,CCOSID) A, '
          +'  ( Select  CIAID, CUENTAID, CCOSID, '
          +'  SUM(DEPVALHIST) VALORHIS '
          +'  From ACF204  Where CIAID='''+dblcCia.text+''' and FAPERIODO='''+xAAMM+''' AND '
          +' DEPVALHIST>0    GROUP BY CIAID,CUENTAID,CCOSID ) B '
          +' WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND A.CCOSID=B.CCOSID ' ;

   end;

   dbgConta.DataSource:=nil;
   DMAF.cdsTrasSel.Close;
   DMAF.cdsTrasSel.DataRequest( xSQL );
   DMAF.cdsTrasSel.Open;


   dbgConta.Selected.Clear;
   dbgConta.Selected.Add('TACFID'#9'7'#9'Tipo~Activo'#9'F');
   dbgConta.Selected.Add('ACFID'#9'8'#9'Activo~Id.'#9'F');
   dbgConta.Selected.Add('ACFDES'#9'30'#9'Activo Fijo'#9'F');
   dbgConta.Selected.Add('CUENTAID'#9'17'#9'Cuenta~Contable'#9'F');
   dbgConta.Selected.Add('VALORHIS'#9'14'#9'Valor~Historico'#9'F');
   dbgConta.Selected.Add('AJUSTE'#9'14'#9'Valor~Ajuste'#9'F');
   dbgConta.Selected.Add('CCOSID'#9'14'#9'Centro~Costo'#9'F');

 //  dbgConta.Selected.Add('VALORAJU'#9'14'#9'Valor~Nuevo'#9'F');
   dbgConta.Selected.Add('DEPAJU'#9'14'#9'Deprec.~Ajuste'#9'F');

   dbgConta.DataSource:=DMAF.dsTrasSel;

   TNumericField( DMAF.cdsTrasSel.FieldByName('VALORHIS') ).DisplayFormat:='###,###,##0.00';
   TNumericField( DMAF.cdsTrasSel.FieldByName('AJUSTE') ).DisplayFormat:='###,###,##0.00';
  // TNumericField( DMAF.cdsTrasSel.FieldByName('VALORAJU') ).DisplayFormat:='###,###,##0.00';

   dbgConta.ColumnByName('VALORHIS').FooterValue:=FLOATTOSTRF( DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(VALORHIS)', ''),ffNumber,15,2 );
   dbgConta.ColumnByName('AJUSTE').FooterValue  :=FLOATTOSTRF( DMAF.OperClientDataset(DMAF.cdsTrasSel, 'SUM(AJUSTE)', ''),ffNumber,15,2 );
 //  dbgConta.ColumnByName('VALORAJU').FooterValue:=FLOATTOSTRF( OperClientDataset(DMAF.cdsTrasSel, 'SUM(VALORAJU)', ''),ffNumber,15,2 );

   Z2bbtnContab.Enabled:=True;

   xWhere:='FAPERIODO='''+dblcdPeriodo.TEXT+'''';
   FCONTA :=DMAF.DisplayDescrip('dspTGE','ACF102','*',xWhere,'FLANUAL');
   {  REVISAR VHN
   IF FCONTA='S' THEN
   Begin
      lblCNT.visible:=true;
      DMAF.cdsQry.close;
           xSQL:='SELECT * FROM ACF306 '
           +'WHERE CIAID='''   +dblcCia.text     +''' and '
           +      'CNTANOMM='''+dblcdPeriodo.Text+''' and '
           +      'CNTLOTE=''AJUS'' ';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
      DMAF.cdsQry.Open;

      dblcTDiario.text:=DMAF.cdsQry.FieldByname('TDIARID').AsString;
      dtpFComp.Date   :=DMAF.cdsQry.FieldByname('CNTFCOMP').Value;
      meNoReg.text    :=DMAF.cdsQry.FieldByname('CNTCOMPROB').AsString;
      dbeCambio.text  :=DMAF.cdsQry.FieldByname('CNTTCAMBIO').AsString;
      xWhere:='TDIARID='''+DMAF.cdsQry.FieldByname('TDIARID').AsString+'''';
      edtTDiario.Text :=DMAF.DisplayDescrip('dspTGE','TGE104','*',xWhere,'TDIARDES');
      Z2bbtnContab.Enabled:=false;
   End;
   }
end;

procedure TFAjusteAnual.FormActivate(Sender: TObject);
var
xwhere,xsql:string;
begin

   wSQL:='SELECT * FROM ACF306 '
        +'WHERE CNTANOMM=''AAAAMM'' ';
   DMAF.cdsACFCont.Close;
   DMAF.cdsACFCont.DataRequest(wSQL);
   DMAF.cdsACFCont.Open;

   wSQL:='SELECT FAPERIODO, FLANUAL FROM ACF102 '
        +'WHERE SUBSTR(FAPERIODO,5,2)=''01'' '
        +'ORDER BY FAPERIODO' ;
   DMAF.cdsTrasPen.Close;
   DMAF.cdsTrasPen.DataRequest(wSQL);
   DMAF.cdsTrasPen.Open;
end;

procedure TFAjusteAnual.GrabaPrevio;
var
   xSQL    : String;
   xCtaAju : String;
   xCtaDep : String;
   xCtaDeA : String;
   xWhere  : String;
   xCont   : Integer;
   xAAMM   : String;


begin

   xWhere := 'TMonId='+''''+DMAF.wTMonExt+''''+' and '
           + 'Fecha='+DMAF.wRepFuncDate+''''+ FORMATDATETIME(DMAF.wFormatFecha,dtpFComp.Date)+''')';
   if length( DMAF.DisplayDescrip('dspTGE','TGE107','*',xWhere,'TMONID'))>0 then
      dbeCambio.Text:=FloattoStr(DMAF.cdsQry.fieldbyname('TCam'+DMAF.wVRN_TipoCambio).AsFloat)
   else begin
      dbeCambio.Text:='0';
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

   xAAMM := IntToStr( StrtoInt(Copy(dblcdPeriodo.Text,1,4))-1 )+'12';


   xCNTReg:=0;

   xSQL:='SELECT * FROM ACF110';
   DMAF.cdsQry2.Close;
   DMAF.cdsQry2.DataRequest( xSQL );
   DMAF.cdsQry2.Open;
   DMAF.cdsQry2.IndexFieldNames:='CUENTAID';

   pb1.Max:=DMAF.cdsTrasSel.RecordCount;
   pb1.Position:=0;
   xCont:=0;

   DMAF.cdsTrasSel.First;
   while not DMAF.cdsTrasSel.Eof do begin

      xCtaAju:='Error';
      xCtaDeA:='Error';
      xCtaDep:='Error';

      DMAF.cdsQry2.SetKey;
      DMAF.cdsQry2.FieldbYname('Cuentaid').AsString:=DMAF.cdsTrasSel.FieldByName('CUENTAID').aSsTRING;
      if DMAF.cdsQry2.Gotokey then begin
         xCtaAju:=DMAF.cdsQry2.FieldByname('REIAJUSTE').AsString;
         xCtaDeA:=DMAF.cdsQry2.FieldByname('REIDEPRE').AsString;
         xCtaDep:=DMAF.cdsQry2.FieldByname('CTADEPAC').AsString;
      end;

      // Reclasifica Activo
//      if DMAF.cdsTrasSel.FieldByName('AJUSTE').AsFloat>0 then begin
         xMONTO:=DMAF.cdsTrasSel.FieldByName('AJUSTE').AsFloat;
         xDH    :='D';
         xCuenta1:=DMAF.cdsTrasSel.FieldByname('CUENTAID').AsString;
         xCuenta2:=xCtaAju;
         InsertaConta;
    //  end;

      // Asiento de Ajuste
  //    if DMAF.cdsTrasSel.FieldByName('DEPAJU').AsFloat>0 then begin
         xMONTO :=DMAF.cdsTrasSel.FieldByName('DEPAJU').AsFloat;
         xDH    :='D';

         xCuenta1:=xCtaDeA;
         xCuenta2:=xCtaDep;
         InsertaConta;
     // end;


      xCont:=xCont+1;
      if xCont>=100 then begin
         DMAF.cdsACFCont.ApplyUpdates( 0 );
         xCont:=0;
      end;
      pb1.Position:=pb1.Position+1;

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
         +      'ACF306.CNTLOTE=''AJUS'' )';
   DMAF.CDSQRY.CLOSE;
   DMAF.CDSQRY.DATAREQUEST(wsql);
   DMAF.CDSQRY.EXECUTE;

   DMAF.CDSQRY.CLOSE;

   WSQL:='SELECT * FROM CNT311 WHERE '
         +'      CIAID='''     + dblcCia.text      +''' and '
         +      'CNTANOMM='''  + dblcdPeriodo.Text +''' and '
         +      'TDIARID='''   + dblcTDiario.Text  +''' and '
         +      'CNTCOMPROB='''+ meNoreg.Text      +''' and '
         +      'CNTLOTE=''AJUS'' ';
   DMAF.cdsCNT311.Close;
   DMAF.cdsCNT311.DataRequest(WSQL);
   DMAF.cdsCNT311.Open;

end;



procedure TFAjusteAnual.GrabaPrevio2;
var
   xSQL    : String;
   xCtaAju : String;
   xCtaDep : String;
   xCtaDeA : String;
   xWhere  : String;
   xAAMM   : String;
   xCont   : Integer;
begin

   xAAMM := IntToStr( StrtoInt(Copy(dblcdPeriodo.Text,1,4))-1 )+'12';

   XSQL:=' UPDATE ACF204 SET ACFVNUEVO=COALESCE(DEPVALAJUS,0), '
         +'  ACFVDEPRE=COALESCE(DEPACUAJUS,0) '
         + ' where CIAID ='''+dblcCia.text+''' and FAPERIODO='''+xAAMM+'''  ';

   DMAF.cdsRevaDet.Close;
   DMAF.cdsRevaDet.DataRequest( xSQL );
   DMAF.cdsRevaDet.Execute;
end;


procedure TFAjusteAnual.InsertaConta;
var
   xTCam : Double;
begin

   DMAF.cdsACFCont.Insert;
   DMAF.cdsACFCont.FieldByName('CIAID').Value     :=dblcCia.Text;
   DMAF.cdsACFCont.FieldByName('TDIARID').Value   :=dblcTDiario.Text;
   DMAF.cdsACFCont.FieldByName('CNTCOMPROB').Value:=meNoreg.Text;
   DMAF.cdsACFCont.FieldByName('CNTANOMM').Value  :=dblcdPeriodo.text;
   DMAF.cdsACFCont.FieldByName('CNTFCOMP').Value  :=dtpFComp.Date;

   DMAF.cdsACFCont.FieldByName('CUENTAID').Value  :=xCuenta1;
   DMAF.cdsACFCont.FieldByName('CNTGLOSA').Value  :='Ajuste Anual de Activos Periodo '+dblcdPeriodo.Text;
   DMAF.cdsACFCont.FieldByName('CNTDH').Value     :=xDH;
   DMAF.cdsACFCont.FieldByName('TMONID').Value    :=DMAF.wTMonLoc;
   DMAF.cdsACFCont.FieldByName('CNTTCAMBIO').Value:=StrToFloat( dbeCambio.Text );
   DMAF.cdsACFCont.FieldByName('CAMPOVAR').Value  :=' ';  //DMAF.cdsTrasSel.FieldByname('TACFID').AsString;
   DMAF.cdsACFCont.FieldByName('CNTLOTE').Value   :='AJUS';

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

   DMAF.cdsACFCont.FieldByName('CUENTAID').Value  :=xCuenta2;
   DMAF.cdsACFCont.FieldByName('CNTGLOSA').Value  :='Ajuste Anual de Activos Periodo '+dblcdPeriodo.Text;
   DMAF.cdsACFCont.FieldByName('TMONID').Value    :=DMAF.wTMonLoc;
   DMAF.cdsACFCont.FieldByName('CNTTCAMBIO').Value:=StrToFloat( dbeCambio.Text );
   DMAF.cdsACFCont.FieldByName('CAMPOVAR').Value  :=' ';  //DMAF.cdsTrasSel.FieldByname('TACFID').AsString;
   DMAF.cdsACFCont.FieldByName('CNTLOTE').Value   :='AJUS';

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



procedure TFAjusteAnual.Z2bbtnPreviewClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
   xSQL : String;
begin

   if length(dblcTDiario.text)=0 then
   Begin
      dblcTDiario.SetFocus;
      Raise Exception.Create('Error : Tipo de Diario no Valida');
   End;

   if length(dtpFComp.text)=0 then
   Begin
      dtpFComp.SetFocus;
      Raise Exception.Create('Error : Ingrese la Fecha del Comprobante');
   End;

   if length(dtpFComp.text)=0 then
   Begin
      dbeCambio.SetFocus;
      Raise Exception.Create('Error : Ingrese el Tipo de Cambio');
   End;

   IF DMAF.cdsTrasPen.FieldByname('FLANUAL').AsString<>'S' THEN
    begin
      grabaprevio;
      if SOLConta(dblcCia.text,
                       dblcTDiario.Text,
                       dblcdPeriodo.Text,
                       meNoreg.Text,
                       SRV_D, 'P', DMAF.wModulo, DMAF.cdsCNT311, DMAF.cdsNivel,
                       DMAF.cdsResultSet, DMAF.DCOM1, Self ) then

   end;


      //GrabaPrevio;

   with Comprobante do begin
      CIAID    := dblcCia.Text ;
      TDIARID  := dblcTDiario.Text ;
      CiaDes   := edtCiaDes.Text;
      Diario   := edtTDiario.Text ;
      Proveedor:= '';
      Glosa    := 'Ajuste Anual de Activos Periodo '+dblcdPeriodo.Text;
      Lote     := 'AJUS';
      TipoDoc  := '';
      TipoCamb := dbeCambio.Text;
      Periodo  := dblcdPeriodo.Text ;
      NoComp   := meNoReg.Text ;
      NoDoc    := '';
      Cuenta   := '';
      Banco    := '';
      NumChq   := '';
      Moneda   := 'Soles';
      Importe  := '';
      Tmoneda  := 'L';
   end;

   FVoucherImp:=TFVoucherImp.Create(Self);      // ACF292
   FVoucherImp.wBienedeForma := 'EGRESO';
   FVoucherImp.wComprobanteI:=Comprobante;
   with FVoucherImp do
   Try
      ShowModal;
   Finally

      if DMAF.cdsTrasPen.FieldByname('FLANUAL').AsString<>'S' then
      begin

         if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         begin
            xSQL:='DELETE FROM ACF306 '
                 +' Where ACF306.CIAID='''    + dblcCia.text      +''' and '
                 +       'ACF306.CNTANOMM='''  + dblcdPeriodo.Text +''' and '
                 +       'ACF306.TDIARID='''   + dblcTDiario.Text  +''' and '
                 +       'ACF306.CNTCOMPROB='''+ meNoreg.Text      +''' ';
         end;
        if (SRV_D = 'ORACLE') then
         begin
            xSQL:='DELETE FROM ACF306 '
                 +' Where ACF306.CIAID='''    + dblcCia.text      +''' and '
                 +       'ACF306.CNTANOMM='''  + dblcdPeriodo.Text +''' and '
                 +       'ACF306.TDIARID='''   + dblcTDiario.Text  +''' and '
                 +       'ACF306.CNTCOMPROB='''+ meNoreg.Text      +''' ';
         end;
         DMAF.cdsQry.Close;
         DMAF.cdsQry.DataRequest( xSQL );
         try
            DMAF.cdsQry.Execute;
         except
         end;
      end;

      Free;
   End;

   pb1.Position:=0;

end;

procedure TFAjusteAnual.Z2bbtnContabClick(Sender: TObject);
var
  xwhere,flag:string;
begin

   GrabaPrevio2;

   z2bbtnContabilizar.enabled:=true;
   
   ShowMessage('Ajuste Anual Realizado');

end;

procedure TFAjusteAnual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DMAF.cdsTrasPen.Filtered:=False;
   DMAF.cdsTrasPen.Filter  :='';
   DMAF.cdsTrasPen.Close; DMAF.cdsTDiario.Close;

   Action:=caFree;
end;

procedure TFAjusteAnual.z2bbtnContabilizarClick(Sender: TObject);
var
   xwhere, flag, xAAMM, xSQL :string;
begin

   xWhere:='FAPERIODO='''+dblcdPeriodo.TEXT+'''';
   flag :=DMAF.DisplayDescrip('dspTGE','ACF102','*',xWhere,'FLANUAL');

   if FLAG='S' then
   begin
     Showmessage('El Periodo '''+dblcdPeriodo.TEXT+''' ya ha sido Contabilizado');
     Exit;
   end;

   xAAMM := IntToStr( StrtoInt(Copy(dblcdPeriodo.Text,1,4))-1 )+'12';

   xSQL:='Select sum( coalesce(ACFVNUEVO,0) ) TOTAL FROM ACF204 A '
        +'Where CIAID ='''+dblcCia.text+''' and FAPERIODO='''+xAAMM+''' and DEPVALHIST>0 '
        +'GROUP BY CIAID ';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   DMAF.cdsQry.Open;

   if DMAF.cdsQry.FieldByName( 'TOTAL' ).AsFloat=0 then
      Raise Exception.Create('Error : No se Puede Contabilizar. Falta Hacer Ajuste Anual');

   if length(dblcTDiario.text)=0 then
   begin
      dblcTDiario.SetFocus;
      Raise Exception.Create('Error : Tipo de Diario no Valida');
   end;

   if length(dtpFComp.text)=0 then
   begin
      dtpFComp.SetFocus;
      Raise Exception.Create('Error : Ingrese la Fecha del Comprobante');
   end;

   if length(dtpFComp.text)=0 then
   begin
      dbeCambio.SetFocus;
      Raise Exception.Create('Error : Ingrese el Tipo de Cambio');
   end;

   if MessageDlg('¿ Esta Seguro de Contabilizar ?', mtconfirmation,[mbYes,MbNo],0)=mrYes then
   begin
      grabaprevio;

      if SOLConta(dblcCia.text,
                  dblcTDiario.Text,
                  dblcdPeriodo.Text,
                  meNoreg.Text,
                  SRV_D, 'C', DMAF.wModulo, DMAF.cdsCNT311, DMAF.cdsNivel,
                  DMAF.cdsResultSet, DMAF.DCOM1, Self ) then

      DMAF.cdsTrasPen.Edit;
      DMAF.cdsTrasPen.FieldByname('FLANUAL').AsString:='S';

      wSQL:='UPDATE ACF102 SET FLANUAL=''S'' '
           +'WHERE FAPERIODO='''+dblcdPeriodo.Text+'''';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(WSQL); // Llamada remota al provider del servidor
      DMAF.cdsQry.Execute;
      ShowMessage('Contabilizado OK');
   end;
end;
procedure TFAjusteAnual.bbtnBorraClick(Sender: TObject);
begin
  inherited;
   Close;
end;

end.
