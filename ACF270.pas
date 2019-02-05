unit ACF270;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdblook, Wwdbdlg, DBCtrls, StdCtrls, Mask, wwdbedit, Buttons, ExtCtrls,
  wwdbdatetimepicker;

type
  TFRevaluacion = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbeActivoDes: TwwDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    gbDatos: TGroupBox;
    dbeTACFDes: TwwDBEdit;
    Panel4: TPanel;
    Label9: TLabel;
    dbeMarca: TwwDBEdit;
    dbeModelo: TwwDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    dbeSerie: TwwDBEdit;
    Label34: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCiaDes: TEdit;
    Bevel1: TBevel;
    dblcdTActivo: TwwDBLookupComboDlg;
    dblcdActivo: TwwDBLookupComboDlg;
    dbeBarras: TwwDBEdit;
    Label2: TLabel;
    bbtnBusca: TBitBtn;
    Label55: TLabel;
    dblcMoneda: TwwDBLookupCombo;
    edtMonedaDes: TEdit;
    Label62: TLabel;
    dbeValOMO: TwwDBEdit;
    Label63: TLabel;
    dbeValOMN: TwwDBEdit;
    Label64: TLabel;
    dbeValOME: TwwDBEdit;
    Label3: TLabel;
    dbeVNeto: TwwDBEdit;
    Z2bbtnOk: TBitBtn;
    Label1: TLabel;
    dbeImporte: TwwDBEdit;
    Label40: TLabel;
    dtpFecAdq: TwwDBDateTimePicker;
    Label4: TLabel;
    dbeValHis: TwwDBEdit;
    Label5: TLabel;
    dbeDepAcu: TwwDBEdit;
    procedure Z2bbtnOkClick(Sender: TObject);
    procedure Z2bbtnNoOkClick(Sender: TObject);
    procedure Z2bbtnCambioClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnBuscaClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcdTActivoExit(Sender: TObject);
    procedure dblcMonedaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    xWhere : string;
    procedure InicializaDatos;
    procedure MuestraDescripcion;
    procedure GrabaDetalle;
    procedure MuestraDatos;
  public
    { Public declarations }
  end;

var
  FRevaluacion: TFRevaluacion;

implementation

Uses ACFDM;

{$R *.DFM}

procedure TFRevaluacion.Z2bbtnOkClick(Sender: TObject);
begin
   //SAR666 se reemplaza la declaración DMAF por DMAF en todo el archivo
   //
   DMAF.cdsRevaDet.Edit;
   DMAF.cdsRevaDet.FieldByName('CIAID').Value     :=dblcCia.Text;
   DMAF.cdsRevaDet.FieldByName('REVALNUM').Value     :=DMAF.cdsReva.FieldByname('REVALNUM').AsString;
   DMAF.cdsRevaDet.FieldByName('REVALFEC').Value  :=DMAF.cdsReva.FieldByname('REVALFEC').Value;
//   DMAF.cdsRevaDet.FieldB]yName('REVALAAMM').Value :=DMAF.cdsReva.FieldByname('REVALAAMM').AsString;
   DMAF.cdsRevaDet.FieldByName('TACFID').Value    :=dblcdTActivo.Text;
   DMAF.cdsRevaDet.FieldByName('ACFID').Value     :=dblcdActivo.Text;
   DMAF.cdsRevaDet.FieldByName('ACFDES').Value    :=dbeActivoDes.Text;
   DMAF.cdsRevaDet.FieldByName('ACFMARCA').Value  :=dbeMarca.Text;
   DMAF.cdsRevaDet.FieldByName('ACFMODELO').Value :=dbeModelo.Text;
   DMAF.cdsRevaDet.FieldByName('ACFSERIE').Value  :=dbeSerie.Text;
   DMAF.cdsRevaDet.FieldByName('ACFFECADQ').Value :=dtpFecAdq.Date;
   DMAF.cdsRevaDet.FieldByName('TMONID').Value    :=dblcMoneda.Text;
   DMAF.cdsRevaDet.FieldByName('ACFVALOMO').Value :=StrToFloat(dbeValoMO.Text);
   DMAF.cdsRevaDet.FieldByName('ACFVALOMN').Value :=StrToFloat(dbeValoMN.Text);
   if dbeValoME.Text='' then
      DMAF.cdsRevaDet.FieldByName('ACFVALOME').Value:=0
   else
      DMAF.cdsRevaDet.FieldByName('ACFVALOME').Value:=StrToFloat(dbeValoME.Text);

   DMAF.cdsRevaDet.FieldByName('DEPVALAJUS').Value:=dbeValHis.Text;
   DMAF.cdsRevaDet.FieldByName('DEPACUAJUS').Value:=dbeDepAcu.Text;
   DMAF.cdsRevaDet.FieldByName('DEPNETOAJU').Value:=dbeVNeto.Text;
   DMAF.cdsRevaDet.FieldByName('RAVALIMPO').Value :=dbeImporte.Text;
   cdsPost( DMAF.cdsRevaDet );

   DMAF.cdsRevaDet.ApplyUpdates( 0 );

   ShowMessage('Registro Grabado');
