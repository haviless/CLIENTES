unit ACF241;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, Buttons, StdCtrls, Mask, wwdbedit,
  wwdblook, wwdbdatetimepicker, ExtCtrls;

type
  TFDesactivacionAF = class(TForm)
    dbgTraslado: TwwDBGrid;
    btnActTraslado: TwwIButton;
    bbtnOk: TBitBtn;
    bbtnRegresa: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    pnlEstado: TPanel;
    lblAcepta: TLabel;
    Label14: TLabel;
    dbdtpFecInac: TwwDBDateTimePicker;
    Label76: TLabel;
    edtCia6: TEdit;
    edtCiaD6: TEdit;
    Label1: TLabel;
    dblcMotivo: TwwDBLookupCombo;
    edtMotivo: TEdit;
    Label2: TLabel;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    Label3: TLabel;
    Label133: TLabel;
    edtResponsable6: TEdit;
    edtResponsableD6: TEdit;
    dbeDesacmo: TwwDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Panel2: TPanel;
    Label60: TLabel;
    Label91: TLabel;
    Label96: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label8: TLabel;
    Label134: TLabel;
    edtLoc6: TEdit;
    edtLocD6: TEdit;
    edtAct6: TEdit;
    edtTip6: TEdit;
    edtTipD6: TEdit;
    edtActD6: TEdit;
    edtPiso6: TEdit;
    edtArea6: TEdit;
    edtAmbiente6: TEdit;
    edtPisoD6: TEdit;
    edtAreaD6: TEdit;
    edtAmbienteD6: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    bbtnOk3: TBitBtn;
    bbtnCancela3: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDesactivacionAF: TFDesactivacionAF;

implementation

{$R *.dfm}

end.
