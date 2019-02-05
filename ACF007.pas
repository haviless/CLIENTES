unit ACF007;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, DB;

type
  TFMantAcceso = class(TForm)
    dbgUsuario: TwwDBGrid;
    dbgGrupoDet: TwwDBGrid;
    dbgGrupo: TwwDBGrid;
    Label1: TLabel;
    pnlAcceso: TPanel;
    Label2: TLabel;
    bbtnOK: TBitBtn;
    dbgGrupoIButton: TwwIButton;
    dbgUsuarioIButton: TwwIButton;
    pnlReg1: TPanel;
    pnlReg2: TPanel;
    pnlEstado1: TPanel;
    pnlEstado2: TPanel;
    bbtnOk1: TBitBtn;
    bbtnCanc1: TBitBtn;
    bbtnOk2: TBitBtn;
    bbtnCanc2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    dbeGrupo: TwwDBEdit;
    dbeGrupoDes: TwwDBEdit;
    lblUsuario: TLabel;
    dbeUsuario: TwwDBEdit;
    Label6: TLabel;
    dbeNombre: TwwDBEdit;
    dbePassw1: TwwDBEdit;
    dbePassw2: TwwDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    procedure dbgGrupoRowChanged(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
    procedure dbgGrupoIButtonClick(Sender: TObject);
    procedure bbtnOk1Click(Sender: TObject);
    procedure bbtnCanc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgGrupoDblClick(Sender: TObject);
    procedure dbgUsuarioIButtonClick(Sender: TObject);
    procedure dbgUsuarioDblClick(Sender: TObject);
    procedure bbtnOk2Click(Sender: TObject);
    procedure bbtnCanc2Click(Sender: TObject);
    procedure dbgGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMantAcceso: TFMantAcceso;

implementation

{$R *.DFM}

uses ACFDM;

procedure TFMantAcceso.dbgGrupoRowChanged(Sender: TObject);
begin
   DMAF.cdsUsuarios.Filter:='';
   DMAF.cdsUsuarios.Filter:='GrupoId='+''''+DMAF.cdsMGrupo.FieldByName('GRUPOID').AsString+'''';
   DMAF.cdsUsuarios.Filtered:=true;

   DMAF.cdsGrupos.Filter:= '';
   DMAF.cdsGrupos.Filter:= 'GrupoId='+''''+DMAF.cdsMGrupo.FieldByName('GRUPOID').AsString+''''
                        + ' and ModuloId='+''''+DMAF.wModulo+'''';
   DMAF.cdsGrupos.Filtered:=true;

end;

procedure TFMantAcceso.bbtnOKClick(Sender: TObject);
begin
   if DMAF.cdsGrupos.RecordCount=0 then
      raise exception.Create('Debe primero Asignar Grupo a Módulo');
   DMAF.wGrupoTmp := DMAF.cdsMGrupo.FieldByName('GRUPOID').AsString;
   FMantAcceso.Close;
end;

procedure TFMantAcceso.dbgGrupoIButtonClick(Sender: TObject);
begin
   dbgGrupo.Enabled := False;
   pnlReg1.Visible  := True;
   pnlReg1.SetFocus;
   pnlEstado1.Caption := 'Inserta Registro';
   DMAF.cdsMGrupo.Insert;
   dbeGrupo.Enabled := True;
   dbeGrupo.SetFocus;
end;

procedure TFMantAcceso.bbtnOk1Click(Sender: TObject);
begin
   if DMAF.cdsMGrupo.State=dsInsert then
   begin
      DMAF.cdsMGrupo.Post;
      DMAF.cdsMGrupo.ApplyUpdates( 0 );

      DMAF.cdsGrupos.Insert;
      DMAF.cdsGrupos.FieldByName('GRUPOID').AsString := DMAF.cdsMGrupo.FieldByName('GRUPOID').AsString;
      DMAF.cdsGrupos.FieldByName('MODULOID').AsString:= DMAF.wModulo;
      DMAF.cdsGrupos.FieldByName('TIPO').AsString    := '0';
      DMAF.cdsGrupos.Post;
      DMAF.cdsGrupos.ApplyUpdates( 0 );

      DMAF.cdsMGrupo.Insert;
      dbeGrupo.Enabled:= True;
      dbeGrupo.SetFocus;
   end
   else begin
      DMAF.cdsMGrupo.Post;
      DMAF.cdsMGrupo.ApplyUpdates( 0 );
      pnlReg1.Visible  := False;
      dbgGrupo.Enabled := True;
      dbgGrupo.SetFocus;
   end;
end;

procedure TFMantAcceso.bbtnCanc1Click(Sender: TObject);
begin
   DMAF.cdsMGrupo.CancelUpdates;
   pnlReg1.Visible  := False;
   dbgGrupo.Enabled := True;
   dbgGrupo.SetFocus;
end;

procedure TFMantAcceso.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFMantAcceso.dbgGrupoDblClick(Sender: TObject);
begin

   dbgGrupo.Enabled := False;
   pnlEstado1.Caption := 'Edita Registro';
   pnlReg1.Visible  := True;
   pnlReg1.SetFocus;
   DMAF.cdsMGrupo.Edit;
   dbeGrupo.Enabled := False;
   dbeGrupoDes.SetFocus;

end;

procedure TFMantAcceso.dbgUsuarioIButtonClick(Sender: TObject);
begin
   dbgUsuario.Enabled := False;
   pnlReg2.Visible  := True;
   pnlReg2.SetFocus;
   pnlEstado2.Caption := 'Inserta Registro';
   dbePassw1.Text := '';
   dbePassw2.Text := '';
   DMAF.cdsUsuarios.Insert;
   DMAF.cdsUsuarios.FieldByName('GRUPOID').AsString := DMAF.cdsMGrupo.FieldByName('GRUPOID').AsString;
   dbeUsuario.Enabled := True;
   dbeUsuario.SetFocus;
end;

procedure TFMantAcceso.dbgUsuarioDblClick(Sender: TObject);
begin
   dbgUsuario.Enabled := False;
   pnlEstado2.Caption := 'Edita Registro';
   pnlReg2.Visible  := True;
   pnlReg2.SetFocus;
   dbePassw1.Text := DMAF.DesEncripta(DMAF.cdsUsuarios.FieldByName('PASSWORD').AsString);
   dbePassw2.Text := DMAF.DesEncripta(DMAF.cdsUsuarios.FieldByName('PASSWORD').AsString);
   DMAF.cdsUsuarios.Edit;
   dbeUsuario.Enabled := False;
   dbeNombre.SetFocus;
end;

procedure TFMantAcceso.bbtnOk2Click(Sender: TObject);
begin
   if dbePassw1.Text<>dbePassw2.Text then
      Raise Exception.Create( 'Error al Confirmar Password' );

   if DMAF.cdsUsuarios.State=dsInsert then
   begin
      DMAF.cdsUsuarios.FieldByName('PASSWORD').AsString := DMAF.Encripta(dbePassw2.Text);
      DMAF.cdsUsuarios.Post;
      DMAF.cdsUsuarios.ApplyUpdates( 0 );
      DMAF.cdsUsuarios.Insert;
      dbeUsuario.Enabled:= True;
      dbeUsuario.SetFocus;
   end
   else begin
      DMAF.cdsUsuarios.Edit;
      DMAF.cdsUsuarios.FieldByName('PASSWORD').AsString := DMAF.Encripta(dbePassw2.Text);
      DMAF.cdsUsuarios.Post;
      DMAF.cdsUsuarios.ApplyUpdates( 0 );
      pnlReg2.Visible  := False;
      dbgUsuario.Enabled := True;
      dbgUsuario.SetFocus;
   end;
end;

procedure TFMantAcceso.bbtnCanc2Click(Sender: TObject);
begin
   DMAF.cdsUsuarios.CancelUpdates;
   pnlReg2.Visible  := False;
   dbgUsuario.Enabled := True;
   dbgUsuario.SetFocus;
end;

procedure TFMantAcceso.dbgGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key=VK_Delete) and (ssCtrl in Shift) then
   begin
      if MessageDlg('¿Esta Seguro de Eliminar Registro?',mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
         DMAF.cdsMGrupo.Delete;
         DMAF.cdsMGrupo.ApplyUpdates( 0 );
      end;
   end;
end;

procedure TFMantAcceso.dbgUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key=VK_Delete) and (ssCtrl in Shift) then
   begin
      if MessageDlg('¿Esta Seguro de Eliminar Registro?',mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
         DMAF.cdsUsuarios.Delete;
         DMAF.cdsUsuarios.ApplyUpdates( 0 );
      end;
   end;
end;

procedure TFMantAcceso.BitBtn1Click(Sender: TObject);
begin
   if DMAF.cdsGrupos.RecordCount=0 then
   begin
      DMAF.cdsGrupos.Insert;
      DMAF.cdsGrupos.FieldByName('GRUPOID').AsString:=DMAF.cdsMGrupo.FieldByName('GRUPOID').AsString;
      DMAF.cdsGrupos.FieldByName('MODULOID').AsString:=DMAF.wModulo;
      DMAF.cdsGrupos.FieldByName('TIPO').AsString:='0';
      DMAF.cdsGrupos.Post;
      DMAF.cdsGrupos.ApplyUpdates(0);
   end;
end;

procedure TFMantAcceso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMAF.cdsUsuarios.Filtered:=False;
end;

end.
