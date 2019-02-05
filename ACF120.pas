unit ACF120;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, Buttons, Mask, wwdbedit,
  Wwdbdlg, wwdblook, db;

type
  TFSubTipo = class(TForm)
    dbgSubtipo: TwwDBGrid;
    PnlActReg: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnActReg: TwwIButton;
    dbeSTAcFDes: TwwDBEdit;
    bbtnOk: TBitBtn;
    bbtnCancela: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    dblcdCuenta: TwwDBLookupComboDlg;
    dbeSTAcFAbr: TwwDBEdit;
    dblcTipAct: TwwDBLookupCombo;
    EdtCia: TEdit;
    EdtCuenta: TEdit;
    EdtTAcFDes: TEdit;
    procedure btnActRegClick(Sender: TObject);
    procedure IniciaDatos;
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcdCuentaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcTipActExit(Sender: TObject);
    procedure dbeSTAcFIdExit(Sender: TObject);
    procedure dblcTipActChange(Sender: TObject);
    procedure dblcdCuentaExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dbeSTAcFAbrExit(Sender: TObject);
    procedure dbeSTAcFDesExit(Sender: TObject);
    procedure dbgSubtipoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSubTipo: TFSubTipo;

implementation

uses ACFDM;

{$R *.DFM}

procedure TFSubTipo.btnActRegClick(Sender: TObject);
begin
   dbgSubTipo.Enabled:=False; // deshabilita dbgrid
   pnlActReg.Visible:=true;  // habilita panel
   IniciaDatos;
end;

procedure TFSubtipo.IniciaDatos;
begin
   dblcCia.Text:='';
   dblcTipAct.Text:='';
   dbeSTAcFDes.Text:='';
   dbeSTAcFAbr.Text:='';
   dblcdCuenta.Text:='';
   dblcCia.Enabled:=True;
   dblcTipAct.Enabled:=True;
   dbeSTAcFDes.Enabled:=False;
   dbeSTAcFAbr.Enabled:=False;
   dblcdCuenta.Enabled:=False;
   dblcCia.SetFocus;

end;

procedure TFSubTipo.bbtnOkClick(Sender: TObject);
Begin
   if DM1.cdsTipAct.State = dsEdit then
   begin
      DM1.cdsSubtipoSTacFDes.Value:=dbeSTAcFDes.Text;
      DM1.cdsSubTipoSTacFAbr.Value:=dbeSTAcFAbr.Text;
      DM1.cdsSubTipoCuentaId.Value:=dblcdCuenta.Text;
      DM1.cdsSubTipo.ApplyUpdates(0);
      pnlActReg.Visible:=False;
      dbgSubTipo.Enabled:=True;
   end
   else begin
   DM1.cdsSubTipo.Insert;
   DM1.cdsSubTipoCiaId.Value:=dblcCia.Text;
   DM1.cdsSubTipoTAcFId.Value:=dblcTipAct.Text;
   DM1.cdsSubTipoSTAcFDes.Value:=dbeSTAcFDes.Text;
   DM1.cdsSubTipoSTAcFAbr.Value:=dbeSTAcFAbr.Text;
   DM1.cdsSubTipoCuentaId.Value:=dblcdCuenta.Text;
   DM1.cdsSubTipo.ApplyUpdates(0);
   IniciaDatos;
    end;
end;


procedure TFSubTipo.bbtnCancelaClick(Sender: TObject);
begin
   pnlActReg.Visible:=False;
   dbgSubTipo.Enabled:=True;
end;

procedure TFSubTipo.dblcCiaChange(Sender: TObject);
var
   xCondicion : string;
begin
   xCondicion := 'CiaId='+''''+dblcCia.Text+''''; // se arma condición (ojo apóstrofe van c/4 apóstrofes)
   edtCia.Text:=DM1.DisplayDescrip('prvTGE','TGE101','*',xCondicion,'CiaDes');

end;

procedure TFSubTipo.dblcdCuentaChange(Sender: TObject);
var
   xCondicion : string;
begin
   xCondicion := 'CuentaId='+''''+dblcdCuenta.Text+''''; // se arma condición (ojo apóstrofe van c/4 apóstrofes)
   edtCuenta.Text:=DM1.DisplayDescrip('prvTGE','TGE202','*',xCondicion,'CtaDes');

end;

procedure TFSubTipo.FormActivate(Sender: TObject);
begin

   DM1.cdsTipAct.CancelUpdates;
   DM1.cdsTipAct.IndexFieldnames:='CiaId;TACfId';
   DM1.cdsSubTipo.IndexFieldnames:='CiaId;TACfID';
end;