end;

procedure TFRevaluacion.GrabaDetalle;
begin
   if DMAF.cdsInvC.FieldByname('InvEstado').AsString<>'Editado' then begin
      DMAF.cdsInvC.Edit;
      DMAF.cdsInvC.FieldByname('InvEstado').AsString:='Editado';
      DMAF.ControlTran;
   end;

   DMAF.cdsInvD.Edit;
   DMAF.cdsInvD.FieldByname('FReg').Value   :=Date;
   DMAF.cdsInvD.FieldByname('HReg').Value   :=Time;
   DMAF.cdsInvD.FieldByname('Usuario').Value:=DMAF.wUsuario;
   DMAF.ControlTran;
   DMAF.cdsInvD.Next;
   if DMAF.cdsInvD.Eof then Close;
   MuestraDescripcion;
end;

procedure TFRevaluacion.Z2bbtnNoOkClick(Sender: TObject);
begin
   DMAF.cdsInvD.Edit;
   DMAF.cdsInvD.FieldByname('FlagOk').AsString:='N';   // Cambios
   DMAF.cdsInvD.FieldByname('NewCCos').AsString:='';
   DMAF.cdsInvD.FieldByname('NewLoc').AsString :='';
   DMAF.cdsInvD.FieldByname('NewUbic').AsString:='';
   GrabaDetalle;
end;

procedure TFRevaluacion.Z2bbtnCambioClick(Sender: TObject);
begin
   gbDatos.Enabled :=False;
end;

procedure TFRevaluacion.FormActivate(Sender: TObject);
begin
   if DMAF.wModo='A' then
   begin
      Panel1.Enabled:=True;
      InicializaDatos;
      DMAF.cdsRevaDet.Insert;
   end
   else begin
      DMAF.cdsRevaDet.Edit;
      Panel1.Enabled:=False;
      MuestraDescripcion;
   end;
end;

procedure TFRevaluacion.MuestraDescripcion;
begin
   dblcCia.text      := DMAF.cdsRevaDet.FieldByname('CIAID').AsString;
   dblcdTActivo.Text := DMAF.cdsRevaDet.FieldByname('TACFID').AsString;
   xWhere:='TACFID='+''''+dblcdTActivo.Text+'''';
   dbeTAcFDes.Text:=BuscaDescripcion( DMAF.cdsTipAct, xWhere, 'TACFDES');

   dblcdActivo.Text  := DMAF.cdsRevaDet.FieldByname('ACFID').AsString;
   dbeActivoDes.Text := DMAF.cdsRevaDet.FieldByname('ACFDES').AsString;
   dbeMarca.text     := DMAF.cdsRevaDet.FieldByname('ACFMARCA').AsString;
   dbeModelo.Text    := DMAF.cdsRevaDet.FieldByname('ACFMODELO').AsString;
   dbeSerie.Text     := DMAF.cdsRevaDet.FieldByname('ACFSERIE').AsString;

   dblcMoneda.Text   := DMAF.cdsRevaDet.FieldByname('TMONID').AsString;
   xWhere:='TMonid='+''''+dblcMoneda.Text+'''';
   edtMonedaDes.Text:=BuscaDescripcion( DMAF.cdsMoneda, xWhere, 'TMONABR');

   dbeValoMO.Text    := DMAF.cdsRevaDet.FieldByname('ACFVALOMO').AsString;
   dbeValoMN.Text    := DMAF.cdsRevaDet.FieldByname('ACFVALOMN').AsString;
   dbeValoME.Text    := DMAF.cdsRevaDet.FieldByname('ACFVALOME').AsString;
   dbeValHis.Text    := DMAF.cdsRevaDet.FieldByname('DEPVALAJUS').AsString;
   dbeDepAcu.Text    := DMAF.cdsRevaDet.FieldByname('DEPACUAJUS').AsString;
   dbeVNeto.Text     := DMAF.cdsRevaDet.FieldByname('DEPNETOAJU').AsString;
   dtpFecAdq.Date    := DMAF.cdsRevaDet.FieldByname('ACFFECADQ').AsDateTime;
   dbeImporte.Text   := DMAF.cdsRevaDet.FieldByName('RAVALIMPO').AsString;
