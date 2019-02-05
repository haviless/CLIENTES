unit ACF293;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, Wwdbdlg, Buttons, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppCache, ppDB, ppDBPipe, ppBands, ppPrnabl, ppCtrls, Mask,
  wwdbedit, Wwdbspin, Grids, Wwdbigrd, Wwdbgrid;

type
  TFTProveedor = class(TForm)
    Label50: TLabel;
    dblcdProveedor: TwwDBLookupComboDlg;
    edtProveedorDes: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    PDReporte: TppDBPipeline;
    ppReporte: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    bbtnBorra: TBitBtn;
    Periodo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    spemes: TwwDBSpinEdit;
    speano: TwwDBSpinEdit;
    gbperiodo: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure dblcdProveedorExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnBorraClick(Sender: TObject);
    procedure dblcdProveedorChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure spemesChange(Sender: TObject);
    procedure speanoChange(Sender: TObject);
  private
    { Private declarations }
    xVoucherRTM : String;
  public
    { Public declarations }
  end;

var
  FTProveedor: TFTProveedor;
  fwhere1,fwhere2:string;
implementation

uses ACFDM;

{$R *.DFM}

procedure TFTProveedor.dblcdProveedorExit(Sender: TObject);
var
xcondicion:string;
begin
   xCondicion := 'Prov='+''''+dblcdProveedor.Text+'''';
//   edtProveedorDes.Text:=DM1.DisplayDescrip('dspTGE','TGE201','*',xCondicion,'ProvAbr');
   edtProveedorDes.Text:=BuscaDescripcion( DMAF.cdsProvee, xCondicion, 'ProvAbr');

end;

procedure TFTProveedor.SpeedButton1Click(Sender: TObject);
var
XSQL,trafechadev,fechatraslado,acfid,Codigoresponsable:string;
nivel:integer;
activo,responsable,xwhere,ultimo,tipoactivo:string;