procedure TFSubTipo.dblcTipActExit(Sender: TObject);
begin
// busca si existe o no Tipo de Activo
   DM1.cdsTipAct.SetKey; // el cds se pone en un estado de búsqueda
   DM1.cdsTipActCiaId.Value:=dblcCia.Text;     // se asigna a campos llave
   DM1.cdsTipActTAcFId.Value:=dblcTipAct.Text;  // los valores de búsqueda
   if DM1.cdsTipAct.GotoKey then
   begin

   dbeSTAcFDes.SetFocus;
   End
   else begin
      ShowMessage('Tipo de Activo No existe');
      dblcCia.SetFocus;
   end;
end;
procedure TFSubTipo.dbeSTAcFIdExit(Sender: TObject);
begin
   If bbtnCancela.Focused then exit
   else begin
// busca si existe o no SubTipo de Activo
   DM1.cdsSubTipo.SetKey; // el cds se pone en un estado de búsqueda
   DM1.cdsSubTipoCiaId.Value:=dblcCia.Text;     // se asigna a campos llave
   DM1.cdsSubTipoTAcFId.Value:=dblcTipAct.Text;  // los valores de búsqueda
   If DM1.cdsSubTipo.GotoKey then
   begin
      ShowMessage('Sub tipo de Activo ya existe');
      dblcCia.Enabled:=True;
      dblcTipAct.Enabled:=True;
      dblcCia.SetFocus;
   end
   else begin
      dblcCia.Enabled:=False;
      dblcTipAct.Enabled:=False;
      dbeSTAcFDes.Enabled:=True;
      dbeSTAcFAbr.Enabled:=True;
      dblcdCuenta.Enabled:=True;
      dbeSTAcFDes.SetFocus;
   end;
   end;

end;

procedure TFSubTipo.dblcTipActChange(Sender: TObject);
var
   xCondicion : string;
begin
   xCondicion := 'TAcFId='+''''+dblcTipAct.Text+''''; // se arma condición (ojo apóstrofe van c/4 apóstrofes)
   edtTAcFDes.Text:=DM1.DisplayDescrip('prvACF','ACF101','*',xCondicion,'TACfDes');
end;

procedure TFSubTipo.dblcdCuentaExit(Sender: TObject);
begin
   If bbtnCancela.Focused then exit;
   If Length(edtcuenta.Text)=0 then
   begin
      ShowMessage('Cuenta no existe');
      dblcdCuenta.SetFocus;
   end;
end;

procedure TFSubTipo.dblcCiaExit(Sender: TObject);
begin
   If bbtnCancela.Focused then exit;
   If Length(edtCia.Text)=0 then
   begin
      ShowMessage('Compañia no existe');
      dblcCia.SetFocus;
   end;

end;

procedure TFSubTipo.dbeSTAcFAbrExit(Sender: TObject);
begin
   If Length(dbeSTAcFAbr.Text)=0 then
   begin
      ShowMessage('Falta Abreviatura');
      dbeSTAcFAbr.SetFocus;
   end;

end;

procedure TFSubTipo.dbeSTAcFDesExit(Sender: TObject);
begin
   If Length(dbeSTAcFDes.Text)=0 then
   begin
      ShowMessage('Falta Descripcion');
      dbeSTAcFDes.SetFocus;
   end;

end;

procedure TFSubTipo.dbgSubtipoDblClick(Sender: TObject);
begin
   dbgSubTipo.Enabled:=False;     // desactiva grid
   pnlActReg.Visible:=True;      // pone visible el panel de actualización
   dblcCia.Enabled:=False;       // desabilita variable de Compañía ==> es llave
   dblcTipAct.Enabled:=False;     // desabilita tipo de activo       ==> es llave
   dblcCia.Text:=DM1.cdsSubTipoCiaId.Value;
   dblcTipAct.Text:=DM1.cdsSubTipoTAcFId.Value;
   dbeSTAcFDes.Text:=DM1.cdsSubTipoSTacFDes.Value;   // asigna descripción a variable
   dbeSTAcFAbr.Text:=DM1.cdsSubTipoSTacFAbr.Value;   // asigna abreviatura a variable
   dblcdCuenta.Text:=DM1.cdsSubTipoCuentaId.Value; // asigna Cuenta a variable
   dbeSTAcFDes.Enabled:=True;                      // habilita varieble Descripción
   dbeSTAcFAbr.Enabled:=True;                      // habilita variable Abreviatura
   dblcdCuenta.Enabled:=True;                     // habilita variable Cuenta Contable
   DM1.cdsSubtipo.Edit;                           // pasa cdsSubTipo a modo edición
   dbeSTAcFDes.SetFocus;

end;

end.
