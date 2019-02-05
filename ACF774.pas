unit ACF774;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, wwdblook, Wwdbdlg, ExtCtrls;

type
  TFRepLegal = class(TForm)
    pnlAct: TPanel;
    Label2: TLabel;
    wMensaje4: TLabel;
    Label74: TLabel;
    Label3: TLabel;
    dblcdPeriodo: TwwDBLookupComboDlg;
    dblcTipoD: TwwDBLookupCombo;
    dbeTipo: TwwDBEdit;
    dblcCia: TwwDBLookupCombo;
    edtCiades: TEdit;
    bbtnOk: TBitBtn;
    procedure bbtnOkClick(Sender: TObject);
    procedure dblcTipoDExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTipoDEnter(Sender: TObject);
    procedure dblcdPeriodoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRepLegal: TFRepLegal;

implementation

Uses ACFDM, oaAF4000;

{$R *.DFM}

procedure TFRepLegal.bbtnOkClick(Sender: TObject);
var
   xSQL, xMes : String;
begin

   if edtCiades.Text='' then begin
      ShowMessage('Error : Falta Seleccionar Compañía');
      dblcCia.SetFocus;
      Exit;
   end;
   if dbeTipo.Text='' then begin
      dblcTipoD.SetFocus;
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   end;
   if dblcdPeriodo.Text='' then begin
      dblcdPeriodo.SetFocus;
      ShowMessage('Error : Falta Periodo');
      Exit;
   end;
   
   xSQL:='Select * from TGE181 Where MESID='''+Copy(dblcdPeriodo.text,5,2)+'''';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;

   xMes:=DMAF.cdsQry.FieldByName('MESDESL').AsString;
   xMes:='MES '+xMes+' DEL '+Copy(dblcdPeriodo.Text,1,4);

   xSQL:='SELECT A.CIAID, D.CIADES, '''+xMes+''' MESANO, A.FAPERIODO, A.ACFFECADQ, '
        +  'B.ACFSERIE, B.ACFMARCA, B.ACFMODELO, DOCID, ACFSERIEDO, ACFNODOC, '
        +  'A.CUENTAID, A.ACFID, A.ACFDES, A.TACFID, C.TACFDES, B.ARTCODBAR, '
        +  'A.DEPVALHIST, A.DEPVALAJUS, 0.00 REVALUACION, 0.00 DIFCAMBIO, 0.00 MEJORAS, 0.00 RETIROS, '
        +  'DEPACUHIST, DEPACUAJUS, ACFREIPERI, DEPNETOAJU, A.ACFDEPEST, ACFREIDEPR, DEPNETOHIS '
        +'FROM ACF204 A, ACF201 B, ACF101 C, TGE101 D '
        +'WHERE A.CIAID='''+dblcCia.Text+''' AND A.FAPERIODO='''+dblcdPeriodo.Text+''' '
        +  'AND A.DEPCOD='''+dblcTipoD.Text+''' '
        +  'AND A.CIAID=B.CIAID AND A.TACFID=B.TACFID AND A.ACFID=B.ACFID '
        +  'AND A.TACFID=C.TACFID '
        +  'AND A.CIAID=D.CIAID ';


   GReporte.UsuarioSQL.Clear;
   GReporte.UsuarioSQL.Add( xSQL );
   GReporte.NewQuery;
end;

procedure TFRepLegal.dblcTipoDExit(Sender: TObject);
var
  xWhere, wSQL : String;
begin
   if GReporte.FMant.bbtnSalir.Focused then Exit;
   if dblcCia.Focused then Exit;
   
   xWhere:='DEPCOD='''+dblcTipoD.Text+'''';
   dbeTipo.Text:=DMAF.DisplayDescrip('dspTGE','ACF104','DEPDESCRI',xWhere,'DEPDESCRI');

   if dbeTipo.Text='' then begin
      dblcTipoD.SetFocus;
      ShowMessage('Error : Falta Seleccionar Tipo de Depreciación');
      Exit;
   end;

   wSQL:='SELECT * FROM ACF102 '
        +'WHERE DEPCOD='''+dblcTipoD.Text+''' AND FAPROC=''P'' '
        +'ORDER BY FAPERIODO';
   DMAF.cdsFACTOR.Close;
   DMAF.cdsFACTOR.DataRequest(wSQL);
   DMAF.cdsFACTOR.Open;
end;

procedure TFRepLegal.dblcCiaExit(Sender: TObject);
var
  xWhere, wSQL : String;
begin

   if GReporte.FMant.bbtnSalir.Focused then Exit;

   xWhere:='CIAID='''+dblcCia.Text+'''';
   edtCiades.Text:=DMAF.DisplayDescrip('dspTGE','TGE101','CIADES',xWhere,'CIADES');

   if edtCiades.Text='' then begin
      dblcCia.SetFocus;
      ShowMessage('Error : Falta Seleccionar Compañía');
      Exit;
   end;

   wSQL:='SELECT * FROM ACF104 '
        +'WHERE CIAID='''+dblcCia.Text+''' AND DEPFLAGACT=''A''';

   DMAF.cdsUDEP.Close;
   DMAF.cdsUDEP.DataRequest(wSQL);
   DMAF.cdsUDEP.Open;

end;

procedure TFRepLegal.dblcTipoDEnter(Sender: TObject);
begin
   if dblcCia.Text='' then
      dblcCia.SetFocus;
end;

procedure TFRepLegal.dblcdPeriodoEnter(Sender: TObject);
begin
   if dblcCia.Text='' then
      dblcCia.SetFocus;

   if dblcTipoD.Text='' then
      dblcTipoD.SetFocus;
end;

end.
