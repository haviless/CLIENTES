unit ACF776;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mant, db;

type
  TFToolRev = class(TForm)
    pnlAct: TPanel;
    Z2bbtnDetInv: TBitBtn;
    procedure Z2bbtnDetInvClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RevDetInsert(Sender: TObject);
    procedure RevDetEdit(Sender: TObject; MantFields: TFields);
  end;

var
  FToolRev: TFToolRev;

implementation

uses ACFDM, ACF001, ACF270;

{$R *.DFM}
//SAR666 se reemplaza la declaración DMAF por DMAF
procedure TFToolRev.Z2bbtnDetInvClick(Sender: TObject);
begin
   FRevaluacion:= TFRevaluacion.Create(Self);
//   FToolRev := TFToolRev.Create(Self);

   MantRevD := TMant.Create(Self);
// MantRevD.ControlGridDisp:= ControlGridDisp1;
   MantRevD.Admin          := DMAF.wAdmin;
   MantRevD.OnInsert       := RevDetInsert;
   MantRevD.OnEdit         := RevDetEdit;
//   MantRevD.OnCreateMant   := ToolsRev;
   MantRevD.DComC          := DMAF.DCom1;
   MantRevD.ClientDataSet  := DMAF.cdsRevaDet;
   MantRevD.TableName      := 'ACF304';
   MantRevD.Titulo         := 'Revaluación Detalle';
   MantRevD.User           := DMAF.wUsuario;
   MantRevD.SectionName    := 'ACFRevaluacionDet';
   MantRevD.FileNameIni    := '\SOLACF.INI';
   Try
     MantRevD.Execute;
   finally
     MantRevD.Free;
     FRevaluacion.Free;
//   FToolRev.Free;
   end;
end;

procedure TFToolRev.RevDetInsert(Sender: TObject);
begin
   if DMAF.cdsReva.FieldByName('Estado').AsString='Aceptado' then
      Raise Exception.Create('Revaluación Aceptada. No se Puede Modificar');

   DMAF.wModo:='A';
   DMAF.cdsRevaDet.Insert;
   FRevaluacion.ShowModal;
end;

procedure TFToolRev.RevDetEdit(Sender: TObject; MantFields: TFields);
begin
   if DMAF.cdsReva.FieldByName('Estado').AsString='Aceptado' then
      Raise Exception.Create('Revaluación Aceptada. No se Puede Modificar');

   DMAF.wModo:='M';
   DMAF.cdsRevaDet.Edit;
   FRevaluacion.ShowModal;
end;


end.

