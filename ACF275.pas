unit ACF275;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, wwdbdatetimepicker, Mask, wwdbedit, wwdblook, ExtCtrls,
  Buttons;

type
  TFManteReval = class(TForm)
    pnlCab1: TPanel;
    dblcCia: TwwDBLookupCombo;
    dbeNumero: TwwDBEdit;
    dbeCiaDes: TwwDBEdit;
    pnlCab3: TPanel;
    dbeRespo: TwwDBEdit;
    dbmObser: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Z2bbtnGraba: TBitBtn;
    bbtnClose: TBitBtn;
    Label3: TLabel;
    dtpFecha: TwwDBDateTimePicker;
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbeNumeroExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    xInicio: Boolean;
    function BuscaUltReval( ssCia: String ): String;
  public
    { Public declarations }
  end;

var
  FManteReval: TFManteReval;

implementation

Uses ACFDM;

{$R *.DFM}

procedure TFManteReval.Z2bbtnGrabaClick(Sender: TObject);
begin
   DMAF.cdsReva.Edit;
   DMAF.cdsReva.FieldByname('ESTADO').Value :='Inicial';
   DMAF.cdsReva.FieldByname('USERREG').Value:=DMAF.wUsuario;
   DMAF.cdsReva.FieldByname('FECREG').Value :=Date;
   DMAF.cdsReva.FieldByname('HORREG').Value :=Time;
   cdsPost( DMAF.cdsReva );
   
   DMAF.ControlTran;  // graba regs.original/y duplicados si los hay
end;

procedure TFManteReval.FormActivate(Sender: TObject);
begin
   xInicio := True;
   
   If DMAF.wModo='A' then
   begin
      pnlCab1.Enabled:=true;
      pnlCab3.Enabled:=False;
      DMAF.cdsReva.Insert;
      dblcCia.SetFocus;
   end
   else begin
      pnlCab1.Enabled:=False;
      pnlCab3.Enabled:=True;
      DMAF.cdsReva.Edit;
      dtpFecha.SetFocus;
   end;

   xInicio:=False;
end;

procedure TFManteReval.dbeNumeroExit(Sender: TObject);
var
   xSQL : String;
begin
   if xInicio then Exit;
   if bbtnClose.Focused then Exit;

   if Length(dbeNumero.text)=0 then
      Raise Exception.Create('Error en Numero de Revaluación');
   if StrtoInt(dbeNumero.text)=0 then
      Raise Exception.Create('Error en Numero de Revaluación');

   xSQL:='Select * From ACF303 '
        +'Where CIAID=''' +dblcCia.text  +''' and '
        +      'REVALNUM='''+dbeNumero.Text+'''';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   if DMAF.cdsQry.RecordCount>0 then begin
      dbeNumero.SetFocus;
      Raise Exception.Create('Error : Numero de Revaluación Existe');
   end;

   DMAF.cdsReva.Edit;
   DMAF.cdsReva.FieldByName('ESTADO').Value  :='';
   DMAF.cdsReva.FieldByName('REVALOBSE').Value:=' ';
   DMAF.ControlTran;

   pnlCab1.Enabled:=False;
   pnlCab3.Enabled:=True;
   dtpFecha.SetFocus;
end;

procedure TFManteReval.dblcCiaExit(Sender: TObject);
var
   xCondicion : String;
begin
   if xInicio then Exit;
   if bbtnClose.Focused then Exit;

   xCondicion := 'CIAID='+''''+dblcCia.Text+'''';
   dbeCiaDes.Text:=DMAF.DisplayDescrip('dspTGE','TGE101','*',xCondicion,'CiaAbr');
   If Length(dbeCiaDes.Text)=0 then begin
      dblcCia.SetFocus;
      Raise Exception.Create('Error en Compañía');
   end;

   DMAF.cdsReva.FieldByName('RevalNum').Value:=BuscaUltReval( dblcCia.Text );
   dbeNumero.SetFocus;
end;

function TFManteReval.BuscaUltReval( ssCia: String ): String;
var
   xSQL, xWhere : string;
   nLen, xRes : Integer;
begin
   xWhere:='CIAID='''+ssCia+'''' ;
   xSQL := '';
   xSQL := 'Select max( RevalNum ) as MaxNum from ACF303';
   if length(xWhere)>0 then xSQL:=xSQL+' Where '+xWhere;
   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName:='dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);    //esta es la llamada remota al provider del servidor
   DMAF.cdsQry.Open;
   //INICIO SAR666
   //if DMAF.cdsQry.FieldByName('MaxNum').Value=null then
   if DMAF.cdsQry.FieldByName('MaxNum').IsNull then
   //FIN SAR666
      result:='0000000001'
   else
   begin
      nLen:=Length(DMAF.cdsQry.FieldByName('MaxNum').AsString);
      if nLen<=10 then begin
         xRes  :=strtoint(Trim(DMAF.cdsQry.FieldByName('MaxNum').AsString))+1;
         result:=DMAF.StrZero( xRes, nLen );
      end;
   end;
end;


procedure TFManteReval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if (DMAF.wModo='A') and (DMAF.cdsReva.FieldByName('ESTADO').AsString='') then begin
      DMAF.cdsReva.Delete;
      DMAF.ControlTran;
   end;
   DMAF.cdsReva.CancelUpdates;
end;

procedure TFManteReval.bbtnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TFManteReval.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

end.