end;


procedure TFRevaluacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

procedure TFRevaluacion.bbtnBuscaClick(Sender: TObject);
var
   xSQL : String;
begin

   if edtCiaDes.Text='' then begin
      ShowMessage('Error : Compañía no Registrada');
      Exit;
   end;

   if dbeBarras.Text<>'' then
   begin
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin

          xSQL:='SELECT ACF201.CIAID, ACF201.TACFID, ACF201.ACFID, ACF201.ACFDES, '
               + 'ACF201.ACFMARCA, ACF201.ACFMODELO, ACF201.ACFSERIE, '
               + 'ACF201.ACFFECADQ, ACF201.TMONID, ACF204.FAPERIODO, '
               + 'ACF201.ACFVALOMO, ACF201.ACFVALOMN, ACF201.ACFVALOME, '
               + 'ACF204.DEPVALAJUS, ACF204.DEPNETOAJU, ACF204.DEPACUAJUS '
               +'FROM ACF201 '
               +  'Left Join ACF204 on ( ACF201.CIAID =ACF204.CIAID AND '
               +                        'ACF201.TACFID=ACF204.TACFID AND '
               +                        'ACF201.ACFID=ACF204.ACFID AND '
               +                        'ACF201.ACFID=ACF204.ACFID AND '
               +                        'ACF201.ACFREFOR=ACF204.ACFREFOR AND '
               +                        'ACF204.DEPFLAGPRO=''X'' ), '
               +  'ACF104 '
               +'WHERE ACF201.CIAID='''    +dblcCIA.Text  +''' and '
               +      'ACF201.ARTCODBAR='''+dbeBarras.Text+''' and '
               +      'ACF104.FAPERIODO=ACF204.FAPERIODO';
      end;

       if SRV_D = 'ORACLE' then
      begin

          xSQL:='SELECT A.CIAID, A.TACFID, A.ACFID, A.ACFDES, '
               + 'A.ACFMARCA, A.ACFMODELO, A.ACFSERIE, '
               + 'A.ACFFECADQ, A.TMONID, B.FAPERIODO, '
               + 'A.ACFVALOMO, A.ACFVALOMN, A.ACFVALOME, '
               + 'B.DEPVALAJUS, B.DEPNETOAJU, B.DEPACUAJUS '
               +'FROM ACF201 A, ACF204 B, ACF104 C '
               +'WHERE                   A.CIAID =B.CIAID(+) AND '
               +                        'A.TACFID=B.TACFID(+) AND '
               +                        'A.ACFID=B.ACFID(+) AND '
               +                        'A.ACFID=B.ACFID(+) AND '
               +                        'A.ACFREFOR=B.ACFREFOR(+) AND '
               +                        'B.DEPFLAGPRO=''X''  AND  '
               +      'A.CIAID='''    +dblcCIA.Text  +''' AND '
               +      'A.ARTCODBAR='''+dbeBarras.Text+''' AND '
               +      'C.FAPERIODO=B.FAPERIODO';
      end;

      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest( xSQL );
      DMAF.cdsQry.Open;

      if DMAF.cdsQry.RecordCount>0 then begin
         MuestraDatos;
         Exit;
      end;
   end;

   if dbeBarras.Text='' then
   begin
      xSQL:='SELECT * FROM ACF201 '
           +'WHERE CIAID=''' +dblcCIA.Text     +''' and '
           +      'ACFID=''' +dblcdActivo.Text +''' and '
           +      'TACFID='''+dblcdTActivo.Text+'''' ;
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest( xSQL );
      DMAF.cdsQry.Open;

      if DMAF.cdsQry.RecordCount>0 then begin
         MuestraDatos;
         Exit;
      end;

   end;

   if DMAF.cdsQry.RecordCount=0 then begin
      ShowMessage('Error : Activo Fijo Existe. Verificar...')
   end;
end;

procedure TFRevaluacion.MuestraDatos;
begin
   dblcdTActivo.Text := DMAF.cdsQry.FieldByname('TACFID').AsString;
   xWhere:='TACFID='+''''+dblcdTActivo.Text+'''';
   dbeTAcFDes.Text:=BuscaDescripcion( DMAF.cdsTipAct, xWhere, 'TACFDES');

   dblcdActivo.Text  := DMAF.cdsQry.FieldByname('ACFID').AsString;
   dbeActivoDes.Text := DMAF.cdsQry.FieldByname('ACFDES').AsString;
   dbeMarca.text     := DMAF.cdsQry.FieldByname('ACFMARCA').AsString;
   dbeModelo.Text    := DMAF.cdsQry.FieldByname('ACFMODELO').AsString;
   dbeSerie.Text     := DMAF.cdsQry.FieldByname('ACFSERIE').AsString;

   dblcMoneda.Text   := DMAF.cdsQry.FieldByname('TMONID').AsString;
   xWhere:='TMonid='+''''+dblcMoneda.Text+'''';
   edtMonedaDes.Text:=BuscaDescripcion( DMAF.cdsMoneda, xWhere, 'TMONABR');

   dbeValoMO.Text    := DMAF.cdsQry.FieldByname('ACFVALOMO').AsString;
   dbeValoMN.Text    := DMAF.cdsQry.FieldByname('ACFVALOMN').AsString;
   dbeValoME.Text    := DMAF.cdsQry.FieldByname('ACFVALOME').AsString;
   dbeValHis.Text    := DMAF.cdsQry.FieldByname('DEPVALAJUS').AsString;
   dbeDepAcu.Text    := DMAF.cdsQry.FieldByname('DEPACUAJUS').AsString;
   dbeVNeto.Text     := DMAF.cdsQry.FieldByname('DEPNETOAJU').AsString;
   dbeImporte.Text   := DMAF.cdsQry.FieldByname('DEPNETOAJU').AsString;
   dtpFecAdq.Date    := DMAF.cdsQry.FieldByname('ACFFECADQ').AsDateTime;
end;

procedure TFRevaluacion.InicializaDatos;
begin
   dblcCia.text      := '';
   edtCiaDes.text    := '';
   dblcdTActivo.Text := '';
   dbeTAcFDes.Text   := '';
   dblcdActivo.Text  := '';
   dbeActivoDes.Text := '';
   dbeMarca.text     := '';
   dbeModelo.Text    := '';
   dbeSerie.Text     := '';
   dblcMoneda.Text   := '';
   edtMonedaDes.Text := '';
   dbeValoMO.Text    := '';
   dbeValoMN.Text    := '';
   dbeValoME.Text    := '';
   dbeValHis.Text    := '';
   dbeDepAcu.Text    := '';
   dbeVNeto.Text     := '';
   dbeImporte.Text   := '';
   dtpFecAdq.Date    := 0;
end;


procedure TFRevaluacion.dblcCiaExit(Sender: TObject);
begin
   xWhere:='CIAID='+''''+dblcCia.Text+'''';
   edtCiaDes.Text:=DMAF.DisplayDescrip( 'dspTGE','TGE101','*', xWhere, 'CiaAbr' );
end;

procedure TFRevaluacion.dblcdTActivoExit(Sender: TObject);
begin
   xWhere:='TACFID='+''''+dblcdTActivo.Text+'''';
   dbeTAcFDes.Text:=DMAF.DisplayDescrip('dspTGE','ACF101','*',xWhere,'TACFDES');
end;

procedure TFRevaluacion.dblcMonedaExit(Sender: TObject);
begin
   xWhere:='TMonid='+''''+dblcMoneda.Text+'''';
   edtMonedaDes.Text:=BuscaDescripcion( DMAF.cdsMoneda, xWhere, 'TMONABR');
end;

procedure TFRevaluacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMAF.cdsRevaDet.CancelUpdates;
end;

end.
