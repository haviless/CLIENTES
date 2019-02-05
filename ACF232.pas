unit ACF232;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFCierreOpe = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtano: TEdit;
    cbmes: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCierreOpe: TFCierreOpe;

implementation

uses ACFDM;


{$R *.DFM}

procedure TFCierreOpe.BitBtn1Click(Sender: TObject);
var
  periodot,xsql,xano,xmes,SQL,periodo:string;

begin
  if length(edtano.text)=0 then
  begin
     edtano.SetFocus;
     Raise Exception.Create('Falta Registrar el Año');
  end;

  if length(cbmes.text)=0 then
  begin
     cbmes.SetFocus;
     Raise Exception.Create('Debe seleccionar el mes');
  end;

  SQL:='SELECT MAX(PERIODO) as PERIODO FROM ACF111';
  DMAF.cdsQry.close;
  DMAF.cdsQry.DataRequest(SQL);
  DMAF.cdsQry.open;

  xano:=edtano.text;
  xmes:=cbmes.text;

  periodo:= Concat(xano, xmes);
  periodot:=DMAF.cdsqry.fieldbyname('PERIODO').asstring;
  if periodo>periodot then
  begin
     xSQL:='SELECT * FROM ACF111';
     DMAF.cdsQry2.Close;
     DMAF.cdsQry2.DataRequest(XSQL);
     DMAF.cdsQry2.open;

     DMAF.cdsQry2.Insert;
     DMAF.cdsQry2.fieldbyname('PERIODO').asstring:=periodo;
     DMAF.cdsQry2.fieldbyname('HREG').asdatetime:=date;
     DMAF.cdsQry2.fieldbyname('FREG').asdatetime:=date;
     DMAF.cdsQry2.fieldbyname('USUARIO').asstring:=DMAF.wUsuario;
     if (DMAF.cdsQry2.ChangeCount > 0) or (DMAF.cdsQry2.Modified) then
       DMAF.AplicaDatos(DMAF.cdsQry2,'CIERREA'   );
  end
  else
  begin
     cbmes.SetFocus;
     Raise Exception.Create('Periodo ya registrado debe registrar un periodo mayor');
  end;

end;

procedure TFCierreOpe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TFCierreOpe.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

end.
