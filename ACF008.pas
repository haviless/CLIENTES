unit ACF008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFMantOpcion = class(TForm)
    Label1: TLabel;
    meDescriptivo: TMaskEdit;
    Label2: TLabel;
    meCondicion: TMaskEdit;
    bbtnCancela: TBitBtn;
    bbtnCambia: TBitBtn;
    Label3: TLabel;
    meGrupo: TMaskEdit;
    meObjeto: TMaskEdit;
    meForma: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure CreaAccesos;
    procedure bbtnCambiaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnCancelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMantOpcion: TFMantOpcion;
  xExiste    : Boolean;

implementation

uses ACFDM, ACF007;

{$R *.DFM}

procedure TFMantOpcion.FormCreate(Sender: TObject);
begin

   If Length(DMAF.wGrupoTmp)=0 then CreaAccesos;

   meGrupo.Text       := DMAF.wGrupoTmp;
   meDescriptivo.Text := DMAF.wObjetoDescr;
   meForma.Text       := DMAF.wObjetoForma;
   meObjeto.Text      := DMAF.wObjetoNombr;

   DMAF.cdsGrupos.RecordCount;
   DMAF.cdsGrupos.IndexFieldNames;
   DMAF.cdsMGrupo.FieldByName('GRUPOID').Value;
   DMAF.cdsGrupos.Filtered:=true;


   DMAF.cdsGrupos.Setkey;
   DMAF.cdsGrupos.FieldByName('GRUPOID').AsString  := DMAF.wGrupoTmp;
   DMAF.cdsGrupos.FieldByName('MODULOID').AsString := DMAF.wModulo;
   DMAF.cdsGrupos.FieldByName('TIPO').AsString     := Copy(DMAF.wObjetoNombr,2,1);
   DMAF.cdsGrupos.FieldByName('OBJETO').AsString   := DMAF.wObjetoNombr;
   If DMAF.cdsGrupos.Gotokey then begin
      xExiste := True;
      meCondicion.Font.Color:= clRed;
      meCondicion.Text      := 'Opcion Inactiva';
      end
   else begin
      xExiste := False;
      meCondicion.Font.Color:= clBlue;
      meCondicion.Text      := 'Opción Activa';
   end;
end;

procedure TFMantOpcion.CreaAccesos;
begin
   FMantAcceso:=TFMantAcceso.Create(Self);
   With FMantAcceso Do
   Try
      ShowModal;
   Finally
      Free;
   End;
end;

procedure TFMantOpcion.bbtnCambiaClick(Sender: TObject);
begin

   meGrupo.Text       := DMAF.wGrupoTmp;
   meDescriptivo.Text := DMAF.wObjetoDescr;
   meForma.Text       := DMAF.wObjetoForma;
   meObjeto.Text      := DMAF.wObjetoNombr;
   If xExiste then
      DMAF.cdsGrupos.Delete
   else begin
      DMAF.cdsGrupos.Insert;
      DMAF.cdsGrupos.FieldByName('GRUPOID').AsString     := DMAF.wGrupoTmp;
      DMAF.cdsGrupos.FieldByName('MODULOID').AsString    := DMAF.wModulo;
      DMAF.cdsGrupos.FieldByName('TIPO').AsString        := Copy(DMAF.wObjetoNombr,2,1);
      DMAF.cdsGrupos.FieldByName('OBJETO').AsString      := DMAF.wObjetoNombr;
      DMAF.cdsGrupos.FieldByName('FORMA').AsString       := DMAF.wObjetoForma;
      DMAF.cdsGrupos.FieldByName('DESCRIPTIVO').AsString := DMAF.wObjetoDescr;
   end;
   DMAF.cdsGrupos.ApplyUpdates( 0 );
   close;
end;

procedure TFMantOpcion.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFMantOpcion.bbtnCancelaClick(Sender: TObject);
begin
   DMAF.cdsGrupos.CancelUpdates;
   close;
end;

end.
