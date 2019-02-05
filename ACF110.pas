unit ACF110;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, wwdblook, Wwdbdlg,
  Mask, wwdbedit, db;

type
  TFTipoActivo = class(TForm)
    dbgTipAct: TwwDBGrid;
    btnActReg: TwwIButton;
    pnlActReg: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    bbtnCancela: TBitBtn;
    bbtnOk: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dblcdCuenta: TwwDBLookupComboDlg;
    edtCuenta: TEdit;
    dbeTAcFDes: TwwDBEdit;
    dbeTAcfAbr: TwwDBEdit;
    dbeTipAct: TwwDBEdit;
    SpeedButton1: TSpeedButton;
    procedure bbtnCancelaClick(Sender: TObject);
    procedure btnActRegClick(Sender: TObject);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcdCuentaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbeTipActExit(Sender: TObject);
    procedure IniciaDatos;
    procedure bbtnOkClick(Sender: TObject);
    procedure dbgTipActDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoActivo: TFTipoActivo;

implementation
uses ACFDM;
{$R *.DFM}

procedure TFTipoActivo.bbtnCancelaClick(Sender: TObject);
begin
   DM1.cdsTipAct.CancelUpdates;
   pnlActReg.Visible:=False;
   dbgTipAct.Enabled:=True;
end;

procedure TFTipoActivo.btnActRegClick(Sender: TObject);
begin
   dblcCia.Enabled:=True;
   dbeTipAcT.Enabled:=True;
   dbgTipAct.Enabled:=False; // desabilita dbgrid
   pnlActReg.Visible:=True;  // pone visible el panel de registro
   IniciaDatos;
end;

procedure TFTipoActivo.dblcCiaChange(Sender: TObject);
var
   xCondicion : string;
begin
   xCondicion := 'CiaId='+''''+dblcCia.Text+''''; // se arma condición (ojo apóstrofe van c/4 apóstrofes)
   edtCia.Text:=DM1.DisplayDescrip('prvTGE','TGE101','*',xCondicion,'CiaDes');
end;

procedure TFTipoActivo.dblcdCuentaChange(Sender: TObject);
var
   xCondicion : string;
begin
   xCondicion := 'CuentaId='+''''+dblcdCuenta.Text+''''; // se arma condición (ojo apóstrofe van c/4 apóstrofes)
   edtCuenta.Text:=DM1.DisplayDescrip('prvTGE','TGE202','*',xCondicion,'CtaDes');
end;

procedure TFTipoActivo.FormActivate(Sender: TObject);
begin
   DM1.cdsTipAct.IndexFieldNames:='CiaId;TAcFId';
end;

procedure TFTipoActivo.dbeTipActExit(Sender: TObject);
begin
// busca si existe o no Tipo de Activo
   DM1.cdsTipAct.SetKey; // el cds se pone en un estado de búsqueda
   DM1.cdsTipActCiaId.Value:=dblcCia.Text;     // se asigna a campos llave
   DM1.cdsTipActTAcFId.Value:=dbeTipAct.Text;  // los valores de búsqueda
   if DM1.cdsTipAct.GotoKey then
   begin
      ShowMessage('Tipo de Activo ya existe');
      dblcCia.SetFocus;
   end
   else begin
      dbeTAcFDes.Enabled:=True;
      dbeTAcFAbr.Enabled:=True;
      dblcdCuenta.Enabled:=True;
      dbeTAcFDes.SetFocus;
   end;
end;

procedure TFTipoActivo.IniciaDatos;
begin
   dblcCia.Text:='';
   dbeTipAct.Text:='';
   dbeTAcFDes.Text:='';
   dbeTAcFAbr.Text:='';
   dblcdCuenta.Text:='';
   dbeTAcFDes.Enabled:=False;
   dbeTAcFAbr.Enabled:=False;
   dblcdCuenta.Enabled:=False;
   dblcCia.SetFocus;
end;

procedure TFTipoActivo.bbtnOkClick(Sender: TObject);
begin
   If Length(edtCia.Text)=0 then
   begin
      Raise exception.Create('Falta codigo de compañia');
   end;
   If Length(dbeTipAct.Text)=0 then
   begin
      Raise exception.Create('Falta Tipo de Activo');
   end;
   If Length(dbeTAcFDes.Text)=0 then
   begin
      Raise exception.Create('Falta Descripcion');
   end;
   If Length(dbeTAcFAbr.Text)=0 then
   begin
      Raise exception.Create('Falta Abreviatura');
   end;
   if DM1.cdsTipAct.State = dsEdit then
   begin
      DM1.cdsTipActTacFDes.Value:=dbeTAcFDes.Text;
      DM1.cdsTipActTacFAbr.Value:=dbeTAcFAbr.Text;
      DM1.cdsTipActCuentaId.Value:=dblcdCuenta.Text;
      DM1.cdsTipAct.ApplyUpdates(0);
      pnlActReg.Visible:=False;
      dbgTipAct.Enabled:=True;
   end
   else begin
      DM1.cdsTipAct.Insert;
      DM1.cdsTipActCiaId.Value:=dblcCia.Text;
      DM1.cdsTipActTAcFId.Value:=dbeTipAct.Text;
      DM1.cdsTipActTAcFDes.Value:=dbeTAcFDes.Text;
      DM1.cdsTipActTAcFAbr.Value:=dbeTAcfAbr.Text;
      DM1.cdsTipActCuentaId.Value:=dblcdCuenta.Text;
      DM1.cdsTipAct.ApplyUpdates(0);
      IniciaDatos;
   end;
end;

procedure TFTipoActivo.dbgTipActDblClick(Sender: TObject);
begin
   dbgTipAct.Enabled:=False;     // desactiva grid
   pnlActReg.Visible:=True;      // pone visible el panel de actualización
   dblcCia.Enabled:=False;       // desabilita variable de Compañía ==> es llave
   dbeTipAcT.Enabled:=False;     // desabilita tipo de activo       ==> es llave
   dblcCia.Text:=DM1.cdsTipActCIAID.Value;        // asigna Cia a variable
   dbeTipAct.Text:=DM1.cdsTipActTACFID.Value;     // asigna Tipo de Activo a variable
   dbeTAcFDes.Text:=DM1.cdsTipActTacFDes.Value;   // asigna descripción a variable
   dbeTAcFAbr.Text:=DM1.cdsTipActTacFAbr.Value;   // asigna abreviatura a variable
   dblcdCuenta.Text:=DM1.cdsTipActCuentaId.Value; // asigna Cuenta a variable
   dbeTAcFDes.Enabled:=True;                      // habilita varieble Descripción
   dbeTAcFAbr.Enabled:=True;                      // habilita variable Abreviatura
   dblcdCuenta.Enabled:=True;                     // habilita variable Cuenta Contable
   DM1.cdsTipAct.Edit;                            // pasa cdsTipAct a modo edición
end;

end.