begin

  IF LENGTH(fwhere1)=0 then
  begin
    gbperiodo.SetFocus;
    Raise Exception.Create('Debe seleccionar el Tipo de Búsqueda...')
 end;

 if length(dblcdProveedor.text)=0 then
  begin
    dblcdProveedor.SetFocus;
    Raise Exception.Create('Debe seleccionar el Proveedor...')
 end;

 if length(speano.text)=0 then
  begin
    speano.SetFocus;
    Raise Exception.Create('Debe seleccionar el Año...')
 end;
 if length(spemes.text)=0 then
  begin
    spemes.SetFocus;
    Raise Exception.Create('Debe seleccionar el Mes...')
 end;


  xsql:='DELETE FROM VABLACON ';
  DMAF.cdsQry.Close;
  DMAF.cdsQry.DataRequest(XSQL);
  DMAF.cdsQry.Execute;


  XSQL:='SELECT DISTINCT ACFID,CIAID,F_ULTIMO, TACFID  FROM ACF202 WHERE RECIBEID='''+dblcdProveedor.text+''' ORDER BY ACFID ';

  DMAF.cdsQry2.Close;
  DMAF.cdsQry2.DataRequest(XSQL);
  DMAF.cdsQry2.open;

  DMAF.cdsTDiario.Filtered:=False;
  DMAF.cdsTDiario.Filter  :='';
  DMAF.cdsTDiario.Close;
  DMAF.cdsTDiario.IndexFieldNames:='';

  XSQL:='SELECT * FROM ACF202 WHERE ACFID IN (SELECT DISTINCT ACFID  FROM ACF202 WHERE RECIBEID='''+dblcdProveedor.text
        + '''  ) ORDER BY ACFID,TACFID,TRAORDEN ';
  DMAF.cdsTDiario.Close;
  DMAF.cdsTDiario.DataRequest(XSQL);
  DMAF.cdsTDiario.Open;

  DMAF.cdsTDiario.IndexFieldNames:='CIAID;ACFID;F_ULTIMO';
  DMAF.cdsQry2.IndexFieldNames:='CIAID;ACFID;F_ULTIMO';

  DMAF.cdsQry2.First;
  While not DMAF.cdsQry2.eof do
  begin
    DMAF.cdsTDiario.SetKey;
    DMAF.cdsTDiario.FieldByname('CIAID').Asstring :=DMAF.cdsQry2.FieldByname('CIAID').Asstring;
    DMAF.cdsTDiario.FieldByname('ACFID').Asstring :=DMAF.cdsQry2.FieldByname('ACFID').Asstring;
    ACTIVO:=DMAF.cdsQry2.FieldByname('ACFID').Asstring;
    DMAF.cdsTDiario.FieldByname('F_ULTIMO').Asstring :='S';
    if DMAF.cdsTDiario.Gotokey then
    begin
      tipoactivo:=DMAF.cdsQry2.FieldByname('TACFID').Asstring;

      if DMAF.cdsTDiario.FieldByName('MOTID').asstring='10' then
      begin
         trafechadev:=DMAF.cdsTDiario.fieldbyname('TRAFECHA').asstring;
         nivel:=strtoint(DMAF.cdsTDiario.fieldbyname('TRAORDEN').asstring);
         xwhere:='ACFID='''+DMAF.cdsQry2.FieldByname('ACFID').Asstring+'''  AND TRAORDEN='+inttostr(NIVEL-1)+'';
         fechatraslado:=DMAF.DisplayDescrip('dspTGE','ACF202','TRAFECHA,TRARECIBE,RECIBEID',xWhere,'TRAFECHA');
         Responsable:=DMAF.cdsqry.fieldbyname('TRARECIBE').asstring;
         Codigoresponsable:=DMAF.cdsqry.fieldbyname('RECIBEID').asstring;

         ultimo:='S';
      end
      else
      begin
          nivel:=strtoint(DMAF.cdsTDiario.fieldbyname('TRAORDEN').asstring);
          xwhere:='ACFID='''+DMAF.cdsQry2.FieldByname('ACFID').Asstring+'''  AND TRAORDEN='+inttostr(NIVEL-1)+' AND MOTID=''10''';
          trafechadev:=DMAF.DisplayDescrip('dspTGE','ACF202','TRAFECHA',xWhere,'TRAFECHA');
          If length(trafechadev)<>0 then
          begin
             xwhere:='ACFID='''+DMAF.cdsQry2.FieldByname('ACFID').Asstring+'''  AND TRAORDEN='+inttostr(NIVEL-2)+'';
             fechatraslado:=DMAF.DisplayDescrip('dspTGE','ACF202','TRAFECHA,TRARECIBE,RECIBEID',xWhere,'TRAFECHA');
             Responsable:=DMAF.cdsqry.fieldbyname('TRARECIBE').asstring;
             Codigoresponsable:=DMAF.cdsqry.fieldbyname('RECIBEID').asstring;

             ultimo:='N'
         end;
      end;
    end;
    If (length(trafechadev)<>0) and (length(fechatraslado)<>0)  then
    begin
      xsql:='INSERT INTO VABLACON (CIAID,TRAFECHA,TRARECIBE,F_ULTIMO,FECHADEV,TACFID,ACFID,RECIBEID ) '
            + ' VALUES  ('''+DMAF.cdsTDiario.FieldByname('CIAID').Asstring
            +''','''+formatdatetime('mm/dd/yyyy',strtodatetime(fechatraslado))+''','''+responsable+''','''+ultimo+''','''+formatdatetime('mm/dd/yyyy',strtodatetime(trafechadev))+''','''
            + tipoactivo+''','''+activo+''','''+Codigoresponsable+''') ';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(XSQL);
      DMAF.cdsQry.Execute;
    end;
    DMAF.cdsQry2.Next;
  end;

  DMAF.cdsTDiario.Filtered:=False;
  DMAF.cdsTDiario.Filter  :='';
  DMAF.cdsTDiario.Close;

  if length(spemes.text)=1 then
   spemes.text:=concat('0',spemes.text);

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     XSQL:='SELECT  B.CIAID,A.F_ULTIMO,B.ACFID,B.ACFDES,A.TRAFECHA,A.TRARECIBE, FECHADEV ' // FECHADEV '
           + ' FROM ACF202 A,ACF201 B WHERE  A.ACFID=B.ACFID AND A.TACFID=B.TACFID AND A.F_ULTIMO=''S'''
           +'  AND A.FPROVE=''S'' and A.recibeid='''+dblcdProveedor.text
           +''' and substring(char(A.trafecha),1,7)'+fwhere1 //='''+speano.text+'-'+spemes.text
           +''' UNION '
           +' SELECT  B.CIAID,A.F_ULTIMO,A.ACFID,B.ACFDES,A.TRAFECHA,A.TRARECIBE,  FECHADEV ' //FECHADEV '
           +' FROM VABLACON A,ACF201 B WHERE  A.ACFID=B.ACFID AND A.TACFID=B.TACFID AND '
           +' A.recibeid='''+dblcdProveedor.text
           +''' and substring(char(A.trafecha),1,7)'+fwhere2 //='''+speano.text+'-'+spemes.text+'''';
  end;

  if (SRV_D = 'ORACLE') then
  begin
     XSQL:='SELECT  B.CIAID,A.F_ULTIMO,B.ACFID,B.ACFDES,A.TRAFECHA,A.TRARECIBE, FECHADEV ' // FECHADEV '
           + ' FROM ACF202 A,ACF201 B WHERE  A.ACFID=B.ACFID AND A.TACFID=B.TACFID AND A.F_ULTIMO=''S'''
           + '  AND A.FPROVE=''S'' and A.trarecibe='''+edtProveedorDes.text
           + ''' and  to_char(A.TRAFECHA,''YYYY'')||''-''||to_char(A.TRAFECHA,''MM'')='''
           + speano.text   +'-'+spemes.text+ ''''''
           + ' UNION '
           + ' SELECT  B.CIAID,A.F_ULTIMO,A.ACFID,B.ACFDES,A.TRAFECHA,A.TRARECIBE,  FECHADEV ' //FECHADEV '
           + ' FROM VABLACON A,ACF201 B WHERE  A.ACFID=B.ACFID AND A.TACFID=B.TACFID AND '
           + ' A.trarecibe='''+edtProveedorDes.text
           + ''' and  to_char(A.TRAFECHA,''YYYY'')||''-''||to_char(A.TRAFECHA,''MM'')='''+speano.text+'-'+spemes.text+'''';
  end;
  DMAF.cdsQry.Close;
  DMAF.cdsQry.DataRequest(XSQL);
  DMAF.cdsQry.Open;

  if DMAF.cdsQry.recordcount=0 then
    showmessage('No Existen Registros para la Consulta');

  xVoucherRTM:=ExtractFilePath( application.ExeName ) +'ACF\DEMA\ACFListaDev.RTM';
  ppreporte.Template.FileName := xVoucherRTM;
  ppreporte.Template.LoadFromFile;
  ppreporte.Print;

 end;

procedure TFTProveedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
   begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0 );
   end;
end;

procedure TFTProveedor.bbtnBorraClick(Sender: TObject);
begin
  DMAF.cdsQry.close;
  DMAF.cdsQry2.close;
  DMAF.cdsTDiario.Close;
  close;
end;

procedure TFTProveedor.dblcdProveedorChange(Sender: TObject);
var
xcondicion:string;
begin
  xCondicion := 'Prov='+''''+dblcdProveedor.Text+'''';
//   edtProveedorDes.Text:=DMAF.DisplayDescrip('dspTGE','TGE201','*',xCondicion,'ProvAbr');
   edtProveedorDes.Text:=BuscaDescripcion( DMAF.cdsProvee, xCondicion, 'PROVDES');
end;

procedure TFTProveedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   DMAF.cdstdiario.Filtered:=False;
   DMAF.cdstdiario.Filter  :='';
   DMAF.cdstdiario.Close;
   DMAF.cdstdiario.IndexFieldNames:='';
end;

procedure TFTProveedor.RadioButton1Click(Sender: TObject);
begin
 if RadioButton1.Checked=true then
 begin

   fwhere1:='';
   fwhere2:='';
   if length(spemes.text)=1 then
      spemes.text:=concat('0',spemes.text);

   if length(spemes.text)=2 then
      spemes.text:=spemes.text;

   fwhere1:='='''+speano.text+'-'+spemes.text;
   fwhere2:='='''+speano.text+'-'+spemes.text+'''';
 end;
end;

procedure TFTProveedor.RadioButton2Click(Sender: TObject);
begin
 if RadioButton2.Checked=true then
 begin
   fwhere1:='';
   fwhere2:='';

   if length(spemes.text)=1 then
      spemes.text:=concat('0',spemes.text);

   if length(spemes.text)=2 then
      spemes.text:=spemes.text;

   fwhere1:='<='''+speano.text+'-'+spemes.text;
   fwhere2:='<='''+speano.text+'-'+spemes.text+'''';
 end;

end;

procedure TFTProveedor.spemesChange(Sender: TObject);
begin
  RadioButton1.Checked:=false;
  RadioButton2.Checked:=false;
end;

procedure TFTProveedor.speanoChange(Sender: TObject);
begin
  RadioButton1.Checked:=false;
  RadioButton2.Checked:=false;

end;

end.
