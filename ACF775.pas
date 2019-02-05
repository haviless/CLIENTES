unit ACF775;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFToolsDepura = class(TForm)
    pnlAct: TPanel;
    Z2bbtnDetAct: TBitBtn;
    procedure Z2bbtnDetActClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolsDepura: TFToolsDepura;

implementation

uses ACFDM, ACF777;

{$R *.DFM}

procedure TFToolsDepura.Z2bbtnDetActClick(Sender: TObject);
begin
   DMAF.cdsCompras.Data:=MantCompras.FMant.cds2.Data;
   DMAF.cdsCompras.GotoCurrent(MantCompras.FMant.cds2);
   if DMAF.cdsCompras.FieldByname('ACFReg').AsString='' then begin
      if MessageDlg('¿ Esta Seguro de Depurar ? ',
         mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin

         DMAF.cdsCompras.Edit;
         DMAF.cdsCompras.FieldByname('ACFReg').AsString:='D';
         DMAF.ControlTran;
         ShowMessage('Registro Depurado');
      end;
   end
   else begin
      if DMAF.cdsCompras.FieldByname('ACFReg').AsString='S' then
         ShowMessage('Activo Ya Fue Registrado');
      if DMAF.cdsCompras.FieldByname('ACFReg').AsString='D' then
         ShowMessage('Activo Ya Fue Depurado');
   end;
end;

end.
