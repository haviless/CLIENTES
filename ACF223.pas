unit ACF223;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdblook, StdCtrls, Buttons, Wwdbdlg, Mask, wwdbedit, Grids, Wwdbigrd,
  Wwdbgrid;

type
  TFLimiteReexp = class(TForm)
    Label1: TLabel;
    dbeCia: TwwDBEdit;
    Label2: TLabel;
    dblcdTipAct: TwwDBLookupComboDlg;
    Label3: TLabel;
    dblcdActivo: TwwDBLookupComboDlg;
    BitBtOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    dbeTipact: TwwDBEdit;
    dbeActivo: TwwDBEdit;
    dblcdcia: TwwDBLookupCombo;
    wwDBGrid1: TwwDBGrid;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure dblcdciaExit(Sender: TObject);
    procedure dblcdTipActExit(Sender: TObject);
    procedure dblcdActivoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimiteReexp: TFLimiteReexp;

implementation

uses ACFDM;

{$R *.DFM}

procedure TFLimiteReexp.FormActivate(Sender: TObject);
begin
   DMAF.cdscia.Close;
   DMAF.cdscia.DataRequest('Select * from TGE101');
   DMAF.cdscia.Open;

   DMAF.cdsTipAct.Close;
   DMAF.cdsTipAct.DataRequest('Select * from ACF101');
   DMAF.cdsTipAct.Open;


   end;

procedure TFLimiteReexp.dblcdciaExit(Sender: TObject);
var
  xwhere:string;
begin
   xWhere:='CIAID='''+dblcdcia.Text+'''';
   dbecia.Text:=DMAF.DisplayDescrip('dspTGE','TGE101','CIADES',xWhere,'CIADES');

   if dbecia.Text='' then begin
      dblcdcia.SetFocus;
      ShowMessage('Error : Falta Compañía');
      Exit;
   end;


end;

procedure TFLimiteReexp.dblcdTipActExit(Sender: TObject);
var
  xwhere:string;
begin
   xWhere:='TACFID='''+dblcdTipAct.Text+'''';
   dbeTipact.Text:=DMAF.DisplayDescrip('dspTGE','ACF101','TACFDES',xWhere,'TACFDES');

   if dbeTipact.Text='' then begin
      dblcdTipAct.SetFocus;
      ShowMessage('Error : Falta Tipo de Activo');
      Exit;
   end;

   DMAF.cdsActFij.Close;
   DMAF.cdsActFij.DataRequest('Select * from ACF101 where TACFID='''+DMAF.cdsTipAct.fieldbyname('TACFID').asstring+'''');
   DMAF.cdsActFij.Open;

end;

procedure TFLimiteReexp.dblcdActivoExit(Sender: TObject);
var
  xwhere:string;
begin
   xWhere:='ACFID='''+dblcdActivo.Text+'''';
   dbeActivo.Text:=DMAF.DisplayDescrip('dspTGE','ACF201','ACFDES',xWhere,'ACFDES');

   if dbeActivo.Text='' then begin
      dblcdActivo.SetFocus;
      ShowMessage('Error : Falta Seleccionar el Activo');
      Exit;
   end;

end;

procedure TFLimiteReexp.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0 );
   end;

end;

end.
